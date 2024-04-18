import { For, Index, createSignal } from "solid-js";
import Page from "../components/Page";
import Stack from "../components/Stack";
import Topbar from "../components/Topbar";
import Item2names from "./Item2names";
import Selectable from "./Selectable";
import Toggleitem from "./Toggleitem";
function MainSettings(p) {
	const [curnancy, curnancy_set] = createSignal(false);
	const [lang, lang_set] = createSignal(false);
	const [theme, theme_set] = createSignal(false);
	const [security, security_set] = createSignal(false);
	const [notifi, notifi_set] = createSignal(false);
	const settings = {
		Currency: [
			"United States (USD)",
			"Indonesia (IDR)",
			"Japan (JPY)",
			"Russia (RUB)",
			"Germany (EUR)",
			"Korea (WON)",
			"Egyptian (LE)",
		],
		Language: [
			"English (EN)",
			"Indonesian (ID)",
			"Arabic (AR)",
			"Chinese (ZH)",
			"Chinese (ZH)",
			"French (FR)",
			"German (DE)",
			"Italian (IT)",
			"Korean (KO)",
			"Portuguese (PT)",
			"Russian (RU)",
			"Spanish (ES)",
		],
		Theme: ["Dark", "Light"],
		Security: ["PIN", "Fingerprints", "Face ID"],
		Notification: [
			["Expense Alert", "Get notification about you’re expense"],
			["Budget", "Get notification when you’re budget exceeding the limit"],
			["Tips & Articles", "Small & useful pieces of pratical financial advice"],
		],
	};
	const settingsfn = {
		Currency: curnancy_set,
		Language: lang_set,
		Theme: theme_set,
		Security: security_set,
		Notification: notifi_set,
	};
	const getfn = {
		Currency: curnancy,
		Language: lang,
		Theme: theme,
		Security: security,
		Notification: notifi,
	};

	const [sad, mad] = createSignal({
		Currency: 4,
		Language: 0,
		Theme: 0,
		Security: 0,
		Notification: 0,
	});

	function updateSetting(key, newValue) {
		mad({ ...sad(), [key]: newValue });
		console.log("sad");
	}

	return (
		<>
			{/*Settings*/}
			<Stack anim={"stack-right"} on={p.setting2} set={p.setting2_set}>
				<Page
					pad={"pt-16"}
					bar={
						<Topbar cls="flex-row h-16 m-auto">
							<img
								class="z-10"
								src="/arrow-left.svg"
								onClick={() => p.setting2_set(false)}
							></img>
							<h1 className="fixed w-full text-center m-auto SfProBold dark:text-white text-2xl">
								Settings
							</h1>
						</Topbar>
					}
				>
					<For each={Object.keys(settings)} fallback={<div>Loading...</div>}>
						{(a) => (
							<Item2names
								text={a}
								act={() => settingsfn[a](true)}
								text2={a != "Notification" ? settings[a][sad()[a]] : ""}
							></Item2names>
						)}
					</For>
				</Page>
			</Stack>
			<For each={Object.keys(settings)} fallback={<div>Loading...</div>}>
				{(a, i) => (
					<Stack anim={"stack-right"} on={getfn[a]} set={settingsfn[a]}>
						<Page
							pad={"pt-16"}
							bar={
								<Topbar cls="flex-row h-16 m-auto">
									<img
										class="z-10"
										src="/arrow-left.svg"
										onClick={() => settingsfn[a](false)}
									></img>
									<h1 className="fixed w-full text-center m-auto SfProBold dark:text-white text-2xl">
										{a}
									</h1>
								</Topbar>
							}
						>
							<For each={settings[a]} fallback={<div>Loading...</div>}>
								{(c, index) =>
									a != "Notification" ? (
										<Selectable
											act={() => {
												updateSetting(a, index());
											}}
											name={a}
											text={c}
											is={index()}
											on={sad()[a]}
										></Selectable>
									) : (
										<Toggleitem
											text={c[0]}
											text2={c[1]}
											on={sad()["Notification"] & (1 << index())}
											act={() =>
												updateSetting(
													"Notification",
													(1 << index()) ^ sad()["Notification"],
												)
											}
										/>
									)
								}
							</For>
						</Page>
					</Stack>
				)}
			</For>
		</>
	);
}

export default MainSettings;
