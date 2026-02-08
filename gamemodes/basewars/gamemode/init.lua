include("include.lua")
AddCSLuaFile("include.lua")

include("modules.lua")
AddCSLuaFile("modules.lua")

BaseWars.ModuleLoader:Load()

local prop_whitelist = {
	[ "models/props_borealis/bluebarrel001.mdl" ] = true,
	[ "models/props_borealis/borealis_door001a.mdl" ] = true,
	[ "models/props_c17/oildrum001.mdl" ] = true,
	[ "models/props_c17/bench01a.mdl" ] = true,
	[ "models/props_c17/column02a.mdl" ] = true,
	[ "models/props_c17/concrete_barrier001a.mdl" ] = true,
	[ "models/props_c17/display_cooler01a.mdl" ] = true,
	[ "models/props_c17/fence01a.mdl" ] = true,
	[ "models/props_c17/fence01b.mdl" ] = true,
	[ "models/props_c17/fence02a.mdl" ] = true,
	[ "models/props_c17/fence02b.mdl" ] = true,
	[ "models/props_c17/fence03a.mdl" ] = true,
	[ "models/props_wasteland/interior_fence001g.mdl" ] = true,
	[ "models/props_wasteland/interior_fence002d.mdl" ] = true,
	[ "models/props_building_details/Storefront_Template001a_Bars.mdl" ] = true,
	[ "models/props_wasteland/interior_fence002e.mdl" ] = true,
	[ "models/props_interiors/ElevatorShaft_Door01a.mdl" ] = true,
	[ "models/props_wasteland/prison_celldoor001b.mdl" ] = true,
	[ "models/props_c17/gate_door01a.mdl" ] = true,
	[ "models/props_c17/gate_door02a.mdl" ] = true,
	[ "models/props_c17/door01_left.mdl" ] = true,
	[ "models/props_doors/door03_slotted_left.mdl" ] = true,
	[ "models/props_c17/FurnitureBathtub001a.mdl" ] = true,
	[ "models/props_c17/FurnitureBed001a.mdl" ] = true,
	[ "models/props_wasteland/prison_bedframe001b.mdl" ] = true,
	[ "models/props_c17/FurnitureCouch001a.mdl" ] = true,
    [ "models/props_c17/FurnitureCouch002a.mdl" ] = true,
	[ "models/props_interiors/Furniture_shelf01a.mdl" ] = true,
	[ "models/props_c17/shelfunit01a.mdl" ] = true,
	[ "models/props_c17/FurnitureShelf001a.mdl" ] = true,
	[ "models/props_c17/FurnitureShelf002a.mdl" ] = true,
	[ "models/props_c17/FurnitureSink001a.mdl" ] = true,
	[ "models/props_c17/FurnitureWashingmachine001a.mdl" ] = true,
	[ "models/props_c17/FurnitureFridge001a.mdl" ] = true,
	[ "models/props_interiors/refrigeratorDoor01a.mdl" ] = true,
	[ "models/props_interiors/refrigeratorDoor02a.mdl" ] = true,
	[ "models/props_c17/FurnitureFireplace001a.mdl" ] = true,
	[ "models/props_c17/furnitureStove001a.mdl" ] = true,
	[ "models/props_interiors/BathTub01a.mdl" ] = true,
	[ "models/props_wasteland/prison_heater001a.mdl" ] = true,
	[ "models/props_c17/FurnitureRadiator001a.mdl" ] = true,
	[ "models/props_c17/GasPipes006a.mdl" ] = true,
	[ "models/props_c17/gravestone001a.mdl" ] = true,
	[ "models/props_c17/gravestone002a.mdl" ] = true,
	[ "models/props_c17/gravestone003a.mdl" ] = true,
	[ "models/props_c17/gravestone004a.mdl" ] = true,
	[ "models/props_c17/gravestone_coffinpiece001a.mdl" ] = true,
	[ "models/props_c17/gravestone_coffinpiece002a.mdl" ] = true,
	[ "models/props_c17/gravestone_cross001a.mdl" ] = true,
	[ "models/props_junk/PlasticCrate01a.mdl" ] = true,
	[ "models/props_junk/PlasticCrate01a.mdl" ] = true,
	[ "models/props_junk/PlasticCrate01a.mdl" ] = true,
	[ "models/props_c17/metalladder001.mdl" ] = true,
	[ "models/props_combine/combine_barricade_short02a.mdl" ] = true,
	[ "models/props_combine/combine_bridge_b.mdl" ] = true,
	[ "models/props_combine/combine_window001.mdl" ] = true,
	[ "models/props_debris/metal_panel01a.mdl" ] = true,
	[ "models/props_debris/metal_panel02a.mdl" ] = true,
	[ "models/props_combine/breenchair.mdl" ] = true,
	[ "models/props_trainstation/BenchOutdoor01a.mdl" ] = true,
	[ "models/props_wasteland/cafeteria_bench001a.mdl" ] = true,
	[ "models/props_wasteland/cafeteria_table001a.mdl" ] = true,
	[ "models/props_trainstation/bench_indoor001a.mdl" ] = true,
	[ "models/props_interiors/Furniture_Couch01a.mdl" ] = true,
	[ "models/props_interiors/Furniture_Couch02a.mdl" ] = true,
	[ "models/props_c17/Lockers001a.mdl" ] = true,
	[ "models/props_wasteland/kitchen_fridge001a.mdl" ] = true,
	[ "models/props_interiors/VendingMachineSoda01a.mdl" ] = true,
	[ "models/props_interiors/VendingMachineSoda01a_door.mdl" ] = true,
	[ "models/props_junk/wood_crate001a.mdl" ] = true,
	[ "models/props_junk/wood_crate002a.mdl" ] = true,
	[ "models/props_junk/iBeam01a_cluster01.mdl" ] = true,
	[ "models/props_junk/iBeam01a.mdl" ] = true,
	[ "models/props_junk/PushCart01a.mdl" ] = true,
	[ "models/props_junk/ravenholmsign.mdl" ] = true,
	[ "models/props_junk/TrashDumpster02b.mdl" ] = true,
	[ "models/props_junk/wood_pallet001a.mdl" ] = true,
	[ "models/props_lab/blastdoor001a.mdl" ] = true,
	[ "models/props_lab/blastdoor001b.mdl" ] = true,
	[ "models/props_lab/blastdoor001c.mdl" ] = true,
	[ "models/props_lab/lockerdoorleft.mdl" ] = true,
	[ "models/props_trainstation/traincar_rack001.mdl" ] = true,
	[ "models/props_trainstation/trainstation_clock001.mdl" ] = true,
	[ "models/props_lab/filecabinet02.mdl" ] = true,
	[ "models/props_wasteland/controlroom_filecabinet002a.mdl" ] = true,
	[ "models/props_wasteland/controlroom_storagecloset001a.mdl" ] = true,
	[ "models/props_wasteland/controlroom_storagecloset001b.mdl" ] = true,
	[ "models/props_wasteland/kitchen_shelf002a.mdl" ] = true,
	[ "models/props_wasteland/kitchen_shelf001a.mdl" ] = true,
	[ "models/props_combine/breendesk.mdl" ] = true,
	[ "models/props_wasteland/controlroom_desk001a.mdl" ] = true,
	[ "models/props_wasteland/kitchen_counter001c.mdl" ] = true,
	[ "models/props_wasteland/kitchen_counter001a.mdl" ] = true,
	[ "models/props_wasteland/kitchen_counter001d.mdl" ] = true,
	[ "models/props_wasteland/kitchen_stove001a.mdl" ] = true,
	[ "models/props_wasteland/kitchen_stove002a.mdl" ] = true,
	[ "models/props_wasteland/laundry_basket001.mdl" ] = true,
	[ "models/props_wasteland/laundry_cart001.mdl" ] = true,
	[ "models/props_wasteland/laundry_cart002.mdl" ] = true,
	[ "models/props_wasteland/laundry_dryer001.mdl" ] = true,
	[ "models/props_wasteland/laundry_dryer002.mdl" ] = true,
	[ "models/props_wasteland/laundry_washer001a.mdl" ] = true,
	[ "models/props_wasteland/laundry_cart001.mdl" ] = true,
	[ "models/props_interiors/furniture_cabinetdrawer01a.mdl" ] = true,
	[ "models/props_interiors/furniture_cabinetdrawer02a.mdl" ] = true,
	[ "models/props_c17/furnituredresser001a.mdl" ] = true,
	[ "models/props_c17/furniturestove001a.mdl" ] = true,
	[ "models/props_phx/construct/metal_plate1.mdl" ] = true,
	[ "models/props_phx/construct/metal_plate1_tri.mdl" ] = true,
	[ "models/props_phx/construct/metal_plate1x2.mdl" ] = true,
	[ "models/props_phx/construct/metal_plate1x2_tri.mdl" ] = true,
	[ "models/props_phx/construct/metal_plate2x2.mdl" ] = true,
	[ "models/props_phx/construct/metal_plate2x2_tri.mdl" ] = true,
	[ "models/props_phx/construct/metal_plate2x4.mdl" ] = true,
	[ "models/props_phx/construct/metal_plate2x4_tri.mdl" ] = true,
	[ "models/props_phx/construct/metal_plate4x4.mdl" ] = true,
	[ "models/props_phx/construct/metal_plate4x4_tri.mdl" ] = true,
	[ "models/props_phx/construct/metal_tube.mdl" ] = true,
	[ "models/props_phx/construct/metal_tubex2.mdl" ] = true,
	[ "models/props_phx/construct/metal_angle360.mdl" ] = true,
	[ "models/props_phx/construct/metal_angle180.mdl" ] = true,
	[ "models/props_phx/construct/metal_angle90.mdl" ] = true,
	[ "models/props_phx/construct/metal_plate_curve360.mdl" ] = true,
	[ "models/props_phx/construct/metal_plate_curve180.mdl" ] = true,
	[ "models/props_phx/construct/metal_plate_curve.mdl" ] = true,
	[ "models/props_phx/construct/metal_plate_curve360x2.mdl" ] = true,
	[ "models/props_phx/construct/metal_plate_curve180x2.mdl" ] = true,
	[ "models/props_phx/construct/metal_plate_curve2x2.mdl" ] = true,
	[ "models/props_phx/construct/metal_dome360.mdl" ] = true,
	[ "models/props_phx/construct/metal_dome180.mdl" ] = true,
	[ "models/props_phx/construct/metal_dome90.mdl" ] = true,
	[ "models/phxtended/tri1x1solid.mdl" ] = true,
	[ "models/phxtended/tri1x1x1solid.mdl" ] = true,
	[ "models/phxtended/tri1x1x2solid.mdl" ] = true,
	[ "models/phxtended/tri2x1x1solid.mdl" ] = true,
	[ "models/phxtended/tri2x1x2solid.mdl" ] = true,
	[ "models/phxtended/tri2x2solid.mdl" ] = true,
	[ "models/phxtended/tri2x2x1solid.mdl" ] = true,
	[ "models/phxtended/tri2x2x2solid.mdl" ] = true,
	[ "models/phxtended/trieq1x1x1solid.mdl" ] = true,
	[ "models/phxtended/bar1x45a.mdl" ] = true,
	[ "models/phxtended/bar1x45b.mdl" ] = true,
	[ "models/phxtended/bar2x45a.mdl" ] = true,
	[ "models/phxtended/bar2x45b.mdl" ] = true,
	[ "models/props_phx/construct/metal_wire1x1.mdl" ] = true,
	[ "models/phxtended/cab1x1x1.mdl" ] = true,
	[ "models/props_phx/construct/metal_wire1x1x1.mdl" ] = true,
	[ "models/props_phx/construct/metal_wire1x2.mdl" ] = true,
	[ "models/phxtended/cab2x1x1.mdl" ] = true,
	[ "models/props_phx/construct/metal_wire1x1x2b.mdl" ] = true,
	[ "models/props_phx/construct/metal_wire1x1x2.mdl" ] = true,
	[ "models/props_phx/construct/metal_wire2x2b.mdl" ] = true,
	[ "models/phxtended/cab2x2x1.mdl" ] = true,
	[ "models/props_phx/construct/metal_wire1x2x2b.mdl" ] = true,
	[ "models/phxtended/cab2x2x2.mdl" ] = true,
	[ "models/props_phx/construct/metal_wire2x2x2b.mdl" ] = true,
	[ "models/props_phx/construct/metal_wire_angle360x1.mdl" ] = true,
	[ "models/props_phx/construct/metal_wire_angle180x1.mdl" ] = true,
	[ "models/props_phx/construct/metal_wire_angle90x1.mdl" ] = true,
	[ "models/props_phx/construct/metal_wire_angle360x2.mdl" ] = true,
	[ "models/props_phx/construct/metal_wire_angle180x2.mdl" ] = true,
	[ "models/phxtended/tri1x1.mdl" ] = true,
	[ "models/phxtended/tri1x1x1.mdl" ] = true,
	[ "models/phxtended/tri1x1x2.mdl" ] = true,
	[ "models/phxtended/tri2x1x1.mdl" ] = true,
	[ "models/phxtended/tri2x1x2.mdl" ] = true,
	[ "models/phxtended/tri2x2.mdl" ] = true,
	[ "models/phxtended/tri2x2x2.mdl" ] = true,
	[ "models/phxtended/trieq1x1x1.mdl" ] = true,
	[ "models/phxtended/trieq1x1x2.mdl" ] = true,
	[ "models/phxtended/trieq2x2x1.mdl" ] = true,
	[ "models/phxtended/trieq2x2x2.mdl" ] = true,
	[ "models/props_phx/construct/glass/glass_plate1x1.mdl" ] = true,
	[ "models/props_phx/construct/glass/glass_plate1x2.mdl" ] = true,
	[ "models/props_phx/construct/glass/glass_plate2x2.mdl" ] = true,
	[ "models/props_phx/construct/glass/glass_plate2x4.mdl" ] = true,
	[ "models/props_phx/construct/glass/glass_plate4x4.mdl" ] = true,
	[ "models/props_phx/construct/glass/glass_angle360.mdl" ] = true,
	[ "models/props_phx/construct/glass/glass_angle180.mdl" ] = true,
	[ "models/props_phx/construct/glass/glass_angle90.mdl" ] = true,
	[ "models/props_phx/construct/glass/glass_curve360x1.mdl" ] = true,
	[ "models/props_phx/construct/glass/glass_curve180x1.mdl" ] = true,
	[ "models/props_phx/construct/glass/glass_curve360x2.mdl" ] = true,
	[ "models/props_phx/construct/glass/glass_curve180x2.mdl" ] = true,
	[ "models/props_phx/construct/glass/glass_curve90x2.mdl" ] = true,
	[ "models/props_phx/construct/glass/glass_dome360.mdl" ] = true,
	[ "models/props_phx/construct/glass/glass_dome180.mdl" ] = true,
	[ "models/props_phx/construct/glass/glass_dome90.mdl" ] = true,
	[ "models/props_phx/construct/windows/window1x1.mdl" ] = true,
	[ "models/props_phx/construct/windows/window1x2.mdl" ] = true,
	[ "models/props_phx/construct/windows/window2x2.mdl" ] = true,
	[ "models/props_phx/construct/windows/window2x4.mdl" ] = true,
	[ "models/props_phx/construct/windows/window4x4.mdl" ] = true,
	[ "models/props_phx/construct/windows/window_angle360.mdl" ] = true,
	[ "models/props_phx/construct/windows/window_angle90.mdl" ] = true,
	[ "models/props_phx/construct/windows/window_curve360x1.mdl" ] = true,
	[ "models/props_phx/construct/windows/window_curve180x1.mdl" ] = true,
	[ "models/props_phx/construct/windows/window_curve90x1.mdl" ] = true,
	[ "models/props_phx/construct/windows/window_curve360x2.mdl" ] = true,
	[ "models/props_phx/construct/windows/window_curve180x2.mdl" ] = true,
	[ "models/props_phx/construct/windows/window_curve90x2.mdl" ] = true,
	[ "models/props_phx/construct/windows/window_dome360.mdl" ] = true,
	[ "models/props_phx/construct/windows/window_dome180.mdl" ] = true,
	[ "models/props_phx/construct/windows/window_dome90.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_boardx1.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_boardx2.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_boardx4.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_panel1x1.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_panel1x2.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_panel2x2.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_panel2x4.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_panel4x4.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_angle360.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_angle180.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_angle90.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_curve360x1.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_curve180x1.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_curve90x1.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_curve360x2.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_curve180x2.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_curve90x2.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_dome360.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_dome180.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_dome90.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_wire1x1.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_wire1x1x1.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_wire1x2b.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_wire1x2b.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_wire1x2.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_wire1x1x2b.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_wire1x1x2.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_wire2x2b.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_wire2x2.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_wire2x2x2b.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_wire_angle360x1.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_wire_angle180x1.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_wire_angle90x1.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_wire_angle360x2.mdl" ] = true,
	[ "models/props_phx/construct/wood/wood_wire_angle90x2.mdlq" ] = true,
	[ "models/props_phx/construct/plastic/plastic_panel1x1.mdl" ] = true,
	[ "models/props_phx/construct/plastic/plastic_panel1x2.mdl" ] = true,
	[ "models/props_phx/construct/plastic/plastic_panel1x3.mdl" ] = true,
	[ "models/props_phx/construct/plastic/plastic_panel1x4.mdl" ] = true,
	[ "models/props_phx/construct/plastic/plastic_panel1x8.mdl" ] = true,
	[ "models/props_phx/construct/plastic/plastic_panel2x2.mdl" ] = true,
	[ "models/props_phx/construct/plastic/plastic_panel2x3.mdl" ] = true,
	[ "models/props_phx/construct/plastic/plastic_panel2x4.mdl" ] = true,
	[ "models/props_phx/construct/plastic/plastic_panel2x8.mdl" ] = true,
	[ "models/props_phx/construct/plastic/plastic_panel3x3.mdl" ] = true,
	[ "models/props_phx/construct/plastic/plastic_panel4x4.mdl" ] = true,
	[ "models/props_phx/construct/plastic/plastic_panel4x8.mdl" ] = true,
	[ "models/props_phx/construct/plastic/plastic_panel8x8.mdl" ] = true,
	[ "models/props_phx/construct/plastic/plastic_angle_360.mdl" ] = true,
	[ "models/props_phx/construct/plastic/plastic_angle_90.mdl" ] = true,
	[ "models/props_phx/construct/plastic/plastic_angle_180.mdl" ] = true,
	[ "models/hunter/blocks/cube025x025x025.mdl" ] = true,
	[ "models/hunter/blocks/cube025x05x025.mdl" ] = true,
	[ "models/hunter/blocks/cube025x075x025.mdl" ] = true,
	[ "models/hunter/blocks/cube025x125x025.mdl" ] = true,
	[ "models/hunter/blocks/cube025x150x025.mdl" ] = true,
	[ "models/hunter/blocks/cube025x2x025.mdl" ] = true,
	[ "models/hunter/blocks/cube025x3x025.mdl" ] = true,
	[ "models/hunter/blocks/cube025x4x025.mdl" ] = true,
	[ "models/hunter/blocks/cube025x5x025.mdl" ] = true,
	[ "models/hunter/blocks/cube025x6x025.mdl" ] = true,
	[ "models/hunter/blocks/cube025x7x025.mdl" ] = true,
	[ "models/hunter/blocks/cube025x8x025.mdl" ] = true,
	[ "models/hunter/blocks/cube05x05x025.mdl" ] = true,
	[ "models/hunter/blocks/cube05x075x025.mdl" ] = true,
	[ "models/hunter/blocks/cube05x1x025.mdl" ] = true,
	[ "models/hunter/blocks/cube05x2x025.mdl" ] = true,
	[ "models/hunter/blocks/cube05x3x025.mdl" ] = true,
	[ "models/hunter/blocks/cube05x4x025.mdl" ] = true,
	[ "models/hunter/blocks/cube05x5x025.mdl" ] = true,
	[ "models/hunter/blocks/cube05x6x025.mdl" ] = true,
	[ "models/hunter/blocks/cube05x7x025.mdl" ] = true,
	[ "models/hunter/blocks/cube05x8x025.mdl" ] = true,
	[ "models/hunter/blocks/cube05x05x05.mdl" ] = true,
	[ "models/hunter/blocks/cube05x1x05.mdl" ] = true,
	[ "models/hunter/blocks/cube05x105x05.mdl" ] = true,
	[ "models/hunter/blocks/cube05x2x05.mdl" ] = true,
	[ "models/hunter/blocks/cube05x3x05.mdl" ] = true,
	[ "models/hunter/blocks/cube05x4x05.mdl" ] = true,
	[ "models/hunter/blocks/cube05x5x05.mdl" ] = true,
	[ "models/hunter/blocks/cube05x6x05.mdl" ] = true,
	[ "models/hunter/blocks/cube05x7x05.mdl" ] = true,
	[ "models/hunter/blocks/cube05x8x05.mdl" ] = true,
	[ "models/hunter/blocks/cube075x075x025.mdl" ] = true,
	[ "models/hunter/blocks/cube075x1x025.mdl" ] = true,
	[ "models/hunter/blocks/cube075x2x025.mdl" ] = true,
	[ "models/hunter/blocks/cube075x3x025.mdl" ] = true,
	[ "models/hunter/blocks/cube075x4x025.mdl" ] = true,
	[ "models/hunter/blocks/cube075x6x025.mdl" ] = true,
	[ "models/hunter/blocks/cube075x8x025.mdl" ] = true,
	[ "models/hunter/blocks/cube075x075x075.mdl" ] = true,
	[ "models/hunter/blocks/cube075x1x075.mdl" ] = true,
	[ "models/hunter/blocks/cube075x2x075.mdl" ] = true,
	[ "models/hunter/blocks/cube075x3x075.mdl" ] = true,
	[ "models/hunter/blocks/cube075x4x075.mdl" ] = true,
	[ "models/hunter/blocks/cube075x5x075.mdl" ] = true,
	[ "models/hunter/blocks/cube075x6x075.mdl" ] = true,
	[ "models/hunter/blocks/cube075x7x075.mdl" ] = true,
	[ "models/hunter/blocks/cube075x8x075.mdl" ] = true,
	[ "models/hunter/blocks/cube075x1x1.mdl" ] = true,
	[ "models/hunter/blocks/cube075x2x1.mdl" ] = true,
	[ "models/hunter/blocks/cube075x3x1.mdl" ] = true,
	[ "models/hunter/blocks/cube1x1x025.mdl" ] = true,
	[ "models/hunter/blocks/cube1x1x05.mdl" ] = true,
	[ "models/hunter/blocks/cube1x150x1.mdl" ] = true,
	[ "models/hunter/blocks/cube1x2x025.mdl" ] = true,
	[ "models/hunter/blocks/cube1x2x05.mdl" ] = true,
	[ "models/hunter/blocks/cube1x2x1.mdl" ] = true,
	[ "models/hunter/blocks/cube1x3x025.mdl" ] = true,
	[ "models/hunter/blocks/cube1x3x1.mdl" ] = true,
	[ "models/hunter/blocks/cube1x4x025.mdl" ] = true,
	[ "models/hunter/blocks/cube1x4x05.mdl" ] = true,
	[ "models/hunter/blocks/cube1x4x1.mdl" ] = true,
	[ "models/hunter/plates/plate025.mdl" ] = true,
	[ "models/hunter/plates/plate05.mdl" ] = true,
	[ "models/hunter/plates/plate075.mdl" ] = true,
	[ "models/hunter/plates/plate1.mdl" ] = true,
	[ "models/hunter/plates/plate125.mdl" ] = true,
	[ "models/hunter/plates/plate150.mdl" ] = true,
	[ "models/hunter/plates/plate175.mdl" ] = true,
	[ "models/hunter/plates/plate2.mdl" ] = true,
	[ "models/hunter/plates/plate3.mdl" ] = true,
	[ "models/hunter/plates/plate2x2.mdl" ] = true,
	[ "models/hunter/plates/plate2x3.mdl" ] = true,
	[ "models/hunter/plates/plate2x4.mdl" ] = true,
	[ "models/hunter/plates/plate2x5.mdl" ] = true,
	[ "models/hunter/plates/plate2x6.mdl" ] = true,
	[ "models/hunter/plates/plate2x7.mdl" ] = true,
	[ "models/hunter/plates/plate2x8.mdl" ] = true,
	[ "models/hunter/plates/plate3x3.mdl" ] = true,
	[ "models/hunter/plates/plate3x4.mdl" ] = true,
	[ "models/hunter/plates/plate3x5.mdl" ] = true,
	[ "models/hunter/plates/plate3x6.mdl" ] = true,
	[ "models/hunter/plates/plate3x7.mdl" ] = true,
	[ "models/hunter/plates/plate4x4.mdl" ] = true,
	[ "models/hunter/plates/plate4x5.mdl" ] = true,
	[ "models/hunter/plates/plate4x6.mdl" ] = true,
	[ "models/hunter/plates/plate4x7.mdl" ] = true,
	[ "models/hunter/plates/plate4x8.mdl" ] = true,
	[ "models/hunter/plates/plate5x5.mdl" ] = true,
	[ "models/hunter/plates/plate5x6.mdl" ] = true,
	[ "models/hunter/plates/plate5x7.mdl" ] = true,
	[ "models/hunter/plates/plate5x8.mdl" ] = true,
	[ "models/hunter/plates/plate6x6.mdl" ] = true,
	[ "models/hunter/plates/plate6x7.mdl" ] = true,
	[ "models/hunter/plates/plate6x8.mdl" ] = true,
	[ "models/hunter/plates/plate7x7.mdl" ] = true,
	[ "models/hunter/triangles/05x05.mdl" ] = true,
	[ "models/hunter/triangles/05x05mirrored.mdl" ] = true,
	[ "models/hunter/triangles/075x075.mdl" ] = true,
	[ "models/hunter/triangles/075x075mirrored.mdl" ] = true,
	[ "models/hunter/triangles/1x1.mdl" ] = true,
	[ "models/hunter/plates/tri1x1.mdl" ] = true,
	[ "models/hunter/triangles/1x1mirrored.mdl" ] = true,
	[ "models/hunter/geometric/tri1x1eq.mdl" ] = true,
	[ "models/hunter/plates/tri2x1.mdl" ] = true,
	[ "models/hunter/plates/tri3x1.mdl" ] = true,
	[ "models/hunter/triangles/2x2.mdl" ] = true,
	[ "models/hunter/triangles/2x2mirrored.mdl" ] = true,
	[ "models/hunter/triangles/3x3.mdl" ] = true,
	[ "models/hunter/triangles/3x3mirrored.mdl" ] = true,
	[ "models/hunter/triangles/05x05x05.mdl" ] = true,
	[ "models/hunter/triangles/1x05x05.mdl" ] = true,
	[ "models/hunter/triangles/1x05x1.mdl" ] = true,
	[ "models/hunter/triangles/1x1x1.mdl" ] = true,
	[ "models/hunter/triangles/1x1x2.mdl" ] = true,
	[ "models/hunter/triangles/1x1x3.mdl" ] = true,
	[ "models/hunter/triangles/1x1x4.mdl" ] = true,
	[ "models/hunter/triangles/1x1x5.mdl" ] = true,
	[ "models/hunter/triangles/2x1x1.mdl" ] = true,
	[ "models/hunter/triangles/2x2x1.mdl" ] = true,
	[ "models/hunter/triangles/2x2x2.mdl" ] = true,
	[ "models/hunter/triangles/3x2x2.mdl" ] = true,
	[ "models/hunter/triangles/1x1x1carved.mdl" ] = true,
	[ "models/hunter/triangles/1x1x1carved025.mdl" ] = true,
	[ "models/hunter/triangles/1x1x2carved.mdl" ] = true,
	[ "models/hunter/triangles/1x1x2carved025.mdl" ] = true,
	[ "models/hunter/triangles/1x1x4carved.mdl" ] = true,
	[ "models/hunter/triangles/1x1x4carved.mdl" ] = true,
	[ "models/hunter/triangles/2x1x1carved.mdl" ] = true,
	[ "models/hunter/triangles/2x1x2carved.mdl" ] = true,
	[ "models/hunter/triangles/2x2x1carved.mdl" ] = true,
	[ "models/hunter/triangles/2x2x2carved.mdl" ] = true,
	[ "models/hunter/triangles/2x2x4carved.mdl" ] = true,
	[ "models/hunter/triangles/trapezium3x3x1.mdl" ] = true,
	[ "models/hunter/triangles/trapezium3x3x1a.mdl" ] = true,
	[ "models/hunter/triangles/trapezium3x3x1b.mdl" ] = true,
	[ "models/hunter/triangles/trapezium3x3x1c.mdl" ] = true,
	[ "models/hunter/misc/squarecap1x1x1.mdl" ] = true,
	[ "models/hunter/misc/squarecap2x1x1.mdl" ] = true,
	[ "models/hunter/misc/squarecap2x1x2.mdl" ] = true,
	[ "models/hunter/misc/squarecap2x2x2.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate1x1.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate1x2.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate1x3.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate1x4.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate1x5.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate1x6.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate1x7.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate1x8.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate2x2.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate2x3.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate2x4.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate2x5.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate2x6.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate2x7.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate2x8.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate3x3.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate3x4.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate3x5.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate3x6.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate3x7.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate3x8.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate4x4.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate4x5.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate4x6.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate4x7.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate4x8.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate5x5.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate5x6.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate5x7.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate5x8.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate6x6.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate6x7.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate6x8.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate7x7.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate7x8.mdl" ] = true,
	[ "models/squad/sf_plates/sf_plate8x8.mdl" ] = true,
	[ "models/xqm/panel1x1.mdl" ] = true,
	[ "models/xqm/panel1x2.mdl" ] = true,
	[ "models/xqm/panel1x3.mdl" ] = true,
	[ "models/xqm/panel1x4.mdl" ] = true,
	[ "models/xqm/panel2x2.mdl" ] = true,
	[ "models/xqm/panel2x3.mdl" ] = true,
	[ "models/xqm/panel2x4.mdl" ] = true,
	[ "models/xqm/panel3x4.mdl" ] = true,
	[ "models/xqm/panel4x4.mdl" ] = true,
	[ "models/xqm/box2s.mdl" ] = true,
	[ "models/xqm/box3s.mdl" ] = true,
	[ "models/xqm/boxtri.mdl" ] = true,
	[ "models/xqm/box4s.mdl" ] = true,
	[ "models/xqm/box4shollow.mdl" ] = true,
	[ "models/xqm/box5s.mdl" ] = true,
	[ "models/xqm/boxfull.mdl" ] = true,
	[ "models/xqm/box4shollowx2.mdl" ] = true,
	[ "models/xqm/panel360.mdl" ] = true,
	[ "models/xqm/panel180.mdl" ] = true,
	[ "models/xqm/panel90.mdl" ] = true,
	[ "models/xqm/panel45.mdl" ] = true,
	[ "models/phxtended/bar1x.mdl" ] = true

}

hook.Add( "PlayerSpawnProp", "Alium.AntiGayProps", function( ply, model )
	if not prop_whitelist[ model ] then
		return false
	end
end)

function GM:PlayerSpawnRagdoll( ply, model )
	return false
end

function BaseWars.AddFastDLDir(dir)

	local Dir = (GM or GAMEMODE).Folder .. "/content/" .. dir .. "/*"
	local Files, Folders = file.Find(Dir, "GAME")

	BaseWars.UTIL.Log("Adding recursive FastDL for directory -> ", Dir)

	for k, v in next, Folders do

		BaseWars.AddFastDLDir(dir .. "/" .. v)

	end

	for k, v in next, Files do

		if not v:find(".", 1, true) then continue end
		resource.AddFile(dir .. "/" .. v)

	end

end

BaseWars.AddFastDLDir("sound")
BaseWars.AddFastDLDir("models")
BaseWars.AddFastDLDir("materials")
BaseWars.AddFastDLDir("resource")

if not BaseWars.Config.SBoxWeps then
	game.ConsoleCommand"sbox_weapons 0\n"
end

function GM:PostLoadData(ply)

	BaseWars.UTIL.RefundFromCrash(ply)

end

function GM:PlayerInitialSpawn(ply)

	self.BaseClass:PlayerInitialSpawn(ply)

	BaseWars.MySQL.FullInitPlayer(ply)

	for k, v in next, ents.GetAll() do

		local Owner = BaseWars.Ents:ValidOwner(v)
		local Class = v:GetClass()
		if Owner ~= ply or not Class:find("bw_") then continue end

		ply:GetTable()["limit_" .. Class] = (ply:GetTable()["limit_" .. Class] or 0) + 1

	end

	timer.Simple(0, function()
		if not IsValid(ply) then return end

		ply:SetTeam(1)
		player_manager.SetPlayerClass(ply, "player_default")
	end)

end

function GM:ShutDown()

	BaseWars.UTIL.SafeShutDown()
	BaseWars.MySQL.Disconnect()

	self.BaseClass:ShutDown()

end

function GM:OnEntityCreated(ent)

	local f = function()

		self.BaseClass:OnEntityCreated(ent)

		local Class = BaseWars.Ents:Valid(ent) and ent:GetClass()
		if Class == "prop_physics" and ent:Health() == 0 then

			local HP = (BaseWars.Ents:Valid(ent:GetPhysicsObject()) and ent:GetPhysicsObject():GetMass() or 50) * BaseWars.Config.UniversalPropConstant
			HP = math.Clamp(HP, 0, 400 * BaseWars.Config.UniversalPropConstant)

			ent:SetHealth(HP)
			ent:SetMaxHealth(HP)
			ent.DestructableProp = true

		end

	end

	timer.Simple(0, f)

end

function GM:PreCleanupMap()

	BaseWars.UTIL.RefundAll()

end

function GM:PostCleanupMap()
	BaseWars.NPCs:CreateNPCs()
end

function GM:GetFallDamage(ply, speed)
	return ( speed - 526.5 ) * 0.225
end

function GM:SetupMove(ply, move)
	local State = self.BaseClass:SetupMove(ply, move)

	if not ply:Alive() then
		return State
	end

	if BaseWars.Drugs and ply:IsOnGround() then
		ply.DoubleJump_OnGround = true
	end

	return State
end

local Jump = Sound("npc/zombie/claw_miss1.wav")

function GM:KeyPress(ply, code)

	self.BaseClass:KeyPress(ply, code)

	if BaseWars.Drugs and code == IN_JUMP and ply.DoubleJump_OnGround and not ply:IsOnGround() and ply:HasDrug("DoubleJump") and ply:GetMoveType() == MOVETYPE_WALK then
		ply:SetVelocity(ply:GetForward() * 100 + BaseWars.Config.Drugs.DoubleJump.JumpHeight)
		ply.DoubleJump_OnGround = false
		ply:EmitSound(Jump)
	end

	-- if code == IN_JUMP and (ply.Stuck and ply:Stuck()) and ply:GetMoveType() == MOVETYPE_WALK then
	-- 	ply:BW_UnStuck()
	-- end
end

function GM:EntityTakeDamage(ent, dmginfo)

	local Player = BaseWars.Ents:ValidPlayer(ent)
	local Owner = BaseWars.Ents:ValidOwner(ent)

	if not Player and not Owner then
		dmginfo:ScaleDamage(0)
		dmginfo:SetDamage(0)
		return false
	end

	self.BaseClass:EntityTakeDamage(ent, dmginfo)

	local Inflictor = dmginfo:GetInflictor()
	local Attacker 	= dmginfo:GetAttacker()
	local Damage 	= dmginfo:GetDamage()

	local Scale = 1

	if Attacker:IsPlayer() and Attacker:HasDrug("Rage") and Attacker ~= ent and not Inflictor.IsRaidDevice then
		Scale = Scale * BaseWars.Config.Drugs.Rage.Mult
	end

	if Owner then

		local RaidLogic 	= (Attacker == Owner and Owner:InRaid()) or (Owner:InFaction() and (not Attacker == Owner and Attacker.InFaction and Attacker:InFaction(Owner:GetFaction())))
		local RaidLogic2 	= Attacker ~= Owner and (not Owner:InRaid() or not (Attacker.InRaid and Attacker:InRaid()))

		if not ent.AlwaysRaidable and (RaidLogic or RaidLogic2) then
			dmginfo:ScaleDamage(0)
			dmginfo:SetDamage(0)
			return false
		end

	end

	local inf = IsValid(Inflictor) and Inflictor or Attacker
	if ent.DestructableProp and (not BaseWars.Config.Raid.CertainInflictors or BaseWars.Config.Raid.Inflictors[inf:GetClass()]) then

		if not BaseWars.Raid:IsOnGoing() or (Attacker.InRaid and not Attacker:InRaid()) then return end

		local ActualDmg = Damage * Scale
		local HP = ent:Health()

		ent:SetHealth(HP - ActualDmg)

		if ent:Health() <= 0 then
			ent:Remove()
			return
		end

		local M 		= HP / ent:GetMaxHealth()
		local OldCol 	= ent:GetColor()
		local Color 	= Color(255 * M, 255 * M, 255 * M, OldCol.a)

		ent:SetColor(Color)

		return
	end

	if ent:IsPlayer() then

		if not Attacker:IsPlayer() and dmginfo:IsDamageType(DMG_CRUSH) and (Attacker:IsWorld() or (IsValid(Attacker) and not Attacker:CreatedByMap())) then
			dmginfo:SetDamage(0)
			return
		end

		local FriendlyFire = BaseWars.Config.AllowFriendlyFire
		local Team = ent:GetFaction()

		if not (ent == Attacker) and not FriendlyFire and ent:InFaction() and Attacker:IsPlayer() and Attacker:InFaction(Team) then
			dmginfo:SetDamage(0)
			return
		end

		if ent:HasDrug("PainKiller") and Attacker:IsPlayer() and Attacker ~= ent then
			Scale = Scale * BaseWars.Config.Drugs.PainKiller.Mult
		end

		local TakeDamage = Damage * Scale

		if TakeDamage >= ent:Health() and ent:HasDrug("Shield") and not ent.ShieldOn then

			ent.ShieldOn = true
			ent:RemoveDrug("Shield")

			local TID = ent:SteamID64() .. ".ShieldGod"
			local f = function()
				if not IsValid(ent) then return end
				ent.ShieldOn = nil
			end
			
			timer.Create(TID, 0.5, 1, f)

			if Attacker:IsPlayer() and Attacker ~= ent then
				Attacker:Notify(BaseWars.LANG.ShieldSave, BASEWARS_NOTIFICATION_DRUG)
			end

			dmginfo:SetDamage(math.min(ent:Health() * 0.9, ent:Health() - 1))
			dmginfo:ScaleDamage(1)
			return
		elseif ent.ShieldOn then
			dmginfo:ScaleDamage(0)
			return
		end
	end

	dmginfo:ScaleDamage( Scale )
end

local SpawnClasses = {
	["info_player_deathmatch"] = true,
	["info_player_rebel"] = true,
	["gmod_player_start"] = true,
	["info_player_start"] = true,
	["info_player_allies"] = true,
	["info_player_axis"] = true,
	["info_player_counterterrorist"] = true,
	["info_player_terrorist"] = true,
}

local LastThink = CurTime()
local Spawns 	= {}

local function ScanEntities()

	Spawns = {}

	for k, v in next, ents.GetAll() do

		if not v or not IsValid(v) or k < 1 then continue end

		local Class = v:GetClass()
		if SpawnClasses[Class] then
			Spawns[#Spawns+1] =  v
		end

	end

end

function GM:PlayerShouldTakeDamage(ply, atk)
	if aowl and ply.Unrestricted then
		return false
	end

	if ply == atk then
		return true
	end

	for k, v in next, ents.FindInSphere(ply:GetPos(), 256) do
		local Class = v:GetClass()

		if SpawnClasses[Class] then
			if BaseWars.Ents:ValidPlayer(atk) then
				atk:Notify(BaseWars.LANG.SpawnKill, BASEWARS_NOTIFICATION_ERROR)
			end

			return false
		end
	end

	for k, v in next, ents.FindInSphere(atk:GetPos(), 256) do
		local Class = v:GetClass()

		if SpawnClasses[Class] then
			if BaseWars.Ents:ValidPlayer(atk) then
				atk:Notify(BaseWars.LANG.SpawnCamp, BASEWARS_NOTIFICATION_ERROR)
			end
			
			return false
		end
	end

	return true
end

function GM:PostPlayerDeath(ply)
	local Weapons = ply:GetWeapons()

	for k, wep in next, Weapons do
		if not BaseWars.Ents:Valid(wep) then return end

		local Model = wep:GetModel()
		local Class = wep:GetClass()

		if BaseWars.Config.WeaponDropBlacklist[Class] then
			continue
		end

		local SpawnPos = ply:GetPos() + BaseWars.Config.SpawnOffset
		local SpawnAng = Angle(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))

		local Ent = ents.Create("bw_weapon")
		Ent.WeaponClass = Class
		Ent.Model = Model
		Ent:SetPos(SpawnPos)
		Ent:SetAngles(SpawnAng)
		Ent:Spawn()
		Ent:Activate()
	end
end

function GM:PlayerDisconnected(ply)
	BaseWars.UTIL.ClearRollbackFile(ply)
	self.BaseClass:PlayerDisconnected(ply)
end

function GM:Think()
	local State = self.BaseClass:Think()
	if ( CurTime() - LastThink ) > 5 then
		BaseWars.UTIL.WriteCrashRollback()

		if BaseWars.Config.SpawnBuilding == 0 then
			return
		end

		for k, s in next, Spawns do
			if not s or not IsValid(s) then
				ScanEntities()
				return State
			end

			local Ents = ents.FindInSphere(s:GetPos(), 256)
			if #Ents < 2 then
				continue
			end

			for _, v in next, Ents do
				if v.BeingRemoved or v.NoFizz then
					continue
				end

				local Owner = v:CPPIGetOwner()

				if not Owner or not IsValid(Owner) or not Owner:IsPlayer() or (BaseWars.Config.SpawnBuilding == 1 and Owner:IsAdmin()) then
					continue
				end

				if v:GetClass() == "prop_physics" or v:GetClass() == "gmod_light" or v:GetClass() == "gmod_lamp" or v:GetClass() == "gmod_wheel" then
					v.BeingRemoved = true
					v:Remove()

					Owner:Notify(BaseWars.LANG.DontBuildSpawn, BASEWARS_NOTIFICATION_ERROR)
				end
			end
		end

		LastThink = CurTime()
	end

	return State
end

function GM:InitPostEntity()
	self.BaseClass:InitPostEntity()
	BaseWars.MySQL.Connect()
	ScanEntities()

	for k, v in next, ents.FindByClass("*door*") do
		v:Fire("unlock")
	end

	local Map = game.GetMap()
	if Map == "gm_excess_island" then
		local PortalBox = ents.GetMapCreatedEntity(2086)
		local On 		= false

		function BaseWars.ToggleMapPortal()
			if On then
				On = false
				PortalBox:Fire("InValue", "13")
			else
				On = true
				PortalBox:Fire("InValue", "12")
			end
		end
	else
		function BaseWars.ToggleMapPortal() end
	end

	BaseWars.UTIL.WriteCrashRollback(true)
end

function GM:PlayerSpawn(ply)
	self.BaseClass:PlayerSpawn(ply)
	self:SetPlayerSpeed(ply, BaseWars.Config.DefaultWalk, BaseWars.Config.DefaultRun)

	local Spawn = ply.SpawnPoint
	if BaseWars.Ents:Valid(Spawn) and (not Spawn.IsPowered or Spawn:IsPowered()) then
		ply:SetPos( Spawn:GetPos() + BaseWars.Config.Ents.SpawnPoint.Offset )
	end

	for k, v in next, BaseWars.Config.SpawnWeps do
		ply:Give(v)
	end

	if ply:HasWeapon("hands") then
		ply:SelectWeapon("hands")
	elseif ply:HasWeapon("none") then
		ply:SelectWeapon("none")
	end

	player_manager.SetPlayerClass(ply, "player_default")
end

local dist = 600 ^ 2
function GM:PlayerCanHearPlayersVoice(listen, talk)
    if listen:GetPos():DistToSqr(talk:GetPos()) > dist then
		return false
	end

    return true
end

