import { createSignal, useTransition } from "solid-js";
import Page from "../components/Page";
import Sbutton from "../components/Sbutton";
import Stack from "../components/Stack";
import Topbar from "../components/Topbar";
import Pushv from "../components/Pushv";


function Startup() {
  const [tab, setTab] = createSignal(0);
  const [pending, start] = useTransition();
  const updateTab = (index) => () => start(() => setTab(index));
  const sheet_set = createSignal(false);
  const [login, login_set] = createSignal(false);  
  const [signup, signup_set] = createSignal(false);  
  const [verification , verification_set] = createSignal(false);
  const [enter_verification_code , enter_verification_code_set] = createSignal(false);
  const [forget_password, forget_password_set] = createSignal(false);
  const [reset_password, reset_password_set] = createSignal(false);
  const [conf_msg_of_fpassword, conf_msg_of_fpassword_set] = createSignal(false);
  const [enter_pin, enter_pin_set] = createSignal(false);  
  const [re_type_pin, re_type_pin_set] = createSignal(false);  
  const [setup_account, setup_account_set] = createSignal(false);  
  const [setup_account_data, setup_account_data_set] = createSignal(false);  
  const [setup_confirmation, setup_confirmation_set] = createSignal(false);  


  return (
    <div class="size-full">
      <Page pad={"pt-0"} >
        <img src="Group.svg" class=" mx-auto h-3/4 w-full fixed" > </img>
        <div class= "flex flex-col size-full mb-4" >
          <p class="text-center ZenDot text-5xl mt-auto">econome</p>
          <p class="text-center SfProMeduim text-gray-500 text-l mx-20 mt-4 mb-4">econome is an application designed to help, organize, and manage your 
            finances in a smart, and efficient manner.</p>
          <Sbutton text="Get Started" act={()=> login_set(true)}/>
        </div>
      </Page>
      {/* 1 */}
      <Stack anim={"stack-right"} on={login} set={login_set}>
        <Page pad={"pt-16"} bar={
          <Topbar cls="flex-row h-16 m-auto">
            <img class="z-10" src="/arrow-left.svg" onClick={()=> login_set(false)}></img>
            <h1 className="fixed w-full text-center m-auto SfProBold dark:text-white text-2xl">login</h1>
          </Topbar>
        }>
          <button onClick={()=> signup_set(true)}>1</button>
        </Page>
      </Stack>
      {/* 2 */}
      <Stack anim={"stack-right"} on={signup} set={signup_set}>
        <Page pad={"pt-16"} bar={
          <Topbar cls="flex-row h-16 m-auto">
            <img class="z-10" src="/arrow-left.svg" onClick={()=> signup_set(false)}></img>
            <h1 className="fixed w-full text-center m-auto SfProBold dark:text-white text-2xl">Sign Up</h1>
          </Topbar>
        }>
          <button onClick={()=> verification_set(true)}>2</button>
        </Page>
      </Stack>
      {/* 3 */}
      <Stack anim={"stack-right"} on={verification} set={verification_set}>
        <Page pad={"pt-16"} bar={
          <Topbar cls="flex-row h-16 m-auto">
            <img class="z-10" src="/arrow-left.svg" onClick={()=> verification_set(false)}></img>
            <h1 className="fixed w-full text-center m-auto SfProBold dark:text-white text-2xl">Verification</h1>
          </Topbar>
        }>
          <button onClick={()=> enter_verification_code_set(true)}>3</button>
        </Page>
      </Stack>
      {/* 4 */}
      <Stack anim={"stack-right"} on={enter_verification_code} set={enter_verification_code_set}>
        <Page pad={"pt-16"} bar={
          <Topbar cls="flex-row h-16 m-auto">
            <img class="z-10" src="/arrow-left.svg" onClick={()=> enter_verification_code_set(false)}></img>
            <h1 className="fixed w-full text-center m-auto SfProBold dark:text-white text-2xl">Enter Verification</h1>
          </Topbar>
        }>
          <button onClick={()=> forget_password_set(true)}>4</button>
        </Page>
      </Stack>
      {/* 5 */}
      <Stack anim={"stack-right"} on={forget_password} set={forget_password_set}>
        <Page pad={"pt-16 p-4"} bar={
          <Topbar cls="flex-row h-16 m-auto">
            <img class="z-10" src="/arrow-left.svg" onClick={()=> forget_password_set(false)}></img>
            <h1 className="fixed w-full text-center m-auto SfProBold dark:text-white text-2xl">Forget password</h1>
          </Topbar>
        }>
          <div class= "flex flex-col justify-center size-full mb-4 " onClick={()=> re_type_pin_set(true)}>
            <p class="text-left SfProBold tracking-wide font-medium text-4xl mt-8">Don’t worry.</p>
            <p class="text-left SfProBold tracking-wide font-medium text-4xl mr-26"> 
            Enter your email and we’ll send you a link to reset your password.</p>
            <Pushv/>
            <Sbutton text="Continue" act={()=> login_set(true)}/>
          </div>
        </Page>
      </Stack>
      {/* 6 */}
      <Stack anim={"stack-right"} on={reset_password} set={reset_password_set}>
        <Page pad={"pt-16"} bar={
          <Topbar cls="flex-row h-16 m-auto">
            <img class="z-10" src="/arrow-left.svg" onClick={()=> reset_password_set(false)}></img>
            <h1 className="fixed w-full text-center m-auto SfProBold dark:text-white text-2xl">Reset password</h1>
          </Topbar>
        }>
          <button onClick={()=> conf_msg_of_fpassword_set(true)}>6</button>
        </Page>
      </Stack>
      {/* 7 */}
      <Stack anim={"stack-right"} on={conf_msg_of_fpassword} set={conf_msg_of_fpassword_set}>
        <Page pad={"pt-0"} >
        <div class= "flex flex-col justify-center size-full mb-4 " >
            <div class= "m-auto" onClick={()=> enter_pin_set(true)}>
            <img src="success.svg" class=" mx-auto h-28 " > </img>
             <p class="text-center SfProMeduim tracking-wide font-semibold text-2xl mt-4">Your email is on the way</p>
              <p class="text-center SfProMeduim text-xl mx-20 mt-4 mb-4">Check your email test@test.com and follow the instructions to reset your password</p>   
            </div>
          <Sbutton text="Back to Login" act={()=> login_set(true)}/>
        </div>
        </Page>
      </Stack>
      {/* 8 */}
      <Stack anim={"stack-right"} on={enter_pin} set={enter_pin_set}>
        <Page pad={"pt-16"} bar={
          <Topbar cls="flex-row h-16 m-auto">
            <img class="z-10" src="/arrow-left.svg" onClick={()=> enter_pin_set(false)}></img>
            <h1 className="fixed w-full text-center m-auto SfProBold dark:text-white text-2xl">Enter Pin</h1>
          </Topbar>
        }>
          <button onClick={()=> re_type_pin_set(true)}>8</button>
        </Page>
      </Stack>
      {/* 9 */}
      <Stack anim={"stack-right"} on={re_type_pin} set={re_type_pin_set}>
        <Page pad={"pt-16"} bar={
          <Topbar cls="flex-row h-16 m-auto">
            <img class="z-10" src="/arrow-left.svg" onClick={()=> re_type_pin_set(false)}></img>
            <h1 className="fixed w-full text-center m-auto SfProBold dark:text-white text-2xl">Re Type pin</h1>
          </Topbar>
        }>
          <button onClick={()=> setup_account_set(true)}>9</button>
        </Page>
      </Stack>
      {/* 10 */}
      <Stack anim={"stack-right"} on={setup_account} set={setup_account_set}>
        <Page pad={"pt-16"} bar={
          <Topbar cls="flex-row h-16 m-auto">
            <a onClick={()=> setup_account_data_set(true)}>
              <p class="fixed w-full text-right m-auto SfPromedium dark:text-white text-gray-500 text-s">Skip</p>
            </a>
          </Topbar>
        }>
          <div class= "flex flex-col justify-center size-full mb-4 ">
          <p class="text-left SfProBold tracking-wide font-medium text-5xl mt-8 mr-12">Let’s setup your account!</p>
          <p class="text-left SfProBold tracking-wide font-medium  text-gray-500 mt-4 text-s mr-28"> 
           Account can be your bank, credit card or your wallet.</p>
          <Pushv/>
            <img class="object-none object-right w-16" src="/arrow-right.svg" onClick={()=>setup_account_data_set(true)}></img>
          </div>
        </Page>
      </Stack>
      {/* 11 */}
      <Stack anim={"stack-right"} on={setup_account_data} set={setup_account_data_set}>
        <Page pad={"pt-16"} bar={
          <Topbar cls="flex-row h-16 m-auto">
            <img class="z-10" src="/arrow-left.svg" onClick={()=> setup_account_data_set(false)}></img>
            <h1 className="fixed w-full text-center m-auto SfProBold dark:text-white text-2xl">Setup account data</h1>
          </Topbar>
        }>
          <button onClick={()=> setup_confirmation_set(true)}>11</button>
        </Page>
      </Stack>
      {/* 12 */}
      <Stack anim={"stack-right"} on={setup_confirmation} set={setup_confirmation_set}>
      <Page pad={"pt-0"} >
        <div class= "flex flex-col justify-center size-full mb-4 " >
            <div class= "m-auto" >
            <img src="success.svg" class=" mx-auto h-28" > </img>
             <p class="text-center SfProMeduim tracking-wide font-semibold text-2xl mt-8 ">You are set!</p>
            </div>
        </div>
        </Page>
      </Stack>
    </div>
  );
}
  
export default Startup;
