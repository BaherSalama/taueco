function Page(props) {
	return (
		<div class={"size-full " + props.pad}>
			{props.bar}
			<div class="px-5 showbar h-full flex flex-col">{props.children}</div>
		</div>
	);
}

export default Page;
