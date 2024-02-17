import { createSignal, Suspense, Switch, Match, useTransition } from "solid-js";
import Topbar from "../components/Topbar";
import Graphes from "../components/Graphes"
import Transaction from "../components/Transaction"
import Bottombar from "../components/Bottombar"
function Home() {
  const [tab, setTab] = createSignal(0);
  const [pending, start] = useTransition();
  const updateTab = (index) => () => start(() => setTab(index));
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
        amount:-100,
        is_goal:false
      }
    ]
  }
  return (
    <div class="mx-5">
      <Topbar></Topbar>
      <div class="tab" classList={{ pending: pending() }}>
        <Suspense fallback={<div class="loader">Loading...</div>}>
          <Switch>
            <Match when={tab() === 0}>
              <p class="text-center">Current balance</p>
              <h1 class="text-center">3000</h1>
              <Graphes/>
              <Transaction a="income" b={sad}></Transaction>
            </Match>
            <Match when={tab() === 1}>
            </Match>
            <Match when={tab() === 2}>
            </Match>
          </Switch>
        </Suspense>
      </div>
      <Bottombar updateTab={updateTab}></Bottombar>
    </div>
  );
}

export default Home;
