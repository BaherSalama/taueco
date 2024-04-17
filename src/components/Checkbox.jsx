import { createSignal} from "solid-js";

const useCheckbox = (props) => {
    const [isChecked, setIsChecked] = createSignal(props.checked || false);
  
    const handleChange = (event) => {
      setIsChecked(event.target.checked);
      if (props.onChange) {
        props.onChange(event.target.checked);
      }
    };
  
    const checked = createMemo(() => isChecked()); // Memoize checked value
  
    return { checked, handleChange };
  };
  
  const Checkbox = (props) => {
    const { checked, handleChange } = useCheckbox(props);
  
    return (
      <label for={props.id}>
        <input
          type="checkbox"
          id={props.id}
          checked={checked}
          onChange={handleChange}
        />
        {props.label}
      </label>
    );
  };
  
  export default Checkbox;