import { Surreal } from 'surrealdb.js';
import { createResource, createSignal, useTransition } from "solid-js";
import { render } from "solid-js/web";
import Home from "./pages/Home";
import "./output.css";
import Startup from "./pages/Startup";


// Speed up calls to hasOwnProperty
var hasOwnProperty = Object.prototype.hasOwnProperty;

function isEmpty(obj) {

    // null and undefined are "empty"
    if (obj == null) return true;

    // Assume if it has a length property with a non-zero value
    // that that property is correct.
    if (obj.length > 0)    return false;
    if (obj.length === 0)  return true;

    // If it isn't an object at this point
    // it is empty, but it can't be anything *but* empty
    // Is it empty?  Depends on your application.
    if (typeof obj !== "object") return true;

    // Otherwise, does it have any properties of its own?
    // Note that this doesn't handle
    // toString and valueOf enumeration bugs in IE < 9
    for (var key in obj) {
        if (hasOwnProperty.call(obj, key)) return false;
    }

    return true;
}


const [user,setuser] = createSignal({});

const db = new Surreal();
async function start() {
	try {
		await db.connect('ws://127.0.0.1:8000/rpc', {

			namespace: 'test',
			database: 'test',
			auth: {
				username: 'root',
				password: 'root',
			},
		});
		console.log("sad")
	} catch (e) {
		console.error('ERROR', e);
	}
}
start()


render(
	() => (
		<Switch>
      <Match when={isEmpty(user())}>
				<Startup user={user} setuser={setuser} db={db}/>
      </Match>
      <Match when={!isEmpty(user())}>
				<Home user={user} setuser={setuser} db={db}/>
      </Match>
		</Switch>
	),
	document.getElementById("root"),
);
