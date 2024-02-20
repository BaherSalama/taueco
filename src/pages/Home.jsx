import { createSignal, Suspense, Switch, Match, useTransition } from "solid-js";
import Topbar from "../components/Topbar";
import Graphes from "../components/Graphes"
import Transaction from "../components/Transaction"
import Bottombar from "../components/Bottombar"
import Slides from "../components/Slides";
import Slide from "../components/Slide";

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
  return (
    <div class="overflow-hidden">
      
      <Topbar></Topbar>
      <Slides tab={tab}>
        <Slide>
          <p class="dark:text-white  text-center">Current balance</p>
          <h1 class="dark:text-white  text-center">3000</h1>
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
      <Bottombar updateTab={updateTab} tab={tab}></Bottombar>
    </div>
  );
}

export default Home;
