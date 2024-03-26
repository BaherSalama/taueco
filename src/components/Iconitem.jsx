function Iconitem(props) {
    return (
      <div class= "flex flex-row" onClick={props.act}>
        <img src={props.icon} class="w-9 mr-3"></img>
        <h6 class="SfProBold text-gray-500 dark:text-white my-auto">{props.text}</h6>
      </div>
    );
  }
  
  export default Iconitem