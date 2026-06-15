-- Check settings for fuckery

if cannon_destroy_probability > 5 then
	cannon_destroy_probability = 5
elseif cannon_destroy_probability < 1 then
	cannon_destroy_probability = 1
end

if cannon_destroy_radius > 10 then
	cannon_destroy_radius = 10
elseif cannon_destroy_radius < 1 then
	cannon_destroy_radius = 1
end

if cannon_shoot_distance > 100 then
	cannon_shoot_distance = 100
elseif cannon_shoot_distance < 10 then
	cannon_shoot_distance = 10
end

local sd = cannon_shoot_distance
local cannon_gravity_effect = 0
local cannon_punch_count = 0
local crater_hole = cannon_destroy_radius


-- functions
local t = {} -- TODO: insert into recursive 'crater' function

local function crater(crater_hole, fd, pp)
--
local cw3 = 0

while (cw3 <= crater_hole) do

if fd == 1 or fd == 3 then
	pp.x = pp.x + 1
elseif fd == 0 or fd == 2 then
	pp.z = pp.z + 1
end

	local f = {x=pp.x, y=pp.y, z=pp.z}
	local u = {x=pp.x, y=pp.y, z=pp.z}
	local c = {x=pp.x, y=pp.y, z=pp.z}
	local k = {x=pp.x, y=pp.y, z=pp.z}

--
	local cw2 = 0				--
		while (cw2 <= crater_hole) do
			local cw = cw2
				while (cw <= crater_hole) do
					if fd == 1 or fd == 3 then
						f.z = (pp.z + cw2)  - cw
						u.z = (pp.z - cw2)  + cw
						c.z = (pp.z + cw2)  - cw
						k.z = (pp.z - cw2)  + cw
					elseif fd == 0 or fd == 2 then
						f.x = (pp.x + cw2)  - cw
						u.x = (pp.x - cw2)  + cw
						c.x = (pp.x + cw2)  - cw
						k.x = (pp.x - cw2)  + cw
					end

					table.insert(t, minetest.serialize(f))
					table.insert(t, minetest.serialize(u))
					table.insert(t, minetest.serialize(c))
					table.insert(t, minetest.serialize(k))

					cw = cw + 1
				end
						f.y = pp.y + cw2
						u.y = pp.y + cw2
						c.y = pp.y - cw2
						k.y = pp.y - cw2
					cw2 = cw2 + 1
		end
	--
	cw3 = cw3 + 1
	end
--

	for m,e in ipairs(t) do
		local current_node = minetest.deserialize(e)

--
		local current_node_get = minetest.get_node(current_node)
		local t_snappy = minetest.get_item_group(current_node_get.name, "snappy")
		local t_oddly_breakable_by_hand = minetest.get_item_group(current_node_get.name, "oddly_breakable_by_hand")
		local t_crumbly = minetest.get_item_group(current_node_get.name, "crumbly")
		local t_cracky = minetest.get_item_group(current_node_get.name, "cracky")
		local t_choppy = minetest.get_item_group(current_node_get.name, "choppy")

		local dam = (math.random(30) + (cannon_destroy_probability * 10))

	if t_snappy >= 1 or t_oddly_breakable_by_hand >= 1 then
	dam = 100 --always breaks
	end

	if t_crumbly >= 1 then
	dam = (dam * t_crumbly)
	end

	if t_cracky >= 1 then
	dam = (dam * t_cracky)
	end

	if t_choppy >= 1 then
	dam = (dam * t_choppy)
	end

	if dam <= 80 then
		-- do nothing for now
	elseif dam > 80 and dam < 90 then
		if not minetest.is_protected(current_node, "") then
			if current_node_get.name == nil or current_node_get.name == "ignore" then
				-- do nothing for now
			elseif current_node_get.name ~= "air" and current_node_get.name ~= "default:water" and current_node_get.name ~= "default:lava" then
				local itemstacks = minetest.get_node_drops(current_node_get.name)
					for _, itemname in ipairs(itemstacks) do
					minetest.add_item(current_node, itemname)
				end
				minetest.remove_node(current_node)
			end
		end

	elseif dam >= 90 then
			if not minetest.is_protected(current_node, "") or current_node_get.name ~= "blacksails:cannon_bottom" or current_node_get.name ~= "blacksails:cannon_top" then
		minetest.remove_node(current_node)
			end
	end
		t = {}
	end

--
end

local function effects(fd2)

			minetest.sound_play("tnt_explode", {
			max_hear_distance = 100,
			gain = 10.0,
			})
			minetest.add_particlespawner({
			amount = 128,
			time = 1,
			minpos = fd2,
			maxpos = fd2,
			minacc = vector.new(),
			maxacc = vector.new(),
			minexptime = 0.5,
			maxexptime = 1,
			minsize = 8,
			maxsize = 16,
			texture = "tnt_smoke.png",
			})

			minetest.after(1, function()
			local posmax = {x=fd2.x+5, y=fd2.y+5, z=fd2.z+5}
			minetest.add_particlespawner({
			amount = 128,
			time = 1,
			minpos = fd2,
			maxpos = posmax,
			minacc = vector.new(),
			maxacc = vector.new(),
			minexptime = 0.5,
			maxexptime = 1,
			minsize = 8,
			maxsize = 16,
			texture = "tnt_smoke.png",
			})
			end)

end

local function damage(i, fd, fd2, sd, pp, cannon_gravity_effect, cannon_punch_count, cannon_max_punch_count)

				if fd == 0 then
					fd2.z = fd2.z+2
				elseif fd == 1 then
					fd2.x = fd2.x+2
				elseif fd == 2 then
					fd2.z = fd2.z-2
				elseif fd == 3 then
					fd2.x = fd2.x-2
				end

		minetest.after(0.1, function()
			minetest.set_node(fd2, {name="fire:basic_flame"})
			while (i <= sd) do
				if fd == 0 then
					pp.z = pp.z+1
				elseif fd == 1 then
					pp.x = pp.x+1
				elseif fd == 2 then
					pp.z = pp.z-1
				elseif fd == 3 then
					pp.x = pp.x-1
				end

				-- gravity effect --
			if (cannon_gravity_effect >= (cannon_shoot_distance / 3)) then
				pp.y = pp.y - 1
				cannon_gravity_effect = 0
			end

	if (i > 1) then

		local pp_name = minetest.get_node(pp).name
		if not minetest.is_protected(pp_name, "") then

			if pp_name == "ignore" or pp_name == "air" or pp_name == "default:water" or pp_name == "default:lava" then
					-- Do nothing for now
			else
				minetest.remove_node(pp)
				cannon_punch_count = cannon_punch_count + 1
				if cannon_punch_count >= cannon_max_punch_count then
					break
				end
			end
		end
	end
	cannon_gravity_effect = cannon_gravity_effect + 1
	i = i + 1
			end


	if i >= sd or cannon_punch_count >= cannon_max_punch_count then
		i = 0
		cannon_punch_count = 0
		crater(crater_hole, fd, pp)
	end
		end)

		--reset
		minetest.after(0.2, function()
			minetest.set_node(fd2, {name="air"})
		end)

end

--- Weaponized cannon: loading, unloading, firing ---

minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)

local meta = minetest.get_meta(pos)
local fd = node.param2
local fd2 = {x=pos.x, y=pos.y, z=pos.z}

local i = 0
local pp = {x=pos.x, y=pos.y, z=pos.z}

local player = puncher:get_player_name()

-- Loading the cannon --
if puncher:get_wielded_item():get_name() == "tnt:gunpowder" and node.name == "blacksails:cannon_bottom" then
		if cannon_weaponized == true then
			if meta:get_int("powder") ~= 1 then
			puncher:get_inventory():remove_item("main", "tnt:gunpowder 1")
			meta:set_int("powder", 1)

			minetest.chat_send_player(player, "Powder loaded into cannon.")
			else
			minetest.chat_send_player(player, "Powder already loaded into cannon.")
			end
		else
			minetest.chat_send_player(player, "Cannons don't work. The server-owner turned them off.")
		end
end

if puncher:get_wielded_item():get_name() == "blacksails:cannonball_single" and node.name == "blacksails:cannon_bottom" then
		if cannon_weaponized == true and cannon_does_damage == true then
			if meta:get_int("projectile") ~= 1 then
			puncher:get_inventory():remove_item("main", "blacksails:cannonball_single 1")
			meta:set_int("projectile", 1)

			minetest.chat_send_player(player, "Cannonball loaded into cannon.")
			else
			minetest.chat_send_player(player, "Cannonball already loaded into cannon.")
			end
		elseif cannon_weaponized == true and cannon_does_damage == false then
			minetest.chat_send_player(player, "Cannons don't do damage, no use loading a cannonball.")
		else
			minetest.chat_send_player(player, "Cannons don't work. The server-owner turned them off.")
		end
end

-- unloading the cannon --

local pos2 = {x=pos.x, y=pos.y+1, z=pos.z}

if puncher:get_wielded_item():get_name() == "default:stick" and node.name == "blacksails:cannon_bottom" then
	if meta:get_int("projectile") == 1 then
		minetest.add_item(pos2, "blacksails:cannonball_single")
		meta:set_int("projectile", 0)
			if meta:get_int("powder") == 0 then
			minetest.chat_send_player(player, "Cannon has been rendered safe.")
			end
	end
	if meta:get_int("powder") == 1 then
		minetest.add_item(pos2, "tnt:gunpowder")
		meta:set_int("powder", 0)
			if meta:get_int("projectile") == 0 then
			minetest.chat_send_player(player, "Cannon has been rendered safe.")
			end
	end
	if meta:get_int("powder") == 0 and meta:get_int("projectile") == 0 then
		minetest.chat_send_player(player, "Cannon empty.")
	end
end

-- shooting the cannon --
	if puncher:get_wielded_item():get_name() == "default:torch" and node.name == "blacksails:cannon_bottom" then

		if cannon_weaponized == false then 		-- Aw, poor player, cannon no boom... Give them something...
			minetest.chat_send_player(player, "Kaboooom.")
		elseif cannon_weaponized == true and cannon_does_damage == false then -- Fireworks
			if meta:get_int("powder") == 0 then
				minetest.chat_send_player(player, "You need to load powder (Punch cannon with tnt:gunpowder).")
			else
				effects(fd2)
					meta:set_int("powder", 0)
			end
		elseif cannon_weaponized == true and cannon_does_damage == true then -- Fireworks & damage
			if meta:get_int("powder") == 0 then
				minetest.chat_send_player(player, "You need to load powder (Punch cannon with tnt:gunpowder).")
			end
			if meta:get_int("powder") == 0 and meta:get_int("projectile") == 0 then
				minetest.chat_send_player(player, "Punch cannon with powder and cannonball to load.")
			elseif meta:get_int("powder") == 1 and meta:get_int("projectile") == 0 then
				minetest.chat_send_player(player, "If you don't load a cannonball, you do no damage. (Punch cannon with blacksails:cannonball).")
				effects(fd2)
					meta:set_int("powder", 0)
			elseif meta:get_int("powder") == 1 and meta:get_int("projectile") == 1 then
				effects(fd2)
				damage(i, fd, fd2, sd, pp, cannon_gravity_effect, cannon_punch_count, cannon_max_punch_count)
					meta:set_int("powder", 0)
					meta:set_int("projectile", 0)
			end
		end
	end
end)

--- Cannon ---

minetest.register_node("blacksails:cannon_top", {
		drawtype = "nodebox",
		drop = "",
		tiles = {
		"gun-2-barrel-overlay.png",
		"gun-2-barrel-overlay.png^[transformR180",
		"gun-2-barrel-overlay.png^[transformR270",
		"gun-2-barrel-overlay.png^[transformFXR90",
		"gun-2-front-node2.png",
		"gun-2-top-node2.png"
		},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {},
		sounds = default.node_sound_wood_defaults(),
		on_rotate = screwdriver.disallow,
		node_box = {
			type = "fixed",
			fixed = {
			{-0.25, -0.25, -0.5, 0.25, 0.25, -0.0625}, -- NodeBox1
			{-0.25, -0.1875, -0.0625, 0.25, 0.1875, 0.25}, -- NodeBox2
			{-0.1875, -0.125, 0.25, 0.1875, 0.125, 0.5}, -- NodeBox3
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},

		on_dig = function(pos, node, player)
			minetest.remove_node(pos)
			local pt = pos
			local pt2 = {x=pt.x, y=pt.y, z=pt.z}
			pt2.z = pt2.z-1
			minetest.node_dig(pt2, node, player)
		end,

	})

minetest.register_node("blacksails:cannon_bottom", {
		description = "Blacksails mod Cannon",

		--- Placement: two nodes, one correctly fitting the other (chamber & barrel) ---

		on_place = function(itemstack, placer, pointed_thing)

		--- Variables, coordinates, positioning, facing(xyz) ---
		local 	p2 = minetest.dir_to_facedir(placer:get_look_dir())
		local 	pt = pointed_thing.above
		local 	pt2 = {x=pt.x, y=pt.y, z=pt.z}

			if p2 == 0 then
				pt2.z = pt2.z+1
			elseif p2 == 1 then
				pt2.x = pt2.x+1
			elseif p2 == 2 then
				pt2.z = pt2.z-1
			elseif p2 == 3 then
				pt2.x = pt2.x-1
			end

			--- Trapping placement no-can-do's ---

			if pointed_thing.type ~= "node" then
				return itemstack
			end

			if
				not minetest.registered_nodes[minetest.get_node(pt).name].buildable_to or
				not minetest.registered_nodes[minetest.get_node(pt2).name].buildable_to or
				not placer or
				not placer:is_player()
			then
				return itemstack
			end

			if minetest.is_protected(pt, placer:get_player_name()) or
				minetest.is_protected(pt2, placer:get_player_name()) then
				minetest.record_protection_violation(pt, placer:get_player_name())
				return itemstack
			end


				--- Placing the nodes ---
				minetest.set_node(pt, {name="blacksails:cannon_bottom", param2=p2})
				minetest.set_node(pt2, {name="blacksails:cannon_top", param2=p2})
					local meta = minetest.get_meta(pt)
					meta:set_string("WhereIsMyBarrel", minetest.serialize(pt2))
					meta:set_int("projectile", 0)
					meta:set_int("powder", 0)
			--- In this world, you get nothing for free (unless in creative) ---
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		end,
		--- removing the cannon ---

		on_dig = function(pos, node, player, pointed_thing)

				local meta = minetest.get_meta(pos)
				local HereIsMyBarrel = minetest.deserialize(meta:get_string("WhereIsMyBarrel"))

				minetest.node_dig(pos, node, player)
				minetest.remove_node(HereIsMyBarrel)
		end,

		on_destruct = function(pos)
				local meta = minetest.get_meta(pos)
				local HereIsMyBarrel = minetest.deserialize(meta:get_string("WhereIsMyBarrel"))

				minetest.remove_node(HereIsMyBarrel)
		end,

		---
		on_rotate = screwdriver.disallow,
		wield_image = "cannon_inventory.png",
		inventory_image = "cannon_inventory.png",
		drawtype = "nodebox",

		tiles = {
		"gun-2-top-node1.png",
		"gun-2-bottom-node1.png",
		"gun-2-side-node1.png",
		"gun-2-side-node1.png^[transformFX",
		"gun-2-front-node1.png",
		"gun-2-back-node1.png"
	    },
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		stack_max = 1,
		groups = {cracky=3,level=3},
		sounds = default.node_sound_wood_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
			{-0.25, -0.375, -0.3125, 0.25, 0.25, 0.5}, -- NodeBox1
			{-0.125, -0.0625, -0.5, 0.125, 0.125, -0.3125}, -- NodeBox2
			{-0.375, -0.5, -0.5, -0.25, -0.0625, 0.5}, -- NodeBox3
			{0.25, -0.5, -0.5, 0.375, -0.0625, 0.5}, -- NodeBox4
			{0.25, -0.5, -0.0625, 0.375, 0.3125, 0.5}, -- NodeBox5
			{-0.375, -0.0625, -0.0625, -0.25, 0.3125, 0.5}, -- NodeBox6
			{-0.5, -0.5, -0.1875, -0.3125, -0.125, 0.1875}, -- NodeBox7
			{0.375, -0.5, -0.1875, 0.5, -0.125, 0.1875}, -- NodeBox8
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	})

--- Cannon, cannonball ---

minetest.register_tool("blacksails:cannonball_single", {
    description = "Blacksails: single cannonball",
    inventory_image = "cannonball_single.png",
    tool_capabilities = {
        max_drop_level=3,
        groupcaps= {
            cracky={times={[1]=4.00, [2]=1.50, [3]=1.00}, uses=10, maxlevel=1}
        }
    }
})

--- Cannon casting mold ---

minetest.register_craftitem("blacksails:cannon_mold", {
	description = "A casting mold for a cannon",
	inventory_image = "casting_mold.png"
})
minetest.register_craft({
	output = 'blacksails:cannon_mold 1',
	recipe = {
		{'default:clay', 'group:wood', 'default:clay'},
		{'default:clay', 'group:wood', 'default:clay'},
		{'default:clay', 'default:clay', 'default:clay'},
	}
})

--- The cannon ---

	minetest.register_craft({
	output = 'blacksails:cannon_bottom',
	recipe = {
		{'blacksails:cannon_mold', 'default:bronzeblock', 'blacksails:cannon_mold'},
		{'blacksails:cannon_mold', 'default:bronzeblock', 'blacksails:cannon_mold'},
		{'default:coalblock', 'default:coalblock', 'default:coalblock'},
	}
})

--- The cannonball ---

	minetest.register_craft({
	output = 'blacksails:cannonball_single',
	recipe = {
		{'', 'default:bronze_ingot', ''},
		{'default:bronze_ingot', 'default:bronze_ingot', 'default:bronze_ingot'},
		{'', 'default:bronze_ingot', ''},
	}
})

