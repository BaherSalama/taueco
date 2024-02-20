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
    },
    chartOptions: {
      labels: ['Apple', 'Mango', 'Orange', 'Watermelon']
    }
  });
  const [series] = createSignal([
    {
      data: [30, 40, 35, 50, 49, 60, 70, 100],
    },
  ]);
  const [series3] = createSignal([
    {
      data: [30, 70],
    },
  ]);
  const [options2] = createSignal({
    series: [70,30],
    labels: ['Income', 'spent'],
    dataLabels: {
      enabled: true,
      formatter: function (val) {
        return val + "%"
      },
    },
    legend: {
      show: true,
      position: 'top',
    },
    plotOptions: {
      pie: {
        donut: {
          labels: {
            show: true,
            name: {
              show:true,
            },
            value: {
              show:true,
              formatter: function (val){
                return val + "$"
              }
            },
            total:{
              show:true,
              label:"total",
              color:"red"
            }
          }
        }
      }
    }
  });
  const [tab, setTab] = createSignal(0);
  const [pending, start] = useTransition();
  const updateTab = (index) => () => start(() => setTab(index));
  const stuff = ["Tansactions","Goals"];
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
          Pi
        </li>
        <li classList={{ selected: tab() === 1 }} onClick={updateTab(1)}>
          line
        </li>
      </ul>
      <div class="tab  -ml-9" classList={{ pending: pending() }}>
        <Suspense fallback={<div class="loader">Loading...</div>}>
          <Switch>
            <Match when={tab() === 0}>
                <SolidApexCharts width="106%" height="300" type="donut"  options={options2()} />
            </Match>
            <Match when={tab() === 1}>
                <SolidApexCharts width="106%" height="300" type="area" options={options()} series={series()} />
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
