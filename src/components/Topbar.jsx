function Topbar(a) {
  return (
    <div class={"left-1/2 top-0 absolute w-11/12 flex justify-between items-center -translate-x-1/2 " + a.cls}>
        {a.children}
    </div>
  );
}

export default Topbar;
