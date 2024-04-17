import { Transition } from "solid-transition-group"

function BottomSheet(props) {
  return (
    <Transition name="bottom-sheet">
    <Show when={props.on()}>
    <div class="left-1/2 fixed bottom-6 w-11/12 bg-white drop-shadow-lg rounded-2xl -translate-x-1/2 z-30 h-fit" style={{minHeight:"100rem"}} >
        {props.children}
    </div>
    </Show>
    </Transition>
  );
}
  
  export default BottomSheet;
