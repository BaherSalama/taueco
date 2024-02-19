import { createSignal , Switch, Match, useTransition} from "solid-js";

import { SolidApexCharts } from 'solid-apexcharts';




function Topbar() {
  function toggle_theme(){
    document.documentElement.classList.toggle("dark")
  }
  
  return (
    <div class="left-0 top-0 fixed w-full h-14 flex justify-between items-center">
        <img src="/menu.svg"></img>
        <a class="dark:text-white text-3xl">econome</a>
        <img src="/moon.svg" onClick={toggle_theme}></img>
    </div>
  );
}

export default Topbar;
