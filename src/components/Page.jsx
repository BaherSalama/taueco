function Page(props) {
    return (
      <div class={"size-full " + props.pad}>
        <div class="px-5 overflow-y-auto h-full">
         {props.children}
        </div>
      </div>
    );
  }
  
  export default Page  