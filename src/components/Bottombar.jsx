import { createSelector } from "solid-js";


function add_code(e){
  this.style.setProperty('--underline-width', `${e.target.offsetWidth}px`)
  this.style.setProperty('--underline-offset-x', `${encodeURIComponent.target.offsetLeft}px`);
}


function Ele (props){
  return (
    <li class="w-full my-auto"  classList={{ pageon: props.tab() === props.to }} onClick={props.a.updateTab(props.to)}>
    <a class="flex flex-col">
      <img src={props.svg+".svg"} class="h-8"></img>
      <p class="text-center text-xs">{props.name}</p>
    </a>
    </li>
  )
}

function bottombar(a) {
  return (
    <div class="left-1/2 fixed bottom-6 h-20 w-11/12 bg-white  drop-shadow-lg rounded-3xl -translate-x-1/2">
      <ul class="size-full flex row menu__list">
        <Ele a={a} to={0} name="home" svg="home" tab={a.tab}/>
        <Ele a={a} to={1} name="trans" svg="arrow-2" tab={a.tab} />
        <li class="size-full">
          <img src="add-circle.svg" class="mx-auto h-full " > </img>
        </li>
        <Ele a={a} to={2} name="goals" svg="cup" tab={a.tab}/>
        <Ele a={a} to={3} name="wallets" svg="wallet-3" tab={a.tab}/>
      </ul>
    </div>
  );
}

export default bottombar;
