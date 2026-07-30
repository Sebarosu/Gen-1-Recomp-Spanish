-- Generated qid-driven literal dialogue handlers.
return function(mod)
  local TextBox = mod.ui.TextBox
  local ChoiceBox = mod.ui.ChoiceBox
  mod.content.map_scripts:register("VIRIDIAN_CITY", {talk = {
    ["TEXT_VIRIDIANCITY_YOUNGSTER2"] = function(game, ow, npc, done)
      game.stack:push(TextBox.new(game, "¿Quieres saber\nalgo sobre los 2\11tipos de orugas\11POKéMON?", function()
        game.stack:push(ChoiceBox.new(game, function(yes)
          game.stack:push(TextBox.new(game, yes and "¡CATERPIE no\ntiene veneno,\11pero WEEDLE sí!\12¡Cuidado con su\nVENENOSO AGUIJÓN!" or "¡Oh, muy bien!", done))
        end))
      end))
    end,
  },
  })
  mod.content.map_scripts:register("MUSEUM_1F", {talk = {
    ["TEXT_MUSEUM1F_SCIENTIST1"] = function(game, ow, npc, done)
      if game.save.flags["EVENT_BOUGHT_MUSEUM_TICKET"] then
        game.stack:push(TextBox.new(game, "¡Lleva mucho\ntiempo mirar!", done))
      else
        game.stack:push(TextBox.new(game, "Son 50$ por un\nbillete de niño.\12¿Te gustaría\nentrar?", function()
          game.stack:push(ChoiceBox.new(game, function(yes)
            if yes then
              if (game.save.money or 0) >= 50 then
                game.save.money = (game.save.money or 0) + (-50)
                game.save.flags["EVENT_BOUGHT_MUSEUM_TICKET"] = true
                game.stack:push(TextBox.new(game, "¡50$! ¡Vale!\n¡Gracias!", done))
              else
                game.stack:push(TextBox.new(game, "No tienes\nbastante dinero.", done))
              end
            else
              game.stack:push(TextBox.new(game, "¡Hasta pronto!", done))
            end
          end))
        end))
      end
    end,
  },
    onStep = function(game, ow, x, y)
      if ((x == 9 and y == 4) or (x == 10 and y == 4)) and not game.save.flags["EVENT_BOUGHT_MUSEUM_TICKET"] then
        local function on_done() end
        game.stack:push(TextBox.new(game, "Son 50$ por un\nbillete de niño.\12¿Te gustaría\nentrar?", function()
          game.stack:push(ChoiceBox.new(game, function(yes)
            if yes then
              if (game.save.money or 0) >= 50 then
                game.save.money = (game.save.money or 0) + (-50)
                game.save.flags["EVENT_BOUGHT_MUSEUM_TICKET"] = true
                game.stack:push(TextBox.new(game, "¡50$! ¡Vale!\n¡Gracias!", on_done))
              else
                game.stack:push(TextBox.new(game, "No tienes\nbastante dinero.", function()
                  ow:scriptMove(ow.player, "down", 1, on_done)
                end))
              end
            else
              game.stack:push(TextBox.new(game, "¡Hasta pronto!", function()
                ow:scriptMove(ow.player, "down", 1, on_done)
              end))
            end
          end))
        end))
        return true
      end
      return false
    end,
  })
  mod.content.map_scripts:register("BIKE_SHOP", {talk = {
    ["TEXT_BIKESHOP_CLERK"] = function(game, ow, npc, done)
      if (game.save.inventory["BICYCLE"] or 0) > 0 then
        game.stack:push(TextBox.new(game, "¿Te gusta tu\nnueva BICICLETA?\12¡Puedes usarla\npor el CAMINO de\11las BICIS y por\11las cuevas!", done))
      else
        if (game.save.inventory["BIKE_VOUCHER"] or 0) > 0 then
          game.stack:push(TextBox.new(game, "¡Oh! Eso es...\12¡Un BONO para\nuna BICICLETA!\12¡Muy bien!\n¡Toda tuya!", function()
            game.save.inventory["BIKE_VOUCHER"] = nil
            game.save.inventory["BICYCLE"] = 1
            game.save.flags["EVENT_GOT_BICYCLE"] = true
            game.stack:push(TextBox.new(game, "{PLAYER} cambió\nel BONO por una\11BICICLETA.", done))
          end))
        else
          game.stack:push(TextBox.new(game, "¡Bienvenido a la\nTIENDA de BICIS!\12¡Tenemos la BICI\nque buscabas!", done))
        end
      end
    end,
  },
  })
  mod.content.map_scripts:register("BIKE_SHOP", {talk = {
    ["TEXT_BIKESHOP_MIDDLE_AGED_WOMAN"] = function(game, ow, npc, done)
      game.stack:push(TextBox.new(game, "¡Sólo necesito\nuna BICICLETA\11normal!\12¡No puedes poner\nuna cesta en una\11MOTOCICLETA!", done))
    end,
  },
  })
  mod.content.map_scripts:register("BIKE_SHOP", {talk = {
    ["TEXT_BIKESHOP_YOUNGSTER"] = function(game, ow, npc, done)
      if (game.save.flags["EVENT_GOT_BICYCLE"] or (game.save.inventory["BICYCLE"] or 0) > 0) then
        game.stack:push(TextBox.new(game, "¡Uauu! ¡Vaya\nBICI tan chula!", done))
      else
        game.stack:push(TextBox.new(game, "¡Estas BICIS son\ngeniales, pero\11muy caras!", done))
      end
    end,
  },
  })
end
