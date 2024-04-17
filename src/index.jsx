/* @refresh reload */
import { Router, Route } from "@solidjs/router";
import { render } from "solid-js/web";
import Home from "./pages/Home"
import "./output.css";
import Startup from "./pages/Startup";

render(() =>
<Router>
    <Route path="/" component={Home} />
    <Route path="/main" component={Startup} />
</Router>, 
document.getElementById("root"));
