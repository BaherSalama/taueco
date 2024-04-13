function Item2names(props) {
    return (
      <div class= "flex flex-row my-6" onClick={props.act}>
        <h6 class={"SfProBold text-gray-950 dark:text-white my-auto" + (props.center ? " text-center":"")}>{props.text}</h6>
        <div class="mx-auto"></div>
        <h6 class={"SfProBold text-gray-500 dark:text-white my-auto" + (props.center ? " text-center":"")}>{props.text}</h6>
        <img src="arrow-right-2.svg" class="w-6"></img>
      </div>
    );
  }
  
export default Item2names
