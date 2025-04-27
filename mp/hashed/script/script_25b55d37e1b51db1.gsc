#using script_d74ae0b4aa21186;
#using scripts\engine\utility;

#namespace sound_perception;

// Namespace sound_perception / namespace_3df563b7c04eb8eb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x144
// Size: 0x131
function createevent( var_325752cb29127eeb )
{
    event = function_c74368899713e7e6();
    event.var_325752cb29127eeb = var_325752cb29127eeb;
    event.list = [];
    
    if ( !isdefined( level.mind.events.var_cbd599cc41b2a3f1 ) )
    {
        var_2a96d0ea58c991be = [];
        var_2a96d0ea58c991be[ 0 ] = "footstep";
        var_2a96d0ea58c991be[ 1 ] = "footstep_walk";
        var_2a96d0ea58c991be[ 2 ] = "footstep_sprint";
        var_2a96d0ea58c991be[ 5 ] = "death";
        var_2a96d0ea58c991be[ 9 ] = "gunshot";
        var_2a96d0ea58c991be[ 12 ] = "silenced_shot";
        var_2a96d0ea58c991be[ 14 ] = "bullet_whizby";
        var_2a96d0ea58c991be[ 15 ] = "projectile_impact";
        var_2a96d0ea58c991be[ 31 ] = "can_see";
        var_2a96d0ea58c991be[ 32 ] = "radar";
        level.mind.events.var_cbd599cc41b2a3f1 = var_2a96d0ea58c991be;
    }
    
    eventstream = self.mind.eventstream;
    eventstream.soundperception = event;
    eventstream.events[ eventstream.events.size ] = event;
    thread function_712abddb7195a3ee();
}

// Namespace sound_perception / namespace_3df563b7c04eb8eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27d
// Size: 0x127
function function_712abddb7195a3ee()
{
    level endon( "game_ended" );
    self endon( "death" );
    event = self.mind.eventstream.soundperception;
    
    while ( true )
    {
        self waittill( "known_event", potentialtarget, eventtype, time, pos );
        
        if ( isdefined( level.mind.events.var_cbd599cc41b2a3f1[ eventtype ] ) && isdefined( potentialtarget ) && isdefined( eventtype ) && isdefined( time ) && isdefined( pos ) )
        {
            soundevent = spawnstruct();
            soundevent.owner = potentialtarget;
            soundevent.time = time;
            soundevent.pos = pos;
            soundevent.type = level.mind.events.var_cbd599cc41b2a3f1[ eventtype ];
            event.list[ event.list.size ] = soundevent;
        }
    }
}

// Namespace sound_perception / namespace_3df563b7c04eb8eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ac
// Size: 0x108
function getevent()
{
    event = self.mind.eventstream.soundperception;
    
    if ( !event.evaluated )
    {
        var_379a32677fb69595 = gettime() - event.var_325752cb29127eeb;
        index = undefined;
        
        for (i = 0; i < event.list.size; i++) {
            if ( event.list[ i ].time > var_379a32677fb69595 )
            {
                break;
            }
            
            index = i;
        }
        
        if ( isdefined( index ) )
        {
            var_502ca8f7bc239543 = [];
            
            for (i = index + 1; i < event.list.size; i++) {
                var_502ca8f7bc239543[ var_502ca8f7bc239543.size ] = event.list[ i ];
            }
            
            event.list = var_502ca8f7bc239543;
        }
        
        event.evaluated = 1;
    }
    
    return event.list;
}

