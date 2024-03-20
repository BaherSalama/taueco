function Page(props) {
    return (
      <div class={props.pad}>
         {props.children}
      </div>
    );
  }
  
  export default Page  