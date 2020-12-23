let rec main () =
    print_endline "Stdout!!!";
    prerr_endline "Stderr!!!";
    Unix.sleep 5;
    main ()

let () = main ()
