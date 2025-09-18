--normal pack 1
SMODS.Atlas({
    key = "Booster1",
    path = "P_Standard_1.png",
    px = 71,
    py = 95,
})

SMODS.Booster({
    key = "normal1_pack",
    atlas = "Booster1",
    pos = { x = 0, y = 0  },
    discovered = true,
    draw_hand = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,
    config = {
        choose = 1,
        extra = 2,
    },
    cost = 4,
    weight = 1,
    kind = "TheSeals",
    group_key = "k_sealsplus_booster_group",
    create_card = function(self, card)
        return {
            set = "TheSeals",
            area = G.pack_cards,
            skip_materialize = true,
        }
    end,
})

--normal pack 2
SMODS.Atlas({
    key = "Booster2",
    path = "P_Standard_2.png",
    px = 71,
    py = 95,
})

SMODS.Booster({
    key = "normal2_pack",
    atlas = "Booster2",
    pos = { x = 0, y = 0  },
    discovered = true,
    draw_hand = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,
    config = {
        choose = 1,
        extra = 2,
    },
    cost = 4,
    weight = 1,
    kind = "TheSeals",
    group_key = "k_sealsplus_booster_group",
    create_card = function(self, card)
        return {
            set = "TheSeals",
            area = G.pack_cards,
            skip_materialize = true,
        }
    end,
})

--jumbo pack
SMODS.Atlas({
    key = "Booster3",
    path = "P_Jumbo.png",
    px = 71,
    py = 95,
})

SMODS.Booster({
    key = "jumbo_pack",
    atlas = "Booster3",
    pos = { x = 0, y = 0  },
    discovered = true,
    draw_hand = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,
    config = {
        choose = 1,
        extra = 4,
    },
    cost = 4,
    weight = 1,
    kind = "TheSeals",
    group_key = "k_sealsplus_booster_group",
    create_card = function(self, card)
        return {
            set = "TheSeals",
            area = G.pack_cards,
            skip_materialize = true,
        }
    end,
})

--mega pack 
SMODS.Atlas({
    key = "Booster4",
    path = "P_Mega.png",
    px = 71,
    py = 95,
})

SMODS.Booster({
    key = "mega_pack",
    atlas = "Booster4",
    pos = { x = 0, y = 0  },
    discovered = true,
    draw_hand = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,
    config = {
        choose = 2,
        extra = 5,
    },
    cost = 8,
    weight = 1,
    kind = "TheSeals",
    group_key = "k_sealsplus_booster_group",
    create_card = function(self, card)
        return {
            set = "TheSeals",
            area = G.pack_cards,
            skip_materialize = true,
        }
    end,

})
