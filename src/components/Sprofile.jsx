function Sprofile(props) {
	return (
		<div class="flex flex-row size-full">
			<img src="/user-edit.svg" class="w-9 mr-3"></img>
			<div class="flex flex-col justify-center">
				<h6 class="SfProBold text-gray-500 dark:text-white">Hi</h6>
				<h1 class="SfProBold dark:text-white text-3xl">{props.username}</h1>
			</div>
		</div>
	);
}

export default Sprofile;
