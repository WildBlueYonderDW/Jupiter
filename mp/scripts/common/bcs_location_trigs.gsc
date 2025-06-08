#using scripts\common\utility;
#using scripts\engine\utility;

#namespace bcs_location_trigs;

// Namespace bcs_location_trigs / scripts\common\bcs_location_trigs
// Params 0
// Checksum 0x0, Offset: 0x25fc
// Size: 0x5b
function bcs_location_trigs_init()
{
    assert( !isdefined( level.bcs_location_mappings ) );
    level.bcs_location_mappings = [];
    bcs_location_trigger_mapping();
    
    if ( isdefined( level.func_bcs_location_trigs ) )
    {
        [[ level.func_bcs_location_trigs ]]();
    }
    
    bcs_trigs_assign_aliases();
    level.bcs_location_mappings = undefined;
    anim.locationlastcallouttimes = [];
}

// Namespace bcs_location_trigs / scripts\common\bcs_location_trigs
// Params 0
// Checksum 0x0, Offset: 0x265f
// Size: 0x206
function bcs_trigs_assign_aliases()
{
    assert( !isdefined( anim.bcs_locations ) );
    anim.bcs_locations = [];
    trigs = getentarray( "trigger_multiple", "code_classname" );
    location_triggers = [];
    
    foreach ( trig in trigs )
    {
        if ( !issubstr( trig.classname, "trigger_multiple_bcs" ) )
        {
            continue;
        }
        
        if ( isdefined( level.mapname ) && level.mapname == "mp_crash2" && trig.classname == "trigger_multiple_bcs_dronecrash" )
        {
            continue;
        }
        
        location_triggers[ location_triggers.size ] = trig;
        
        if ( !isdefined( level.bcs_location_mappings[ trig.classname ] ) )
        {
            println( "<dev string:x1c>" + trig.classname + "<dev string:x4e>" + trig.origin );
            continue;
        }
        
        if ( trig.classname == "trigger_multiple_bcs_kvp" )
        {
            assertex( isdefined( trig.script_location ), "<dev string:x56>" );
            locationstr = trig.script_location;
        }
        else
        {
            assertex( !isdefined( trig.script_location ), "<dev string:xac>" + trig.classname );
            locationstr = level.bcs_location_mappings[ trig.classname ];
        }
        
        aliases = parselocationaliases( locationstr );
        
        if ( aliases.size > 1 )
        {
            aliases = array_randomize( aliases );
        }
        
        trig.locationaliases = aliases;
        
        if ( trig.spawnflags & 1 )
        {
            trig.islandmark = 1;
        }
    }
    
    anim.bcs_locations = location_triggers;
}

// Namespace bcs_location_trigs / scripts\common\bcs_location_trigs
// Params 1
// Checksum 0x0, Offset: 0x286d
// Size: 0x23
function parselocationaliases( locationstr )
{
    locationaliases = strtok( locationstr, " " );
    return locationaliases;
}

// Namespace bcs_location_trigs / scripts\common\bcs_location_trigs
// Params 2
// Checksum 0x0, Offset: 0x2899
// Size: 0x11a
function add_bcs_location_mapping( classname, alias )
{
    if ( isdefined( level.bcs_location_mappings[ classname ] ) )
    {
        existing = level.bcs_location_mappings[ classname ];
        existingarr = parselocationaliases( existing );
        aliases = parselocationaliases( alias );
        
        foreach ( a in aliases )
        {
            foreach ( e in existingarr )
            {
                if ( a == e )
                {
                    return;
                }
            }
        }
        
        existing += " " + alias;
        level.bcs_location_mappings[ classname ] = existing;
        return;
    }
    
    level.bcs_location_mappings[ classname ] = alias;
}

// Namespace bcs_location_trigs / scripts\common\bcs_location_trigs
// Params 0
// Checksum 0x0, Offset: 0x29bb
// Size: 0x3b
function bcs_location_trigger_mapping()
{
    add_bcs_location_mapping( "trigger_multiple_bcs_kvp", "" );
    
    if ( utility::issp() )
    {
        sp();
        sp_embassy();
        sp_lab();
        return;
    }
    
    mp_callouts();
}

// Namespace bcs_location_trigs / scripts\common\bcs_location_trigs
// Params 0
// Checksum 0x0, Offset: 0x29fe
// Size: 0x8a4
function sp()
{
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_1stfloor", "1stfloor" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_2ndfloor", "2ndfloor" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_3rdfloor", "3rdfloor" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_4thfloor", "4thfloor" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_5thfloor", "5thfloor" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_alcove", "alcove" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_alley", "alley" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_balcony", "balcony" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_bar", "bar" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_barrel", "barrel" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_barrels", "barrels" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_barrels_blue", "barrelsblue" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_barrier", "barrier" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_barrier_concrete", "barrierconcrete" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_bathroom", "bathroom" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_bedroom", "bedroom" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_chair", "chair" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_couch", "couch" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_counter", "counter" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_desk", "desk" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_doorway", "doorway" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_groundfloor", "groundfloor" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_stairs", "stairs" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_upstairs", "upstairs" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_window", "window" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_building_top", "buildingtop" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_catwalk", "catwalk" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_entrance", "entrance" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_exterior", "exterior" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_frontdoors", "frontdoors" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_patio", "patio" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_railing", "railing" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_roof", "roof" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_scaffolding", "scaffolding" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_siloontop", "siloontop" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_silos", "silos" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_closet", "closet" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_diningroom", "diningroom" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_hallway", "hallway" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_interior", "interior" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_kitchen", "kitchen" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_livingroom", "livingroom" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_lobby", "lobby" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_room", "room" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_waitingroom", "waitingroom" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_btwnbuildings", "btwnbuildings" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_building", "building" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_bunker", "bunker" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_cafe", "cafe" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_church", "church" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_clocktower", "clocktower" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_compound", "compound" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_container", "container" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_container_shipping", "containershipping" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_corner", "corner" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_corridor", "corridor" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_courtyard", "courtyard" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_crypt", "crypt" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_field", "field" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_garage", "garage" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_garden", "garden" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_grass", "grass" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_graveyard", "graveyard" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_greenhouse", "greenhouse" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_hangar", "hangar" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_hospital", "hospital" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_house", "house" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_lake", "lake" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_loadingdock", "loadingdock" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_mansion", "mansion" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_mgnest", "mgnest" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_office", "office" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_parkinglot", "parkinglot" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_perimeter", "perimeter" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_pool", "pool" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_poolhouse", "poolhouse" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_ridge", "ridge" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_road", "road" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_sidewalk", "sidewalk" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_street", "street" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_tarmac", "tarmac" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_tower", "tower" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_brick_stack", "bricksstack" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_bushes", "bushes" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_crate", "crate" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_crates", "crates" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_cratesammo", "cratesammo" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_debris", "debris" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_dumpster", "dumpster" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_fence", "fence" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_haybale", "haybale" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_hesco", "hesco" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_ladder", "ladder" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_pillar", "pillar" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_planter", "planter" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_pooltable", "pooltable" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_rubble", "rubble" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_sandbags", "sandbags" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_shelves", "shelves" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_table", "table" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_trash", "trash" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_trash_can", "trashcan" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_tree", "tree" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_trees", "trees" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_turbine", "turbine" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_turbines", "turbines" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_wall", "wall" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_wall_block", "wallblock" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_wall_brick", "wallbrick" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_bulldozer", "bulldozer" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_bus", "bus" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_car", "car" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_car_black", "carblack" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_car_blue", "carblue" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_car_destroyed", "cardestroyed" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_car_green", "cargreen" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_car_grey", "cargrey" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_car_red", "carred" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_car_silver", "carsilver" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_car_white", "carwhite" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_forklift", "forklift" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_pickup", "pickup" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_policecar", "policecar" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_tactical", "tactical" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_tank_destroyed", "tankdestroyed" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_truck", "truck" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_truck_destroyed", "truckdestroyed" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_truck_green", "truckgreen" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_truck_white", "truckwhite" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_van", "van" );
}

// Namespace bcs_location_trigs / scripts\common\bcs_location_trigs
// Params 0
// Checksum 0x0, Offset: 0x32aa
// Size: 0x68
function sp_embassy()
{
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_embassy_compound", "compound" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_embassy_dirtmound", "dirtmound" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_embassy_metalcart", "metalcart" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_embassy_tirestack", "tirestack" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_embassy_field", "field" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_embassy_pillars", "pillars" );
}

// Namespace bcs_location_trigs / scripts\common\bcs_location_trigs
// Params 0
// Checksum 0x0, Offset: 0x331a
// Size: 0x35
function sp_lab()
{
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_lab_object_turbine", "turbine" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_lab_area_turbineroom", "turbineroom" );
    add_bcs_location_mapping( "trigger_multiple_bcs_sp_lab_object_gastanks", "gastanks" );
}

// Namespace bcs_location_trigs / scripts\common\bcs_location_trigs
// Params 0
// Checksum 0x0, Offset: 0x3357
// Size: 0x475
function mp_callouts()
{
    add_bcs_location_mapping( "trigger_multiple_bcs_backalley", "backalley" );
    add_bcs_location_mapping( "trigger_multiple_bcs_barbershop", "barbershop" );
    add_bcs_location_mapping( "trigger_multiple_bcs_barn", "barn" );
    add_bcs_location_mapping( "trigger_multiple_bcs_barrel", "barrel" );
    add_bcs_location_mapping( "trigger_multiple_bcs_bazaar", "bazaar" );
    add_bcs_location_mapping( "trigger_multiple_bcs_boilerroom", "boilerroom" );
    add_bcs_location_mapping( "trigger_multiple_bcs_bridge", "bridge" );
    add_bcs_location_mapping( "trigger_multiple_bcs_buses", "buses" );
    add_bcs_location_mapping( "trigger_multiple_bcs_cafe", "cafe" );
    add_bcs_location_mapping( "trigger_multiple_bcs_canalstreete", "canalstreet" );
    add_bcs_location_mapping( "trigger_multiple_bcs_caveentrance", "caveentrance" );
    add_bcs_location_mapping( "trigger_multiple_bcs_center", "center" );
    add_bcs_location_mapping( "trigger_multiple_bcs_checkpoint", "checkpoint" );
    add_bcs_location_mapping( "trigger_multiple_bcs_showers", "showers" );
    add_bcs_location_mapping( "trigger_multiple_bcs_chickens", "chickens" );
    add_bcs_location_mapping( "trigger_multiple_bcs_church", "church" );
    add_bcs_location_mapping( "trigger_multiple_bcs_compound", "compound" );
    add_bcs_location_mapping( "trigger_multiple_bcs_construction", "construction" );
    add_bcs_location_mapping( "trigger_multiple_bcs_containers", "containers" );
    add_bcs_location_mapping( "trigger_multiple_bcs_container", "container" );
    add_bcs_location_mapping( "trigger_multiple_bcs_courtyard", "courtyard" );
    add_bcs_location_mapping( "trigger_multiple_bcs_crossroads", "crossroads" );
    add_bcs_location_mapping( "trigger_multiple_bcs_destroyedbldg", "destroyedbldg" );
    add_bcs_location_mapping( "trigger_multiple_bcs_dronecrash", "dronecrash" );
    add_bcs_location_mapping( "trigger_multiple_bcs_dumpster", "dumpster" );
    add_bcs_location_mapping( "trigger_multiple_bcs_electronicstore", "electronicstore" );
    add_bcs_location_mapping( "trigger_multiple_bcs_elevator", "elevator" );
    add_bcs_location_mapping( "trigger_multiple_bcs_fob", "fob" );
    add_bcs_location_mapping( "trigger_multiple_bcs_forklift", "forklift" );
    add_bcs_location_mapping( "trigger_multiple_bcs_graveyard", "graveyard" );
    add_bcs_location_mapping( "trigger_multiple_bcs_garage", "garage" );
    add_bcs_location_mapping( "trigger_multiple_bcs_gunshop", "gunshop" );
    add_bcs_location_mapping( "trigger_multiple_bcs_hazmatbldg", "hazmatbldg" );
    add_bcs_location_mapping( "trigger_multiple_bcs_hotel", "hotel" );
    add_bcs_location_mapping( "trigger_multiple_bcs_junkyard", "junkyard" );
    add_bcs_location_mapping( "trigger_multiple_bcs_launchers", "launchers" );
    add_bcs_location_mapping( "trigger_multiple_bcs_laundromat", "laundromat" );
    add_bcs_location_mapping( "trigger_multiple_bcs_mainstreet", "mainstreet" );
    add_bcs_location_mapping( "trigger_multiple_bcs_minecarts", "minecarts" );
    add_bcs_location_mapping( "trigger_multiple_bcs_office", "office" );
    add_bcs_location_mapping( "trigger_multiple_bcs_palacedome", "palacedome" );
    add_bcs_location_mapping( "trigger_multiple_bcs_playground", "playground" );
    add_bcs_location_mapping( "trigger_multiple_bcs_poolhall", "poolhall" );
    add_bcs_location_mapping( "trigger_multiple_bcs_restaurant", "restaurant" );
    add_bcs_location_mapping( "trigger_multiple_bcs_riverbed", "riverbed" );
    add_bcs_location_mapping( "trigger_multiple_bcs_rugshop", "rugshop" );
    add_bcs_location_mapping( "trigger_multiple_bcs_scaffold", "scaffold" );
    add_bcs_location_mapping( "trigger_multiple_bcs_school", "school" );
    add_bcs_location_mapping( "trigger_multiple_bcs_shantytown", "shantytown" );
    add_bcs_location_mapping( "trigger_multiple_bcs_shippingarea", "shippingarea" );
    add_bcs_location_mapping( "trigger_multiple_bcs_shops", "shops" );
    add_bcs_location_mapping( "trigger_multiple_bcs_showers", "showers" );
    add_bcs_location_mapping( "trigger_multiple_bcs_smokestack", "smokestack" );
    add_bcs_location_mapping( "trigger_multiple_bcs_soapshop", "soapshop" );
    add_bcs_location_mapping( "trigger_multiple_bcs_stonebridge", "stonebridge" );
    add_bcs_location_mapping( "trigger_multiple_bcs_swimmingpool", "swimmingpool" );
    add_bcs_location_mapping( "trigger_multiple_bcs_taxibldg", "taxibldg" );
    add_bcs_location_mapping( "trigger_multiple_bcs_tireshop", "tireshop" );
    add_bcs_location_mapping( "trigger_multiple_bcs_tower", "tower" );
    add_bcs_location_mapping( "trigger_multiple_bcs_traintracks", "traintracks" );
    add_bcs_location_mapping( "trigger_multiple_bcs_tramstation", "tramstation" );
    add_bcs_location_mapping( "trigger_multiple_bcs_trench", "trench" );
    add_bcs_location_mapping( "trigger_multiple_bcs_warehouse", "warehouse" );
    add_bcs_location_mapping( "trigger_multiple_bcs_watertower", "watertower" );
    add_bcs_location_mapping( "trigger_multiple_bcs_windmill", "windmill" );
    add_bcs_location_mapping( "trigger_multiple_bcs_woods", "woods" );
    add_bcs_location_mapping( "trigger_multiple_bcs_yellowbldg", "yellowbldg" );
}

