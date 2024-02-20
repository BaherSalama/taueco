import { createSignal , Switch, Match, useTransition} from "solid-js";

import { SolidApexCharts } from 'solid-apexcharts';




function Topbar() {
  function toggle_theme(){
    document.documentElement.classList.toggle("dark")
  }
  
  return (
    <div class="left-1/2 top-0 fixed w-11/12 h-14 flex justify-between items-center -translate-x-1/2">
        <img src="/menu.svg"></img>
        <a class="dark:text-white text-3xl">econome</a>
        <img src="/moon.svg" onClick={toggle_theme}></img>
    </div>
  );
}

export default Topbar;
