---- Hatch, apple ----



function blacksails.register_hatch_apple(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	def.on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple

	-- Cannon hatches
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.tile_front = "moretrees_apple_tree_wood.png"
	def.tile_side = "gun_hatch_apple_wood.png"
	def.tile_top = "gun_hatch_top_apple_wood.png"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.tiles = { def.tile_top, def.tile_front, def.tile_front, def.tile_front, def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_front, def.tile_front, def.tile_top, def.tile_front }
	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end



blacksails.register_hatch_apple("blacksails:cannonhatch_apple_wood", {
	description = "Cannon hatch Apple Wood",
	inventory_image = "gun_hatch_apple_wood.png",
	wield_image = "gun_hatch_apple_wood.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'blacksails:cannonhatch_apple_wood 4',
	recipe = {
		{'moretrees:apple_tree_planks', 'moretrees:apple_tree_planks', 'moretrees:apple_tree_planks'},
		{'moretrees:apple_tree_planks', 'moretrees:apple_tree_planks', 'moretrees:apple_tree_planks'},
		{'', 'default:iron_lump', ''},
	}
})

---- Hatch, beech ----



function blacksails.register_hatch_beech(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	def.on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple

	-- Cannon hatches
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.tile_front = "moretrees_beech_wood.png"
	def.tile_side = "gun_hatch_beech_wood.png"
	def.tile_top = "gun_hatch_top_beech_wood.png"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.tiles = { def.tile_top, def.tile_front, def.tile_front, def.tile_front, def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_front, def.tile_front, def.tile_top, def.tile_front }
	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end



blacksails.register_hatch_beech("blacksails:cannonhatch_beech_wood", {
	description = "Cannon hatch beech Wood",
	inventory_image = "gun_hatch_beech_wood.png",
	wield_image = "gun_hatch_beech_wood.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'blacksails:cannonhatch_beech_wood 4',
	recipe = {
		{'moretrees:beech_tree_planks', 'moretrees:beech_tree_planks', 'moretrees:beech_tree_planks'},
		{'moretrees:beech_tree_planks', 'moretrees:beech_tree_planks', 'moretrees:beech_tree_planks'},
		{'', 'default:iron_lump', ''},
	}
})

---- Hatch, birch ----



function blacksails.register_hatch_birch(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	def.on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple

	-- Cannon hatches
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.tile_front = "moretrees_birch_wood.png"
	def.tile_side = "gun_hatch_birch_wood.png"
	def.tile_top = "gun_hatch_top_birch_wood.png"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.tiles = { def.tile_top, def.tile_front, def.tile_front, def.tile_front, def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_front, def.tile_front, def.tile_top, def.tile_front }
	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end



blacksails.register_hatch_birch("blacksails:cannonhatch_birch_wood", {
	description = "Cannon hatch birch Wood",
	inventory_image = "gun_hatch_birch_wood.png",
	wield_image = "gun_hatch_birch_wood.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'blacksails:cannonhatch_birch_wood 4',
	recipe = {
		{'moretrees:birch_tree_planks', 'moretrees:birch_tree_planks', 'moretrees:birch_tree_planks'},
		{'moretrees:birch_tree_planks', 'moretrees:birch_tree_planks', 'moretrees:birch_tree_planks'},
		{'', 'default:iron_lump', ''},
	}
})

---- Hatch, fir ----



function blacksails.register_hatch_fir(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	def.on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple

	-- Cannon hatches
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.tile_front = "moretrees_fir_wood.png"
	def.tile_side = "gun_hatch_fir_wood.png"
	def.tile_top = "gun_hatch_top_fir_wood.png"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.tiles = { def.tile_top, def.tile_front, def.tile_front, def.tile_front, def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_front, def.tile_front, def.tile_top, def.tile_front }
	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end



blacksails.register_hatch_fir("blacksails:cannonhatch_fir_wood", {
	description = "Cannon hatch fir Wood",
	inventory_image = "gun_hatch_fir_wood.png",
	wield_image = "gun_hatch_fir_wood.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'blacksails:cannonhatch_fir_wood 4',
	recipe = {
		{'moretrees:fir_tree_planks', 'moretrees:fir_tree_planks', 'moretrees:fir_tree_planks'},
		{'moretrees:fir_tree_planks', 'moretrees:fir_tree_planks', 'moretrees:fir_tree_planks'},
		{'', 'default:iron_lump', ''},
	}
})

---- Hatch, oak ----



function blacksails.register_hatch_oak(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	def.on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple

	-- Cannon hatches
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.tile_front = "moretrees_oak_wood.png"
	def.tile_side = "gun_hatch_oak_wood.png"
	def.tile_top = "gun_hatch_top_oak_wood.png"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.tiles = { def.tile_top, def.tile_front, def.tile_front, def.tile_front, def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_front, def.tile_front, def.tile_top, def.tile_front }
	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end



blacksails.register_hatch_oak("blacksails:cannonhatch_oak_wood", {
	description = "Cannon hatch oak Wood",
	inventory_image = "gun_hatch_oak_wood.png",
	wield_image = "gun_hatch_oak_wood.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'blacksails:cannonhatch_oak_wood 4',
	recipe = {
		{'moretrees:oak_tree_planks', 'moretrees:oak_tree_planks', 'moretrees:oak_tree_planks'},
		{'moretrees:oak_tree_planks', 'moretrees:oak_tree_planks', 'moretrees:oak_tree_planks'},
		{'', 'default:iron_lump', ''},
	}
})

---- Hatch, palm ----



function blacksails.register_hatch_palm(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	def.on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple

	-- Cannon hatches
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.tile_front = "moretrees_palm_wood.png"
	def.tile_side = "gun_hatch_palm_wood.png"
	def.tile_top = "gun_hatch_top_palm_wood.png"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.tiles = { def.tile_top, def.tile_front, def.tile_front, def.tile_front, def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_front, def.tile_front, def.tile_top, def.tile_front }
	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end



blacksails.register_hatch_palm("blacksails:cannonhatch_palm_wood", {
	description = "Cannon hatch palm Wood",
	inventory_image = "gun_hatch_palm_wood.png",
	wield_image = "gun_hatch_palm_wood.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'blacksails:cannonhatch_palm_wood 4',
	recipe = {
		{'moretrees:palm_tree_planks', 'moretrees:palm_tree_planks', 'moretrees:palm_tree_planks'},
		{'moretrees:palm_tree_planks', 'moretrees:palm_tree_planks', 'moretrees:palm_tree_planks'},
		{'', 'default:iron_lump', ''},
	}
})

---- Hatch, rubber ----



function blacksails.register_hatch_rubber(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	def.on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple

	-- Cannon hatches
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.tile_front = "moretrees_rubber_tree_wood.png"
	def.tile_side = "gun_hatch_rubber_wood.png"
	def.tile_top = "gun_hatch_top_rubber_wood.png"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.tiles = { def.tile_top, def.tile_front, def.tile_front, def.tile_front, def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_front, def.tile_front, def.tile_top, def.tile_front }
	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end



blacksails.register_hatch_rubber("blacksails:cannonhatch_rubber_wood", {
	description = "Cannon hatch rubber Wood",
	inventory_image = "gun_hatch_rubber_wood.png",
	wield_image = "gun_hatch_rubber_wood.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'blacksails:cannonhatch_rubber_wood 4',
	recipe = {
		{'moretrees:rubber_tree_planks', 'moretrees:rubber_tree_planks', 'moretrees:rubber_tree_planks'},
		{'moretrees:rubber_tree_planks', 'moretrees:rubber_tree_planks', 'moretrees:rubber_tree_planks'},
		{'', 'default:iron_lump', ''},
	}
})

---- Hatch, sequoia ----



function blacksails.register_hatch_sequoia(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	def.on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple

	-- Cannon hatches
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.tile_front = "moretrees_sequoia_wood.png"
	def.tile_side = "gun_hatch_sequoia_wood.png"
	def.tile_top = "gun_hatch_top_sequoia_wood.png"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.tiles = { def.tile_top, def.tile_front, def.tile_front, def.tile_front, def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_front, def.tile_front, def.tile_top, def.tile_front }
	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end



blacksails.register_hatch_sequoia("blacksails:cannonhatch_sequoia_wood", {
	description = "Cannon hatch sequoia Wood",
	inventory_image = "gun_hatch_sequoia_wood.png",
	wield_image = "gun_hatch_sequoia_wood.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'blacksails:cannonhatch_sequoia_wood 4',
	recipe = {
		{'moretrees:sequoia_tree_planks', 'moretrees:sequoia_tree_planks', 'moretrees:sequoia_tree_planks'},
		{'moretrees:sequoia_tree_planks', 'moretrees:sequoia_tree_planks', 'moretrees:sequoia_tree_planks'},
		{'', 'default:iron_lump', ''},
	}
})

---- Hatch, spruce ----



function blacksails.register_hatch_spruce(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	def.on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple

	-- Cannon hatches
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.tile_front = "moretrees_spruce_wood.png"
	def.tile_side = "gun_hatch_spruce_wood.png"
	def.tile_top = "gun_hatch_top_spruce_wood.png"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.tiles = { def.tile_top, def.tile_front, def.tile_front, def.tile_front, def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_front, def.tile_front, def.tile_top, def.tile_front }
	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end



blacksails.register_hatch_spruce("blacksails:cannonhatch_spruce_wood", {
	description = "Cannon hatch spruce Wood",
	inventory_image = "gun_hatch_spruce_wood.png",
	wield_image = "gun_hatch_spruce_wood.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'blacksails:cannonhatch_spruce_wood 4',
	recipe = {
		{'moretrees:spruce_tree_planks', 'moretrees:spruce_tree_planks', 'moretrees:spruce_tree_planks'},
		{'moretrees:spruce_tree_planks', 'moretrees:spruce_tree_planks', 'moretrees:spruce_tree_planks'},
		{'', 'default:iron_lump', ''},
	}
})

---- Hatch, willow ----



function blacksails.register_hatch_willow(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	def.on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple

	-- Cannon hatches
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.tile_front = "moretrees_willow_wood.png"
	def.tile_side = "gun_hatch_willow_wood.png"
	def.tile_top = "gun_hatch_top_willow_wood.png"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.tiles = { def.tile_top, def.tile_front, def.tile_front, def.tile_front, def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_front, def.tile_front, def.tile_top, def.tile_front }
	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end



blacksails.register_hatch_willow("blacksails:cannonhatch_willow_wood", {
	description = "Cannon hatch willow Wood",
	inventory_image = "gun_hatch_willow_wood.png",
	wield_image = "gun_hatch_willow_wood.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'blacksails:cannonhatch_willow_wood 4',
	recipe = {
		{'moretrees:willow_tree_planks', 'moretrees:willow_tree_planks', 'moretrees:willow_tree_planks'},
		{'moretrees:willow_tree_planks', 'moretrees:willow_tree_planks', 'moretrees:willow_tree_planks'},
		{'', 'default:iron_lump', ''},
	}
})

---- Hatch, pine ----



function blacksails.register_hatch_pine(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	def.on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple

	-- Cannon hatches
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.tile_front = "default_pine_wood.png"
	def.tile_side = "gun_hatch_pine.png"
	def.tile_top = "gun_hatch_pine_top.png"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.tiles = { def.tile_top, def.tile_front, def.tile_front, def.tile_front, def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_front, def.tile_front, def.tile_top, def.tile_front }
	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end



blacksails.register_hatch_pine("blacksails:cannonhatch_pine_wood", {
	description = "Cannon hatch pine Wood",
	inventory_image = "gun_hatch_pine.png",
	wield_image = "gun_hatch_pine.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'blacksails:cannonhatch_pine_wood 4',
	recipe = {
		{'default:pine_wood', 'default:pine_wood', 'default:pine_wood'},
		{'default:pine_wood', 'default:pine_wood', 'default:pine_wood'},
		{'', 'default:iron_lump', ''},
	}
})

---- Hatch, wood ----



function blacksails.register_hatch_wood(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	def.on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple

	-- Cannon hatches
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.tile_front = "default_wood.png"
	def.tile_side = "gun_hatch_wood.png"
	def.tile_top = "gun_hatch_wood_top.png"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.tiles = { def.tile_top, def.tile_front, def.tile_front, def.tile_front, def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_front, def.tile_front, def.tile_top, def.tile_front }
	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end



blacksails.register_hatch_wood("blacksails:cannonhatch_wood", {
	description = "Cannon hatch Wood",
	inventory_image = "gun_hatch_wood.png",
	wield_image = "gun_hatch_wood.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'blacksails:cannonhatch_wood 4',
	recipe = {
		{'default:wood', 'default:wood', 'default:wood'},
		{'default:wood', 'default:wood', 'default:wood'},
		{'', 'default:iron_lump', ''},
	}
})

---- Hatch, jungle ----



function blacksails.register_hatch_jungle(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	def.on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple

	-- Cannon hatches
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.tile_front = "default_junglewood.png"
	def.tile_side = "gun_hatch_jungle.png"
	def.tile_top = "gun_hatch_jungle_top.png"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.tiles = { def.tile_top, def.tile_front, def.tile_front, def.tile_front, def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_front, def.tile_front, def.tile_top, def.tile_front }
	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end



blacksails.register_hatch_jungle("blacksails:cannonhatch_jungle_wood", {
	description = "Cannon hatch jungle Wood",
	inventory_image = "gun_hatch_jungle.png",
	wield_image = "gun_hatch_jungle.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'blacksails:cannonhatch_jungle_wood 4',
	recipe = {
		{'default:junglewood', 'default:junglewood', 'default:junglewood'},
		{'default:junglewood', 'default:junglewood', 'default:junglewood'},
		{'', 'default:iron_lump', ''},
	}
})

---- Hatch, acacia ----



function blacksails.register_hatch_acacia(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	def.on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple

	-- Cannon hatches
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.tile_front = "default_acacia_wood.png"
	def.tile_side = "gun_hatch_acacia.png"
	def.tile_top = "gun_hatch_acacia_top.png"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.tiles = { def.tile_top, def.tile_front, def.tile_front, def.tile_front, def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_front, def.tile_front, def.tile_top, def.tile_front }
	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end



blacksails.register_hatch_acacia("blacksails:cannonhatch_acacia_wood", {
	description = "Cannon hatch acacia Wood",
	inventory_image = "gun_hatch_acacia.png",
	wield_image = "gun_hatch_acacia.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'blacksails:cannonhatch_acacia_wood 4',
	recipe = {
		{'default:acacia_wood', 'default:acacia_wood', 'default:acacia_wood'},
		{'default:acacia_wood', 'default:acacia_wood', 'default:acacia_wood'},
		{'', 'default:iron_lump', ''},
	}
})

---- Hatch, Wood, blue ----

function blacksails.register_hatch_blue_wood(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	def.on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple

	-- Cannon hatches
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.tile_front = "blox_bluewood.png"
	def.tile_side = "gun_hatch_blue_wood.png"
	def.tile_top = "gun_hatch_top_blue_wood.png"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.tiles = { def.tile_top, def.tile_front, def.tile_front, def.tile_front, def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_front, def.tile_front, def.tile_top, def.tile_front }
	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end



blacksails.register_hatch_blue_wood("blacksails:cannonhatch_blue_wood", {
	description = "Cannon hatch Wood blue",
	inventory_image = "gun_hatch_blue_wood.png",
	wield_image = "gun_hatch_blue_wood.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'blacksails:cannonhatch_blue_wood 4',
	recipe = {
		{'default:wood', 'default:wood', 'default:wood'},
		{'default:wood', 'default:wood', 'default:wood'},
		{'dye:blue', 'default:iron_lump', 'dye:blue'},
	}
})

---- Hatch, Wood, cyan ----

function blacksails.register_hatch_cyan_wood(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	def.on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple

	-- Cannon hatches
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.tile_front = "blox_cyanwood.png"
	def.tile_side = "gun_hatch_cyan_wood.png"
	def.tile_top = "gun_hatch_top_cyan_wood.png"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.tiles = { def.tile_top, def.tile_front, def.tile_front, def.tile_front, def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_front, def.tile_front, def.tile_top, def.tile_front }
	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end



blacksails.register_hatch_cyan_wood("blacksails:cannonhatch_cyan_wood", {
	description = "Cannon hatch Wood cyan",
	inventory_image = "gun_hatch_cyan_wood.png",
	wield_image = "gun_hatch_cyan_wood.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'blacksails:cannonhatch_cyan_wood 4',
	recipe = {
		{'default:wood', 'default:wood', 'default:wood'},
		{'default:wood', 'default:wood', 'default:wood'},
		{'dye:cyan', 'default:iron_lump', 'dye:cyan'},
	}
})

---- Hatch, Wood, green ----

function blacksails.register_hatch_green_wood(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	def.on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple

	-- Cannon hatches
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.tile_front = "blox_greenwood.png"
	def.tile_side = "gun_hatch_green_wood.png"
	def.tile_top = "gun_hatch_top_green_wood.png"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.tiles = { def.tile_top, def.tile_front, def.tile_front, def.tile_front, def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_front, def.tile_front, def.tile_top, def.tile_front }
	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end



blacksails.register_hatch_green_wood("blacksails:cannonhatch_green_wood", {
	description = "Cannon hatch Wood green",
	inventory_image = "gun_hatch_green_wood.png",
	wield_image = "gun_hatch_green_wood.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'blacksails:cannonhatch_green_wood 4',
	recipe = {
		{'default:wood', 'default:wood', 'default:wood'},
		{'default:wood', 'default:wood', 'default:wood'},
		{'dye:green', 'default:iron_lump', 'dye:green'},
	}
})

---- Hatch, Wood, orange ----

function blacksails.register_hatch_orange_wood(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	def.on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple

	-- Cannon hatches
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.tile_front = "blox_orangewood.png"
	def.tile_side = "gun_hatch_orange_wood.png"
	def.tile_top = "gun_hatch_top_orange_wood.png"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.tiles = { def.tile_top, def.tile_front, def.tile_front, def.tile_front, def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_front, def.tile_front, def.tile_top, def.tile_front }
	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end



blacksails.register_hatch_orange_wood("blacksails:cannonhatch_orange_wood", {
	description = "Cannon hatch Wood orange",
	inventory_image = "gun_hatch_orange_wood.png",
	wield_image = "gun_hatch_orange_wood.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'blacksails:cannonhatch_orange_wood 4',
	recipe = {
		{'default:wood', 'default:wood', 'default:wood'},
		{'default:wood', 'default:wood', 'default:wood'},
		{'dye:orange', 'default:iron_lump', 'dye:orange'},
	}
})

---- Hatch, Wood, pink ----

function blacksails.register_hatch_pink_wood(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	def.on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple

	-- Cannon hatches
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.tile_front = "blox_pinkwood.png"
	def.tile_side = "gun_hatch_pink_wood.png"
	def.tile_top = "gun_hatch_top_pink_wood.png"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.tiles = { def.tile_top, def.tile_front, def.tile_front, def.tile_front, def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_front, def.tile_front, def.tile_top, def.tile_front }
	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end



blacksails.register_hatch_pink_wood("blacksails:cannonhatch_pink_wood", {
	description = "Cannon hatch Wood pink",
	inventory_image = "gun_hatch_pink_wood.png",
	wield_image = "gun_hatch_pink_wood.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'blacksails:cannonhatch_pink_wood 4',
	recipe = {
		{'default:wood', 'default:wood', 'default:wood'},
		{'default:wood', 'default:wood', 'default:wood'},
		{'dye:pink', 'default:iron_lump', 'dye:pink'},
	}
})

---- Hatch, Wood, purple ----

function blacksails.register_hatch_purple_wood(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	def.on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple

	-- Cannon hatches
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.tile_front = "blox_purplewood.png"
	def.tile_side = "gun_hatch_purple_wood.png"
	def.tile_top = "gun_hatch_top_purple_wood.png"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.tiles = { def.tile_top, def.tile_front, def.tile_front, def.tile_front, def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_front, def.tile_front, def.tile_top, def.tile_front }
	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end



blacksails.register_hatch_purple_wood("blacksails:cannonhatch_purple_wood", {
	description = "Cannon hatch Wood purple",
	inventory_image = "gun_hatch_purple_wood.png",
	wield_image = "gun_hatch_purple_wood.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'blacksails:cannonhatch_purple_wood 4',
	recipe = {
		{'default:wood', 'default:wood', 'default:wood'},
		{'default:wood', 'default:wood', 'default:wood'},
		{'dye:purple', 'default:iron_lump', 'dye:purple'},
	}
})

---- Hatch, Wood, red ----

function blacksails.register_hatch_red_wood(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	def.on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple

	-- Cannon hatches
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.tile_front = "blox_redwood.png"
	def.tile_side = "gun_hatch_red_wood.png"
	def.tile_top = "gun_hatch_top_red_wood.png"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.tiles = { def.tile_top, def.tile_front, def.tile_front, def.tile_front, def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_front, def.tile_front, def.tile_top, def.tile_front }
	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end



blacksails.register_hatch_red_wood("blacksails:cannonhatch_red_wood", {
	description = "Cannon hatch Wood red",
	inventory_image = "gun_hatch_red_wood.png",
	wield_image = "gun_hatch_red_wood.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'blacksails:cannonhatch_red_wood 4',
	recipe = {
		{'default:wood', 'default:wood', 'default:wood'},
		{'default:wood', 'default:wood', 'default:wood'},
		{'dye:red', 'default:iron_lump', 'dye:red'},
	}
})

---- Hatch, Wood, white ----

function blacksails.register_hatch_white_wood(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	def.on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple

	-- Cannon hatches
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.tile_front = "blox_whitewood.png"
	def.tile_side = "gun_hatch_white_wood.png"
	def.tile_top = "gun_hatch_top_white_wood.png"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.tiles = { def.tile_top, def.tile_front, def.tile_front, def.tile_front, def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_front, def.tile_front, def.tile_top, def.tile_front }
	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end



blacksails.register_hatch_white_wood("blacksails:cannonhatch_white_wood", {
	description = "Cannon hatch Wood white",
	inventory_image = "gun_hatch_white_wood.png",
	wield_image = "gun_hatch_white_wood.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'blacksails:cannonhatch_white_wood 4',
	recipe = {
		{'default:wood', 'default:wood', 'default:wood'},
		{'default:wood', 'default:wood', 'default:wood'},
		{'dye:white', 'default:iron_lump', 'dye:white'},
	}
})

---- Hatch, Wood, yellow ----

function blacksails.register_hatch_yellow_wood(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	def.on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple

	-- Cannon hatches
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.tile_front = "blox_yellowwood.png"
	def.tile_side = "gun_hatch_yellow_wood.png"
	def.tile_top = "gun_hatch_top_yellow_wood.png"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.tiles = { def.tile_top, def.tile_front, def.tile_front, def.tile_front, def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_front, def.tile_front, def.tile_top, def.tile_front }
	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end



blacksails.register_hatch_yellow_wood("blacksails:cannonhatch_yellow_wood", {
	description = "Cannon hatch Wood yellow",
	inventory_image = "gun_hatch_yellow_wood.png",
	wield_image = "gun_hatch_yellow_wood.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'blacksails:cannonhatch_yellow_wood 4',
	recipe = {
		{'default:wood', 'default:wood', 'default:wood'},
		{'default:wood', 'default:wood', 'default:wood'},
		{'dye:yellow', 'default:iron_lump', 'dye:yellow'},
	}
})

---- Hatch, Wood, black ----

function blacksails.register_hatch_black_wood(name, def)
	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function (pos, node)
		local newname = node.name == name_closed and name_opened or name_closed
		local sound = false
		if node.name == name_closed then sound = def.sound_open end
		if node.name == name_opened then sound = def.sound_close end
		if sound then
			minetest.sound_play(sound, {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
		minetest.set_node(pos, {name = newname, param1 = node.param1, param2 = node.param2})
	end

	def.on_rotate = minetest.get_modpath("screwdriver") and screwdriver.rotate_simple

	-- Cannon hatches
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.tile_front = "blox_blackwood.png"
	def.tile_side = "gun_hatch_black_wood.png"
	def.tile_top = "gun_hatch_black_wood_top.png"

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	}
	def_closed.tiles = { def.tile_top, def.tile_front, def.tile_front, def.tile_front, def.tile_side, def.tile_side }

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.4, -0.5, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = { def.tile_side, def.tile_side, def.tile_front, def.tile_front, def.tile_top, def.tile_front }
	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)
end



blacksails.register_hatch_black_wood("blacksails:cannonhatch_black_wood", {
	description = "Cannon hatch Wood black",
	inventory_image = "gun_hatch_black_wood.png",
	wield_image = "gun_hatch_black_wood.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'blacksails:cannonhatch_black_wood 4',
	recipe = {
		{'default:wood', 'default:wood', 'default:wood'},
		{'default:wood', 'default:wood', 'default:wood'},
		{'dye:black', 'default:iron_lump', 'dye:black'},
	}
})