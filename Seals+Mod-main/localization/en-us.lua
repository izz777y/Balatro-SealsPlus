return{ -- things in this file ARE case sensitive, so make sure you are using the correct capitalization
    descriptions = {
        back ={
            
        },
        Joker = {
            j_sealsplus_stampjoker = {
                name = "Stamp Joker",
                text = {
                    "If {C:attention}first discard{} of round",
                    "has only {C:attention}1{} card, create a random Seal",
                }
            },
            j_sealsplus_waxjoker = {
                name = "Wax Joker",
                text = {
                    "trigger played or in hand seals {C:attention}1{} more time",
                    "{C:green}#1# in #2#{} chance to destroy seal",
                }
            },
            j_sealsplus_sealjoker = {
                name = "Seal Seal",
                text = {
                    "gains {X:chips,C:white} +3 {} chips for every played seal",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
                }
            },
            j_sealsplus_mischievousspirit = {
                name = "Mischievous spirit",
                text = {
                    "{C:green}#1# in #2#{} chance to get double seal",
                    "when adding a seal to a card"
                }
            },
            j_sealsplus_rowlandhill = {
                name = "Rowland Hill",
                text = {
                   "This Joker gains {X:mult,C:white} X0.25 {} Mult",
                    "for every {C:attention}seal{} played",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                }
            },
            j_sealsplus_forgery = {
                name = "Forgery",
                text = {
                   "This Joker gives {C:money}1${} for ",
                    "every seal in deck",
                    "{C:inactive}(Currently {C:money}+#2#${C:inactive} )",
                }
            },
            j_sealsplus_hoarder = {
                name = "Hoarder",
                text = {
                    "{C:mult}+2{} mult for each",
                    "seal in {C:attention}deck",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} mult)",
                }
            },
            j_sealsplus_sealedaway = {
                name = "Sealed Away",
                text = {
                    "Removes played card seals",
                    "for every seal removed gains {C:mult}X0.25{C:inactive} mult",
                    "{C:inactive}(Currently {C:mult}X#2#{C:inactive} mult)",
                }
            },
            j_sealsplus_doublestamp = {
                name = "Double Stamp",
                text = {
                    "{C:green}#1# in #2#{} chance for a played seal",
                    "to become a double seal",
                }
            },
            j_sealsplus_sealthedeal = {
                name = "Seal the Deal",
                text = {
                    "{C:mult}X1.5{} mult for every",
                    "played and scored seal",
                }
            },
            j_sealsplus_invitation = {
                name = "Invitation",
                text = {
                    "{C:mult}X1.5{} mult for every",
                    "seal in hand",
                }
            },


        },

        Spectral = {
            c_sealsplus_null = {
                name = "Null",
                text = {
                    "Add a {C:dark_edition}Blank Seal{}",
                    "to {C:attention}1{} selected",
                    "card in your hand",
                }
            },
            c_sealsplus_phantom = {
                name = "Phantom",
                text = {
                    "Add a {C:dark_edition}Spectral Seal{}",
                    "to {C:attention}1{} selected",
                    "card in your hand",
                }
            },
            c_sealsplus_nephrite = {
                name = "Nephrite",
                text = {
                    "Add a {C:dark_edition}Jade Seal{}",
                    "to {C:attention}1{} selected",
                    "card in your hand",
                }
            },
        },
        Other = {
            sealsplus_blank_seal = {
                name = "Blank Seal",
                text = {
                    "After {C:attention}???{} triggers",
                    "gain a {C:spectral}$O?L#%{}",
                    "{C:inactive}(Currently {C:attention}#1#{} triggers)",
                },
            },
            sealsplus_jade_seal = {
                name = "Jade Seal",
                text = {
                    "{C:green}#1# in 3{} chance to Give a {C:dark_edition}Negative{} random {C:planet}Planet{}",
                    "or {C:tarot}Tarot{} when this",
                    "card is played and scores",
                },
            },
            sealsplus_spectral_seal = {
                name = "Spectral Seal",
                text = {
                    "{C:green}#1# in 3{} chance to Give a random {C:spectral}Spectral{} when this",
                    "card is played and scores",
                    "{C:green}#1# in 6{} to destroy card",
                },
                
            },
            sealsplus_doublered_seal = {
                name = "Double Red Seal",
                text = {
                    "Retrigger this",
                    "card {C:attention}2{} times",
                },
                
            },
            sealsplus_doubleblue_seal = {
                name = "Double Blue Seal",
                text = {
                    "Creates a {C:dark_edition}Negative{} {C:planet}Planet{} card",
                    "of the final played {C:attention}poker hand{}",
                    "of round if {C:attention}held{} in hand",
                },
                
            },
            sealsplus_doublegold_seal = {
                name = "Double Gold Seal",
                text = {
                    "Earn {C:money}$7{} when this",
                    "card is played and scores",
                },
                
            },
            sealsplus_doublepurple_seal = {
                name = "Double Purple Seal",
                text = {
                    "Creates a {C:dark_edition}Negative{} {C:tarot}Tarot{} card",
                    "when {C:attention}discarded{}",
                },
                
            },
            sealsplus_doublejade_seal = {
                name = "Double Jade Seal",
                text = {
                    "Creates a {C:dark_edition}Negative{} copy", 
                    "of the last used",
                    "{C:tarot}Tarot{} or {C:planet}Planet{} card when this",
                    "card is played and scores",
                },
                
            },
            sealsplus_doublespectral_seal = {
                name = "Double Spectral Seal",
                text = {
                    "{C:green}#1# in 3{} chance to Give a {C:spectral}Cryptid{} when this", 
                    "card is played and scores",
                    "{C:green}#1# in 6{} to destroy card",
                },
                
            },
            sealsplus_redgold_seal = {
                name = "Red Gold Seal",
                text = {
                    "Retrigger this",
                    "card {C:attention}1{} times",
                    "Earn {C:money}$2{} when this",
                    "card is played and scores",
                },
                
            },
            sealsplus_redblue_seal = {
                name = "Red Blue Seal",
                text = {
                    "Creates {C:attention}2{} {C:planet}Planet{} cards",
                    "of the final played {C:attention}poker hand{}",
                    "of round if {C:attention}held{} in hand",
                    "{C:inactive}(Must have room)",
                },
                
            },
            sealsplus_redpurple_seal = {
                name = "Red Purple Seal",
                text = {
                    "Creates {C:attention}2{} {C:tarot}Tarot{} cards",
                    "when {C:attention}discarded{}",
                    "{C:inactive}(Must have room)",
                },
                
            },
            sealsplus_redjade_seal = {
                name = "Red Jade Seal",
                text = {
                    "Gives a {C:dark_edition}Negative{} random {C:planet}Planet{}",
                    "or {C:tarot}Tarot{} when this",
                    "card is played and scores",
                },
                
            },
            sealsplus_redspectral_seal = {
                name = "Red Spectral Seal",
                text = {
                    "Gives a random {C:spectral}Spectral{} when this",
                    "card is played and scores",
                    "{C:green}#1# in 6{} to destroy card",
                },
                
            },
            sealsplus_goldblue_seal = {
                name = "Gold Blue Seal",
                text = {
                    "Creates the {C:planet}Planet{} card",
                    "of the final played {C:attention}poker hand{}",
                    "of round if {C:attention}held{} in hand",
                    "and earn {C:money}$2{}",
                    "{C:inactive}(Must have room)",
                },
                
            },
            sealsplus_goldpurple_seal = {
                name = "Gold Purple Seal",
                text = {
                    "Creates a {C:tarot}Tarot{} card",
                    "when {C:attention}discarded",
                    "and earn {C:money}$2{}",
                    "{C:inactive}(Must have room)",
                },
                
            },
            sealsplus_goldjade_seal = {
                name = "Gold Jade Seal",
                text = {
                    "{C:green}#1# in 3{} chance to Give a {C:dark_edition}Negative{} {C:tarot}Hermit{} or {C:tarot}Temperance{}",
                    "when this card is played and scores",
                },
                
            },
            sealsplus_goldspectral_seal = {
                name = "Gold Spectral Seal",
                text = {
                    "{C:green}#1# in 3{} chance to Give an {C:spectral}Immolate{} when this",
                    "card is played and scores",
                    "{C:green}#1# in 6{} to destroy card",
                },
                
            },
            sealsplus_bluepurple_seal = {
                name = "Blue Purple Seal",
                text = {
                    "Creates the {C:planet}Planet{} card",
                    "of the final played {C:attention}poker hand{}",
                    "when {C:attention}discarded{} and",
                    "Creates a {C:tarot}Tarot{} card at the end",
                    "of round if {C:attention}held{} in hand",
                    "{C:inactive}(Must have room)",
                },
                
            },
            sealsplus_bluejade_seal = {
                name = "Blue Jade Seal",
                text = {
                    "{C:green}#1# in 3{} chance to Give a {C:dark_edition}Negative{} {C:tarot}High Priestess{}",
                    "when this card is played and scores",
                },
                
            },
            sealsplus_bluespectral_seal = {
                name = "Blue Spectral Seal",
                text = {
                    "{C:green}#1# in 3{} chance to Give an {C:spectral}Black Hole{} when this",
                    "card is played and scores",
                    "{C:green}#1# in 6{} to destroy card",
                },
                
            },
            sealsplus_purplejade_seal = {
                name = "Purple Jade Seal",
                text = {
                    "{C:green}#1# in 3{} chance to Give a {C:dark_edition}Negative{} {C:tarot}Emperor{}",
                    "when this card is played and scores",
                },
                
            },
            sealsplus_purplespectral_seal = {
                name = "Purple Spectral Seal",
                text = {
                    "{C:green}#1# in 3{} chance to Give an {C:spectral}Aura{} when this",
                    "card is played and scores",
                    "{C:green}#1# in 6{} to destroy card",
                },
                
            },
            sealsplus_jadespectral_seal = {
                name = "Jade Spectral Seal",
                text = {
                    "{C:green}#1# in 3{} chance to Give an {C:spectral}Wraith{} when this",
                    "card is played and scores",
                    "{C:green}#1# in 6{} to destroy card",
                },

            },
            p_sealsplus_normal1_pack={
                name="Normal seals Pack",
                text={
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:spectral} Seal{} cards to",
                    "be used immediately",
                },
            },
            p_sealsplus_normal2_pack={
                name="Normal seals Pack",
                text={
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:spectral} Seal{} cards to",
                    "be used immediately",
                },
            },
            p_sealsplus_jumbo_pack={
                name="Jumbo seals Pack",
                text={
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:spectral} Seal{} cards to",
                    "be used immediately",
                },
            },
            p_sealsplus_mega_pack={
                name="Mega seals Pack",
                text={
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:spectral} Seal{} cards to",
                    "be used immediately",
                },
            },
        },   
        misc = {
            dictionary = {
                k_sealsplus_booster_group = "seals Pack",
            },
            labels = {
                sealsplus_blank_seal = "Blank Seal",
                sealsplus_jade_seal = "Jade Seal",
                sealsplus_spectral_seal = "Spectral Seal",
                sealsplus_doublered_seal = "Double Red Seal",
                sealsplus_doubleblue_seal = "Double Blue Seal",
                sealsplus_doublegold_seal = "Double Gold Seal",
                sealsplus_doublepurple_seal = "Double Purple Seal",
                sealsplus_doublejade_seal = "Double Jade Seal",
                sealsplus_doublespectral_seal = "Double Spectral Seal",
                sealsplus_redgold_seal = "Red Gold Seal",
                sealsplus_redblue_seal = "Red Blue Seal",
                sealsplus_redpurple_seal = "Red Purple Seal",
                sealsplus_redjade_seal = "Red Jade Seal",
                sealsplus_redspectral_seal = "Red Spectral Seal",
                sealsplus_goldblue_seal = "Gold Blue Seal",
                sealsplus_goldpurple_seal = "Gold Purple Seal",
                sealsplus_goldjade_seal = "Gold Jade Seal",
                sealsplus_goldspectral_seal = "Gold Spectral Seal",
                sealsplus_bluepurple_seal = "Blue Purple Seal",
                sealsplus_bluejade_seal = "Blue Jade Seal",
                sealsplus_bluespectral_seal = "Blue Spectral Seal",
                sealsplus_purplejade_seal = "Purple Jade Seal",
                sealsplus_purplespectral_seal = "Purple Spectral Seal",
                sealsplus_jadespectral_seal = "Jade Spectral Seal",
                c_sealsplus_null = "Null",
                c_sealsplus_phantom = "Phantom",
                c_sealsplus_nephrite = "Nephrite",

            },
        }
    },
}

