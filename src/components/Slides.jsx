import { createSignal, Suspense, Switch, Match, useTransition } from "solid-js";







function Slides(props) {
  return (
    <div class="mt-14 overflow-hidden">
        <div class="flex flex-row transition-transform"  style={{transform:`translateX(${props.tab()*-100}%)`}} >
        {props.children}
        <div>{props.tab}</div>
        </div>
    </div>
  );
}

export default Slides;
