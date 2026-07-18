import Std.Http
import Html
import Routing

open Std Async
open Std Http Server
open Html
open Routing

routeTable! App
  [ index := "/",
    greet := "/greet/:name:String" ]

def homePage :=
  document [
    head [ title "Lean Webapp" ],
    body [
      h1 [ "Welcome to lean-webapp" ],
      p [ "A minimal example webapp in Lean." ],
      p [ a { href := App.links.greet "world" } [ "Say hello" ] ],
    ]
  ]

def greetPage (name : String) :=
  document [
    head [ title s!"Hello, {name}!" ],
    body [
      h1 [ s!"Hello, {name}!" ],
      p [ a { href := App.links.index } [ "Back home" ] ],
    ]
  ]

def app :=
  [ .get App.patterns.index (fun _request => Response.ok.html homePage),
    .get App.patterns.greet (fun name _request => Response.ok.html (greetPage name)) ]
  |> toHandler

def main := Async.block do
  let addr : Net.SocketAddress := .v4 ⟨.ofParts 127 0 0 1, 8080⟩
  let server ← Server.serve addr app
  IO.println s!"Listening on http://{addr}"
  server.waitShutdown
