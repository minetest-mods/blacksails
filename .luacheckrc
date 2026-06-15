unused_args = false
max_line_length = 165

globals = {
    "minetest", "core",

    "blacksails",

    -- TODO: These MUST BE REMOVED/REPLACED
    "cannon_destroy_probability",
    "cannon_destroy_radius",
    "cannon_shoot_distance",
    "cannon_weaponized",
    "cannon_does_damage",
    "cannon_max_punch_count",
}

read_globals = {
    "vector",

    string = {fields = {"split", "trim"}},
    table = {fields = {"copy"}},

    "screwdriver",
    "default",
}
