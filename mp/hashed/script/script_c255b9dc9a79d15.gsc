#using script_110fd2130c2ed1fe;
#using script_64acb6ce534155b7;
#using scripts\common\utility;
#using scripts\cp_mp\challenges;
#using scripts\cp_mp\utility\game_utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\gametypes\br;
#using scripts\mp\gametypes\br_analytics;
#using scripts\mp\gametypes\br_challenges;
#using scripts\mp\gametypes\br_public;
#using scripts\mp\gametypes\br_quest_util;
#using scripts\mp\hud_util;
#using scripts\mp\utility\game;
#using scripts\mp\utility\outline;
#using scripts\mp\utility\player;
#using scripts\mp\utility\points;
#using scripts\mp\utility\stats;
#using scripts\mp\utility\teams;
#using scripts\mp\utility\weapon;

#namespace namespace_44c44f8777017fce;

// Namespace namespace_44c44f8777017fce / namespace_47576aa14577620d
// Params 1
// Checksum 0x0, Offset: 0x263
// Size: 0xbd
function function_fc0a70293a565642( playertype )
{
    players = undefined;
    playerteam = undefined;
    playersquad = undefined;
    
    if ( playertype == "hunter" )
    {
        players = self.hunterplayers;
        playerteam = self.hunterteam;
        playersquad = self.huntersquad;
    }
    
    if ( playertype == "target" )
    {
        players = self.targetplayers;
        playerteam = self.targetteam;
        playersquad = self.targetsquad;
    }
    
    assert( isdefined( playerteam ) );
    
    if ( isdefined( players ) )
    {
        return players;
    }
    else if ( isdefined( playerteam ) )
    {
        if ( isdefined( playersquad ) )
        {
            return getsquadmates( playerteam, playersquad );
        }
        else
        {
            return getteamdata( playerteam, "players" );
        }
    }
    
    return [];
}

// Namespace namespace_44c44f8777017fce / namespace_47576aa14577620d
// Params 2
// Checksum 0x0, Offset: 0x329
// Size: 0xb2
function function_87afe756cb5dfde7( playertype, filterkey )
{
    players = function_fc0a70293a565642( playertype );
    center = ( 0, 0, 0 );
    validplayers = getvalidplayersinarray( players, filterkey );
    
    if ( validplayers.size <= 0 )
    {
        return center;
    }
    
    foreach ( player in validplayers )
    {
        center += player.origin;
    }
    
    center /= validplayers.size;
    return center;
}

// Namespace namespace_44c44f8777017fce / namespace_47576aa14577620d
// Params 3
// Checksum 0x0, Offset: 0x3e4
// Size: 0x4a
function function_9d1c5280f5963c8c( playertype, splashkey, params )
{
    assertex( isdefined( splashkey ), "<dev string:x1c>" + playertype );
    players = function_fc0a70293a565642( playertype );
    displaysplashtoplayers( players, splashkey, params );
}

// Namespace namespace_44c44f8777017fce / namespace_47576aa14577620d
// Params 6
// Checksum 0x0, Offset: 0x436
// Size: 0x5c
function function_6f8e4ad4812f9004( dialog, playertype, var_a64cad1ecc519617, delay, var_abb7e1ea2adce060, prefixoverride )
{
    players = function_fc0a70293a565642( playertype );
    level scripts\mp\gametypes\br_public::brleaderdialog( dialog, var_a64cad1ecc519617, function_fc0a70293a565642( playertype ), undefined, delay, var_abb7e1ea2adce060, prefixoverride );
}

// Namespace namespace_44c44f8777017fce / namespace_47576aa14577620d
// Params 4
// Checksum 0x0, Offset: 0x49a
// Size: 0x79
function function_448f9af17b797c5a( playertype, player_ref, state, missionid )
{
    foreach ( player in function_fc0a70293a565642( playertype ) )
    {
        player displaysquadmessagetoplayer( player_ref, state, missionid );
    }
}

// Namespace namespace_44c44f8777017fce / namespace_47576aa14577620d
// Params 2
// Checksum 0x0, Offset: 0x51b
// Size: 0x7d, Type: bool
function function_daad346821543e6f( playertype, filterkey )
{
    filter = _validateplayerfilter( filterkey );
    
    foreach ( player in function_fc0a70293a565642( playertype ) )
    {
        if ( _validateplayer( player, filter ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace namespace_44c44f8777017fce / namespace_47576aa14577620d
// Params 2
// Checksum 0x0, Offset: 0x5a1
// Size: 0x8c
function function_9f8af67e38f19b5d( playertype, filterkey )
{
    filter = _validateplayerfilter( filterkey );
    players = [];
    
    foreach ( player in function_fc0a70293a565642( playertype ) )
    {
        if ( _validateplayer( player, filter ) )
        {
            players[ players.size ] = player;
        }
    }
    
    return players;
}

// Namespace namespace_44c44f8777017fce / namespace_47576aa14577620d
// Params 3
// Checksum 0x0, Offset: 0x636
// Size: 0xac
function function_902f03d6a23a0a45( team, squad, ref )
{
    if ( getsubgametype() != "rumble_mgl" )
    {
        return;
    }
    
    if ( isdefined( level.squaddata ) && isdefined( level.squaddata[ team ] ) )
    {
        foreach ( player in level.squaddata[ team ][ squad ].players )
        {
            player thread scripts\mp\utility\points::doscoreevent( ref );
        }
    }
}

// Namespace namespace_44c44f8777017fce / namespace_47576aa14577620d
// Params 3
// Checksum 0x0, Offset: 0x6ea
// Size: 0x96
function function_4a05a71ec50d0d26( team, squad, filterkey )
{
    filter = _validateplayerfilter( filterkey );
    players = [];
    
    foreach ( player in getsquadmates( team, squad ) )
    {
        if ( _validateplayer( player, filter ) )
        {
            players[ players.size ] = player;
        }
    }
    
    return players;
}

// Namespace namespace_44c44f8777017fce / namespace_47576aa14577620d
// Params 3
// Checksum 0x0, Offset: 0x789
// Size: 0xaa
function getsquadcenter( team, squad, filter )
{
    center = ( 0, 0, 0 );
    validplayers = function_4a05a71ec50d0d26( team, squad, filter );
    
    if ( validplayers.size <= 0 )
    {
        return center;
    }
    
    foreach ( player in validplayers )
    {
        center += player.origin;
    }
    
    center /= validplayers.size;
    return center;
}

// Namespace namespace_44c44f8777017fce / namespace_47576aa14577620d
// Params 1
// Checksum 0x0, Offset: 0x83c
// Size: 0x3ba
function function_998e39dbcdafdde7( player )
{
    hunterteam = player.team;
    huntersquad = player.sessionsquadid;
    bestteam = undefined;
    bestsquad = undefined;
    potentialtargets = level.players;
    list1 = getquestdata( "assassination" ).alltrackedplayers;
    list2 = getteamdata( hunterteam, "players" );
    excludedplayers = array_combine_unique( list1, list2 );
    filter = level.questinfo.quests[ "assassination" ].filters[ 0 ];
    searchminradius = 5000;
    searchlimit = 30000;
    search_bounds = 0;
    
    while ( !isdefined( bestsquad ) )
    {
        search_bounds += 5000;
        playerlist = get_array_of_closest( player.origin, potentialtargets, excludedplayers, undefined, searchminradius + search_bounds, searchminradius );
        playerlist = scripts\mp\gametypes\br_quest_util::getvalidplayersinarray( playerlist, filter );
        
        if ( !isdefined( playerlist ) || playerlist.size == 0 )
        {
            if ( search_bounds > searchlimit )
            {
                playerlist = get_array_of_closest( player.origin, potentialtargets, excludedplayers, undefined, undefined, undefined );
                playerlist = scripts\mp\gametypes\br_quest_util::getvalidplayersinarray( playerlist, filter );
                
                if ( !isdefined( playerlist ) || playerlist.size == 0 )
                {
                    return undefined;
                }
            }
            else
            {
                continue;
            }
        }
        
        targetsquads = [];
        targetteams = [];
        
        foreach ( targetplayer in playerlist )
        {
            targetsquads[ targetplayer.sessionsquadid ] = function_4a05a71ec50d0d26( targetplayer.team, targetplayer.sessionsquadid, filter ).size;
            targetteams[ targetplayer.sessionsquadid ] = targetplayer.team;
        }
        
        var_43f1b6bf70e1f1ae = getsquadcenter( hunterteam, huntersquad, filter );
        var_dac92862560b89ba = function_4a05a71ec50d0d26( hunterteam, huntersquad, filter ).size;
        
        foreach ( squad, squadsize in targetsquads )
        {
            if ( !isdefined( bestsquad ) )
            {
                bestteam = targetteams[ squad ];
                bestsquad = squad;
                continue;
            }
            
            difference = abs( var_dac92862560b89ba - squadsize );
            
            if ( difference < abs( var_dac92862560b89ba - targetsquads[ bestsquad ] ) )
            {
                bestteam = targetteams[ squad ];
                bestsquad = squad;
                continue;
            }
            else if ( difference > abs( var_dac92862560b89ba - targetsquads[ bestsquad ] ) )
            {
                continue;
            }
            
            if ( squadsize > targetsquads[ bestsquad ] )
            {
                bestteam = targetteams[ squad ];
                bestsquad = squad;
                continue;
            }
            else if ( squadsize < targetsquads[ bestsquad ] )
            {
                continue;
            }
            
            currentsquadcenter = getsquadcenter( targetteams[ squad ], squad, filter );
            var_2d7861e0bde6a28a = getsquadcenter( bestteam, bestsquad, filter );
            
            if ( distance2d( var_43f1b6bf70e1f1ae, currentsquadcenter ) < distance2d( var_43f1b6bf70e1f1ae, var_2d7861e0bde6a28a ) )
            {
                bestteam = targetteams[ squad ];
                bestsquad = squad;
            }
        }
    }
    
    if ( isdefined( bestsquad ) )
    {
        getquestdata( "assassination" ).alltrackedplayers = array_combine( getquestdata( "assassination" ).alltrackedplayers, getsquadmates( bestteam, bestsquad ) );
    }
    
    return [ bestteam, bestsquad ];
}

// Namespace namespace_44c44f8777017fce / namespace_47576aa14577620d
// Params 2
// Checksum 0x0, Offset: 0xbff
// Size: 0xe5
function function_cd8a8f4da6b90ea8( squad, newquest )
{
    if ( !isdefined( newquest ) )
    {
        newquest = 0;
    }
    
    perkbonus = 0;
    
    foreach ( player in getsquadmates( self.team, squad ) )
    {
        if ( istrue( player.hasbettermissionrewards ) )
        {
            perkbonus++;
        }
    }
    
    if ( !newquest && isdefined( level.questinfo.maxperkbonustier ) && isdefined( level.questinfo.maxperkbonustier[ squad ] ) )
    {
        perkbonus = int( min( perkbonus, level.questinfo.maxperkbonustier[ squad ] ) );
    }
    
    return perkbonus;
}

// Namespace namespace_44c44f8777017fce / namespace_47576aa14577620d
// Params 2
// Checksum 0x0, Offset: 0xced
// Size: 0xeb
function function_80eb0740de24aabf( team, player )
{
    scripts\mp\gametypes\br_analytics::branalytics_missionstart( self, player );
    level.questinfo.teamsonquests = array_add( level.questinfo.teamsonquests, team );
    level.questinfo.var_5afa170b3886678 = array_add( level.questinfo.var_5afa170b3886678, player.sessionsquadid );
    
    if ( !isdefined( level.questinfo.maxperkbonustier ) )
    {
        level.questinfo.maxperkbonustier = [];
    }
    
    level.questinfo.maxperkbonustier[ player.sessionsquadid ] = player function_cd8a8f4da6b90ea8( player.sessionsquadid, 1 );
    level notify( "quest_started", team );
}

// Namespace namespace_44c44f8777017fce / namespace_47576aa14577620d
// Params 2
// Checksum 0x0, Offset: 0xde0
// Size: 0x92
function function_202bbf325055d2c2( category, var_a705a5a5884ebf9c )
{
    foreach ( player in function_fc0a70293a565642( "hunter" ) )
    {
        if ( isbot( player ) && scripts\mp\gametypes\br_public::istutorial() )
        {
            continue;
        }
        
        contractid = namespace_1eb3c4e0e28fac71::getquesttableindex( category );
        player scripts\cp_mp\challenges::oncontractstart( contractid, var_a705a5a5884ebf9c );
    }
}

// Namespace namespace_44c44f8777017fce / namespace_47576aa14577620d
// Params 0
// Checksum 0x0, Offset: 0xe7a
// Size: 0xb4
function function_1e5b12a2032de6cb()
{
    /#
        function_d2caa40694d469ab();
    #/
    
    foreach ( player in function_fc0a70293a565642( "hunter" ) )
    {
        player setclientomnvar( "ui_br_objective_countdown_timer", self.missiontime );
    }
    
    questdata = getquestdata( self.category );
    updatefunc = questdata.funcs[ "onTimerUpdate" ];
    
    if ( isdefined( updatefunc ) )
    {
        [[ updatefunc ]]();
    }
    
    thread _questtimerwait();
}

// Namespace namespace_44c44f8777017fce / namespace_47576aa14577620d
// Params 2
// Checksum 0x0, Offset: 0xf36
// Size: 0x77
function function_1c69b851009c7518( time, animbuffer )
{
    /#
        function_d2caa40694d469ab();
    #/
    
    if ( !isdefined( animbuffer ) )
    {
        animbuffer = 0;
    }
    
    totaltime = time + animbuffer;
    questdata = getquestdata( self.category );
    
    if ( !questdata.usequesttimer )
    {
        return;
    }
    
    self.missiontime = gettime() + totaltime * 1000;
    function_1e5b12a2032de6cb();
}

// Namespace namespace_44c44f8777017fce / namespace_47576aa14577620d
// Params 8
// Checksum 0x0, Offset: 0xfb5
// Size: 0x1a8
function function_a721f329de58f4c3( hunterteam, huntersquad, targetteam, targetsquad, id, player, modifier, rewardscriptable )
{
    instance = createquestinstance( "assassination", huntersquad, id, rewardscriptable );
    instance.modifier = modifier;
    
    if ( !isdefined( instance.modifier ) )
    {
        instance.modifier = "";
    }
    
    instance.hunterteam = hunterteam;
    instance.huntersquad = huntersquad;
    instance.targetteam = targetteam;
    instance.targetsquad = targetsquad;
    instance.targets_killed_by_hunters = 0;
    instance.hunters_killed_by_targets = 0;
    instance function_6b6b6273f8180522( "Assassination_Br" );
    instance getnewtargetplayer( player );
    instance.targetplayers = instance function_fc0a70293a565642( "target" );
    instance.hunterplayers = instance function_fc0a70293a565642( "hunter" );
    
    if ( !isdefined( instance.targetplayer ) )
    {
        return undefined;
    }
    
    instance function_80eb0740de24aabf( hunterteam, player );
    
    if ( instance.modifier != "_all" )
    {
        instance function_1c69b851009c7518( getquestdata( "assassination" ).questbasetimer, 4 );
    }
    
    instance updateassassinationthreatlevel( instance.targetsquad );
    instance determineobjectivevisibility();
    addquestinstance( "assassination", instance );
    instance function_202bbf325055d2c2( "assassination", player );
    return instance;
}

// Namespace namespace_44c44f8777017fce / namespace_47576aa14577620d
// Params 0
// Checksum 0x0, Offset: 0x1166
// Size: 0x51c
function function_93833843135c9a25()
{
    team = self.hunterteam;
    squad = self.huntersquad;
    assertex( array_contains( level.questinfo.teamsonquests, team ), "<dev string:x56>" + team + "<dev string:x8d>" );
    assertex( array_contains( level.questinfo.var_5afa170b3886678, squad ), "<dev string:x92>" + squad + "<dev string:x8d>" );
    
    /#
        function_132b6261e829fa9c();
    #/
    
    if ( isdefined( level.questinfo.maxperkbonustier ) )
    {
        level.questinfo.maxperkbonustier[ squad ] = undefined;
    }
    
    level.questinfo.teamsonquests = array_remove( level.questinfo.teamsonquests, team );
    level.questinfo.var_5afa170b3886678 = array_remove( level.questinfo.var_5afa170b3886678, squad );
    getquestdata( "assassination" ).alltrackedplayers = array_remove_array( getquestdata( "assassination" ).alltrackedplayers, function_fc0a70293a565642( "target" ) );
    
    if ( isdefined( self.targetplayer ) )
    {
        self.targetplayer.hasbeentracked = 1;
    }
    
    questtier = getquestrewardtier( team );
    results = [];
    
    if ( isdefined( self.result ) && self.result == "success" )
    {
        foreach ( player in self.contributingplayers )
        {
            if ( isbot( player ) && scripts\mp\gametypes\br_public::istutorial() )
            {
                continue;
            }
            
            player.brmissionscompleted = scripts\mp\gametypes\br::get_int_or_0( player.brmissionscompleted ) + 1;
            
            if ( level.var_58adce74179ab9ef )
            {
                player incpersstat( "objectivesCompleted", 1 );
                player scripts\mp\gametypes\br_public::updatebrscoreboardstat( "missionsCompleted", player getpersstat( "objectivesCompleted" ) );
            }
            else
            {
                player scripts\mp\gametypes\br_public::updatebrscoreboardstat( "missionsCompleted", player.brmissionscompleted );
            }
            
            player scripts\mp\utility\stats::incpersstat( "contracts", 1 );
            
            if ( !isdefined( player.brmissiontypescompleted ) )
            {
                player.brmissiontypescompleted = [];
            }
            
            player.brmissiontypescompleted[ self.questcategory ] = scripts\mp\gametypes\br::get_int_or_0( player.brmissiontypescompleted[ self.questcategory ] ) + 1;
            player scripts\mp\gametypes\br_challenges::challengeevaluator( "br_mastery_fiveContracts" );
        }
        
        if ( getdvarint( @"hash_82bde055b11e6698", 0 ) )
        {
            results = givequestrewardsinstance( team, self.rewardorigin, self.rewardangles, self.rewardscriptable, self.contributingplayers );
        }
    }
    
    if ( isdefined( self.result ) )
    {
        teamresult = ter_op( self.result == "success", 1, 2 );
        contractref = self.category;
        
        foreach ( player in function_fc0a70293a565642( "hunter" ) )
        {
            if ( isbot( player ) && scripts\mp\gametypes\br_public::istutorial() )
            {
                continue;
            }
            
            contractid = namespace_1eb3c4e0e28fac71::getquesttableindex( self.category );
            player scripts\cp_mp\challenges::oncontractend( contractid, teamresult == 1, 1 );
            player notify( "calloutmarkerping_warzoneKillQuestIcon" );
        }
        
        if ( isdefined( self.targetsquad ) )
        {
            targetresult = ter_op( self.result == "success", 2, 1 );
            
            foreach ( player in function_fc0a70293a565642( "target" ) )
            {
                if ( isbot( player ) && scripts\mp\gametypes\br_public::istutorial() )
                {
                    continue;
                }
                
                contractid = namespace_1eb3c4e0e28fac71::getquesttableindex( self.category );
                player scripts\cp_mp\challenges::oncontractend( contractid, targetresult == 1, 2 );
            }
        }
    }
    
    squadplayers = function_fc0a70293a565642( "hunter" );
    var_5e004b0f1c9abffb = squadplayers.size;
    scripts\mp\gametypes\br_analytics::branalytics_missionend( self, questtier, results, var_5e004b0f1c9abffb );
    self notify( "questEnded" );
    
    if ( isdefined( self.rewardscriptable ) )
    {
        self.rewardscriptable notify( "questEnded", team, self.result );
    }
}

