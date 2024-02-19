import { For,createSignal , Switch, Match, useTransition} from "solid-js";

import { SolidApexCharts } from 'solid-apexcharts';
const Direction = {
  a: "text-green-600",
  b: 'Down',
  Left: 'Left',
  Right: 'Right'
};

/*
const Transaction = (p) => {

  return (
    <div class="ml-10 mr-5 mt-2 flex flex-row justify-between items-center">
        <p>{p.a}</p>
        <p class="text-green-600" >{p.b}</p>
    </div>
  );
}
*/


function colorthem(a){
  let sad;
  let mat;
  let amount = a.amount
  let is_goal = a.is_goal
  if (amount > 0 && !is_goal){
    sad = "+ " + amount +" $";
    mat = "text-green-600"
  }else if (amount < 0 && !is_goal){
    sad = "- "+ -amount +" $";
    mat = "text-red-600"
  }else{
    sad = amount +" %";
    mat = "text-blue-600"
  }
  return <p class={mat} >{sad}</p>
}


function Transaction(p) {

  return (
    <div>
    <h1>{p.a}</h1>
    <For each={p.b[p.a]} fallback={<div>Loading...</div>}>
    {(item) => 
      <div class="ml-5 mt-2 flex flex-row justify-between items-center">
        <p>{item.name}</p>
        {colorthem(item)}
      </div>
    }
    </For>
    </div>
  );
}

export default Transaction;
