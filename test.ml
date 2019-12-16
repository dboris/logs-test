open Js_of_ocaml
open Js_of_ocaml_lwt

let on_btn_click _ _ =
    Logs_lwt.debug (fun m -> m "Clicked")

let main _ =
    let btn =
        Js.Opt.get
            (Dom_html.document##getElementById (Js.string "btn"))
            (fun () -> assert false)
    in
    Lwt_js_events.(async (fun () -> clicks btn on_btn_click));
    Js._false


let () =
    Logs.set_reporter (Logs_browser.console_reporter ());
    Logs.set_level (Some Logs.Debug);
    Dom_html.window##.onload := Dom_html.handler main
