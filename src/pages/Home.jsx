import { createSignal, useTransition } from "solid-js";
import Topbar from "../components/Topbar";
import Graphes from "../components/Graphes"
import Transaction from "../components/Transaction"
import Bottombar from "../components/Bottombar"
import Slides from "../components/Slides";
import Slide from "../components/Slide";
import BottomSheet from "../components/Bottomsheet";
import Stack from "../components/Stack";
import Page from "../components/Page";
import Sprofile from "../components/Sprofile";
import Iconitem from "../components/Iconitem";
import {
  isPermissionGranted,
  requestPermission,
  sendNotification,
} from '@tauri-apps/plugin-notification';

async function notify(){
  let permissionGranted = await isPermissionGranted();

  // If not we need to request it
  if (!permissionGranted) {
    const permission = await requestPermission();
    console.log(permission)
    permissionGranted = permission === 'granted';
  }

  // Once permission has been granted we can send the notification
  if (permissionGranted) {
    sendNotification({ title: 'Tauri', body: 'Tauri is awesome!' });
  }
}
function Home() {
  const [tab, setTab] = createSignal(0);
  const [pending, start] = useTransition();
  const updateTab = (index) => () => start(() => setTab(index));
  // Do you have permission to send a notification?
  
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
  const [setting, settings_set] = createSignal(false);
  const [about, about_set] = createSignal(false);  
  const [privacy, privacy_set] = createSignal(false);  
  const [terms, terms_set] = createSignal(false);  
  const [exo, exo_set] = createSignal(false);  

  function toggle_theme(){
    document.documentElement.classList.toggle("dark")
  }

  return (
    <div class="overflow-hidden">
      <Show when={sheeton() || exo()}>
      <div class="size-full bg-stone-800 bg-opacity-40 absolute z-20" onClick={()=> {sheet_set(false); exo_set(false)}}></div>
      </Show>
      <Topbar cls="h-14 m-auto">
        <img src="/menu.svg" onClick={() => settings_set(true)}></img>
        <a class="ZenDot dark:text-white text-2xl">econome</a>
        <img src="/moon.svg" onClick={toggle_theme}></img>
      </Topbar>
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
      <BottomSheet on={sheeton} sad={sheet_set}>
        <Page pad={"py-10 px-5"}>
          <Topbar cls="flex-row-reverse h-10">
            <img src="/close-circle.svg" onClick={()=> sheet_set(false)}></img>
          </Topbar>
          <h1>sad</h1>
        </Page>
      </BottomSheet>
      {/*settings*/}
      <Stack anim={"stack-left"} on={setting} set={settings_set}>
        <Page pad={"pt-20"} bar={
          <Topbar cls="flex-row h-20 m-auto">
            <Sprofile></Sprofile>
            <img src="/close-circle.svg" onClick={()=> settings_set(false)}></img>
          </Topbar>
        }>
        <Iconitem icon="/user-edit.svg" text="About" act={()=> about_set(true)}></Iconitem>
        <Iconitem icon="/unlock.svg" text="Privacy Policy" act={()=> privacy_set(true)}></Iconitem>
        <Iconitem icon="/note.svg" text="Terms & Conditions" center={0} act={()=> terms_set(true)}></Iconitem>
        <Iconitem icon="/printer.svg" text="Export statistics" act={()=> exo_set(true)}></Iconitem>
        <Iconitem icon="/close-circle.svg" text="About" act={()=> about_set(true)}></Iconitem>
        </Page>
      </Stack>
      {/*about*/}
      <Stack anim={"stack-right"} on={about} set={about_set}>
        <Page pad={"pt-20"} bar={
          <Topbar cls="flex-row h-20 m-auto">
            <h1 className="text-center m-auto SfProBold dark:text-white text-3xl">about</h1>
            <img src="/close-circle.svg" onClick={()=> about_set(false)}></img>
          </Topbar>
        }>
          <button>About</button>
        </Page>
      </Stack>
      {/*privacy*/}
      <Stack anim={"stack-right"} on={privacy} set={privacy_set}>
        <Page pad={"pt-20"} bar={
          <Topbar cls="flex-row h-20 m-auto">
            <h1 className="text-center m-auto SfProBold dark:text-white text-3xl">privacy</h1>
            <img src="/close-circle.svg" onClick={()=> privacy_set(false)}></img>
          </Topbar>
        }>
          <button>About</button>
        </Page>
      </Stack>
      {/*terms*/}
      <Stack anim={"stack-right"} on={terms} set={terms_set}>
        <Page pad={"pt-20"} bar={
          <Topbar cls="flex-row h-20 m-auto">
            <h1 className="text-center m-auto SfProBold dark:text-white text-3xl">terms</h1>
            <img src="/close-circle.svg" onClick={()=> terms_set(false)}></img>
          </Topbar>
        }>
          <button>About</button>
        </Page>
      </Stack>
      <BottomSheet on={exo} sad={exo_set}>
        <Page pad={"py-10 px-5"}>
          <Topbar cls="flex-row-reverse h-10">
            <img src="/close-circle.svg" onClick={()=> exo_set(false)}></img>
          </Topbar>
          <h1>sad</h1>
        </Page>
      </BottomSheet>
    </div>
  );
}

export default Home;
