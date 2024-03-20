function Topbar(a) {
  function toggle_theme(){
    document.documentElement.classList.toggle("dark")
  }
  
  return (
    <div class="left-1/2 top-0 fixed w-11/12 h-14 flex justify-between items-center -translate-x-1/2">
        <img src="/menu.svg" onClick={() => a.stack_set(true)}></img>
        <a class="ZenDot dark:text-white text-2xl">econome</a>
        <img src="/moon.svg" onClick={toggle_theme}></img>
    </div>
  );
}

export default Topbar;
