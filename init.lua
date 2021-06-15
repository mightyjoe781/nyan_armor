
local disable_sounds = minetest.settings:get_bool("shields_disable_sounds")

local function play_sound_effect(player, name)
	if not disable_sounds and player then
		local pos = player:get_pos()
		if pos then
			minetest.sound_play(name, {
				pos = pos,
				max_hear_distance = 10,
				gain = 0.5,
			})
		end
	end
end

armor:register_armor("nyan_armor:helmet_rainbow", {
	description = "Nyan Helmet",
	inventory_image = "nyan_armor_inv_helmet_rainbow.png",
	groups = {armor_head=1, armor_heal=12, physics_gravity=-0.15, physics_speed=0.15, physics_jump=0.15, armor_use=150},
	armor_groups = {fleshy=15},
	damage_groups = {cracky=2, snappy=1, level=3},
})

armor:register_armor("nyan_armor:chestplate_rainbow", {
	description = "Nyan Chestplate",
	inventory_image = "nyan_armor_inv_chestplate_rainbow.png",
	groups = {armor_torso=1, armor_heal=12, physics_gravity=-0.15, physics_speed=0.15, physics_jump=0.15, armor_use=150},
	armor_groups = {fleshy=20},
	damage_groups = {cracky=2, snappy=1, level=3},
})

armor:register_armor("nyan_armor:leggings_rainbow", {
	description = "Nyan Leggings",
	inventory_image = "nyan_armor_inv_leggings_rainbow.png",
	groups = {armor_legs=1, armor_heal=12, physics_gravity=-0.15, physics_speed=0.15, physics_jump=0.15, armor_use=150},
	armor_groups = {fleshy=20},
	damage_groups = {cracky=2, snappy=1, level=3},
})

armor:register_armor("nyan_armor:boots_rainbow", {
	description = "Nyan Boots",
	inventory_image = "nyan_armor_inv_boots_rainbow.png",
	groups = {armor_feet=1, armor_heal=12, physics_gravity=-0.15, physics_speed=0.15, physics_jump=0.15, armor_use=150},
	armor_groups = {fleshy=15},
	damage_groups = {cracky=2, snappy=1, level=3},
})

armor:register_armor("nyan_armor:shield_rainbow", {
	description = "Nyan Shield",
	inventory_image = "nyan_armor_inv_shield_rainbow.png",
	groups = {armor_shield=1, armor_heal=12, physics_gravity=-0.15, physics_speed=0.15, physics_jump=0.15, armor_use=100},
	armor_groups = {fleshy=15},
	damage_groups = {cracky=2, snappy=1, level=3},
	reciprocate_damage = true,
	on_damage = function(player, index, stack)
		play_sound_effect(player, "default_glass_footstep")
	end,
	on_destroy = function(player, index, stack)
		play_sound_effect(player, "default_break_glass")
	end,
})
local material_table = {
	rainbow = "nyancat:nyancat_rainbow",
}
for k, v in pairs(material_table) do
	minetest.register_craft({
		output = "nyan_armor:helmet_"..k,
		recipe = {
			{v, v, v},
			{v, "", v},
			{"", "", ""},
		},
	})
	minetest.register_craft({
		output = "nyan_armor:chestplate_"..k,
		recipe = {
			{v, "", v},
			{v, v, v},
			{v, v, v},
		},
	})
	minetest.register_craft({
		output = "nyan_armor:leggings_"..k,
		recipe = {
			{v, v, v},
			{v, "", v},
			{v, "", v},
		},
	})
	minetest.register_craft({
		output = "nyan_armor:boots_"..k,
		recipe = {
			{v, "", v},
			{v, "", v},
		},
	})
	minetest.register_craft({
	output = "nyan_armor:shield_"..k,
	recipe = {
		{v, v, v},
		{v, "nyancat:nyancat", v},
		{"", v, ""},
	},
	})
end

print("[OK] Nyan armor")
