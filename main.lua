local alwaysOpenedSecretrooms = RegisterMod("Always Opened Secret Rooms", 1);

function alwaysOpenedSecretrooms:onPostPlayerRender()
	local player = Isaac.GetPlayer(0);
	if (not player:HasCollectible(CollectibleType.COLLECTIBLE_XRAY_VISION, true)) then
		player:AddCollectible(CollectibleType.COLLECTIBLE_XRAY_VISION, 0, false);
	end
end

alwaysOpenedSecretrooms:AddCallback(ModCallbacks.MC_POST_PLAYER_RENDER, alwaysOpenedSecretrooms.onPostPlayerRender);