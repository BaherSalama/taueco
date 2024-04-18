import { Transition } from "solid-transition-group";

function Selectable(props) {
	return (
		<div class="flex flex-row my-6" onClick={props.act}>
			<h6
				class={
					"SfProBold text-gray-950 dark:text-white my-auto" +
					(props.center ? " text-center" : "")
				}
			>
				{props.text}
			</h6>
			<div class="mx-auto"></div>
			<Transition name="sad">
				<Show when={props.on == props.is}>
					<img src="success.svg" class="w-6 animate-bounce"></img>
				</Show>
			</Transition>
		</div>
	);
}

export default Selectable;
