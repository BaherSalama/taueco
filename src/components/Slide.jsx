function Slide(props) {
	return (
		<div class="slide">
			{props.children}
			<div class="h-1/3"></div>
		</div>
	);
}

export default Slide;
