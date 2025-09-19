SMODS.Atlas {
	key = "main",
	path = "SealJokers.png",
	px = 71,
	py = 95,
}

-- Stamp Joker
SMODS.Joker {
    key = "stampjoker",
    discovered = true,
    blueprint_compat = false,
    rarity = 2,
    cost = 6,
    pos = { x = 0, y = 0 },
	atlas ="main",
    calculate = function(self, card, context)
        if context.first_hand_drawn then
            local eval = function() return G.GAME.current_round.discards_used == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.discard and not context.blueprint and
            G.GAME.current_round.discards_used <= 0 and #context.full_hand == 1 then
                local target_card = context.full_hand[1]
            if target_card then
                return {
                    target_card:set_seal(SMODS.poll_seal({ guaranteed = true, type_key = '' }), nil, true)
                }
            end
        end
    end
}

SMODS.Joker {
    key = "waxjoker",
    discovered = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 1, y = 0 },
    atlas = "main",
    config = { extra = { repetitions = 1, odds = 10 }},
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds} }
    end,
    calculate = function(self, card, context)
        if context.repetition and context.other_card.ability.seal then
            local wax = context.other_card
            return {
                repetitions = card.ability.extra.repetitions,
                func = function() -- This is for timing purposes, everything here runs after the message
                    G.E_MANAGER:add_event(Event({
                        func = function()
                           if pseudorandom('sealsplus_waxjoker') < G.GAME.probabilities.normal / card.ability.extra.odds then
                                card:remove()
                            end
                            return {
                                message = "Melted",
                                colour = G.C.FILTER
                            }
                        end
                    }))
                end
            }
        end
        if context.carearea == G.hand and context.other_card.ability.seal then
            local wax = context.other_card
            return {
                repetitions = card.ability.extra.repetitions,
                func = function() -- This is for timing purposes, everything here runs after the message
                    G.E_MANAGER:add_event(Event({
                        func = function()
                           if pseudorandom('sealsplus_waxjoker') < G.GAME.probabilities.normal / card.ability.extra.odds then
                                card:remove()
                            end
                            return {
                                message = "Melted",
                                colour = G.C.FILTER
                            }
                        end
                    }))
                end
            }
        end
    end,
}

SMODS.Joker {
    key = "sealjoker",
    discovered = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 2, y = 0 },
    atlas = "main",
    config = { extra = { chips = 0, chip_mod = 3 }},
    loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod } }
    end,
    calculate = function(self, card, context)
         if context.individual and context.cardarea == G.play and context.other_card.seal and not context.blueprint then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS,
                message_card = card
            }
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
end   
}

SMODS.Joker {
    key = "mischievousspirit",
    discovered = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 3, y = 0 },
    atlas = "main",
    config = { extra = { odds = 6 }, max_highlighted = 1},
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds} }
    end,
    calculate = function(self, card, context)
    if context.using_consumeable and not context.blueprint and context.consumeable.config.center.key == "c_deja_vu" then
        local _S = G.hand.highlighted[1]
         if pseudorandom('sealsplus_mischievousspiritr') < G.GAME.probabilities.normal / card.ability.extra.odds then
            G.E_MANAGER:add_event(Event({
            trigger = "after", 
            delay = 0.5, 
            func = function() 
                _S:set_seal("sealsplus_DoubleRed",nil, true)
                return true 
            end
        }))
        card:juice_up()
    end
    end
    if context.using_consumeable and not context.blueprint and context.consumeable.config.center.key == "c_talisman" then
        local _S = G.hand.highlighted[1]
         if pseudorandom('sealsplus_mischievousspiritr') < G.GAME.probabilities.normal / card.ability.extra.odds then
            G.E_MANAGER:add_event(Event({
            trigger = "after", 
            delay = 0.5, 
            func = function() 
                _S:set_seal("sealsplus_DoubleGold",nil, true)
                return true 
            end
        }))
        card:juice_up()
    end
    end
    if context.using_consumeable and not context.blueprint and context.consumeable.config.center.key == "c_trance" then
        local _S = G.hand.highlighted[1]
         if pseudorandom('sealsplus_mischievousspiritr') < G.GAME.probabilities.normal / card.ability.extra.odds then
            G.E_MANAGER:add_event(Event({
            trigger = "after", 
            delay = 0.5, 
            func = function() 
                _S:set_seal("sealsplus_DoubleBlue",nil, true)
                return true 
            end
        }))
        card:juice_up()
    end
    end
    if context.using_consumeable and not context.blueprint and context.consumeable.config.center.key == "c_medium" then
        local _S = G.hand.highlighted[1]
         if pseudorandom('sealsplus_mischievousspiritr') < G.GAME.probabilities.normal / card.ability.extra.odds then
            G.E_MANAGER:add_event(Event({
            trigger = "after", 
            delay = 0.5, 
            func = function() 
                _S:set_seal("sealsplus_DoublePurple",nil, true)
                return true 
            end
        }))
        card:juice_up()
    end
    end
    if context.using_consumeable and not context.blueprint and context.consumeable.config.center.key == "c_sealsplus_phantom" then
        local _S = G.hand.highlighted[1]
         if pseudorandom('sealsplus_mischievousspiritr') < G.GAME.probabilities.normal / card.ability.extra.odds then
            G.E_MANAGER:add_event(Event({
            trigger = "after", 
            delay = 0.5, 
            func = function() 
                _S:set_seal("sealsplus_DoubleSpectral",nil, true)
                return true 
            end
        }))
        card:juice_up()
    end
    end
    if context.using_consumeable and not context.blueprint and context.consumeable.config.center.key == "c_sealsplus_nephrite" then
        local _S = G.hand.highlighted[1]
         if pseudorandom('sealsplus_mischievousspiritr') < G.GAME.probabilities.normal / card.ability.extra.odds then
            G.E_MANAGER:add_event(Event({
            trigger = "after", 
            delay = 0.5, 
            func = function() 
                _S:set_seal("sealsplus_DoubleJade",nil, true)
                return true 
            end
        }))
        card:juice_up()
    end
    end
end
}

SMODS.Joker {
    key = "rowlandhill", -- (sic)
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 4,
    cost = 20,
    atlas = "main",
    pos = { x = 5, y = 0 },
    soul_pos = { x = 5, y = 1 },
    config = { extra = { xmult = 1, xmult_gain = 0.25 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult_gain, card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
         if context.individual and context.cardarea == G.play and context.other_card.seal and not context.blueprint then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT,
                message_card = card
            }
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.xmult
            }
        end
end 
}

SMODS.Joker {
    key = "forgery", -- (sic)
    discovered = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    atlas = "main",
    pos = { x = 4, y = 0 },
    config = { extra = { dollars = 1 } },
    loc_vars = function(self, info_queue, card)
        local seal_count = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card.seal and playing_card.seal ~= "" then
                    seal_count = seal_count + 1
                end
            end
        end
        return { vars = {card.ability.extra.dollars, card.ability.extra.dollars * seal_count } }
    end,
    calc_dollar_bonus = function(self, card)
            -- Count seals in deck
            local seal_count = 0
            if G.playing_cards then
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card.seal and playing_card.seal ~= "" then
                        seal_count = seal_count + 1
                    end
                end
            end
            return seal_count > 0 and card.ability.extra.dollars * seal_count or nil
    end,
}

SMODS.Joker {
    key = "hoarder",
    discovered = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 0, y = 1 },
    atlas = "main",
    config = { extra = { mult = 2 } },
    loc_vars = function(self, info_queue, card)
        local seal_count = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card.seal and playing_card.seal ~= "" then
                    seal_count = seal_count + 1
                end
            end
        end
        return { vars = {seal_count*2 } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            -- Count seals in deck
            local seal_count = 0
            if G.playing_cards then
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card.seal and playing_card.seal ~= "" then
                        seal_count = seal_count + 1
                    end
                end
            end
            return {
                mult = seal_count * card.ability.extra.mult
            }
        end
    end,
}

SMODS.Joker {
    key = "sealedaway",
    discovered = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 1, y = 1 },
    atlas = "main",
    config = { extra = { xmult_gain = 0.25, Xmult = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult_gain, card.ability.extra.Xmult } }
    end,
     calculate = function(self, card, context)
        if context.before and context.scoring_hand then
            local removed = 0
            if G.play.cards then
                for _, played_card in ipairs(G.play.cards) do
                    if played_card.seal and played_card.seal ~= "" then
                        played_card:set_seal(nil, nil, true)
                        removed = removed + 1
                    end
                end
            end
            if removed > 0 then
                card.ability.extra.Xmult = (card.ability.extra.Xmult or 1) + removed * card.ability.extra.xmult_gain
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.Xmult
            }
        end
    end,
}

SMODS.Joker {
    key = "doublestamp",
    discovered = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    pos = { x = 2, y = 1 },
    atlas = "main",
    config = { extra = { odds = 6 }},
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds} }
    end,
    calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and not context.blueprint and context.other_card.seal == "Red" then
        local other_card = context.other_card
         if pseudorandom('sealsplus_doublestamp') < G.GAME.probabilities.normal / card.ability.extra.odds then
            G.E_MANAGER:add_event(Event({
            delay = 0.5, 
            func = function() 
                other_card:set_seal("sealsplus_DoubleRed",nil, true)
                return true 
            end
        }))
        card:juice_up()
    end
    end
    if context.individual and context.cardarea == G.play and not context.blueprint and context.other_card.seal == "Gold" then
        local other_card = context.other_card
         if pseudorandom('sealsplus_doublestamp') < G.GAME.probabilities.normal / card.ability.extra.odds then
            G.E_MANAGER:add_event(Event({ 
            delay = 0.5, 
            func = function() 
                other_card:set_seal("sealsplus_DoubleGold",nil, true)
                return true 
            end
        }))
        card:juice_up()
    end
    end
    if context.individual and context.cardarea == G.play and not context.blueprint and context.other_card.seal == "Blue" then
        local other_card = context.other_card
         if pseudorandom('sealsplus_doublestamp') < G.GAME.probabilities.normal / card.ability.extra.odds then
            G.E_MANAGER:add_event(Event({
            delay = 0.5, 
            func = function() 
                other_card:set_seal("sealsplus_DoubleBlue",nil, true)
                return true 
            end
        }))
        card:juice_up()
    end
    end
    if context.individual and context.cardarea == G.play and not context.blueprint and context.other_card.seal == "Purple" then
        local other_card = context.other_card
         if pseudorandom('sealsplus_doublestamp') < G.GAME.probabilities.normal / card.ability.extra.odds then
            G.E_MANAGER:add_event(Event({
            delay = 0.5, 
            func = function() 
                other_card:set_seal("sealsplus_DoublePurple",nil, true)
                return true 
            end
        }))
        card:juice_up()
    end
    end
    if context.individual and context.cardarea == G.play and not context.blueprint and context.other_card.seal == "sealsplus_Spectral" then
        local other_card = context.other_card
         if pseudorandom('sealsplus_doublestamp') < G.GAME.probabilities.normal / card.ability.extra.odds then
            G.E_MANAGER:add_event(Event({
            delay = 0.5, 
            func = function() 
                other_card:set_seal("sealsplus_DoubleSpectral",nil, true)
                return true 
            end
        }))
        card:juice_up()
    end
    end
    if context.individual and context.cardarea == G.play and not context.blueprint and context.other_card.seal == "sealsplus_Jade" then
        local other_card = context.other_card
         if pseudorandom('sealsplus_doublestamp') < G.GAME.probabilities.normal / card.ability.extra.odds then
            G.E_MANAGER:add_event(Event({
            trigger = "after", 
            delay = 0.5, 
            func = function() 
                other_card:set_seal("sealsplus_DoubleJade",nil, true)
                return true 
            end
        }))
        card:juice_up()
    end
    end
end
}

SMODS.Joker {
    key = "sealthedeal",
    discovered = true,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    pos = { x = 3, y = 1 },
    atlas = "main",
    config = { extra = { xmult = 1.5 } }, -- set your idol seal here
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card.seal then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
}

SMODS.Joker {
    key = "invitation",
    discovered = true,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    pos = { x = 4, y = 1 },
    atlas = "main",
    config = { extra = { xmult = 1.5 } }, -- set your idol seal here
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and context.other_card.seal then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
}