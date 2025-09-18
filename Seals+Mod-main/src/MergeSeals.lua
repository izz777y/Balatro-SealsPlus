
local oldsetseal = Card.set_seal
function Card:set_seal(_seal, silent, immediate)
    if self.seal == "Red" and _seal == "Red" then 
        _seal = "sealsplus_DoubleRed"
    elseif self.seal == "Red" and _seal == "Blue" then 
        _seal = "sealsplus_RedBlue"
    elseif self.seal == "Red" and _seal == "Gold" then 
        _seal = "sealsplus_RedGold"
    elseif self.seal == "Red" and _seal == "Purple" then 
        _seal = "sealsplus_RedPurple"
    elseif self.seal == "Red" and _seal == "sealsplus_Jade" then 
        _seal = "sealsplus_RedJade"
    elseif self.seal == "Red" and _seal == "sealsplus_Spectral" then 
        _seal = "sealsplus_RedSpectral"
    elseif self.seal == "Gold" and _seal == "Red" then 
        _seal = "sealsplus_RedGold"
    elseif self.seal == "Gold" and _seal == "Blue" then 
        _seal = "sealsplus_GoldBlue"
    elseif self.seal == "Gold" and _seal == "Gold" then 
        _seal = "sealsplus_DoubleGold"
    elseif self.seal == "Gold" and _seal == "Purple" then 
        _seal = "sealsplus_GoldPurple"
    elseif self.seal == "Gold" and _seal == "sealsplus_Jade" then 
        _seal = "sealsplus_GoldJade"
    elseif self.seal == "Gold" and _seal == "sealsplus_Spectral" then 
        _seal = "sealsplus_GoldSpectral"
    elseif self.seal == "Blue" and _seal == "Red" then 
        _seal = "sealsplus_RedBlue"
    elseif self.seal == "Blue" and _seal == "Blue" then 
        _seal = "sealsplus_DoubleBlue"
    elseif self.seal == "Blue" and _seal == "Gold" then 
        _seal = "sealsplus_GoldBlue"
    elseif self.seal == "Blue" and _seal == "Purple" then 
        _seal = "sealsplus_BluePurple"
    elseif self.seal == "Blue" and _seal == "sealsplus_Jade" then 
        _seal = "sealsplus_BlueJade"
    elseif self.seal == "Blue" and _seal == "sealsplus_Spectral" then 
        _seal = "sealsplus_BlueSpectral"
    elseif self.seal == "Purple" and _seal == "Red" then 
        _seal = "sealsplus_RedPurple"
    elseif self.seal == "Purple" and _seal == "Blue" then 
        _seal = "sealsplus_BluePurple"
    elseif self.seal == "Purple" and _seal == "Gold" then 
        _seal = "sealsplus_GoldPurple"
    elseif self.seal == "Purple" and _seal == "Purple" then 
        _seal = "sealsplus_DoublePurple"
    elseif self.seal == "Purple" and _seal == "sealsplus_Jade" then 
        _seal = "sealsplus_PurpleJade"
    elseif self.seal == "Purple" and _seal == "sealsplus_Spectral" then 
        _seal = "sealsplus_PurpleSpectral"
    elseif self.seal == "sealsplus_Jade" and _seal == "Red" then 
        _seal = "sealsplus_RedJade"
    elseif self.seal == "sealsplus_Jade" and _seal == "Blue" then 
        _seal = "sealsplus_BlueJade"
    elseif self.seal == "sealsplus_Jade" and _seal == "Gold" then 
        _seal = "sealsplus_GoldJade"
    elseif self.seal == "sealsplus_Jade" and _seal == "Purple" then 
        _seal = "sealsplus_PurpleJade"
    elseif self.seal == "sealsplus_Jade" and _seal == "sealsplus_Jade" then 
        _seal = "sealsplus_DoubleJade"
    elseif self.seal == "sealsplus_Jade" and _seal == "sealsplus_Spectral" then 
        _seal = "sealsplus_JadeSpectral"
    elseif self.seal == "sealsplus_Spectral" and _seal == "Red" then 
        _seal = "sealsplus_RedSpectral"
    elseif self.seal == "sealsplus_Spectral" and _seal == "Blue" then 
        _seal = "sealsplus_BlueSpectral"
    elseif self.seal == "sealsplus_Spectral" and _seal == "Gold" then 
        _seal = "sealsplus_GoldSpectral"
    elseif self.seal == "sealsplus_Spectral" and _seal == "Purple" then 
        _seal = "sealsplus_PurpleSpectral"
    elseif self.seal == "sealsplus_Spectral" and _seal == "sealsplus_Jade" then 
        _seal = "sealsplus_JadeSpectral"
    elseif self.seal == "sealsplus_Spectral" and _seal == "sealsplus_Spectral" then 
        _seal = "sealsplus_DoubleSpectral"
    end
    return oldsetseal(self, _seal, silent, immediate)
end