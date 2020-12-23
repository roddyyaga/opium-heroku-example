let rec main () =
    print_endline "A worker task doing something";
    Unix.sleep 5;
    main ()

let () = main ()
