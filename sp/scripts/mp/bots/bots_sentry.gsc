#using scripts\common\utility;
#using scripts\engine\utility;
#using scripts\mp\bots\bots_killstreaks;
#using scripts\mp\bots\bots_strategy;
#using scripts\mp\bots\bots_util;
#using scripts\mp\killstreaks\autosentry;
#using scripts\mp\killstreaks\placeable;

#namespace bots_sentry;

// Namespace bots_sentry / scripts\mp\bots\bots_sentry
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x221
// Size: 0xf7, Type: bool
function bot_killstreak_sentry( killstreak_info, killstreaks_array, can_use, targettype )
{
    self endon( "bot_sentry_exited" );
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );
    wait randomintrange( 3, 5 );
    
    while ( isdefined( self.sentry_place_delay ) && gettime() < self.sentry_place_delay )
    {
        wait 1;
    }
    
    if ( isdefined( self.enemy ) && self.enemy.health > 0 && self botcanseeentity( self.enemy ) )
    {
        return true;
    }
    
    targetpoint = self.origin;
    
    if ( targettype != "hide_nonlethal" )
    {
        targetpoint = bot_sentry_choose_target( targettype );
        
        if ( !isdefined( targetpoint ) )
        {
            return true;
        }
    }
    
    bot_sentry_add_goal( killstreak_info, targetpoint, targettype, killstreaks_array );
    
    while ( bot_has_tactical_goal( "sentry_placement" ) )
    {
        wait 0.5;
    }
    
    return true;
}

// Namespace bots_sentry / scripts\mp\bots\bots_sentry
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x321
// Size: 0x106
function bot_sentry_add_goal( killstreak_info, targetorigin, targettype, killstreaks_array )
{
    placement = bot_sentry_choose_placement( killstreak_info, targetorigin, targettype, killstreaks_array );
    
    if ( isdefined( placement ) )
    {
        bot_abort_tactical_goal( "sentry_placement" );
        extra_params = spawnstruct();
        extra_params.object = placement;
        extra_params.script_goal_yaw = placement.yaw;
        extra_params.script_goal_radius = 10;
        extra_params.start_thread = &bot_sentry_path_start;
        extra_params.end_thread = &bot_sentry_cancel;
        extra_params.should_abort = &bot_sentry_should_abort;
        extra_params.action_thread = &bot_sentry_activate;
        self.placingitemstreakname = killstreak_info.streakname;
        bot_new_tactical_goal( "sentry_placement", placement.node.origin, 0, extra_params );
    }
}

// Namespace bots_sentry / scripts\mp\bots\bots_sentry
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x42f
// Size: 0x68, Type: bool
function bot_sentry_should_abort( tactical_goal )
{
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );
    
    if ( isdefined( self.enemy ) && self.enemy.health > 0 && self botcanseeentity( self.enemy ) )
    {
        return true;
    }
    
    self.sentry_place_delay = gettime() + 1000;
    return false;
}

// Namespace bots_sentry / scripts\mp\bots\bots_sentry
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a0
// Size: 0x6d
function bot_sentry_cancel_failsafe()
{
    self endon( "death_or_disconnect" );
    self endon( "bot_sentry_canceled" );
    self endon( "bot_sentry_ensure_exit" );
    level endon( "game_ended" );
    
    while ( true )
    {
        if ( isdefined( self.enemy ) && self.enemy.health > 0 && self botcanseeentity( self.enemy ) )
        {
            thread bot_sentry_cancel();
        }
        
        wait 0.05;
    }
}

// Namespace bots_sentry / scripts\mp\bots\bots_sentry
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x515
// Size: 0x14
function bot_sentry_path_start( tactical_goal )
{
    thread bot_sentry_path_thread( tactical_goal );
}

// Namespace bots_sentry / scripts\mp\bots\bots_sentry
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x531
// Size: 0xfc
function bot_sentry_path_thread( tactical_goal )
{
    self endon( "stop_tactical_goal" );
    self endon( "stop_goal_aborted_watch" );
    self endon( "bot_sentry_canceled" );
    self endon( "bot_sentry_exited" );
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );
    
    while ( isdefined( tactical_goal.object ) && isdefined( tactical_goal.object.weapon ) )
    {
        if ( distance2d( self.origin, tactical_goal.object.node.origin ) < 400 )
        {
            thread bot_force_stance_for_time( "stand", 5 );
            thread bot_sentry_cancel_failsafe();
            bot_switch_to_killstreak_weapon( tactical_goal.object.killstreak_info, tactical_goal.object.killstreaks_array, tactical_goal.object.weapon );
            return;
        }
        
        wait 0.05;
    }
}

// Namespace bots_sentry / scripts\mp\bots\bots_sentry
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x635
// Size: 0xf1
function bot_sentry_choose_target( targettype )
{
    defend_center = defend_valid_center();
    
    if ( isdefined( defend_center ) )
    {
        return defend_center;
    }
    
    if ( isdefined( self.node_ambushing_from ) )
    {
        return self.node_ambushing_from.origin;
    }
    
    nodes = getnodesinradius( self.origin, 1000, 0, 512 );
    var_def8cd540eab8dc = 5;
    
    if ( targettype != "turret" )
    {
        if ( self botgetdifficultysetting( "strategyLevel" ) == 1 )
        {
            var_def8cd540eab8dc = 10;
        }
        else if ( self botgetdifficultysetting( "strategyLevel" ) == 0 )
        {
            var_def8cd540eab8dc = 15;
        }
    }
    
    if ( targettype == "turret_air" )
    {
        targetnode = self botnodepick( nodes, var_def8cd540eab8dc, "node_exposed", "ignore_no_sky" );
    }
    else
    {
        targetnode = self botnodepick( nodes, var_def8cd540eab8dc, "node_exposed" );
    }
    
    if ( isdefined( targetnode ) )
    {
        return targetnode.origin;
    }
}

// Namespace bots_sentry / scripts\mp\bots\bots_sentry
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x72e
// Size: 0x195
function bot_sentry_choose_placement( killstreak_info, targetorigin, targettype, killstreaks_array )
{
    placement = undefined;
    nodes = getnodesinradius( targetorigin, 1000, 0, 512 );
    var_def8cd540eab8dc = 5;
    
    if ( targettype != "turret" )
    {
        if ( self botgetdifficultysetting( "strategyLevel" ) == 1 )
        {
            var_def8cd540eab8dc = 10;
        }
        else if ( self botgetdifficultysetting( "strategyLevel" ) == 0 )
        {
            var_def8cd540eab8dc = 15;
        }
    }
    
    if ( targettype == "turret_air" )
    {
        placenode = self botnodepick( nodes, var_def8cd540eab8dc, "node_sentry", targetorigin, "ignore_no_sky" );
    }
    else if ( targettype == "trap" )
    {
        placenode = self botnodepick( nodes, var_def8cd540eab8dc, "node_exposed" );
    }
    else if ( targettype == "hide_nonlethal" )
    {
        placenode = self botnodepick( nodes, var_def8cd540eab8dc, "node_hide" );
    }
    else
    {
        placenode = self botnodepick( nodes, var_def8cd540eab8dc, "node_sentry", targetorigin );
    }
    
    if ( isdefined( placenode ) )
    {
        placement = spawnstruct();
        placement.node = placenode;
        
        if ( targetorigin != placenode.origin && targettype != "hide_nonlethal" )
        {
            placement.yaw = vectortoyaw( targetorigin - placenode.origin );
        }
        else
        {
            placement.yaw = undefined;
        }
        
        placement.weapon = killstreak_info.weapon;
        placement.killstreak_info = killstreak_info;
        placement.killstreaks_array = killstreaks_array;
    }
    
    return placement;
}

// Namespace bots_sentry / scripts\mp\bots\bots_sentry
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8cc
// Size: 0x47
function bot_sentry_carried_obj()
{
    if ( isdefined( self.carriedsentry ) )
    {
        return self.carriedsentry;
    }
    
    if ( isdefined( self.carriedims ) )
    {
        return self.carriedims;
    }
    
    if ( isdefined( self.carrieditem ) )
    {
        return self.carrieditem;
    }
}

// Namespace bots_sentry / scripts\mp\bots\bots_sentry
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x91b
// Size: 0x296
function bot_sentry_activate( tactical_goal )
{
    result = 0;
    carried_obj = bot_sentry_carried_obj();
    
    if ( isdefined( carried_obj ) )
    {
        abort = 0;
        
        if ( !carried_obj.canbeplaced )
        {
            var_199798d5fd510aea = 0.75;
            start_time = gettime();
            placementyaw = self.angles[ 1 ];
            
            if ( isdefined( tactical_goal.object.yaw ) )
            {
                placementyaw = tactical_goal.object.yaw;
            }
            
            var_b039ace808558a68 = [];
            var_b039ace808558a68[ 0 ] = placementyaw + 180;
            var_b039ace808558a68[ 1 ] = placementyaw + 135;
            var_b039ace808558a68[ 2 ] = placementyaw - 135;
            mindist = 1000;
            
            foreach ( moveyaw in var_b039ace808558a68 )
            {
                hitpos = playerphysicstrace( tactical_goal.object.node.origin, tactical_goal.object.node.origin + anglestoforward( ( 0, moveyaw + 180, 0 ) ) * 100 );
                dist = distance2d( hitpos, tactical_goal.object.node.origin );
                
                if ( dist < mindist )
                {
                    mindist = dist;
                    self botsetscriptmove( moveyaw, var_199798d5fd510aea );
                    self botlookatpoint( tactical_goal.object.node.origin, var_199798d5fd510aea, "script_forced" );
                }
            }
            
            while ( !abort && isdefined( carried_obj ) && !carried_obj.canbeplaced )
            {
                time_waited = float( gettime() - start_time ) / 1000;
                
                if ( !carried_obj.canbeplaced && time_waited > var_199798d5fd510aea )
                {
                    abort = 1;
                    self.sentry_place_delay = gettime() + 30000;
                }
                
                wait 0.05;
            }
        }
        
        if ( isdefined( carried_obj ) && carried_obj.canbeplaced )
        {
            bot_send_place_notify();
            result = 1;
        }
    }
    
    wait 0.25;
    bot_sentry_ensure_exit();
    return result;
}

// Namespace bots_sentry / scripts\mp\bots\bots_sentry
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbba
// Size: 0x1a
function bot_send_place_notify()
{
    self notify( "place_sentry" );
    self notify( "place_ims" );
    self notify( "placePlaceable" );
}

// Namespace bots_sentry / scripts\mp\bots\bots_sentry
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbdc
// Size: 0x34
function bot_send_cancel_notify()
{
    self switchtoweapon( "none" );
    self enableweapons();
    self enableweaponswitch();
    self notify( "cancel_sentry" );
    self notify( "cancel_ims" );
    self notify( "cancelPlaceable" );
}

// Namespace bots_sentry / scripts\mp\bots\bots_sentry
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc18
// Size: 0x21
function bot_sentry_cancel( tactical_goal )
{
    self notify( "bot_sentry_canceled" );
    bot_send_cancel_notify();
    bot_sentry_ensure_exit();
}

// Namespace bots_sentry / scripts\mp\bots\bots_sentry
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc41
// Size: 0x99
function bot_sentry_ensure_exit()
{
    self notify( "bot_sentry_abort_goal_think" );
    self notify( "bot_sentry_ensure_exit" );
    self endon( "bot_sentry_ensure_exit" );
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );
    self switchtoweapon( "none" );
    self botclearscriptgoal();
    self botsetstance( "none" );
    self enableweapons();
    self enableweaponswitch();
    wait 0.25;
    attempts = 0;
    
    while ( isdefined( bot_sentry_carried_obj() ) )
    {
        attempts++;
        bot_send_cancel_notify();
        wait 0.25;
        
        if ( attempts > 2 )
        {
            bot_sentry_force_cancel();
        }
    }
    
    self notify( "bot_sentry_exited" );
}

// Namespace bots_sentry / scripts\mp\bots\bots_sentry
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xce2
// Size: 0x7e
function bot_sentry_force_cancel()
{
    if ( isdefined( self.carriedsentry ) )
    {
        self.carriedsentry scripts\mp\killstreaks\autosentry::sentry_setcancelled();
    }
    
    if ( isdefined( self.carrieditem ) )
    {
        self.carrieditem scripts\mp\killstreaks\placeable::oncancel( self.placingitemstreakname, 0 );
    }
    
    self.carriedsentry = undefined;
    self.carriedims = undefined;
    self.carrieditem = undefined;
    self switchtoweapon( "none" );
    self enableweapons();
    self enableweaponswitch();
}

