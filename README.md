# lean-webapp

A minimal Lean 4 web application, demonstrating
[lean-html](https://github.com/paulbutcher/lean-html) for typed HTML
generation and [lean-routing](https://github.com/paulbutcher/lean-routing)
for typed HTTP routing, served over `Std.Http`.

## Structure

Everything lives in [`Main.lean`](Main.lean): the route table (`routeTable!`),
the page templates (built with `lean-html`, linked together via
`App.links`), the route-to-handler wiring (`toHandler`), and the server
startup.

## Running

```sh
lake exe lean-webapp
```

Then visit <http://127.0.0.1:8080>.
