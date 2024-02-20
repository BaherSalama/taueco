function Setting(props) {
    return (
      <div class="pt-14">
          <div class="flex flex-row transition-transform h-screen"  style={{transform:`translateX(${props.tab()*-100}%)`}} >
          {props.children}
          </div>
      </div>
    );
  }
  
  export default Setting;
  