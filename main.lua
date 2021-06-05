local alwaysOpenedSecretrooms = RegisterMod("Always Opened Secret Rooms", 1);

local isNewGameAndNoVision = false

function alwaysOpenedSecretrooms:onPostNewLevel()
	local player = Isaac.GetPlayer(0);
	if (Game():GetLevel():GetStage() == 1) then
		if (player:GetPlayerType() == PlayerType.PLAYER_LILITH) then
			isNewGameAndNoVision = true
		end
	end
end

function alwaysOpenedSecretrooms:onPostPlayerInit()
	local player = Isaac.GetPlayer(0);
	if (player:GetPlayerType() ~= PlayerType.PLAYER_LILITH) then
		isNewGameAndNoVision = true
	end
end

function alwaysOpenedSecretrooms:onPostPlayerRender()
	local player = Isaac.GetPlayer(0);
	if (isNewGameAndNoVision and not player:HasCollectible(CollectibleType.COLLECTIBLE_XRAY_VISION, true)) then
		player:AddCollectible(CollectibleType.COLLECTIBLE_XRAY_VISION, 0, false);
		isNewGameAndNoVision = false
	end
end

alwaysOpenedSecretrooms:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, alwaysOpenedSecretrooms.onPostNewLevel);
alwaysOpenedSecretrooms:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, alwaysOpenedSecretrooms.onPostPlayerInit);
alwaysOpenedSecretrooms:AddCallback(ModCallbacks.MC_POST_PLAYER_RENDER, alwaysOpenedSecretrooms.onPostPlayerRender);