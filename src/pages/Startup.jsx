import { createSignal, useTransition } from "solid-js";
import Page from "../components/Page";
import Sbutton from "../components/Sbutton";
import Stack from "../components/Stack";
import Topbar from "../components/Topbar";



function Startup() {
  const [tab, setTab] = createSignal(0);
  const [pending, start] = useTransition();
  const updateTab = (index) => () => start(() => setTab(index));
  // Do you have permission to send a notification?
  const sheet_set = createSignal(false);
  const [page2, page2_set] = createSignal(false);  
  const [page3, page3_set] = createSignal(false);  

  return (
    <div class="size-full">
      <Page pad={"pt-0"} >
        <img src="Group.svg" class=" mx-auto h-3/4 w-full fixed" > </img>
        <div class= "flex flex-col size-full mb-4" >
          <p class="text-center ZenDot text-5xl mt-auto">econome</p>
          <p class="text-center SfProMeduim text-gray-500 text-l mx-20 mt-4 mb-4">econome is an application designed to help, organize, and manage your 
            finances in a smart, and efficient manner.</p>
          <Sbutton text="Get Started" act={()=> page2_set(true)}/>
        </div>
      </Page>
      <Stack anim={"stack-right"} on={page2} set={page2_set}>
        <Page pad={"pt-16"} bar={
          <Topbar cls="flex-row h-16 m-auto">
            <img class="z-10" src="/arrow-left.svg" onClick={()=> page2_set(false)}></img>
            <h1 className="fixed w-full text-center m-auto SfProBold dark:text-white text-2xl">page2</h1>
          </Topbar>
        }>
          <button>what</button>
        </Page>
      </Stack>
      <Stack anim={"stack-right"} on={page2} set={page2_set}>
        <Page pad={"pt-16"} bar={
          <Topbar cls="flex-row h-16 m-auto">
            <img class="z-10" src="/arrow-left.svg" onClick={()=> page2_set(false)}></img>
            <h1 className="fixed w-full text-center m-auto SfProBold dark:text-white text-2xl">page2</h1>
          </Topbar>
        }>
          <button>what</button>
        </Page>
      </Stack>
    </div>
  );
}
  
export default Startup;
