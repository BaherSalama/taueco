function add_code(e){
  this.style.setProperty('--underline-width', `${e.target.offsetWidth}px`)
  this.style.setProperty('--underline-offset-x', `${encodeURIComponent.target.offsetLeft}px`);
}


function Ele (props){
  return (
    <li class="w-full my-auto"  classList={{ pageon: props.tab() === props.to }} onClick={props.a.updateTab(props.to)}>
    <a class="flex flex-col">
      <span class="relative left-2/3 flex h-3 w-3">
        <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-purple-500 opacity-75"></span>
        <span class="relative inline-flex rounded-full h-3 w-3 bg-purple-900"></span>
      </span>
      <img src={props.svg+".svg"} class="h-8"></img>
      <p class="SfProMeduim text-gray-500 text-center text-xs">{props.name}</p>
    </a>
    </li>
  )
}

function bottombar(a) {
  return (
    <div class="left-1/2 fixed bottom-6 h-20 w-full bg-white BarShadow rounded-full -translate-x-1/2 px-5">
      <ul class="size-full flex row menu__list mx">
        <Ele a={a} to={0} name="Home" svg="home" tab={a.tab}/>
        <Ele a={a} to={1} name="Transaction" svg="arrow-2" tab={a.tab} />
        <li class="size-5/6 m-auto" onClick={()=> a.seton(true)}>
          <img src="add-circle.svg" class="mx-auto h-full " > </img>
        </li>
        <Ele a={a} to={2} name="Goals" svg="cup" tab={a.tab}/>
        <Ele a={a} to={3} name="Wallets" svg="wallet-3" tab={a.tab}/>
      </ul>
    </div>
  );
}

export default bottombar;
