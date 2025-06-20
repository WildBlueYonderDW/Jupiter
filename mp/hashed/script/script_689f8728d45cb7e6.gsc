#using script_185660037b9236c1;
#using script_220d0eb95a8fab7d;
#using script_2707474774db34b;
#using script_41387eecc35b88bf;
#using script_42f1b4ddcbbf98b4;
#using script_54f6d121e91434f8;
#using script_638d701d263ee1ed;
#using script_64351208cb856df9;
#using script_6617e2f2bb62b52b;
#using script_7956d56c4922bd1;
#using script_7e41e37180e554f;
#using scripts\common\utility;
#using scripts\engine\utility;
#using scripts\mp\utility\teams;

#namespace namespace_22ae363c8e287c38;

// Namespace namespace_22ae363c8e287c38 / namespace_797ee4f931e4dbb8
// Params 1
// Checksum 0x0, Offset: 0x135
// Size: 0x1a1
function function_c56624984c6cfe44( relevantparameters )
{
    assertex( isarray( relevantparameters ) && relevantparameters.size == 1 && isplayer( relevantparameters[ 0 ] ), "<dev string:x1c>" );
    var_bd11f2561cb089ec = relevantparameters[ 0 ];
    squad = scripts\mp\utility\teams::getsquadmates( var_bd11f2561cb089ec.team, var_bd11f2561cb089ec.sessionsquadid, 0 );
    var_861695cd06824d43 = function_553a690e1064cf0b( var_bd11f2561cb089ec );
    
    foreach ( var_d13c18af4084bdfd in var_861695cd06824d43 )
    {
        activityinstance = function_1f3e343912ae15c5( var_d13c18af4084bdfd.instanceid );
        
        if ( function_511be8bcaede8b52( activityinstance ) == "Contract" )
        {
            function_ad54e18b503363a0( activityinstance, [ var_bd11f2561cb089ec ] );
        }
    }
    
    if ( squad.size >= 2 )
    {
        var_1acd4938f955faa5 = squad[ 0 ];
        
        if ( var_1acd4938f955faa5 == var_bd11f2561cb089ec )
        {
            var_1acd4938f955faa5 = squad[ 1 ];
        }
        
        var_aca1cc230b21bf68 = function_553a690e1064cf0b( var_1acd4938f955faa5 );
        
        foreach ( var_d13c18af4084bdfd in var_aca1cc230b21bf68 )
        {
            activityinstance = function_1f3e343912ae15c5( var_d13c18af4084bdfd.instanceid );
            
            if ( function_9edc3a4b955d5a6c( activityinstance ) )
            {
                if ( !function_4ab1cdfd84bbd3f2( activityinstance, var_bd11f2561cb089ec ) )
                {
                    function_bbdcd857d0c2a65e( activityinstance, var_bd11f2561cb089ec, "PlayerJoinedSquad" );
                }
            }
        }
    }
}

// Namespace namespace_22ae363c8e287c38 / namespace_797ee4f931e4dbb8
// Params 2
// Checksum 0x0, Offset: 0x2de
// Size: 0x7d, Type: bool
function function_a0e2a0be2e23fef( activityinstance, params )
{
    assertex( params.size == 1 && isdefined( params[ 0 ] ), "<dev string:xc1>" );
    player = params[ 0 ];
    playerregion = namespace_4df2ab39b0e96ec7::get_region( player.origin );
    activityorigin = namespace_68dc261109a9503f::function_8988a4c89289d7f4( activityinstance );
    activityregion = namespace_4df2ab39b0e96ec7::get_region( activityorigin );
    return playerregion == activityregion;
}

// Namespace namespace_22ae363c8e287c38 / namespace_797ee4f931e4dbb8
// Params 2
// Checksum 0x0, Offset: 0x364
// Size: 0x2d, Type: bool
function function_17b1321ab95e72c1( player, params )
{
    var_1682143280c131b1 = function_bfda021631854371( player, "REV_OB_EXFIL" );
    return !var_1682143280c131b1;
}

// Namespace namespace_22ae363c8e287c38 / namespace_797ee4f931e4dbb8
// Params 2
// Checksum 0x0, Offset: 0x39a
// Size: 0x87, Type: bool
function function_30006181a99fb008( player, params )
{
    assertex( isarray( params ) && params.size == 2, "<dev string:xed>" );
    broadcastinstance = params[ 0 ];
    activityinstance = params[ 1 ];
    broadcasttype = broadcastinstance function_54ad2295d6995862();
    
    if ( broadcasttype == "Overlord" )
    {
        if ( isdefined( level.var_7f1d1c7c6153a9bf ) )
        {
            if ( [[ level.var_7f1d1c7c6153a9bf ]]() )
            {
                return false;
            }
        }
    }
    
    return true;
}

