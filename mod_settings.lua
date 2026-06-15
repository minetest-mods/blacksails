-- Allows players to fire the cannon, but does not allow the cannon to do real damage. You still should be careful with this --
cannon_weaponized = true

-- Allows the cannon to be fired AND do damage. Should never be true unless you have a griefing/war/otherwise not fun server. --
cannon_does_damage = true

-- How far can the cannon shoot, in nodes --

cannon_shoot_distance = 100 -- Max 100 - Min 10 (You wouldn't want to shoot yourself in the foot)

-- cannon destroy radius: how far from the center of impact blocks may break. Mind that this means from impact to back, to front, to all sides.
-- So 10 actually is 20 deep, 20 wide, 20 high or 8000 nodes. It may lag a little--

cannon_destroy_radius = 4 --Max 10

-- cannon destroy probability: 1 to 5, 1 being very low. Helps decide if a node is destroyed by the cannon or not. Other factors include chance and
-- the node's toughness. The higher this number, the neater your craters. Mind that this isn't a mining tool, around 60% of nodes will be destroyed
-- WITHOUT a drop.

cannon_destroy_probability = 1 --max 5

-- How many nodes the projectile will punch through before being slowed to a halt. Each node also reduces the distance it travels beyond before crater-ing,

cannon_max_punch_count = 3



