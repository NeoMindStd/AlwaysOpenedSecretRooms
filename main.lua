local alwaysOpenedSecretrooms = RegisterMod("Always Opened Secret Rooms", 1);

local isVisionAdded = true

function alwaysOpenedSecretrooms:onPostNewLevel()
	local player = Isaac.GetPlayer(0);
	if (Game():GetLevel():GetStage() == 1) then
		if (player:GetPlayerType() == PlayerType.PLAYER_LILITH) then
			isVisionAdded = false
		end
	end
end

function alwaysOpenedSecretrooms:onPostPlayerInit()
	local player = Isaac.GetPlayer(0);
	if (player:GetPlayerType() ~= PlayerType.PLAYER_LILITH) then
		isVisionAdded = false
	end
end

function alwaysOpenedSecretrooms:onPostPlayerRender()
	local player = Isaac.GetPlayer(0);
	if (not isVisionAdded) then
		isVisionAdded = true
		player:AddCollectible(CollectibleType.COLLECTIBLE_XRAY_VISION, 0, false);
	end
end

alwaysOpenedSecretrooms:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, alwaysOpenedSecretrooms.onPostPlayerInit);
alwaysOpenedSecretrooms:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, alwaysOpenedSecretrooms.onPostNewLevel);
alwaysOpenedSecretrooms:AddCallback(ModCallbacks.MC_POST_PLAYER_RENDER, alwaysOpenedSecretrooms.onPostPlayerRender);