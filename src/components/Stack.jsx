import { Transition } from "solid-transition-group"

function Stack(props) {
    return (
      <Transition name={props.anim}>
      <Show when={props.on()}>
      <div class="left-0 top-0 fixed size-full bg-white z-10">
          <div class="w-10 h-4 absolute bg-black" onClick={() => {props.sad(false);console.log(props)}}></div>
          {props.children}
      </div>
      </Show>
      </Transition>
);
  }
  
  export default Stack;

