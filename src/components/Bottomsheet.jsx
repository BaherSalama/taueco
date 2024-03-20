import { Transition } from "solid-transition-group"

function BottomSheet(props) {
    return (
      <Transition name="bottom-sheet">
      <Show when={props.on()}>
      <div class="left-1/2 fixed bottom-6 h-96 w-11/12 bg-white drop-shadow-lg rounded-2xl -translate-x-1/2 z-10">
          <div class="w-10 h-4 absolute bg-black" onClick={() => {props.sad(false);console.log(props)}}></div>
          {props.children}
      </div>
      </Show>
      </Transition>
);
  }
  
  export default BottomSheet;
