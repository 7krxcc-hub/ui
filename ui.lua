local _cr=cloneref or function(s)return s end
local Players=_cr(game:GetService("Players"))
local TS=_cr(game:GetService("TweenService"))
local UIS=_cr(game:GetService("UserInputService"))
local CG=_cr(game:GetService("CoreGui"))
local _HS=_cr(game:GetService("HttpService"))
local LP=Players.LocalPlayer
local PG=LP:WaitForChild("PlayerGui")

local function GetContainer()
	if gethui then return gethui() end
	if syn and syn.protect_gui then return CG end
	return PG
end
local function ProtectGui(g)
	if syn and syn.protect_gui then pcall(syn.protect_gui,g)
	elseif protect_gui then pcall(protect_gui,g) end
end
local function RN(n)
	local c="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";local s=""
	for _=1,n or 12 do s=s..c:sub(math.random(1,#c),math.random(1,#c))end
	return s
end
local _NG,_NL,_NN=RN(16),RN(16),RN(16)
local function CI(sig,fn)
	return sig:Connect(newcclosure and newcclosure(fn) or fn)
end
local Icons={
	["lucide-accessibility"]="rbxassetid://10709751939",
	["lucide-activity"]="rbxassetid://10709752035",
	["lucide-air-vent"]="rbxassetid://10709752131",
	["lucide-airplay"]="rbxassetid://10709752254",
	["lucide-alarm-check"]="rbxassetid://10709752405",
	["lucide-alarm-clock"]="rbxassetid://10709752630",
	["lucide-alarm-clock-off"]="rbxassetid://10709752508",
	["lucide-alarm-minus"]="rbxassetid://10709752732",
	["lucide-alarm-plus"]="rbxassetid://10709752825",
	["lucide-album"]="rbxassetid://10709752906",
	["lucide-alert-circle"]="rbxassetid://10709752996",
	["lucide-alert-octagon"]="rbxassetid://10709753064",
	["lucide-alert-triangle"]="rbxassetid://10709753149",
	["lucide-align-center"]="rbxassetid://10709753570",
	["lucide-align-center-horizontal"]="rbxassetid://10709753272",
	["lucide-align-center-vertical"]="rbxassetid://10709753421",
	["lucide-align-end-horizontal"]="rbxassetid://10709753692",
	["lucide-align-end-vertical"]="rbxassetid://10709753808",
	["lucide-align-horizontal-distribute-center"]="rbxassetid://10747779791",
	["lucide-align-horizontal-distribute-end"]="rbxassetid://10747784534",
	["lucide-align-horizontal-distribute-start"]="rbxassetid://10709754118",
	["lucide-align-horizontal-justify-center"]="rbxassetid://10709754204",
	["lucide-align-horizontal-justify-end"]="rbxassetid://10709754317",
	["lucide-align-horizontal-justify-start"]="rbxassetid://10709754436",
	["lucide-align-horizontal-space-around"]="rbxassetid://10709754590",
	["lucide-align-horizontal-space-between"]="rbxassetid://10709754749",
	["lucide-align-justify"]="rbxassetid://10709759610",
	["lucide-align-left"]="rbxassetid://10709759764",
	["lucide-align-right"]="rbxassetid://10709759895",
	["lucide-align-start-horizontal"]="rbxassetid://10709760051",
	["lucide-align-start-vertical"]="rbxassetid://10709760244",
	["lucide-align-vertical-distribute-center"]="rbxassetid://10709760351",
	["lucide-align-vertical-distribute-end"]="rbxassetid://10709760434",
	["lucide-align-vertical-distribute-start"]="rbxassetid://10709760612",
	["lucide-align-vertical-justify-center"]="rbxassetid://10709760814",
	["lucide-align-vertical-justify-end"]="rbxassetid://10709761003",
	["lucide-align-vertical-justify-start"]="rbxassetid://10709761176",
	["lucide-align-vertical-space-around"]="rbxassetid://10709761324",
	["lucide-align-vertical-space-between"]="rbxassetid://10709761434",
	["lucide-anchor"]="rbxassetid://10709761530",
	["lucide-angry"]="rbxassetid://10709761629",
	["lucide-annoyed"]="rbxassetid://10709761722",
	["lucide-aperture"]="rbxassetid://10709761813",
	["lucide-apple"]="rbxassetid://10709761889",
	["lucide-archive"]="rbxassetid://10709762233",
	["lucide-archive-restore"]="rbxassetid://10709762058",
	["lucide-armchair"]="rbxassetid://10709762327",
	["lucide-arrow-big-down"]="rbxassetid://10747796644",
	["lucide-arrow-big-left"]="rbxassetid://10709762574",
	["lucide-arrow-big-right"]="rbxassetid://10709762727",
	["lucide-arrow-big-up"]="rbxassetid://10709762879",
	["lucide-arrow-down"]="rbxassetid://10709767827",
	["lucide-arrow-down-circle"]="rbxassetid://10709763034",
	["lucide-arrow-down-left"]="rbxassetid://10709767656",
	["lucide-arrow-down-right"]="rbxassetid://10709767750",
	["lucide-arrow-left"]="rbxassetid://10709768114",
	["lucide-arrow-left-circle"]="rbxassetid://10709767936",
	["lucide-arrow-left-right"]="rbxassetid://10709768019",
	["lucide-arrow-right"]="rbxassetid://10709768347",
	["lucide-arrow-right-circle"]="rbxassetid://10709768226",
	["lucide-arrow-up"]="rbxassetid://10709768939",
	["lucide-arrow-up-circle"]="rbxassetid://10709768432",
	["lucide-arrow-up-down"]="rbxassetid://10709768538",
	["lucide-arrow-up-left"]="rbxassetid://10709768661",
	["lucide-arrow-up-right"]="rbxassetid://10709768787",
	["lucide-asterisk"]="rbxassetid://10709769095",
	["lucide-at-sign"]="rbxassetid://10709769286",
	["lucide-award"]="rbxassetid://10709769406",
	["lucide-axe"]="rbxassetid://10709769508",
	["lucide-axis-3d"]="rbxassetid://10709769598",
	["lucide-baby"]="rbxassetid://10709769732",
	["lucide-backpack"]="rbxassetid://10709769841",
	["lucide-baggage-claim"]="rbxassetid://10709769935",
	["lucide-banana"]="rbxassetid://10709770005",
	["lucide-banknote"]="rbxassetid://10709770178",
	["lucide-bar-chart"]="rbxassetid://10709773755",
	["lucide-bar-chart-2"]="rbxassetid://10709770317",
	["lucide-bar-chart-3"]="rbxassetid://10709770431",
	["lucide-bar-chart-4"]="rbxassetid://10709770560",
	["lucide-bar-chart-horizontal"]="rbxassetid://10709773669",
	["lucide-barcode"]="rbxassetid://10747360675",
	["lucide-baseline"]="rbxassetid://10709773863",
	["lucide-bath"]="rbxassetid://10709773963",
	["lucide-battery"]="rbxassetid://10709774640",
	["lucide-battery-charging"]="rbxassetid://10709774068",
	["lucide-battery-full"]="rbxassetid://10709774206",
	["lucide-battery-low"]="rbxassetid://10709774370",
	["lucide-battery-medium"]="rbxassetid://10709774513",
	["lucide-beaker"]="rbxassetid://10709774756",
	["lucide-bed"]="rbxassetid://10709775036",
	["lucide-bed-double"]="rbxassetid://10709774864",
	["lucide-bed-single"]="rbxassetid://10709774968",
	["lucide-beer"]="rbxassetid://10709775167",
	["lucide-bell"]="rbxassetid://10709775704",
	["lucide-bell-minus"]="rbxassetid://10709775241",
	["lucide-bell-off"]="rbxassetid://10709775320",
	["lucide-bell-plus"]="rbxassetid://10709775448",
	["lucide-bell-ring"]="rbxassetid://10709775560",
	["lucide-bike"]="rbxassetid://10709775894",
	["lucide-binary"]="rbxassetid://10709776050",
	["lucide-bitcoin"]="rbxassetid://10709776126",
	["lucide-bluetooth"]="rbxassetid://10709776655",
	["lucide-bluetooth-connected"]="rbxassetid://10709776240",
	["lucide-bluetooth-off"]="rbxassetid://10709776344",
	["lucide-bluetooth-searching"]="rbxassetid://10709776501",
	["lucide-bold"]="rbxassetid://10747813908",
	["lucide-bomb"]="rbxassetid://10709781460",
	["lucide-bone"]="rbxassetid://10709781605",
	["lucide-book"]="rbxassetid://10709781824",
	["lucide-book-open"]="rbxassetid://10709781717",
	["lucide-bookmark"]="rbxassetid://10709782154",
	["lucide-bookmark-minus"]="rbxassetid://10709781919",
	["lucide-bookmark-plus"]="rbxassetid://10709782044",
	["lucide-bot"]="rbxassetid://10709782230",
	["lucide-box"]="rbxassetid://10709782497",
	["lucide-box-select"]="rbxassetid://10709782342",
	["lucide-boxes"]="rbxassetid://10709782582",
	["lucide-briefcase"]="rbxassetid://10709782662",
	["lucide-brush"]="rbxassetid://10709782758",
	["lucide-bug"]="rbxassetid://10709782845",
	["lucide-building"]="rbxassetid://10709783051",
	["lucide-building-2"]="rbxassetid://10709782939",
	["lucide-bus"]="rbxassetid://10709783137",
	["lucide-cake"]="rbxassetid://10709783217",
	["lucide-calculator"]="rbxassetid://10709783311",
	["lucide-calendar"]="rbxassetid://10709789505",
	["lucide-calendar-check"]="rbxassetid://10709783474",
	["lucide-calendar-check-2"]="rbxassetid://10709783392",
	["lucide-calendar-clock"]="rbxassetid://10709783577",
	["lucide-calendar-days"]="rbxassetid://10709783673",
	["lucide-calendar-heart"]="rbxassetid://10709783835",
	["lucide-calendar-minus"]="rbxassetid://10709783959",
	["lucide-calendar-off"]="rbxassetid://10709788784",
	["lucide-calendar-plus"]="rbxassetid://10709788937",
	["lucide-calendar-range"]="rbxassetid://10709789053",
	["lucide-calendar-search"]="rbxassetid://10709789200",
	["lucide-calendar-x"]="rbxassetid://10709789407",
	["lucide-calendar-x-2"]="rbxassetid://10709789329",
	["lucide-camera"]="rbxassetid://10709789686",
	["lucide-camera-off"]="rbxassetid://10747822677",
	["lucide-car"]="rbxassetid://10709789810",
	["lucide-carrot"]="rbxassetid://10709789960",
	["lucide-cast"]="rbxassetid://10709790097",
	["lucide-charge"]="rbxassetid://10709790202",
	["lucide-check"]="rbxassetid://10709790644",
	["lucide-check-circle"]="rbxassetid://10709790387",
	["lucide-check-circle-2"]="rbxassetid://10709790298",
	["lucide-check-square"]="rbxassetid://10709790537",
	["lucide-chef-hat"]="rbxassetid://10709790757",
	["lucide-cherry"]="rbxassetid://10709790875",
	["lucide-chevron-down"]="rbxassetid://10709790948",
	["lucide-chevron-first"]="rbxassetid://10709791015",
	["lucide-chevron-last"]="rbxassetid://10709791130",
	["lucide-chevron-left"]="rbxassetid://10709791281",
	["lucide-chevron-right"]="rbxassetid://10709791437",
	["lucide-chevron-up"]="rbxassetid://10709791523",
	["lucide-chevrons-down"]="rbxassetid://10709796864",
	["lucide-chevrons-down-up"]="rbxassetid://10709791632",
	["lucide-chevrons-left"]="rbxassetid://10709797151",
	["lucide-chevrons-left-right"]="rbxassetid://10709797006",
	["lucide-chevrons-right"]="rbxassetid://10709797382",
	["lucide-chevrons-right-left"]="rbxassetid://10709797274",
	["lucide-chevrons-up"]="rbxassetid://10709797622",
	["lucide-chevrons-up-down"]="rbxassetid://10709797508",
	["lucide-chrome"]="rbxassetid://10709797725",
	["lucide-circle"]="rbxassetid://10709798174",
	["lucide-circle-dot"]="rbxassetid://10709797837",
	["lucide-circle-ellipsis"]="rbxassetid://10709797985",
	["lucide-circle-slashed"]="rbxassetid://10709798100",
	["lucide-citrus"]="rbxassetid://10709798276",
	["lucide-clapperboard"]="rbxassetid://10709798350",
	["lucide-clipboard"]="rbxassetid://10709799288",
	["lucide-clipboard-check"]="rbxassetid://10709798443",
	["lucide-clipboard-copy"]="rbxassetid://10709798574",
	["lucide-clipboard-edit"]="rbxassetid://10709798682",
	["lucide-clipboard-list"]="rbxassetid://10709798792",
	["lucide-clipboard-signature"]="rbxassetid://10709798890",
	["lucide-clipboard-type"]="rbxassetid://10709798999",
	["lucide-clipboard-x"]="rbxassetid://10709799124",
	["lucide-clock"]="rbxassetid://10709805144",
	["lucide-clock-1"]="rbxassetid://10709799535",
	["lucide-clock-10"]="rbxassetid://10709799718",
	["lucide-clock-11"]="rbxassetid://10709799818",
	["lucide-clock-12"]="rbxassetid://10709799962",
	["lucide-clock-2"]="rbxassetid://10709803876",
	["lucide-clock-3"]="rbxassetid://10709803989",
	["lucide-clock-4"]="rbxassetid://10709804164",
	["lucide-clock-5"]="rbxassetid://10709804291",
	["lucide-clock-6"]="rbxassetid://10709804435",
	["lucide-clock-7"]="rbxassetid://10709804599",
	["lucide-clock-8"]="rbxassetid://10709804784",
	["lucide-clock-9"]="rbxassetid://10709804996",
	["lucide-cloud"]="rbxassetid://10709806740",
	["lucide-cloud-cog"]="rbxassetid://10709805262",
	["lucide-cloud-drizzle"]="rbxassetid://10709805371",
	["lucide-cloud-fog"]="rbxassetid://10709805477",
	["lucide-cloud-hail"]="rbxassetid://10709805596",
	["lucide-cloud-lightning"]="rbxassetid://10709805727",
	["lucide-cloud-moon"]="rbxassetid://10709805942",
	["lucide-cloud-moon-rain"]="rbxassetid://10709805838",
	["lucide-cloud-off"]="rbxassetid://10709806060",
	["lucide-cloud-rain"]="rbxassetid://10709806277",
	["lucide-cloud-rain-wind"]="rbxassetid://10709806166",
	["lucide-cloud-snow"]="rbxassetid://10709806374",
	["lucide-cloud-sun"]="rbxassetid://10709806631",
	["lucide-cloud-sun-rain"]="rbxassetid://10709806475",
	["lucide-cloudy"]="rbxassetid://10709806859",
	["lucide-clover"]="rbxassetid://10709806995",
	["lucide-code"]="rbxassetid://10709810463",
	["lucide-code-2"]="rbxassetid://10709807111",
	["lucide-codepen"]="rbxassetid://10709810534",
	["lucide-codesandbox"]="rbxassetid://10709810676",
	["lucide-coffee"]="rbxassetid://10709810814",
	["lucide-cog"]="rbxassetid://10709810948",
	["lucide-coins"]="rbxassetid://10709811110",
	["lucide-columns"]="rbxassetid://10709811261",
	["lucide-command"]="rbxassetid://10709811365",
	["lucide-compass"]="rbxassetid://10709811445",
	["lucide-component"]="rbxassetid://10709811595",
	["lucide-concierge-bell"]="rbxassetid://10709811706",
	["lucide-connection"]="rbxassetid://10747361219",
	["lucide-contact"]="rbxassetid://10709811834",
	["lucide-contrast"]="rbxassetid://10709811939",
	["lucide-cookie"]="rbxassetid://10709812067",
	["lucide-copy"]="rbxassetid://10709812159",
	["lucide-copyleft"]="rbxassetid://10709812251",
	["lucide-copyright"]="rbxassetid://10709812311",
	["lucide-corner-down-left"]="rbxassetid://10709812396",
	["lucide-corner-down-right"]="rbxassetid://10709812485",
	["lucide-corner-left-down"]="rbxassetid://10709812632",
	["lucide-corner-left-up"]="rbxassetid://10709812784",
	["lucide-corner-right-down"]="rbxassetid://10709812939",
	["lucide-corner-right-up"]="rbxassetid://10709813094",
	["lucide-corner-up-left"]="rbxassetid://10709813185",
	["lucide-corner-up-right"]="rbxassetid://10709813281",
	["lucide-cpu"]="rbxassetid://10709813383",
	["lucide-croissant"]="rbxassetid://10709818125",
	["lucide-crop"]="rbxassetid://10709818245",
	["lucide-cross"]="rbxassetid://10709818399",
	["lucide-crosshair"]="rbxassetid://10709818534",
	["lucide-crown"]="rbxassetid://10709818626",
	["lucide-cup-soda"]="rbxassetid://10709818763",
	["lucide-curly-braces"]="rbxassetid://10709818847",
	["lucide-currency"]="rbxassetid://10709818931",
	["lucide-database"]="rbxassetid://10709818996",
	["lucide-delete"]="rbxassetid://10709819059",
	["lucide-diamond"]="rbxassetid://10709819149",
	["lucide-dice-1"]="rbxassetid://10709819266",
	["lucide-dice-2"]="rbxassetid://10709819361",
	["lucide-dice-3"]="rbxassetid://10709819508",
	["lucide-dice-4"]="rbxassetid://10709819670",
	["lucide-dice-5"]="rbxassetid://10709819801",
	["lucide-dice-6"]="rbxassetid://10709819896",
	["lucide-dices"]="rbxassetid://10723343321",
	["lucide-diff"]="rbxassetid://10723343416",
	["lucide-disc"]="rbxassetid://10723343537",
	["lucide-divide"]="rbxassetid://10723343805",
	["lucide-divide-circle"]="rbxassetid://10723343636",
	["lucide-divide-square"]="rbxassetid://10723343737",
	["lucide-dollar-sign"]="rbxassetid://10723343958",
	["lucide-download"]="rbxassetid://10723344270",
	["lucide-download-cloud"]="rbxassetid://10723344088",
	["lucide-droplet"]="rbxassetid://10723344432",
	["lucide-droplets"]="rbxassetid://10734883356",
	["lucide-drumstick"]="rbxassetid://10723344737",
	["lucide-edit"]="rbxassetid://10734883598",
	["lucide-edit-2"]="rbxassetid://10723344885",
	["lucide-edit-3"]="rbxassetid://10723345088",
	["lucide-egg"]="rbxassetid://10723345518",
	["lucide-egg-fried"]="rbxassetid://10723345347",
	["lucide-electricity"]="rbxassetid://10723345749",
	["lucide-electricity-off"]="rbxassetid://10723345643",
	["lucide-equal"]="rbxassetid://10723345990",
	["lucide-equal-not"]="rbxassetid://10723345866",
	["lucide-eraser"]="rbxassetid://10723346158",
	["lucide-euro"]="rbxassetid://10723346372",
	["lucide-expand"]="rbxassetid://10723346553",
	["lucide-external-link"]="rbxassetid://10723346684",
	["lucide-eye"]="rbxassetid://10723346959",
	["lucide-eye-off"]="rbxassetid://10723346871",
	["lucide-factory"]="rbxassetid://10723347051",
	["lucide-fan"]="rbxassetid://10723354359",
	["lucide-fast-forward"]="rbxassetid://10723354521",
	["lucide-feather"]="rbxassetid://10723354671",
	["lucide-figma"]="rbxassetid://10723354801",
	["lucide-file"]="rbxassetid://10723374641",
	["lucide-file-archive"]="rbxassetid://10723354921",
	["lucide-file-audio"]="rbxassetid://10723355148",
	["lucide-file-audio-2"]="rbxassetid://10723355026",
	["lucide-file-axis-3d"]="rbxassetid://10723355272",
	["lucide-file-badge"]="rbxassetid://10723355622",
	["lucide-file-badge-2"]="rbxassetid://10723355451",
	["lucide-file-bar-chart"]="rbxassetid://10723355887",
	["lucide-file-bar-chart-2"]="rbxassetid://10723355746",
	["lucide-file-box"]="rbxassetid://10723355989",
	["lucide-file-check"]="rbxassetid://10723356210",
	["lucide-file-check-2"]="rbxassetid://10723356100",
	["lucide-file-clock"]="rbxassetid://10723356329",
	["lucide-file-code"]="rbxassetid://10723356507",
	["lucide-file-cog"]="rbxassetid://10723356830",
	["lucide-file-cog-2"]="rbxassetid://10723356676",
	["lucide-file-diff"]="rbxassetid://10723357039",
	["lucide-file-digit"]="rbxassetid://10723357151",
	["lucide-file-down"]="rbxassetid://10723357322",
	["lucide-file-edit"]="rbxassetid://10723357495",
	["lucide-file-heart"]="rbxassetid://10723357637",
	["lucide-file-image"]="rbxassetid://10723357790",
	["lucide-file-input"]="rbxassetid://10723357933",
	["lucide-file-json"]="rbxassetid://10723364435",
	["lucide-file-json-2"]="rbxassetid://10723364361",
	["lucide-file-key"]="rbxassetid://10723364605",
	["lucide-file-key-2"]="rbxassetid://10723364515",
	["lucide-file-line-chart"]="rbxassetid://10723364725",
	["lucide-file-lock"]="rbxassetid://10723364957",
	["lucide-file-lock-2"]="rbxassetid://10723364861",
	["lucide-file-minus"]="rbxassetid://10723365254",
	["lucide-file-minus-2"]="rbxassetid://10723365086",
	["lucide-file-output"]="rbxassetid://10723365457",
	["lucide-file-pie-chart"]="rbxassetid://10723365598",
	["lucide-file-plus"]="rbxassetid://10723365877",
	["lucide-file-plus-2"]="rbxassetid://10723365766",
	["lucide-file-question"]="rbxassetid://10723365987",
	["lucide-file-scan"]="rbxassetid://10723366167",
	["lucide-file-search"]="rbxassetid://10723366550",
	["lucide-file-search-2"]="rbxassetid://10723366340",
	["lucide-file-signature"]="rbxassetid://10723366741",
	["lucide-file-spreadsheet"]="rbxassetid://10723366962",
	["lucide-file-symlink"]="rbxassetid://10723367098",
	["lucide-file-terminal"]="rbxassetid://10723367244",
	["lucide-file-text"]="rbxassetid://10723367380",
	["lucide-file-type"]="rbxassetid://10723367606",
	["lucide-file-type-2"]="rbxassetid://10723367509",
	["lucide-file-up"]="rbxassetid://10723367734",
	["lucide-file-video"]="rbxassetid://10723373884",
	["lucide-file-video-2"]="rbxassetid://10723367834",
	["lucide-file-volume"]="rbxassetid://10723374172",
	["lucide-file-volume-2"]="rbxassetid://10723374030",
	["lucide-file-warning"]="rbxassetid://10723374276",
	["lucide-file-x"]="rbxassetid://10723374544",
	["lucide-file-x-2"]="rbxassetid://10723374378",
	["lucide-files"]="rbxassetid://10723374759",
	["lucide-film"]="rbxassetid://10723374981",
	["lucide-filter"]="rbxassetid://10723375128",
	["lucide-fingerprint"]="rbxassetid://10723375250",
	["lucide-flag"]="rbxassetid://10723375890",
	["lucide-flag-off"]="rbxassetid://10723375443",
	["lucide-flag-triangle-left"]="rbxassetid://10723375608",
	["lucide-flag-triangle-right"]="rbxassetid://10723375727",
	["lucide-flame"]="rbxassetid://10723376114",
	["lucide-flashlight"]="rbxassetid://10723376471",
	["lucide-flashlight-off"]="rbxassetid://10723376365",
	["lucide-flask-conical"]="rbxassetid://10734883986",
	["lucide-flask-round"]="rbxassetid://10723376614",
	["lucide-flip-horizontal"]="rbxassetid://10723376884",
	["lucide-flip-horizontal-2"]="rbxassetid://10723376745",
	["lucide-flip-vertical"]="rbxassetid://10723377138",
	["lucide-flip-vertical-2"]="rbxassetid://10723377026",
	["lucide-flower"]="rbxassetid://10747830374",
	["lucide-flower-2"]="rbxassetid://10723377305",
	["lucide-focus"]="rbxassetid://10723377537",
	["lucide-folder"]="rbxassetid://10723387563",
	["lucide-folder-archive"]="rbxassetid://10723384478",
	["lucide-folder-check"]="rbxassetid://10723384605",
	["lucide-folder-clock"]="rbxassetid://10723384731",
	["lucide-folder-closed"]="rbxassetid://10723384893",
	["lucide-folder-cog"]="rbxassetid://10723385213",
	["lucide-folder-cog-2"]="rbxassetid://10723385036",
	["lucide-folder-down"]="rbxassetid://10723385338",
	["lucide-folder-edit"]="rbxassetid://10723385445",
	["lucide-folder-heart"]="rbxassetid://10723385545",
	["lucide-folder-input"]="rbxassetid://10723385721",
	["lucide-folder-key"]="rbxassetid://10723385848",
	["lucide-folder-lock"]="rbxassetid://10723386005",
	["lucide-folder-minus"]="rbxassetid://10723386127",
	["lucide-folder-open"]="rbxassetid://10723386277",
	["lucide-folder-output"]="rbxassetid://10723386386",
	["lucide-folder-plus"]="rbxassetid://10723386531",
	["lucide-folder-search"]="rbxassetid://10723386787",
	["lucide-folder-search-2"]="rbxassetid://10723386674",
	["lucide-folder-symlink"]="rbxassetid://10723386930",
	["lucide-folder-tree"]="rbxassetid://10723387085",
	["lucide-folder-up"]="rbxassetid://10723387265",
	["lucide-folder-x"]="rbxassetid://10723387448",
	["lucide-folders"]="rbxassetid://10723387721",
	["lucide-form-input"]="rbxassetid://10723387841",
	["lucide-forward"]="rbxassetid://10723388016",
	["lucide-frame"]="rbxassetid://10723394389",
	["lucide-framer"]="rbxassetid://10723394565",
	["lucide-frown"]="rbxassetid://10723394681",
	["lucide-fuel"]="rbxassetid://10723394846",
	["lucide-function-square"]="rbxassetid://10723395041",
	["lucide-gamepad"]="rbxassetid://10723395457",
	["lucide-gamepad-2"]="rbxassetid://10723395215",
	["lucide-gauge"]="rbxassetid://10723395708",
	["lucide-gavel"]="rbxassetid://10723395896",
	["lucide-gem"]="rbxassetid://10723396000",
	["lucide-ghost"]="rbxassetid://10723396107",
	["lucide-gift"]="rbxassetid://10723396402",
	["lucide-gift-card"]="rbxassetid://10723396225",
	["lucide-git-branch"]="rbxassetid://10723396676",
	["lucide-git-branch-plus"]="rbxassetid://10723396542",
	["lucide-git-commit"]="rbxassetid://10723396812",
	["lucide-git-compare"]="rbxassetid://10723396954",
	["lucide-git-fork"]="rbxassetid://10723397049",
	["lucide-git-merge"]="rbxassetid://10723397165",
	["lucide-git-pull-request"]="rbxassetid://10723397431",
	["lucide-git-pull-request-closed"]="rbxassetid://10723397268",
	["lucide-git-pull-request-draft"]="rbxassetid://10734884302",
	["lucide-glass"]="rbxassetid://10723397788",
	["lucide-glass-2"]="rbxassetid://10723397529",
	["lucide-glass-water"]="rbxassetid://10723397678",
	["lucide-glasses"]="rbxassetid://10723397895",
	["lucide-globe"]="rbxassetid://10723404337",
	["lucide-globe-2"]="rbxassetid://10723398002",
	["lucide-grab"]="rbxassetid://10723404472",
	["lucide-graduation-cap"]="rbxassetid://10723404691",
	["lucide-grape"]="rbxassetid://10723404822",
	["lucide-grid"]="rbxassetid://10723404936",
	["lucide-grip-horizontal"]="rbxassetid://10723405089",
	["lucide-grip-vertical"]="rbxassetid://10723405236",
	["lucide-hammer"]="rbxassetid://10723405360",
	["lucide-hand"]="rbxassetid://10723405649",
	["lucide-hand-metal"]="rbxassetid://10723405508",
	["lucide-hard-drive"]="rbxassetid://10723405749",
	["lucide-hard-hat"]="rbxassetid://10723405859",
	["lucide-hash"]="rbxassetid://10723405975",
	["lucide-haze"]="rbxassetid://10723406078",
	["lucide-headphones"]="rbxassetid://10723406165",
	["lucide-heart"]="rbxassetid://10723406885",
	["lucide-heart-crack"]="rbxassetid://10723406299",
	["lucide-heart-handshake"]="rbxassetid://10723406480",
	["lucide-heart-off"]="rbxassetid://10723406662",
	["lucide-heart-pulse"]="rbxassetid://10723406795",
	["lucide-help-circle"]="rbxassetid://10723406988",
	["lucide-hexagon"]="rbxassetid://10723407092",
	["lucide-highlighter"]="rbxassetid://10723407192",
	["lucide-history"]="rbxassetid://10723407335",
	["lucide-home"]="rbxassetid://10723407389",
	["lucide-hourglass"]="rbxassetid://10723407498",
	["lucide-ice-cream"]="rbxassetid://10723414308",
	["lucide-image"]="rbxassetid://10723415040",
	["lucide-image-minus"]="rbxassetid://10723414487",
	["lucide-image-off"]="rbxassetid://10723414677",
	["lucide-image-plus"]="rbxassetid://10723414827",
	["lucide-import"]="rbxassetid://10723415205",
	["lucide-inbox"]="rbxassetid://10723415335",
	["lucide-indent"]="rbxassetid://10723415494",
	["lucide-indian-rupee"]="rbxassetid://10723415642",
	["lucide-infinity"]="rbxassetid://10723415766",
	["lucide-info"]="rbxassetid://10723415903",
	["lucide-inspect"]="rbxassetid://10723416057",
	["lucide-italic"]="rbxassetid://10723416195",
	["lucide-japanese-yen"]="rbxassetid://10723416363",
	["lucide-joystick"]="rbxassetid://10723416527",
	["lucide-key"]="rbxassetid://10723416652",
	["lucide-keyboard"]="rbxassetid://10723416765",
	["lucide-lamp"]="rbxassetid://10723417513",
	["lucide-lamp-ceiling"]="rbxassetid://10723416922",
	["lucide-lamp-desk"]="rbxassetid://10723417016",
	["lucide-lamp-floor"]="rbxassetid://10723417131",
	["lucide-lamp-wall-down"]="rbxassetid://10723417240",
	["lucide-lamp-wall-up"]="rbxassetid://10723417356",
	["lucide-landmark"]="rbxassetid://10723417608",
	["lucide-languages"]="rbxassetid://10723417703",
	["lucide-laptop"]="rbxassetid://10723423881",
	["lucide-laptop-2"]="rbxassetid://10723417797",
	["lucide-lasso"]="rbxassetid://10723424235",
	["lucide-lasso-select"]="rbxassetid://10723424058",
	["lucide-laugh"]="rbxassetid://10723424372",
	["lucide-layers"]="rbxassetid://10723424505",
	["lucide-layout"]="rbxassetid://10723425376",
	["lucide-layout-dashboard"]="rbxassetid://10723424646",
	["lucide-layout-grid"]="rbxassetid://10723424838",
	["lucide-layout-list"]="rbxassetid://10723424963",
	["lucide-layout-template"]="rbxassetid://10723425187",
	["lucide-leaf"]="rbxassetid://10723425539",
	["lucide-library"]="rbxassetid://10723425615",
	["lucide-life-buoy"]="rbxassetid://10723425685",
	["lucide-lightbulb"]="rbxassetid://10723425852",
	["lucide-lightbulb-off"]="rbxassetid://10723425762",
	["lucide-line-chart"]="rbxassetid://10723426393",
	["lucide-link"]="rbxassetid://10723426722",
	["lucide-link-2"]="rbxassetid://10723426595",
	["lucide-link-2-off"]="rbxassetid://10723426513",
	["lucide-list"]="rbxassetid://10723433811",
	["lucide-list-checks"]="rbxassetid://10734884548",
	["lucide-list-end"]="rbxassetid://10723426886",
	["lucide-list-minus"]="rbxassetid://10723426986",
	["lucide-list-music"]="rbxassetid://10723427081",
	["lucide-list-ordered"]="rbxassetid://10723427199",
	["lucide-list-plus"]="rbxassetid://10723427334",
	["lucide-list-start"]="rbxassetid://10723427494",
	["lucide-list-video"]="rbxassetid://10723427619",
	["lucide-list-x"]="rbxassetid://10723433655",
	["lucide-loader"]="rbxassetid://10723434070",
	["lucide-loader-2"]="rbxassetid://10723433935",
	["lucide-locate"]="rbxassetid://10723434557",
	["lucide-locate-fixed"]="rbxassetid://10723434236",
	["lucide-locate-off"]="rbxassetid://10723434379",
	["lucide-lock"]="rbxassetid://10723434711",
	["lucide-log-in"]="rbxassetid://10723434830",
	["lucide-log-out"]="rbxassetid://10723434906",
	["lucide-luggage"]="rbxassetid://10723434993",
	["lucide-magnet"]="rbxassetid://10723435069",
	["lucide-mail"]="rbxassetid://10734885430",
	["lucide-mail-check"]="rbxassetid://10723435182",
	["lucide-mail-minus"]="rbxassetid://10723435261",
	["lucide-mail-open"]="rbxassetid://10723435342",
	["lucide-mail-plus"]="rbxassetid://10723435443",
	["lucide-mail-question"]="rbxassetid://10723435515",
	["lucide-mail-search"]="rbxassetid://10734884739",
	["lucide-mail-warning"]="rbxassetid://10734885015",
	["lucide-mail-x"]="rbxassetid://10734885247",
	["lucide-mails"]="rbxassetid://10734885614",
	["lucide-map"]="rbxassetid://10734886202",
	["lucide-map-pin"]="rbxassetid://10734886004",
	["lucide-map-pin-off"]="rbxassetid://10734885803",
	["lucide-maximize"]="rbxassetid://10734886735",
	["lucide-maximize-2"]="rbxassetid://10734886496",
	["lucide-medal"]="rbxassetid://10734887072",
	["lucide-megaphone"]="rbxassetid://10734887454",
	["lucide-megaphone-off"]="rbxassetid://10734887311",
	["lucide-meh"]="rbxassetid://10734887603",
	["lucide-menu"]="rbxassetid://10734887784",
	["lucide-message-circle"]="rbxassetid://10734888000",
	["lucide-message-square"]="rbxassetid://10734888228",
	["lucide-mic"]="rbxassetid://10734888864",
	["lucide-mic-2"]="rbxassetid://10734888430",
	["lucide-mic-off"]="rbxassetid://10734888646",
	["lucide-microscope"]="rbxassetid://10734889106",
	["lucide-microwave"]="rbxassetid://10734895076",
	["lucide-milestone"]="rbxassetid://10734895310",
	["lucide-minimize"]="rbxassetid://10734895698",
	["lucide-minimize-2"]="rbxassetid://10734895530",
	["lucide-minus"]="rbxassetid://10734896206",
	["lucide-minus-circle"]="rbxassetid://10734895856",
	["lucide-minus-square"]="rbxassetid://10734896029",
	["lucide-monitor"]="rbxassetid://10734896881",
	["lucide-monitor-off"]="rbxassetid://10734896360",
	["lucide-monitor-speaker"]="rbxassetid://10734896512",
	["lucide-moon"]="rbxassetid://10734897102",
	["lucide-more-horizontal"]="rbxassetid://10734897250",
	["lucide-more-vertical"]="rbxassetid://10734897387",
	["lucide-mountain"]="rbxassetid://10734897956",
	["lucide-mountain-snow"]="rbxassetid://10734897665",
	["lucide-mouse"]="rbxassetid://10734898592",
	["lucide-mouse-pointer"]="rbxassetid://10734898476",
	["lucide-mouse-pointer-2"]="rbxassetid://10734898194",
	["lucide-mouse-pointer-click"]="rbxassetid://10734898355",
	["lucide-move"]="rbxassetid://10734900011",
	["lucide-move-3d"]="rbxassetid://10734898756",
	["lucide-move-diagonal"]="rbxassetid://10734899164",
	["lucide-move-diagonal-2"]="rbxassetid://10734898934",
	["lucide-move-horizontal"]="rbxassetid://10734899414",
	["lucide-move-vertical"]="rbxassetid://10734899821",
	["lucide-music"]="rbxassetid://10734905958",
	["lucide-music-2"]="rbxassetid://10734900215",
	["lucide-music-3"]="rbxassetid://10734905665",
	["lucide-music-4"]="rbxassetid://10734905823",
	["lucide-navigation"]="rbxassetid://10734906744",
	["lucide-navigation-2"]="rbxassetid://10734906332",
	["lucide-navigation-2-off"]="rbxassetid://10734906144",
	["lucide-navigation-off"]="rbxassetid://10734906580",
	["lucide-network"]="rbxassetid://10734906975",
	["lucide-newspaper"]="rbxassetid://10734907168",
	["lucide-octagon"]="rbxassetid://10734907361",
	["lucide-option"]="rbxassetid://10734907649",
	["lucide-outdent"]="rbxassetid://10734907933",
	["lucide-package"]="rbxassetid://10734909540",
	["lucide-package-2"]="rbxassetid://10734908151",
	["lucide-package-check"]="rbxassetid://10734908384",
	["lucide-package-minus"]="rbxassetid://10734908626",
	["lucide-package-open"]="rbxassetid://10734908793",
	["lucide-package-plus"]="rbxassetid://10734909016",
	["lucide-package-search"]="rbxassetid://10734909196",
	["lucide-package-x"]="rbxassetid://10734909375",
	["lucide-paint-bucket"]="rbxassetid://10734909847",
	["lucide-paintbrush"]="rbxassetid://10734910187",
	["lucide-paintbrush-2"]="rbxassetid://10734910030",
	["lucide-palette"]="rbxassetid://10734910430",
	["lucide-palmtree"]="rbxassetid://10734910680",
	["lucide-paperclip"]="rbxassetid://10734910927",
	["lucide-party-popper"]="rbxassetid://10734918735",
	["lucide-pause"]="rbxassetid://10734919336",
	["lucide-pause-circle"]="rbxassetid://10735024209",
	["lucide-pause-octagon"]="rbxassetid://10734919143",
	["lucide-pen-tool"]="rbxassetid://10734919503",
	["lucide-pencil"]="rbxassetid://10734919691",
	["lucide-percent"]="rbxassetid://10734919919",
	["lucide-person-standing"]="rbxassetid://10734920149",
	["lucide-phone"]="rbxassetid://10734921524",
	["lucide-phone-call"]="rbxassetid://10734920305",
	["lucide-phone-forwarded"]="rbxassetid://10734920508",
	["lucide-phone-incoming"]="rbxassetid://10734920694",
	["lucide-phone-missed"]="rbxassetid://10734920845",
	["lucide-phone-off"]="rbxassetid://10734921077",
	["lucide-phone-outgoing"]="rbxassetid://10734921288",
	["lucide-pie-chart"]="rbxassetid://10734921727",
	["lucide-piggy-bank"]="rbxassetid://10734921935",
	["lucide-pin"]="rbxassetid://10734922324",
	["lucide-pin-off"]="rbxassetid://10734922180",
	["lucide-pipette"]="rbxassetid://10734922497",
	["lucide-pizza"]="rbxassetid://10734922774",
	["lucide-plane"]="rbxassetid://10734922971",
	["lucide-play"]="rbxassetid://10734923549",
	["lucide-play-circle"]="rbxassetid://10734923214",
	["lucide-plus"]="rbxassetid://10734924532",
	["lucide-plus-circle"]="rbxassetid://10734923868",
	["lucide-plus-square"]="rbxassetid://10734924219",
	["lucide-podcast"]="rbxassetid://10734929553",
	["lucide-pointer"]="rbxassetid://10734929723",
	["lucide-pound-sterling"]="rbxassetid://10734929981",
	["lucide-power"]="rbxassetid://10734930466",
	["lucide-power-off"]="rbxassetid://10734930257",
	["lucide-printer"]="rbxassetid://10734930632",
	["lucide-puzzle"]="rbxassetid://10734930886",
	["lucide-quote"]="rbxassetid://10734931234",
	["lucide-radio"]="rbxassetid://10734931596",
	["lucide-radio-receiver"]="rbxassetid://10734931402",
	["lucide-rectangle-horizontal"]="rbxassetid://10734931777",
	["lucide-rectangle-vertical"]="rbxassetid://10734932081",
	["lucide-recycle"]="rbxassetid://10734932295",
	["lucide-redo"]="rbxassetid://10734932822",
	["lucide-redo-2"]="rbxassetid://10734932586",
	["lucide-refresh-ccw"]="rbxassetid://10734933056",
	["lucide-refresh-cw"]="rbxassetid://10734933222",
	["lucide-refrigerator"]="rbxassetid://10734933465",
	["lucide-regex"]="rbxassetid://10734933655",
	["lucide-repeat"]="rbxassetid://10734933966",
	["lucide-repeat-1"]="rbxassetid://10734933826",
	["lucide-reply"]="rbxassetid://10734934252",
	["lucide-reply-all"]="rbxassetid://10734934132",
	["lucide-rewind"]="rbxassetid://10734934347",
	["lucide-rocket"]="rbxassetid://10734934585",
	["lucide-rocking-chair"]="rbxassetid://10734939942",
	["lucide-rotate-3d"]="rbxassetid://10734940107",
	["lucide-rotate-ccw"]="rbxassetid://10734940376",
	["lucide-rotate-cw"]="rbxassetid://10734940654",
	["lucide-rss"]="rbxassetid://10734940825",
	["lucide-ruler"]="rbxassetid://10734941018",
	["lucide-russian-ruble"]="rbxassetid://10734941199",
	["lucide-sailboat"]="rbxassetid://10734941354",
	["lucide-save"]="rbxassetid://10734941499",
	["lucide-scale"]="rbxassetid://10734941912",
	["lucide-scale-3d"]="rbxassetid://10734941739",
	["lucide-scaling"]="rbxassetid://10734942072",
	["lucide-scan"]="rbxassetid://10734942565",
	["lucide-scan-face"]="rbxassetid://10734942198",
	["lucide-scan-line"]="rbxassetid://10734942351",
	["lucide-scissors"]="rbxassetid://10734942778",
	["lucide-screen-share"]="rbxassetid://10734943193",
	["lucide-screen-share-off"]="rbxassetid://10734942967",
	["lucide-scroll"]="rbxassetid://10734943448",
	["lucide-search"]="rbxassetid://10734943674",
	["lucide-send"]="rbxassetid://10734943902",
	["lucide-separator-horizontal"]="rbxassetid://10734944115",
	["lucide-separator-vertical"]="rbxassetid://10734944326",
	["lucide-server"]="rbxassetid://10734949856",
	["lucide-server-cog"]="rbxassetid://10734944444",
	["lucide-server-crash"]="rbxassetid://10734944554",
	["lucide-server-off"]="rbxassetid://10734944668",
	["lucide-settings"]="rbxassetid://10734950309",
	["lucide-settings-2"]="rbxassetid://10734950020",
	["lucide-share"]="rbxassetid://10734950813",
	["lucide-share-2"]="rbxassetid://10734950553",
	["lucide-sheet"]="rbxassetid://10734951038",
	["lucide-shield"]="rbxassetid://10734951847",
	["lucide-shield-alert"]="rbxassetid://10734951173",
	["lucide-shield-check"]="rbxassetid://10734951367",
	["lucide-shield-close"]="rbxassetid://10734951535",
	["lucide-shield-off"]="rbxassetid://10734951684",
	["lucide-shirt"]="rbxassetid://10734952036",
	["lucide-shopping-bag"]="rbxassetid://10734952273",
	["lucide-shopping-cart"]="rbxassetid://10734952479",
	["lucide-shovel"]="rbxassetid://10734952773",
	["lucide-shower-head"]="rbxassetid://10734952942",
	["lucide-shrink"]="rbxassetid://10734953073",
	["lucide-shrub"]="rbxassetid://10734953241",
	["lucide-shuffle"]="rbxassetid://10734953451",
	["lucide-sidebar"]="rbxassetid://10734954301",
	["lucide-sidebar-close"]="rbxassetid://10734953715",
	["lucide-sidebar-open"]="rbxassetid://10734954000",
	["lucide-sigma"]="rbxassetid://10734954538",
	["lucide-signal"]="rbxassetid://10734961133",
	["lucide-signal-high"]="rbxassetid://10734954807",
	["lucide-signal-low"]="rbxassetid://10734955080",
	["lucide-signal-medium"]="rbxassetid://10734955336",
	["lucide-signal-zero"]="rbxassetid://10734960878",
	["lucide-siren"]="rbxassetid://10734961284",
	["lucide-skip-back"]="rbxassetid://10734961526",
	["lucide-skip-forward"]="rbxassetid://10734961809",
	["lucide-skull"]="rbxassetid://10734962068",
	["lucide-slack"]="rbxassetid://10734962339",
	["lucide-slash"]="rbxassetid://10734962600",
	["lucide-slice"]="rbxassetid://10734963024",
	["lucide-sliders"]="rbxassetid://10734963400",
	["lucide-sliders-horizontal"]="rbxassetid://10734963191",
	["lucide-smartphone"]="rbxassetid://10734963940",
	["lucide-smartphone-charging"]="rbxassetid://10734963671",
	["lucide-smile"]="rbxassetid://10734964441",
	["lucide-smile-plus"]="rbxassetid://10734964188",
	["lucide-snowflake"]="rbxassetid://10734964600",
	["lucide-sofa"]="rbxassetid://10734964852",
	["lucide-sort-asc"]="rbxassetid://10734965115",
	["lucide-sort-desc"]="rbxassetid://10734965287",
	["lucide-speaker"]="rbxassetid://10734965419",
	["lucide-sprout"]="rbxassetid://10734965572",
	["lucide-square"]="rbxassetid://10734965702",
	["lucide-star"]="rbxassetid://10734966248",
	["lucide-star-half"]="rbxassetid://10734965897",
	["lucide-star-off"]="rbxassetid://10734966097",
	["lucide-stethoscope"]="rbxassetid://10734966384",
	["lucide-sticker"]="rbxassetid://10734972234",
	["lucide-sticky-note"]="rbxassetid://10734972463",
	["lucide-stop-circle"]="rbxassetid://10734972621",
	["lucide-stretch-horizontal"]="rbxassetid://10734972862",
	["lucide-stretch-vertical"]="rbxassetid://10734973130",
	["lucide-strikethrough"]="rbxassetid://10734973290",
	["lucide-subscript"]="rbxassetid://10734973457",
	["lucide-sun"]="rbxassetid://10734974297",
	["lucide-sun-dim"]="rbxassetid://10734973645",
	["lucide-sun-medium"]="rbxassetid://10734973778",
	["lucide-sun-moon"]="rbxassetid://10734973999",
	["lucide-sun-snow"]="rbxassetid://10734974130",
	["lucide-sunrise"]="rbxassetid://10734974522",
	["lucide-sunset"]="rbxassetid://10734974689",
	["lucide-superscript"]="rbxassetid://10734974850",
	["lucide-swiss-franc"]="rbxassetid://10734975024",
	["lucide-switch-camera"]="rbxassetid://10734975214",
	["lucide-sword"]="rbxassetid://10734975486",
	["lucide-swords"]="rbxassetid://10734975692",
	["lucide-syringe"]="rbxassetid://10734975932",
	["lucide-table"]="rbxassetid://10734976230",
	["lucide-table-2"]="rbxassetid://10734976097",
	["lucide-tablet"]="rbxassetid://10734976394",
	["lucide-tag"]="rbxassetid://10734976528",
	["lucide-tags"]="rbxassetid://10734976739",
	["lucide-target"]="rbxassetid://10734977012",
	["lucide-tent"]="rbxassetid://10734981750",
	["lucide-terminal"]="rbxassetid://10734982144",
	["lucide-terminal-square"]="rbxassetid://10734981995",
	["lucide-text-cursor"]="rbxassetid://10734982395",
	["lucide-text-cursor-input"]="rbxassetid://10734982297",
	["lucide-thermometer"]="rbxassetid://10734983134",
	["lucide-thermometer-snowflake"]="rbxassetid://10734982571",
	["lucide-thermometer-sun"]="rbxassetid://10734982771",
	["lucide-thumbs-down"]="rbxassetid://10734983359",
	["lucide-thumbs-up"]="rbxassetid://10734983629",
	["lucide-ticket"]="rbxassetid://10734983868",
	["lucide-timer"]="rbxassetid://10734984606",
	["lucide-timer-off"]="rbxassetid://10734984138",
	["lucide-timer-reset"]="rbxassetid://10734984355",
	["lucide-toggle-left"]="rbxassetid://10734984834",
	["lucide-toggle-right"]="rbxassetid://10734985040",
	["lucide-tornado"]="rbxassetid://10734985247",
	["lucide-toy-brick"]="rbxassetid://10747361919",
	["lucide-train"]="rbxassetid://10747362105",
	["lucide-trash"]="rbxassetid://10747362393",
	["lucide-trash-2"]="rbxassetid://10747362241",
	["lucide-tree-deciduous"]="rbxassetid://10747362534",
	["lucide-tree-pine"]="rbxassetid://10747362748",
	["lucide-trees"]="rbxassetid://10747363016",
	["lucide-trending-down"]="rbxassetid://10747363205",
	["lucide-trending-up"]="rbxassetid://10747363465",
	["lucide-triangle"]="rbxassetid://10747363621",
	["lucide-trophy"]="rbxassetid://10747363809",
	["lucide-truck"]="rbxassetid://10747364031",
	["lucide-tv"]="rbxassetid://10747364593",
	["lucide-tv-2"]="rbxassetid://10747364302",
	["lucide-type"]="rbxassetid://10747364761",
	["lucide-umbrella"]="rbxassetid://10747364971",
	["lucide-underline"]="rbxassetid://10747365191",
	["lucide-undo"]="rbxassetid://10747365484",
	["lucide-undo-2"]="rbxassetid://10747365359",
	["lucide-unlink"]="rbxassetid://10747365771",
	["lucide-unlink-2"]="rbxassetid://10747397871",
	["lucide-unlock"]="rbxassetid://10747366027",
	["lucide-upload"]="rbxassetid://10747366434",
	["lucide-upload-cloud"]="rbxassetid://10747366266",
	["lucide-usb"]="rbxassetid://10747366606",
	["lucide-user"]="rbxassetid://10747373176",
	["lucide-user-check"]="rbxassetid://10747371901",
	["lucide-user-cog"]="rbxassetid://10747372167",
	["lucide-user-minus"]="rbxassetid://10747372346",
	["lucide-user-plus"]="rbxassetid://10747372702",
	["lucide-user-x"]="rbxassetid://10747372992",
	["lucide-users"]="rbxassetid://10747373426",
	["lucide-utensils"]="rbxassetid://10747373821",
	["lucide-utensils-crossed"]="rbxassetid://10747373629",
	["lucide-venetian-mask"]="rbxassetid://10747374003",
	["lucide-verified"]="rbxassetid://10747374131",
	["lucide-vibrate"]="rbxassetid://10747374489",
	["lucide-vibrate-off"]="rbxassetid://10747374269",
	["lucide-video"]="rbxassetid://10747374938",
	["lucide-video-off"]="rbxassetid://10747374721",
	["lucide-view"]="rbxassetid://10747375132",
	["lucide-voicemail"]="rbxassetid://10747375281",
	["lucide-volume"]="rbxassetid://10747376008",
	["lucide-volume-1"]="rbxassetid://10747375450",
	["lucide-volume-2"]="rbxassetid://10747375679",
	["lucide-volume-x"]="rbxassetid://10747375880",
	["lucide-wallet"]="rbxassetid://10747376205",
	["lucide-wand"]="rbxassetid://10747376565",
	["lucide-wand-2"]="rbxassetid://10747376349",
	["lucide-watch"]="rbxassetid://10747376722",
	["lucide-waves"]="rbxassetid://10747376931",
	["lucide-webcam"]="rbxassetid://10747381992",
	["lucide-wifi"]="rbxassetid://10747382504",
	["lucide-wifi-off"]="rbxassetid://10747382268",
	["lucide-wind"]="rbxassetid://10747382750",
	["lucide-wrap-text"]="rbxassetid://10747383065",
	["lucide-wrench"]="rbxassetid://10747383470",
	["lucide-x"]="rbxassetid://10747384394",
	["lucide-x-circle"]="rbxassetid://10747383819",
	["lucide-x-octagon"]="rbxassetid://10747384037",
	["lucide-x-square"]="rbxassetid://10747384217",
	["lucide-zoom-in"]="rbxassetid://10747384552",
	["lucide-zoom-out"]="rbxassetid://10747384679",
}
local function RI(icon)
	if not icon then return nil end
	if type(icon)=="number" then return "rbxassetid://"..tostring(icon) end
	if Icons and Icons[icon] then return Icons[icon] end
	return icon
end
local function RK(k)
	if k==nil then return nil end
	if type(k)=="string" then
		local ok,r=pcall(function()return Enum.KeyCode[k]end)
		if ok and r then return r end
		return nil
	end
	return k
end
local T={
	Sidebar  =Color3.fromRGB(19,19,19),
	Content  =Color3.fromRGB(11,11,11),
	GroupBG  =Color3.fromRGB(22,22,22),
	GroupHead=Color3.fromRGB(19,19,19),
	Item     =Color3.fromRGB(36,36,36),
	ItemHover=Color3.fromRGB(46,46,46),
	Accent   =Color3.fromHex("#ff2d79"),
	AccentFg =Color3.fromHex("#cc2260"),
	Border      =Color3.fromRGB(30,30,30),
	Text   =Color3.fromRGB(220,220,228),
	Muted  =Color3.fromRGB(125,125,138),
	Label  =Color3.fromRGB(82,82,95),
	ScrollBar=Color3.fromRGB(50,50,58),
	White    =Color3.fromRGB(255,255,255),
	ToggleOff=Color3.fromRGB(36,36,42),
	ToggleOn =Color3.fromHex("#ff2d79"),
	LoadBG   =Color3.fromRGB(9,9,9),
	Black    =Color3.fromRGB(0,0,0),
	Shadow   =Color3.fromRGB(0,0,0),
}
local F={Body=Enum.Font.GothamMedium,Bold=Enum.Font.GothamBold}
local function New(class,props)
	local obj=Instance.new(class)
	for k,v in pairs(props) do if k~="Parent" then obj[k]=v end end
	if props.Parent then obj.Parent=props.Parent end
	return obj
end
local function Tween(obj,goal,dur,style)
	TS:Create(obj,TweenInfo.new(dur or 0.5,style or Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),goal):Play()
end
local function TweenFast(obj,goal,dur)
	TS:Create(obj,TweenInfo.new(dur or 0.16,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),goal):Play()
end
local function Corner(p,r)return New("UICorner",{CornerRadius=UDim.new(0,r or 8),Parent=p})end
local function HSVtoC3(h,s,v)return Color3.fromHSV(h/360,s,v)end
local function C3toHSV(c)local h,s,v=Color3.toHSV(c);return h*360,s,v end
local function C3toHex(c)return string.format("%02X%02X%02X",math.floor(c.R*255+.5),math.floor(c.G*255+.5),math.floor(c.B*255+.5))end
local function HextoC3(hex)
	hex=hex:gsub("#","")
	if #hex==3 then hex=hex:sub(1,1):rep(2)..hex:sub(2,2):rep(2)..hex:sub(3,3):rep(2)end
	if #hex~=6 then return nil end
	local r,g,b=tonumber(hex:sub(1,2),16),tonumber(hex:sub(3,4),16),tonumber(hex:sub(5,6),16)
	if not(r and g and b)then return nil end
	return Color3.fromRGB(r,g,b)
end
local KR={}
local function RegKey(k)if k then KR[k]=true end end
local function UnregKey(k)if k then KR[k]=nil end end
local function KeyUsed(k)return k and KR[k]==true end

-- Cascade boxes : registre global
local _BoxList = {}
local _BoxReady = false
local function _RegBox(cg, wrap, side)
	if _BoxReady then return end
	table.insert(_BoxList, {cg=cg, wrap=wrap, side=side or "center"})
end
local function _CascadeBoxes()
	_BoxReady = true
	for i, e in ipairs(_BoxList) do
		task.delay((i-1)*0.07, function()
			if not e.cg or not e.cg.Parent then return end
			TS:Create(e.cg, TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {GroupTransparency=0}):Play()
			TS:Create(e.wrap, TweenInfo.new(0.65, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position=UDim2.fromOffset(0,0)}):Play()

		end)
	end
	_BoxList = {}
end

local _CD="MyScript_Configs"
local function _ED()
	if isfolder and not isfolder(_CD) then
		if makefolder then pcall(makefolder,_CD) end
	end
end
local function _CP(name)return _CD.."/"..name..".json" end
local function _LC()
	_ED()
	if not listfiles then return {} end
	local ok,files=pcall(listfiles,_CD)
	if not ok then return {} end
	local names={}
	for _,f in ipairs(files) do
		local n=tostring(f):match("([^/\\]+)%.json$")
		if n then table.insert(names,n) end
	end
	table.sort(names)
	return names
end
local _Reg={}
local function Reg(k,o)if o then _Reg[k]=o end end
local function _Ser()
	local data={}
	for k,o in pairs(_Reg) do
		local block={}
		local v=o:Get()
		if k:sub(1,6)=="color_" then
			block.value=v and C3toHex(v) or "000000"
		elseif k:sub(1,8)=="keybind_" then
			block.value=v and v.Name or ""
		elseif type(v)=="table" then
			local arr={};for _,s in ipairs(v) do table.insert(arr,s)end
			block.value=arr
		else
			block.value=v
		end
		if o.GetKey then
			local bk=o:GetKey()
			block.key=bk and bk.Name or ""
		end
		data[k]=block
	end
	return data
end
local function _Des(data)
	for k,block in pairs(data) do
		local o=_Reg[k]
		local v=(type(block)=="table" and block.value~=nil) and block.value or block
		if o then
			if k:sub(1,6)=="color_" then
				local c=HextoC3(tostring(v));if c then o:Set(c) end
			elseif k:sub(1,8)=="keybind_" then
				o:Set(v~="" and v or nil)
			else
				o:Set(v)
			end
			if o.SetKey and type(block)=="table" and block.key then
				o:SetKey(block.key~="" and block.key or nil)
			end
		end
	end
end

local function _ALP()return _CD.."/_autoload" end
local function _GetAL()
	if not isfile or not isfile(_ALP()) then return nil end
	local ok,v=pcall(readfile,_ALP())
	if not ok then return nil end
	v=v:match("^%s*(.-)%s*$")
	return v~="" and v or nil
end
local function _SetAL(name)
	_ED()
	if writefile then pcall(writefile,_ALP(),name) end
end
local function _ClearAL()
	local delFn=delfile or deletefile
	if delFn and isfile and isfile(_ALP()) then pcall(delFn,_ALP()) end
end
local _nGui,_nList,_nCount=nil,nil,0
local function EnsureNotif()
	if _nGui and _nGui.Parent then return end
	_nGui=New("ScreenGui",{Name=_NN,ResetOnSpawn=false,DisplayOrder=10000,Parent=GetContainer()})
	ProtectGui(_nGui)
	_nList=New("Frame",{Size=UDim2.fromOffset(260,0),Position=UDim2.new(1,-270,1,-10),AnchorPoint=Vector2.new(0,1),BackgroundTransparency=1,AutomaticSize=Enum.AutomaticSize.Y,Parent=_nGui})
	local l=Instance.new("UIListLayout");l.SortOrder=Enum.SortOrder.LayoutOrder;l.VerticalAlignment=Enum.VerticalAlignment.Bottom;l.Padding=UDim.new(0,6);l.Parent=_nList
end
local function Notify(title,msg,dur)
	dur=dur or 3;EnsureNotif();_nCount=_nCount+1
	local w=New("Frame",{Size=UDim2.fromOffset(260,56),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=_nCount,Parent=_nList})
	local c=New("Frame",{Size=UDim2.fromOffset(260,56),Position=UDim2.fromOffset(270,0),BackgroundColor3=T.GroupHead,BorderSizePixel=0,Parent=w})
	Corner(c,8)
	New("TextLabel",{Size=UDim2.new(1,-20,0,16),Position=UDim2.new(0,10,0,8),BackgroundTransparency=1,Text=title,TextColor3=T.Text,TextSize=12,Font=F.Bold,TextXAlignment=Enum.TextXAlignment.Left,Parent=c})
	New("TextLabel",{Size=UDim2.new(1,-20,0,14),Position=UDim2.new(0,10,0,26),BackgroundTransparency=1,Text=msg,TextColor3=T.Muted,TextSize=11,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Left,Parent=c})
	-- Timer bar : deux moitiés qui se réduisent vers le centre
	local PAD_T=8
	local halfW=math.floor((260-PAD_T*2)/2)
	local barL=New("Frame",{Size=UDim2.fromOffset(halfW,2),Position=UDim2.fromOffset(PAD_T,48),BackgroundColor3=T.Accent,BorderSizePixel=0,ZIndex=5,Parent=c});Corner(barL,100)
	local barR=New("Frame",{Size=UDim2.fromOffset(halfW,2),Position=UDim2.fromOffset(PAD_T+halfW,48),BackgroundColor3=T.Accent,BorderSizePixel=0,ZIndex=5,Parent=c});Corner(barR,100)
	Tween(c,{Position=UDim2.fromOffset(0,0)},0.3,Enum.EasingStyle.Quint)
	task.delay(0.3, function()
		local info=TweenInfo.new(dur-0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
		TS:Create(barL, info, {Size=UDim2.fromOffset(0,2), Position=UDim2.fromOffset(PAD_T+halfW,48)}):Play()
		TS:Create(barR, info, {Size=UDim2.fromOffset(0,2)}):Play()
	end)
	task.delay(dur,function()Tween(c,{Position=UDim2.fromOffset(270,0)},0.35,Enum.EasingStyle.Quint);task.delay(0.4,function()w:Destroy()end)end)
end


-- Helper : attache AddNotify à n'importe quel objet widget
local function _ParseDur(d)
	if type(d)=="string" then return tonumber(d:match("[%d%.]+")) or 3 end
	return d or 3
end
local function _AttachNotify(obj)
	obj._notifyCfg = nil
	function obj:AddNotify(cfg)
		self._notifyCfg = cfg or {}
	end
	function obj:_FireNotify()
		if not self._notifyCfg then return end
		local c = self._notifyCfg
		Notify(c.Title or "", c.Description or "", _ParseDur(c.Duration))
	end
	return obj
end

local GB={};GB.__index=GB
function GB._new(parent,cfg,sizeX,popover)
	local self=setmetatable({},GB)
	if type(cfg)=="string" then cfg={Name=cfg} end;cfg=cfg or {}
	local side=cfg.side or "center"
	-- Offset de depart selon le type/cote de la box
	local offX,offY
	if side=="left" then
		offX=-50;offY=-50  -- coin haut-gauche, diagonale 45 deg
	elseif side=="right" then
		offX=50;offY=-50   -- coin haut-droit, diagonale 45 deg
	else
		offX=0;offY=-60    -- centre, tombe du haut
	end
	-- cg : conteneur dans le UIListLayout, invisible + clip
	local cg=New("CanvasGroup",{
		Name=RN(8),Size=sizeX,AutomaticSize=Enum.AutomaticSize.Y,
		BackgroundTransparency=1,GroupTransparency=1,
		BorderSizePixel=0,ZIndex=3,Parent=parent
	})
	-- wrap : card moderne, fond très subtil, coins arrondis
	local wrap=New("Frame",{
		Name=RN(8),Size=UDim2.fromScale(1,1),AutomaticSize=Enum.AutomaticSize.Y,
		Position=UDim2.fromOffset(offX,offY),
		BackgroundColor3=T.GroupBG,BackgroundTransparency=0.04,
		BorderSizePixel=0,ZIndex=3,Parent=cg
	})
	Corner(wrap,10)
	Corner(cg,10)
	-- Barre accent verticale à gauche (pill)
	local accentBar=New("Frame",{
		Size=UDim2.fromOffset(3,16),Position=UDim2.new(0,0,0,10),
		AnchorPoint=Vector2.new(0,0),
		BackgroundColor3=T.Accent,BorderSizePixel=0,ZIndex=5,Parent=wrap
	})
	Corner(accentBar,100)
	-- Titre compact inline en haut à gauche (décalé pour la barre)
	local hasName=cfg.Name and cfg.Name~=""
	if hasName then
		New("TextLabel",{
			Size=UDim2.new(1,-24,0,20),Position=UDim2.new(0,12,0,7),
			BackgroundTransparency=1,Text=string.upper(cfg.Name),
			TextColor3=T.Muted,TextSize=10,Font=F.Bold,
			TextXAlignment=Enum.TextXAlignment.Left,
			ZIndex=4,Parent=wrap
		})
	end
	-- Micro-divider ultra-fin sous le titre
	if hasName then
		New("Frame",{
			Size=UDim2.new(1,-12,0,1),Position=UDim2.new(0,6,0,27),
			BackgroundColor3=T.Border,BackgroundTransparency=0.3,
			BorderSizePixel=0,ZIndex=4,Parent=wrap
		})
	end
	local topOffset=hasName and 30 or 8
	local body=New("Frame",{
		Name=RN(8),Size=UDim2.new(1,0,0,0),
		Position=UDim2.new(0,0,0,topOffset),
		AutomaticSize=Enum.AutomaticSize.Y,
		BackgroundTransparency=1,BorderSizePixel=0,ZIndex=4,Parent=wrap
	})
	New("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,5),Parent=body})
	New("UIPadding",{
		PaddingTop=UDim.new(0,6),PaddingBottom=UDim.new(0,8),
		PaddingLeft=UDim.new(0,12),PaddingRight=UDim.new(0,10),Parent=body
	})
	self._body=body;self._wrap=wrap;self._cg=cg;self._popover=popover
	_RegBox(cg,wrap,side)
	return self
end


function GB:AddColorPicker(cfg)
	cfg=cfg or {}
	local callback=cfg.Callback or function()end
	local hasAlpha=cfg.Transparency==true
	local curColor=cfg.Default or Color3.fromRGB(212,170,80)
	local curAlpha=cfg.DefaultTransparency or 0  -- 0 = opaque, 1 = transparent
	local prevColor=curColor;local open=false
	local PAD,TAB_H,HUE_W,SV_H,SV_W,GAP,PREV_H=8,28,14,150,246,6,22
	-- Si alpha activé : on ajoute une barre alpha (même largeur que hueBar) et un GAP supplémentaire
	local ALPHA_W=HUE_W
	local extraW = hasAlpha and (GAP+ALPHA_W) or 0
	local PW=PAD*2+SV_W+GAP+HUE_W+extraW
	local row=New("Frame",{Size=UDim2.new(1,0,0,24),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=self._body})
	New("TextLabel",{Size=UDim2.new(1,-56,1,0),BackgroundTransparency=1,Text=cfg.Name or "",TextColor3=T.Text,TextSize=12,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6,Parent=row})
	-- Swatch : affiche un damier + couleur pour visualiser l'alpha
	local swatchBg=New("Frame",{Size=UDim2.fromOffset(46,18),Position=UDim2.new(1,-46,0.5,-9),BackgroundColor3=Color3.fromRGB(180,180,180),BorderSizePixel=0,ZIndex=6,Parent=row});Corner(swatchBg,5)
	local swatch=New("TextButton",{Size=UDim2.fromScale(1,1),BackgroundColor3=curColor,BackgroundTransparency=curAlpha,Text="",AutoButtonColor=false,BorderSizePixel=0,ZIndex=7,Parent=swatchBg})
	Corner(swatch,5)
	local popContainer=self._popover or self._wrap
	local POPUP_H=TAB_H+PAD+SV_H+PAD+PREV_H+PAD
	local popup=New("Frame",{Size=UDim2.fromOffset(PW,POPUP_H),BackgroundColor3=T.GroupHead,BorderSizePixel=0,Visible=false,ZIndex=300,Parent=popContainer})
	Corner(popup,8)
	local tabBar=New("Frame",{Size=UDim2.new(1,0,0,TAB_H),BackgroundColor3=T.GroupBG,BorderSizePixel=0,ZIndex=301,Parent=popup})
	Corner(tabBar,6)
	New("Frame",{Size=UDim2.new(1,0,0,8),Position=UDim2.new(0,0,1,-8),BackgroundColor3=T.GroupBG,BorderSizePixel=0,ZIndex=302,Parent=tabBar})
	local HALF=math.floor((PW-PAD*2-4)/2)
	local function MakeTab(label,xOff)
		local b=New("TextButton",{Size=UDim2.fromOffset(HALF,TAB_H-6),Position=UDim2.fromOffset(xOff,3),BackgroundColor3=T.Item,Text=label,TextColor3=T.Muted,TextSize=11,Font=F.Bold,AutoButtonColor=false,BorderSizePixel=0,ZIndex=303,Parent=tabBar})
		Corner(b,5);return b
	end
	local tabCP=MakeTab("Color Picker",PAD);local tabVE=MakeTab("Value Editor",PAD+HALF+4)
	local function MakePage(vis)
		return New("Frame",{Size=UDim2.new(1,0,1,-TAB_H),Position=UDim2.new(0,0,0,TAB_H),BackgroundTransparency=1,BorderSizePixel=0,Visible=vis,ZIndex=301,Parent=popup})
	end
	local pageCP=MakePage(true);local pageVE=MakePage(false)
	local svBase=New("Frame",{Size=UDim2.fromOffset(SV_W,SV_H),Position=UDim2.fromOffset(PAD,PAD),BackgroundColor3=Color3.fromHSV(1,1,1),BorderSizePixel=0,ZIndex=302,Parent=pageCP});Corner(svBase,5)
	local svWhite=New("Frame",{Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=303,Parent=svBase});Corner(svWhite,5)
	do local g=Instance.new("UIGradient");g.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)});g.Rotation=0;g.Parent=svWhite end
	local svBlack=New("Frame",{Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(0,0,0),BorderSizePixel=0,ZIndex=304,Parent=svBase});Corner(svBlack,5)
	do local g=Instance.new("UIGradient");g.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,0)});g.Rotation=90;g.Parent=svBlack end
	local svCursor=New("Frame",{Size=UDim2.fromOffset(14,14),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=306,Parent=svBase});Corner(svCursor,100)
	local svBtn=New("TextButton",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Text="",ZIndex=307,Parent=svBase})
	local hueBar=New("Frame",{Size=UDim2.fromOffset(HUE_W,SV_H),Position=UDim2.fromOffset(PAD+SV_W+GAP,PAD),BackgroundColor3=T.White,BorderSizePixel=0,ZIndex=302,Parent=pageCP});Corner(hueBar,4)
	do
		local g=Instance.new("UIGradient")
		g.Color=ColorSequence.new({
			ColorSequenceKeypoint.new(0,Color3.fromHSV(0,1,1)),ColorSequenceKeypoint.new(1/6,Color3.fromHSV(1/6,1,1)),
			ColorSequenceKeypoint.new(2/6,Color3.fromHSV(2/6,1,1)),ColorSequenceKeypoint.new(3/6,Color3.fromHSV(3/6,1,1)),
			ColorSequenceKeypoint.new(4/6,Color3.fromHSV(4/6,1,1)),ColorSequenceKeypoint.new(5/6,Color3.fromHSV(5/6,1,1)),
			ColorSequenceKeypoint.new(1,Color3.fromHSV(0,1,1)),
		})
		g.Rotation=90;g.Parent=hueBar
	end
	local hueCursor=New("Frame",{Size=UDim2.fromOffset(13,13),AnchorPoint=Vector2.new(0.5,0.5),BackgroundColor3=Color3.fromHSV(1,1,1),BorderSizePixel=0,ZIndex=305,Parent=hueBar});Corner(hueCursor,100)
	local hueBtn=New("TextButton",{Size=UDim2.new(1,14,1,0),Position=UDim2.fromOffset(-7,0),BackgroundTransparency=1,Text="",ZIndex=304,Parent=hueBar})

	-- ── Barre Alpha (si hasAlpha) ─────────────────────────────────────────────
	local alphaBar,alphaCursor,alphaBtn,alphaDrag
	if hasAlpha then
		local alphaX=PAD+SV_W+GAP+HUE_W+GAP
		-- CanvasGroup = clip parfait avec coins arrondis
		local alphaCG=New("CanvasGroup",{
			Size=UDim2.fromOffset(ALPHA_W,SV_H),
			Position=UDim2.fromOffset(alphaX,PAD),
			BackgroundColor3=Color3.fromRGB(200,200,200),
			BackgroundTransparency=0,
			BorderSizePixel=0,ZIndex=302,Parent=pageCP
		});Corner(alphaCG,4)
		-- Damier : carrés 5x5, blancs semi-transparents sur fond gris
		local CELL=5
		local cols=math.ceil(ALPHA_W/CELL)
		local rows=math.ceil(SV_H/CELL)
		for row=0,rows-1 do
			for col=0,cols-1 do
				if (row+col)%2==0 then
					New("Frame",{
						Size=UDim2.fromOffset(CELL,CELL),
						Position=UDim2.fromOffset(col*CELL,row*CELL),
						BackgroundColor3=Color3.fromRGB(255,255,255),
						BackgroundTransparency=0.35,
						BorderSizePixel=0,ZIndex=303,Parent=alphaCG
					})
				end
			end
		end
		-- Overlay couleur → transparent par-dessus
		alphaBar=New("Frame",{Size=UDim2.fromScale(1,1),BackgroundColor3=curColor,BorderSizePixel=0,ZIndex=304,Parent=alphaCG})
		do
			local g=Instance.new("UIGradient")
			g.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,curColor),ColorSequenceKeypoint.new(1,curColor)})
			g.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)})
			g.Rotation=90;g.Parent=alphaBar
		end
		-- Label "A" au-dessus
		New("TextLabel",{Size=UDim2.fromOffset(ALPHA_W,14),Position=UDim2.fromOffset(alphaX,PAD-15),BackgroundTransparency=1,Text="A",TextColor3=T.Muted,TextSize=10,Font=F.Bold,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=304,Parent=pageCP})
		alphaCursor=New("Frame",{Size=UDim2.fromOffset(13,13),AnchorPoint=Vector2.new(0.5,0.5),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=306,Parent=alphaCG});Corner(alphaCursor,100)
		-- alphaBtn plus large pour faciliter le drag, posé sur le CanvasGroup parent
		alphaBtn=New("TextButton",{Size=UDim2.new(1,14,1,0),Position=UDim2.fromOffset(-7,0),BackgroundTransparency=1,Text="",ZIndex=305,Parent=alphaCG})
		-- référence pour le drag
		local alphaChecker=alphaCG
		alphaDrag=false
	end

	local eachPW=math.floor((SV_W+GAP+HUE_W+extraW-4)/2)
	local prevY=PAD+SV_H+PAD
	local prevOld=New("Frame",{Size=UDim2.fromOffset(eachPW,PREV_H),Position=UDim2.fromOffset(PAD,prevY),BackgroundColor3=prevColor,BorderSizePixel=0,ZIndex=302,Parent=pageCP});Corner(prevOld,5)
	local prevNew=New("Frame",{Size=UDim2.fromOffset(eachPW,PREV_H),Position=UDim2.fromOffset(PAD+eachPW+4,prevY),BackgroundColor3=curColor,BorderSizePixel=0,ZIndex=302,Parent=pageCP});Corner(prevNew,5)
	-- Appliquer transparence aux previews si alpha actif
	if hasAlpha then
		prevOld.BackgroundTransparency=curAlpha
		prevNew.BackgroundTransparency=curAlpha
	end
	local COL_W=math.floor((PW-PAD*3)/2);local ROW_H=28;local LBL_W=46
	local function VERow(parent,label,xOff,yOff)
		local inputW=COL_W-LBL_W-4
		local f=New("Frame",{Size=UDim2.fromOffset(COL_W,ROW_H),Position=UDim2.fromOffset(xOff,yOff),BackgroundTransparency=1,ZIndex=302,Parent=parent})
		New("TextLabel",{Size=UDim2.fromOffset(LBL_W,ROW_H),BackgroundTransparency=1,Text=label,TextColor3=T.Muted,TextSize=11,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=303,Parent=f})
		local box=New("Frame",{Size=UDim2.fromOffset(inputW,ROW_H-6),Position=UDim2.fromOffset(LBL_W,3),BackgroundColor3=T.Item,BorderSizePixel=0,ZIndex=303,Parent=f});Corner(box,5)
		local tb=New("TextBox",{Size=UDim2.new(1,-8,1,0),Position=UDim2.fromOffset(4,0),BackgroundTransparency=1,Text="0",TextColor3=T.Text,TextSize=11,Font=F.Bold,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=true,ZIndex=304,Parent=box})
		tb.Focused:Connect(function()TweenFast(box,{BackgroundColor3=T.ItemHover},0.1)end)
		tb.FocusLost:Connect(function()TweenFast(box,{BackgroundColor3=T.Item},0.1)end)
		return tb
	end
	local c1X,c2X=PAD,PAD+COL_W+PAD
	local y1=PAD;local y2=y1+ROW_H+5;local y3=y2+ROW_H+5;local yHx=y3+ROW_H+8
	local tbR=VERow(pageVE,"Red",c1X,y1);local tbG=VERow(pageVE,"Green",c1X,y2);local tbB=VERow(pageVE,"Blue",c1X,y3)
	local tbHh=VERow(pageVE,"Hue",c2X,y1);local tbSs=VERow(pageVE,"Sat",c2X,y2);local tbVv=VERow(pageVE,"Value",c2X,y3)
	local hexW=PW-PAD*2;local hexIW=hexW-LBL_W-4
	local hexRow=New("Frame",{Size=UDim2.fromOffset(hexW,ROW_H),Position=UDim2.fromOffset(PAD,yHx),BackgroundTransparency=1,ZIndex=302,Parent=pageVE})
	New("TextLabel",{Size=UDim2.fromOffset(LBL_W,ROW_H),BackgroundTransparency=1,Text="Hex",TextColor3=T.Muted,TextSize=11,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=303,Parent=hexRow})
	local hexBox=New("Frame",{Size=UDim2.fromOffset(hexIW,ROW_H-6),Position=UDim2.fromOffset(LBL_W,3),BackgroundColor3=T.Item,BorderSizePixel=0,ZIndex=303,Parent=hexRow});Corner(hexBox,5)
	local tbHex=New("TextBox",{Size=UDim2.new(1,-8,1,0),Position=UDim2.fromOffset(4,0),BackgroundTransparency=1,Text="#000000",TextColor3=T.Text,TextSize=11,Font=F.Bold,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=true,ZIndex=304,Parent=hexBox})
	tbHex.Focused:Connect(function()TweenFast(hexBox,{BackgroundColor3=T.ItemHover},0.1)end)
	tbHex.FocusLost:Connect(function()TweenFast(hexBox,{BackgroundColor3=T.Item},0.1)end)
	-- Champ Alpha dans le Value Editor (si hasAlpha)
	local tbAlphaVE
	if hasAlpha then
		local yAlpha=yHx+ROW_H+6
		local alphaRowVE=New("Frame",{Size=UDim2.fromOffset(hexW,ROW_H),Position=UDim2.fromOffset(PAD,yAlpha),BackgroundTransparency=1,ZIndex=302,Parent=pageVE})
		New("TextLabel",{Size=UDim2.fromOffset(LBL_W,ROW_H),BackgroundTransparency=1,Text="Alpha",TextColor3=T.Muted,TextSize=11,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=303,Parent=alphaRowVE})
		local alphaBoxVE=New("Frame",{Size=UDim2.fromOffset(hexIW,ROW_H-6),Position=UDim2.fromOffset(LBL_W,3),BackgroundColor3=T.Item,BorderSizePixel=0,ZIndex=303,Parent=alphaRowVE});Corner(alphaBoxVE,5)
		tbAlphaVE=New("TextBox",{Size=UDim2.new(1,-8,1,0),Position=UDim2.fromOffset(4,0),BackgroundTransparency=1,Text="0",TextColor3=T.Text,TextSize=11,Font=F.Bold,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=true,ZIndex=304,Parent=alphaBoxVE})
		tbAlphaVE.Focused:Connect(function()TweenFast(alphaBoxVE,{BackgroundColor3=T.ItemHover},0.1)end)
		tbAlphaVE.FocusLost:Connect(function()TweenFast(alphaBoxVE,{BackgroundColor3=T.Item},0.1)end)
		-- Resize popup VE pour la nouvelle ligne
		popup.Size=UDim2.fromOffset(PW,POPUP_H+ROW_H+6)
	end
	local yPrevVE=yHx+ROW_H+6+(hasAlpha and ROW_H+6 or 0);local eachVEW=math.floor((hexW-4)/2)
	local prevOldVE=New("Frame",{Size=UDim2.fromOffset(eachVEW,PREV_H),Position=UDim2.fromOffset(PAD,yPrevVE),BackgroundColor3=prevColor,BorderSizePixel=0,ZIndex=302,Parent=pageVE});Corner(prevOldVE,5)
	local prevNewVE=New("Frame",{Size=UDim2.fromOffset(eachVEW,PREV_H),Position=UDim2.fromOffset(PAD+eachVEW+4,yPrevVE),BackgroundColor3=curColor,BorderSizePixel=0,ZIndex=302,Parent=pageVE});Corner(prevNewVE,5)
	if hasAlpha then
		prevOldVE.BackgroundTransparency=curAlpha
		prevNewVE.BackgroundTransparency=curAlpha
	end
	local H,S,V=C3toHSV(curColor)
	local function applyColor()
		curColor=HSVtoC3(H,S,V)
		swatch.BackgroundColor3=curColor
		swatch.BackgroundTransparency=hasAlpha and curAlpha or 0
		svBase.BackgroundColor3=Color3.fromHSV(H/360,1,1)
		svCursor.Position=UDim2.new(S,0,1-V,0);hueCursor.Position=UDim2.new(0.5,0,H/360,0)
		hueCursor.BackgroundColor3=Color3.fromHSV(H/360,1,1)
		prevNew.BackgroundColor3=curColor;prevNewVE.BackgroundColor3=curColor
		if hasAlpha then
			prevNew.BackgroundTransparency=curAlpha;prevNewVE.BackgroundTransparency=curAlpha
			-- Mettre à jour le curseur alpha
			alphaCursor.Position=UDim2.new(0.5,0,curAlpha,0)
			-- Mettre à jour la couleur du gradient alpha avec la teinte actuelle
			alphaBar.BackgroundColor3=curColor
			local ag=alphaBar:FindFirstChildOfClass("UIGradient")
			if ag then ag.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,curColor),ColorSequenceKeypoint.new(1,curColor)}) end
			if tbAlphaVE then tbAlphaVE.Text=tostring(math.floor(curAlpha*255+.5)) end
		end
		tbR.Text=tostring(math.floor(curColor.R*255+.5));tbG.Text=tostring(math.floor(curColor.G*255+.5));tbB.Text=tostring(math.floor(curColor.B*255+.5))
		tbHh.Text=tostring(math.floor(H/360*255+.5));tbSs.Text=tostring(math.floor(S*255+.5));tbVv.Text=tostring(math.floor(V*255+.5))
		tbHex.Text="#"..C3toHex(curColor)
		callback(curColor, hasAlpha and curAlpha or nil)
	end
	local svDrag=false
	svBtn.MouseButton1Down:Connect(function(x,y)svDrag=true;local a,z=svBase.AbsolutePosition,svBase.AbsoluteSize;S=math.clamp((x-a.X)/z.X,0,1);V=math.clamp(1-(y-a.Y)/z.Y,0,1);applyColor()end)
	CI(UIS.InputChanged,function(inp)if svDrag and inp.UserInputType==Enum.UserInputType.MouseMovement then local a,z=svBase.AbsolutePosition,svBase.AbsoluteSize;S=math.clamp((inp.Position.X-a.X)/z.X,0,1);V=math.clamp(1-(inp.Position.Y-a.Y)/z.Y,0,1);applyColor()end end)
	CI(UIS.InputEnded,function(inp)if inp.UserInputType==Enum.UserInputType.MouseButton1 then svDrag=false end end)
	local hueDrag=false
	hueBtn.MouseButton1Down:Connect(function(_,y)hueDrag=true;local a,z=hueBar.AbsolutePosition,hueBar.AbsoluteSize;H=math.clamp((y-a.Y)/z.Y,0,1)*360;applyColor()end)
	CI(UIS.InputChanged,function(inp)if hueDrag and inp.UserInputType==Enum.UserInputType.MouseMovement then local a,z=hueBar.AbsolutePosition,hueBar.AbsoluteSize;H=math.clamp((inp.Position.Y-a.Y)/z.Y,0,1)*360;applyColor()end end)
	CI(UIS.InputEnded,function(inp)if inp.UserInputType==Enum.UserInputType.MouseButton1 then hueDrag=false end end)
	-- Drag barre alpha
	if hasAlpha then
		alphaBtn.MouseButton1Down:Connect(function(_,y)
			alphaDrag=true
			local a,z=alphaBar.AbsolutePosition,alphaBar.AbsoluteSize
			curAlpha=math.clamp((y-a.Y)/z.Y,0,1);applyColor()
		end)
		CI(UIS.InputChanged,function(inp)
			if alphaDrag and inp.UserInputType==Enum.UserInputType.MouseMovement then
				local a,z=alphaBar.AbsolutePosition,alphaBar.AbsoluteSize
				curAlpha=math.clamp((inp.Position.Y-a.Y)/z.Y,0,1);applyColor()
			end
		end)
		CI(UIS.InputEnded,function(inp)if inp.UserInputType==Enum.UserInputType.MouseButton1 then alphaDrag=false end end)
		if tbAlphaVE then
			tbAlphaVE.FocusLost:Connect(function(e)
				if e then curAlpha=math.clamp((tonumber(tbAlphaVE.Text) or 0)/255,0,1);applyColor() end
			end)
		end
	end
	local function fromRGB()local r=math.clamp(tonumber(tbR.Text) or 0,0,255);local g=math.clamp(tonumber(tbG.Text) or 0,0,255);local b=math.clamp(tonumber(tbB.Text) or 0,0,255);curColor=Color3.fromRGB(r,g,b);H,S,V=C3toHSV(curColor);applyColor()end
	local function fromHSVInput()local h=math.clamp(tonumber(tbHh.Text) or 0,0,255);local s=math.clamp(tonumber(tbSs.Text) or 0,0,255);local v=math.clamp(tonumber(tbVv.Text) or 0,0,255);H=h/255*360;S=s/255;V=v/255;applyColor()end
	local function fromHex()local c=HextoC3(tbHex.Text);if c then curColor=c;H,S,V=C3toHSV(c);applyColor()end end
	tbR.FocusLost:Connect(function(e)if e then fromRGB()end end);tbG.FocusLost:Connect(function(e)if e then fromRGB()end end);tbB.FocusLost:Connect(function(e)if e then fromRGB()end end)
	tbHh.FocusLost:Connect(function(e)if e then fromHSVInput()end end);tbSs.FocusLost:Connect(function(e)if e then fromHSVInput()end end);tbVv.FocusLost:Connect(function(e)if e then fromHSVInput()end end)
	tbHex.FocusLost:Connect(function(e)if e then fromHex()end end)
	local activeTab=nil
	local function selectTab(btn,page)
		pageCP.Visible=(page==pageCP);pageVE.Visible=(page==pageVE)
		if activeTab then TweenFast(activeTab,{BackgroundColor3=T.Item,TextColor3=T.Muted},0.12)end
		TweenFast(btn,{BackgroundColor3=T.Accent,TextColor3=Color3.fromRGB(25,18,5)},0.12);activeTab=btn
	end
	tabCP.MouseButton1Click:Connect(function()selectTab(tabCP,pageCP)end)
	tabVE.MouseButton1Click:Connect(function()selectTab(tabVE,pageVE)end)
	selectTab(tabCP,pageCP)
	local closeConn
	local function openPopup()
		prevColor=curColor;prevOld.BackgroundColor3=prevColor;prevOldVE.BackgroundColor3=prevColor
		if hasAlpha then prevOld.BackgroundTransparency=curAlpha;prevOldVE.BackgroundTransparency=curAlpha end
		local absBtn=swatchBg.AbsolutePosition;local absRef=popContainer.AbsolutePosition;local sz=swatchBg.AbsoluteSize
		local relX=math.max(4,absBtn.X-absRef.X-PW+sz.X);local relY=absBtn.Y-absRef.Y+sz.Y+4
		popup.Position=UDim2.fromOffset(relX,relY);popup.Visible=true;applyColor()
		closeConn=CI(UIS.InputEnded,function(inp)
			if inp.UserInputType==Enum.UserInputType.MouseButton1 then
				local mp=UIS:GetMouseLocation();local lp=popup.AbsolutePosition;local ls=popup.AbsoluteSize
				if mp.X<lp.X or mp.X>lp.X+ls.X or mp.Y<lp.Y or mp.Y>lp.Y+ls.Y then open=false;popup.Visible=false;if closeConn then closeConn:Disconnect();closeConn=nil end end
			end
		end)
	end
	swatch.MouseButton1Click:Connect(function()open=not open;if open then openPopup()else popup.Visible=false;if closeConn then closeConn:Disconnect();closeConn=nil end end end)
	row.AncestryChanged:Connect(function()if not row.Parent then popup:Destroy();if closeConn then closeConn:Disconnect()end end end)
	applyColor()
	local obj={}
	function obj:Get() return curColor end
	function obj:GetAlpha() return curAlpha end
	function obj:Set(c,a)
		curColor=c or curColor
		if hasAlpha and a~=nil then curAlpha=math.clamp(a,0,1) end
		H,S,V=C3toHSV(curColor);applyColor()
	end
	return obj
end

function GB:AddToggle(cfg)
	cfg=cfg or {}
	local value=cfg.Default==true;local callback=cfg.Callback or function()end
	local hasKey=cfg.keybind==true;local boundKey=RK(cfg.DefaultKey);local _setKey
	local row=New("Frame",{Size=UDim2.new(1,0,0,24),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=self._body})
	local rightW=36+(hasKey and 74 or 0)
	New("TextLabel",{Size=UDim2.new(1,-(rightW+4),1,0),BackgroundTransparency=1,Text=cfg.Name or "",TextColor3=T.Text,TextSize=12,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,ZIndex=6,Parent=row})
	local setState
	if hasKey then
		local listening=false
		local resetBtn=New("TextButton",{Size=UDim2.fromOffset(14,14),Position=UDim2.new(1,-(36+4+52+4+14),0.5,-7),BackgroundColor3=Color3.fromRGB(140,35,35),Text="",AutoButtonColor=false,BorderSizePixel=0,Visible=boundKey~=nil,ZIndex=6,Parent=row});Corner(resetBtn,100)
		New("ImageLabel",{Size=UDim2.fromOffset(8,8),Position=UDim2.new(0.5,-4,0.5,-4),BackgroundTransparency=1,Image=RI("lucide-x") or "",ImageColor3=Color3.fromRGB(255,180,180),ZIndex=7,Parent=resetBtn})
		local keyBtn=New("TextButton",{Size=UDim2.fromOffset(52,18),Position=UDim2.new(1,-(36+4+52),0.5,-9),BackgroundColor3=T.Item,Text=boundKey and boundKey.Name or "---",TextColor3=boundKey and T.Muted or T.Label,TextSize=10,Font=F.Bold,AutoButtonColor=false,BorderSizePixel=0,ZIndex=6,Parent=row});Corner(keyBtn,4)
		local function setKey(k)UnregKey(boundKey);boundKey=k;keyBtn.Text=k and k.Name or "---";keyBtn.TextColor3=k and T.Muted or T.Label;resetBtn.Visible=k~=nil;RegKey(k)end;_setKey=setKey
		keyBtn.MouseButton1Click:Connect(function()if listening then return end;listening=true;keyBtn.Text="...";keyBtn.TextColor3=T.Accent;TweenFast(keyBtn,{BackgroundColor3=T.Border},0.1)end)
		keyBtn.MouseButton2Click:Connect(function()listening=false;setKey(nil);TweenFast(keyBtn,{BackgroundColor3=T.Item},0.1)end)
		CI(UIS.InputBegan,function(inp,gpe)if not listening then return end;if inp.UserInputType==Enum.UserInputType.Keyboard then listening=false;if KeyUsed(inp.KeyCode) then keyBtn.Text=boundKey and boundKey.Name or "---";keyBtn.TextColor3=boundKey and T.Muted or T.Label;TweenFast(keyBtn,{BackgroundColor3=T.Item},0.1);Notify("Key already in use",'"'..inp.KeyCode.Name..'" is already bound.');return end;setKey(inp.KeyCode);TweenFast(keyBtn,{BackgroundColor3=T.Item},0.1);obj:_FireNotify()end end)
		CI(UIS.InputBegan,function(inp,gpe)if gpe or listening then return end;if boundKey and inp.KeyCode==boundKey then setState(not value)end end)
		keyBtn.MouseEnter:Connect(function()if not listening then TweenFast(keyBtn,{BackgroundColor3=T.ItemHover},0.1)end end)
		keyBtn.MouseLeave:Connect(function()if not listening then TweenFast(keyBtn,{BackgroundColor3=T.Item},0.1)end end)
		resetBtn.MouseEnter:Connect(function()TweenFast(resetBtn,{BackgroundColor3=Color3.fromRGB(190,45,45)},0.1)end)
		resetBtn.MouseLeave:Connect(function()TweenFast(resetBtn,{BackgroundColor3=Color3.fromRGB(140,35,35)},0.1)end)
		resetBtn.MouseButton1Click:Connect(function()if listening then listening=false end;setKey(nil);TweenFast(keyBtn,{BackgroundColor3=T.Item},0.1)end)
	end
	local track=New("TextButton",{Size=UDim2.fromOffset(36,18),Position=UDim2.new(1,-36,0.5,-9),BackgroundColor3=value and T.ToggleOn or T.ToggleOff,Text="",BorderSizePixel=0,AutoButtonColor=false,ZIndex=6,Parent=row});Corner(track,100)
	local thumb=New("Frame",{Size=UDim2.fromOffset(12,12),Position=value and UDim2.fromOffset(21,3) or UDim2.fromOffset(3,3),BackgroundColor3=T.White,BorderSizePixel=0,ZIndex=7,Parent=track});Corner(thumb,100)
	local obj={Value=value}
	_AttachNotify(obj)
	setState=function(v)value=v;TweenFast(track,{BackgroundColor3=v and T.ToggleOn or T.ToggleOff},0.15);TweenFast(thumb,{Position=v and UDim2.fromOffset(21,3) or UDim2.fromOffset(3,3)},0.15);callback(v);obj:_FireNotify()end
	track.MouseButton1Click:Connect(function()setState(not value)end)
	function obj:Set(v)setState(v)end;function obj:Get()return value end
	if hasKey then
		function obj:GetKey()return boundKey end
		function obj:SetKey(k)_setKey(RK(k))end
	end
	return obj
end

function GB:AddSlider(cfg)
	cfg=cfg or {};local min=cfg.Min or 0;local max=cfg.Max or 100;local value=cfg.Default or min;local suffix=cfg.Suffix or "";local callback=cfg.Callback or function()end
	local hasName=cfg.Name and cfg.Name~=""
	local contH=hasName and 38 or 20
	local cont=New("Frame",{Size=UDim2.new(1,0,0,contH),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=self._body})
	if hasName then
		New("TextLabel",{Size=UDim2.new(0.6,0,0,16),BackgroundTransparency=1,Text=cfg.Name,TextColor3=T.Text,TextSize=12,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6,Parent=cont})
	end
	local trackY=hasName and 22 or 6
	-- Conteneur droite : vNum (TextBox invisible) + vSuffix (TextLabel fixe)
	local vRight=New("Frame",{Size=UDim2.new(hasName and 0.4 or 1,0,0,16),Position=UDim2.new(hasName and 0.6 or 0,0,0,0),BackgroundTransparency=1,BorderSizePixel=0,ClipsDescendants=false,ZIndex=6,Parent=cont})
	-- Suffix toujours visible, ancre tout a droite
	local vSuffix=New("TextLabel",{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.new(0,0,1,0),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),BackgroundTransparency=1,Text=suffix,TextColor3=T.Muted,TextSize=12,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Right,ZIndex=6,Parent=vRight})
	-- TextBox invisible pour la valeur numerique, place juste a gauche du suffix
	local vBox=New("TextBox",{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.new(0,0,1,0),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-(vSuffix.AbsoluteSize.X),0.5,0),BackgroundColor3=T.GroupBG,BackgroundTransparency=0.07,Text=tostring(value),TextColor3=T.Muted,TextSize=12,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Right,ClearTextOnFocus=false,BorderSizePixel=0,ZIndex=7,Parent=vRight})
	local track=New("Frame",{Size=UDim2.new(1,0,0,5),Position=UDim2.new(0,0,0,trackY),BackgroundColor3=T.ToggleOff,BorderSizePixel=0,ZIndex=6,Parent=cont});Corner(track,100)
	local fill=New("Frame",{Size=UDim2.new((value-min)/(max-min),0,1,0),BackgroundColor3=T.Accent,BorderSizePixel=0,ZIndex=7,Parent=track});Corner(fill,100)
	local thumb=New("Frame",{Size=UDim2.fromOffset(13,13),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new((value-min)/(max-min),0,0.5,0),BackgroundColor3=T.White,BorderSizePixel=0,ZIndex=8,Parent=track});Corner(thumb,100)
	local btn=New("TextButton",{Size=UDim2.new(1,0,0,20),Position=UDim2.new(0,0,0,-8),BackgroundTransparency=1,Text="",ZIndex=9,Parent=track})
	local dragging=false
	local obj={Value=value};_AttachNotify(obj)
	local function setVal(v)
		value=math.clamp(v,min,max)
		local p=(value-min)/(max-min)
		fill.Size=UDim2.new(p,0,1,0);thumb.Position=UDim2.new(p,0,0.5,0)
		if not vBox:IsFocused() then vBox.Text=tostring(value) end
		callback(value)
	end
	local function upd(ax)local p=math.clamp((ax-track.AbsolutePosition.X)/track.AbsoluteSize.X,0,1);setVal(math.floor(min+p*(max-min)+.5))end
	btn.MouseButton1Down:Connect(function(x,_)dragging=true;upd(x)end)
	CI(UIS.InputChanged,function(inp)if dragging and inp.UserInputType==Enum.UserInputType.MouseMovement then upd(inp.Position.X)end end)
	CI(UIS.InputEnded,function(inp)if inp.UserInputType==Enum.UserInputType.MouseButton1 and dragging then dragging=false;obj:_FireNotify()end end)
	-- Filtre : seulement chiffres et signe moins
	vBox:GetPropertyChangedSignal("Text"):Connect(function()
		local clean=vBox.Text:gsub("[^%d%-]","")
		if clean~=vBox.Text then vBox.Text=clean end
	end)
	-- Repositionne vBox a gauche du suffix apres que le suffix soit rendu
	task.defer(function()
		vBox.Position=UDim2.new(1,-(vSuffix.AbsoluteSize.X),0.5,0)
		vSuffix:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			vBox.Position=UDim2.new(1,-(vSuffix.AbsoluteSize.X),0.5,0)
		end)
	end)
	-- Confirmation par Enter ou FocusLost
	vBox.FocusLost:Connect(function()
		local n=tonumber(vBox.Text)
		if n then setVal(math.floor(n+.5));obj:_FireNotify()
		else vBox.Text=tostring(value) end
	end)
	function obj:Set(v)setVal(math.clamp(v,min,max))end;function obj:Get()return value end;return obj
end

function GB:AddInput(cfg)
	cfg=cfg or {};local callback=cfg.Callback or function()end
	local hasName=cfg.Name and cfg.Name~=""
	local contH=hasName and 38 or 22
	local cont=New("Frame",{Size=UDim2.new(1,0,0,contH),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=self._body})
	if hasName then New("TextLabel",{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,Text=cfg.Name,TextColor3=T.Text,TextSize=12,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6,Parent=cont})end
	local yOff=hasName and 18 or 0
	local box=New("Frame",{Size=UDim2.new(1,0,0,18),Position=UDim2.new(0,0,0,yOff),BackgroundColor3=T.Item,BorderSizePixel=0,ZIndex=6,Parent=cont});Corner(box,5)
	local tb=New("TextBox",{Size=UDim2.new(1,-10,1,0),Position=UDim2.new(0,6,0,0),BackgroundTransparency=1,Text=cfg.Default or "",PlaceholderText=cfg.Placeholder or "",PlaceholderColor3=T.Label,TextColor3=T.Text,TextSize=12,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,ZIndex=7,Parent=box})
	local obj={};_AttachNotify(obj)
	tb.FocusLost:Connect(function()local v=tb.Text;if cfg.Numeric then v=tonumber(v) or 0;tb.Text=tostring(v)end;callback(v);obj:_FireNotify()end)
	tb.Focused:Connect(function()TweenFast(box,{BackgroundColor3=T.ItemHover},0.1)end)
	tb.FocusLost:Connect(function()TweenFast(box,{BackgroundColor3=T.Item},0.1)end)
	function obj:Get()return cfg.Numeric and (tonumber(tb.Text) or 0) or tb.Text end;function obj:Set(v)tb.Text=tostring(v)end;return obj
end

function GB:AddDropdown(cfg)
	cfg=cfg or {}
	local options=cfg.Options or {};local multiSelect=cfg.MultiSelect==true;local callback=cfg.Callback or function()end;local open=false
	local placeholder=cfg.Placeholder or ""
	local selected
	if multiSelect then
		selected={}
		if type(cfg.Default)=="table" then for _,v in ipairs(cfg.Default) do selected[v]=true end
		elseif cfg.Default then selected[cfg.Default]=true end
	else selected=cfg.Default or "" end
	local function _has()
		if not multiSelect then return selected~="" end
		for _,v in pairs(selected) do if v then return true end end
		return false
	end
	local function getDisp()
		if not multiSelect then return selected=="" and placeholder or selected end
		local items={};for k,v in pairs(selected) do if v then table.insert(items,k)end end
		if #items==0 then return placeholder end;table.sort(items);return table.concat(items,", ")
	end
	local function getList()
		local t={};for k,v in pairs(selected) do if v then table.insert(t,k)end end;return t
	end
	local ITEM_H=22;local listH=#options*ITEM_H
	local hasName=cfg.Name and cfg.Name~=""
	local contH=hasName and 38 or 22
	local cont=New("Frame",{Size=UDim2.new(1,0,0,contH),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=self._body})
	if hasName then New("TextLabel",{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,Text=cfg.Name,TextColor3=T.Text,TextSize=12,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6,Parent=cont})end
	local yOff=hasName and 18 or 0
	local btnF=New("TextButton",{Size=UDim2.new(1,0,0,18),Position=UDim2.new(0,0,0,yOff),BackgroundColor3=T.Item,Text="",AutoButtonColor=false,BorderSizePixel=0,ZIndex=6,Parent=cont});Corner(btnF,5)
	local function _optColor(s)return(cfg.Colors and s and s~="" and cfg.Colors[s]) or (_has() and T.Text or T.Label)end
	local selLbl=New("TextLabel",{Size=UDim2.new(1,-28,1,0),Position=UDim2.new(0,7,0,0),BackgroundTransparency=1,Text=getDisp(),TextColor3=_optColor(type(selected)=="string" and selected or ""),TextSize=12,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=7,Parent=btnF})
	local arrowImg=New("ImageLabel",{Size=UDim2.fromOffset(10,10),Position=UDim2.new(1,-16,0.5,-5),BackgroundTransparency=1,Image=RI("lucide-chevron-down") or "",ImageColor3=T.Muted,ZIndex=7,Parent=btnF})
	local popContainer=self._popover or self._wrap
	local listF=New("Frame",{Size=UDim2.fromOffset(0,listH),BackgroundColor3=T.GroupHead,BorderSizePixel=0,ClipsDescendants=true,ZIndex=200,Visible=false,Parent=popContainer});Corner(listF,5)
	New("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Parent=listF})
	local itemRows={};local updateConn2
	local obj={};_AttachNotify(obj)
	local backdrop=New("TextButton",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Text="",AutoButtonColor=false,BorderSizePixel=0,ZIndex=199,Visible=false,Parent=popContainer})
	local function updateListPos()
		local a=btnF.AbsolutePosition;local b=popContainer.AbsolutePosition;local sz=btnF.AbsoluteSize
		listF.Position=UDim2.fromOffset(a.X-b.X,a.Y-b.Y+sz.Y+2);listF.Size=UDim2.fromOffset(sz.X,listH)
	end
	local function closeList()
		open=false;listF.Visible=false;backdrop.Visible=false;TweenFast(arrowImg,{Rotation=0},0.15)
		if updateConn2 then updateConn2:Disconnect();updateConn2=nil end
	end
	backdrop.MouseButton1Click:Connect(function()closeList()end)
	for i,opt in ipairs(options) do
		local item=New("TextButton",{Size=UDim2.new(1,0,0,ITEM_H),BackgroundColor3=T.GroupHead,BackgroundTransparency=1,Text="",AutoButtonColor=false,BorderSizePixel=0,LayoutOrder=i,ZIndex=201,Parent=listF})
		New("UIPadding",{PaddingLeft=UDim.new(0,7),Parent=item})
		New("TextLabel",{Size=UDim2.new(1,-(multiSelect and 30 or 14),1,0),BackgroundTransparency=1,Text=opt,TextColor3=(cfg.Colors and cfg.Colors[opt]) or T.Text,TextSize=12,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=202,Parent=item})
		local checkBg
		if multiSelect then
			checkBg=New("Frame",{Size=UDim2.fromOffset(12,12),Position=UDim2.new(1,-18,0.5,-6),BackgroundColor3=selected[opt] and T.Accent or T.ToggleOff,BorderSizePixel=0,ZIndex=202,Parent=item});Corner(checkBg,3)
			if selected[opt] then New("TextLabel",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Text="✓",TextColor3=Color3.fromRGB(25,18,5),TextSize=10,Font=F.Bold,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=203,Parent=checkBg})end
		end
		itemRows[opt]={frame=item,check=checkBg}
		item.MouseEnter:Connect(function()TweenFast(item,{BackgroundColor3=T.ItemHover,BackgroundTransparency=0},0.1)end)
		item.MouseLeave:Connect(function()TweenFast(item,{BackgroundTransparency=1},0.1)end)
		item.MouseButton1Down:Connect(function()
			if multiSelect then
				if selected[opt] then selected[opt]=nil else selected[opt]=true end
				if checkBg then
					TweenFast(checkBg,{BackgroundColor3=selected[opt] and T.Accent or T.ToggleOff},0.12)
					local xt=checkBg:FindFirstChildOfClass("TextLabel")
					if selected[opt] then if not xt then New("TextLabel",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Text="✓",TextColor3=Color3.fromRGB(25,18,5),TextSize=10,Font=F.Bold,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=203,Parent=checkBg})end
					else if xt then xt:Destroy()end end
				end
				selLbl.Text=getDisp();callback(getList());obj:_FireNotify()
			else selected=opt;selLbl.Text=opt;selLbl.TextColor3=(cfg.Colors and cfg.Colors[opt]) or T.Text;closeList();TweenFast(btnF,{BackgroundColor3=T.Item},0.1);callback(opt);obj:_FireNotify()end
		end)
	end
	local function openList()
		updateListPos();listF.Visible=true;backdrop.Visible=true;TweenFast(arrowImg,{Rotation=180},0.15)
		if updateConn2 then updateConn2:Disconnect()end
		updateConn2=btnF:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateListPos)
	end
	btnF.MouseButton1Click:Connect(function()open=not open;if open then openList()else closeList()end end)
	btnF.MouseEnter:Connect(function()TweenFast(btnF,{BackgroundColor3=T.ItemHover},0.1)end)
	btnF.MouseLeave:Connect(function()TweenFast(btnF,{BackgroundColor3=T.Item},0.1)end)
	cont.AncestryChanged:Connect(function()if not cont.Parent then listF:Destroy();backdrop:Destroy();if updateConn2 then updateConn2:Disconnect()end end end)
	function obj:Get()if multiSelect then return getList()end;return selected end
	function obj:Set(v)
		if multiSelect then
			selected={}
			if type(v)=="table" then for _,k in ipairs(v) do selected[k]=true end end
			for opt,row in pairs(itemRows) do
				if row.check then
					TweenFast(row.check,{BackgroundColor3=selected[opt] and T.Accent or T.ToggleOff},0.12)
					local tick=row.check:FindFirstChildOfClass("TextLabel")
					if selected[opt] then if not tick then New("TextLabel",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Text="✓",TextColor3=Color3.fromRGB(25,18,5),TextSize=10,Font=F.Bold,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=203,Parent=row.check})end
					else if tick then tick:Destroy()end end
				end
			end
			selLbl.Text=getDisp();callback(getList())
		else selected=v or "";selLbl.Text=getDisp();selLbl.TextColor3=_has() and T.Text or T.Label;callback(selected)end
	end
	return obj
end

function GB:AddButton(cfg)
	cfg=cfg or {};local callback=cfg.Callback or function()end
	local btn=New("TextButton",{Size=UDim2.new(1,0,0,26),BackgroundColor3=T.Item,Text="",AutoButtonColor=false,BorderSizePixel=0,ZIndex=5,Parent=self._body});Corner(btn,6)
	-- Petite barre accent à gauche
	local bar=New("Frame",{Size=UDim2.fromOffset(2,12),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,6,0.5,0),BackgroundColor3=T.Accent,BackgroundTransparency=0.3,BorderSizePixel=0,ZIndex=6,Parent=btn});Corner(bar,100)
	New("TextLabel",{Size=UDim2.new(1,-20,1,0),Position=UDim2.new(0,14,0,0),BackgroundTransparency=1,Text=cfg.Name or "",TextColor3=T.Text,TextSize=12,Font=F.Bold,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6,Parent=btn})
	btn.MouseEnter:Connect(function()TweenFast(btn,{BackgroundColor3=T.ItemHover},0.1);TweenFast(bar,{BackgroundTransparency=0},0.1)end)
	btn.MouseLeave:Connect(function()TweenFast(btn,{BackgroundColor3=T.Item},0.1);TweenFast(bar,{BackgroundTransparency=0.3},0.1)end)
	local obj={};_AttachNotify(obj)
	btn.MouseButton1Click:Connect(function()TweenFast(btn,{BackgroundColor3=T.Border},0.05);task.delay(0.08,function()TweenFast(btn,{BackgroundColor3=T.Item},0.1)end);callback();obj:_FireNotify()end)
	return obj
end

function GB:AddDynamicDropdown(cfg)
	cfg=cfg or {}
	local options=cfg.Options or {};local callback=cfg.Callback or function()end;local open=false
	local placeholder=cfg.Placeholder or "";local selected=cfg.Default or ""
	local ITEM_H=22
	local hasName=cfg.Name and cfg.Name~=""
	local contH=hasName and 38 or 22
	local cont=New("Frame",{Size=UDim2.new(1,0,0,contH),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=self._body})
	if hasName then New("TextLabel",{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,Text=cfg.Name,TextColor3=T.Text,TextSize=12,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6,Parent=cont})end
	local yOff=hasName and 18 or 0
	local btnF=New("TextButton",{Size=UDim2.new(1,0,0,18),Position=UDim2.new(0,0,0,yOff),BackgroundColor3=T.Item,Text="",AutoButtonColor=false,BorderSizePixel=0,ZIndex=6,Parent=cont});Corner(btnF,5)
	local function _dt()return selected~="" and selected or placeholder end
	local function _dc()return selected~="" and T.Text or T.Label end
	local selLbl=New("TextLabel",{Size=UDim2.new(1,-28,1,0),Position=UDim2.new(0,7,0,0),BackgroundTransparency=1,Text=_dt(),TextColor3=_dc(),TextSize=12,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=7,Parent=btnF})
	local arrowImg=New("ImageLabel",{Size=UDim2.fromOffset(10,10),Position=UDim2.new(1,-16,0.5,-5),BackgroundTransparency=1,Image=RI("lucide-chevron-down") or "",ImageColor3=T.Muted,ZIndex=7,Parent=btnF})
	local popContainer=self._popover or self._wrap
	local listF=New("Frame",{Size=UDim2.fromOffset(0,0),BackgroundColor3=T.GroupHead,BorderSizePixel=0,ClipsDescendants=true,ZIndex=200,Visible=false,Parent=popContainer});Corner(listF,5)
	local listLayout=New("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Parent=listF})
	local updateConn2
	local function curH()return math.max(1,#options)*ITEM_H end
	local function updPos()
		local a=btnF.AbsolutePosition;local b=popContainer.AbsolutePosition;local sz=btnF.AbsoluteSize
		listF.Position=UDim2.fromOffset(a.X-b.X,a.Y-b.Y+sz.Y+2);listF.Size=UDim2.fromOffset(sz.X,curH())
	end
	local backdrop=New("TextButton",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Text="",AutoButtonColor=false,BorderSizePixel=0,ZIndex=199,Visible=false,Parent=popContainer})
	local function closeList()
		open=false;listF.Visible=false;backdrop.Visible=false;TweenFast(arrowImg,{Rotation=0},0.15)
		if updateConn2 then updateConn2:Disconnect();updateConn2=nil end
	end
	backdrop.MouseButton1Click:Connect(function()closeList()end)
	local function buildItems()
		for _,c in ipairs(listF:GetChildren()) do if c~=listLayout then c:Destroy()end end
		if #options==0 then
			New("TextLabel",{Size=UDim2.new(1,0,0,ITEM_H),BackgroundTransparency=1,Text="Aucune config",TextColor3=T.Label,TextSize=11,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Center,LayoutOrder=1,ZIndex=201,Parent=listF})
			return
		end
		for i,opt in ipairs(options) do
			local item=New("TextButton",{Size=UDim2.new(1,0,0,ITEM_H),BackgroundColor3=T.GroupHead,BackgroundTransparency=1,Text="",AutoButtonColor=false,BorderSizePixel=0,LayoutOrder=i,ZIndex=201,Parent=listF})
			New("UIPadding",{PaddingLeft=UDim.new(0,7),Parent=item})
			New("TextLabel",{Size=UDim2.new(1,-14,1,0),BackgroundTransparency=1,Text=opt,TextColor3=T.Text,TextSize=12,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=202,Parent=item})
			item.MouseEnter:Connect(function()TweenFast(item,{BackgroundColor3=T.ItemHover,BackgroundTransparency=0},0.1)end)
			item.MouseLeave:Connect(function()TweenFast(item,{BackgroundTransparency=1},0.1)end)
			item.MouseButton1Down:Connect(function()
				selected=opt;selLbl.Text=_dt();selLbl.TextColor3=_dc()
				closeList();TweenFast(btnF,{BackgroundColor3=T.Item},0.1);callback(opt)
			end)
		end
	end
	buildItems()
	local function openList()
		updPos();listF.Visible=true;backdrop.Visible=true;TweenFast(arrowImg,{Rotation=180},0.15)
		if updateConn2 then updateConn2:Disconnect()end
		updateConn2=btnF:GetPropertyChangedSignal("AbsolutePosition"):Connect(updPos)
	end
	btnF.MouseButton1Click:Connect(function()if open then closeList()else open=true;openList()end end)
	btnF.MouseEnter:Connect(function()TweenFast(btnF,{BackgroundColor3=T.ItemHover},0.1)end)
	btnF.MouseLeave:Connect(function()TweenFast(btnF,{BackgroundColor3=T.Item},0.1)end)
	cont.AncestryChanged:Connect(function()if not cont.Parent then listF:Destroy();backdrop:Destroy();if updateConn2 then updateConn2:Disconnect()end end end)
	local obj={}
	function obj:Get()return selected end
	function obj:Set(v)selected=v or "";selLbl.Text=_dt();selLbl.TextColor3=_dc()end
	function obj:SetOptions(newOpts)
		options=newOpts or {}
		local found=false
		for _,o in ipairs(options) do if o==selected then found=true;break end end
		if not found then selected="" end
		closeList();buildItems();selLbl.Text=_dt();selLbl.TextColor3=_dc()
	end
	return obj
end

function GB:AddLabel(cfg)
	cfg=cfg or {}
	local wrap=New("Frame",{Size=UDim2.new(1,0,0,20),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=self._body})
	New("Frame",{Size=UDim2.fromOffset(2,14),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),BackgroundColor3=T.Muted,BackgroundTransparency=0.5,BorderSizePixel=0,ZIndex=6,Parent=wrap})
	local lbl=New("TextLabel",{Size=UDim2.new(1,-10,1,0),Position=UDim2.new(0,8,0,0),BackgroundTransparency=1,Text=cfg.Name or "",TextColor3=T.Muted,TextSize=11,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,ZIndex=5,Parent=wrap})
	local obj={};function obj:Set(v)lbl.Text=v end;function obj:Get()return lbl.Text end;_AttachNotify(obj);return obj
end

function GB:AddKeybind(cfg)
	cfg=cfg or {}
	local value=RK(cfg.Default);local callback=cfg.Callback or function()end;local listening=false
	RegKey(value)
	local row=New("Frame",{Size=UDim2.new(1,0,0,24),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=self._body})
	New("TextLabel",{Size=UDim2.new(1,-80,1,0),BackgroundTransparency=1,Text=cfg.Name or "",TextColor3=T.Text,TextSize=12,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,ZIndex=6,Parent=row})
	local kb=New("TextButton",{Size=UDim2.fromOffset(74,18),Position=UDim2.new(1,-74,0.5,-9),BackgroundColor3=T.Item,Text=value and value.Name or "---",TextColor3=value and T.Muted or T.Label,TextSize=10,Font=F.Bold,AutoButtonColor=false,BorderSizePixel=0,ZIndex=6,Parent=row});Corner(kb,4)
	kb.MouseButton1Click:Connect(function()if listening then return end;listening=true;kb.Text="...";kb.TextColor3=T.Accent;TweenFast(kb,{BackgroundColor3=T.Border},0.1)end)
	kb.MouseButton2Click:Connect(function()listening=false;UnregKey(value);value=nil;kb.Text="---";kb.TextColor3=T.Label;TweenFast(kb,{BackgroundColor3=T.Item},0.1);callback(nil)end)
	CI(UIS.InputBegan,function(inp,gpe)if not listening then return end;if inp.UserInputType==Enum.UserInputType.Keyboard then listening=false;if KeyUsed(inp.KeyCode) then kb.Text=value and value.Name or "---";kb.TextColor3=value and T.Muted or T.Label;TweenFast(kb,{BackgroundColor3=T.Item},0.1);Notify("Key already in use",'"'..inp.KeyCode.Name..'" is already bound.');return end;UnregKey(value);value=inp.KeyCode;RegKey(value);kb.Text=value.Name;kb.TextColor3=T.Muted;TweenFast(kb,{BackgroundColor3=T.Item},0.1);callback(value)end end)
	kb.MouseEnter:Connect(function()if not listening then TweenFast(kb,{BackgroundColor3=T.ItemHover},0.1)end end)
	kb.MouseLeave:Connect(function()if not listening then TweenFast(kb,{BackgroundColor3=T.Item},0.1)end end)
	local obj={};function obj:Get()return value end;function obj:Set(v)UnregKey(value);value=RK(v);RegKey(value);kb.Text=value and value.Name or "---";kb.TextColor3=value and T.Muted or T.Label;callback(value)end;_AttachNotify(obj);return obj
end

function GB:AddSeparator()
	local wrap=New("Frame",{Size=UDim2.new(1,0,0,10),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=self._body})
	New("Frame",{Size=UDim2.new(0.44,0,0,1),Position=UDim2.new(0,0,0.5,0),BackgroundColor3=T.Border,BackgroundTransparency=0.1,BorderSizePixel=0,ZIndex=5,Parent=wrap})
	local dot=New("Frame",{Size=UDim2.fromOffset(4,4),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),BackgroundColor3=T.Accent,BackgroundTransparency=0.5,BorderSizePixel=0,ZIndex=6,Parent=wrap});Corner(dot,100)
	New("Frame",{Size=UDim2.new(0.44,0,0,1),Position=UDim2.new(0.56,0,0.5,0),BackgroundColor3=T.Border,BackgroundTransparency=0.1,BorderSizePixel=0,ZIndex=5,Parent=wrap})
end

function GB:AddTextSeparator(cfg)
	cfg=cfg or {};local label=cfg.Name or ""
	local wrap=New("Frame",{Size=UDim2.new(1,0,0,20),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=self._body})
	New("UIPadding",{PaddingTop=UDim.new(0,5),PaddingBottom=UDim.new(0,5),Parent=wrap})
	local inner=New("Frame",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=wrap})
	local lbl=New("TextLabel",{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),BackgroundColor3=T.GroupBG,BackgroundTransparency=0,BorderSizePixel=0,Text=" "..label.." ",TextColor3=T.Muted,TextSize=12,Font=F.Bold,TextXAlignment=Enum.TextXAlignment.Center,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,16),ZIndex=7,Parent=inner})
	New("Frame",{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),Size=UDim2.fromScale(1,0),SizeConstraint=Enum.SizeConstraint.RelativeXX,BackgroundColor3=T.Accent,BackgroundTransparency=0.8,BorderSizePixel=0,Size=UDim2.new(1,0,0,1),ZIndex=6,Parent=inner})
end

local Tab={};Tab.__index=Tab
function Tab._new(navF,contF,name,icon,order)
	local self=setmetatable({},Tab);name=name or ""
	local btn=New("TextButton",{Name=RN(8),Size=UDim2.new(1,0,0,32),BackgroundColor3=T.Accent,BackgroundTransparency=1,Text="",BorderSizePixel=0,AutoButtonColor=false,LayoutOrder=order,ZIndex=3,Parent=navF});Corner(btn,7)
	-- Accent indicator bar (left side, hidden by default)
	local indicator=New("Frame",{Size=UDim2.fromOffset(3,0),Position=UDim2.new(0,-4,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=T.Accent,BorderSizePixel=0,ZIndex=5,Parent=btn});Corner(indicator,100)
	local ia=RI(icon);local tl=10
	if ia then New("ImageLabel",{Size=UDim2.fromOffset(16,16),Position=UDim2.new(0,9,0.5,-8),BackgroundTransparency=1,Image=ia,ImageColor3=T.Muted,ZIndex=4,Parent=btn});tl=31 end
	local lbl=New("TextLabel",{Size=UDim2.new(1,-(tl+8),1,0),Position=UDim2.new(0,tl,0,0),BackgroundTransparency=1,Text=name,TextColor3=T.Muted,TextSize=13,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=4,Parent=btn})
	local scroll=New("ScrollingFrame",{Name=RN(8),Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=T.ScrollBar,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,Visible=false,ZIndex=2,Parent=contF})
	New("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,10),Parent=scroll})
	New("UIPadding",{PaddingTop=UDim.new(0,14),PaddingBottom=UDim.new(0,14),PaddingLeft=UDim.new(0,14),PaddingRight=UDim.new(0,14),Parent=scroll})
	self._btn=btn;self._lbl=lbl;self._iconImg=btn:FindFirstChildOfClass("ImageLabel");self._scroll=scroll;self._popover=nil;self._indicator=indicator
	return self
end
function Tab:_Select()
	self._scroll.Visible=true
	Tween(self._btn,{BackgroundTransparency=0.82},0.18,Enum.EasingStyle.Quint)
	Tween(self._indicator,{Size=UDim2.fromOffset(3,20),Position=UDim2.new(0,-1,0.5,0)},0.22,Enum.EasingStyle.Quint)
	self._lbl.Font=F.Bold
	TweenFast(self._lbl,{TextColor3=T.Accent},0.15)
	if self._iconImg then TweenFast(self._iconImg,{ImageColor3=T.Accent},0.15) end
end
function Tab:_Deselect()
	self._scroll.Visible=false
	Tween(self._btn,{BackgroundTransparency=1},0.18,Enum.EasingStyle.Quint)
	Tween(self._indicator,{Size=UDim2.fromOffset(3,0),Position=UDim2.new(0,-4,0.5,0)},0.18,Enum.EasingStyle.Quint)
	self._lbl.Font=F.Body
	TweenFast(self._lbl,{TextColor3=T.Muted},0.15)
	if self._iconImg then TweenFast(self._iconImg,{ImageColor3=T.Muted},0.15) end
end

local _AUTOREG_MAP={
	AddToggle="toggle",AddSlider="slider",AddInput="input",
	AddDropdown="dropdown",AddColorPicker="color",AddKeybind="keybind",
}
local function AutoRegBox(box)
	for method,prefix in pairs(_AUTOREG_MAP) do
		local orig=box[method]
		box[method]=function(self,cfg)
			local obj=orig(self,cfg)
			if obj and cfg and cfg.Name then
				Reg(prefix.."_"..((cfg.Name or ""):gsub("%s","_"):gsub("[=\n\r]","")),obj)
			end
			return obj
		end
	end
	return box
end

local function _AGB(scroll,pendingRowRef,popover,cfg)
	if type(cfg)=="string" then cfg={Name=cfg} end;cfg=cfg or {}
	local btype=cfg.type or 1;local side=cfg.side or "left"
	if btype==1 then
		return GB._new(scroll,cfg,UDim2.new(1,0,0,0),popover)
	elseif btype==2 then
		if side=="left" then
			local row=New("Frame",{Name=RN(8),Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0,ZIndex=3,Parent=scroll})
			New("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,8),Parent=row})
			pendingRowRef[1]=row
			return GB._new(row,cfg,UDim2.new(0.5,-4,0,0),popover)
		else
			local row=pendingRowRef[1] or New("Frame",{Name=RN(8),Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0,ZIndex=3,Parent=scroll})
			pendingRowRef[1]=nil
			return GB._new(row,cfg,UDim2.new(0.5,-4,0,0),popover)
		end
	end
end

function Tab:AddGroupBox(cfg)
	if not self._pendingRowRef then self._pendingRowRef={} end
	return AutoRegBox(_AGB(self._scroll,self._pendingRowRef,self._popover,cfg))
end

local Section={};Section.__index=Section
function Section._new(navF,contF,win,name,base)
	local self=setmetatable({},Section);self._navF=navF;self._contF=contF;self._win=win;self._base=base;self._tabCount=0
	local lbl=New("TextLabel",{Name=RN(8),Size=UDim2.new(1,0,0,26),BackgroundTransparency=1,Text=string.upper(name),TextColor3=T.Label,TextSize=11,Font=F.Bold,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=base,ZIndex=3,Parent=navF})
	New("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingTop=UDim.new(0,4),Parent=lbl})
	return self
end
function Section:AddTab(cfg)
	self._tabCount=self._tabCount+1;local order=self._base+self._tabCount
	local tab=Tab._new(self._navF,self._contF,cfg.Name or "",cfg.icon,order)
	tab._popover=self._win._popover
	local win=self._win
	tab._btn.MouseButton1Click:Connect(function()win:_SelectTab(tab)end)
	tab._btn.MouseEnter:Connect(function()
		if win._curTab~=tab then
			TweenFast(tab._btn,{BackgroundTransparency=0.88},0.1)
			TweenFast(tab._lbl,{TextColor3=T.Text},0.1)
			if tab._iconImg then TweenFast(tab._iconImg,{ImageColor3=T.Text},0.1) end
		end
	end)
	tab._btn.MouseLeave:Connect(function()
		if win._curTab~=tab then
			TweenFast(tab._btn,{BackgroundTransparency=1},0.12)
			TweenFast(tab._lbl,{TextColor3=T.Muted},0.12)
			if tab._iconImg then TweenFast(tab._iconImg,{ImageColor3=T.Muted},0.12) end
		end
	end)
	win._tabCount=(win._tabCount or 0)+1;if win._tabCount==1 then win:_SelectTab(tab)end
	return tab
end

local Window={};Window.__index=Window
local SW,WW,WH,TH,WIN_R=150,720,460,30,12

function Window._new(cfg)
	local self=setmetatable({},Window)
	self._cfg=cfg;self._secCount=0;self._tabCount=0;self._curTab=nil;self._maximized=false
	if cfg.Size then
		local w,h=tostring(cfg.Size):match("(%d+)x(%d+)")
		if w and h then
			WW=tonumber(w);WH=tonumber(h)
			SW=math.max(100,math.floor(WW*0.208))
		end
	end
	if cfg.ConfigFolder and cfg.ConfigFolder~="" then _CD=tostring(cfg.ConfigFolder) end
	self:_Build();self:_Loading()
	return self
end

function Window:_Loading()
	local cfg=self._cfg
	local g=New("ScreenGui",{Name=_NL,ResetOnSpawn=false,DisplayOrder=9999,ZIndexBehavior=Enum.ZIndexBehavior.Sibling,Parent=GetContainer()})
	ProtectGui(g)
	local bg=New("Frame",{Size=UDim2.fromOffset(WW,WH),Position=UDim2.new(0.5,-WW/2,0.5,-WH/2),BackgroundColor3=T.LoadBG,BorderSizePixel=0,ZIndex=1,Parent=g});Corner(bg,WIN_R)
	local ia=RI(cfg.Icon)
	if ia then New("ImageLabel",{Size=UDim2.fromOffset(180,180),Position=UDim2.new(0.5,-90,0.5,-160),BackgroundTransparency=1,Image=ia,ImageColor3=T.Text,ZIndex=2,Parent=bg})end
	New("TextLabel",{Size=UDim2.new(1,0,0,42),Position=UDim2.new(0,0,0.5,52),BackgroundTransparency=1,Text=cfg.Name or "Script",TextColor3=T.Text,TextSize=28,Font=F.Bold,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=2,Parent=bg})
	New("TextLabel",{Size=UDim2.new(1,0,0,22),Position=UDim2.new(0,0,0.5,98),BackgroundTransparency=1,Text=cfg.Subtitle or "",TextColor3=T.Muted,TextSize=14,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=2,Parent=bg})
	local bBG=New("Frame",{Size=UDim2.fromOffset(320,4),Position=UDim2.new(0.5,-160,0.5,136),BackgroundColor3=T.Border,BorderSizePixel=0,ZIndex=2,Parent=bg});Corner(bBG,100)
	local bFill=New("Frame",{Size=UDim2.fromOffset(0,4),BackgroundColor3=T.Accent,BorderSizePixel=0,ZIndex=3,Parent=bBG});Corner(bFill,100)
	Tween(bFill,{Size=UDim2.fromOffset(320,4)},1.3,Enum.EasingStyle.Exponential)
	task.delay(1.45,function()
		-- ── Transition : wipe gauche→droite synchronisé ───────────────────────
		--
		-- Le bord actif des deux clips avance ensemble de gauche vers droite :
		--
		--  LOADING  : clipper démarre pleine largeur, son bord GAUCHE avance →
		--             (position X augmente + taille diminue) → efface de G à D
		--
		--  MAIN     : clipper démarre largeur 0 ancré à droite, son bord GAUCHE
		--             avance aussi → (position X augmente + taille augmente)
		--             → révèle de G à D
		--
		-- Les deux bords gauches bougent au même rythme → effet "rideau" parfait.

		local DUR  = 1.1
		local EASE = Enum.EasingStyle.Sine
		-- Rebond : overshoot puis retour
		local BOUNCE_OVER = 18  -- pixels de dépassement côté droit
		local BOUNCE_DUR  = 0.18
		local BOUNCE_BACK = 0.14

		-- Position absolue du coin haut-gauche de la fenêtre (offset pur)
		local X0 = -WW/2  -- offset relatif au centre (Scale=0.5)

		-- Prépare la main : même position exacte, canvas totalement invisible
		self._win.Visible  = true
		self._canvas.GroupTransparency = 1

		-- ── LOADING clipper ──────────────────────────────────────────────────
		local loadClip = New("Frame",{
			Size     = UDim2.fromOffset(WW, WH),
			Position = UDim2.new(0.5, X0, 0.5, -WH/2),
			BackgroundTransparency=1, BorderSizePixel=0,
			ClipsDescendants=true, ZIndex=0, Parent=g
		})
		bg.Parent   = loadClip
		bg.Position = UDim2.fromOffset(0, 0)

		-- ── MAIN clipper ─────────────────────────────────────────────────────
		local mainClip = New("Frame",{
			Size     = UDim2.fromOffset(0, WH),
			Position = UDim2.new(0.5, X0, 0.5, -WH/2),
			BackgroundTransparency=1, BorderSizePixel=0,
			ClipsDescendants=true, ZIndex=0, Parent=self._gui
		})
		self._win.Parent   = mainClip
		self._win.Position = UDim2.fromOffset(0, 0)

		task.wait()

		-- LOADING : disparaît vers la droite
		TS:Create(loadClip, TweenInfo.new(DUR,EASE,Enum.EasingDirection.InOut),{
			Size     = UDim2.fromOffset(0, WH),
			Position = UDim2.new(0.5, X0+WW, 0.5, -WH/2),
		}):Play()

		-- MAIN : grandit jusqu'à WW (wipe principal)
		TS:Create(mainClip, TweenInfo.new(DUR,EASE,Enum.EasingDirection.InOut),{
			Size = UDim2.fromOffset(WW, WH),
		}):Play()

		-- Fondu croisé léger en parallèle
		TS:Create(self._canvas, TweenInfo.new(DUR,EASE,Enum.EasingDirection.InOut),{
			GroupTransparency=0,
		}):Play()

		-- Rebond : après le wipe, le bord droit dépasse puis revient
		task.delay(DUR, function()
			if not mainClip or not mainClip.Parent then return end
			-- Phase 1 : overshoot → mainClip grandit de BOUNCE_OVER pixels (côté droit)
			TS:Create(mainClip, TweenInfo.new(BOUNCE_DUR, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{
				Size = UDim2.fromOffset(WW + BOUNCE_OVER, WH),
			}):Play()
			-- Phase 2 : retour à la taille exacte
			task.delay(BOUNCE_DUR, function()
				if not mainClip or not mainClip.Parent then return end
				TS:Create(mainClip, TweenInfo.new(BOUNCE_BACK, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),{
					Size = UDim2.fromOffset(WW, WH),
				}):Play()
			end)
		end)

		task.delay(DUR - 0.14, function()
			_CascadeBoxes()
		end)
		task.delay(DUR + BOUNCE_DUR + BOUNCE_BACK + 0.02, function()
			self._win.Parent   = self._gui
			self._win.Position = UDim2.new(0.5, -WW/2, 0.5, -WH/2)
			g:Destroy()
			mainClip:Destroy()
			local alName=_GetAL()
			if alName and alName~="" then
				local ok1,content=pcall(readfile,_CP(alName))
				if ok1 then
					local ok2,data=pcall(function()return _HS:JSONDecode(content)end)
					if ok2 then _Des(data);Notify("Autoload","'"..alName.."' chargée automatiquement.",3)
					else Notify("Autoload","Autoload corrompu.",2) end
				else Notify("Autoload","Fichier autoload introuvable.",2) end
			end
		end)
	end)
end

function Window:_Build()
	local cfg=self._cfg;local transp=cfg.Transparency==true
	self._transp=transp
	self._gui=New("ScreenGui",{Name=_NG,ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling,Parent=GetContainer()})
	ProtectGui(self._gui)
	self._win=New("Frame",{Name=RN(8),Size=UDim2.fromOffset(WW,WH),Position=UDim2.new(0.5,-WW/2,0.5,-WH/2),BackgroundTransparency=1,BorderSizePixel=0,Visible=false,ZIndex=1,Parent=self._gui})
	self._canvas=New("CanvasGroup",{Name=RN(8),Size=UDim2.fromScale(1,1),BackgroundColor3=T.Sidebar,BackgroundTransparency=transp and 0.13 or 0,GroupTransparency=0,BorderSizePixel=0,ZIndex=1,Parent=self._win})
	Corner(self._canvas,WIN_R)
	self._popover=New("Frame",{Name=RN(8),Size=UDim2.fromScale(1,1),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=500,Parent=self._win})
	self:_Sidebar();self:_TopBar();self:_Content();self:_Settings();self:_Drag()
end

function Window:_Sidebar()
	local sb=New("Frame",{Size=UDim2.new(0,SW,1,-TH),Position=UDim2.new(0,0,0,TH),BackgroundColor3=T.Sidebar,BackgroundTransparency=self._transp and 0.13 or 0,BorderSizePixel=0,ZIndex=2,Parent=self._canvas})
	self._sidebar = sb
	New("Frame",{Size=UDim2.new(0,1,1,0),Position=UDim2.new(1,-1,0,0),BackgroundColor3=T.Accent,BackgroundTransparency=0.8,BorderSizePixel=0,ZIndex=4,Parent=sb})
	self._navF=New("ScrollingFrame",{Size=UDim2.new(1,0,1,-50),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=2,ScrollBarImageColor3=T.ScrollBar,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ZIndex=3,Parent=sb})
	New("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,1),Parent=self._navF})
	New("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8),PaddingTop=UDim.new(0,8),Parent=self._navF})
	self._setZone=New("Frame",{Name=RN(8),Size=UDim2.new(1,0,0,50),Position=UDim2.new(0,0,1,-50),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=3,Parent=sb})
	New("Frame",{Size=UDim2.new(1,-20,0,1),Position=UDim2.new(0,10,0,0),BackgroundColor3=T.Accent,BackgroundTransparency=0.8,BorderSizePixel=0,ZIndex=4,Parent=self._setZone})
end

function Window:_TopBar()
	local cfg=self._cfg
	local tb=New("Frame",{Size=UDim2.new(1,0,0,TH),BackgroundColor3=T.Sidebar,BackgroundTransparency=self._transp and 0.13 or 0,BorderSizePixel=0,ZIndex=3,Parent=self._canvas})
	self._topBar=tb
	New("Frame",{Size=UDim2.new(1,0,0,1),Position=UDim2.new(0,0,1,-1),BackgroundColor3=T.Accent,BackgroundTransparency=0.8,BorderSizePixel=0,ZIndex=4,Parent=tb})
	local ia=RI(cfg.Icon);local tl=14
	if ia then New("ImageLabel",{Size=UDim2.fromOffset(20,20),Position=UDim2.new(0,12,0.5,-10),BackgroundTransparency=1,Image=ia,ImageColor3=T.Accent,ZIndex=5,Parent=tb});tl=40 end
	New("TextLabel",{Size=UDim2.new(0.5,0,0,14),Position=UDim2.new(0,tl,0.5,-14),BackgroundTransparency=1,Text=string.upper(cfg.Name or "Script"),TextColor3=T.Text,TextSize=12,Font=F.Bold,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=5,Parent=tb})
	New("TextLabel",{Size=UDim2.new(0.5,0,0,11),Position=UDim2.new(0,tl,0.5,1),BackgroundTransparency=1,Text=cfg.Subtitle or "",TextColor3=T.Muted,TextSize=11,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=5,Parent=tb})
	-- Boutons titlebar style Fluent : rectangulaires, fond transparent, hover/click via tween
	local TB_BTN_W,TB_BTN_PAD,TB_BTN_R=34,4,7
	local TB_ASSETS={
		Min ="rbxassetid://9886659276",
		Max ="rbxassetid://9886659406",
		Restore="rbxassetid://9886659001",
		Close="rbxassetid://9886659671",
	}
	local oldS,oldP
	local TB_DEFS={
		{ico=TB_ASSETS.Min, cb=function()self:Toggle()end},
		{ico=TB_ASSETS.Max, cb=function()
			if self._maximized then
				Tween(self._win,{Size=oldS,Position=oldP},0.38,Enum.EasingStyle.Exponential)
				self._maximized=false
				if self._tbMaxIcon then self._tbMaxIcon.Image=TB_ASSETS.Max end
			else
				oldS=self._win.Size;oldP=self._win.Position
				Tween(self._win,{Size=UDim2.new(1,-2,1,-2),Position=UDim2.fromOffset(1,1)},0.38,Enum.EasingStyle.Exponential)
				self._maximized=true
				if self._tbMaxIcon then self._tbMaxIcon.Image=TB_ASSETS.Restore end
			end
		end},
		{ico=TB_ASSETS.Close, cb=function()self:_CloseDialog()end},
	}
	local dh=New("Frame",{
		Size=UDim2.fromOffset(#TB_DEFS*(TB_BTN_W+TB_BTN_PAD),TH),
		AnchorPoint=Vector2.new(1,0),Position=UDim2.new(1,-4,0,0),
		BackgroundTransparency=1,ZIndex=4,Parent=tb
	})
	local dll=Instance.new("UIListLayout")
	dll.FillDirection=Enum.FillDirection.Horizontal
	dll.HorizontalAlignment=Enum.HorizontalAlignment.Right
	dll.VerticalAlignment=Enum.VerticalAlignment.Center
	dll.Padding=UDim.new(0,TB_BTN_PAD)
	dll.SortOrder=Enum.SortOrder.LayoutOrder
	dll.Parent=dh
	for i,d in ipairs(TB_DEFS) do
		local btn=New("TextButton",{
			Size=UDim2.new(0,TB_BTN_W,1,-8),
			AnchorPoint=Vector2.new(1,0),
			BackgroundTransparency=1,
			Text="",BorderSizePixel=0,AutoButtonColor=false,
			LayoutOrder=i,ZIndex=5,Parent=dh
		})
		Corner(btn,TB_BTN_R)
		local ic=New("ImageLabel",{
			Size=UDim2.fromOffset(16,16),
			AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),
			BackgroundTransparency=1,Image=d.ico,ImageColor3=T.Text,ZIndex=6,Parent=btn
		})
		if i==#TB_DEFS-1 then self._tbMaxIcon=ic end  -- garder ref au bouton Max pour changer l'icon
		btn.MouseEnter:Connect(function()TweenFast(btn,{BackgroundTransparency=0.94},0.12)end)
		btn.MouseLeave:Connect(function()TweenFast(btn,{BackgroundTransparency=1},0.15)end)
		btn.MouseButton1Down:Connect(function()TweenFast(btn,{BackgroundTransparency=0.96},0.08)end)
		btn.MouseButton1Up:Connect(function()TweenFast(btn,{BackgroundTransparency=0.94},0.08)end)
		btn.MouseButton1Click:Connect(function()d.cb()end)
	end
end

function Window:_Content()
	self._cont=New("Frame",{Name=RN(8),Size=UDim2.new(1,-SW,1,-TH),Position=UDim2.new(0,SW,0,TH),BackgroundColor3=T.Content,BackgroundTransparency=self._transp and 0.35 or 0,BorderSizePixel=0,ZIndex=1,Parent=self._canvas})
end

function Window:_Settings()
	local scroll=New("ScrollingFrame",{Name=RN(8),Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=T.ScrollBar,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,Visible=false,ZIndex=2,Parent=self._cont})
	New("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,10),Parent=scroll})
	New("UIPadding",{PaddingTop=UDim.new(0,14),PaddingBottom=UDim.new(0,14),PaddingLeft=UDim.new(0,14),PaddingRight=UDim.new(0,14),Parent=scroll})
	local AVATAR_S=34
	local card=New("Frame",{Size=UDim2.new(1,-16,0,38),Position=UDim2.new(0,8,0,8),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=4,Parent=self._setZone})
	local avatarBg=New("Frame",{Size=UDim2.fromOffset(AVATAR_S,AVATAR_S),Position=UDim2.fromOffset(5,2),BackgroundColor3=T.Border,BorderSizePixel=0,ZIndex=5,Parent=card});Corner(avatarBg,100)
	local avatarImg=New("ImageLabel",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Image="rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=48&h=48",ZIndex=6,Parent=avatarBg});Corner(avatarImg,100)
	local txtX=AVATAR_S+10;local EDIT_BTN_W=16;local txtW=-(txtX+EDIT_BTN_W+10)
	local function adaptSize(text,maxS,minS,threshold)local n=math.min(#text,20);if n<=threshold then return maxS end;return math.max(minS,math.floor(maxS-(maxS-minS)*(n-threshold)/(20-threshold)))end
	New("TextLabel",{Size=UDim2.new(1,txtW,0,14),Position=UDim2.fromOffset(txtX,5),BackgroundTransparency=1,Text=LP.DisplayName,TextColor3=T.Text,TextSize=adaptSize(LP.DisplayName,12,8,8),Font=F.Bold,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,ZIndex=5,Parent=card})
	New("TextLabel",{Size=UDim2.new(1,txtW,0,12),Position=UDim2.fromOffset(txtX,20),BackgroundTransparency=1,Text="@"..LP.Name,TextColor3=T.Muted,TextSize=adaptSize("@"..LP.Name,10,7,8),Font=F.Body,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,ZIndex=5,Parent=card})
	local editBtn=New("TextButton",{Size=UDim2.fromOffset(EDIT_BTN_W,EDIT_BTN_W),Position=UDim2.new(1,-(EDIT_BTN_W+4),0,5),BackgroundTransparency=1,Text="",AutoButtonColor=false,BorderSizePixel=0,ZIndex=6,Parent=card})
	local editIcon=New("ImageLabel",{Size=UDim2.fromOffset(EDIT_BTN_W,EDIT_BTN_W),BackgroundTransparency=1,Image=RI("lucide-settings") or RI("lucide-cog") or "",ImageColor3=T.Label,ZIndex=7,Parent=editBtn})
	self._editIcon=editIcon
	editBtn.MouseEnter:Connect(function()TweenFast(editIcon,{ImageColor3=T.Accent},0.1)end)
	editBtn.MouseLeave:Connect(function()if self._curTab~=self._setTab then TweenFast(editIcon,{ImageColor3=T.Label},0.1)end end)
	local cfgRow=New("Frame",{Name=RN(8),Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0,ZIndex=3,Parent=scroll})
	New("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,8),Parent=cfgRow})
	local leftCol=New("Frame",{Name=RN(8),Size=UDim2.new(0.5,-4,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=0,ZIndex=3,Parent=cfgRow})
	New("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,8),Parent=leftCol})
	local kbBox=GB._new(leftCol,{Name="Keybinds"},UDim2.new(1,0,0,0),self._popover)
	kbBox._wrap.LayoutOrder=0
	local _toggleKbConn=nil
	local _unloadKbConn=nil
	local _defaultToggleKey=RK(self._cfg.ToggleKey)
	local function _setupToggleConn(key)
		if _toggleKbConn then _toggleKbConn:Disconnect();_toggleKbConn=nil end
		if key then
			local db=false
			_toggleKbConn=CI(UIS.InputBegan,function(inp,gpe)
				if not gpe and inp.KeyCode==key and not db then
					db=true;self:Toggle();task.delay(0.4,function()db=false end)
				end
			end)
		end
	end
	local function _setupUnloadConn(key)
		if _unloadKbConn then _unloadKbConn:Disconnect();_unloadKbConn=nil end
		if key then
			_unloadKbConn=CI(UIS.InputBegan,function(inp,gpe)
				if not gpe and inp.KeyCode==key then
					if _unloadKbConn then _unloadKbConn:Disconnect();_unloadKbConn=nil end
					if _toggleKbConn then _toggleKbConn:Disconnect();_toggleKbConn=nil end
					for k,o in pairs(_Reg) do
						pcall(function()
							if k:sub(1,7)=="toggle_" then o:Set(false)
							elseif k:sub(1,7)=="slider_" then o:Set(0)
							elseif k:sub(1,6)=="input_" then o:Set("")
							end
						end)
					end
					self:Destroy()
				end
			end)
		end
	end
	kbBox:AddKeybind({Name="Afficher / Masquer",Default=_defaultToggleKey,Callback=function(key)
		_setupToggleConn(key)
	end})
	_setupToggleConn(_defaultToggleKey)
	kbBox:AddSeparator()
	local _defaultUnloadKey=RK("Delete")
	kbBox:AddKeybind({Name="Unload",Default=_defaultUnloadKey,Callback=function(key)
		_setupUnloadConn(key)
	end})
	_setupUnloadConn(_defaultUnloadKey)
	local cfgBox=GB._new(cfgRow,{Name="Config"},UDim2.new(0.5,-4,0,0),self._popover)
	cfgBox._wrap.LayoutOrder=1
	local cfgDropdown
	local cfgNameInput=cfgBox:AddInput({Name="",Default="",Placeholder="Ma config..."})
	local function CfgPopup(title,body,confirmText,confirmColor,confirmFg,onConfirm)
		local ov=New("Frame",{Size=UDim2.fromScale(1,1),BackgroundColor3=T.Black,BackgroundTransparency=0.5,BorderSizePixel=0,ZIndex=200,Parent=self._canvas})
		-- Bloque tous les clics sur le reste de la fenêtre
		New("TextButton",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Text="",AutoButtonColor=false,BorderSizePixel=0,ZIndex=200,Active=true,Parent=ov})
		local card2=New("Frame",{Size=UDim2.fromOffset(240,110),Position=UDim2.new(0.5,-120,0.5,-55),BackgroundColor3=T.GroupHead,BorderSizePixel=0,ZIndex=201,Parent=ov});Corner(card2,10)
		New("TextLabel",{Size=UDim2.new(1,-20,0,22),Position=UDim2.new(0,10,0,12),BackgroundTransparency=1,Text=title,TextColor3=T.Text,TextSize=13,Font=F.Bold,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=202,Parent=card2})
		New("TextLabel",{Size=UDim2.new(1,-20,0,18),Position=UDim2.new(0,10,0,34),BackgroundTransparency=1,Text=body,TextColor3=T.Muted,TextSize=11,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,ZIndex=202,Parent=card2})
		local bC=New("TextButton",{Size=UDim2.fromOffset(105,26),Position=UDim2.new(0,10,1,-36),BackgroundColor3=T.Item,Text="Annuler",TextColor3=T.Muted,TextSize=12,Font=F.Body,AutoButtonColor=false,BorderSizePixel=0,ZIndex=203,Parent=card2});Corner(bC,6)
		local bX=New("TextButton",{Size=UDim2.fromOffset(105,26),Position=UDim2.new(0,125,1,-36),BackgroundColor3=confirmColor,Text=confirmText,TextColor3=confirmFg,TextSize=12,Font=F.Bold,AutoButtonColor=false,BorderSizePixel=0,ZIndex=203,Parent=card2});Corner(bX,6)
		bC.MouseEnter:Connect(function()TweenFast(bC,{BackgroundColor3=T.ItemHover},0.1)end);bC.MouseLeave:Connect(function()TweenFast(bC,{BackgroundColor3=T.Item},0.1)end)
		local hc=Color3.new(confirmColor.R*1.2,confirmColor.G*1.2,confirmColor.B*1.2)
		bX.MouseEnter:Connect(function()TweenFast(bX,{BackgroundColor3=hc},0.1)end);bX.MouseLeave:Connect(function()TweenFast(bX,{BackgroundColor3=confirmColor},0.1)end)
		bC.MouseButton1Click:Connect(function()ov:Destroy()end)
		bX.MouseButton1Click:Connect(function()ov:Destroy();onConfirm()end)
	end
	local function _PrettyJSON(val,indent)
		indent=indent or 0
		local pad=string.rep("  ",indent);local pad1=string.rep("  ",indent+1)
		local t=type(val)
		if t=="boolean" then return val and "true" or "false"
		elseif t=="number" then return tostring(val)
		elseif t=="string" then
			local s=val:gsub('\\','\\\\'):gsub('"','\\"'):gsub('\n','\\n'):gsub('\r','\\r'):gsub('\t','\\t')
			return '"'..s..'"'
		elseif t=="table" then
			local isArray=(#val>0)
			if isArray then
				local items={};for _,v in ipairs(val) do table.insert(items,pad1.._PrettyJSON(v,indent+1))end
				if #items==0 then return "[]" end
				return "[\n"..table.concat(items,",\n").."\n"..pad.."]"
			else
				local items={};for k,v in pairs(val) do table.insert(items,pad1..'"'..tostring(k)..'": '.._PrettyJSON(v,indent+1))end
				if #items==0 then return "{}" end
				return "{\n"..table.concat(items,",\n").."\n"..pad.."}"
			end
		end
		return "null"
	end
	local function DoSave(safe)
		_ED()
		local ok1,encoded=pcall(function()return _PrettyJSON(_Ser())end)
		if not ok1 then Notify("Config","Erreur d'encodage JSON.",2);return end
		local ok2=pcall(writefile,_CP(safe),encoded)
		if ok2 then
			Notify("Config","'"..safe.."' sauvegardée !",3)
			local list=_LC();cfgDropdown:SetOptions(list);cfgDropdown:Set(safe)
			cfgNameInput:Set("")
		else Notify("Config","Impossible d'écrire le fichier.",2) end
	end
	cfgBox:AddButton({Name="Save Config",Callback=function()
		local name=cfgNameInput:Get();name=name:match("^%s*(.-)%s*$")
		if name=="" then Notify("Config","Le nom est vide.",2);return end
		local safe=name:gsub("[^%w%-%_%. ]","_")
		if isfile and isfile(_CP(safe)) then
			CfgPopup("Écraser la config ?","'"..safe.."' existe déjà. Continuer écrasera l'ancienne.","Confirmer",T.Accent,Color3.fromRGB(25,18,5),function()DoSave(safe)end)
		else DoSave(safe) end
	end})
	cfgBox:AddTextSeparator({Name="Presets"})
	cfgDropdown=cfgBox:AddDynamicDropdown({Name="",Placeholder="Select config",Options=_LC()})
	cfgBox:AddButton({Name="Load Config",Callback=function()
		local name=cfgDropdown:Get()
		if not name or name=="" then Notify("Config","Aucune config sélectionnée.",2);return end
		local ok1,content=pcall(readfile,_CP(name))
		if not ok1 then Notify("Config","Fichier introuvable.",2);return end
		local ok2,data=pcall(function()return _HS:JSONDecode(content)end)
		if not ok2 then Notify("Config","Config corrompue.",2);return end
		_Des(data);Notify("Config","'"..name.."' chargée !",3)
	end})
	local function _ALText(n)return n and ("Current : "..n) or "No autoload set" end
	local alLabel
	cfgBox:AddButton({Name="Delete Config",Callback=function()
		local name=cfgDropdown:Get()
		if not name or name=="" then Notify("Config","Aucune config sélectionnée.",2);return end
		CfgPopup("Supprimer la config ?","'"..name.."' sera définitivement supprimée.","Supprimer",Color3.fromRGB(160,40,40),Color3.fromRGB(255,200,200),function()
			local delFn=delfile or deletefile
			if not delFn then Notify("Config","Suppression non supportée.",2);return end
			local ok=pcall(delFn,_CP(name))
			if ok then
				Notify("Config","'"..name.."' supprimée.",3)
				if _GetAL()==name then
					_ClearAL()
					if alLabel then alLabel:Set(_ALText(nil)) end
					Notify("Autoload","Autoload retiré (config supprimée).",3)
				end
				local list=_LC();cfgDropdown:SetOptions(list);cfgDropdown:Set(list[1] or "")
			else Notify("Config","Impossible de supprimer.",2) end
		end)
	end})
	cfgBox:AddTextSeparator({Name="Autoload"})
	alLabel=cfgBox:AddLabel({Name=_ALText(_GetAL())})
	cfgBox:AddButton({Name="Set Autoload",Callback=function()
		local name=cfgDropdown:Get()
		if not name or name=="" then Notify("Autoload","Aucune config sélectionnée.",2);return end
		_SetAL(name)
		alLabel:Set(_ALText(name))
		Notify("Autoload","'"..name.."' chargée au démarrage.",3)
	end})
	cfgBox:AddButton({Name="Remove Autoload",Callback=function()
		local cur=_GetAL()
		_ClearAL()
		alLabel:Set(_ALText(nil))
		if cur then Notify("Autoload","Autoload retiré ('"..cur.."').",3)
		else Notify("Autoload","Aucun autoload défini.",2) end
	end})

	-- ── Themes ────────────────────────────────────────────────────────────────
	local _ThemeDefs={
		{Name="Or",     Accent=Color3.fromHex("#c58f1d"), AccentFg=Color3.fromHex("#9e7216")},
		{Name="Rouge",  Accent=Color3.fromHex("#d7051c"), AccentFg=Color3.fromHex("#a80416")},
		{Name="Bleu",  Accent=Color3.fromHex("#001baf"), AccentFg=Color3.fromHex("#00148a")},
		{Name="Forêt",  Accent=Color3.fromHex("#00a002"), AccentFg=Color3.fromHex("#007d01")},
		{Name="Violet", Accent=Color3.fromHex("#3b0089"), AccentFg=Color3.fromHex("#2d006b")},
		{Name="Rose",   Accent=Color3.fromHex("#ff2d79"), AccentFg=Color3.fromHex("#cc2260")},
	}
	local _themeNames={"Or","Rouge","Bleu","Forêt","Violet","Rose"}
	local _curThemeName="Rose"
	local function _ApplyTheme(name)
		local th
		for _,v in ipairs(_ThemeDefs) do if v.Name==name then th=v;break end end
		if not th then return end
		local oldA,oldFg=T.Accent,T.AccentFg
		T.Accent=th.Accent;T.AccentFg=th.AccentFg;T.ToggleOn=th.Accent
		_curThemeName=name
		for _,desc in ipairs(self._gui:GetDescendants()) do
			pcall(function()if desc.BackgroundColor3==oldA then desc.BackgroundColor3=th.Accent end end)
			pcall(function()if desc.BackgroundColor3==oldFg then desc.BackgroundColor3=th.AccentFg end end)
			pcall(function()if desc.ImageColor3==oldA then desc.ImageColor3=th.Accent end end)
		end
	end
	local themeBox=GB._new(leftCol,{Name="Thème",side="left"},UDim2.new(1,0,0,0),self._popover)
	themeBox._wrap.LayoutOrder=1
	local _themeColors={
		Or          =Color3.fromHex("#c58f1d"),
		Rouge       =Color3.fromHex("#d7051c"),
		["Bleu"]   =Color3.fromHex("#001baf"),
		["Forêt"]   =Color3.fromHex("#00a002"),
		Violet      =Color3.fromHex("#3b0089"),
		Rose        =Color3.fromHex("#ff2d79"),
	}
	themeBox:AddDropdown({Name="Thème actif",Options=_themeNames,Default=_curThemeName,Colors=_themeColors,Callback=function(v)_ApplyTheme(v)end})

	local popover=self._popover;local stPendingRow={}
	local st={
		_btn=card,_lbl=nil,_iconImg=nil,_scroll=scroll,_pendingRow=nil,_popover=popover,
		_Select=function(t2)t2._scroll.Visible=true;if cfgDropdown then cfgDropdown:SetOptions(_LC())end end,
		_Deselect=function(t2)t2._scroll.Visible=false end,
	}
	st.AddGroupBox=function(t2,cfg2)return AutoRegBox(_AGB(t2._scroll,stPendingRow,t2._popover,cfg2))end
	self._setTab=st;self.Settings=st
	self._prevSettingsTab=nil
	editBtn.MouseButton1Down:Connect(function()
		if self._curTab==self._setTab then
			self._setTab:_Deselect();TweenFast(editIcon,{ImageColor3=T.Label},0.12)
			local prev=self._prevSettingsTab
			if prev then self._curTab=prev;prev:_Select()else self._curTab=nil end
		else
			self._prevSettingsTab=self._curTab
			if self._curTab then self._curTab:_Deselect()end
			self._curTab=self._setTab;self._setTab:_Select()
			TweenFast(editIcon,{ImageColor3=T.Accent},0.12)
		end
	end)
end

function Window:_Drag()
	local win=self._win;local tb=self._topBar
	local drag,mayDrag,ds,sp=false,false,nil,nil;local THRESHOLD=4
	tb.InputBegan:Connect(function(inp)
		if inp.UserInputType==Enum.UserInputType.MouseButton1 then
			mayDrag=true;drag=false;ds=inp.Position;sp=win.Position
			if self._maximized then self._maximized=false;win.Size=UDim2.fromOffset(WW,WH);win.Position=UDim2.new(0.5,-WW/2,0.5,-WH/2);sp=win.Position end
		end
	end)
	CI(UIS.InputChanged,function(inp)
		if mayDrag and inp.UserInputType==Enum.UserInputType.MouseMovement then
			local d=inp.Position-ds
			if not drag and (math.abs(d.X)+math.abs(d.Y))>=THRESHOLD then drag=true end
			if drag then win.Position=UDim2.new(sp.X.Scale,sp.X.Offset+d.X,sp.Y.Scale,sp.Y.Offset+d.Y)end
		end
	end)
	CI(UIS.InputEnded,function(inp)if inp.UserInputType==Enum.UserInputType.MouseButton1 then drag=false;mayDrag=false end end)
end

function Window:_SelectTab(tab)
	if self._curTab then self._curTab:_Deselect()end
	if self._curTab==self._setTab and self._editIcon then TweenFast(self._editIcon,{ImageColor3=T.Label},0.12)end
	self._curTab=tab;tab:_Select()
end
function Window:AddSection(name)
	self._secCount=self._secCount+1
	return Section._new(self._navF,self._cont,self,name,self._secCount*100)
end
function Window:SetToggleKey(key)
	local resolvedKey=RK(key);local db=false
	CI(UIS.InputBegan,function(inp,gpe)if not gpe and inp.KeyCode==resolvedKey and not db then db=true;self:Toggle();task.delay(0.4,function()db=false end)end end)
end
function Window:Toggle()self._win.Visible=not self._win.Visible end
function Window:_CloseDialog()
	local ov=New("Frame",{Size=UDim2.fromScale(1,1),BackgroundColor3=T.Black,BackgroundTransparency=0.5,BorderSizePixel=0,ZIndex=20,Parent=self._canvas})
	-- Bloque tous les clics sur le reste de la fenêtre
	New("TextButton",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Text="",AutoButtonColor=false,BorderSizePixel=0,ZIndex=20,Active=true,Parent=ov})
	local card=New("Frame",{Size=UDim2.fromOffset(220,110),Position=UDim2.new(0.5,-110,0.5,-55),BackgroundColor3=T.GroupHead,BorderSizePixel=0,ZIndex=21,Parent=ov});Corner(card,10)
	New("TextLabel",{Size=UDim2.new(1,-20,0,22),Position=UDim2.new(0,10,0,12),BackgroundTransparency=1,Text="Close script?",TextColor3=T.Text,TextSize=13,Font=F.Bold,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=22,Parent=card})
	New("TextLabel",{Size=UDim2.new(1,-20,0,18),Position=UDim2.new(0,10,0,34),BackgroundTransparency=1,Text="The interface will be removed.",TextColor3=T.Muted,TextSize=11,Font=F.Body,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=22,Parent=card})
	local bC=New("TextButton",{Size=UDim2.fromOffset(95,26),Position=UDim2.new(0,10,1,-36),BackgroundColor3=T.Item,Text="Cancel",TextColor3=T.Muted,TextSize=12,Font=F.Body,AutoButtonColor=false,BorderSizePixel=0,ZIndex=23,Parent=card});Corner(bC,6)
	local bX=New("TextButton",{Size=UDim2.fromOffset(95,26),Position=UDim2.new(0,115,1,-36),BackgroundColor3=Color3.fromRGB(160,40,40),Text="Close",TextColor3=Color3.fromRGB(255,200,200),TextSize=12,Font=F.Bold,AutoButtonColor=false,BorderSizePixel=0,ZIndex=23,Parent=card});Corner(bX,6)
	bC.MouseEnter:Connect(function()TweenFast(bC,{BackgroundColor3=T.ItemHover},0.1)end);bC.MouseLeave:Connect(function()TweenFast(bC,{BackgroundColor3=T.Item},0.1)end)
	bX.MouseEnter:Connect(function()TweenFast(bX,{BackgroundColor3=Color3.fromRGB(190,55,55)},0.1)end);bX.MouseLeave:Connect(function()TweenFast(bX,{BackgroundColor3=Color3.fromRGB(160,40,40)},0.1)end)
	bC.MouseButton1Click:Connect(function()ov:Destroy()end)
	bX.MouseButton1Click:Connect(function()ov:Destroy();self:Destroy()end)
end
function Window:Destroy()self._gui:Destroy()end

-- Expose the library
return Window