#using scripts\common\utility;
#using scripts\cp\laststand;
#using scripts\cp\utility;
#using scripts\cp\utility\player;
#using scripts\cp\utility\spawn_event_aggregator;
#using scripts\cp\weapon;
#using scripts\cp_mp\factions;
#using scripts\cp_mp\talking_gun;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\weapon;
#using scripts\engine\math;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace cp_player_battlechatter;

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1822
// Size: 0x4be
function init()
{
    level.battlechatterenabled = getdvarint( @"hash_7bdf6d033065ef17", 1 ) == 1;
    level.killstreakdeploystartbcfunc = &onkillstreakdeploy;
    level.speakers = [];
    level.bcinfo = [];
    level.bcinfo[ "max_wait_time" ] = 1000;
    level.bcinfo[ "soundEventHistory" ] = [];
    content = [ "physicscontents_clipshot", "physicscontents_missileclip", "physicscontents_vehicle", "physicscontents_characterproxy", "physicscontents_glass", "physicscontents_itemclip" ];
    level.var_c49bb6749e2ce50c = physics_createcontents( content );
    
    foreach ( teamname in level.teamnamelist )
    {
        level.isteamspeaking[ teamname ] = 0;
        level.speakers[ teamname ] = [];
        level.bcinfo[ "queued" ][ teamname ] = "none";
    }
    
    setupselfvo();
    registerbcsoundtype( #"callout_location", undefined, 1, 1, 10, 10, 0 );
    scriptbundlename = "battlechatter_list";
    
    if ( getdvarint( @"t10" ) > 0 )
    {
        scriptbundlename += "_iw9_cp";
    }
    else
    {
        scriptbundlename += "_iw9_cp";
    }
    
    function_9cd008247ba86bcd();
    registerbcsoundtype( #"callout_location", undefined, 1, 1, 10, 10, 0 );
    bundle = getscriptbundle( "battlechatterlist:" + scriptbundlename );
    
    if ( isdefined( bundle ) )
    {
        foreach ( event in bundle.battlechatterevents )
        {
            eventname = event.eventname;
            var_4f632c1568af9fc0 = event.soundevent;
            priority = event.priority;
            chance = event.chance;
            timeoutpos = event.timeoutpos;
            timeoutspeaker = event.timeoutspeaker;
            var_3910458d599e5e01 = event.var_3910458d599e5e01;
            registerbcsoundtype( eventname, var_4f632c1568af9fc0, priority, chance, timeoutpos, timeoutspeaker, var_3910458d599e5e01 );
        }
        
        foreach ( event in bundle.pingevents )
        {
            eventname = event.eventname;
            var_4f632c1568af9fc0 = event.soundevent;
            priority = event.priority;
            chance = event.chance;
            timeoutpos = event.timeoutpos;
            timeoutspeaker = event.timeoutspeaker;
            var_3910458d599e5e01 = event.var_3910458d599e5e01;
            registerbcsoundtype( eventname, var_4f632c1568af9fc0, priority, chance, timeoutpos, timeoutspeaker, var_3910458d599e5e01 );
        }
    }
    
    gametype = getdvar( @"g_gametype" );
    level.istactical = 1;
    
    if ( gametype == "war" || gametype == "kc" || gametype == "dom" || gametype == "cmd" || gametype == "arm" )
    {
        level.istactical = 0;
    }
    
    scripts\cp\utility\spawn_event_aggregator::registeronplayerspawncallback( &onplayerspawned );
    
    if ( !isdefined( game[ "allies" ] ) )
    {
        game[ "allies" ] = "SAS";
    }
    
    if ( !isdefined( game[ "axis" ] ) )
    {
        game[ "axis" ] = "RUSF";
    }
    
    if ( !isdefined( game[ "team_three" ] ) )
    {
        game[ "team_three" ] = "USMC";
    }
    
    if ( !isdefined( game[ "team_four" ] ) )
    {
        game[ "team_four" ] = "SABF";
    }
    
    if ( !isdefined( game[ "team_five" ] ) )
    {
        game[ "team_five" ] = "SAS";
    }
    
    if ( !isdefined( game[ "team_six" ] ) )
    {
        game[ "team_six" ] = "RUSF";
    }
    
    /#
        setdevdvarifuninitialized( @"hash_611f04c407c3f644", "<dev string:x1c>" );
        setdevdvarifuninitialized( @"hash_9627c73338f91622", "<dev string:x1c>" );
        setdevdvarifuninitialized( @"hash_3cb0b3f110a54cf2", "<dev string:x20>" );
    #/
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1ce8
// Size: 0x4a6
function private function_9cd008247ba86bcd()
{
    function_4c2643be02acc9d2( "ping_objective_go_flag" );
    function_4c2643be02acc9d2( "ping_enemy_killed" );
    function_4c2643be02acc9d2( "ping_inv_need_gun" );
    function_4c2643be02acc9d2( "ping_objective_destroy_generic" );
    function_4c2643be02acc9d2( "ping_loot_confirm_ammo" );
    function_4c2643be02acc9d2( "ping_inv_need_smallcal" );
    function_4c2643be02acc9d2( "ping_inv_need_launcher" );
    function_4c2643be02acc9d2( "ping_loot_confirm_selfrevive" );
    function_4c2643be02acc9d2( "ping_request_revive" );
    function_4c2643be02acc9d2( "ping_request_assimilation_deny" );
    function_4c2643be02acc9d2( "ping_request_assimilation_join_me" );
    function_4c2643be02acc9d2( "ping_social_seeyoulater" );
    function_4c2643be02acc9d2( "ping_contract_trap_alarm" );
    function_4c2643be02acc9d2( "ping_enemy_downed" );
    function_4c2643be02acc9d2( "ping_location_regroup" );
    function_4c2643be02acc9d2( "ping_buystation_request_revive" );
    function_4c2643be02acc9d2( "ping_help_interrogate" );
    function_4c2643be02acc9d2( "ping_contract_confirm_mostwanted" );
    function_4c2643be02acc9d2( "ping_contract_confirm_hunt" );
    function_4c2643be02acc9d2( "ping_contract_confirm_hostage" );
    function_4c2643be02acc9d2( "ping_location_looted" );
    function_4c2643be02acc9d2( "ping_need_killstreak" );
    function_4c2643be02acc9d2( "ping_objective_defend_generic" );
    function_4c2643be02acc9d2( "ping_inv_need_cash" );
    function_4c2643be02acc9d2( "ping_inv_need_armor" );
    function_4c2643be02acc9d2( "ping_loot_confirm_armor" );
    function_4c2643be02acc9d2( "ping_loot_confirm_weapon" );
    function_4c2643be02acc9d2( "ping_enemy_sniper" );
    function_4c2643be02acc9d2( "ping_enemy_tier1" );
    function_4c2643be02acc9d2( "ping_gulag_escape_hatch" );
    function_4c2643be02acc9d2( "ping_gulag_escaped" );
    function_4c2643be02acc9d2( "ping_inv_have_ammo_shotgun" );
    function_4c2643be02acc9d2( "ping_enemy_tier3" );
    function_4c2643be02acc9d2( "ping_vehicle_husk_generic" );
    function_4c2643be02acc9d2( "ping_vehicle_gunner" );
    function_4c2643be02acc9d2( "ping_killstreak_juggernaut" );
    function_4c2643be02acc9d2( "ping_vehicle_bailout" );
    function_4c2643be02acc9d2( "ping_killstreak_choppergunner_hostile" );
    function_4c2643be02acc9d2( "ping_inv_have_weapon_dmr" );
    function_4c2643be02acc9d2( "ping_inv_have_ammo_launcher" );
    function_4c2643be02acc9d2( "ping_vehicle_husk_danger_generic" );
    function_4c2643be02acc9d2( "ping_loot_confirm_generic" );
    function_4c2643be02acc9d2( "ping_vehicle_danger_generic" );
    function_4c2643be02acc9d2( "ping_enemy_interrogate" );
    function_4c2643be02acc9d2( "ping_inv_have_weapon_sniper" );
    function_4c2643be02acc9d2( "ping_enemy_mountedturret" );
    function_4c2643be02acc9d2( "ping_request_assimilation_confirm" );
    function_4c2643be02acc9d2( "ping_request_leaveme_confirm" );
    function_4c2643be02acc9d2( "ping_objective_go_device" );
    function_4c2643be02acc9d2( "ping_social_goodjob" );
    function_4c2643be02acc9d2( "ping_request_assimilation_join_other" );
    function_4c2643be02acc9d2( "ping_loot_confirm_gasmask" );
    function_4c2643be02acc9d2( "ping_loot_confirm_fieldupgrade" );
    function_4c2643be02acc9d2( "ping_loot_confirm_medical" );
    function_4c2643be02acc9d2( "ping_location_landing" );
    function_4c2643be02acc9d2( "ping_location_help" );
    function_4c2643be02acc9d2( "ping_request_leaveme" );
    function_4c2643be02acc9d2( "ping_inv_have_weapon_assaultrifle" );
    function_4c2643be02acc9d2( "ping_loot_confirm_buzzsaw" );
    function_4c2643be02acc9d2( "ping_social_commend" );
    function_4c2643be02acc9d2( "ping_social_goodgame" );
    function_4c2643be02acc9d2( "ping_contract_confirm_generic" );
    function_4c2643be02acc9d2( "ping_social_goodplay" );
    function_4c2643be02acc9d2( "ping_location_landing_confirm" );
    function_4c2643be02acc9d2( "ping_loot_killstreak_juggernaut_box" );
    function_4c2643be02acc9d2( "ping_location_visited" );
    function_4c2643be02acc9d2( "ping_inv_have_killstreak_generic" );
    function_4c2643be02acc9d2( "bc_status_player_respawn" );
    function_4c2643be02acc9d2( "bc_combat_inform_check_fire_ally" );
    function_4c2643be02acc9d2( "bc_combat_inform_taking_fire" );
    function_4c2643be02acc9d2( "bc_equipment_action_grenade_throwback" );
    function_4c2643be02acc9d2( "bc_status_inform_last_one" );
    function_4c2643be02acc9d2( "bc_fieldupgrade_action_battlerage" );
    function_4c2643be02acc9d2( "bc_status_player_last_stand" );
    function_4c2643be02acc9d2( "bc_equipment_action_grenade" );
    function_4c2643be02acc9d2( "bc_equipment_action_bandage" );
    function_4c2643be02acc9d2( "bc_combat_action_execution" );
    function_4c2643be02acc9d2( "bc_fieldupgrade_action_deadsilence" );
    function_4c2643be02acc9d2( "bc_combat_killfirm_infantry" );
    function_4c2643be02acc9d2( "bc_status_player_revived" );
    function_4c2643be02acc9d2( "bc_status_player_selfrevived" );
    function_4c2643be02acc9d2( "bc_status_action_reviving" );
    function_4c2643be02acc9d2( "bc_fieldupgrade_action_aprounds" );
    function_4c2643be02acc9d2( "bc_status_player_low_health" );
    function_4c2643be02acc9d2( "bc_status_player_recover" );
    function_4c2643be02acc9d2( "bc_flavor_player_awesome" );
    function_4c2643be02acc9d2( "bc_flavor_player_suppressed" );
    function_4c2643be02acc9d2( "bc_killstreak_killfirm_juggernaut" );
    function_4c2643be02acc9d2( "bc_flavor_player_closecall" );
    function_4c2643be02acc9d2( "bc_flavor_player_negative" );
    function_4c2643be02acc9d2( "bc_flavor_player_save" );
    function_4c2643be02acc9d2( "bc_flavor_player_revenge" );
    function_4c2643be02acc9d2( "bc_flavor_player_surprise" );
    function_4c2643be02acc9d2( "bc_vehicle_killfirm_jetski" );
    function_4c2643be02acc9d2( "bc_flavor_player_headshotlong" );
    function_4c2643be02acc9d2( "bc_flavor_player_positive" );
    function_4c2643be02acc9d2( "bc_killstreak_action_nuke" );
    function_4c2643be02acc9d2( "bc_equipment_action_stim" );
    function_4c2643be02acc9d2( "bc_killstreak_action_juggernaut" );
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2196
// Size: 0x56
function private function_4c2643be02acc9d2( eventname )
{
    assertex( isstring( eventname ), "Expects 'eventName' to hold an string value." );
    
    if ( !isdefined( level.battlechatterfilter ) )
    {
        level.battlechatterfilter = [];
    }
    
    level.battlechatterfilter[ function_1823ff50bb28148d( eventname ) ] = hashcat( @"hash_ee1ba8e906086c3c", eventname );
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x21f4
// Size: 0x66, Type: bool
function private function_bc76cf7adda53de3( eventname )
{
    assertex( isxhash( eventname ), "Expects 'eventName' to hold an xhash value." );
    
    if ( isdefined( level.battlechatterfilter ) && isdefined( level.battlechatterfilter[ eventname ] ) )
    {
        return ( getdvarint( @"hash_a48e01ab7c276ef4", 0 ) != 0 || getdvarint( level.battlechatterfilter[ eventname ], 0 ) != 0 );
    }
    
    return false;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x2263
// Size: 0x145
function registerbcsoundtype( soundtype, var_4f632c1568af9fc0, priority, chance, timeoutpos, timeoutspeaker, var_3910458d599e5e01 )
{
    if ( !isdefined( soundtype ) )
    {
        assertmsg( "registerBCSoundType(): undefined soundType" );
        return;
    }
    
    if ( !isdefined( priority ) || priority == 1 )
    {
        priority = undefined;
    }
    
    if ( !isdefined( chance ) || chance == 0 || function_bc76cf7adda53de3( soundtype ) )
    {
        chance = undefined;
    }
    
    if ( !isdefined( timeoutpos ) || timeoutpos == 1 )
    {
        timeoutpos = undefined;
    }
    else
    {
        timeoutpos *= 1000;
    }
    
    if ( !isdefined( timeoutspeaker ) || timeoutspeaker == 1 )
    {
        timeoutspeaker = undefined;
    }
    else
    {
        timeoutspeaker *= 1000;
    }
    
    if ( !isdefined( var_3910458d599e5e01 ) || var_3910458d599e5e01 == 0 )
    {
        var_3910458d599e5e01 = undefined;
    }
    
    level.bcinfo[ "asset" ][ soundtype ] = var_4f632c1568af9fc0;
    level.bcinfo[ "priority" ][ soundtype ] = priority;
    level.bcinfo[ "chance" ][ soundtype ] = chance;
    level.bcinfo[ "timeout_pos" ][ soundtype ] = timeoutpos;
    level.bcinfo[ "timeout_player" ][ soundtype ] = timeoutspeaker;
    level.bcinfo[ "req_friendly" ][ soundtype ] = var_3910458d599e5e01;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23b0
// Size: 0x7f
function onplayerspawned()
{
    self.bcinfoqueued = "none";
    self.var_cf34556d563b92ae = 0;
    self.recentattackers = [];
    self.bcinfolastsaytimes = [];
    
    if ( level.splitscreen )
    {
        return;
    }
    
    if ( !level.teambased )
    {
        return;
    }
    
    if ( !runleanthreadmode() )
    {
        thread reloadtracking();
        thread threatcallouttracking();
        thread onsixfriendlytracking();
        thread handlehellodialog();
        return;
    }
    
    self.bcdisabled = 1;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2437
// Size: 0x6e
function hurtbadlywait()
{
    level endon( "game_ended" );
    self endon( "death_or_disconnect" );
    self endon( "bc_damage_taken" );
    self endon( "laststand" );
    
    if ( scripts\cp\laststand::isinlaststand( self ) )
    {
        return;
    }
    
    wait 3;
    stance = self getstance();
    
    if ( isdefined( stance ) && stance == "prone" && !scripts\cp\laststand::isinlaststand( self ) )
    {
        level thread trysaylocalsound( self, #"bc_flavor_player_suppressed" );
    }
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24ad
// Size: 0x9f
function validaterecentattackers()
{
    if ( !isdefined( self.recentattackers ) )
    {
        self.recentattackers = [];
        return;
    }
    
    var_9225a7e3e5cc65ff = [];
    currenttime = gettime();
    
    foreach ( event in self.recentattackers )
    {
        if ( currenttime < event.ignoreaftertime )
        {
            var_9225a7e3e5cc65ff[ var_9225a7e3e5cc65ff.size ] = event;
        }
    }
    
    self.recentattackers = var_9225a7e3e5cc65ff;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2554
// Size: 0x13e
function addrecentattacker( attacker )
{
    if ( !isdefined( self.recentattackers ) )
    {
        self.recentattackers = [];
    }
    
    attackerexists = 0;
    
    foreach ( event in self.recentattackers )
    {
        if ( event.attacker == attacker )
        {
            attackerexists = 1;
            event.time = gettime();
            event.ignoreaftertime = event.time + 2000;
            break;
        }
    }
    
    if ( !attackerexists )
    {
        event = spawnstruct();
        event.time = gettime();
        event.attacker = attacker;
        event.ignoreaftertime = event.time + 2000;
        self.recentattackers[ self.recentattackers.size ] = event;
    }
    
    validaterecentattackers();
    
    if ( self.recentattackers.size > 1 )
    {
        level thread trysaylocalsound( self, #"bc_combat_inform_contact_multiple" );
    }
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x269a
// Size: 0x85
function javelinfired( team, target )
{
    if ( !level.teambased )
    {
        return;
    }
    
    enemyteam = random( getotherteam( team ) );
    var_6022f416c78a2d65 = getplayersinradius( target, 360000, enemyteam );
    
    if ( var_6022f416c78a2d65.size == 0 )
    {
        return;
    }
    
    player = random( var_6022f416c78a2d65 );
    level thread trysaylocalsound( player, #"bc_equipment_incoming_rpg", undefined, 0.5 );
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2727
// Size: 0xa4
function onmunitionboxused( boxtype )
{
    switch ( boxtype )
    {
        case #"hash_b83560470dd3f49b":
        case #"hash_d95dd5d6012a0de1":
            level thread trysaylocalsound( self, #"bc_fieldupgrade_action_ammobox" );
            break;
        case #"hash_25789111b74943b4":
            level thread trysaylocalsound( self, #"bc_fieldupgrade_action_armorbox" );
            break;
        case #"hash_675a272e58f54e46":
            level thread trysaylocalsound( self, #"bc_equipment_action_stim" );
            break;
        case #"hash_dc674fc0f75e4925":
            break;
        case #"hash_155f01fe111e3395":
            break;
    }
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27d3
// Size: 0x29f
function ongrenadeuse( grenade )
{
    weaponrootname = getweaponrootstring( grenade.weapon_object );
    
    switch ( weaponrootname )
    {
        case #"hash_7c03088193266bc4":
            level thread trysaylocalsound( self, #"bc_equipment_action_grenade" );
            break;
        case #"hash_5d11ac1131cddab1":
            level thread trysaylocalsound( self, #"bc_equipment_action_semtex" );
            break;
        case #"hash_c9a436974fe60919":
            level thread trysaylocalsound( self, #"bc_equipment_action_molotov" );
            break;
        case #"hash_a0319e349a692b8f":
            level thread trysaylocalsound( self, #"bc_equipment_action_thermite" );
            break;
        case #"hash_fa1e80f6bd5b8e72":
            level thread trysaylocalsound( self, #"bc_equipment_action_c4" );
            break;
        case #"hash_36b7174a04de8799":
            level thread trysaylocalsound( self, #"bc_equipment_action_claymore" );
            break;
        case #"hash_9d57562863499a06":
            level thread trysaylocalsound( self, #"bc_equipment_action_proxmine" );
            break;
        case #"hash_e042760d17966848":
            level thread trysaylocalsound( self, #"bc_equipment_action_flashbang" );
            break;
        case #"hash_8670ac083666f3a4":
            level thread trysaylocalsound( self, #"bc_equipment_action_stun" );
            break;
        case #"hash_13492848c09971da":
            level thread trysaylocalsound( self, #"bc_equipment_action_snapshot" );
            break;
        case #"hash_e1f6f84e4cd950eb":
            level thread trysaylocalsound( self, #"bc_equipment_action_smoke" );
            break;
        case #"hash_8059d93d3568c07":
            level thread trysaylocalsound( self, #"bc_equipment_action_gas" );
            break;
        case #"hash_333525cef39d0c66":
            level thread trysaylocalsound( self, #"bc_equipment_action_decoy" );
            break;
        case #"hash_675a272e58f54e46":
            level thread trysaylocalsound( self, #"bc_equipment_action_stim" );
            break;
        case #"hash_11a03a12f93f62b2":
            level thread trysaylocalsound( self, #"bc_equipment_action_shockstick" );
            break;
        case #"hash_d9108a0595d7d0b9":
            level thread trysaylocalsound( self, #"bc_equipment_action_buster" );
            break;
        case #"hash_13d1f84d0ae96a5f":
            level thread trysaylocalsound( self, #"bc_fieldupgrade_action_trophy" );
            break;
        case #"hash_6bc36a1e4f485a79":
        case #"hash_d95dd5d6012a0de1":
            level thread trysaylocalsound( self, #"bc_fieldupgrade_action_ammobox" );
            break;
    }
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a7a
// Size: 0x3d0
function grenadeproximitytracking()
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    objweapon = self.weapon_object;
    weaponrootname = getweaponrootstring( objweapon );
    
    switch ( weaponrootname )
    {
        case #"hash_8059d93d3568c07":
        case #"hash_13492848c09971da":
        case #"hash_5d11ac1131cddab1":
        case #"hash_7c03088193266bc4":
        case #"hash_8670ac083666f3a4":
        case #"hash_a0319e349a692b8f":
        case #"hash_c9a436974fe60919":
        case #"hash_e042760d17966848":
        case #"hash_e1f6f84e4cd950eb":
        case #"hash_fa1e80f6bd5b8e72":
            break;
        default:
            if ( weaponclass( self.weapon_name ) == "rocketlauncher" )
            {
                break;
            }
            
            return;
    }
    
    owner = self.owner;
    
    if ( !isdefined( owner ) )
    {
        owner = getmissileowner( self );
    }
    
    if ( !isdefined( owner ) )
    {
        return;
    }
    
    self endon( "death" );
    
    while ( true )
    {
        nearplayers = utility::playersinsphere( self.origin, 384 );
        
        foreach ( player in nearplayers )
        {
            if ( !isdefined( player ) || !isalive( player ) || isdefined( self.owner ) && self.owner isenemy( player ) == 0 )
            {
                continue;
            }
            
            grenadedistancesquared = distancesquared( self.origin, player.origin );
            
            if ( isdefined( grenadedistancesquared ) && grenadedistancesquared < 384 )
            {
                if ( !sighttracepassed( player geteye(), self.origin, 0, player ) )
                {
                    continue;
                }
                
                switch ( weaponrootname )
                {
                    case #"hash_7c03088193266bc4":
                        level thread trysaylocalsound( player, #"bc_equipment_incoming_grenade" );
                        break;
                    case #"hash_8670ac083666f3a4":
                        level thread trysaylocalsound( player, #"bc_equipment_incoming_stun" );
                        break;
                    case #"hash_e042760d17966848":
                        level thread trysaylocalsound( player, #"bc_equipment_incoming_flashbang" );
                        break;
                    case #"hash_e1f6f84e4cd950eb":
                        level thread trysaylocalsound( player, #"bc_equipment_incoming_generic" );
                        break;
                    case #"hash_5d11ac1131cddab1":
                        level thread trysaylocalsound( player, #"bc_equipment_incoming_semtex" );
                        break;
                    case #"hash_c9a436974fe60919":
                        level thread trysaylocalsound( player, #"bc_equipment_incoming_molotov" );
                        break;
                    case #"hash_fa1e80f6bd5b8e72":
                        level thread trysaylocalsound( player, #"bc_equipment_incoming_c4" );
                        break;
                    case #"hash_13492848c09971da":
                        level thread trysaylocalsound( player, #"bc_equipment_incoming_generic" );
                        break;
                    case #"hash_a0319e349a692b8f":
                        level thread trysaylocalsound( player, #"bc_equipment_incoming_thermite" );
                        break;
                    case #"hash_8059d93d3568c07":
                        level thread trysaylocalsound( player, #"bc_equipment_incoming_gas" );
                        break;
                    case #"hash_11a03a12f93f62b2":
                        level thread trysaylocalsound( player, #"bc_equipment_incoming_shockstick" );
                        break;
                    case #"hash_d9108a0595d7d0b9":
                        level thread trysaylocalsound( player, #"bc_equipment_incoming_buster" );
                        break;
                    default:
                        if ( weaponclass( self.weapon_name ) == "rocketlauncher" )
                        {
                            level thread trysaylocalsound( player, #"bc_equipment_incoming_rpg" );
                        }
                        
                        break;
                }
            }
            
            waitframe();
        }
        
        waitframe();
    }
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e52
// Size: 0xc7
function equipmentdestroyed( ent )
{
    if ( !isdefined( ent ) )
    {
        return;
    }
    
    if ( !isdefined( ent.weapon_name ) )
    {
        return;
    }
    
    switch ( ent.weapon_name )
    {
        case #"hash_56ee829cc162271a":
            break;
        case #"hash_5e8f81314553dd36":
            break;
        case #"hash_6a2e4f9c54756dc7":
            break;
        case #"hash_5e1fa926a475190b":
        case #"hash_5e3fa526a48eaaa5":
            break;
        case #"hash_36d0be2b0f1c99e":
            break;
        case #"hash_9ca85335d506dad6":
            break;
        case #"hash_cac2107b8e726d9d":
            break;
        case #"hash_117f8b2c4362d5b2":
            break;
        case #"hash_b82bf6dc767609aa":
            break;
    }
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f21
// Size: 0x1dd
function function_204aeba40a2aa027( superref )
{
    switch ( superref )
    {
        case #"hash_ac2ab6307a9fe4ec":
            level thread trysaylocalsound( self, #"bc_fieldupgrade_action_armorbox" );
            break;
        case #"hash_3d18c216d6eeb2cc":
            level thread trysaylocalsound( self, #"bc_fieldupgrade_action_aprounds" );
            break;
        case #"hash_f2f5c0ae2a0a92c2":
            level thread trysaylocalsound( self, #"bc_fieldupgrade_action_battlerage" );
            break;
        case #"hash_b0c881a998e8d402":
            level thread trysaylocalsound( self, #"bc_fieldupgrade_action_deadsilence" );
            break;
        case #"hash_6f4c7534ae718637":
            level thread trysaylocalsound( self, #"bc_fieldupgrade_action_deployablecover" );
            break;
        case #"hash_53ec74c436e095e3":
            level thread trysaylocalsound( self, #"bc_fieldupgrade_action_emppulse" );
            break;
        case #"hash_d2e07f72a95c89d0":
            level thread trysaylocalsound( self, #"bc_fieldupgrade_action_inflatabledecoy" );
            break;
        case #"hash_7266a252f51150e9":
            level thread trysaylocalsound( self, #"bc_fieldupgrade_action_recondrone" );
            break;
        case #"hash_d162cb5f4a711830":
            level thread trysaylocalsound( self, #"bc_fieldupgrade_action_smokedrop" );
            break;
        case #"hash_4599084f04ba2bfe":
            level thread trysaylocalsound( self, #"bc_fieldupgrade_action_sonarpulse" );
            break;
        case #"hash_9f0b371acb28a571":
            level thread trysaylocalsound( self, #"bc_fieldupgrade_action_soundveil" );
            break;
        case #"hash_4200221a42387567":
            level thread trysaylocalsound( self, #"bc_fieldupgrade_action_stimpistol" );
            break;
        case #"hash_2a2d382fc09b9c1b":
            level thread trysaylocalsound( self, #"bc_fieldupgrade_action_taccamera" );
            break;
        default:
            break;
    }
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3106
// Size: 0x16
function onfieldupgradedestroy( chatterref )
{
    level thread trysaylocalsound( self, chatterref );
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3124
// Size: 0x1fe
function onkillstreakdeploy( owner, streakname )
{
    if ( !isdefined( streakname ) )
    {
        return;
    }
    
    switch ( streakname )
    {
        case #"hash_349713b5ad494dda":
        case #"hash_413c38e72fe8b5bf":
        case #"hash_691f39dddd9116b8":
        case #"hash_b161e185f1b8e117":
            level thread trysaylocalsound( owner, #"bc_killstreak_action_airsupport" );
            break;
        case #"hash_cf0ef5bef19a311b":
            level thread trysaylocalsound( owner, #"bc_killstreak_action_wheelson" );
            break;
        case #"hash_2289ec11d77bce8f":
        case #"hash_4ad475e6e15635bd":
        case #"hash_56979e0566996b2e":
        case #"hash_887ad77192b9c4fb":
        case #"hash_e477c24ee18bb2f6":
            level thread trysaylocalsound( owner, #"bc_killstreak_action_airdrop" );
            break;
        case #"hash_4d5aa76e8707f47b":
            level thread trysaylocalsound( owner, #"bc_killstreak_action_sentrygun" );
            break;
        case #"hash_195360490caa3220":
        case #"hash_7e7648c4805888c5":
            level thread trysaylocalsound( owner, #"bc_killstreak_action_nuke" );
            break;
        case #"hash_bf2f9adbd2b41d5":
        case #"hash_28d0236400e33fd0":
        case #"hash_4220be38a5f150b8":
        case #"hash_42fd64e842a4c3d7":
        case #"hash_8c766d6477287bb6":
        case #"hash_b4ac3581c343a029":
        case #"hash_e6bea339d3cbd3e8":
            level thread trysaylocalsound( owner, #"bc_killstreak_action_airstrike" );
            break;
        case #"hash_634b246c3da5c56f":
        case #"hash_e171e5b86ef0a4cc":
        case #"hash_f64c697bfb4c6b54":
            level thread trysaylocalsound( owner, #"bc_killstreak_action_recon" );
            break;
        case #"hash_10e585c25e7e9f60":
        case #"hash_27002778019fb447":
            level thread trysaylocalsound( owner, #"bc_killstreak_action_counteruav" );
            break;
    }
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x332a
// Size: 0x1e2
function killstreakdestroyed( streakname )
{
    if ( !isdefined( streakname ) )
    {
        return;
    }
    
    switch ( streakname )
    {
        case #"hash_413c38e72fe8b5bf":
            level thread trysaylocalsound( self, #"bc_killstreak_killfirm_gunship" );
            break;
        case #"hash_349713b5ad494dda":
        case #"hash_691f39dddd9116b8":
            level thread trysaylocalsound( self, #"bc_killstreak_killfirm_heli" );
            break;
        case #"hash_cf0ef5bef19a311b":
            level thread trysaylocalsound( self, #"bc_killstreak_killfirm_wheelson" );
            break;
        case #"hash_bf2f9adbd2b41d5":
            level thread trysaylocalsound( self, #"bc_killstreak_killfirm_vtol" );
            break;
        case #"hash_4ad475e6e15635bd":
            level thread trysaylocalsound( self, #"bc_killstreak_killfirm_juggernaut" );
            break;
        case #"hash_e477c24ee18bb2f6":
            level thread trysaylocalsound( self, #"bc_vehicle_killfirm_tank" );
            break;
        case #"hash_4d5aa76e8707f47b":
            level thread trysaylocalsound( self, #"bc_killstreak_killfirm_sentrygun" );
            break;
        case #"hash_634b246c3da5c56f":
        case #"hash_ac0479ced5bcc013":
        case #"hash_e171e5b86ef0a4cc":
            level thread trysaylocalsound( self, #"bc_killstreak_killfirm_uav" );
            break;
        case #"hash_10e585c25e7e9f60":
        case #"hash_27002778019fb447":
            level thread trysaylocalsound( self, #"bc_killstreak_killfirm_counteruav" );
            break;
        case #"hash_4d35eb58f9d545f0":
            level thread trysaylocalsound( self, #"bc_killstreak_killfirm_clustermine" );
            break;
        case #"hash_9e36e3bd3a9dd00d":
            level thread trysaylocalsound( self, #"bc_killstreak_killfirm_bombdrone" );
            break;
        case #"hash_e40585107590f016":
            level thread trysaylocalsound( self, #"bc_fieldupgrade_killfirm_recondrone" );
            break;
    }
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3514
// Size: 0x3f
function suppressingfiretracking()
{
    self endon( "death_or_disconnect" );
    self endon( "faux_spawn" );
    var_6882a17ec6a9d934 = undefined;
    
    for ( ;; )
    {
        self waittill( "begin_firing" );
        thread suppresswaiter();
        thread suppresstimeout();
        self waittill( "stoppedFiring" );
    }
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x355b
// Size: 0x27
function suppresstimeout()
{
    thread waitsuppresstimeout();
    self endon( "begin_firing" );
    self waittill( "end_firing" );
    wait 0.3;
    self notify( "stoppedFiring" );
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x358a
// Size: 0x19
function waitsuppresstimeout()
{
    self endon( "stoppedFiring" );
    self waittill( "begin_firing" );
    thread suppresstimeout();
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35ab
// Size: 0x22
function suppresswaiter()
{
    self notify( "suppressWaiter" );
    self endon( "suppressWaiter" );
    self endon( "death_or_disconnect" );
    self endon( "stoppedFiring" );
    wait 1;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35d5
// Size: 0x1ce
function reloadtracking()
{
    self endon( "death_or_disconnect" );
    self endon( "faux_spawn" );
    
    while ( true )
    {
        self waittill( "reload_start" );
        
        if ( function_8ce5803b7d377d72( self ) == 1 )
        {
            continue;
        }
        
        if ( istrue( level.var_65a7fa3a254912e8 ) )
        {
            continue;
        }
        
        objweapon = self getcurrentweapon();
        hasakimbo = weaponhasattachment( objweapon, "akimbo" );
        
        if ( hasakimbo )
        {
            remainingammo = self getweaponammoclip( objweapon, "right" ) + self getweaponammoclip( objweapon, "left" ) + self getweaponammostock( objweapon );
        }
        else
        {
            remainingammo = self getweaponammoclip( objweapon ) + self getweaponammostock( objweapon );
        }
        
        var_54a24336cc9a143d = istrue( objweapon.isalternate ) && ( weaponclass( objweapon ) == "grenade" || weaponclass( objweapon ) == "spread" );
        var_bc6925748f6b3a6 = function_8a4f25fb9d4c43c8( objweapon );
        
        if ( remainingammo <= weaponclipsize( objweapon ) || hasakimbo && remainingammo <= weaponclipsize( objweapon ) * 2 )
        {
            var_da66af6058340796 = getweaponrootname( objweapon ) == "iw8_sn_kilo98" || var_54a24336cc9a143d;
            
            if ( !var_da66af6058340796 )
            {
                if ( var_bc6925748f6b3a6 )
                {
                    level thread trysaylocalsound( self, #"bc_combat_action_last_mag" );
                }
                else
                {
                    level thread trysaylocalsound( self, #"bc_combat_action_lowammo" );
                }
            }
            
            continue;
        }
        
        validaterecentattackers();
        var_4291fa32c3861d68 = scripts\cp_mp\talking_gun::function_7b50742a287d3ca1( self ) && cointoss();
        
        if ( var_4291fa32c3861d68 )
        {
            scripts\cp_mp\talking_gun::function_c5f05871ba7c3aa3();
            continue;
        }
        
        if ( var_bc6925748f6b3a6 )
        {
            level thread trysaylocalsound( self, #"bc_combat_action_reloading" );
            continue;
        }
        
        level thread trysaylocalsound( self, #"bc_combat_action_reloadnomag" );
    }
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x37ab
// Size: 0x20
function sprinttracking()
{
    self endon( "death_or_disconnect" );
    self endon( "faux_spawn" );
    
    while ( true )
    {
        self waittill( "sprint_begin" );
    }
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x37d3
// Size: 0x2bb
function threatcallouttracking()
{
    self endon( "death_or_disconnect" );
    self endon( "faux_spawn" );
    
    while ( true )
    {
        self waittill( "enemy_sighted" );
        
        if ( getomnvar( "ui_prematch_period" ) )
        {
            level waittill( "prematch_over" );
            continue;
        }
        
        if ( saidtoorecently( #"bc_combat_inform_contact_generic" ) || saidtoorecently( #"bc_combat_inform_contact" ) || saidtoorecently( #"bc_combat_inform_contact_multiple" ) )
        {
            continue;
        }
        
        enemies = self getsightedplayers();
        
        if ( !isdefined( enemies ) )
        {
            continue;
        }
        
        enemycount = 0;
        found_enemy = 0;
        dist = 4000000;
        
        if ( self playerads() > 0.7 )
        {
            dist = 6250000;
        }
        
        var_3b9993baf0241446 = 0;
        
        foreach ( enemy in enemies )
        {
            if ( isdefined( enemy ) && enemy scripts\cp_mp\utility\player_utility::_isalive() && !enemy _hasperk( "specialty_coldblooded" ) && distancesquared( self.origin, enemy.origin ) < dist )
            {
                location = enemy getvalidlocation( self );
                found_enemy = 1;
                enemycount++;
                
                if ( isdefined( location ) && !saidtoorecently( #"callout_location" ) && friendly_nearby( 4840000 ) )
                {
                    if ( _hasperk( "specialty_quieter" ) || !friendly_nearby( 262144 ) )
                    {
                        level thread trysaylocalsound( self, #"callout_location", location.locationaliases[ 0 ] );
                        var_3b9993baf0241446 = 1;
                    }
                    else
                    {
                        level thread trysaylocalsound( self, #"callout_location", location.locationaliases[ 0 ] );
                        var_3b9993baf0241446 = 1;
                    }
                    
                    break;
                }
            }
        }
        
        if ( enemycount > 0 )
        {
            alias = undefined;
            
            if ( !saidtoorecently( #"bc_combat_inform_contact_generic" ) )
            {
                alias = #"bc_combat_inform_contact_generic";
            }
            
            if ( !saidtoorecently( #"bc_combat_inform_contact" ) )
            {
                if ( isdefined( alias ) )
                {
                    if ( cointoss() )
                    {
                        alias = #"bc_combat_inform_contact";
                    }
                }
                else
                {
                    alias = #"bc_combat_inform_contact";
                }
            }
            
            if ( enemycount > 1 && !saidtoorecently( #"bc_combat_inform_contact_multiple" ) )
            {
                if ( isdefined( alias ) )
                {
                    if ( cointoss() )
                    {
                        alias = #"bc_combat_inform_contact_multiple";
                    }
                }
                else
                {
                    alias = #"bc_combat_inform_contact_multiple";
                }
            }
            
            level thread trysaylocalsound( self, alias );
        }
    }
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3a96
// Size: 0x1a4
function dosound( soundtype, targetent, location )
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( !scripts\cp\utility\player::isreallyalive( self ) )
    {
        return;
    }
    
    soundaliasbase = soundtype;
    
    if ( isdefined( location ) )
    {
        soundaliasbase = "loc_callout_" + location;
    }
    
    if ( !isdefined( self.operatorcustomization ) )
    {
        return;
    }
    
    /#
        voice = getdvar( @"hash_7d5a146cf0a25a28", "<dev string:x24>" );
        
        if ( voice != "<dev string:x24>" )
        {
            self.operatorcustomization.voice = voice;
        }
    #/
    
    if ( soundtype == "flavor_execution" )
    {
        if ( self.operatorcustomization.executionquip == "none" )
        {
            return;
        }
        
        soundaliasbase += self.operatorcustomization.executionquip;
    }
    
    var_4f632c1568af9fc0 = level.bcinfo[ "asset" ][ soundtype ];
    
    if ( isdefined( targetent ) && isent( targetent ) )
    {
        self playsoundevent( var_4f632c1568af9fc0, targetent );
    }
    else
    {
        self playsoundevent( var_4f632c1568af9fc0 );
    }
    
    if ( isdefined( location ) )
    {
        location_add_last_callout_time( location );
    }
    
    priority = function_336e1f89ae06dfd4( soundtype );
    speakerteam = self.team;
    level addspeaker( self, speakerteam, soundtype, priority );
    updatechatter( soundtype );
    duration = 1;
    thread timehack( function_f28fd66285fa2c9( soundtype ), duration );
    waittill_any_2( function_f28fd66285fa2c9( soundtype ), "death_or_disconnect" );
    level removespeaker( self, speakerteam );
    return 1;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3c43
// Size: 0x1d1
function dothreatcalloutresponse( soundalias, location )
{
    notify_string = waittill_any_return_2( soundalias, "death_or_disconnect" );
    
    if ( isdefined( notify_string ) && notify_string == soundalias )
    {
        team = self.team;
        pos = self.origin;
        wait 0.5;
        players = getfriendlyplayers( team, 1 );
        
        foreach ( player in players )
        {
            if ( !isdefined( player ) )
            {
                continue;
            }
            
            if ( player == self )
            {
                continue;
            }
            
            if ( !player scripts\cp_mp\utility\player_utility::_isalive() )
            {
                continue;
            }
            
            if ( player.team != team )
            {
                continue;
            }
            
            if ( isagent( player ) )
            {
                continue;
            }
            
            if ( self.operatorcustomization.voice != player.operatorcustomization.voice && distancesquared( pos, player.origin ) <= 262144 && !isspeakerinrange( player ) )
            {
                suffix = getintensitysuffix( player );
                var_a7413bbf3983933c = "dx_mpb_" + player.operatorcustomization.voice + "_loc_" + location + "_echo";
                
                if ( soundexists( var_a7413bbf3983933c ) && cointoss() )
                {
                    newalias = var_a7413bbf3983933c;
                }
                else
                {
                    newalias = undefined;
                }
                
                if ( isdefined( newalias ) )
                {
                    player thread dosound( newalias, 0, 1 );
                }
                
                break;
            }
        }
    }
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3e1c
// Size: 0x20
function timehack( soundalias, duration )
{
    self endon( "death_or_disconnect" );
    wait duration;
    self notify( soundalias );
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3e44
// Size: 0xdf, Type: bool
function isspeakerinrange( player, max_dist )
{
    if ( !isdefined( max_dist ) )
    {
        max_dist = 1000;
    }
    
    distsq = max_dist * max_dist;
    
    if ( isdefined( player ) && isdefined( player.team ) && player.team != "spectator" )
    {
        for (index = 0; index < level.speakers[ player.team ].size; index++) {
            teammate = level.speakers[ player.team ][ index ][ "player" ];
            
            if ( teammate == player )
            {
                return true;
            }
            
            if ( !isdefined( teammate ) )
            {
                continue;
            }
            
            if ( distancesquared( teammate.origin, player.origin ) < distsq )
            {
                return true;
            }
        }
    }
    
    return false;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3f2c
// Size: 0x9d
function addspeaker( player, team, soundtype, priority )
{
    index = level.speakers[ team ].size;
    level.speakers[ team ][ index ] = [];
    level.speakers[ team ][ index ][ "player" ] = player;
    level.speakers[ team ][ index ][ "sound_alias" ] = soundtype;
    level.speakers[ team ][ index ][ "sound_type" ] = soundtype;
    level.speakers[ team ][ index ][ "priority" ] = priority;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3fd1
// Size: 0x9a
function removespeaker( player, team )
{
    newspeakers = [];
    
    for (index = 0; index < level.speakers[ team ].size; index++) {
        if ( isdefined( player ) && isdefined( level.speakers[ team ][ index ][ "player" ] ) && level.speakers[ team ][ index ][ "player" ] == player )
        {
            continue;
        }
        
        newspeakers[ newspeakers.size ] = level.speakers[ team ][ index ];
    }
    
    level.speakers[ team ] = newspeakers;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4073
// Size: 0x19
function disablebattlechatter( player )
{
    player.bcdisabled = 1;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4094
// Size: 0x16
function enablebattlechatter( player )
{
    player.bcdisabled = undefined;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x40b2
// Size: 0xb1
function updatechatter( soundtype )
{
    if ( !isdefined( level.bcinfo[ "soundEventHistory" ][ soundtype ] ) )
    {
        level.bcinfo[ "soundEventHistory" ][ soundtype ] = [];
    }
    
    time = gettime();
    cleanuplastsaytimes( soundtype, time );
    self.bcinfolastsaytimes[ soundtype ] = time;
    data = spawnstruct();
    data.origin = self.origin;
    data.time = time;
    level.bcinfo[ "soundEventHistory" ][ soundtype ][ level.bcinfo[ "soundEventHistory" ][ soundtype ].size ] = data;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x416b
// Size: 0x120
function cleanuplastsaytimes( soundtype, time )
{
    temparray = [];
    
    foreach ( var_743aedab468adbb, timestamp in self.bcinfolastsaytimes )
    {
        timeout = function_a71193e9db14c926( var_743aedab468adbb ) + timestamp;
        
        if ( time < timeout )
        {
            temparray[ var_743aedab468adbb ] = timestamp;
        }
    }
    
    self.bcinfolastsaytimes = temparray;
    temparray = [];
    
    foreach ( event in level.bcinfo[ "soundEventHistory" ][ soundtype ] )
    {
        if ( time < event.time + function_ffd3470f08fcf7a7( soundtype ) )
        {
            temparray[ temparray.size ] = event;
        }
    }
    
    level.bcinfo[ "soundEventHistory" ][ soundtype ] = temparray;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4293
// Size: 0xd8
function getvalidlocation( speaker )
{
    mylocations = get_all_my_locations();
    mylocations = array_randomize( mylocations );
    
    if ( mylocations.size )
    {
        foreach ( location in mylocations )
        {
            if ( !location_called_out_ever( location ) && speaker cancalloutlocation( location ) )
            {
                return location;
            }
        }
        
        foreach ( location in mylocations )
        {
            if ( !location_called_out_recently( location ) && speaker cancalloutlocation( location ) )
            {
                return location;
            }
        }
    }
    
    return undefined;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4374
// Size: 0x8b
function get_all_my_locations()
{
    alllocations = anim.bcs_locations;
    touchinglocations = self getistouchingentities( alllocations );
    mylocations = [];
    
    foreach ( location in touchinglocations )
    {
        if ( isdefined( location.locationaliases ) )
        {
            mylocations[ mylocations.size ] = location;
        }
    }
    
    return mylocations;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4408
// Size: 0x32, Type: bool
function location_called_out_ever( location )
{
    lastcallouttime = location_get_last_callout_time( location.locationaliases[ 0 ] );
    
    if ( !isdefined( lastcallouttime ) )
    {
        return false;
    }
    
    return true;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4443
// Size: 0x4e, Type: bool
function location_called_out_recently( location )
{
    lastcallouttime = location_get_last_callout_time( location.locationaliases[ 0 ] );
    
    if ( !isdefined( lastcallouttime ) )
    {
        return false;
    }
    
    var_c5e4b26dbee9eb39 = lastcallouttime + 25000;
    
    if ( gettime() < var_c5e4b26dbee9eb39 )
    {
        return true;
    }
    
    return false;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x449a
// Size: 0x1c
function location_add_last_callout_time( location )
{
    anim.locationlastcallouttimes[ location ] = gettime();
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x44be
// Size: 0x27
function location_get_last_callout_time( location )
{
    if ( isdefined( anim.locationlastcallouttimes[ location ] ) )
    {
        return anim.locationlastcallouttimes[ location ];
    }
    
    return undefined;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x44ee
// Size: 0x86
function cancalloutlocation( location )
{
    foreach ( alias in location.locationaliases )
    {
        aliasnormal = getloccalloutalias( "loc_callout_" + alias );
        valid = soundexists( aliasnormal );
        
        if ( valid )
        {
            return valid;
        }
    }
    
    return 0;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x457d
// Size: 0x71, Type: bool
function canconcat( location )
{
    aliases = location.locationaliases;
    
    foreach ( alias in aliases )
    {
        if ( iscallouttypeconcat( alias, self ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x45f7
// Size: 0x99
function getcannedresponse( speaker )
{
    var_d909d2311d8709d = undefined;
    aliases = self.locationaliases;
    
    foreach ( alias in aliases )
    {
        if ( iscallouttypeqa( alias, speaker ) && !isdefined( self.qafinished ) )
        {
            var_d909d2311d8709d = alias;
            break;
        }
        
        if ( iscallouttypereport( alias ) )
        {
            var_d909d2311d8709d = alias;
        }
    }
    
    return var_d909d2311d8709d;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4699
// Size: 0x16
function iscallouttypereport( alias )
{
    return issubstr( alias, "_report" );
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x46b8
// Size: 0x39, Type: bool
function iscallouttypeconcat( alias, speaker )
{
    var_3f4cc9de41415260 = speaker getloccalloutalias( "concat_loc_" + alias );
    
    if ( soundexists( var_3f4cc9de41415260 ) )
    {
        return true;
    }
    
    return false;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x46fa
// Size: 0x4f, Type: bool
function iscallouttypeqa( alias, speaker )
{
    if ( issubstr( alias, "_qa" ) && soundexists( alias ) )
    {
        return true;
    }
    
    var_3f4cc9de41415260 = speaker getqacalloutalias( alias, 0 );
    
    if ( soundexists( var_3f4cc9de41415260 ) )
    {
        return true;
    }
    
    return false;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4752
// Size: 0x46
function getloccalloutalias( basealias )
{
    alias = "dx_mpb_" + self.operatorcustomization.voice + "_" + basealias + "_" + getintensitysuffix( self );
    return alias;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x47a1
// Size: 0x31
function getqacalloutalias( basealias, lineindex )
{
    alias = getloccalloutalias( basealias );
    alias += "_qa" + lineindex;
    return alias;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x47db
// Size: 0x3c, Type: bool
function battlechatter_canprint()
{
    /#
        if ( getdvar( @"hash_611f04c407c3f644" ) == self.team || getdvar( @"hash_611f04c407c3f644" ) == "<dev string:x25>" )
        {
            return true;
        }
    #/
    
    return false;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4820
// Size: 0x3c, Type: bool
function battlechatter_canprintdump()
{
    /#
        if ( getdvar( @"hash_9627c73338f91622" ) == self.team || getdvar( @"hash_9627c73338f91622" ) == "<dev string:x25>" )
        {
            return true;
        }
    #/
    
    return false;
}

/#

    // Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x4865
    // Size: 0xb0, Type: dev
    function battlechatter_print( alias, color )
    {
        if ( !battlechatter_canprint() )
        {
            return;
        }
        
        if ( !isdefined( color ) )
        {
            color = "<dev string:x29>";
        }
        
        colorkey = "<dev string:x29>";
        
        switch ( color )
        {
            case #"hash_97430f6c58e61cbc":
                colorkey = "<dev string:x33>";
                break;
            case #"hash_2ac407c1cd5943a9":
                colorkey = "<dev string:x3d>";
                break;
            case #"hash_6686d129776d649a":
                colorkey = "<dev string:x45>";
                break;
        }
        
        println( colorkey + self.origin + "<dev string:x48>" + self.name + "<dev string:x4b>" + alias );
    }

    // Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x491d
    // Size: 0x225, Type: dev
    function battlechatter_printdump( alias )
    {
        if ( !battlechatter_canprintdump() )
        {
            return;
        }
        
        dumptype = getdvar( @"hash_3cb0b3f110a54cf2", "<dev string:x20>" );
        
        if ( dumptype != "<dev string:x20>" && dumptype != "<dev string:x50>" )
        {
            return;
        }
        
        var_47f4bea7f4c50ad9 = -1;
        
        if ( isdefined( level.var_529a83d403b4416 ) )
        {
            var_47f4bea7f4c50ad9 = ( gettime() - level.var_529a83d403b4416 ) / 1000;
        }
        
        level.var_529a83d403b4416 = gettime();
        
        if ( dumptype == "<dev string:x20>" )
        {
            if ( !flag_exist( "<dev string:x54>" ) )
            {
                flag_init( "<dev string:x54>" );
            }
            
            if ( !isdefined( level.var_b363a2868472ded1 ) )
            {
                filepath = "<dev string:x6c>" + level.script + "<dev string:x8d>";
                level.var_b363a2868472ded1 = openfile( filepath, "<dev string:x92>" );
            }
            
            aliastype = getaliastypefromsoundalias( alias );
            suffix = getintensitysuffix( self );
            factionprefix = getteamvoiceinfix( self.team ) + "<dev string:x98>";
            factionprefix = getsubstr( factionprefix, 0, factionprefix.size - 1 );
            dumpstring = level.script + "<dev string:x9b>" + factionprefix + "<dev string:x9b>" + self.operatorcustomization.voice + "<dev string:x9b>" + aliastype + suffix;
            battlechatter_printdumpline( level.var_b363a2868472ded1, dumpstring, "<dev string:x54>" );
            return;
        }
        
        if ( dumptype == "<dev string:x50>" )
        {
            if ( !flag_exist( "<dev string:x9d>" ) )
            {
                flag_init( "<dev string:x9d>" );
            }
            
            if ( !isdefined( level.var_97ef0a827c8a39d1 ) )
            {
                filepath = "<dev string:x6c>" + level.script + "<dev string:xb5>";
                level.var_97ef0a827c8a39d1 = openfile( filepath, "<dev string:x92>" );
            }
            
            dumpstring = "<dev string:xba>" + var_47f4bea7f4c50ad9 + "<dev string:xbc>";
            dumpstring += alias;
            battlechatter_printdumpline( level.var_97ef0a827c8a39d1, dumpstring, "<dev string:x9d>" );
        }
    }

    // Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x4b4a
    // Size: 0x28, Type: dev
    function battlechatter_debugprint( alias, color )
    {
        battlechatter_print( alias, color );
        thread battlechatter_printdump( alias );
    }

    // Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x4b7a
    // Size: 0x97, Type: dev
    function getaliastypefromsoundalias( alias )
    {
        prefix = "<dev string:xc4>" + self.operatorcustomization.voice;
        
        if ( issubstr( alias, "<dev string:xcc>" ) )
        {
            prefix = "<dev string:xcc>" + self.operatorcustomization.voice;
        }
        
        assertex( issubstr( alias, prefix ), "<dev string:xd4>" + alias + "<dev string:x100>" + prefix + "<dev string:x118>" );
        aliastype = getsubstr( alias, prefix.size, alias.size );
        return aliastype;
    }

    // Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x4c19
    // Size: 0x48, Type: dev
    function battlechatter_printdumpline( file, str, controlflag )
    {
        if ( flag( controlflag ) )
        {
            flag_wait( controlflag );
        }
        
        flag_set( controlflag );
        fprintln( file, str );
        flag_clear( controlflag );
    }

#/

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4c69
// Size: 0x9d, Type: bool
function friendly_nearby( max_dist )
{
    if ( !isdefined( max_dist ) )
    {
        max_dist = 262144;
    }
    
    players = getfriendlyplayers( self.team, 1 );
    
    foreach ( player in players )
    {
        if ( player != self && distancesquared( player.origin, self.origin ) <= max_dist )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d0f
// Size: 0x5d7
function setupselfvo()
{
    level.selfvomap = [];
    level.selfvomap[ "plr_killfirm_c6" ] = "kill_rig";
    level.selfvomap[ "plr_killfirm_ftl" ] = "kill_rig";
    level.selfvomap[ "plr_killfirm_ghost" ] = "kill_rig";
    level.selfvomap[ "plr_killfirm_merc" ] = "kill_rig";
    level.selfvomap[ "plr_killfirm_stryker" ] = "kill_rig";
    level.selfvomap[ "plr_killfirm_warfighter" ] = "kill_rig";
    level.selfvomap[ "plr_killfirm_generic" ] = "kill_gen";
    level.selfvomap[ "plr_killfirm_amf" ] = "kill_amf";
    level.selfvomap[ "plr_killfirm_headshot" ] = "kill_headshot";
    level.selfvomap[ "plr_killfirm_grenade" ] = "kill_grenade";
    level.selfvomap[ "plr_killfirm_rival" ] = "kill_rival";
    level.selfvomap[ "plr_killfirm_semtex" ] = "kill_semtex";
    level.selfvomap[ "plr_killfirm_multi" ] = "kill_multi";
    level.selfvomap[ "plr_killfirm_twofer" ] = "kill_twofer";
    level.selfvomap[ "plr_killfirm_threefer" ] = "kill_threefer";
    level.selfvomap[ "plr_killfirm_killstreak" ] = "kill_ss";
    level.selfvomap[ "plr_killstreak_destroy" ] = "kill_other_ss";
    level.selfvomap[ "plr_killstreak_target" ] = "targeted_by_ss";
    level.selfvomap[ "plr_hit_back" ] = "dmg_back";
    level.selfvomap[ "plr_damaged_light" ] = "dmg_light";
    level.selfvomap[ "plr_damaged_heavy" ] = "dmg_heavy";
    level.selfvomap[ "plr_damaged_emp" ] = "dmg_emp";
    level.selfvomap[ "plr_healing" ] = "healing";
    level.selfvomap[ "plr_kd_high" ] = "kd_high";
    level.selfvomap[ "plr_firefight" ] = "firefight";
    level.selfvomap[ "plr_target_generic" ] = "enemy_sighted";
    level.selfvomap[ "plr_perk_super" ] = "super_activate";
    level.selfvomap[ "plr_perk_trophy" ] = "super_activate";
    level.selfvomap[ "plr_perk_turret" ] = "super_activate";
    level.selfvomap[ "plr_perk_amplify" ] = "super_activate";
    level.selfvomap[ "plr_perk_overdrive" ] = "super_activate";
    level.selfvomap[ "plr_perk_ftl" ] = "super_activate";
    level.selfvomap[ "plr_perk_pulse" ] = "super_activate";
    level.selfvomap[ "plr_perk_rewind" ] = "super_activate";
    level.selfvomap[ "plr_perk_super_kill" ] = "super_kill";
    level.selfvomap[ "plr_perk_trophy_block" ] = "super_kill";
    level.selfvomap[ "plr_perk_turret_kill" ] = "super_kill";
    level.selfvomap[ "plr_killfirm_shift" ] = "super_kill";
    level.selfvomap[ "plr_perk_railgun" ] = "super_kill";
    level.selfvomap[ "plr_perk_stealth" ] = "super_kill";
    level.selfvomap[ "plr_perk_armor" ] = "super_kill";
    level.selfvomap[ "plr_perk_charge" ] = "super_kill";
    level.selfvomap[ "plr_perk_dragon" ] = "super_kill";
    level.selfvomap[ "plr_perk_pound" ] = "super_kill";
    level.selfvomap[ "plr_perk_reaper" ] = "super_kill";
    level.selfvoinfo = [];
    setselfvoinfo( "kill_rig", 15, 0.3, 0.25 );
    setselfvoinfo( "kill_gen", 30, 0.1, 0.25 );
    setselfvoinfo( "kill_amf", 15, 0.5, 0.5 );
    setselfvoinfo( "kill_headshot", 15, 0.7, 0.25 );
    setselfvoinfo( "kill_grenade", 15, 0.5, 0.25 );
    setselfvoinfo( "kill_rival", 15, 0.7, 0.25 );
    setselfvoinfo( "kill_semtex", 15, 0.5, 0.25 );
    setselfvoinfo( "kill_multi", 20, 0.6, 0.25 );
    setselfvoinfo( "kill_twofer", 10, 0.7, 0.75 );
    setselfvoinfo( "kill_threefer", 10, 0.8, 0.75 );
    setselfvoinfo( "kill_ss", 10, 0.5, 0.2 );
    setselfvoinfo( "kill_other_ss", 10, 0.7, 0.75 );
    setselfvoinfo( "targeted_by_ss", 10, 0.4, 0.33 );
    setselfvoinfo( "dmg_back", 20, 0.5, 0.5 );
    setselfvoinfo( "dmg_light", 20, 0.4, 0.1 );
    setselfvoinfo( "dmg_heavy", 20, 0.5, 0.2 );
    setselfvoinfo( "healing", 10, 0.3, 0.1 );
    setselfvoinfo( "kd_high", 20, 0.7, 0.8 );
    setselfvoinfo( "enemy_sighted", 20, 0.2, 0.25 );
    setselfvoinfo( "firefight", 10, 0.4, 0.33 );
    setselfvoinfo( "super_activate", 10, 1, 1 );
    setselfvoinfo( "super_kill", 10, 0.9, 0.66 );
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x52ee
// Size: 0x5c
function setselfvoinfo( var_83fca5a43f291a90, timeout, priority, chance )
{
    level.selfvoinfo[ var_83fca5a43f291a90 ][ "timeout_pos" ] = timeout;
    level.selfvoinfo[ var_83fca5a43f291a90 ][ "priority" ] = priority;
    level.selfvoinfo[ var_83fca5a43f291a90 ][ "chance" ] = chance;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x5352
// Size: 0x1dd
function saytoself( player, aliasname, fallbackname, delay )
{
    if ( isagent( player ) || !isplayer( player ) )
    {
        return;
    }
    
    if ( istrue( player.bcdisabled ) )
    {
        return;
    }
    
    suffix = getintensitysuffix( player );
    fullname = "";
    
    if ( isdefined( player.operatorcustomization ) && isdefined( player.operatorcustomization.voice ) && isdefined( aliasname ) )
    {
        fullname = "dx_mpb_" + player.operatorcustomization.voice + "_" + aliasname;
    }
    
    if ( !isdefined( aliasname ) || !soundexists( fullname ) )
    {
        if ( !isdefined( fallbackname ) )
        {
            return;
        }
        
        aliasname = fallbackname;
        fullname = "dx_mpb_" + player.operatorcustomization.voice + "_" + aliasname;
        
        if ( !soundexists( fullname ) )
        {
            return;
        }
    }
    
    if ( !isdefined( player.selfvohistory ) )
    {
        player.selfvohistory = [];
        player.playingselfvo = 0;
        player.queuedvo = "none";
    }
    
    if ( isdefined( player.selfvohistory[ level.selfvomap[ aliasname ] ] ) && player.selfvohistory[ level.selfvomap[ aliasname ] ] > 0 )
    {
        return;
    }
    
    if ( !isdefined( player.pers[ "selfVOBonusChance" ] ) )
    {
        player thread updateselfvobonuschance();
    }
    
    if ( randomfloat( 1 ) > level.selfvoinfo[ level.selfvomap[ aliasname ] ][ "chance" ] + player.pers[ "selfVOBonusChance" ] )
    {
        return;
    }
    
    player thread trysetqueuedselfvo( aliasname, delay );
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5537
// Size: 0x54
function updateselfvobonuschance()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self.pers[ "selfVOBonusChance" ] = 0;
    
    while ( true )
    {
        self.pers[ "selfVOBonusChance" ] = self.pers[ "selfVOBonusChance" ] + 0.1;
        wait 3;
    }
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5593
// Size: 0x177
function trysetqueuedselfvo( aliasname, delay )
{
    self endon( "death_or_disconnect" );
    
    if ( self.queuedvo == aliasname )
    {
        return;
    }
    
    if ( self.queuedvo == "none" || level.selfvoinfo[ level.selfvomap[ self.queuedvo ] ][ "priority" ] < level.selfvoinfo[ level.selfvomap[ aliasname ] ][ "priority" ] || level.selfvoinfo[ level.selfvomap[ self.queuedvo ] ][ "priority" ] == level.selfvoinfo[ level.selfvomap[ aliasname ] ][ "priority" ] && cointoss() )
    {
        self.queuedvo = aliasname;
    }
    else
    {
        return;
    }
    
    self notify( "addToSelfVOQueue" );
    self endon( "addToSelfVOQueue" );
    self.selfvodelaycomplete = 1;
    
    if ( isdefined( delay ) )
    {
        thread selfvodelay( delay );
    }
    
    waittime = getprioritywaittime( aliasname );
    initialtime = gettime();
    
    while ( self.playingselfvo || !self.selfvodelaycomplete || waittime > gettime() )
    {
        if ( gettime() > initialtime + 2000 )
        {
            self.queuedvo = "none";
            return;
        }
        
        wait 0.05;
    }
    
    waitframe();
    thread playselfvo( aliasname );
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5712
// Size: 0x55
function getprioritywaittime( aliasname )
{
    if ( !isdefined( self.lastselfvotime ) )
    {
        self.lastselfvotime = 0;
    }
    
    return self.lastselfvotime + 2000 + 10000 * ( 1 - level.selfvoinfo[ level.selfvomap[ aliasname ] ][ "priority" ] );
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5770
// Size: 0x30
function selfvodelay( delay )
{
    self endon( "death_or_disconnect" );
    self endon( "addToSelfVOQueue" );
    self.selfvodelaycomplete = 0;
    wait delay;
    self.selfvodelaycomplete = 1;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x57a8
// Size: 0xad
function playselfvo( aliasname )
{
    self endon( "death_or_disconnect" );
    suffix = getintensitysuffix( self );
    fullname = "dx_mpb_" + self.operatorcustomization.voice + "_" + aliasname;
    self.pers[ "selfVOBonusChance" ] = 0;
    self.queuedvo = "none";
    duration = lookupsoundlength( fullname ) / 1000;
    self.lastselfvotime = gettime();
    thread playingselfvotracking( duration );
    thread updateselfvohistory( aliasname );
    self playsoundtoplayer( fullname, self );
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x585d
// Size: 0x29
function playingselfvotracking( duration )
{
    self endon( "disconnect" );
    self.playingselfvo = 1;
    wait duration;
    self.playingselfvo = 0;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x588e
// Size: 0x60
function updateselfvohistory( aliasname )
{
    self endon( "disconnect" );
    self.selfvohistory[ level.selfvomap[ aliasname ] ] = gettime();
    wait level.selfvoinfo[ level.selfvomap[ aliasname ] ][ "timeout_pos" ];
    self.selfvohistory[ level.selfvomap[ aliasname ] ] = 0;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x58f6
// Size: 0xa2
function getintensitysuffix( player )
{
    /#
        bc_intensity = getdvar( @"hash_68874851dce750fe", "<dev string:x11b>" );
        
        if ( bc_intensity != "<dev string:x11b>" )
        {
            if ( bc_intensity == "<dev string:x120>" )
            {
                return "<dev string:x120>";
            }
            
            if ( bc_intensity == "<dev string:x124>" )
            {
                return "<dev string:x124>";
            }
        }
    #/
    
    roundpercent = gettimepassedpercentage();
    intensity = player getbcintensity();
    
    if ( intensity > 5000 || roundpercent >= 80 || inovertime() )
    {
        return "high";
    }
    
    return "mid";
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x59a0
// Size: 0x93
function addtointensitybuffer( type, intensity, ignoreaftertime )
{
    if ( !isdefined( self.battlechatterintensitybuffer ) )
    {
        self.battlechatterintensitybuffer = [];
    }
    
    event = spawnstruct();
    event.time = gettime();
    event.value = intensity;
    event.ignoreaftertime = event.time + ignoreaftertime * 1000;
    self.battlechatterintensitybuffer[ self.battlechatterintensitybuffer.size ] = event;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a3b
// Size: 0xbc
function getbcintensity()
{
    if ( !isdefined( self.battlechatterintensitybuffer ) )
    {
        return 0;
    }
    
    validevents = [];
    intensity = 0;
    currenttime = gettime();
    
    foreach ( event in self.battlechatterintensitybuffer )
    {
        if ( currenttime < event.ignoreaftertime )
        {
            intensity += event.value;
            validevents[ validevents.size ] = event;
        }
    }
    
    self.battlechatterintensitybuffer = validevents;
    self.intensity = intensity;
    return intensity;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5b00
// Size: 0x2a9
function testweaponfiredtolisteners( attacker, objweapon )
{
    var_378d3b538b839d2c = utility::playersnear( attacker.origin, 4000 );
    
    foreach ( player in var_378d3b538b839d2c )
    {
        if ( !player scripts\cp_mp\utility\player_utility::_isalive() )
        {
            continue;
        }
        
        distsq = max( distance_2d_squared( attacker.origin, player.origin ), 1 );
        
        if ( scripts\cp\weapon::iscacprimaryweapon( objweapon.basename ) || scripts\cp\weapon::iscacsecondaryweapon( objweapon.basename ) )
        {
            intensity = 0;
            weapongroup = scripts\cp\weapon::getweapongroup( objweapon.basename );
            
            switch ( weapongroup )
            {
                case #"hash_ab10f9c080fe4faf":
                    intensity = 50;
                    break;
                case #"hash_8af0086b038622b5":
                    intensity = 60;
                    break;
                case #"hash_dd616da0b395a0b0":
                    intensity = 60;
                    break;
                case #"hash_c095d67337b1f5a1":
                    intensity = 90;
                    break;
                case #"hash_47368bc0d2ef1565":
                    intensity = 70;
                    break;
                case #"hash_bef5ec0b3e197ae":
                    intensity = 80;
                    break;
                case #"hash_16cf6289ab06bd30":
                    intensity = 80;
                    break;
                case #"hash_9d18adab1b65a661":
                    intensity = 70;
                    break;
                case #"hash_34340d457a63e7f1":
                    intensity = 40;
                    break;
                case #"hash_6f796b5c69cec63":
                    intensity = 50;
                    break;
                default:
                    break;
            }
            
            if ( intensity == 0 )
            {
                continue;
            }
            
            if ( weaponhasattachment( objweapon, "silencer" ) )
            {
                intensity *= 0.25;
            }
            
            if ( distsq < 10000 )
            {
                distscalar = 5;
            }
            else if ( distsq < 250000 )
            {
                distscalar = 3;
            }
            else if ( distsq < 1000000 )
            {
                distscalar = 2;
            }
            else if ( distsq < 4000000 )
            {
                distscalar = 0.5;
            }
            else if ( distsq < 9000000 )
            {
                distscalar = 0.25;
            }
            else
            {
                distscalar = 0.1;
            }
            
            distfrac = 1 - distsq / 16000000;
            distscalar *= distfrac;
            intensity *= distscalar;
            player addtointensitybuffer( "weaponFired", int( intensity ), 3 );
        }
    }
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5db1
// Size: 0x1b
function addexecutionquip()
{
    level thread trysaylocalsound( self, #"bc_combat_action_execution", undefined, 0.75 );
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5dd4
// Size: 0xb8
function adddamagetaken( attacker, objweapon, idamage )
{
    var_35722c9340d87e9f = 0;
    
    if ( isdefined( objweapon ) && isdefined( attacker ) )
    {
        weapongroup = scripts\cp\weapon::getweapongroup( objweapon );
        
        if ( weapongroup == "weapon_sniper" || weapongroup == "weapon_dmr" )
        {
            if ( distance2d( self.origin, attacker.origin ) > 2250000 )
            {
                var_35722c9340d87e9f = 1;
            }
        }
    }
    
    if ( var_35722c9340d87e9f )
    {
        level thread trysaylocalsound( self, #"bc_combat_inform_taking_fire_long", undefined, 0.75 );
        return;
    }
    
    level thread trysaylocalsound( self, #"bc_combat_inform_taking_fire", undefined, 0.75 );
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e94
// Size: 0xeb
function onsixfriendlytracking()
{
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );
    
    if ( scripts\cp\utility::function_138028ca2b958511() )
    {
        return;
    }
    
    wait 25;
    
    while ( true )
    {
        if ( !saidtoorecently( #"bc_status_inform_on_your_six" ) )
        {
            var_d1a3029ed3bcffd8 = getfriendlyplayers( self.team, 1 );
            
            foreach ( listener in var_d1a3029ed3bcffd8 )
            {
                if ( listener == self )
                {
                    continue;
                }
                
                if ( !scripts\cp\utility\player::isreallyalive( listener ) )
                {
                    continue;
                }
                
                if ( !scripts\cp\utility\player::isreallyalive( self ) )
                {
                    continue;
                }
                
                if ( validatelistener( self, listener ) )
                {
                    level thread trysaylocalsound( self, #"bc_status_inform_on_your_six" );
                    break;
                }
            }
        }
        else
        {
            wait randomfloatrange( 1, 4 );
        }
        
        wait 0.15;
    }
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5f87
// Size: 0xfb, Type: bool
function validatelistener( speaker, listener )
{
    listenerorg = listener geteye();
    speakerorg = speaker geteye();
    distsq = distancesquared( listenerorg, speakerorg );
    
    if ( distsq > 90000 )
    {
        return false;
    }
    
    listenerdir = anglestoforward( listener getplayerangles() );
    tolistener = vectornormalize( listenerorg - speakerorg );
    dot = vectordot( listenerdir, tolistener );
    test_dot = 0.05;
    
    if ( dot > test_dot )
    {
        trace = scripts\engine\trace::ray_trace( speakerorg, listenerorg, speaker, level.var_c49bb6749e2ce50c );
        
        if ( isdefined( trace[ "entity" ] ) && isplayer( trace[ "entity" ] ) || trace[ "fraction" ] > 0.8 )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x608b
// Size: 0x53
function onplayerkilled( einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, killid )
{
    
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x60e6
// Size: 0xe4
function checkcasualty()
{
    players = getfriendlyplayers( self.team, 1 );
    
    foreach ( player in players )
    {
        if ( player == self )
        {
            continue;
        }
        
        if ( distancesquared( self.origin, player.origin ) <= 262144 )
        {
            playerfacingdir = anglestoforward( player getplayerangles() );
            
            if ( length( player.origin - self.origin ) > 0 )
            {
                if ( math::anglebetweenvectors( playerfacingdir, player.origin - self.origin ) < 80 )
                {
                    break;
                }
            }
        }
    }
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x61d2
// Size: 0x15
function togglecpplayerbc( toggle )
{
    level.battlechatterenabled = toggle;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x61ef
// Size: 0x2c5
function trysaylocalsound( player, soundtype, targetent, delay, location, forceplay )
{
    if ( !istrue( level.battlechatterenabled ) && !istrue( forceplay ) )
    {
        return 0;
    }
    
    if ( istrue( level.var_bfe5bb3ba83502e3 ) )
    {
        return 0;
    }
    
    if ( istrue( level.var_7bca58ebc45c1d47 ) )
    {
        return 0;
    }
    
    if ( !isdefined( player ) )
    {
        return 0;
    }
    
    if ( !isplayer( player ) )
    {
        return 0;
    }
    
    if ( istrue( player.bcdisabled ) && !istrue( forceplay ) )
    {
        return 0;
    }
    
    if ( player isswimming() )
    {
        return 0;
    }
    
    if ( player.team == "spectator" )
    {
        return 0;
    }
    
    if ( istrue( player.isspeakingbc ) )
    {
        return 0;
    }
    
    if ( !isdefined( level.bcfrequency ) )
    {
        level.bcfrequency = [];
    }
    
    if ( !isdefined( level.bcfrequency[ soundtype ] ) )
    {
        level.bcfrequency[ soundtype ] = 1;
    }
    else
    {
        level.bcfrequency[ soundtype ]++;
    }
    
    if ( getdvarint( @"hash_a566325fce89195", 1 ) <= 0 && function_b96f48dbdcd7110( soundtype ) && !player friendly_nearby( 4840000 ) )
    {
        /#
            player battlechatter_print( "<dev string:x129>" + function_3c8848a3a11b2553( soundtype ), "<dev string:x36>" );
        #/
        
        return 0;
    }
    
    play_chance = randomfloat( 1 );
    sound_chance = function_c02b6ba215c2dca8( soundtype );
    
    if ( play_chance > sound_chance )
    {
        /#
            player battlechatter_debugprint( "<dev string:x140>" + function_3c8848a3a11b2553( soundtype ), "<dev string:x36>" );
        #/
        
        return;
    }
    
    if ( !isdefined( delay ) )
    {
        delay = 0;
    }
    
    waittime = player getbcwaittime( soundtype, delay );
    
    if ( waittime > level.bcinfo[ "max_wait_time" ] + delay * 1000 )
    {
        /#
            player battlechatter_print( "<dev string:x155>" + function_3c8848a3a11b2553( soundtype ), "<dev string:x36>" );
        #/
        
        return 0;
    }
    
    if ( gettime() > player.var_cf34556d563b92ae + level.bcinfo[ "max_wait_time" ] + delay * 1000 )
    {
        player.bcinfoqueued = "none";
        player.var_cf34556d563b92ae = 0;
    }
    
    if ( comparesoundpriorities( soundtype, player.bcinfoqueued ) )
    {
        player.bcinfoqueued = soundtype;
        player.var_cf34556d563b92ae = gettime();
    }
    else
    {
        /#
            player battlechatter_print( "<dev string:x169>" + function_3c8848a3a11b2553( soundtype ), "<dev string:x36>" );
        #/
        
        return 0;
    }
    
    level notify( "kill_queued_bc_sound_" + player.name );
    player thread saylocalsound( waittime, soundtype, targetent, delay, location );
    return 0;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x64bd
// Size: 0x1fe
function saylocalsound( waittime, soundtype, targetent, delay, location )
{
    level endon( "kill_queued_bc_sound_" + self.name );
    self endon( "death_or_disconnect" );
    wait waittime / 1000;
    
    if ( saidtoorecently( soundtype ) )
    {
        /#
            battlechatter_debugprint( "<dev string:x181>" + function_3c8848a3a11b2553( soundtype ), "<dev string:x36>" );
        #/
        
        return;
    }
    
    while ( waittime <= level.bcinfo[ "max_wait_time" ] + delay * 1000 )
    {
        speakerinfo = getspeakerinfo( self, function_336e1f89ae06dfd4( soundtype ) );
        
        if ( isdefined( speakerinfo[ "higher" ] ) && isdefined( speakerinfo[ "higher" ][ "sound_alias" ] ) )
        {
            time = gettime();
            speakerinfo[ "higher" ][ "player" ] waittill_any_3( function_f28fd66285fa2c9( speakerinfo[ "higher" ][ "sound_alias" ] ), "death", "disconnect" );
            waitframe();
            waittime += gettime() - time;
            continue;
        }
        
        info = speakerinfo[ "lower" ];
        
        for (i = 0; i < info.size; i++) {
            if ( isdefined( info[ i ][ "player" ] ) )
            {
                info[ i ][ "player" ] notify( function_f28fd66285fa2c9( info[ i ][ "sound_alias" ] ) + "_interrupt" );
                
                if ( soundexists( info[ i ][ "sound_alias" ] ) )
                {
                    info[ i ][ "player" ] stoplocalsound( info[ i ][ "sound_alias" ] );
                }
            }
        }
        
        break;
    }
    
    if ( waittime > level.bcinfo[ "max_wait_time" ] + delay * 1000 )
    {
        /#
            battlechatter_print( "<dev string:x193>" + function_3c8848a3a11b2553( soundtype ), "<dev string:x36>" );
        #/
        
        self.bcinfoqueued = "none";
        return;
    }
    
    self.bcinfoqueued = "none";
    thread dosound( soundtype, targetent, location );
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x66c3
// Size: 0x381
function getbcwaittime( soundtype, delay )
{
    if ( !isdefined( delay ) )
    {
        delay = 0;
    }
    
    timeoutteamtime = 0;
    positionrelevant = 0;
    
    if ( isdefined( level.bcinfo[ "soundEventHistory" ][ soundtype ] ) )
    {
        if ( soundtype == #"bc_combat_inform_contact_generic" || soundtype == #"bc_combat_inform_contact" || soundtype == #"bc_combat_inform_contact_multiple" )
        {
            var_b53830ff2a079e80 = [];
            var_b53830ff2a079e80[ var_b53830ff2a079e80.size ] = #"bc_combat_inform_contact_generic";
            var_b53830ff2a079e80[ var_b53830ff2a079e80.size ] = #"bc_combat_inform_contact";
            var_b53830ff2a079e80[ var_b53830ff2a079e80.size ] = #"bc_combat_inform_contact_multiple";
            
            foreach ( entry in var_b53830ff2a079e80 )
            {
                if ( !isdefined( level.bcinfo[ "soundEventHistory" ][ entry ] ) )
                {
                    continue;
                }
                
                foreach ( event in level.bcinfo[ "soundEventHistory" ][ entry ] )
                {
                    if ( distancesquared( event.origin, self.origin ) < 4000000 )
                    {
                        var_c4ac6795e14927d0 = event.time + function_ffd3470f08fcf7a7( entry );
                        
                        if ( var_c4ac6795e14927d0 > timeoutteamtime )
                        {
                            timeoutteamtime = var_c4ac6795e14927d0;
                            positionrelevant = 1;
                        }
                    }
                }
                
                if ( positionrelevant )
                {
                    break;
                }
            }
        }
        else if ( soundtype == #"bc_status_inform_on_your_six" )
        {
            foreach ( event in level.bcinfo[ "soundEventHistory" ][ soundtype ] )
            {
                if ( distancesquared( event.origin, self.origin ) < 2250000 )
                {
                    var_c4ac6795e14927d0 = event.time + function_ffd3470f08fcf7a7( soundtype );
                    
                    if ( var_c4ac6795e14927d0 > timeoutteamtime )
                    {
                        timeoutteamtime = var_c4ac6795e14927d0;
                        positionrelevant = 1;
                    }
                }
            }
        }
        else
        {
            foreach ( event in level.bcinfo[ "soundEventHistory" ][ soundtype ] )
            {
                if ( distancesquared( event.origin, self.origin ) < 1048576 )
                {
                    var_c4ac6795e14927d0 = event.time + function_ffd3470f08fcf7a7( soundtype );
                    
                    if ( var_c4ac6795e14927d0 > timeoutteamtime )
                    {
                        timeoutteamtime = var_c4ac6795e14927d0;
                        positionrelevant = 1;
                    }
                }
            }
        }
    }
    
    if ( !isdefined( self.bcinfolastsaytimes[ soundtype ] ) )
    {
        self.bcinfolastsaytimes[ soundtype ] = 0;
    }
    
    var_dcbb8c92238f7098 = self.bcinfolastsaytimes[ soundtype ] + function_a71193e9db14c926( soundtype );
    timeoutdelaytime = gettime() + delay * 1000;
    
    if ( positionrelevant )
    {
        timeouttime = max( var_dcbb8c92238f7098, max( timeoutteamtime, timeoutdelaytime ) );
    }
    else
    {
        timeouttime = max( var_dcbb8c92238f7098, timeoutdelaytime );
    }
    
    waittime = timeouttime - gettime();
    return waittime;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6a4d
// Size: 0x150
function getspeakerinfo( player, priority, range )
{
    if ( !isdefined( range ) )
    {
        range = 1000;
    }
    
    distsq = range * range;
    var_139b1d1bf64d28f0 = [];
    var_139b1d1bf64d28f0[ "lower" ] = [];
    
    if ( isdefined( player ) && isdefined( player.team ) && player.team != "spectator" )
    {
        for (index = 0; index < level.speakers[ player.team ].size; index++) {
            speakerinfo = level.speakers[ player.team ][ index ];
            teammate = speakerinfo[ "player" ];
            speakerpriority = speakerinfo[ "priority" ];
            
            if ( !isdefined( teammate ) )
            {
                continue;
            }
            
            if ( distancesquared( teammate.origin, player.origin ) < distsq )
            {
                if ( isdefined( speakerpriority ) )
                {
                    if ( speakerpriority > priority || speakerpriority == priority && cointoss() )
                    {
                        var_139b1d1bf64d28f0[ "higher" ] = speakerinfo;
                        return var_139b1d1bf64d28f0;
                    }
                    
                    var_139b1d1bf64d28f0[ "lower" ][ var_139b1d1bf64d28f0[ "lower" ].size ] = speakerinfo;
                }
            }
        }
    }
    
    return var_139b1d1bf64d28f0;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6ba6
// Size: 0x6f
function comparesoundpriorities( s1, s2 )
{
    none = s2 == "none";
    
    if ( none )
    {
        return none;
    }
    
    higherpriority = function_336e1f89ae06dfd4( s2 ) < function_336e1f89ae06dfd4( s1 );
    var_35470d4859f3e586 = function_336e1f89ae06dfd4( s2 ) == function_336e1f89ae06dfd4( s1 ) && cointoss();
    return higherpriority || var_35470d4859f3e586;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6c1e
// Size: 0x6c
function saidtoorecently( soundtype, delay )
{
    if ( !isdefined( self ) || !isgameplayteam( self.team ) )
    {
        return 1;
    }
    
    if ( !isdefined( delay ) )
    {
        delay = 0;
    }
    
    waittime = getbcwaittime( soundtype, delay );
    
    if ( waittime > level.bcinfo[ "max_wait_time" ] + delay * 1000 )
    {
        return 1;
    }
    
    return 0;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c92
// Size: 0x3, Type: bool
function runleanthreadmode()
{
    return false;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c9e
// Size: 0x4
function gettimepassedpercentage()
{
    return 50;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6cab
// Size: 0x89
function getteamvoiceinfix( teamref )
{
    if ( !isdefined( level.teamdata ) )
    {
        level.teamdata = [];
    }
    
    if ( !isdefined( level.teamdata[ teamref ] ) )
    {
        level.teamdata[ teamref ] = [];
    }
    
    if ( !isdefined( level.teamdata[ teamref ][ "soundInfix" ] ) )
    {
        level.teamdata[ teamref ][ "soundInfix" ] = function_716b04a356073ae5( game[ teamref ] ).var_d5fbbcddd0fdfe3b;
    }
    
    return level.teamdata[ teamref ][ "soundInfix" ];
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6d3d
// Size: 0xdb
function getfriendlyplayers( testteam, aliveonly )
{
    friends = [];
    
    if ( istrue( aliveonly ) )
    {
        foreach ( player in getplayersinteam( testteam ) )
        {
            if ( isdefined( player ) && isalive( player ) && !isdefined( player.fauxdead ) )
            {
                friends[ friends.size ] = player;
            }
        }
    }
    else
    {
        foreach ( player in getplayersinteam( testteam ) )
        {
            friends[ friends.size ] = player;
        }
    }
    
    return friends;
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6e21
// Size: 0xf9
function getsquadmates( testteam, testsquadindex, aliveonly )
{
    if ( isdefined( testteam ) && isdefined( testsquadindex ) && isdefined( level.squaddata ) && isdefined( level.squaddata[ testteam ] ) && isdefined( level.squaddata[ testteam ][ testsquadindex ] ) )
    {
        if ( istrue( aliveonly ) )
        {
            squadmates = [];
            
            foreach ( player in level.squaddata[ testteam ][ testsquadindex ].players )
            {
                if ( scripts\cp\utility\player::isreallyalive( player ) )
                {
                    squadmates[ squadmates.size ] = player;
                }
            }
            
            return squadmates;
        }
        else
        {
            return level.squaddata[ testteam ][ testsquadindex ].players;
        }
    }
    
    return getfriendlyplayers( testteam, aliveonly );
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6f23
// Size: 0x242
function playkillstreakdeploydialog( owner, streakname )
{
    if ( !isdefined( streakname ) )
    {
        return;
    }
    
    switch ( streakname )
    {
        case #"hash_349713b5ad494dda":
        case #"hash_413c38e72fe8b5bf":
        case #"hash_691f39dddd9116b8":
        case #"hash_b161e185f1b8e117":
            level thread trysaylocalsound( owner, #"bc_killstreak_action_airsupport" );
            break;
        case #"hash_cf0ef5bef19a311b":
            level thread trysaylocalsound( owner, #"bc_killstreak_action_wheelson" );
            break;
        case #"hash_2289ec11d77bce8f":
        case #"hash_4ad475e6e15635bd":
        case #"hash_56979e0566996b2e":
        case #"hash_887ad77192b9c4fb":
        case #"hash_e477c24ee18bb2f6":
            level thread trysaylocalsound( owner, #"bc_killstreak_action_airdrop" );
            break;
        case #"hash_4d5aa76e8707f47b":
            level thread trysaylocalsound( owner, #"bc_killstreak_action_sentrygun" );
            break;
        case #"hash_195360490caa3220":
        case #"hash_7e7648c4805888c5":
            level thread trysaylocalsound( owner, #"bc_killstreak_action_nuke" );
            break;
        case #"hash_bf2f9adbd2b41d5":
        case #"hash_28d0236400e33fd0":
        case #"hash_4220be38a5f150b8":
        case #"hash_42fd64e842a4c3d7":
        case #"hash_8c766d6477287bb6":
        case #"hash_b4ac3581c343a029":
        case #"hash_e6bea339d3cbd3e8":
            level thread trysaylocalsound( owner, #"bc_killstreak_action_airstrike" );
            break;
        case #"hash_634b246c3da5c56f":
        case #"hash_e171e5b86ef0a4cc":
        case #"hash_f64c697bfb4c6b54":
            level thread trysaylocalsound( owner, #"bc_killstreak_action_recon" );
            break;
        case #"hash_10e585c25e7e9f60":
        case #"hash_27002778019fb447":
            level thread trysaylocalsound( owner, #"bc_killstreak_action_counteruav" );
            break;
        case #"hash_4d35eb58f9d545f0":
            level thread trysaylocalsound( owner, #"bc_killstreak_action_clustermine" );
            break;
        case #"hash_9e36e3bd3a9dd00d":
            level thread trysaylocalsound( owner, #"bc_killstreak_action_bombdrone" );
            break;
    }
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x716d
// Size: 0x245
function handlehellodialog()
{
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );
    self notify( "handleHelloDialog" );
    self endon( "handleHelloDialog" );
    mindist = 40;
    mindistsq = squared( mindist );
    maxdist = 280;
    maxdistsq = squared( maxdist );
    contents = scripts\engine\trace::create_solid_ai_contents( 1 );
    self.var_d94e306d9220520b = 0;
    
    while ( true )
    {
        self waittill( "adjustedStance" );
        
        if ( level.players.size == 1 )
        {
            continue;
        }
        
        wait 0.25;
        stance = self getstance();
        
        if ( !isdefined( stance ) || stance != "crouch" )
        {
            continue;
        }
        
        if ( gettime() - self.var_d94e306d9220520b < 1000 )
        {
            lookingatplayer = 0;
            
            foreach ( player in level.players )
            {
                if ( self == player )
                {
                    continue;
                }
                
                if ( lookingatplayer )
                {
                    continue;
                }
                
                if ( !isdefined( player.origin ) || !isdefined( self.origin ) )
                {
                    continue;
                }
                
                if ( distancesquared( self.origin, player.origin ) > maxdistsq )
                {
                    continue;
                }
                
                if ( distancesquared( self.origin, player.origin ) < mindistsq )
                {
                    continue;
                }
                
                if ( !scripts\engine\utility::within_fov( self geteye(), self getplayerangles(), player geteye(), cos( 30 ) ) )
                {
                    continue;
                }
                
                if ( !scripts\engine\utility::within_fov( player geteye(), player getplayerangles(), self geteye(), cos( 30 ) ) )
                {
                    continue;
                }
                
                if ( !scripts\engine\trace::ray_trace_passed( self geteye(), player geteye(), self, contents ) )
                {
                    continue;
                }
                
                lookingatplayer = 1;
            }
            
            if ( lookingatplayer )
            {
                level thread trysaylocalsound( self, #"ping_social_hello", undefined, 0.6 );
                wait 10;
            }
        }
        
        self.var_d94e306d9220520b = gettime();
        wait 0.5;
    }
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x73ba
// Size: 0x36
function function_336e1f89ae06dfd4( soundtype )
{
    return ter_op( isdefined( level.bcinfo[ "priority" ][ soundtype ] ), level.bcinfo[ "priority" ][ soundtype ], 1 );
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x73f9
// Size: 0x39
function function_c02b6ba215c2dca8( soundtype )
{
    return ter_op( isdefined( level.bcinfo[ "chance" ][ soundtype ] ), level.bcinfo[ "chance" ][ soundtype ], 0 );
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x743b
// Size: 0x39
function function_ffd3470f08fcf7a7( soundtype )
{
    return ter_op( isdefined( level.bcinfo[ "timeout_pos" ][ soundtype ] ), level.bcinfo[ "timeout_pos" ][ soundtype ], 1000 );
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x747d
// Size: 0x39
function function_a71193e9db14c926( soundtype )
{
    return ter_op( isdefined( level.bcinfo[ "timeout_player" ][ soundtype ] ), level.bcinfo[ "timeout_player" ][ soundtype ], 1000 );
}

// Namespace cp_player_battlechatter / scripts\cp\cp_player_battlechatter
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x74bf
// Size: 0x35
function function_b96f48dbdcd7110( soundtype )
{
    return ter_op( isdefined( level.bcinfo[ "req_friendly" ][ soundtype ] ), level.bcinfo[ "req_friendly" ][ soundtype ], 0 );
}

