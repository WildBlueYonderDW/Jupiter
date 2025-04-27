#using script_64351208cb856df9;
#using script_7956d56c4922bd1;
#using scripts\ob\points;

#namespace namespace_bd7428f3122be80f;

// Namespace namespace_bd7428f3122be80f / namespace_40713433c91dd86c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xf3
// Size: 0x1c3
function function_c402ecda1e84ba27( players, is_major, difficulty_region, activity_origin )
{
    if ( !isdefined( players ) )
    {
        return;
    }
    
    player_list = [];
    
    if ( !isarray( players ) && isplayer( players ) )
    {
        player_list[ 0 ] = players;
    }
    else
    {
        player_list = players;
    }
    
    var_5ae81c709e07dbf7 = "difficulty_easy";
    
    if ( isdefined( difficulty_region ) )
    {
        var_5ae81c709e07dbf7 = difficulty_region;
    }
    else if ( isdefined( activity_origin ) && isdefined( level.var_fac39a693f085779 ) )
    {
        var_5ae81c709e07dbf7 = [[ level.var_fac39a693f085779 ]]( activity_origin );
    }
    
    var_7b60c91792761e4f = #"ob_minor_activity_complete_green";
    
    switch ( var_5ae81c709e07dbf7 )
    {
        case #"hash_7bb2cd766703d463":
            if ( istrue( is_major ) )
            {
                var_7b60c91792761e4f = #"ob_major_activity_complete_green";
            }
            else
            {
                var_7b60c91792761e4f = #"ob_minor_activity_complete_green";
            }
            
            break;
        case #"hash_af83e47edfa8900a":
            if ( istrue( is_major ) )
            {
                var_7b60c91792761e4f = #"ob_major_activity_complete_yellow";
            }
            else
            {
                var_7b60c91792761e4f = #"ob_minor_activity_complete_yellow";
            }
            
            break;
        case #"hash_5343b465e56ec9a4":
            if ( istrue( is_major ) )
            {
                var_7b60c91792761e4f = #"ob_major_activity_complete_orange";
            }
            else
            {
                var_7b60c91792761e4f = #"ob_minor_activity_complete_orange";
            }
            
            break;
        case #"hash_651f76c0ad6741ec":
            if ( istrue( is_major ) )
            {
                var_7b60c91792761e4f = #"ob_major_activity_complete_red";
            }
            else
            {
                var_7b60c91792761e4f = #"ob_minor_activity_complete_red";
            }
            
            break;
    }
    
    foreach ( player in player_list )
    {
        player scripts\ob\points::function_ddee59d6b1a2b9e( var_7b60c91792761e4f, undefined, 0, #"activity_reward" );
    }
}

