-- Blank Seal
SMODS.Atlas {
    key = "sealsplus1_atlas",
    path = "Blank.png",
    px = 71,
    py = 95,
}

SMODS.Seal {
  key = 'Blank',
  pos = { x = 0, y = 0 },
  atlas = "sealsplus1_atlas",
  badge_colour = G.C.DARK_EDITION,
  config = { extra = { trigger_count = 0 } },
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            -- Initialize trigger_goal if not set
            if not card.ability.seal.extra.trigger_goal then
                card.ability.seal.extra.trigger_goal = pseudorandom('blankseal', 8, 12)
            end
            -- Increment the trigger count each time this seal is triggered
            card.ability.seal.extra.trigger_count = (card.ability.seal.extra.trigger_count or 0) + 1
            -- Check if reached the random trigger goal
            if card.ability.seal.extra.trigger_count >= card.ability.seal.extra.trigger_goal then
                SMODS.add_card({ key = "c_soul", area = G.consumeables })
                local old_goal = card.ability.seal.extra.trigger_goal
                card.ability.seal.extra.trigger_count = 0 -- Reset count
                card.ability.seal.extra.trigger_goal = pseudorandom('blankseal', 8, 12) -- New random goal
            return {
                message = "Soul gained!",
                colour = G.C.Spectral
            }
        end
        return {
            message = "Triggered " .. tostring(card.ability.seal.extra.trigger_count) .. " times",
            colour = G.C.Spectral
        }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.seal.extra.trigger_count or 0 } }
    end
}

-- Jade Seal
SMODS.Atlas {
    key = "sealsplus2_atlas",
    path = "Jade.png",
    px = 71,
    py = 95,
}

SMODS.Seal {
    key = 'Jade',
    pos = { x = 0, y = 0 },
    atlas = "sealsplus2_atlas",
    badge_colour = G.C.DARK_EDITION,
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal} }
    end,
    calculate = function(self, card, context)
    if  pseudorandom('jade') < G.GAME.probabilities.normal / 3 then
       if context.cardarea == G.play and context.main_scoring then
        G.GAME.LAST_TRIGGERED_SEAL = 'sealsplus_Jade'
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    SMODS.add_card({ set = "Tarot_Planet",edition = "e_negative", area = G.consumeables })
                    G.GAME.consumeable_buffer = 0
                    return true
                end
            }))
            return { message = localize('k_plus_tarot'), colour = G.C.tarot }
        end
    end
    end
}


-- Spectral Seal
SMODS.Atlas {
    key = "sealsplus3_atlas",
    path = "Spectral.png",
    px = 71,
    py = 95,
}

SMODS.Seal {
    key = 'Spectral',
    pos = { x = 0, y = 0 },
    atlas = "sealsplus3_atlas",
    badge_colour = G.C.DARK_EDITION,
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal} }
    end,
    calculate = function(self, card, context)
        if  pseudorandom('spec') < G.GAME.probabilities.normal / 3 then
            if context.cardarea == G.play and context.main_scoring and (#G.consumeables.cards + G.GAME.consumeable_buffer) < G.consumeables.config.card_limit then
            G.GAME.LAST_TRIGGERED_SEAL = 'sealsplus_Spectral'
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    SMODS.add_card({ set = "Spectral", area = G.consumeables })
                    G.GAME.consumeable_buffer = 0
                    return true
                end
                
            }))
            end
        end
        if context.destroying_card and context.destroying_card == card then
            if pseudorandom('spec') < G.GAME.probabilities.normal/6 then
            return {
                message = "Destroyed",
                colour = G.C.Spectral
            ,remove = true}
            end
            delay(0.3)
        end
       
    end    
}

-- Double Red Seal
SMODS.Atlas {
    key = "sealsplus4_atlas",
    path = "D_Red.png",
    px = 71,
    py = 95,
}
SMODS.Seal {
    key = 'DoubleRed',
    pos = { x = 0, y = 0 },
    atlas = "sealsplus4_atlas",
    config = { extra = { retriggers = 2 } },
    badge_colour = G.C.DARK_EDITION,
    calculate = function(self, card, context)
        if context.repetition then
            return {
                repetitions = card.ability.seal.extra.retriggers,
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.retriggers } }
    end
}

-- Double Blue Seal
SMODS.Atlas {
    key = "sealsplus5_atlas",
    path = "D_Blue.png",
    px = 71,
    py = 95,
}
SMODS.Seal {
    key = 'DoubleBlue',
    pos = { x = 0, y = 0 },
    atlas = "sealsplus5_atlas",
    badge_colour = G.C.DARK_EDITION,
    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.hand and context.other_card == card then
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    if G.GAME.last_hand_played then
                        local _planet = nil
                        for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                            if v.config.hand_type == G.GAME.last_hand_played then
                                _planet = v.key
                            end
                        end
                        if _planet then
                            SMODS.add_card({ key = _planet, edition = "e_negative" })
                        end
                        G.GAME.consumeable_buffer = 0
                    end
                    return true
                end
            }))
            return { message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet }
        end
    end
}

-- Double Gold Seal
SMODS.Atlas {
    key = "sealsplus6_atlas",
    path = "D_Gold.png",
    px = 71,
    py = 95,
}
SMODS.Seal {
    key = 'DoubleGold',
    pos = { x = 0, y = 0 },
    atlas = "sealsplus6_atlas",
    config = { extra = { money = 7 } },
    badge_colour = G.C.DARK_EDITION,
    get_p_dollars = function(self, card)
        return card.ability.seal.extra.money
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.money } }
    end,
    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            G.shared_seals[card.seal].role.draw_major = card
            G.shared_seals[card.seal]:draw_shader('dissolve', nil, nil, nil, card.children.center)
            G.shared_seals[card.seal]:draw_shader('voucher', nil, card.ARGS.send_to_shader, nil, card.children.center)
        end
    end
}

-- Double Purple Seal
SMODS.Atlas {
    key = "sealsplus7_atlas",
    path = "D_Purple.png",
    px = 71,
    py = 95,
}
SMODS.Seal {
    key = 'DoublePurple',
    pos = { x = 0, y = 0 },
    atlas = "sealsplus7_atlas",
    badge_colour = G.C.DARK_EDITION,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card  then
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    SMODS.add_card({ set = 'Tarot', edition = "e_negative" })
                    G.GAME.consumeable_buffer = 0
                    return true
                end
            }))
            return { message = localize('k_plus_tarot'), colour = G.C.PURPLE }
        end
    end
}

-- Double Jade Seal
SMODS.Atlas {
    key = "sealsplus8_atlas",
    path = "D_Jade.png",
    px = 71,
    py = 95,
}
SMODS.Seal {
    key = 'DoubleJade',
    pos = { x = 0, y = 0 },
    atlas = "sealsplus8_atlas",
    badge_colour = G.C.DARK_EDITION,
    calculate = function(self, card, context)
       if context.cardarea == G.play and context.main_scoring then
            if  G.GAME.last_tarot_planet ~= nil then
                G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = function()
                            SMODS.add_card({ key = G.GAME.last_tarot_planet, edition = "e_negative", area = G.consumeables })
                            return true
                        end
                    }))
                return { message = "+ ".. tostring(G.GAME.last_tarot_planet) .. "", colour = G.C.Purple }  
            end
        end
    end
}

-- Double Spectral Seal
SMODS.Atlas {
    key = "sealsplus9_atlas",
    path = "D_Spectral.png",
    px = 71,
    py = 95,
}

SMODS.Seal {
    key = 'DoubleSpectral',
    pos = { x = 0, y = 0 },
    atlas = "sealsplus9_atlas",
    badge_colour = G.C.DARK_EDITION,
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal} }
    end,
    calculate = function(self, card, context)
        if  pseudorandom('spec') < G.GAME.probabilities.normal / 3 then
            if context.cardarea == G.play and context.main_scoring and (#G.consumeables.cards + G.GAME.consumeable_buffer) < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    SMODS.add_card({ key = 'c_cryptid' , area = G.consumeables })
                    G.GAME.consumeable_buffer = 0
                    return {message = "+ Cryptid",  colour = G.C.Spectral}
                end
                
            }))
            end
        end
        if context.destroying_card and context.destroying_card == card then
            if pseudorandom('spec') < G.GAME.probabilities.normal/6 then
            return {remove = true,
            message = "Destroyed", colour = G.C.Spectral}
            end
            delay(0.3)
        end
       
    end    
}

-- Red Gold Seal
SMODS.Atlas {
    key = "sealsplus10_atlas",
    path = "G_Red.png",
    px = 71,
    py = 95,
}
SMODS.Seal {
    key = 'RedGold',
    pos = { x = 0, y = 0 },
    atlas = "sealsplus10_atlas",
    config = { extra1 = { money = 2 }, extra2 = { retriggers = 1 } },
    badge_colour = G.C.DARK_EDITION,
    get_p_dollars = function(self, card)
        return card.ability.seal.extra1.money
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra1.money } }
    end,
    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            G.shared_seals[card.seal].role.draw_major = card
            G.shared_seals[card.seal]:draw_shader('dissolve', nil, nil, nil, card.children.center)
            G.shared_seals[card.seal]:draw_shader('voucher', nil, card.ARGS.send_to_shader, nil, card.children.center)
        end
    end,
    calculate = function(self, card, context)
        if context.repetition then
            return {
                repetitions = card.ability.seal.extra2.retriggers,
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra2.retriggers } }
    end
}

-- Red Blue Seal
SMODS.Atlas {
    key = "sealsplus11_atlas",
    path = "B_Red.png",
    px = 71,
    py = 95,
}
SMODS.Seal {
    key = 'RedBlue',
    pos = { x = 0, y = 0 },
    atlas = "sealsplus11_atlas",
    badge_colour = G.C.DARK_EDITION,
    calculate = function(self, card, context)
        local function do_logic()        
        if context.end_of_round and context.cardarea == G.hand and context.other_card == card and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    if G.GAME.last_hand_played then
                        local _planet = nil
                        for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                            if v.config.hand_type == G.GAME.last_hand_played then
                                _planet = v.key
                            end
                        end
                        if _planet then
                            SMODS.add_card({ key = _planet })
                        end
                        G.GAME.consumeable_buffer = 0
                    end
                    return true
                end
            }))
            return true
        end
        return false
    end

    -- Call the logic twice
    local did_anything = false
    for i = 1, 2 do
        if do_logic() then
            did_anything = true
        end
    end
    if did_anything then
        return { message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet }
    end
        if context.repetition and context.cardarea == G.hand then
            return {repetitions = 1}
        end
    end
}

-- Red Purple Seal
SMODS.Atlas {
    key = "sealsplus12_atlas",
    path = "P_Red.png",
    px = 71,
    py = 95,
}
SMODS.Seal {
    key = 'RedPurple',
    pos = { x = 0, y = 0 },
    atlas = "sealsplus12_atlas",
    badge_colour = G.C.DARK_EDITION,
    calculate = function(self, card, context)
        local function do_logic()
        if context.discard and context.other_card == card and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    SMODS.add_card({ set = 'Tarot' })
                    G.GAME.consumeable_buffer = 0
                    return true
                end
            }))
            return { message = localize('k_plus_tarot'), colour = G.C.PURPLE }
        end
        return false
    end
    local did_anything = false
    for i = 1, 2 do
        if do_logic() then
            did_anything = true
        end
    end
end
}

-- Red Jade Seal
SMODS.Atlas {
    key = "sealsplus13_atlas",
    path = "J_Red.png",
    px = 71,
    py = 95,
}

SMODS.Seal {
    key = 'RedJade',
    pos = { x = 0, y = 0 },
    atlas = "sealsplus13_atlas",
    badge_colour = G.C.DARK_EDITION,
    calculate = function(self, card, context)
       if context.cardarea == G.play and context.main_scoring then
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    SMODS.add_card({ set = "Tarot_Planet",edition = "e_negative", area = G.consumeables })
                    G.GAME.consumeable_buffer = 0
                    return {message = "+1 tarot/planet", colour = G.C.PURPLE}
                end
            }))
        end
    end,
    
}

-- Red Spectral Seal
SMODS.Atlas {
    key = "sealsplus14_atlas",
    path = "S_Red.png",
    px = 71,
    py = 95,
}

SMODS.Seal {
    key = 'RedSpectral',
    pos = { x = 0, y = 0 },
    atlas = "sealsplus14_atlas",
    badge_colour = G.C.DARK_EDITION,
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal} }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring and (#G.consumeables.cards + G.GAME.consumeable_buffer) < G.consumeables.config.card_limit then
            G.GAME.LAST_TRIGGERED_SEAL = 'sealsplus_Spectral'
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    SMODS.add_card({ set = "Spectral", area = G.consumeables })
                    G.GAME.consumeable_buffer = 0
                    return {message = "+ Spectral", colour = G.C.Spectral }
                end
                
            }))
        end
        if context.destroying_card and context.destroying_card == card then
            if pseudorandom('spec') < G.GAME.probabilities.normal/6 then
            return {remove = true,
            message = "Destroyed", colour = G.C.Spectral}
            end
            delay(0.3)
        end
       
    end    
}

-- Gold Blue Seal
SMODS.Atlas {
    key = "sealsplus15_atlas",
    path = "B_Gold.png",
    px = 71,
    py = 95,
}
SMODS.Seal {
    key = 'GoldBlue',
    pos = { x = 0, y = 0 },
    atlas = "sealsplus15_atlas",
    badge_colour = G.C.DARK_EDITION,
    config = { extra = { h_money = 2 } },
    calculate = function(self, card, context)
        if context.playing_card_end_of_round and context.cardarea == G.hand then
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    if G.GAME.last_hand_played and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        local _planet = nil
                        for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                            if v.config.hand_type == G.GAME.last_hand_played then
                                _planet = v.key
                            end
                        end
                        if _planet then
                            SMODS.add_card({ key = _planet })
                            SMODS.calculate_effect({message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet}, card)
                        end
                        G.GAME.consumeable_buffer = 0
                    end
                    return true
                end,
            }))
            return{ dollars = card.ability.seal.extra.h_money }
        end
    end
}   

-- Gold Purple Seal
SMODS.Atlas {
    key = "sealsplus16_atlas",
    path = "P_Gold.png",
    px = 71,
    py = 95,
}
SMODS.Seal {
    key = 'GoldPurple',
    pos = { x = 0, y = 0 },
    badge_colour = G.C.DARK_EDITION,
    atlas = "sealsplus16_atlas",
    config = { extra = { money = 2 } },
    calculate = function(self, card, context)
        if context.discard and context.other_card == card then
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        SMODS.add_card({ set = 'Tarot' })
                        SMODS.calculate_effect{ { message = localize('k_plus_tarot'), colour = G.C.PURPLE },}
                        G.GAME.consumeable_buffer = 0
                    end
                return true
            end
            }))
            return{ dollars = card.ability.seal.extra.money }
        end
    end
}

-- Gold Jade Seal
SMODS.Atlas {
    key = "sealsplus17_atlas",
    path = "J_Gold.png",
    px = 71,
    py = 95,
}
SMODS.Seal {
    key = 'GoldJade',
    pos = { x = 0, y = 0 },
    atlas = "sealsplus17_atlas",
    badge_colour = G.C.DARK_EDITION,
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal} }
    end,
    calculate = function(self, card, context)
    if  pseudorandom('jade') < G.GAME.probabilities.normal / 3 then
       if context.cardarea == G.play and context.main_scoring then
        G.GAME.LAST_TRIGGERED_SEAL = 'sealsplus_Jade'
            G.E_MANAGER:add_event(Event({
                trigger = "immediate",
                func = function()
                    if pseudorandom("GoldJade", 0, 1) == 1 then
                    SMODS.add_card({ key = "c_hermit", edition = "e_negative", area = G.consumeables})
                    return true
                    else
                    SMODS.add_card({ key = "c_temperance", edition = "e_negative", area = G.consumables })
                    return true
                end
            end
            }))
            return { message = localize('k_plus_tarot'), colour = G.C.PURPLE }
        end
    end
end
}

-- Gold Spectral Seal
SMODS.Atlas {
    key = "sealsplus18_atlas",
    path = "S_Gold.png",
    px = 71,
    py = 95,
}

SMODS.Seal {
    key = 'GoldSpectral',
    pos = { x = 0, y = 0 },
    atlas = "sealsplus18_atlas",
    badge_colour = G.C.DARK_EDITION,
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal} }
    end,
    calculate = function(self, card, context)
        if  pseudorandom('spec') < G.GAME.probabilities.normal / 3 then
            if context.cardarea == G.play and context.main_scoring and (#G.consumeables.cards + G.GAME.consumeable_buffer) < G.consumeables.config.card_limit then
            G.GAME.LAST_TRIGGERED_SEAL = 'sealsplus_Spectral'
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    SMODS.add_card({ key = "c_immolate", area = G.consumeables })
                    G.GAME.consumeable_buffer = 0
                    return {message =  "+ Immolate", colour = G.C.Spectral}
                end
                
            }))
            end
        end
        if context.destroying_card and context.destroying_card == card then
            if pseudorandom('spec') < G.GAME.probabilities.normal/6 then
            return {remove = true,
            message = "Destroyed", colour = G.C.Spectral}
            end
            delay(0.3)
        end
    end 
}

-- Blue Purple Seal
SMODS.Atlas {
    key = "sealsplus19_atlas",
    path = "P_Blue.png",
    px = 71,
    py = 95,
}
SMODS.Seal {
    key = 'BluePurple',
    pos = { x = 0, y = 0 },
    atlas = "sealsplus19_atlas",
    badge_colour = G.C.DARK_EDITION,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    if G.GAME.last_hand_played then
                        local _planet = nil
                        for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                            if v.config.hand_type == G.GAME.last_hand_played then
                                _planet = v.key
                            end
                        end
                        if _planet then
                            SMODS.add_card({ key = _planet })
                        end
                        G.GAME.consumeable_buffer = 0
                    end
                    return true
                end
            }))
            return { message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet }
        end
        if context.end_of_round and context.cardarea == G.hand and context.other_card == card and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    SMODS.add_card({ set = 'Tarot' })
                    G.GAME.consumeable_buffer = 0
                    return true
                end
            }))
            return { message = localize('k_plus_tarot'), colour = G.C.PURPLE }
        end
    end
}

-- Blue Jade Seal
SMODS.Atlas {
    key = "sealsplus20_atlas",
    path = "J_Blue.png",
    px = 71,
    py = 95,
}
SMODS.Seal {
    key = 'BlueJade',
    pos = { x = 0, y = 0 },
    atlas = "sealsplus20_atlas",
    badge_colour = G.C.DARK_EDITION,
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal} }
    end,
    calculate = function(self, card, context)
    if  pseudorandom('jade') < G.GAME.probabilities.normal / 3 then
       if context.cardarea == G.play and context.main_scoring then
        G.GAME.LAST_TRIGGERED_SEAL = 'sealsplus_Jade'
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    SMODS.add_card({ key = "c_high_priestess" ,edition = "e_negative", area = G.consumeables })
                    G.GAME.consumeable_buffer = 0
                    return true
                end
            }))
            return { message = localize('k_plus_tarot'), colour = G.C.PURPLE }
        end
    end
end
}

-- Blue Spectral Seal
SMODS.Atlas {
    key = "sealsplus21_atlas",
    path = "S_Blue.png",
    px = 71,
    py = 95,
}

SMODS.Seal {
    key = 'BlueSpectral',
    pos = { x = 0, y = 0 },
    atlas = "sealsplus21_atlas",
    badge_colour = G.C.DARK_EDITION,
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal} }
    end,
    calculate = function(self, card, context)
        if  pseudorandom('spec') < G.GAME.probabilities.normal / 3 then
            if context.cardarea == G.play and context.main_scoring and (#G.consumeables.cards + G.GAME.consumeable_buffer) < G.consumeables.config.card_limit then
            G.GAME.LAST_TRIGGERED_SEAL = 'sealsplus_Spectral'
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    SMODS.add_card({ key = "c_black_hole", area = G.consumeables })
                    G.GAME.consumeable_buffer = 0
                    return {message = "+ Black Hole", colour = G.C.Spectral}
                end
                
            }))
            end
        end
        if context.destroying_card and context.destroying_card == card then
            if pseudorandom('spec') < G.GAME.probabilities.normal/6 then
            return {remove = true,
            message = "Destroyed", colour = G.C.Spectral}
            end
            delay(0.3)
        end
    end 
}

-- Purple Jade Seal
SMODS.Atlas {
    key = "sealsplus22_atlas",
    path = "J_Purple.png",
    px = 71,
    py = 95,
}
SMODS.Seal {
    key = 'PurpleJade',
    pos = { x = 0, y = 0 },
    atlas = "sealsplus22_atlas",
    badge_colour = G.C.DARK_EDITION,
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal} }
    end,
    calculate = function(self, card, context)
    if  pseudorandom('jade') < G.GAME.probabilities.normal / 3 then
       if context.cardarea == G.play and context.main_scoring then
        G.GAME.LAST_TRIGGERED_SEAL = 'sealsplus_Jade'
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    SMODS.add_card({ key = "c_emperor",edition = "e_negative", area = G.consumeables })
                    G.GAME.consumeable_buffer = 0
                    return true
                end
            }))
            return { message = localize('k_plus_tarot'), colour = G.C.PURPLE }
        end
    end
end
}

-- Purple Spectral Seal
SMODS.Atlas {
    key = "sealsplus23_atlas",
    path = "S_Purple.png",
    px = 71,
    py = 95,
}

SMODS.Seal {
    key = 'PurpleSpectral',
    pos = { x = 0, y = 0 },
    atlas = "sealsplus23_atlas",
    badge_colour = G.C.DARK_EDITION,
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal} }
    end,
    calculate = function(self, card, context)
        if  pseudorandom('spec') < G.GAME.probabilities.normal / 3 then
            if context.cardarea == G.play and context.main_scoring and (#G.consumeables.cards + G.GAME.consumeable_buffer) < G.consumeables.config.card_limit then
            G.GAME.LAST_TRIGGERED_SEAL = 'sealsplus_Spectral'
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    SMODS.add_card({ key = "c_aura", area = G.consumeables })
                    G.GAME.consumeable_buffer = 0
                    return {message = "+ Aura", colour = G.C.Spectral}
                end
                
            }))
            end
        end
        if context.destroying_card and context.destroying_card == card then
            if pseudorandom('spec') < G.GAME.probabilities.normal/6 then
            return {remove = true,
        message = "Destroyed", colour = G.C.Spectral}
            end
            delay(0.3)
        end
    end 
}

-- Jade Spectral Seal
SMODS.Atlas {
    key = "sealsplus24_atlas",
    path = "S_Jade.png",
    px = 71,
    py = 95,
}

SMODS.Seal {
    key = 'JadeSpectral',
    pos = { x = 0, y = 0 },
    atlas = "sealsplus24_atlas",
    badge_colour = G.C.DARK_EDITION,
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal} }
    end,
    calculate = function(self, card, context)
        if  pseudorandom('spec') < G.GAME.probabilities.normal / 3 then
            if context.cardarea == G.play and context.main_scoring and (#G.consumeables.cards + G.GAME.consumeable_buffer) < G.consumeables.config.card_limit then
            G.GAME.LAST_TRIGGERED_SEAL = 'sealsplus_Spectral'
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    SMODS.add_card({ key = "c_wraith", area = G.consumeables })
                    G.GAME.consumeable_buffer = 0
                    return {message = "+ Wraith", colour = G.C.Spectral}
                end
                
            }))
            end
        end
        if context.destroying_card and context.destroying_card == card then
            if pseudorandom('spec') < G.GAME.probabilities.normal/6 then
            return {remove = true,
        message = "Destroyed", colour = G.C.Spectral}
            end
            delay(0.3)
        end
    end 
}