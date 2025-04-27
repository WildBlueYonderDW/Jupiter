#using script_18ae04893bb2f9ac;
#using script_228478d4175cb3b9;
#using script_31e1ae5e1ddce676;
#using script_3bdd48aafc976300;
#using script_5ef6975905ae15bf;
#using script_66df092e7e148d2f;
#using script_6e32c3e5e141c690;
#using script_7c390291bf40788f;
#using scripts\common\utility;
#using scripts\cp\cp_outofbounds;
#using scripts\cp\damagefeedback;
#using scripts\cp\utility;
#using scripts\cp\vehicles\damage_cp;
#using scripts\cp\vehicles\vehicle_compass_cp;
#using scripts\cp\vehicles\vehicle_damage_cp;
#using scripts\cp\vehicles\vehicle_interact_cp;
#using scripts\cp\vehicles\vehicle_occupancy_cp;
#using scripts\cp\vehicles\vehicle_oob_cp;
#using scripts\cp\vehicles\vehicle_spawn_cp;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\cp_mp\vehicles\vehicle_damage;
#using scripts\cp_mp\vehicles\vehicle_mines;
#using scripts\cp_mp\vehicles\vehicle_spawn;
#using scripts\engine\utility;

#namespace vehicle_cp;

// Namespace vehicle_cp / scripts\cp\vehicles\vehicle_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x309
// Size: 0x1c8
function vehicle_cp_init()
{
    scripts\engine\utility::registersharedfunc( "vehicle", "create", &vehicle_cp_create );
    scripts\engine\utility::registersharedfunc( "vehicle", "createLate", &vehicle_cp_createlate );
    scripts\engine\utility::registersharedfunc( "vehicle", "deleteNextFrame", &vehicle_cp_deletenextframe );
    scripts\engine\utility::registersharedfunc( "vehicle", "deleteNextFrameLate", &vehicle_cp_deletenextframelate );
    scripts\engine\utility::registersharedfunc( "vehicle", "createHint", &scripts\cp\utility::createhintobject );
    scripts\engine\utility::registersharedfunc( "vehicle_interact", "init", &scripts\cp\vehicles\vehicle_interact_cp::vehicle_interact_cp_init );
    scripts\engine\utility::registersharedfunc( "vehicle_occupancy", "init", &scripts\cp\vehicles\vehicle_occupancy_cp::vehicle_occupancy_cp_init );
    scripts\engine\utility::registersharedfunc( "vehicle_spawn", "init", &scripts\cp\vehicles\vehicle_spawn_cp::vehicle_spawn_cp_init );
    scripts\engine\utility::registersharedfunc( "vehicle_compass", "init", &scripts\cp\vehicles\vehicle_compass_cp::vehicle_compass_cp_init );
    scripts\engine\utility::registersharedfunc( "vehicle_damage", "init", &scripts\cp\vehicles\vehicle_damage_cp::vehicle_damage_cp_init );
    scripts\engine\utility::registersharedfunc( "veh9_rhib", "init", &namespace_d8a94de1eaf55642::function_944a2eb36063f641 );
    scripts\engine\utility::registersharedfunc( "veh9_jltv", "init", &namespace_b66b4ef2e3a7020d::function_52b33e520a612e1c );
    scripts\engine\utility::registersharedfunc( "veh9_jltv_mg", "init", &namespace_f5874001d201a304::function_d06448e049fab02f );
    scripts\engine\utility::registersharedfunc( "veh9_palfa", "init", &namespace_b0ffbd8b9a4c0b87::function_59eb5f2de04c842a );
    scripts\engine\utility::registersharedfunc( "veh9_patrol_boat", "init", &namespace_855ebb0984f091f0::function_6e5970ec1a994b0b );
    scripts\engine\utility::registersharedfunc( "veh9_suv_1996", "init", &namespace_8600c6128c661c9f::function_7fbb4bdc170016b2 );
    scripts\engine\utility::registersharedfunc( "veh9_sedan_hatchback_1985", "init", &namespace_50d0b417576cdea4::function_f8cd879642397a71 );
    scripts\engine\utility::registersharedfunc( "veh9_mil_cargo_truck", "init", &namespace_cb8c441d992fbeff::function_974dace3684b9e9b );
    scripts\cp\vehicles\damage_cp::init();
    scripts\cp\vehicles\vehicle_oob_cp::vehicle_oob_cp_init();
    scripts\engine\utility::registersharedfunc( "veh9_techo_rebel_armor", "armorDamageFeedback", &scripts\cp\damagefeedback::function_cb98b2b16c183664 );
    scripts\engine\utility::registersharedfunc( "veh9_techo_rebel_armor", "armorDeathFeedback", &scripts\cp\damagefeedback::function_974320dd370c5572 );
}

// Namespace vehicle_cp / scripts\cp\vehicles\vehicle_cp
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x4d9
// Size: 0x140
function spawn_script_model_at_pos( posindex, tag, animname, xanim, model )
{
    assertex( !istrue( self.usedpositions[ posindex ] ), "Trying to assign to a position already in use" );
    spawnorg = self gettagorigin( tag );
    spawnang = self gettagangles( tag );
    startorg = getstartorigin( spawnorg, spawnang, xanim );
    startangles = getstartangles( spawnorg, spawnang, xanim );
    spawned = spawn( "script_model", startorg );
    spawned.angles = startangles;
    spawned setmodel( model );
    spawned linkto( self );
    
    if ( isdefined( animname ) )
    {
        spawned scriptmodelplayanim( animname );
    }
    
    spawned.vehicle_position = posindex;
    spawned.disable_gun_recall = 1;
    self.attachedguys[ self.attachedguys.size ] = spawned;
    self.usedpositions[ posindex ] = 1;
    self.riders[ self.riders.size ] = spawned;
    
    if ( posindex == 0 )
    {
        self.driver = spawned;
    }
    
    return spawned;
}

// Namespace vehicle_cp / scripts\cp\vehicles\vehicle_cp
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x622
// Size: 0x10e
function spawn_vehicle_accessory( model, on_tag, origin_offset, angles_offset )
{
    var_c6296a5ec3b3611e = spawn( "script_model", self.origin );
    var_c6296a5ec3b3611e setmodel( model );
    var_c6296a5ec3b3611e notsolid();
    var_c6296a5ec3b3611e show();
    
    if ( !isdefined( origin_offset ) )
    {
        origin_offset = ( 0, 0, 0 );
    }
    
    if ( !isdefined( angles_offset ) )
    {
        angles_offset = ( 0, 0, 0 );
    }
    
    tag = "tag_origin";
    
    if ( isdefined( on_tag ) )
    {
        tag = on_tag;
    }
    
    tagorigin = self gettagorigin( tag );
    
    if ( isdefined( tagorigin ) )
    {
        var_c6296a5ec3b3611e linkto( self, tag, origin_offset, angles_offset );
    }
    else
    {
        var_c6296a5ec3b3611e linkto( self );
    }
    
    var_c6296a5ec3b3611e.targetname = self.targetname + "_accessory";
    
    if ( !isdefined( self.accessories ) )
    {
        self.accessories = [];
    }
    
    self.accessories[ self.accessories.size ] = var_c6296a5ec3b3611e;
    return var_c6296a5ec3b3611e;
}

// Namespace vehicle_cp / scripts\cp\vehicles\vehicle_cp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x739
// Size: 0x14b
function vehicle_cp_create( vehicle, spawndata )
{
    vehicle.bshouldoccupantsbeignored = 0;
    vehicle.lastkilltime = 0;
    vehicle.killedplayers = [];
    vehicle.killedby = [];
    vehicle.lastkilledby = undefined;
    vehicle.greatestuniqueplayerkills = 0;
    vehicle.damagedplayers = [];
    vehicle.lastkilltime = 0;
    vehicle.lastkilldogtime = 0;
    vehicle.recentkillcount = 0;
    vehicle.recentdefendcount = 0;
    vehicle.kills = 0;
    vehicle.deaths = 0;
    vehicle.pers[ "cur_kill_streak" ] = 0;
    vehicle.pers[ "cur_death_streak" ] = 0;
    vehicle.pers[ "cur_kill_streak_for_nuke" ] = 0;
    vehicle.tookweaponfrom = [];
    vehicle.guid = vehicle getentitynumber();
    vehicle.maxhealth = scripts\cp_mp\vehicles\vehicle_damage::vehicle_damage_getmaxhealth( vehicle );
    vehicle.health = vehicle.maxhealth;
    scripts\cp\cp_outofbounds::registerentforoob( vehicle, vehicle scripts\cp_mp\vehicles\vehicle::function_d93ec4635290febd() );
}

// Namespace vehicle_cp / scripts\cp\vehicles\vehicle_cp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x88c
// Size: 0x13
function vehicle_cp_createlate( vehicle, spawndata )
{
    
}

// Namespace vehicle_cp / scripts\cp\vehicles\vehicle_cp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8a7
// Size: 0x15
function vehicle_cp_deletenextframe( vehicle )
{
    scripts\cp\cp_outofbounds::clearoob( vehicle, 1 );
}

// Namespace vehicle_cp / scripts\cp\vehicles\vehicle_cp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8c4
// Size: 0xb
function vehicle_cp_deletenextframelate( vehicle )
{
    
}

