import { For,Show,createResource, createSignal, useTransition } from "solid-js";
import Topbar from "../components/Topbar";
import Graphes from "../components/Graphes";
import Transaction from "../components/Transaction";
import Bottombar from "../components/Bottombar";
import Slides from "../components/Slides";
import Slide from "../components/Slide";
import BottomSheet from "../components/Bottomsheet";
import Stack from "../components/Stack";
import Page from "../components/Page";
import Sprofile from "../components/Sprofile";
import Iconitem from "../components/Iconitem";
import Pushv from "../components/Pushv";
import {
	isPermissionGranted,
	requestPermission,
	sendNotification,
} from "@tauri-apps/plugin-notification";
import MainSettings from "../components/MainSettings";
import Inputtext from "../components/Inputtext";
import Sbutton from "../components/Sbutton";

async function notify() {
	let permissionGranted = await isPermissionGranted();

	// If not we need to request it
	if (!permissionGranted) {
		const permission = await requestPermission();
		console.log(permission);
		permissionGranted = permission === "granted";
	}

	// Once permission has been granted we can send the notification

	if (permissionGranted) {
		sendNotification({ title: "Tauri", body: "Tauri is awesome!" });
	}
}



const fetchUser = async (id) =>
  (await fetch(`http://localhost:3000/${id}`)).json();
const fetchNodes = async (id) =>
  (await fetch(`http://localhost:3000/${id}`)).json();

function Home(p) {


const fetchall = async (a) =>
	fetch(`http://localhost:3000/profile`, {
		method: "get",
		headers: {
			'Accept': 'application/json',
		},
		body: null
	}).then(async (response) => {
		const r = await response.json();
		console.log(r)
		return r;
	}).catch((e) => {
		console.log(e)
	}
	).finally((e) => { console.log("saad") });
const dbfetchall = async (a) =>
{
	try{
		return await p.db.query(`select * from node where ${a.id};`);
		}catch(e){
		console.log(a.id)
		console.log(e)
	}
};
	// const [data] = createResource(p.user().id,fetchall)
	const [db,{mutate,refetch}] = createResource(p.user(),dbfetchall)
	const [tab, setTab] = createSignal(0);
	const [pending, start] = useTransition();
	const updateTab = (index) => () => start(() => setTab(index));
	const [node, nodeset] = createSignal(
	{
			"id":"",
			"name": "",
			"interval": "",
			"amout": 1,
			"startDate": "",
			"total": -1,
		}
	)
	// const [db,setdb] = createSignal([])
	setInterval(()=>{refetch()},100000)
	// Do you have permission to send a notification?
	// notify()
	function income (x) {
		return x["amount"]>=0
	}
	function expense(x) {
		return x["amount"]>=0
	}
	function goal(x) {
		return x["isgoal"]
	}
	function pass(x) {
		return true
	}
	

	const [sheeton, sheet_set] = createSignal(false);
	const [setting, settings_set] = createSignal(false);
	const [setting2, setting2_set] = createSignal(false);
	const [about, about_set] = createSignal(false);
	const [privacy, privacy_set] = createSignal(false);
	const [terms, terms_set] = createSignal(false);
	const [exo, exo_set] = createSignal(false);
	const [buttom, buttom_set] = createSignal(false);
	const [addtrans, addtrans_set] = createSignal(false);
	const [addwallet, addwallet_set] = createSignal(false);
	const [addgoal, addgoal_set] = createSignal(false);
	function toggle_theme() {
		document.documentElement.classList.toggle("dark");
	}

	return (
		<div class="overflow-hidden">
			<Show when={sheeton() || exo()}>
				<div
					class="size-full bg-stone-800 bg-opacity-40 absolute z-20"
					onClick={() => {
						sheet_set(false);
						exo_set(false);
					}}
				></div>
			</Show>
			<Topbar cls="h-14 m-auto">
				<img src="/menu.svg" onClick={() => settings_set(true)}></img>
				<a class="ZenDot dark:text-white text-2xl">econome</a>
				<img src="/moon.svg" onClick={toggle_theme}></img>
			</Topbar>
			<Slides tab={tab}>
				<Slide>
					<p class="SfProBold text-gray-500 dark:text-white text-center text-base">
						Current Balance
					</p>
					<h1 class="SfProBold dark:text-white text-center text-5xl py-5">
						<span class="text-xl">$</span>3,745.40
					</h1>
					<Graphes />
					<Transaction b={db} fil={pass} a={"yarab"}/>
				</Slide>
				<Slide>
					<p class="SfProBold text-gray-500 dark:text-white text-center text-base">
						transactions
					</p>
					<h1 class="SfProBold dark:text-white text-center text-5xl py-5">
						this week
					</h1>
					<Transaction b={db} fil={pass} a={"yarab"}/>
				</Slide>
				<Slide>
					<p class="SfProBold text-gray-500 dark:text-white text-center text-base">
						Current target goal
					</p>
					<Switch>
					<Match when={db.loading}>
					</Match>
					<Match when={db()}>
						<For each={db()[0].filter(goal)} fallback={<div>Loading...</div>}>
							{(item) => (<>
							<h1 class="SfProBold dark:text-white text-center text-5xl py-5">
							{item.name}
						</h1>
						<div class="progress-container w-full">
						  {/* <h1>{JSON.stringify(item)}</h1> */}
						  <progress value={-item.amount} max={item.total}></progress>
						</div>
						</>
							)}
						</For>
					</Match>
					</Switch>
					<Transaction b={db} fil={goal} a={"yarab"}/>
				</Slide>
				<Slide>
					<Iconitem text="CIB" icon="cib.svg" center={true}/>
					<Iconitem text="paypal" icon="paypal.svg" center={true}/>
					<Iconitem text="QNB" icon="qnb.svg" center={true}/>
				</Slide>
			</Slides>
			<Bottombar updateTab={updateTab} seton={sheet_set} tab={tab}></Bottombar>
			<BottomSheet on={sheeton} sad={sheet_set}>
				<Page pad={"py-10 px-5"}>
					<Topbar cls="flex-row-reverse h-10">
						<img src="/close-circle.svg" onClick={() => sheet_set(false)}></img>
					</Topbar>
					<div class="flex flex-row h-fit space-x-4">
						<div
							class="w-1/2 h-fit rounded-2xl bg-purple-50 flex flex-col justify-center p-8"
							onClick={() => addwallet_set(true)}
						>
							<img class="h-6" src="/wallet-3.svg"></img>
							<p class="SfProMeduim text-gray-500 text-center text-xl">
								Wallet
							</p>
						</div>
						<div
							class="w-1/2 h-fit rounded-2xl bg-purple-50 flex flex-col justify-center p-8"
							onClick={() => addtrans_set(true)}
						>
							<img class="h-6" src="/arrow-2.svg"></img>
							<p class="SfProMeduim text-gray-500 text-center text-xl">
								Trasactions
							</p>
						</div>
						<div
							class="w-full h-fit rounded-2xl bg-purple-50 flex flex-col justify-center p-8"
							onClick={() => addgoal_set(true)}
						>
							<img class="h-6" src="/cup.svg"></img>
							<p class="SfProMeduim text-gray-500 text-center text-xl">Goal</p>
						</div>
					</div>
				</Page>
			</BottomSheet>
			{/*settings*/}
			<Stack anim={"stack-left"} on={setting} set={settings_set}>
				<Page
					pad={"pt-28"}
					bar={
						<Topbar cls="flex-row h-28 m-auto">
							<Sprofile username={p.user().username}></Sprofile>
							<img
								src="/close-circle.svg"
								onClick={() => settings_set(false)}
							></img>
						</Topbar>
					}
				>
					<Iconitem
						icon="/user-edit.svg"
						text="About"
						act={() => about_set(true)}
					></Iconitem>
					<Iconitem
						icon="/unlock.svg"
						text="Privacy Policy"
						act={() => privacy_set(true)}
					></Iconitem>
					<Iconitem
						icon="/note.svg"
						text="Terms & Conditions"
						center={0}
						act={() => terms_set(true)}
					></Iconitem>
					<Iconitem
						icon="/printer.svg"
						text="Export statistics"
						act={() => exo_set(true)}
					></Iconitem>
					<Pushv />
					<div class="w-full h-2 bg-red-50 "></div>
					<Iconitem
						icon="/setting-2.svg"
						text="Settings"
						act={() => setting2_set(true)}
					></Iconitem>
					<Iconitem
						icon="/logout.svg"
						text="logout"
						act={() => setting2_set(true)}
					></Iconitem>
				</Page>
			</Stack>
			{/*about*/}
			<Stack anim={"stack-right"} on={about} set={about_set}>
				<Page
					pad={"pt-16"}
					bar={
						<Topbar cls="flex-row h-16 m-auto">
							<img
								class="z-10"
								src="/arrow-left.svg"
								onClick={() => about_set(false)}
							></img>
							<h1 className="fixed w-full text-center m-auto SfProBold dark:text-white text-2xl">
								about
							</h1>
						</Topbar>
					}
				>
					<button>what</button>
				</Page>
			</Stack>
			{/*privacy*/}
			<Stack anim={"stack-right"} on={privacy} set={privacy_set}>
				<Page
					pad={"pt-16"}
					bar={
						<Topbar cls="flex-row h-16 m-auto">
							<img
								class="z-10"
								src="/arrow-left.svg"
								onClick={() => privacy_set(false)}
							></img>
							<h1 className="fixed w-full text-center m-auto SfProBold dark:text-white text-2xl">
								privacy
							</h1>
						</Topbar>
					}
				></Page>
			</Stack>
			{/*terms*/}
			<Stack anim={"stack-right"} on={terms} set={terms_set}>
				<Page
					pad={"pt-16"}
					bar={
						<Topbar cls="flex-row h-16 m-auto">
							<img
								class="z-10"
								src="/arrow-left.svg"
								onClick={() => terms_set(false)}
							></img>
							<h1 className="fixed w-full text-center m-auto SfProBold dark:text-white text-2xl">
								terms
							</h1>
						</Topbar>
					}
				>
					<button>what</button>
				</Page>
			</Stack>
			<MainSettings setting2={setting2} setting2_set={setting2_set} />
			{/*adds*/}
			<Stack anim={"stack-right"} on={addtrans} set={addtrans_set}>
				<Page
					pad={"pt-16"}
					bar={
						<Topbar cls="flex-row h-16 m-auto">
							<img
								class="z-10"
								src="/arrow-left.svg"
								onClick={() => addtrans_set(false)}
							></img>
							<h1 className="fixed w-full text-center m-auto SfProBold dark:text-white text-2xl">
								Add transactions
							</h1>
						</Topbar>
					}
				>
				<For each={[node()]} fallback={<div>Loading...</div>}>
					{(item,i) => (
						// <h1>{i()}</h1>
						<Show when={!item.id}>
							<Inputtext text="Name" hint="shopping"  ins={nodeset} v={node} l={item.name}/>
							<Inputtext text="Amount" hint="100"  ins={nodeset} v={node} l={item.amout}/>
							<Inputtext text="interval" hint="1m"  ins={nodeset} v={node} l={item.interval}/>
							<Inputtext text="total" hint="1000"  ins={nodeset} v={node} l={item.total}/>
						</Show>
					)}
				</For>
					<Sbutton text="submit" act={() => {}} />
				</Page>
			</Stack>
			<Stack anim={"stack-right"} on={addgoal} set={addgoal_set}>
				<Page
					pad={"pt-16"}
					bar={
						<Topbar cls="flex-row h-16 m-auto">
							<img
								class="z-10"
								src="/arrow-left.svg"
								onClick={() => addgoal_set(false)}
							></img>
							<h1 className="fixed w-full text-center m-auto SfProBold dark:text-white text-2xl">
								Add goal
							</h1>
						</Topbar>
					}
				></Page>
			</Stack>
			<Stack anim={"stack-right"} on={addwallet} set={addwallet_set}>
				<Page
					pad={"pt-16"}
					bar={
						<Topbar cls="flex-row h-16 m-auto">
							<img
								class="z-10"
								src="/arrow-left.svg"
								onClick={() => addwallet_set(false)}
							></img>
							<h1 className="fixed w-full text-center m-auto SfProBold dark:text-white text-2xl">
								Add wallets
							</h1>
						</Topbar>
					}
				></Page>
			</Stack>
			<BottomSheet on={exo} sad={exo_set}>
				<Page pad={"py-10 px-5"}>
					<Topbar cls="flex-row-reverse h-10">
						<img src="/close-circle.svg" onClick={() => exo_set(false)}></img>
					</Topbar>
					<h1>sad</h1>
				</Page>
			</BottomSheet>
		</div>
	);
}

export default Home;
