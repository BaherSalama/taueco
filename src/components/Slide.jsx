function Slide(props) {
  return (
    <div class="min-w-full overflow-y-auto h-full p-5">
        {props.children}
        <div class="h-1/3"></div>
    </div>
  );
}

export default Slide;
