-- CURRENCY: The currency used for the gamemode
local CURRENCY = "$"

-- category: The name of the spawnmenu category
-- This is done with language.Add since it's already handled by gmod
if CLIENT then
	language.Add("spawnmenu.category.basewars", "BaseWars")
end

-- GO NO FURTHER IF YOU ARE NOT AT LEAST SEMI-EXPERIENCED WITH LUA

-- To create a new language, copy the english language lookup, and paste a second copy
-- below it. Change _LANGUAGELOOK.ENGLISH to _LANGUAGELOOK.YOURLANGUAGE then translate any strings.
-- When done go back to the config and change the selected language

-- If you create a language table which we dont have already, or notice any spelling or grammar mistakes
-- in the existing ones, open a support ticket or mail @ q2f2@hexahedron.pw and we will add it to the gamemode and you to the credits.

-- Korean: Unfinished

BaseWars.LANG = {}
BaseWars.LANG.__LANGUAGELOOK = {}

BaseWars.LANG.__LANGUAGELOOK.ENGLISH = {
	Numbers = {
		[5] = {10^6, "Million"},
		[4] = {10^9, "Billion"},
		[3] = {10^12, "Trillion"},
		[2] = {10^15, "Quadrillion"},
		[1] = {10^18, "Quintillion"},
	},

	CURFORMER								= CURRENCY .. "%s",
	CURRENCY								= CURRENCY,

	Yes											= "Yes",
	No											= "No",
	Level										= "Level",
	Remaining								= "Remaining",
	Seconds									= "Seconds",
	Mins										= "Mins",
	You											= "You",

	NaNResult								= "Can't break the system mate",
	MaximumPay							= "Maximum amount is " .. CURRENCY .. "%s. Please don't break our economy.",
	MinimumPay							= "Minimum amount is " .. CURRENCY .. "1",
	PayRateLimit						= "YOU JUST GOT RATE LIMITED! %s Seconds Left",

	FactionNameTaken				= "This faction name is already in use!",
	FactionNotExist					= "That faction does not exist!",
	FactionCantDisband			= "Only the faction leader can disband the faction!",
	FactionWrongPass				= "That is not the correct password!",
	FactionCantLeaveLeader	= "You cannot leave the faction as its leader, you must disband it!",
	FactionCantPassword			= "Only the faction leader can re-password the faction!",

	PayDay									= "PayDay! You received " .. CURRENCY .. "%s!",

	DontBuildSpawn					= "Do not build props around spawn.",
	SpawnKill								= "Do not attempt to spawnkill.",
	SpawnCamp								= "Do not attempt to camp in spawn.",

	RaidOngoing							= "There is already a raid ongoing!",
	RaidSelfUnraidable			= "You are not raidable yourself! (%s)",
	RaidTargetUnraidable		= "Your target is not raidable! (%s)",
	RaidOver								= "The raid between %s and %s has ENDED!",
	RaidStart								= "A raid started between %s and %s!",
	RaidTargNoFac						= "You cannot raid a factionless player as a faction!",
	RaidSelfNoFac						= "You cannot raid a faction as a factionless player!",
	RaidNoFaction						= "You cannot use faction functions during a raid!",
	CantRaidSelf						= "You can't raid yourself or your faction!",

	CannotPurchaseRaid			= "You cannot purchase that in a raid!",

	NoPrinters							= "Not enough raidable printers!",
	OnCoolDown							= "Currently on CoolDown from being raided!",

	PayOutOwner							= "You got " .. CURRENCY .. "%s for the destruction of your %s!",
	PayOut									= "You got " .. CURRENCY .. "%s for destroying a %s!",

	SteroidEffect						= "You feel full of energy...",
	SteroidRemove						= "Your energy passes...",
	RegenEffect							= "You feel your wounds healing by themselves...",
	RegenRemove							= "Your flesh ceases to heal...",
	PainKillerEffect				= "You feel no pain...",
	PainKillerRemove				= "You once again feel pain...",
	AntidoteEffect					= "You feel very healthy, and less afflicted by poison...",
	AntidoteRemove					= "You no longer feel very healthy...",
	AdrenalineEffect				= "YOU FEEL REALLY PUMPED...",
	AdrenalineRemove				= "You no longer feel pumped...",
	DoubleJumpEffect				= "You feel very light...",
	DoubleJumpRemove				= "You suddenly feel like lead...",
	ShieldEffect						= "You feel energy gathering around you...",
	ShieldRemove						= "The energy that previously protected you dissipates...",
	ShieldSave							= "The person you attacked was saved by an energy shield.",
	RageEffect							= "KIIIIIIILLLLLLLLLLLL!!!",
	RageRemove							= "Whoa, that was a bit much wasn't it...",

	PowerFailure						= "NO POWER!",
	HealthFailure						= "CRITICAL DAMAGE!",

	NewSpawnPoint						= "Your new Spawnpoint has been set!",

	UseSpawnMenu						= "Use the BaseWars spawnlist!",
	SpawnMenuMoney					= "You don't have enough money for that.",
	SpawnMenuBuy						= "You bought a(n) \"%s\" for " .. CURRENCY .. "%s.",
	SpawnMenuBuyConfirm			= "Are you sure you want to buy a(n) \"%s\" for " .. CURRENCY .. "%s?",
	SpawnMenuConf						= "Purchase Confirmation",
	DeadBuy									= "Dead people buy nothing.",
	EntLimitReached					= "You have reached the limit of \"%s\"s.",

	StuckText								= "You are stuck inside a wall, prop, or player! Remain calm and press [%s], if it does not work press [%s].",

	MainMenuControl					= "F3 - Open Main Menu (Rules, Factions, Raids)",
	SpawnMenuControl				= " - Open Buy Menu (Entities, Weapons)", -- Key is detected automatically, do not add one.
	KarmaText								= "Your Karma is currently %s",
	LevelText               = "Level: %s",
	XPText                  = "%s/%s XP",

	AFKFor									= "You have been away for",
	RespawnIn								= "You can respawn in",

	UpgradeNoMoney					= "You don't have enough money to upgrade!",
	UpgradeMaxLevel					= "You can't upgrade this printer any more!",

	WelcomeBackCrash				= "Welcome back, the last time you played we crashed.",
	Refunded								= "You have been refunded " .. CURRENCY .. "%s.",

	GivenMoney							= "%s gave you " .. CURRENCY .. "%s.",
	GaveMoney								= "You gave %s " .. CURRENCY .. "%s.",

	BountyNotEnoughMoney		= "You don't have enough money to place a bounty.",

	InvalidPlayer						= "Invalid Player!",
	InvalidAmount						= "Invalid Amount!",
	TooPoor									= "You're too poor for this transaction!",

	BaseWarsMenu						= "BaseWars Menu",
	Factions								= "Factions",
	Faction									= "Faction",
	Player									= "Player",
	Raids										= "Raids",
	Rules										= "Rules",
	NoFaction								= "<NONE>",

	ConfirmLeave						= [[
Are you sure you want to leave this faction?
If you are the leader of it, it will be disbanded!]],
	JoinWarning							= [[
Note: if you're the leader of a faction, joining another faction will disband your old one.]],
	CreateNotice						= [[
Warning: Creating a faction has a few caveats:
- You cannot create factions during a raid.
- If you are a leader of an existing faction, that faction will be disbanded.
Please proceed with caution.]],

	CreateFaction						= "Create Faction",
	FactionName							= "Faction name",
	FactionPassword					= "Password (optional)",

	Create									= "CREATE",
	Nevermind								= "NEVERMIND",

	JoinFaction							= "Join Faction",
	Join										= "JOIN",

	LeaveFaction						= "Leave Faction",
	Leave										= "LEAVE",

	YouNotFaction						= "You're not currently in a faction.",
	YourFaction							= "Your faction: ",

	StartRaid								= "Start Raid",
	ConceedRaid							= "Concede Raid",

	Use											= "Use",
	Collect									= "Collect",
	Activate								= "Activate",
	LookAt									= "Look At",
	Drink										= "Drink",
	TalkTo									= "Talk to",

	Door										= "Door",
	Money										= "Money",
	Drug										= "Drug",
	Soda										= "Soda",
	HelpNPC									= "Help NPC",
	Spawnpoint							= "Spawnpoint",
	Defusing								= "Defusing...",
	Plant										= "Plant",
	Defuse									= "Defuse",

	Entities								= "Entities",
	Loadout									= "Loadout",
	BaseWarsSpawnlist				= "BaseWars Spawnlist",
	CategoryLeft						= "Click on a category to the left.",

	PrinterBeen							= "This printer has been",
	Disabled								= "DISABLED",
	Cash										= "CASH",
	MaxLevel								= "!Max Level!",
	Paper										= "Paper: %s sheets",
	UntilFull								= "%s until full",
	Full										= "FULL",
	NextUpgrade							= "NEXT UPGRADE: %s",

	HoursShort							= "h",
	MinutesShort						= "m",
	SecondsShort						= "s",

	VS											= " vs ",
}

BaseWars.LANG.__LANGUAGELOOK.RUSSIAN = {
	Numbers = {
		[5] = {10^6, "Миллион"},
		[4] = {10^9, "Миллиард"},
		[3] = {10^12, "Триллион"},
		[2] = {10^15, "Квадриллион"},
		[1] = {10^18, "Квинтиллион"},
	},

	CURFORMER								= "%s" .. CURRENCY,
	CURRENCY								= CURRENCY,

	Yes											= "Да",
	No											= "Нет",
	Level										= "Уровень",
	Remaining								= "Осталось",
	Seconds									= "Секунд",
	Mins										= "Минут",
	You											= "Вы",

	NaNResult								= "Не прокатит, пацан",
	MaximumPay							= "Максимальная сумма - " .. CURRENCY .. "%s. Пожалуйста, не ломайте нашу экономику.",
	MinimumPay							= "Минимальная сумма - " .. CURRENCY .. "1",
	PayRateLimit						= "Хватит спамить! Вы не можете использовать эту комманду %s секунд",

	FactionNameTaken				= "Это название фракции уже используется!",
	FactionNotExist					= "Эта фракция не существует!",
	FactionCantDisband			= "Только лидер фракции может расформировать её!",
	FactionWrongPass				= "Неверный пароль!",
	FactionCantLeaveLeader	= "Вы не можете выйти из фракции будучи лидером, вы должны расформировать её!",
	FactionCantPassword			= "Только лидер фракции может поменять её пароль!",

	PayDay									= "День зарплаты! Вы получили " .. CURRENCY .. "%s!",

	DontBuildSpawn					= "Не стройте на спавне.",
	SpawnKill								= "Не пытайтесь спавнкиллить.",
	SpawnCamp								= "Не пытайтесь кемперить на спавне.",

	RaidOngoing							= "Рейд уже идёт!",
	RaidSelfUnraidable			= "Вас нельзя рейдить! (%s)",
	RaidTargetUnraidable		= "Выбранную цель нельзя рейдить! (%s)",
	RaidOver								= "Рейд между %s и %s ЗАКОНЧИЛСЯ!",
	RaidStart								= "Рейд начался между %s и %s!",
	RaidTargNoFac						= "Вы не можете зарейдить игрока, не состоящего в фракции, будучи фракцией!",
	RaidSelfNoFac						= "Вы не можете зарейдить фракцию, будучи игроком, не состоящим в фракции!",
	RaidNoFaction						= "Вы не можете использовать функции фракции во время рейда!",
	CantRaidSelf						= "Вы не можете зарейдить себя или свою фракцию!",

	CannotPurchaseRaid			= "Вы не можете купить это во время рейда!",

	NoPrinters							= "У вас недостаточно принтеров, необходимых для рейда!",
	OnCoolDown							= "В данный момент не может быть зарейден!",

	PayOutOwner							= "Вы получили " .. CURRENCY .. "%s за уничтожение вашего %s!",
	PayOut									= "Вы получили " .. CURRENCY .. "%s за уничтожение %s!",

	SteroidEffect						= "Вы полны энергии...",
	SteroidRemove						= "Ваша энергия уходит...",
	RegenEffect							= "Ваши раны заживают сами...",
	RegenRemove							= "Ваша плоть перестаёт заживать...",
	PainKillerEffect				= "Вы не чувствуете боли...",
	PainKillerRemove				= "Вы опять чувствуете боль...",
	AntidoteEffect					= "Вы чувствуете себя здоровым, and less afflicted by poison...",
	AntidoteRemove					= "Вы больше не чувствуете себя здоровым...",
	AdrenalineEffect				= "ВАШ УРОВЕНЬ АДРЕНАЛИНА ЗАШКАЛИВАЕТ...",
	AdrenalineRemove				= "Адреналин нормализовался...",
	DoubleJumpEffect				= "Вы не ощущаете своего веса...",
	DoubleJumpRemove				= "Вдруг вы снова чувствуете себя тяжелым...",
	ShieldEffect						= "Энергия скапливается вокруг вас...",
	ShieldRemove						= "Эергия, которая вас защищала рассеивается...",
	ShieldSave							= "Игрок, которого вы атаковали был спасён энергическим щитом.",
	RageEffect							= "УБИВААААААААААААААААААААТЬ!!!",
	RageRemove							= "Охтыжбл, я слегка переборщил, не так ли...",

	PowerFailure						= "НЕТ ЭНЕРГИИ!",
	HealthFailure						= "КРИТИЧЕСКИЙ УРОН!",

	NewSpawnPoint						= "Ваша новая точка спавна была установлена!",

	UseSpawnMenu						= "Используйте меню спавна BaseWars!",
	SpawnMenuMoney					= "У вас недостаточно денег для этого.",
	SpawnMenuBuy						= "Вы купили \"%s\" за " .. CURRENCY .. "%s.",
	SpawnMenuBuyConfirm			= "Вы уверены, что хотите купить \"%s\" за " .. CURRENCY .. "%s?",
	SpawnMenuConf						= "Подтвердить покупку",
	DeadBuy									= "Мертвые не могут покупать.",
	EntLimitReached					= "Вы достигли лимита \"%s\"s.",

	StuckText								= "Вы застряли в стене, пропе или игроке! Cохраняйте спокойствие и нажимайте [%s], если не работает - нажимайте [%s].",

	MainMenuControl					= "F3 - Открыть основное меню (Правила, Фракции, Рейды)",
	SpawnMenuControl				= " - Открыть меню покупок (Объекты, Оружия)", -- Key is detected automatically, do not add one.
	KarmaText								= "Карма: %s",
	LevelText               = "Уровень: %s",
	XPText                  = "%s/%s XP",

	AFKFor									= "Вы АФК",
	RespawnIn								= "Вы сможете возродиться через",

	UpgradeNoMoney					= "У вас не хватает денег на это улучшение!",
	UpgradeMaxLevel					= "Вы больше не можете улучшать этот принтер! (Максимальный уровень)",

	WelcomeBackCrash				= "Добро пожаловать обратно, когда вы играли последний раз сервер упал.",
	Refunded								= "Вам возвратили " .. CURRENCY .. "%s.",

	GivenMoney							= "%s дал вам " .. CURRENCY .. "%s.",
	GaveMoney								= "Вы дали %s " .. CURRENCY .. "%s.",

	BountyNotEnoughMoney		= "У вас недостаточно денег, чтобы поставить награду.",

	InvalidPlayer						= "Несуществующий игрок!",
	InvalidAmount						= "Недопустимая сумма!",
	TooPoor									= "У вас недостаточно денег, чтобы совершить эту операцию!",

	BaseWarsMenu						= "Меню BaseWars",
	Factions								= "Фракции",
	Faction									= "Фракция",
	Player									= "Игрок",
	Raids										= "Рейды",
	Rules										= "Правила",
	NoFaction								= "<НЕТ>",

	ConfirmLeave						= [[
Вы уверены, что хотите покинуть эту фракцию?
Если вы её лидер, она будет расформирована!]],
	JoinWarning							= [[
Внимание: Если вы лидер фракции, вступление в другую фракцию расформирует старую.]],
	CreateNotice						= [[
Внимание: Создание фракции включает в себя пару нюансов:
- Вы не можете создавать фракции находясь в рейде.
- Если вы лидер уже существующей фракции, она будет раформирована.
Пожалуйста, действуйте с осторожностью.]],

	CreateFaction						= "Создать фракцию",
	FactionName							= "Название фракции",
	FactionPassword					= "Пароль (не обязательно)",

	Create									= "СОЗДАТЬ",
	Nevermind								= "ОТМЕНА",

	JoinFaction							= "Вступить в фракцию",
	Join										= "ВСТУПИТЬ",

	LeaveFaction						= "Покинуть фракцию",
	Leave										= "ПОКИНУТЬ",

	YouNotFaction						= "На данный момент вы не состоите в фракции.",
	YourFaction							= "Ваша фракция: ",

	StartRaid								= "Начать рейд",
	ConceedRaid							= "Сдаться",

	Use											= "Использовать",
	Collect									= "Подобрать",
	Activate								= "Активировать",
	LookAt									= "Посмотреть на",
	Drink										= "Выпить",
	TalkTo									= "Говорить с",

	Door										= "Дверь",
	Money										= "Деньги",
	Drug										= "Наркотик",
	Soda										= "Газировка",
	HelpNPC									= "NPC-помощник",
	Spawnpoint							= "Точка спавна",
	Defusing								= "Обезвреживаю...",
	Plant										= "Заложить",
	Defuse									= "Обезвреживать",

	Entities								= "Объекты",
	Loadout									= "Снаряжения",
	BaseWarsSpawnlist				= "Спавнлист BaseWars",
	CategoryLeft						= "Нажмите на категорию слева.",

	PrinterBeen							= "Этот принтер был",
	Disabled								= "ОТКЛЮЧЕН",
	Cash										= "ЭК",
	MaxLevel								= "!Максимальный уровень!",
	Paper										= "Бумага: %s листов",
	UntilFull								= "%s до полного",
	Full										= "ПОЛНЫЙ",
	NextUpgrade							= "СЛЕДУЮЩЕЕ УЛУЧШЕНИЕ: %s",

	HoursShort							= "ч",
	MinutesShort						= "м",
	SecondsShort						= "с",

	VS											= " vs ",
}

local INVALID_LANGUAGE	= "INVALID LANGUAGE SELECTED! NOTIFY THE SERVER ADMIN!"
local INVALID_STRING		= "INVALID STRING TRANSLATION! NOTIFY THE SERVER ADMIN!"

setmetatable(BaseWars.LANG, {
	__index = function(t, k)

		local L = BaseWars.LANG.__LANGUAGELOOK[BASEWARS_CHOSEN_LANGUAGE]
		if not L then
			return INVALID_LANGUAGE
		end
		if not L[k] then
			ErrorNoHalt("[BaseWars-Lang] You messed up a string localization:")
			debug.Trace()

			return INVALID_STRING
		end
		return L[k]

	end
})
