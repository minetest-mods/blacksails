--- Flags - decorative (because, duh...) ---

minetest.register_node("blacksails:flag1", {
	tiles = {
		"pirate-flag_sides.png",
		"pirate-flag_sides.png",
		"pirate-flag_sides.png",
		"pirate-flag_sides.png",
		"pirate-flag_face.png",
		"pirate-flag_face.png"
	},
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
	drawtype = "nodebox",
	paramtype = "light",
	description = "The Jolly Roger",
	walkable = false,
	paramtype2 = "facedir",
	light_source = 8,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 0.5, 0.0625}, -- NodeBox1
		}
	}
})
minetest.register_craft({
	output = 'blacksails:flag1 1',
	recipe = {
		{'wool:black', 'wool:black', 'wool:black'},
		{'dye:white', 'dye:white', 'dye:white'},
		{'', '', ''},
	}
})