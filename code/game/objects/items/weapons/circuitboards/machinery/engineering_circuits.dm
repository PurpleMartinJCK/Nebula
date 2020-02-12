/obj/item/stock_parts/circuitboard/floodlight
	name = T_BOARD("emergency floodlight")
	build_path = /obj/machinery/floodlight
	board_type = "machine"
	origin_tech = "{'" + TECH_ENGINEERING + "':1}"
	req_components = list(
		/obj/item/stack/cable_coil = 10)
	additional_spawn_components = list(
		/obj/item/stock_parts/capacitor = 1,
		/obj/item/stock_parts/power/battery/buildable/crap = 1,
		/obj/item/cell/crap = 1)

/obj/item/stock_parts/circuitboard/pipedispensor
	name = T_BOARD("pipe dispenser")
	build_path = /obj/machinery/fabricator/pipe
	board_type = "machine"
	origin_tech = "{'" + TECH_ENGINEERING + "':6,'" + TECH_MATERIAL + "':5}"
	req_components = list(
		/obj/item/stock_parts/manipulator = 1,
		/obj/item/stock_parts/matter_bin = 2,
		/obj/item/rcd_ammo/large = 2)
	additional_spawn_components = list(
		/obj/item/stock_parts/keyboard = 1,
		/obj/item/stock_parts/power/apc/buildable = 1)

/obj/item/stock_parts/circuitboard/pipedispensor/disposal
	name = T_BOARD("disposal pipe dispenser")
	build_path = /obj/machinery/fabricator/pipe/disposal