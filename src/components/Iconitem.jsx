function Iconitem(props) {
	return (
		<div class="flex flex-row my-6" onClick={props.act}>
			<img src={props.icon} class="w-6 mr-3"></img>
			<h6
				class={
					"w-full SfProBold text-gray-500 dark:text-white my-auto" +
					(props.center ? " text-center" : "")
				}
			>
				{props.text}
			</h6>
		</div>
	);
}

export default Iconitem;
