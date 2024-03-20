import { createSignal, Suspense, Switch, Match, useTransition } from "solid-js";
import Topbar from "../components/Topbar";
import Graphes from "../components/Graphes"
import Transaction from "../components/Transaction"
import Bottombar from "../components/Bottombar"
import Slides from "../components/Slides";
import Slide from "../components/Slide";
import BottomSheet from "../components/Bottomsheet";
import Stack from "../components/Stack";


function Home() {
  const [tab, setTab] = createSignal(0);
  const [pending, start] = useTransition();
  const updateTab = (index) => () => start(() => setTab(index));
  const [settings, setSettings] = createSignal(false);
  let sad = {
    "income":[
      {
        name: "job",
        amount:100,
        is_goal:false
      },
      {
        name: "job",
        amount:100,
        is_goal:true
      },
      {
        name: "job",
        amount:100,
        is_goal:true
      },
      {
        name: "job",
        amount:100,
        is_goal:true
      },
      {
        name: "job",
        amount:100,
        is_goal:true
      },
      {
        name: "job",
        amount:100,
        is_goal:true
      },
      {
        name: "job",
        amount:100,
        is_goal:true
      },
      {
        name: "job",
        amount:100,
        is_goal:true
      },
      {
        name: "job",
        amount:100,
        is_goal:true
      },
      {
        name: "job",
        amount:100,
        is_goal:true
      },
      {
        name: "job",
        amount:100,
        is_goal:true
      },
      {
        name: "job",
        amount:100,
        is_goal:true
      },
      {
        name: "job",
        amount:100,
        is_goal:true
      },
      {
        name: "job",
        amount:100,
        is_goal:true
      },
      {
        name: "job",
        amount:100,
        is_goal:true
      },
      {
        name: "job",
        amount:100,
        is_goal:true
      },
      {
        name: "job",
        amount:100,
        is_goal:true
      },
      {
        name: "job",
        amount:100,
        is_goal:true
      },
      {
        name: "job",
        amount:100,
        is_goal:true
      },
      {
        name: "job",
        amount:100,
        is_goal:true
      },
      {
        name: "job",
        amount:100,
        is_goal:true
      },
      {
        name: "job",
        amount:100,
        is_goal:true
      },
      {
        name: "job",
        amount:-100,
        is_goal:false
      }
    ]
  }
  const [sheeton, sheet_set] = createSignal(false);
  const [stackon, stack_set] = createSignal(false);
  return (
    <div class="overflow-hidden">
      <Show when={sheeton()}>
      <div class="size-full bg-stone-800 bg-opacity-40 absolute z-10" onClick={()=> sheet_set(false)}></div>
      </Show>
      <Topbar stack_set={stack_set}></Topbar>
      <Slides tab={tab}>
        <Slide>
          <p class="SfProBold text-gray-500 dark:text-white text-center text-base">Current Balance</p>
          <h1 class="SfProBold dark:text-white text-center text-5xl py-5"><span class="text-xl">$</span>3,745.40</h1>          
          <Graphes/>
          <Transaction a="income" b={sad}></Transaction>
        </Slide>
        <Slide>
          <Transaction a="income" b={sad}></Transaction>
        </Slide>
        <Slide>
          <Transaction a="income" b={sad}></Transaction>
        </Slide>
        <Slide>
          <Transaction a="income" b={sad}></Transaction>
        </Slide>
      </Slides>
      <Bottombar updateTab={updateTab} seton={sheet_set} tab={tab}></Bottombar>
      <BottomSheet on={sheeton} sad={sheet_set} ></BottomSheet>
      <Stack anim={"stack-left"} on={stackon} sad={stack_set} ></Stack>
    </div>
  );
}

export default Home;
