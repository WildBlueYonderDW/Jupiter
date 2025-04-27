#using script_3a8f9ace195c9da9;
#using scripts\anim\battlechatter_events;
#using scripts\common\ai;
#using scripts\common\anim;
#using scripts\common\utility;
#using scripts\cp\coop_stealth;
#using scripts\cp\spawning;
#using scripts\cp\utility;
#using scripts\engine\utility;

#namespace namespace_a02f888cb7357170;

// Namespace namespace_a02f888cb7357170 / namespace_15c7ce84dd21743d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17e
// Size: 0x66
function function_2d7702ac3e0cb499( flagname )
{
    level endon( "game_ended" );
    level endon( "stop_patrol_interactions" );
    
    while ( true )
    {
        waitframe();
        self waittill( "trigger", entity );
        
        if ( isagent( entity ) && !is_dead_or_dying( entity ) )
        {
            break;
        }
        
        if ( isplayer( entity ) )
        {
            continue;
        }
    }
    
    if ( isdefined( flagname ) )
    {
        flag_set( flagname );
    }
    
    return entity;
}

// Namespace namespace_a02f888cb7357170 / namespace_15c7ce84dd21743d
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1ed
// Size: 0x29a
function function_925cafceea813513( triggername, initialwait, cooldown, var_5c1cc379a9934f3b, var_ebfe8cef63c009bf, var_6fedc01f09d1b9b9 )
{
    level endon( "game_ended" );
    level endon( "stop_patrol_interactions" );
    wait initialwait;
    trig = getent( triggername, "targetname" );
    
    if ( !isdefined( trig ) )
    {
        println( "<dev string:x1c>" + trig + "<dev string:x42>" );
        return;
    }
    
    while ( true )
    {
        waitframe();
        
        if ( flag( triggername ) )
        {
            flag_clear( triggername );
            continue;
        }
        
        ai = trig function_2d7702ac3e0cb499( triggername );
        
        if ( !isdefined( ai ) )
        {
            flag_clear( triggername );
            continue;
        }
        
        if ( isdefined( ai.agentteam ) && ai.agentteam == "civilian" )
        {
            flag_clear( triggername );
            continue;
        }
        
        if ( isdefined( ai.alertlevel ) )
        {
            if ( ai.alertlevel == "combat" || ai.alertlevel == "alert" )
            {
                flag_clear( triggername );
                continue;
            }
        }
        
        struct = spawnstruct();
        struct.origin = ai.origin;
        struct.angles = default_to( var_ebfe8cef63c009bf, ai.angles );
        interactions = default_to( var_6fedc01f09d1b9b9, [ "idle_smoke", "idle_rub_hand", "idle_drinking", "idle_stretching", "idle_cellphone" ] );
        var_d60d5319050e916c = default_to( var_5c1cc379a9934f3b, randomintrange( 5, 10 ) );
        struct.script_delay = var_d60d5319050e916c;
        
        if ( isdefined( ai._blackboard ) )
        {
            ai._blackboard.idlenode = struct;
        }
        
        interactionid = spawninteraction( random( interactions ), ai.origin, struct.angles );
        ai leaveinteraction();
        ai function_76b3cfb91ef40b3b( interactionid );
        ai.var_7b54e23eaa271e6b = interactionid;
        wait var_d60d5319050e916c;
        ai leaveinteraction();
        
        if ( isdefined( ai.var_7b54e23eaa271e6b ) )
        {
            despawninteraction( interactionid );
            ai._blackboard.idlenode = undefined;
            ai.var_7b54e23eaa271e6b = undefined;
        }
        
        wait cooldown;
        flag_clear( triggername );
    }
}

// Namespace namespace_a02f888cb7357170 / namespace_15c7ce84dd21743d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x48f
// Size: 0xaa
function function_ad312e95dd8dc1da( flagname )
{
    level endon( "game_ended" );
    level endon( "stop_patrol_interactions" );
    
    while ( true )
    {
        waitframe();
        self waittill( "trigger", entity );
        
        if ( isagent( entity ) && !is_dead_or_dying( entity ) )
        {
            if ( isdefined( entity.trig ) )
            {
                continue;
            }
            
            self.buddy = entity;
            entity.trig = self.targetname;
            self.pathnode = entity.target;
            break;
        }
        
        if ( isplayer( entity ) )
        {
            continue;
        }
    }
    
    if ( isdefined( flagname ) )
    {
        flag_set( flagname );
    }
}

// Namespace namespace_a02f888cb7357170 / namespace_15c7ce84dd21743d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x541
// Size: 0xa
function function_5e59fcaf5bbe49c7()
{
    level notify( "stop_patrol_interactions" );
}

// Namespace namespace_a02f888cb7357170 / namespace_15c7ce84dd21743d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x553
// Size: 0x1f
function function_bbef4e2f944e26d9( var_9aadde1438951683 )
{
    level.var_cc777c2dfb838eaa = 0;
    level.var_c0d0572f4cf2ac8c = var_9aadde1438951683;
}

// Namespace namespace_a02f888cb7357170 / namespace_15c7ce84dd21743d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57a
// Size: 0x4f
function function_bb69412748be1b0()
{
    level.var_cc777c2dfb838eaa++;
    
    if ( level.var_cc777c2dfb838eaa >= level.var_c0d0572f4cf2ac8c )
    {
        enemies = getaiarray( "bad_guys" );
        enemies = array_removedead_or_dying( enemies, 1 );
        array_thread( enemies, &function_19e1047944cc1936 );
    }
}

// Namespace namespace_a02f888cb7357170 / namespace_15c7ce84dd21743d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d1
// Size: 0x10
function function_19e1047944cc1936()
{
    self.var_7bd1c0edbaafb6e0 = "alert";
}

// Namespace namespace_a02f888cb7357170 / namespace_15c7ce84dd21743d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e9
// Size: 0x9
function function_1373388f7385072e()
{
    scripts\anim\battlechatter_events::function_f06007e1f432ce27();
}

// Namespace namespace_a02f888cb7357170 / namespace_15c7ce84dd21743d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5fa
// Size: 0x9
function investigate_vo()
{
    scripts\anim\battlechatter_events::function_842319303719440c();
}

// Namespace namespace_a02f888cb7357170 / namespace_15c7ce84dd21743d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x60b
// Size: 0x9
function function_e47ac57b023a2fd5()
{
    scripts\anim\battlechatter_events::function_e906749f6343f822();
}

// Namespace namespace_a02f888cb7357170 / namespace_15c7ce84dd21743d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x61c
// Size: 0x9
function function_a325bb9d2512520e()
{
    scripts\anim\battlechatter_events::function_842319303719440c();
}

// Namespace namespace_a02f888cb7357170 / namespace_15c7ce84dd21743d
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x62d
// Size: 0x124
function function_1949988230389477( var_c0965f05ffa3bad5, var_91ede80522850f1f, initialwait, cooldown, var_10984f64ad49b573, var_5c1cc379a9934f3b, var_6fedc01f09d1b9b9, var_4ad743aa302aa894 )
{
    level endon( "game_ended" );
    level endon( "stop_patrol_interactions" );
    wait initialwait;
    var_71a90b280a164be5 = getent( var_c0965f05ffa3bad5, "targetname" );
    var_13dcf42881f2776f = getent( var_91ede80522850f1f, "targetname" );
    
    if ( isdefined( var_71a90b280a164be5 ) && isdefined( var_13dcf42881f2776f ) )
    {
        var_71a90b280a164be5 function_ad312e95dd8dc1da( var_c0965f05ffa3bad5 );
        var_13dcf42881f2776f function_ad312e95dd8dc1da( var_91ede80522850f1f );
        flag_wait_all( var_c0965f05ffa3bad5, var_91ede80522850f1f );
        flag_clear( var_c0965f05ffa3bad5 );
        flag_clear( var_91ede80522850f1f );
        wait 5;
        level thread function_b9cf8fee72096e4c( var_71a90b280a164be5, var_c0965f05ffa3bad5, var_91ede80522850f1f, var_10984f64ad49b573, cooldown, var_5c1cc379a9934f3b, var_6fedc01f09d1b9b9, var_4ad743aa302aa894 );
        level thread function_b9cf8fee72096e4c( var_13dcf42881f2776f, var_91ede80522850f1f, var_c0965f05ffa3bad5, var_10984f64ad49b573, cooldown, var_5c1cc379a9934f3b, var_6fedc01f09d1b9b9, var_4ad743aa302aa894 );
        return;
    }
    
    if ( !isdefined( var_71a90b280a164be5 ) )
    {
        println( "<dev string:x1c>" + var_c0965f05ffa3bad5 + "<dev string:x42>" );
    }
    
    if ( !isdefined( var_13dcf42881f2776f ) )
    {
        println( "<dev string:x1c>" + var_91ede80522850f1f + "<dev string:x42>" );
    }
}

// Namespace namespace_a02f888cb7357170 / namespace_15c7ce84dd21743d
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x759
// Size: 0x715
function function_b9cf8fee72096e4c( trigger, var_eaad182af1b91884, var_b1ddbc5ee06363f8, waitduration, cooldown, var_5c1cc379a9934f3b, var_6fedc01f09d1b9b9, var_6a106a344181672a )
{
    level endon( "game_ended" );
    level endon( "stop_patrol_interactions" );
    
    if ( !isdefined( trigger ) )
    {
        return;
    }
    
    var_32006c42de6c319a = getent( var_b1ddbc5ee06363f8, "targetname" );
    
    while ( true )
    {
        waitframe();
        
        if ( is_dead_or_dying( var_32006c42de6c319a.buddy ) )
        {
            flag_clear( var_b1ddbc5ee06363f8 );
        }
        
        if ( flag( var_eaad182af1b91884 ) )
        {
            if ( is_dead_or_dying( trigger.buddy ) )
            {
                flag_clear( var_eaad182af1b91884 );
                return;
            }
            
            continue;
        }
        
        ai = trigger function_2d7702ac3e0cb499( var_eaad182af1b91884 );
        
        if ( !isdefined( ai ) )
        {
            flag_clear( var_eaad182af1b91884 );
            continue;
        }
        
        if ( isdefined( ai.alertlevel ) )
        {
            if ( ai.alertlevel == "combat" || ai.alertlevel == "alert" )
            {
                flag_clear( var_eaad182af1b91884 );
                return;
            }
        }
        
        if ( !isdefined( ai.trig ) )
        {
            flag_clear( var_eaad182af1b91884 );
            continue;
        }
        
        if ( ai.trig == var_eaad182af1b91884 )
        {
            ai scripts\cp\coop_stealth::stop_patrol( 1 );
            waitflag = 0;
            
            for (i = 0; i < waitduration; i++) {
                if ( flag( var_b1ddbc5ee06363f8 ) )
                {
                    waitflag = 1;
                    break;
                }
                
                wait 1;
            }
            
            var_b7a57065af6a600c = 0;
            
            if ( waitflag == 0 )
            {
                while ( true )
                {
                    if ( istrue( var_6a106a344181672a ) && is_dead_or_dying( var_32006c42de6c319a.buddy ) )
                    {
                        flag_clear( var_eaad182af1b91884 );
                        flag_clear( var_b1ddbc5ee06363f8 );
                        ai scripts\cp\spawning::start_patrol();
                        var_3ae17e43a32c5816 = getstruct( var_32006c42de6c319a.pathnode, "targetname" );
                        ai scripts\cp\spawning::set_goal_pos( var_3ae17e43a32c5816.origin );
                        ai.target = var_32006c42de6c319a.pathnode;
                        ai.var_7bd1c0edbaafb6e0 = "alert";
                        ai investigate_vo();
                        
                        if ( isdefined( level.var_cc777c2dfb838eaa ) )
                        {
                            function_bb69412748be1b0();
                        }
                        
                        return;
                    }
                    
                    if ( is_dead_or_dying( var_32006c42de6c319a.buddy ) )
                    {
                        flag_clear( var_eaad182af1b91884 );
                        flag_clear( var_b1ddbc5ee06363f8 );
                        event = spawnstruct();
                        event.type = "investigate";
                        event.typeorig = "unresponsive_teammate";
                        event.origin = var_32006c42de6c319a.origin;
                        event.investigate_pos = var_32006c42de6c319a.origin;
                        
                        if ( !is_dead_or_dying( ai ) )
                        {
                            ai scripts\cp\spawning::start_patrol();
                            ai scripts\cp\spawning::set_goal_pos( var_32006c42de6c319a.origin );
                            ai investigate_vo();
                            ai [[ ai.fnsetstealthstate ]]( "investigate", event );
                        }
                        
                        if ( isdefined( level.var_cc777c2dfb838eaa ) )
                        {
                            function_bb69412748be1b0();
                        }
                        
                        return;
                    }
                    
                    if ( var_b7a57065af6a600c == 0 )
                    {
                        struct = spawnstruct();
                        struct.origin = ai.origin;
                        struct.angles = ai.angles;
                        var_d75630399359263c = "idle_radio";
                        looptime = 5;
                        struct.script_delay = looptime;
                        
                        if ( isdefined( ai._blackboard ) )
                        {
                            ai._blackboard.idlenode = struct;
                        }
                        
                        interactionid = spawninteraction( var_d75630399359263c, ai.origin, ai.angles );
                        ai function_76b3cfb91ef40b3b( interactionid );
                        ai.var_7b54e23eaa271e6b = interactionid;
                        ai function_a325bb9d2512520e();
                        var_b7a57065af6a600c = 1;
                    }
                    
                    if ( flag( var_b1ddbc5ee06363f8 ) )
                    {
                        if ( var_b7a57065af6a600c )
                        {
                            ai leaveinteraction();
                            
                            if ( isdefined( ai.var_7b54e23eaa271e6b ) )
                            {
                                despawninteraction( interactionid );
                                ai._blackboard.idlenode = undefined;
                                ai.var_7b54e23eaa271e6b = undefined;
                            }
                        }
                        
                        break;
                    }
                    
                    wait 1;
                }
            }
            
            struct = spawnstruct();
            struct.origin = ai.origin;
            struct.angles = ai.angles;
            interactions = default_to( var_6fedc01f09d1b9b9, [ "idle_smoke", "idle_rub_hand", "idle_drinking", "idle_stretching", "idle_cellphone" ] );
            var_d60d5319050e916c = default_to( var_5c1cc379a9934f3b, 5 );
            
            if ( isdefined( struct ) && !is_dead_or_dying( ai ) )
            {
                struct.script_delay = var_d60d5319050e916c;
                ai._blackboard.idlenode = struct;
                interaction = default_to( random( interactions ), random( [ "idle_smoke", "idle_rub_hand", "idle_drinking", "idle_stretching", "idle_cellphone" ] ) );
                interactionid = spawninteraction( interaction, ai.origin, ai.angles );
                ai function_1373388f7385072e();
                
                if ( isdefined( interactionid ) )
                {
                    ai function_76b3cfb91ef40b3b( interactionid );
                    ai.var_7b54e23eaa271e6b = interactionid;
                }
            }
            
            var_954a721d2748dac8 = ai function_e5c0e60a96d393dc( var_d60d5319050e916c );
            
            if ( var_954a721d2748dac8 )
            {
                ai leaveinteraction();
                
                if ( isdefined( ai.var_7b54e23eaa271e6b ) )
                {
                    despawninteraction( interactionid );
                    ai._blackboard.idlenode = undefined;
                    ai.var_7b54e23eaa271e6b = undefined;
                }
                
                ai scripts\cp\spawning::start_patrol();
                flag_clear( var_eaad182af1b91884 );
                flag_clear( var_b1ddbc5ee06363f8 );
                wait cooldown;
                continue;
            }
            
            flag_clear( var_eaad182af1b91884 );
            flag_clear( var_b1ddbc5ee06363f8 );
            event = spawnstruct();
            event.type = "investigate";
            event.typeorig = "unresponsive_teammate";
            event.origin = trigger.origin;
            event.investigate_pos = trigger.origin;
            
            if ( !is_dead_or_dying( var_32006c42de6c319a.buddy ) )
            {
                var_32006c42de6c319a.buddy function_e47ac57b023a2fd5();
                var_32006c42de6c319a.buddy [[ var_32006c42de6c319a.buddy.fnsetstealthstate ]]( "hunt", event );
            }
            
            if ( isdefined( level.var_cc777c2dfb838eaa ) )
            {
                function_bb69412748be1b0();
            }
            
            return;
        }
    }
}

// Namespace namespace_a02f888cb7357170 / namespace_15c7ce84dd21743d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe76
// Size: 0x34, Type: bool
function function_e5c0e60a96d393dc( duration )
{
    for (i = 0; i < duration; i++) {
        if ( is_dead_or_dying( self ) )
        {
            return false;
        }
        
        wait 1;
    }
    
    return true;
}

