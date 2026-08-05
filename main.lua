-- VersãoVermelha: a translation of the game into Português.
--
-- Nothing here is translated yet.  Every table under lang/ starts with
-- empty strings; fill one in and it takes effect on the next boot, and
-- anything still empty keeps rendering in English.  That means a
-- half-finished translation is always playable, so you can ship early and
-- fill the long tail in later.
--
-- Read TRANSLATING.md before the first edit; the font is the part people
-- get wrong.
return function(mod)
  -- mod:read is the supported way into your own directory; the catalogs are
  -- plain Lua tables, so read and run them rather than require()ing them.
  local function catalog(name)
    local rel = "lang/" .. name .. ".lua"
    local body = mod:read(rel)
    if not body then return {} end
    local chunk, err = loadstring(body, rel)
    if not chunk then
      mod.log:warn("%s has a syntax error: %s", rel, tostring(err))
      return {}
    end
    local ok, table_ = pcall(chunk)
    if not ok or type(table_) ~= "table" then
      mod.log:warn("%s did not return a table: %s", rel, tostring(table_))
      return {}
    end
    return table_
  end

  -- An empty value means "not translated yet", never "translate to blank".
  local function each(name, apply)
    local n = 0
    for key, value in pairs(catalog(name)) do
      if type(value) == "string" and value ~= "" then
        apply(key, value)
        n = n + 1
      end
    end
    return n
  end

  -- ---- glyphs -------------------------------------------------------
  -- Register the sheet BEFORE anything asks for a glyph on it.  base is
  -- the first code the page owns; 0x100 and up is free space above the
  -- vanilla pages, so a new alphabet never collides with them.
  for id, page in pairs(catalog("font")) do
    -- A page's `image` goes straight to love.graphics.newImage, which
    -- resolves against the game root rather than the mod, so a path that
    -- lives in this mod has to be made absolute or the page loads nothing
    -- and every accented character draws as a blank.  mod:read is the
    -- precise test for "this file is mine".
    if type(page) == "table" and type(page.image) == "string"
        and mod:read(page.image) then
      page.image = mod.assets:path(page.image)
    end
    mod.content.font:register(id, page)
  end
  -- charmap: which byte sequence draws which code
  for seq, code in pairs(catalog("charmap")) do
    mod.content.font:register("charmap:" .. seq, { seq = seq, code = code })
  end

  -- ---- text ---------------------------------------------------------
  local counts = {}
  counts.dialogue = each("dialogue", function(id, value)
    mod.content.text:override(id, value)
  end)
  counts.strings = each("strings", function(source, value)
    mod.content.strings:override(source, value)
  end)
  counts.species = each("species_names", function(id, value)
    mod.content.pokemon:patch(id, { name = value })
  end)
  counts.moves = each("move_names", function(id, value)
    mod.content.moves:patch(id, { name = value })
  end)
  counts.items = each("item_names", function(id, value)
    mod.content.items:patch(id, { name = value })
  end)
  counts.trainers = each("trainer_names", function(id, value)
    mod.content.trainers:patch(id, { name = value })
  end)
  counts.statuses = each("status_labels", function(id, value)
    mod.content.statuses:patch(id, { label = value })
  end)

  -- ---- name entry ---------------------------------------------------
  -- The naming screen's letter grid.  Leave lang/naming.lua returning nil
  -- to keep the English alphabet.
  -- The mod-facing hook surface is :wrap(name, callback, priority); the
  -- generated template calls :on, which does not exist and only blows up
  -- once lang/naming.lua is actually filled in.
  local grid = catalog("naming")
  if grid.upper or grid.lower then
    mod.hooks:wrap("ui.naming.grid", function(base, ctx)
      local want = ctx and ctx.lower and grid.lower or grid.upper
      return want or base
    end)
  end

  mod.events:on("game.ready", function()
    local total = 0
    for _, n in pairs(counts) do total = total + n end
    mod.log:info("Español: %d strings translated", total)
  end)

  -- Pokedex species kinds
  mod.content.pokemon:patch("BULBASAUR", {dexEntry = { kind = "SEMILLA" }})
  mod.content.pokemon:patch("IVYSAUR", {dexEntry = { kind = "SEMILLA" }})
  mod.content.pokemon:patch("VENUSAUR", {dexEntry = { kind = "SEMILLA" }})
  mod.content.pokemon:patch("CHARMANDER", {dexEntry = { kind = "LAGARTIJA" }})
  mod.content.pokemon:patch("CHARMELEON", {dexEntry = { kind = "LLAMA" }})
  mod.content.pokemon:patch("CHARIZARD", {dexEntry = { kind = "LLAMA" }})
  mod.content.pokemon:patch("SQUIRTLE", {dexEntry = { kind = "TORTUGUITA" }})
  mod.content.pokemon:patch("WARTORTLE", {dexEntry = { kind = "TORTUGA" }})
  mod.content.pokemon:patch("BLASTOISE", {dexEntry = { kind = "ARMAZÓN" }})
  mod.content.pokemon:patch("CATERPIE", {dexEntry = { kind = "GUSANO" }})
  mod.content.pokemon:patch("METAPOD", {dexEntry = { kind = "CAPULLO" }})
  mod.content.pokemon:patch("BUTTERFREE", {dexEntry = { kind = "MARIPOSA" }})
  mod.content.pokemon:patch("WEEDLE", {dexEntry = { kind = "ORUGA" }})
  mod.content.pokemon:patch("KAKUNA", {dexEntry = { kind = "CAPULLO" }})
  mod.content.pokemon:patch("BEEDRILL", {dexEntry = { kind = "ABEJA VENENO" }})
  mod.content.pokemon:patch("PIDGEY", {dexEntry = { kind = "PAJARITO" }})
  mod.content.pokemon:patch("PIDGEOTTO", {dexEntry = { kind = "PÁJARO" }})
  mod.content.pokemon:patch("PIDGEOT", {dexEntry = { kind = "PÁJARO" }})
  mod.content.pokemon:patch("RATTATA", {dexEntry = { kind = "RATÓN" }})
  mod.content.pokemon:patch("RATICATE", {dexEntry = { kind = "RATÓN" }})
  mod.content.pokemon:patch("SPEAROW", {dexEntry = { kind = "PAJARITO" }})
  mod.content.pokemon:patch("FEAROW", {dexEntry = { kind = "PICO" }})
  mod.content.pokemon:patch("EKANS", {dexEntry = { kind = "SERPIENTE" }})
  mod.content.pokemon:patch("ARBOK", {dexEntry = { kind = "COBRA" }})
  mod.content.pokemon:patch("PIKACHU", {dexEntry = { kind = "RATÓN" }})
  mod.content.pokemon:patch("RAICHU", {dexEntry = { kind = "RATÓN" }})
  mod.content.pokemon:patch("SANDSHREW", {dexEntry = { kind = "RATÓN" }})
  mod.content.pokemon:patch("SANDSLASH", {dexEntry = { kind = "RATÓN" }})
  mod.content.pokemon:patch("NIDORAN_F", {dexEntry = { kind = "PIN VENENO" }})
  mod.content.pokemon:patch("NIDORINA", {dexEntry = { kind = "PIN VENENO" }})
  mod.content.pokemon:patch("NIDOQUEEN", {dexEntry = { kind = "TALADRO" }})
  mod.content.pokemon:patch("NIDORAN_M", {dexEntry = { kind = "PIN VENENO" }})
  mod.content.pokemon:patch("NIDORINO", {dexEntry = { kind = "PIN VENENO" }})
  mod.content.pokemon:patch("NIDOKING", {dexEntry = { kind = "TALADRO" }})
  mod.content.pokemon:patch("CLEFAIRY", {dexEntry = { kind = "HADA" }})
  mod.content.pokemon:patch("CLEFABLE", {dexEntry = { kind = "HADA" }})
  mod.content.pokemon:patch("VULPIX", {dexEntry = { kind = "ZORRO" }})
  mod.content.pokemon:patch("NINETALES", {dexEntry = { kind = "ZORRO" }})
  mod.content.pokemon:patch("JIGGLYPUFF", {dexEntry = { kind = "GLOBO" }})
  mod.content.pokemon:patch("WIGGLYTUFF", {dexEntry = { kind = "GLOBO" }})
  mod.content.pokemon:patch("ZUBAT", {dexEntry = { kind = "MURCIÉLAGO" }})
  mod.content.pokemon:patch("GOLBAT", {dexEntry = { kind = "MURCIÉLAGO" }})
  mod.content.pokemon:patch("ODDISH", {dexEntry = { kind = "HIERBAJO" }})
  mod.content.pokemon:patch("GLOOM", {dexEntry = { kind = "HIERBAJO" }})
  mod.content.pokemon:patch("VILEPLUME", {dexEntry = { kind = "FLOR" }})
  mod.content.pokemon:patch("PARAS", {dexEntry = { kind = "HONGO" }})
  mod.content.pokemon:patch("PARASECT", {dexEntry = { kind = "HONGO" }})
  mod.content.pokemon:patch("VENONAT", {dexEntry = { kind = "INSECTO" }})
  mod.content.pokemon:patch("VENOMOTH", {dexEntry = { kind = "POLILLA VEN." }})
  mod.content.pokemon:patch("DIGLETT", {dexEntry = { kind = "TOPO" }})
  mod.content.pokemon:patch("DUGTRIO", {dexEntry = { kind = "TOPO" }})
  mod.content.pokemon:patch("MEOWTH", {dexEntry = { kind = "GATO ARAÑA" }})
  mod.content.pokemon:patch("PERSIAN", {dexEntry = { kind = "GATO FINO" }})
  mod.content.pokemon:patch("PSYDUCK", {dexEntry = { kind = "PATO" }})
  mod.content.pokemon:patch("GOLDUCK", {dexEntry = { kind = "PATO" }})
  mod.content.pokemon:patch("MANKEY", {dexEntry = { kind = "MONO CERDO" }})
  mod.content.pokemon:patch("PRIMEAPE", {dexEntry = { kind = "MONO CERDO" }})
  mod.content.pokemon:patch("GROWLITHE", {dexEntry = { kind = "PERRITO" }})
  mod.content.pokemon:patch("ARCANINE", {dexEntry = { kind = "LEYENDA" }})
  mod.content.pokemon:patch("POLIWAG", {dexEntry = { kind = "RENACUAJO" }})
  mod.content.pokemon:patch("POLIWHIRL", {dexEntry = { kind = "RENACUAJO" }})
  mod.content.pokemon:patch("POLIWRATH", {dexEntry = { kind = "RENACUAJO" }})
  mod.content.pokemon:patch("ABRA", {dexEntry = { kind = "PSI" }})
  mod.content.pokemon:patch("KADABRA", {dexEntry = { kind = "PSI" }})
  mod.content.pokemon:patch("ALAKAZAM", {dexEntry = { kind = "PSI" }})
  mod.content.pokemon:patch("MACHOP", {dexEntry = { kind = "SUPERPODER" }})
  mod.content.pokemon:patch("MACHOKE", {dexEntry = { kind = "SUPERPODER" }})
  mod.content.pokemon:patch("MACHAMP", {dexEntry = { kind = "SUPERPODER" }})
  mod.content.pokemon:patch("BELLSPROUT", {dexEntry = { kind = "FLOR" }})
  mod.content.pokemon:patch("WEEPINBELL", {dexEntry = { kind = "ATRAPAMOSCAS" }})
  mod.content.pokemon:patch("VICTREEBEL", {dexEntry = { kind = "ATRAPAMOSCAS" }})
  mod.content.pokemon:patch("TENTACOOL", {dexEntry = { kind = "MEDUSA" }})
  mod.content.pokemon:patch("TENTACRUEL", {dexEntry = { kind = "MEDUSA" }})
  mod.content.pokemon:patch("GEODUDE", {dexEntry = { kind = "ROCA" }})
  mod.content.pokemon:patch("GRAVELER", {dexEntry = { kind = "ROCA" }})
  mod.content.pokemon:patch("GOLEM", {dexEntry = { kind = "MEGATÓN" }})
  mod.content.pokemon:patch("PONYTA", {dexEntry = { kind = "CABALLO FUEGO" }})
  mod.content.pokemon:patch("RAPIDASH", {dexEntry = { kind = "CABALLO FUEGO" }})
  mod.content.pokemon:patch("SLOWPOKE", {dexEntry = { kind = "ATONTADO" }})
  mod.content.pokemon:patch("SLOWBRO", {dexEntry = { kind = "HERMITAÑO" }})
  mod.content.pokemon:patch("MAGNEMITE", {dexEntry = { kind = "IMÁN" }})
  mod.content.pokemon:patch("MAGNETON", {dexEntry = { kind = "IMÁN" }})
  mod.content.pokemon:patch("FARFETCHD", {dexEntry = { kind = "PATO SALVAJE" }})
  mod.content.pokemon:patch("DODUO", {dexEntry = { kind = "AVE GEMELA" }})
  mod.content.pokemon:patch("DODRIO", {dexEntry = { kind = "AVE TRIPLE" }})
  mod.content.pokemon:patch("SEEL", {dexEntry = { kind = "LEÓN MARINO" }})
  mod.content.pokemon:patch("DEWGONG", {dexEntry = { kind = "LEÓN MARINO" }})
  mod.content.pokemon:patch("GRIMER", {dexEntry = { kind = "LODO" }})
  mod.content.pokemon:patch("MUK", {dexEntry = { kind = "LODO" }})
  mod.content.pokemon:patch("SHELLDER", {dexEntry = { kind = "BIVALVO" }})
  mod.content.pokemon:patch("CLOYSTER", {dexEntry = { kind = "BIVALVO" }})
  mod.content.pokemon:patch("GASTLY", {dexEntry = { kind = "GAS" }})
  mod.content.pokemon:patch("HAUNTER", {dexEntry = { kind = "GAS" }})
  mod.content.pokemon:patch("GENGAR", {dexEntry = { kind = "SOMBRA" }})
  mod.content.pokemon:patch("ONIX", {dexEntry = { kind = "SERPIENTE ROCA" }})
  mod.content.pokemon:patch("DROWZEE", {dexEntry = { kind = "HIPNOSIS" }})
  mod.content.pokemon:patch("HYPNO", {dexEntry = { kind = "HIPNOSIS" }})
  mod.content.pokemon:patch("KRABBY", {dexEntry = { kind = "CANGREJO" }})
  mod.content.pokemon:patch("KINGLER", {dexEntry = { kind = "TENAZA" }})
  mod.content.pokemon:patch("VOLTORB", {dexEntry = { kind = "BOLA" }})
  mod.content.pokemon:patch("ELECTRODE", {dexEntry = { kind = "BOLA" }})
  mod.content.pokemon:patch("EXEGGCUTE", {dexEntry = { kind = "HUEVO" }})
  mod.content.pokemon:patch("EXEGGUTOR", {dexEntry = { kind = "COCO" }})
  mod.content.pokemon:patch("CUBONE", {dexEntry = { kind = "SOLITARIO" }})
  mod.content.pokemon:patch("MAROWAK", {dexEntry = { kind = "APILAHUESO" }})
  mod.content.pokemon:patch("HITMONLEE", {dexEntry = { kind = "PATADA" }})
  mod.content.pokemon:patch("HITMONCHAN", {dexEntry = { kind = "PUÑETAZO" }})
  mod.content.pokemon:patch("LICKITUNG", {dexEntry = { kind = "LAMETAZO" }})
  mod.content.pokemon:patch("KOFFING", {dexEntry = { kind = "GAS VENENOSO" }})
  mod.content.pokemon:patch("WEEZING", {dexEntry = { kind = "GAS VENENOSO" }})
  mod.content.pokemon:patch("RHYHORN", {dexEntry = { kind = "PUNZANTE" }})
  mod.content.pokemon:patch("RHYDON", {dexEntry = { kind = "TALADRO" }})
  mod.content.pokemon:patch("CHANSEY", {dexEntry = { kind = "HUEVO" }})
  mod.content.pokemon:patch("TANGELA", {dexEntry = { kind = "ENREDADERA" }})
  mod.content.pokemon:patch("KANGASKHAN", {dexEntry = { kind = "MATERNAL" }})
  mod.content.pokemon:patch("HORSEA", {dexEntry = { kind = "DRAGÓN" }})
  mod.content.pokemon:patch("SEADRA", {dexEntry = { kind = "DRAGÓN" }})
  mod.content.pokemon:patch("GOLDEEN", {dexEntry = { kind = "PEZ COLOR" }})
  mod.content.pokemon:patch("SEAKING", {dexEntry = { kind = "PEZ COLOR" }})
  mod.content.pokemon:patch("STARYU", {dexEntry = { kind = "ESTRELLA" }})
  mod.content.pokemon:patch("STARMIE", {dexEntry = { kind = "MISTERIOSO" }})
  mod.content.pokemon:patch("MR_MIME", {dexEntry = { kind = "BARRERA" }})
  mod.content.pokemon:patch("SCYTHER", {dexEntry = { kind = "MANTIS" }})
  mod.content.pokemon:patch("JYNX", {dexEntry = { kind = "ANTROPOMÓRFICO" }})
  mod.content.pokemon:patch("ELECTABUZZ", {dexEntry = { kind = "ELÉCTRICO" }})
  mod.content.pokemon:patch("MAGMAR", {dexEntry = { kind = "ESCUPEFUEGO" }})
  mod.content.pokemon:patch("PINSIR", {dexEntry = { kind = "ESCARABAJO" }})
  mod.content.pokemon:patch("TAUROS", {dexEntry = { kind = "TORO BRAVO" }})
  mod.content.pokemon:patch("MAGIKARP", {dexEntry = { kind = "PEZ" }})
  mod.content.pokemon:patch("GYARADOS", {dexEntry = { kind = "ATROCIDAD" }})
  mod.content.pokemon:patch("LAPRAS", {dexEntry = { kind = "TRANSPORTE" }})
  mod.content.pokemon:patch("DITTO", {dexEntry = { kind = "TRANSFORMACIÓN" }})
  mod.content.pokemon:patch("EEVEE", {dexEntry = { kind = "EVOLUCIÓN" }})
  mod.content.pokemon:patch("VAPOREON", {dexEntry = { kind = "BURBUJA" }})
  mod.content.pokemon:patch("JOLTEON", {dexEntry = { kind = "RELÁMPAGO" }})
  mod.content.pokemon:patch("FLAREON", {dexEntry = { kind = "LLAMA" }})
  mod.content.pokemon:patch("PORYGON", {dexEntry = { kind = "VIRTUAL" }})
  mod.content.pokemon:patch("OMANYTE", {dexEntry = { kind = "ESPIRAL" }})
  mod.content.pokemon:patch("OMASTAR", {dexEntry = { kind = "ESPIRAL" }})
  mod.content.pokemon:patch("KABUTO", {dexEntry = { kind = "ARMAZÓN" }})
  mod.content.pokemon:patch("KABUTOPS", {dexEntry = { kind = "ARMAZÓN" }})
  mod.content.pokemon:patch("AERODACTYL", {dexEntry = { kind = "FÓSIL" }})
  mod.content.pokemon:patch("SNORLAX", {dexEntry = { kind = "DORMIR" }})
  mod.content.pokemon:patch("ARTICUNO", {dexEntry = { kind = "CONGELAR" }})
  mod.content.pokemon:patch("ZAPDOS", {dexEntry = { kind = "ELÉCTRICO" }})
  mod.content.pokemon:patch("MOLTRES", {dexEntry = { kind = "LLAMA" }})
  mod.content.pokemon:patch("DRATINI", {dexEntry = { kind = "DRAGÓN" }})
  mod.content.pokemon:patch("DRAGONAIR", {dexEntry = { kind = "DRAGÓN" }})
  mod.content.pokemon:patch("DRAGONITE", {dexEntry = { kind = "DRAGÓN" }})
  mod.content.pokemon:patch("MEWTWO", {dexEntry = { kind = "GENÉTICO" }})
  mod.content.pokemon:patch("MEW", {dexEntry = { kind = "NUEVA ESPECIE" }})

end
