import { Transition } from "solid-transition-group";

function Stack(props) {
	const sad = [];
	function mad() {
		sad.push(props.set);
		console.log(sad);
	}
	function killme() {
		const a = sad.pop();
		console.log(a(false));
	}
	return (
		<Transition name={props.anim} onBeforeEnter={mad} onAfterExit={killme}>
			<Show when={props.on()}>
				<div class="left-0 top-0 fixed size-full bg-white z-10">
					{props.children}
				</div>
			</Show>
		</Transition>
	);
}

export default Stack;
