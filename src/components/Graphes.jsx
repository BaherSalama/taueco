import { For,createSignal, Suspense, Switch, Match, useTransition } from "solid-js";

import { SolidApexCharts } from 'solid-apexcharts';

function graph() {
  const [options] = createSignal({
    xaxis: {
      categories: [1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998],
      lines: {
        show: false
      },
      labels: {
        show:false
      },
    },
    yaxis:{
      labels: {
        show:false
      },
    },
    dataLabels: {
      enabled: false
    },
    grid: {
      show: false
    }
  });
  const [series] = createSignal([
    {
      data: [30, 40, 35, 50, 49, 60, 70, 100],
    },
  ]);

  const [tab, setTab] = createSignal(0);
  const [pending, start] = useTransition();
  const updateTab = (index) => () => start(() => setTab(index));
  const stuff = ["Income","Spent","Goal"];
  const days = ["M","T","W","T","F","S","S"];
  return (
    <div>
      <ul class="flex row gap-5 justify-start">
      <For each={stuff} fallback={<div>Loading...</div>}>
      {(item) => <li>{item}</li>}
      </For>
      </ul>
      <ul class="flex row justify-start gap-5">
        <li classList={{ selected: tab() === 0 }} onClick={updateTab(0)}>
          bar
        </li>
        <li classList={{ selected: tab() === 1 }} onClick={updateTab(1)}>
          line
        </li>
        <li classList={{ selected: tab() === 2 }} onClick={updateTab(2)}>
          pie
        </li>
      </ul>
      <div class="tab -mr-5 -ml-8" classList={{ pending: pending() }}>
        <Suspense fallback={<div class="loader">Loading...</div>}>
          <Switch>
            <Match when={tab() === 0}>
                <SolidApexCharts width="100%" height="300" type="area" options={options()} series={series()} />
            </Match>
            <Match when={tab() === 1}>
                <SolidApexCharts width="100%" height="300" type="line" options={options()} series={series()} />
            </Match>
            <Match when={tab() === 2}>
                <SolidApexCharts width="100%" height="300" type="donut" series={series()} />
            </Match>
          </Switch>
        </Suspense>
      </div>
      <ul class="flex row">
      <For each={days} fallback={<div>Loading...</div>}>
      {(item) => <li class="w-full text-center">{item}</li>}
      </For>
      </ul>
    </div>
  );
}

export default graph;
