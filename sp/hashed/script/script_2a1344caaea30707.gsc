#using scripts\common\utility;
#using scripts\cp_mp\parachute;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\utility\vehicle_omnvar_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\cp_mp\vehicles\vehicle_compass;
#using scripts\cp_mp\vehicles\vehicle_damage;
#using scripts\cp_mp\vehicles\vehicle_dlog;
#using scripts\cp_mp\vehicles\vehicle_interact;
#using scripts\cp_mp\vehicles\vehicle_occupancy;
#using scripts\cp_mp\vehicles\vehicle_spawn;
#using scripts\cp_mp\vehicles\vehicle_tracking;
#using scripts\engine\math;
#using scripts\engine\utility;
#using scripts\mp\objidpoolmanager;

#namespace namespace_c4b1ddb88afb6e86;

// Namespace namespace_c4b1ddb88afb6e86 / namespace_acf070dc0fbdf549
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x2a1
// Size: 0x13
function autoexec main()
{
    function_c0b3ddc9a6bdcc46( "veh_jup_heli_med", &function_d66a35ee96029ca7 );
}

// Namespace namespace_c4b1ddb88afb6e86 / namespace_acf070dc0fbdf549
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2bc
// Size: 0x209
function private function_d66a35ee96029ca7()
{
    if ( !function_9697379150687859( "veh_jup_heli_med" ) )
    {
        return;
    }
    
    level.lb_dmg_factor_fuselage = getdvarfloat( @"hash_caaf89c827ec21", 1 );
    level.lb_dmg_factor_tail_stabilizer = getdvarfloat( @"hash_b169f648e4e1b87f", 1 );
    level.lb_dmg_factor_main_rotor = getdvarfloat( @"hash_78352418b2460f21", 1.2 );
    level.lb_dmg_factor_tail_rotor = getdvarfloat( @"hash_b522e174ec772a4a", 1 );
    level.lb_dmg_factor_landing_gear = getdvarfloat( @"hash_c2dc6a2c32c62f18", 0.5 );
    level.lb_dmg_factor_driverless_collision = getdvarfloat( @"hash_e85cda72d3c3c14b", 3 );
    level.lb_impulse_dmg_threshold_top = getdvarfloat( @"hash_3d4b0c0e7008d889", 0.9 );
    level.lb_impulse_dmg_threshold_mid = getdvarfloat( @"hash_eeaced8fd62d7d31", 0.5 );
    level.lb_impulse_dmg_threshold_low = getdvarfloat( @"hash_fada138fde409535", 0.2 );
    level.lb_impulse_dmg_factor_low = getdvarfloat( @"hash_12c7a9c89bf6ed57", 0.1 );
    level.lb_impulse_dmg_factor_mid_low = getdvarfloat( @"hash_dc50e2e689514b56", 0.2 );
    level.lb_impulse_dmg_factor_mid_high = getdvarfloat( @"hash_555a8558a6d3b598", 0.75 );
    level.lb_pitch_roll_dmg_threshold = getdvarfloat( @"hash_f1d6ba97f092c311", 55 );
    level.lb_pitch_roll_dmg_factor = getdvarfloat( @"hash_c606efb22605e501", 10 );
    level.lb_wood_surf_dmg_scalar = getdvarfloat( @"hash_4d381994cf7e3faa", 0.6 );
    callbacks = [];
    callbacks[ "spawn" ] = &function_fbd1dd3ece7bbf09;
    callbacks[ "enterStart" ] = &function_8c309b27d128acbb;
    callbacks[ "enterEnd" ] = &function_be239e3157d7881e;
    callbacks[ "exitEnd" ] = &function_ddaa315d2b9d1e7e;
    function_8497e7e46b5e397( "veh_jup_heli_med", callbacks );
    function_ab3464fc447babb1();
}

// Namespace namespace_c4b1ddb88afb6e86 / namespace_acf070dc0fbdf549
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4cd
// Size: 0x2c
function private function_ab3464fc447babb1()
{
    leveldataforvehicle = vehomn_getleveldataforvehicle( "veh_jup_heli_med" );
    leveldataforvehicle.ammoids[ "flares" ] = 1;
}

// Namespace namespace_c4b1ddb88afb6e86 / namespace_acf070dc0fbdf549
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x501
// Size: 0x17e
function private function_fbd1dd3ece7bbf09( spawndata, faildata )
{
    spawndata.cannotbesuspended = 1;
    vehicle = function_bba34cf920370ff4( "veh_jup_heli_med", spawndata, faildata );
    
    if ( !isdefined( vehicle ) )
    {
        return undefined;
    }
    
    vehicle.borntime = gettime();
    vehicle.flareslive = [];
    vehicle.flareready = 1;
    
    if ( scripts\cp_mp\utility\game_utility::isbrstylegametype() )
    {
        vehicle.flarecooldown = 35;
    }
    else
    {
        vehicle.flarecooldown = 10;
    }
    
    vehicle thread vehicle_handleflarerecharge();
    vehicle thread collision_damage_watcher();
    vehicledata = function_29b4292c92443328( "veh_jup_heli_med" );
    
    if ( istrue( vehicledata.ai.supportsai ) && istrue( spawndata.initai ) )
    {
        vehicle.unload_land_offset = 112;
        vehicle.unload_hover_offset = 120;
        vehicle.script_badplace = 0;
        vehicle vehicle_setspeed( 60, 20, 10 );
        vehicle.preventrespawn = 1;
        vehicle.var_a8f4bb03b366aa80 = 1;
        vehicle.deathfunc = &vehicle_death;
        vehicle scripts\cp_mp\vehicles\vehicle_occupancy::function_a91927df280e94e4();
    }
    
    if ( iscp() )
    {
        entnumber = vehicle getentitynumber();
        vehicle addtolittlebirdlist( entnumber );
        vehicle thread removefromlittlebirdlistondeath( entnumber );
    }
    
    return vehicle;
}

// Namespace namespace_c4b1ddb88afb6e86 / namespace_acf070dc0fbdf549
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x688
// Size: 0x2e0
function private collision_damage_watcher()
{
    self endon( "death" );
    self vehphys_enablecollisioncallback( 1 );
    
    while ( true )
    {
        self waittill( "collision", body0, body1, flag0, flag1, position, normal, normalspeed, ent, partenum );
        
        if ( gettime() - self.borntime < 5000 )
        {
            continue;
        }
        
        if ( isdefined( ent ) && istrue( ent.iscrossbowbolt ) )
        {
            continue;
        }
        
        if ( isdefined( ent ) && isdefined( ent.helperdronetype ) && ent.helperdronetype == "radar_drone_recon" )
        {
            continue;
        }
        
        if ( istrue( self.var_a1a5d39c25c6d70b ) )
        {
            continue;
        }
        
        damagefactor = normalspeed;
        driver = vehicle_occupancy_getdriver( self );
        
        if ( !isdefined( driver ) )
        {
            damagefactor *= level.lb_dmg_factor_driverless_collision;
        }
        
        pitch = self.angles[ 0 ];
        
        if ( pitch > 180 )
        {
            pitch -= 360;
        }
        
        if ( abs( pitch > level.lb_pitch_roll_dmg_threshold ) )
        {
            damagefactor *= level.lb_pitch_roll_dmg_factor;
        }
        
        roll = self.angles[ 2 ];
        
        if ( roll > 180 )
        {
            roll -= 360;
        }
        
        if ( abs( roll > level.lb_pitch_roll_dmg_threshold ) )
        {
            damagefactor *= level.lb_pitch_roll_dmg_factor;
        }
        
        dmgval = 0;
        
        if ( damagefactor > level.lb_impulse_dmg_threshold_top )
        {
            dmgval = self.maxhealth;
        }
        else if ( damagefactor > level.lb_impulse_dmg_threshold_mid )
        {
            range = level.lb_impulse_dmg_threshold_top - level.lb_impulse_dmg_threshold_mid;
            factorscale = ( damagefactor - level.lb_impulse_dmg_threshold_mid ) / range;
            mindmg = self.maxhealth * level.lb_impulse_dmg_factor_mid_low;
            maxdmg = self.maxhealth * level.lb_impulse_dmg_factor_mid_high;
            dmgval = math::lerp( mindmg, maxdmg, factorscale );
        }
        else if ( damagefactor > level.lb_impulse_dmg_threshold_low )
        {
            dmgval = self.maxhealth * level.lb_impulse_dmg_factor_low;
        }
        
        if ( dmgval > 0 )
        {
            if ( isdefined( driver ) && flag1 == 11534336 )
            {
                dmgval *= level.lb_wood_surf_dmg_scalar;
            }
            
            vehicle_damage_disablestatedamagefloor( 1 );
            self dodamage( dmgval, position, undefined, undefined, "MOD_CRUSH" );
            vehicle_damage_disablestatedamagefloor( 0 );
        }
        
        wait 0.5;
    }
}

// Namespace namespace_c4b1ddb88afb6e86 / namespace_acf070dc0fbdf549
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x970
// Size: 0x155
function private function_8c309b27d128acbb( vehicle, seatid, var_fc7c7a874b43a31a, player, data )
{
    if ( istrue( vehicle.israllypointvehicle ) )
    {
        foreach ( plr in level.players )
        {
            if ( istrue( vehicle.revealed ) || is_equal( plr.team, vehicle.team ) )
            {
                scripts\mp\objidpoolmanager::objective_playermask_addshowplayer( vehicle.marker.objidnum, plr );
            }
        }
        
        foreach ( occupant in vehicle.occupants )
        {
            scripts\mp\objidpoolmanager::objective_playermask_hidefrom( vehicle.marker.objidnum, occupant );
        }
        
        scripts\mp\objidpoolmanager::objective_playermask_hidefrom( vehicle.marker.objidnum, player );
    }
}

// Namespace namespace_c4b1ddb88afb6e86 / namespace_acf070dc0fbdf549
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0xacd
// Size: 0x4e
function private function_be239e3157d7881e( vehicle, seatid, var_fc7c7a874b43a31a, player, data )
{
    if ( istrue( data.success ) )
    {
        player scripts\cp_mp\parachute::parachutecleanup();
        function_a3f92a156d7e7bf3( vehicle, seatid, var_fc7c7a874b43a31a, player, data );
    }
}

// Namespace namespace_c4b1ddb88afb6e86 / namespace_acf070dc0fbdf549
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0xb23
// Size: 0x93
function private function_a3f92a156d7e7bf3( vehicle, seatid, var_fc7c7a874b43a31a, player, data )
{
    if ( seatid == "driver" )
    {
        vehicle thread vehicle_handleflarefire( player );
        
        if ( issharedfuncdefined( "pmc_missions", "onEnterMediumBird" ) )
        {
            [[ getsharedfunc( "pmc_missions", "onEnterMediumBird" ) ]]( vehicle, seatid, var_fc7c7a874b43a31a, player, data );
        }
    }
    
    vehomn_updateomnvarsonseatenter( vehicle, var_fc7c7a874b43a31a, seatid, player );
    
    if ( isdefined( level.var_9215e3a9dfe8a262 ) )
    {
        [[ level.var_9215e3a9dfe8a262 ]]( vehicle, seatid, var_fc7c7a874b43a31a, player, data );
    }
}

// Namespace namespace_c4b1ddb88afb6e86 / namespace_acf070dc0fbdf549
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0xbbe
// Size: 0x46
function private function_ddaa315d2b9d1e7e( vehicle, seatid, var_7558f98f3236963d, player, data )
{
    if ( istrue( data.success ) )
    {
        function_6cfa88308827e953( vehicle, seatid, var_7558f98f3236963d, player, data );
    }
}

// Namespace namespace_c4b1ddb88afb6e86 / namespace_acf070dc0fbdf549
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0xc0c
// Size: 0xd1
function private function_6cfa88308827e953( vehicle, seatid, var_7558f98f3236963d, player, data )
{
    if ( seatid == "driver" )
    {
        vehicle notify( "little_bird_driver_exit" );
    }
    
    if ( !istrue( data.playerdisconnect ) )
    {
        success = vehicle_occupancy_moveplayertoexit( vehicle, seatid, var_7558f98f3236963d, player, data );
        
        if ( !success )
        {
            if ( issharedfuncdefined( "vehicle_occupancy", "handleSuicideFromVehicles" ) )
            {
                [[ getsharedfunc( "vehicle_occupancy", "handleSuicideFromVehicles" ) ]]( player );
            }
            else
            {
                player suicide();
            }
        }
        else if ( istrue( vehicle.israllypointvehicle ) )
        {
            scripts\mp\objidpoolmanager::objective_playermask_addshowplayer( vehicle.marker.objidnum, player );
        }
    }
    
    vehomn_updateomnvarsonseatexit( vehicle, seatid, var_7558f98f3236963d, player );
}

// Namespace namespace_c4b1ddb88afb6e86 / namespace_acf070dc0fbdf549
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xce5
// Size: 0xe0
function private vehicle_handleflarerecharge()
{
    var_e9227a816ed1d671 = 1.05;
    self endon( "death" );
    
    while ( true )
    {
        driver = vehicle_occupancy_getdriver( self );
        
        if ( self.flareready )
        {
            if ( isdefined( driver ) )
            {
                if ( driver getclientomnvar( "ui_veh_flares_charge_perc" ) < 1.05 )
                {
                    driver setclientomnvar( "ui_veh_flares_charge_perc", 1.05 );
                    vehomn_setammo( "veh_jup_heli_med", "flares", 1, driver );
                }
            }
        }
        else
        {
            var_c770d2ae1cc0b405 = 0;
            
            while ( var_c770d2ae1cc0b405 < self.flarecooldown )
            {
                wait 0.05;
                var_c770d2ae1cc0b405 += 0.05;
                var_e9227a816ed1d671 = var_c770d2ae1cc0b405 / self.flarecooldown;
                driver = vehicle_occupancy_getdriver( self );
                
                if ( isdefined( driver ) )
                {
                    driver setclientomnvar( "ui_veh_flares_charge_perc", var_e9227a816ed1d671 );
                }
            }
            
            self.flareready = 1;
        }
        
        waitframe();
    }
}

// Namespace namespace_c4b1ddb88afb6e86 / namespace_acf070dc0fbdf549
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xdcd
// Size: 0x204
function private vehicle_handleflarefire( player )
{
    self endon( "death" );
    self endon( "little_bird_driver_exit" );
    player endon( "death_or_disconnect" );
    player endon( "vehicle_exit" );
    player notifyonplayercommand( "shoot_flare", "+attack" );
    vehomn_setammo( "veh_jup_heli_med", "flares", ter_op( self.flareready, 1, 0 ), player );
    
    while ( true )
    {
        player waittill( "shoot_flare" );
        
        if ( !self.flareready )
        {
            self playsoundtoplayer( "lbravo_noflares_warning", player );
            continue;
        }
        
        if ( issharedfuncdefined( "flares", "playFx" ) )
        {
            self thread [[ getsharedfunc( "flares", "playFx" ) ]]();
        }
        
        newtarget = undefined;
        
        if ( issharedfuncdefined( "flares", "deploy" ) )
        {
            newtarget = self [[ getsharedfunc( "flares", "deploy" ) ]]();
        }
        
        if ( isdefined( level.missiles ) )
        {
            foreach ( missile in level.missiles )
            {
                if ( !isdefined( missile.origin ) || !isdefined( missile.lockontarget ) || missile.lockontarget != self )
                {
                    continue;
                }
                
                curdist = distance( self.origin, missile.origin );
                
                if ( curdist < 4000 )
                {
                    if ( issharedfuncdefined( "player", "doScoreEvent" ) )
                    {
                        player thread [[ getsharedfunc( "player", "doScoreEvent" ) ]]( "manual_flare_missile_redirect" );
                    }
                    
                    clearprojectilelockedon( missile );
                    missile missile_settargetent( newtarget );
                    missile notify( "missile_pairedWithFlare" );
                }
            }
        }
        
        self.flareready = 0;
        vehomn_setammo( "veh_jup_heli_med", "flares", 0, player );
        vehicle_occupancy_fadeoutcontrols( player );
    }
}

// Namespace namespace_c4b1ddb88afb6e86 / namespace_acf070dc0fbdf549
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xfd9
// Size: 0x2f
function private addtolittlebirdlist( entnumber )
{
    if ( !isdefined( level.littlebirds ) )
    {
        level.littlebirds = [];
    }
    
    level.littlebirds[ entnumber ] = self;
}

// Namespace namespace_c4b1ddb88afb6e86 / namespace_acf070dc0fbdf549
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1010
// Size: 0x1e
function private removefromlittlebirdlistondeath( entnumber )
{
    self waittill( "death" );
    level.littlebirds[ entnumber ] = undefined;
}

