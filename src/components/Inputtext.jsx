import { Show, createSignal, useTransition } from "solid-js";
function Inputtext(props) {
  const [vis,setvis] = createSignal(false)
  return (
    <div class= "flex flex-col my-3 w-full" onClick={props.act}>
      <Show when={props.text!=null}>
        <h6 class={"SfProBold text-gray-950 dark:text-white h-8 w-fit ml-2"}>{props.text}</h6>
      </Show>
      <div class="relative">
      <input placeholder={props.hint} type={props.isemail ? "email": props.ispass ? vis() ? "text": "password" : "text"} class="border-2 h-8 rounded-2xl  w-full p-5 active:border-purple-50" onChange={(e)=>{console.log(e)}}/>
      <Show when={props.ispass}>
      <span class="absolute right-0 top-1/2 -translate-x-1/2 -translate-y-1/2" onClick={()=>setvis(!vis())}>
        <img src={vis() ? "eye.svg" : "success.svg" } class="w-6 animate-bounce"></img>
      </span>
      </Show>
      </div>
    </div>
  );
  }
  
export default Inputtext
