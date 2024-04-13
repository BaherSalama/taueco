function Sbutton(props) {
    return (
      <a class= "h-20 w-full bg-white BarShadow rounded-full flex flec-col" onClick={props.act}>
        <p class="w-full SfProMeduim tracking-wide font-semibold text-xl text-center my-auto">{props.text}</p> 
      </a>
    );
  }
  
export default Sbutton
