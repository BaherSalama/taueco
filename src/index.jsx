/* @refresh reload */
import { Router, Route } from "@solidjs/router";
import { render } from "solid-js/web";
import Home from "./pages/Home"
import "./output.css";

render(() =>
<Router>
    <Route path="/" component={Home} />
</Router>, 
document.getElementById("root"));
