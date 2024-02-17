function add_code(e){
  this.style.setProperty('--underline-width', `${e.target.offsetWidth}px`)
  this.style.setProperty('--underline-offset-x', `${encodeURIComponent.target.offsetLeft}px`);
}

// function ele (a,to,name){
//   return (
//     <li class="grow" onMouseOver={(e) => add_code(e,this)} onClick={a.updateTab(to)}>
//     <a>{name}</a>
//     </li>
//   )
// }

function Ele (props){
  return (
    <li class="w-full my-auto"  onClick={props.a.updateTab(props.to)}>
    <a class="flex flex-col">
      <img src={props.svg+".svg"} class="h-10"></img>
      <p class="text-center">{props.name}</p>
    </a>
    </li>
  )
}

function bottombar(a) {
  return (
    <div class="left-0 fixed bottom-6 h-16 w-full bg-white  drop-shadow-lg rounded-3xl">
      <ul class="size-full flex row menu__list">
        <Ele a={a} to={0} name="home" svg="home"/>
        <Ele a={a} to={1} name="trans" svg="arrow-2" />
        <li class="size-full">
          <img src="add-circle.svg" class="mx-auto h-full"></img>
        </li>
        <Ele a={a} to={2} name="goals" svg="cup" />
        <Ele a={a} to={3} name="wallets" svg="wallet-3" />
      </ul>
    </div>
  );
}

export default bottombar;
