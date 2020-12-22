open Opium

let handler req =
  Printf.sprintf "Hello, %s!5\n" (Router.param req "name")
  |> Response.of_plain_text |> Lwt.return

let port =
  Sys.getenv_opt "PORT" |> Option.value ~default:"3000" |> int_of_string

let () =
  Logs.set_reporter (Logs_fmt.reporter ());
  Logs.set_level (Some Logs.Info)

let () =
  App.empty |> App.port port
  |> App.middleware Middleware.logger
  |> App.get "/hello/:name" handler
  |> App.run_command
