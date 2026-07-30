return function(mod)
	-- Add Items
	mod.content.items:register("MIST_STONE", {
		id = "MIST_STONE",
		name = "MIST STONE",
		price = 4200,
		tossable = true,
	})
	mod.content.text_pointers:patch("CeladonMart4F", {
		TEXT_CELADONMART4F_CLERK = { mart = { __append = { "MIST_STONE" } } },
	})
	dex_no = 1

	-- Bulbasaur Line
	mod.content.pokemon:patch("BULBASAUR", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("IVYSAUR", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("VENUSAUR", { dex = dex_no })
	dex_no = dex_no + 1
	SapuDex = "A POKéMON as\nhuge as a buil-\nding, with a\ntropical tree\non his back \nthat, on bigger\n beings, becomes \nan entire forest."
	mod.content.text:register("_SapusaurDexEntry", SapuDex)
	mod.content.pokemon:register("SAPUSAUR", {
		id = "SAPUSAUR",
		name = "SAPUSAUR",
		dex = dex_no,
			dexEntry = { 
			heightFt = 19,
			heightIn = 8,
			kind = "OVERGROWTH",
			weight = 2204.6,
			text = "_SapusaurDexEntry"},
		types = { "PLANT", "POISON" },
		baseStats = { 
			hp = 130, 
			attack = 105, 
			defense = 135, 
			speed = 35, 
			special = 145 },
		catchRate = 45, 
		baseExp = 255, 
		growthRate = "SLOW",
		level1Moves = { "ROAR", "LEECH_SEED", "TACKLE", "VINE_WHIP" }, 
		learnset = {
			{ level = 7, move = "LEECH_SEED" },
			{ level = 13, move = "VINE_WHIP" },
			{ level = 22, move = "POISONPOWDER" },
			{ level = 30, move = "RAZOR_LEAF" },
			{ level = 38, move = "MIST" },
			{ level = 43, move = "GROWTH" },
			{ level = 48, move = "STUN_POWDER" },
			{ level = 55, move = "SLEEP_POWDER" },
			{ level = 58, move = "SLUDGE" },
			{ level = 65, move = "SOLARBEAM" },
			{ level = 72, move = "PETAL_DANCE" },
		}, 
		tms = {
			"SWORDS_DANCE", 
			"TOXIC", 
			"BODY_SLAM", 
			"TAKE_DOWN", 
			"DOUBLE_EDGE", 
			"HYPER_BEAM", 
			"RAGE", 
			"MEGA_DRAIN", 
			"SOLAR_BEAM", 
			"MIMIC", 
			"REFLECT", 
			"BIDE", 
			"REST", 
			"SUBSTITUTE",
			"CUT"
		},
		evolutions = {},
		spriteFront = mod.assets:path("assets/sapusaur_front.png"),
		spriteBack = mod.assets:path("assets/sapusaur_back.png"),
		frontSize = 6,
		palette = "GREENMON"
	})
	mod.content.pokemon:patch( "VENUSAUR", { evolutions = {
		{
        item = "LEAF_STONE",
        level = 1,
        method = "ITEM",
        species = "SAPUSAUR",
      },
	}})
	mod.content.cries:register("SAPUSAUR", { file = mod.assets:path("assets/sapusaur_cry.wav") })
	mod.content.icons:register("SAPUSAUR", "GRASS")
	dex_no = dex_no + 1

	-- Charmander Line
	mod.content.pokemon:patch("CHARMANDER", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("CHARMELEON", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("CHARIZARD", { dex = dex_no })
	dex_no = dex_no + 1
	-- NEW MON: SKELOZARD
	ColtDex = "Lives in the \nheart of active\nvolcanoes that,\nwhen erupting,\nthey fly away \nat such speed\nno one can no-\ntice them clearly"
	mod.content.text:register("_CharcoltDexEntry", ColtDex)
	mod.content.pokemon:register("CHARCOLT", {
		id = "CHARCOLT",
		name = "CHARCOLT",
		dex = dex_no,
			dexEntry = { 
			heightFt = 8,
			heightIn = 6,
			kind = "FIREDRAGON",
			weight = 254.6,
			text = "_CharcoltDexEntry"},
		types = { "FIRE", "DRAGON" },
		baseStats = { 
			hp = 86, 
			attack = 112, 
			defense = 92, 
			speed = 108, 
			special = 122 },
		catchRate = 3, 
		baseExp = 255, 
		growthRate = "MEDIUM_SLOW",
		level1Moves = { "SCRATCH", "GROWL", "LEER" }, 
		learnset = {
			{ level = 9, move = "EMBER" },
			{ level = 14, move = "RAGE" },
			{ level = 26, move = "SLASH" },
			{ level = 36, move = "FLAMETHROWER" },
			{ level = 45, move = "FIRE_SPIN" },
			{ level = 52, move = "WING_ATTACK" },
			{ level = 60, move = "ROAR" },
			{ level = 70, move = "DRAGON_RAGE" },
		}, 
		tms = {
			"MEGA_PUNCH",
			"RAZOR_WIND",
			"SWORDS_DANCE", 
			"MEGA_KICK",
			"TOXIC", 
			"BODY_SLAM", 
			"TAKE_DOWN", 
			"DOUBLE_EDGE", 
			"HYPER_BEAM", 
			"SUBMISSION",
			"COUNTER",
			"SEISMIC_TOSS",
			"RAGE", 
			"DRAGON_RAGE",
			"EARTHQUAKE",
			"FISSURE",
			"DIG",
			"MIMIC", 
			"DOUBLE_TEAM",
			"REFLECT", 
			"BIDE", 
			"FIRE_BLAST",
			"SWIFT",
			"HEADBUTT",
			"SKY_ATTACK",
			"REST", 
			"ROCK_SIDE",
			"SUBSTITUTE",
			"CUT",
			"FLY",
			"STRENGTH"
		},
		evolutions = {},
		spriteFront = mod.assets:path("assets/charcolt_front.png"),
		spriteBack = mod.assets:path("assets/charcolt_back.png"),
		frontSize = 6,
		palette = "REDMON"
	})
	mod.content.cries:register("CHARCOLT", { file = mod.assets:path("assets/charcolt_cry.wav") })
	mod.content.icons:register("CHARCOLT", "MON")
	dex_no = dex_no + 1
	mod.content.pokemon:patch( "CHARIZARD", { evolutions = {
		{
        item = "FIRE_STONE",
        level = 1,
        method = "ITEM",
        species = "CHARCOLT",
      },
	}})

	-- Squirtle Line
	mod.content.pokemon:patch("SQUIRTLE", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("WARTORTLE", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("BLASTOISE", { dex = dex_no })
	dex_no = dex_no + 1
	RainDex = "It's said that\nthis POKéMON is\nborn when BLASTOISE\ngets thunderstruck\nin the middle of\na storm. Can des-\ntroy entire cities\nwith their cannons."
	mod.content.text:register("_RainerDexEntry", RainDex)
	mod.content.pokemon:register("RAINER", {
		id = "RAINER",
		name = "RAINER",
		dex = dex_no,
			dexEntry = { 
			heightFt = 8,
			heightIn = 2,
			kind = "RAINSTORM",
			weight = 320.8,
			text = "_RainerDexEntry"},
		types = { "WATER" },
		baseStats = { 
			hp = 106, 
			attack = 112, 
			defense = 120, 
			speed = 90, 
			special = 130 },
		catchRate = 3, 
		baseExp = 255, 
		growthRate = "MEDIUM_SLOW",
		level1Moves = { "TACKLE", "TAIL_WHIP" }, 
		learnset = {
			{ level = 8, move = "WATER_GUN" },
			{ level = 16, move = "BITE" },
			{ level = 23, move = "WITHDRAW" },
			{ level = 30, move = "SKULL_BASH" },
			{ level = 36, move = "AMNESIA" },
			{ level = 42, move = "MIST" },
			{ level = 48, move = "HYDRO_PUMP" },
			{ level = 55, move = "ACID_ARMOR" },
			{ level = 62, move = "HAZE" },
			{ level = 70, move = "REST" },
			{ level = 85, move = "EXPLOSION" },
		}, 
		tms = {
			"MEGA_PUNCH",
			"MEGA_KICK",
			"TOXIC",
			"BODY_SLAM",
			"TAKE_DOWN",
			"DOUBLE_EDGE",
			"BUBBLEBEAM",
			"ICE_BEAM",
			"BLIZZARD",
			"HYPER_BEAM",
			"PAY_DAY",
			"SUBMISSION",
			"COUNTER",
			"SEISMIC_TOSS",
			"RAGE",
			"THUNDERBOLT",
			"THUNDER",
			"FISSURE",
			"MIMIC",
			"DOUBLE_TEAM",
			"RECLECT",
			"BIDE",
			"SELFDESTRUCT",
			"SKULL_BASH",
			"REST",
			"EXPLOSION",
			"TRI_ATTACK",
			"SURF",
			"STRENGTH"
		},
		evolutions = {},
		spriteFront = mod.assets:path("assets/rainer_front.png"),
		spriteBack = mod.assets:path("assets/rainer_back.png"),
		frontSize = 6,
		palette = "BLUEMON"
	})
	mod.content.pokemon:patch( "BLASTOISE", { evolutions = {
		{
        item = "WATER_STONE",
        level = 1,
        method = "ITEM",
        species = "RAINER",
      },
	}})
	mod.content.cries:register("RAINER", { file = mod.assets:path("assets/rainer_cry.wav") })
	mod.content.icons:register("RAINER", "WATER")
	dex_no = dex_no + 1

	-- Caterpie Line
	mod.content.pokemon:patch("CATERPIE", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("METAPOD", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("BUTTERFREE", { dex = dex_no })
	dex_no = dex_no + 1

	-- Weedle Line
	mod.content.pokemon:patch("WEEDLE", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("KAKUNA", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("BEEDRILL", { dex = dex_no })
	dex_no = dex_no + 1

	-- Pidgey Line
	mod.content.pokemon:patch("PIDGEY", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("PIDGEOTTO", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("PIDGEOT", { dex = dex_no })
	dex_no = dex_no + 1

	-- Rattata Line
	mod.content.pokemon:patch("RATTATA", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("RATICATE", { dex = dex_no })
	dex_no = dex_no + 1
	-- NEW MON: RATICLAW

	-- Spearow Line
	mod.content.pokemon:patch("SPEAROW", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("FEAROW", { dex = dex_no })
	dex_no = dex_no + 1

	-- Ekans Line
	mod.content.pokemon:patch("EKANS", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("ARBOK", { dex = dex_no })
	dex_no = dex_no + 1

	-- Pikachu Line
	mod.content.pokemon:patch("PIKACHU", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("RAICHU", { dex = dex_no })
	dex_no = dex_no + 1
	GoroDex = "Is competitive\nby nature. Uses\ntheir two big\ntails, charged\nwith electricity\nto attack. Lives\nin hot areas."
	mod.content.text:register("_GorochuDexEntry", GoroDex)
	mod.content.pokemon:register("GOROCHU", {
		id = "GOROCHU",
		name = "GOROCHU",
		dex = dex_no,
			dexEntry = { 
			heightFt = 3,
			heightIn = 7,
			kind = "INT. MOUSE",
			weight = 84.6,
			text = "_GorochuDexEntry"},
		types = { "ELECRTIC", "FIRE" },
		baseStats = { 
			hp = 60, 
			attack = 112, 
			defense = 50, 
			speed = 105, 
			special = 79 },
		catchRate = 45, 
		baseExp = 155, 
		growthRate = "MEDIUM_FAST",
		level1Moves = { "THUNDERSHOCK", "TAIL_WHIP", "QUICK_ATTACK", "THUNDERBOLT" }, 
		learnset = {
			{ level = 12, move = "EMBER" },
			{ level = 19, move = "SLASH" },
			{ level = 24, move = "THUNDER_WAVE" },
			{ level = 30, move = "FIRE_SPIN" },
			{ level = 38, move = "FIRE_PUNCH" },
			{ level = 40, move = "THUNDER_PUNCH"},
			{ level = 45, move = "THUNDER" },
			{ level = 54, move = "FIRE_BLAST" },
		}, 
		tms = {
			"MEGA_PUNCH", 
			"MEGA_KICK", 
			"FIRE_PUNCH", 
			"BODY_SLAM", 
			"HYPER_BEAM", 
			"SUBMISSION", 
			"RAGE", 
			"FIRE_BLAST", 
			"THUNDER_WAVE"
		},
		evolutions = {},
		spriteFront = mod.assets:path("assets/gorochu_front.png"),
		spriteBack = mod.assets:path("assets/gorochu_back.png"),
		frontSize = 4,
		palette = "REDMON"
	})
	mod.content.cries:register("GOROCHU", { file = mod.assets:path("assets/gorochu_cry.wav") })
	mod.content.icons:register("GOROCHU", "MON")
	dex_no = dex_no + 1
	mod.content.pokemon:patch( "PIKACHU", { evolutions = {
		{
        item = "THUNDER_STONE",
        level = 1,
        method = "ITEM",
        species = "RAICHU",
      },
		{
        item = "FIRE_STONE",
        level = 1,
        method = "ITEM",
        species = "GOROCHU",
      },
	}})

	-- Sandshrew Line
	mod.content.pokemon:patch("SANDSHREW", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("SANDSLASH", { dex = dex_no })
	dex_no = dex_no + 1

	-- Nidoran Female Line
	mod.content.pokemon:patch("NIDORAN_F", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("NIDORINA", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("NIDOQUEEN", { dex = dex_no })
	dex_no = dex_no + 1
	-- NEW MON: NIDOGODESS

	-- Nidoran Male Line
	mod.content.pokemon:patch("NIDORAN_M", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("NIDORINO", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("NIDOKING", { dex = dex_no })
	dex_no = dex_no + 1
	-- NEW MON: NIDOGOD

	-- Clefairy Line
	mod.content.pokemon:patch("CLEFAIRY", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("CLEFABLE", { dex = dex_no })
	dex_no = dex_no + 1

	-- Vulpix Line
	mod.content.pokemon:patch("VULPIX", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("NINETALES", { dex = dex_no })
	dex_no = dex_no + 1

	-- Jigglypuff Line
	mod.content.pokemon:patch("JIGGLYPUFF", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("WIGGLYTUFF", { dex = dex_no })
	dex_no = dex_no + 1

	-- Zubat Line
	mod.content.pokemon:patch("ZUBAT", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("GOLBAT", { dex = dex_no })
	dex_no = dex_no + 1

	-- Oddish Line
	mod.content.pokemon:patch("ODDISH", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("GLOOM", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("VILEPLUME", { dex = dex_no })
	dex_no = dex_no + 1

	-- Paras Line
	mod.content.pokemon:patch("PARAS", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("PARASECT", { dex = dex_no })
	dex_no = dex_no + 1

	-- Venonat Line
	mod.content.pokemon:patch("VENONAT", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("VENOMOTH", { dex = dex_no })
	dex_no = dex_no + 1

	-- Diglett Line
	mod.content.pokemon:patch("DIGLETT", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("DUGTRIO", { dex = dex_no })
	dex_no = dex_no + 1

	-- Meowth Line
	mod.content.pokemon:patch("MEOWTH", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("PERSIAN", { dex = dex_no })
	dex_no = dex_no + 1

	-- Pikablu Line
	BluDex = "Naturallly found in\nrainforests and\ndesert oasis'.\nDespite the pink\ncolour, his name\ncame out of\ncolor-blindness."
	mod.content.text:register("_PikabluDexEntry", BluDex)
	mod.content.pokemon:register("PIKABLU", {
		id = "PIKABLU",
		name = "PIKABLU",
		dex = dex_no,
			dexEntry = { 
			heightFt = 1,
			heightIn = 4,
			kind = "PINK MOUSE",
			weight = 18.7,
			text = "_PikabluDexEntry"},
		types = { "WATER" },
		baseStats = { 
			hp = 70, 
			attack = 20, 
			defense = 50, 
			speed = 40, 
			special = 35 },
		catchRate = 190, 
		baseExp = 58, 
		growthRate = "FAST",
		level1Moves = { "TACKLE"}, 
		learnset = {
			{ level = 3, move = "DEFENSE_CURL"},
			{ level = 6, move = "TAIL_WHIP" },
			{ level = 10, move = "WATER_GUN" },
			{ level = 15, move = "ROLLOUT" },
			{ level = 21, move = "BUBBLEBEAM" },
			{ level = 28, move = "DOUBLE_EDGE" },
			{ level = 36, move = "WATERFALL" },
		}, 
		tms = {
			"MEGA_PUNCH",
			"WHIRLWIND",
			"MEGA_KICK",
			"DOUBLE_EDGE",
			"BUBBLEBEAM",
			"WATER_GUN",
			"ICE_BEAM",
			"BLIZZARD",
			"COUNTER",
			"MIMIC",
			"DOUBLE_TEAM",
			"RECLECT",
			"METRONOME",
			"SKULL_BASH",
			"REST",
			"EXPLOSION",
			"SUBSTITUTE",
			"SURF"
		},
		evolutions = {
			{
				level = 18,
				method = "LEVEL",
				species = "AZURAI",
			},
		},
		spriteFront = mod.assets:path("assets/pikablu_front.png"),
		spriteBack = mod.assets:path("assets/pikablu_back.png"),
		frontSize = 3,
		palette = "PINKMON"
	})
	mod.content.cries:register("PIKABLU", { file = mod.assets:path("assets/pikablu_cry.wav") })
	mod.content.icons:register("PIKABLU", "FAIRY")
	dex_no = dex_no + 1
	AzurDex = "When it plays\nin water, it rolls\nup its enlongated\nears to prevent\ntheir insides from\ngetting wet."
	mod.content.text:register("_AzuraiDexEntry", AzurDex)
	mod.content.pokemon:register("AZURAI", {
		id = "AZURAI",
		name = "AZURAI",
		dex = dex_no,
			dexEntry = { 
			heightFt = 2,
			heightIn = 7,
			kind = "PURPLERABBIT",
			weight = 62.8,
			text = "_AzuraiDexEntry"},
		types = { "WATER" },
		baseStats = { 
			hp = 100, 
			attack = 50, 
			defense = 80, 
			speed = 50, 
			special = 70 },
		catchRate = 75, 
		baseExp = 153, 
		growthRate = "FAST",
		level1Moves = { "TACKLE", "DEFENSE_CURL", "TAIL_WHIP", "WATER_GUN" }, 
		learnset = {
			{ level = 3, move = "DEFENSE_CURL"},
			{ level = 6, move = "TAIL_WHIP" },
			{ level = 10, move = "WATER_GUN" },
			{ level = 15, move = "ROLLOUT" },
			{ level = 25, move = "BUBBLEBEAM" },
			{ level = 36, move = "DOUBLE_EDGE" },
			{ level = 48, move = "WATERFALL" },
		}, 
		tms = {
			"MEGA_PUNCH",
			"WHIRLWIND",
			"MEGA_KICK",
			"DOUBLE_EDGE",
			"BUBBLEBEAM",
			"WATER_GUN",
			"ICE_BEAM",
			"BLIZZARD",
			"COUNTER",
			"MIMIC",
			"DOUBLE_TEAM",
			"RECLECT",
			"METRONOME",
			"SKULL_BASH",
			"REST",
			"EXPLOSION",
			"SUBSTITUTE",
			"SURF"
		},
		evolutions = {},
		spriteFront = mod.assets:path("assets/pikablu_front.png"),
		spriteBack = mod.assets:path("assets/pikablu_back.png"),
		frontSize = 4,
		palette = "PURPLEMON"
	})
	mod.content.cries:register("AZURAI", { file = mod.assets:path("assets/pikablu_cry.wav") })
	mod.content.icons:register("AZURAI", "FAIRY")
	dex_no = dex_no + 1

	-- Psyduck Line
	mod.content.pokemon:patch("PSYDUCK", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("GOLDUCK", { dex = dex_no })
	dex_no = dex_no + 1

	-- Diir Line
	-- NEW MON: DIIR

	-- Mankey Line
	mod.content.pokemon:patch("MANKEY", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("PRIMEAPE", { dex = dex_no })
	dex_no = dex_no + 1

	-- Growlithe Line
	mod.content.pokemon:patch("GROWLITHE", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("ARCANINE", { dex = dex_no })
	dex_no = dex_no + 1

	-- Poliwag Line
	mod.content.pokemon:patch("POLIWAG", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("POLIWHIRL", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("POLIWRATH", { dex = dex_no })
	dex_no = dex_no + 1

	-- Crocky Line
	-- NEW MON: CROCKY

	-- Abra Line
	mod.content.pokemon:patch("ABRA", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("KADABRA", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("ALAKAZAM", { dex = dex_no })
	dex_no = dex_no + 1

	-- Machop Line
	mod.content.pokemon:patch("MACHOP", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("MACHOKE", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("MACHAMP", { dex = dex_no })
	dex_no = dex_no + 1

	-- Caktoos Line
	-- NEW MON: CAKTOOS

	-- Jaggs Line
	JaggDex = "Patrols through\ndeep seas\nguided by the\ncharacteristic\nnose. It can\neven go through\na ship's hull."
	mod.content.text:register("_JaggsDexEntry", JaggDex)
	mod.content.pokemon:register("JAGGS", {
		id = "JAGGS",
		name = "JAGGS",
		dex = dex_no,
			dexEntry = { 
			heightFt = 6,
			heightIn = 7,
			kind = "SHARK",
			weight = 187.4,
			text = "_JaggsDexEntry"},
		types = { "WATER" },
		baseStats = { 
			hp = 65, 
			attack = 100, 
			defense = 60, 
			speed = 105, 
			special = 60 },
		catchRate = 60, 
		baseExp = 162, 
		growthRate = "MEDIUM_FAST",
		level1Moves = { "TACKLE", "GROWL" }, 
		learnset = {
			{ level = 7, move = "WATER_GUN" },
			{ level = 12, move = "FURY_ATTACK" },
			{ level = 17, move = "BITE" },
			{ level = 22, move = "ENERGY_FOCUS" },
			{ level = 27, move = "TAKE_DOWN" },
			{ level = 33, move = "SCREECH" },
			{ level = 39, move = "HYDRO_PUMP" },
			{ level = 45, move = "SKULL_BASH" },
		}, 
		tms = {
			"TOXIC", 
			"HORN_DRILL",
			"BODY_SLAM", 
			"TAKE_DOWN", 
			"DOUBLE_EDGE", 
			"BUBBLEBEAM",
			"ICE_BEAM",
			"BLIZZARD",
			"HYPER_BEAM", 
			"COUNTER",
			"RAGE", 
			"MIMIC", 
			"DOUBLE_TEAM", 
			"BIDE", 
			"REST", 
			"THUNDER_WAVE",
			"SURF",
			"STRENGTH"
		},
		evolutions = {},
		spriteFront = mod.assets:path("assets/jaggs_front.png"),
		spriteBack = mod.assets:path("assets/jaggs_back.png"),
		frontSize = 6,
		palette = "BLUEMON"
	})
	mod.content.cries:register("JAGGS", { file = mod.assets:path("assets/jaggs_cry.wav") })
	mod.content.icons:register("JAGGS", "WATER")
	dex_no = dex_no + 1

	-- Bellsprout Line
	mod.content.pokemon:patch("BELLSPROUT", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("WEEPINBELL", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("VICTREEBEL", { dex = dex_no })
	dex_no = dex_no + 1
	-- NEW MON: MEGABELL

	-- Tentacool Line
	mod.content.pokemon:patch("TENTACOOL", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("TENTACRUEL", { dex = dex_no })
	dex_no = dex_no + 1

	-- Geodude Line
	mod.content.pokemon:patch("GEODUDE", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("GRAVELER", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("GOLEM", { dex = dex_no })
	dex_no = dex_no + 1

	-- Ponyta Line
	mod.content.pokemon:patch("PONYTA", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("RAPIDASH", { dex = dex_no })
	dex_no = dex_no + 1

	-- Slowpoke Line
	mod.content.pokemon:patch("SLOWPOKE", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("SLOWBRO", { dex = dex_no })
	dex_no = dex_no + 1

	-- Magnemite Line
	mod.content.pokemon:patch("MAGNEMITE", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("MAGNETON", { dex = dex_no })
	dex_no = dex_no + 1

	-- Farfetch’d Line
	mod.content.pokemon:patch("FARFETCHD", { dex = dex_no })
	dex_no = dex_no + 1

	-- Doduo Line
	mod.content.pokemon:patch("DODUO", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("DODRIO", { dex = dex_no })
	dex_no = dex_no + 1

	-- Seel Line
	mod.content.pokemon:patch("SEEL", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("DEWGONG", { dex = dex_no })
	dex_no = dex_no + 1

	-- Grimer Line
	mod.content.pokemon:patch("GRIMER", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("MUK", { dex = dex_no })
	dex_no = dex_no + 1

	-- Shellder Line
	mod.content.pokemon:patch("SHELLDER", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("CLOYSTER", { dex = dex_no })
	dex_no = dex_no + 1

	-- Gastly Line
	mod.content.pokemon:patch("GASTLY", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("HAUNTER", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("GENGAR", { dex = dex_no })
	dex_no = dex_no + 1
	-- NEW MON: PHAMTO
	-- NEW MON: SPUKIE

	-- Onix Line
	mod.content.pokemon:patch("ONIX", { dex = dex_no })
	dex_no = dex_no + 1

	-- Drowzee Line
	mod.content.pokemon:patch("DROWZEE", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("HYPNO", { dex = dex_no })
	dex_no = dex_no + 1
	-- NEW MON: DREAMASTER

	-- Krabby Line
	mod.content.pokemon:patch("KRABBY", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("KINGLER", { dex = dex_no })
	dex_no = dex_no + 1

	-- Voltorb Line
	mod.content.pokemon:patch("VOLTORB", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("ELECTRODE", { dex = dex_no })
	dex_no = dex_no + 1

	-- Exeggcute Line
	mod.content.pokemon:patch("EXEGGCUTE", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("EXEGGUTOR", { dex = dex_no })
	dex_no = dex_no + 1

	-- Cubone Line
	mod.content.pokemon:patch("CUBONE", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("MAROWAK", { dex = dex_no })
	dex_no = dex_no + 1
	-- NEW MON: FRACTURE

	-- Hitmon Line
	mod.content.pokemon:patch("HITMONLEE", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("HITMONCHAN", { dex = dex_no })
	dex_no = dex_no + 1

	-- Lickitung Line
	mod.content.pokemon:patch("LICKITUNG", { dex = dex_no })
	dex_no = dex_no + 1

	-- Koffing Line
	mod.content.pokemon:patch("KOFFING", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("WEEZING", { dex = dex_no })
	dex_no = dex_no + 1

	-- Rhyhorn Line
	mod.content.pokemon:patch("RHYHORN", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("RHYDON", { dex = dex_no })
	dex_no = dex_no + 1

	-- Chansey Line
	mod.content.pokemon:patch("CHANSEY", { dex = dex_no })
	dex_no = dex_no + 1

	-- Tangela Line
	mod.content.pokemon:patch("TANGELA", { dex = dex_no })
	dex_no = dex_no + 1

	-- Kangaskhan Line
	mod.content.pokemon:patch("KANGASKHAN", { dex = dex_no })
	dex_no = dex_no + 1

	-- Horsea Line
	mod.content.pokemon:patch("HORSEA", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("SEADRA", { dex = dex_no })
	dex_no = dex_no + 1

	-- Goldeen Line
	mod.content.pokemon:patch("GOLDEEN", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("SEAKING", { dex = dex_no })
	dex_no = dex_no + 1

	-- Staryu Line
	mod.content.pokemon:patch("STARYU", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("STARMIE", { dex = dex_no })
	dex_no = dex_no + 1

	-- Mr. Mime Line
	mod.content.pokemon:patch("MRMIME", { dex = dex_no })
	dex_no = dex_no + 1

	-- Balloonda Line
	BalloonDex = "Can float without\neffort even\nin hurricanes.\nHides in street\nstands hoping for a\nchild to take him."
	mod.content.text:register("_BalloondaDexEntry", BalloonDex)
	mod.content.pokemon:register("BALLOONDA", {
		id = "BALLOONDA",
		name = "BALLOONDA",
		dex = dex_no,
			dexEntry = { 
			heightFt = 0,
			heightIn = 4,
			kind = "BALLOON",
			weight = 2.2,
			text = "_BalloondaDexEntry"},
		types = { "FLYING" },
		baseStats = { 
			hp = 95, 
			attack = 50, 
			defense = 40, 
			speed = 110, 
			special = 45 },
		catchRate = 70, 
		baseExp = 100, 
		growthRate = "MEDIUM_FAST",
		level1Moves = { "TACKLE", "GROWL" }, 
		learnset = {
			{ level = 4, move = "GUST" },
			{ level = 9, move = "SING" },
			{ level = 14, move = "MINIMIZE" },
			{ level = 19, move = "BODY_SLAM" },
			{ level = 24, move = "BUBBLEBEAM" },
			{ level = 31, move = "SMOKESCREEN" },
			{ level = 38, move = "DOUBLE_EDGE" },
			{ level = 45, move = "RAZOR_WIND" },
		}, 
		tms = {
			"MEGA_PUNCH", 
			"RAZOR_WIND",
			"WHIRLWIND", 
			"MEGA_KICK", 
			"TOXIC", 
			"TAKE_DOWN",
			"DOUBLE_EDGE",
			"BUBBLEBEAM", 
			"BLIZZARD", 
			"COUNTER", 
			"THUNDERBOLT", 
			"PSYCHIC", 
			"TELEPORT", 
			"DOUBLE_TEAM",
			"METRONOME",
			"SWIFT",
			"SOFTBOILED",
			"SKY_ATTACK",
			"REST",
			"SUBSTITUTE",
			"FLY",
		},
		evolutions = {},
		spriteFront = mod.assets:path("assets/balloonda_front.png"),
		spriteBack = mod.assets:path("assets/balloonda_back.png"),
		frontSize = 4,
		palette = "PINKMON"
	})
	mod.content.cries:register("BALLOONDA", { file = mod.assets:path("assets/ballonda_cry.wav") })
	mod.content.icons:register("BALLOONDA", "BALL")
	dex_no = dex_no + 1

	-- Scyther Line
	mod.content.pokemon:patch("SCYTHER", { dex = dex_no })
	dex_no = dex_no + 1

	-- Jynx Line
	mod.content.pokemon:patch("JYNX", { dex = dex_no })
	dex_no = dex_no + 1

	-- Electabuzz Line
	mod.content.pokemon:patch("ELECTABUZZ", { dex = dex_no })
	dex_no = dex_no + 1

	-- Magmar Line
	mod.content.pokemon:patch("MAGMAR", { dex = dex_no })
	dex_no = dex_no + 1

	-- Pinsir Line
	mod.content.pokemon:patch("PINSIR", { dex = dex_no })
	dex_no = dex_no + 1
	-- NEW MON: PINSIRE

	-- Tauros Line
	mod.content.pokemon:patch("TAUROS", { dex = dex_no })
	dex_no = dex_no + 1

	-- Magikarp Line
	mod.content.pokemon:patch("MAGIKARP", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("GYARADOS", { dex = dex_no })
	dex_no = dex_no + 1

	-- Lapras Line
	mod.content.pokemon:patch("LAPRAS", { dex = dex_no })
	dex_no = dex_no + 1

	-- Ditto Line
	mod.content.pokemon:patch("DITTO", { dex = dex_no })
	dex_no = dex_no + 1

	-- Eevee Line
	mod.content.pokemon:patch("EEVEE", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("VAPOREON", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("JOLTEON", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("FLAREON", { dex = dex_no })
	dex_no = dex_no + 1

	-- Gyaoon Line
	-- NEW MON: GYAOON

	-- Porygon Line
	mod.content.pokemon:patch("PORYGON", { dex = dex_no })
	dex_no = dex_no + 1

	-- Omanyte Line
	mod.content.pokemon:patch("OMANYTE", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("OMASTAR", { dex = dex_no })
	dex_no = dex_no + 1

	-- Kabuto Line
	mod.content.pokemon:patch("KABUTO", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("KABUTOPS", { dex = dex_no })
	dex_no = dex_no + 1

	-- Aerodactyl Line
	mod.content.pokemon:patch("AERODACTYL", { dex = dex_no })
	dex_no = dex_no + 1

	-- Snorlax Line
	mod.content.pokemon:patch("SNORLAX", { dex = dex_no })
	dex_no = dex_no + 1

	-- Kotora Line
	-- NEW MON: KOTORA
	-- NEW MON: RAITORA
	-- NEW MON: GAOTORA

	-- Articuno Line
	mod.content.pokemon:patch("ARTICUNO", { dex = dex_no })
	dex_no = dex_no + 1

	-- Zapdos Line
	mod.content.pokemon:patch("ZAPDOS", { dex = dex_no })
	dex_no = dex_no + 1

	-- Moltres Line
	mod.content.pokemon:patch("MOLTRES", { dex = dex_no })
	dex_no = dex_no + 1

	-- Dratini Line
	mod.content.pokemon:patch("DRATINI", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("DRAGONAIR", { dex = dex_no })
	dex_no = dex_no + 1
	mod.content.pokemon:patch("DRAGONITE", { dex = dex_no })
	dex_no = dex_no + 1

	-- Mew Line
	mod.content.pokemon:patch("MEW", { dex = dex_no })
	dex_no = dex_no + 1

	-- Mewtwo Line
	mod.content.pokemon:patch("MEWTWO", { dex = dex_no })
	dex_no = dex_no + 1
	-- NEW MON: MEWTHREE

	-- Legendaries line
	-- NEW MON: OMEGA
	-- NEW MON: DIMINOX
	-- NEW MON: BETARCEUS

	-- Crossover Line
	YoshiDex = "He catches enemies \nwith his long ton-\ngue and turns them \ninto eggs,to then \nthrow them like \nproyectiles."
	mod.content.text:register("_YoshiDexEntry", YoshiDex)
	mod.content.pokemon:register("YOSHI", {
		id = "YOSHI", 
		name = "YOSHI", 
		dex = dex_no, 
		dexEntry = { 
		heightFt = 4,
		heightIn = 4,
		kind = "DINOSAUR",
		weight = 68.3,
		text = "_YoshiDexEntry"},
		types = { "DRAGON", "FLYING" },
		baseStats = { 
		hp = 70, 
		attack = 85, 
		defense = 70, 
		speed = 95, 
		special = 75 },
		catchRate = 60, 
		baseExp = 155, 
		growthRate = "SLOW",
		level1Moves = { "TACKLE", "GROWL" }, 
		learnset = {
			{ level = 4, move = "LICK" },
			{ level = 8, move = "LEER" },
			{ level = 12, move = "STOMP" },
			{ level = 16, move = "BITE" },
			{ level = 20, move = "EGG_BOMB" },
			{ level = 24, move = "AGILITY" },
			{ level = 28, move = "SCREECH" },
			{ level = 32, move = "TAKE_DOWN" },
			{ level = 36, move = "DRAGON_RAGE" },
			{ level = 40, move = "DOUBLE_EDGE" },
			{ level = 44, move = "RAGE" },
			{ level = 48, move = "HYPER_BEAM" },
		}, 
		tms = {
			"SWORDS_DANCE", 
			"MEGA_KICK", 
			"BODY_SLAM", 
			"TAKE_DOWN", 
			"DOUBLE_EDGE", 
			"HYPER_BEAM", 
			"RAGE", 
			"DRAGON_RAGE", 
			"EARTHQUAKE", 
			"DOUBLE_TEAM", 
			"EGG_BOMB", 
			"FIRE_BLAST", 
			"SWIFT", 
			"SKY_ATTACK", 
			"ROCK_SLIDE", 
			"CUT", 
			"FLY", 
			"SURF", 
			"STRENGTH", 
			"FLASH"
		},
		evolutions = {},
		spriteFront = mod.assets:path("assets/yoshi_front.png"),
		spriteBack = mod.assets:path("assets/yoshi_back.png"),
		frontSize = 4,
		palette = "GREENMON"
	})
	mod.content.cries:register("YOSHI", { file = mod.assets:path("assets/yoshi_cry.wav") })
	mod.content.icons:register("YOSHI", { image = mod.assets:path("assets/yoshi_icon.png") })
	dex_no = dex_no + 1
	KirbyDex = "He absorbs his\nenemies inhaling\nthem and copies\ntheir moves.\nHis balloon-\nlike body makes\nhim fly endlessly."
	mod.content.text:register("_KirbyDexEntry", KirbyDex)
	mod.content.pokemon:register("KIRBY", {
		id = "KIRBY", 
		name = "KIRBY", 
		dex = dex_no, 
		dexEntry = { 
		heightFt = 0,
		heightIn = 8,
		kind = "STELLAR",
		weight = 2.2,
		text = "_KirbyDexEntry"},
		types = { "NORMAL", "FLYING" }, 
		baseStats = { 
		hp = 100, 
		attack = 70, 
		defense = 70, 
		speed = 90, 
		special =100 },
		catchRate = 60, 
		baseExp = 195, 
		growthRate = "SLOW",
		level1Moves = { "TACKLE", "DFENSE_CURL",  }, 
		learnset = {
			{ level = 5, move = "GROWL" },
			{ level = 8, move = "WATER_GUN" },
			{ level = 12, move = "EMBER" },
			{ level = 16, move = "AURORA_BEAM" },
			{ level = 20, move = "THUNDERSHOCK" },
			{ level = 24, move = "WING_ATTACK" },
			{ level = 28, move = "SLASH" },
			{ level = 32, move = "ROCK_THROW" },
			{ level = 36, move = "SWIFT" },
			{ level = 40, move = "SKULL_BASH" },
			{ level = 44, move = "FIRE_PUNCH" },
			{ level = 48, move = "ICE_BREAM" },
			{ level = 52, move = "THUNDERBOLT" },
			{ level = 56, move = "FLAMETHROWER" },
			{ level = 60, move = "SING" },
			{ level = 64, move = "THRASH" },
			{ level = 68, move = "HEADBUTT" },
			{ level = 72, move = "FISSURE" },
			{ level = 76, move = "HYPER_BEAM" },
			{ level = 80, move = "RECOVER" },
		}, 
		tms = {
			"MEGA_PUNCH", 
			"SWORDS_DANCE", 
			"MEGA_KICK", 
			"TOXIC", 
			"BODY_SLAM", 
			"DOUBLE_EDGE", 
			"BUBBLEBEAM", 
			"WATER_GUN", 
			"ICE_BEAM",
			"BLIZZARD",
			"HYPER_BEAM",
			"SUBMISSION",
			"RAGE",
			"THUNDERBOLT", 
			"THUNDER",
			"EARTHQUAKE",
			"FISSURE",
			"DOUBLE_TEAM", 
			"REFLECT",
			"EGG_BOMB",
			"FIRE_BLAST",
			"SWIFT", 
			"SKY_ATTACK",
			"REST",
			"THUNDER_WAVE",
			"ROCK_SLIDE",
			"CUT",
			"FLY",
			"SURF",
			"STRENGTH",
			"FLASH"
		},
		evolutions = {},
		spriteFront = mod.assets:path("assets/kirby_front.png"),
		spriteBack = mod.assets:path("assets/kirby_back.png"),
		frontSize = 5,
		palette = "PINKMON"
	})
	mod.content.cries:register("KIRBY", { file = mod.assets:path("assets/kirby_cry.wav") })
	mod.content.icons:register("KIRBY", "FAIRY")
	dex_no = dex_no + 1
	SonicDex = "It's the fastest\nliving being\never detected\nuntil the moment.\nPrefers being\non green hills\nand hates machines."
	mod.content.text:register("_SonicDexEntry", SonicDex)
	mod.content.pokemon:register("SONIC", {
		id = "SONIC", 
		name = "SONIC", 
		dex = dex_no, 
		dexEntry = { 
		heightFt = 2,
		heightIn = 4,
		kind = "HEDGEHOG",
		weight = 30.0,
		text = "_SonicDexEntry"},
		types = { "ELECTRIC", "FIGHTING" }, 
		baseStats = { 
		hp = 70, 
		attack = 80, 
		defense = 35, 
		speed = 140, 
		special = 75 },
		catchRate = 60, 
		baseExp = 100, 
		growthRate = "SLOW",
		level1Moves = { "QUICK_ATTACK", "TAIL_WHIP",  }, 
		learnset = {
			{ level = 12, move = "THUNDERBOLT" },
			{ level = 20, move = "SWIFT" },
			{ level = 25, move = "JUMP_KICK" },
			{ level = 32, move = "ROLLOUT" },
			{ level = 38, move = "SWORDS_DANCE" },
			{ level = 42, move = "THUNDER_PUNCH" },
			{ level = 42, move = "WHIRLWIND" },
			{ level = 50, move = "SONICBOOM" },
			{ level = 56, move = "MEGA_KICK"}
		}, 
		tms = {
			"WHIRLWIND", 
			"SWORDS_DANCE", 
			"MEGA_KICK", 
			"COUNTER", 
			"THUNDERBOLT", 
			"DOUBLE_TEAM", 
			"SWIFT", 
			"SUBSTITUTE"},
		evolutions = {},
		spriteFront = mod.assets:path("assets/sonic_front.png"),
		spriteBack = mod.assets:path("assets/sonic_back.png"),
		frontSize = 5,
		palette = "MEWMON"
	})
	mod.content.cries:register("SONIC", { file = mod.assets:path("assets/sonic_cry.wav") })
	mod.content.icons:register("SONIC", { image = mod.assets:path("assets/sonic_icon.png") })
	dex_no = dex_no + 1
	-- NEW MON: DEDEDE
	-- NEW MON: META_KNIGHT
	-- NEW MON: K_ROOL
	-- Kracko Line
	-- NEW MON: CO_KRACKO
	-- NEW MON: KRACKO_JR
	-- NEW MON: KRACKO
	-- NEW MON: MOTOBUG
	-- NEW MON: YUMETARO
	-- Animatronic Line
	-- NEW MON: FREDDY
	-- NEW MON: G_FREDDY
	-- NEW MON: BONNIE
	-- NEW MON: CHICA
	-- NEW MON: FOXY
	-- NEW MON: BONNIE
	-- NEW MON: GARFIELD
	-- NEW MON: SQUASH
	-- NEW MON: IMITATER
	-- NEW MON: STITCH
	-- NEW MON: S_PLATINUM


	-- Area
	mod.content.encounters:override("ROUTE_2", {
	  grass = {
		rate = 25,
		slots = {
			{
			level = 3,
			species = "RATTATA",
			},
			{
			level = 3,
			species = "PIDGEY",
			},
			{
			level = 4,
			species = "PIDGEY",
			},
			{
			level = 4,
			species = "RATTATA",
			},
			{
			level = 5,
			species = "PIDGEY",
			},
			{
			level = 3,
			species = "YOSHI",
			},
			{
			level = 2,
			species = "RATTATA",
			},
			{
			level = 5,
			species = "RATTATA",
			},
			{
			level = 4,
			species = "YOSHI",
			},
			{
			level = 5,
			species = "YOSHI",
			},
		},
		},
		source = "ROM:03:50F5",
	})
	mod.content.encounters:override("VIRIDIAN_FOREST", {
	  grass = {
		rate = 8,
		slots = {
			{
			level = 4,
			species = "WEEDLE",
			},
			{
			level = 5,
			species = "KAKUNA",
			},
			{
			level = 3,
			species = "WEEDLE",
			},
			{
			level = 5,
			species = "WEEDLE",
			},
			{
			level = 4,
			species = "KAKUNA",
			},
			{
			level = 6,
			species = "KAKUNA",
			},
			{
			level = 4,
			species = "METAPOD",
			},
			{
			level = 3,
			species = "CATERPIE",
			},
			{
			level = 3,
			species = "YOSHI",
			},
			{
			level = 5,
			species = "PIKACHU",
			},
		},
		},
		source = "ROM:03:5121",
	})
	mod.content.encounters:override("ROUTE_3", {
	  grass = {
		rate = 20,
		slots = {
			{
			level = 6,
			species = "PIKABLU",
			},
			{
			level = 5,
			species = "SPEAROW",
			},
			{
			level = 7,
			species = "PIKABLU",
			},
			{
			level = 6,
			species = "SPEAROW",
			},
			{
			level = 7,
			species = "SPEAROW",
			},
			{
			level = 8,
			species = "PIKABLU",
			},
			{
			level = 8,
			species = "SPEAROW",
			},
			{
			level = 3,
			species = "JIGGLYPUFF",
			},
			{
			level = 5,
			species = "JIGGLYPUFF",
			},
			{
			level = 7,
			species = "JIGGLYPUFF",
			},
		},
		},
		source = "ROM:03:5137",
	})
	mod.content.encounters:patch("MT_MOON_B1F", {
	  grass = {
		rate = 10,
		slots = {
			{
			level = 8,
			species = "ZUBAT",
			},
			{
			level = 7,
			species = "ZUBAT",
			},
			{
			level = 9,
			species = "ZUBAT",
			},
			{
			level = 8,
			species = "GEODUDE",
			},
			{
			level = 6,
			species = "KIRBY",
			},
			{
			level = 10,
			species = "KIRBY",
			},
			{
			level = 10,
			species = "GEODUDE",
			},
			{
			level = 8,
			species = "PARAS",
			},
			{
			level = 11,
			species = "KIRBY",
			},
			{
			level = 8,
			species = "CLEFAIRY",
			},
		},
		},
		source = "ROM:03:514D",
	})
	mod.content.encounters:patch("ROUTE_24", {
	  grass = { slots = { __prepend = { { species = "SONIC", level = 10 } } } },
	})
	mod.content.encounters:override("ROUTE_21", {
	  grass = {
		rate = 25,
		slots = {
			{
			level = 21,
			species = "RATTATA",
			},
			{
			level = 23,
			species = "BALLOONDA",
			},
			{
			level = 30,
			species = "RATICATE",
			},
			{
			level = 23,
			species = "RATTATA",
			},
			{
			level = 21,
			species = "BALLOONDA",
			},
			{
			level = 30,
			species = "PIDGEOTTO",
			},
			{
			level = 32,
			species = "PIDGEOTTO",
			},
			{
			level = 28,
			species = "TANGELA",
			},
			{
			level = 30,
			species = "TANGELA",
			},
			{
			level = 32,
			species = "TANGELA",
			},
		},
		},
		source = "ROM:03:54D7",
		water = {
		rate = 5,
		slots = {
			{
			level = 5,
			species = "JAGGS",
			},
			{
			level = 10,
			species = "JAGGS",
			},
			{
			level = 15,
			species = "JAGGS",
			},
			{
			level = 5,
			species = "TENTACOOL",
			},
			{
			level = 10,
			species = "TENTACOOL",
			},
			{
			level = 15,
			species = "TENTACOOL",
			},
			{
			level = 20,
			species = "TENTACOOL",
			},
			{
			level = 30,
			species = "TENTACOOL",
			},
			{
			level = 35,
			species = "TENTACOOL",
			},
			{
			level = 40,
			species = "TENTACOOL",
			},
		},
		},
	})
	

	-- Custom Pokémon League
	-- Luigi
	-- Jotaro
	-- Afton
	-- Miku
	-- Red
	

	-- Update Pokedex
	mod.content.constants:patch("dexSize", dex_no)
end