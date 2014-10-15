-------------------------------------------------------------------------------
-- * Goat done by Nathan.S (model + texture)
-- * based on Mob Framework Mod by Sapier
-------------------------------------------------------------------------------
minetest.log("action","MOD: mobf_goat mod loading ...")
local version = "0.1"

local goat_groups = {
						not_in_creative_inventory=1
					}

local selectionbox_goat = {-0.5, 0, -0.15, 0.5, 0.8, 0.15}

local modpath = minetest.get_modpath("mobf_goat")


goat_prototype = {
		name="goat",
		modname="mobf_goat",
		
		factions = {
			member = {
				"animals",
				"birds"
				}
			},
	
		generic = {
					description="Goat",
					base_health=12,
					kill_result="",
					armor_groups= {
						fleshy=90,
					},
					groups = goat_groups,
					envid = "meadow"
				},
		movement =  {
					min_accel=0.05,
					max_accel=0.1,
					max_speed=0.3,
					min_speed=0.1,
					pattern="stop_and_go",
					canfly = false,
					},
		catching = {
					tool="animalmaterials:lasso",
					consumed=true,
					},
		spawning = {
					primary_algorithms = {
						{
						rate=0.001,
						density=75,
						algorithm="willow_mapgen",
						height=1
						},
					}
				},

		animation = {
				walk = {
					start_frame = 122,
					end_frame   = 182,
					},
				head_down = {
					start_frame =   1,
					end_frame   =  30,
					},
				head_up   = {
					start_frame =  31,
					end_frame   =  60,
					},
				tail_wiggle = {
					start_frame =  61,
					end_frame   = 121,
					},
				lay_down    = {
					start_frame = 185,
					end_frame   = 215,
					},
				lie         = {
					start_frame = 215,
					end_frame   = 215,
					},
				get_up      = {
					start_frame = 216,
					end_frame   = 245,
					},
				attack      = {
					start_frame = 246,
					end_frame   = 330,
					},
				chewing     = {
					start_frame = 331,
					end_frame   = 390,
					},
				looking     = {
					start_frame = 391,
					end_frame   = 511,
					},
				all = {
					start_frame =   1,
					end_frame   = 511,
					},
			},

--Goat Anim Scrub Sheet:
--v Head_Down: 1-30
--v Head_Up: 31-60
--v Tail_Wiggle: 61-121
--v Walk_Cycle: 122-182
--v Lay_Down: 185-215
--v Getting_Up: 216-245
--v Attack: 246-330
--v Chewing: 331-390
--v Looking_Around: 391-511


		states = {
				{ 
				name = "default",
				movgen = "none",
				chance = 0.4,
				animation = "all",
				graphics_3d = {
					visual = "mesh",
					mesh = "goat.b3d",
					textures = {"goat.png"},
					collisionbox = selectionbox_goat,
					visual_size= {x=2.00,y=2.00,z=2.00},
					},
				graphics = {
					sprite_scale={x=1,y=1},
					sprite_div = {x=6,y=1},
					visible_height = 1,
					visible_width = 1,
					},
				typical_state_time = 30,
				},
				{ 
				name = "walking",
				movgen = "probab_mov_gen",
				chance = 0.3,
				animation = "walk",
				typical_state_time = 180,
				},
				{ 
				name = "walking",
				movgen = "none",
				chance = 0.3,
				animation = "lie",
				typical_state_time = 30,
				}
			},
		}
		

--register with animals mod
minetest.log("action","\tadding animal "..goat_prototype.name)
mobf_add_mob(goat_prototype)
minetest.log("action","MOD: mobf_goat mod         version " .. version .. " loaded")
