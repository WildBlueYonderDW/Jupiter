#using script_135f13d8aa1c1f19;
#using script_64acb6ce534155b7;
#using script_728ffcee8cbf30ee;
#using scripts\common\system;
#using scripts\engine\utility;
#using scripts\mp\gamelogic;
#using scripts\mp\gametypes\br_gametypes;
#using scripts\mp\gametypes\br_public;
#using scripts\mp\hud_util;
#using scripts\mp\utility\teams;

#namespace namespace_8559d2200e7e7e86;

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x4a0
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_aac69daa141f3582", undefined, undefined, &post_main );
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c1
// Size: 0x2d
function post_main()
{
    if ( !isdefined( level.brgametype ) )
    {
        return;
    }
    
    if ( !getdvarint( @"hash_a70128f4b0902d43", 1 ) )
    {
        return;
    }
    
    level thread function_7ae6edf4f40ff33e();
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f6
// Size: 0x53
function function_7ae6edf4f40ff33e()
{
    level endon( "game_ended" );
    scripts\engine\utility::flag_wait( "StartGameTypeCallbackFinished" );
    
    if ( !isdefined( level.arrow ) || !isdefined( level.arrow.dvars ) )
    {
        return;
    }
    
    initleveldata();
    setupcallbacks();
    level thread inittablets();
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x551
// Size: 0x174
function initleveldata()
{
    level.arrow.dvars.scriptedflow = -1;
    
    if ( !isdefined( level.arrow.props.elements ) )
    {
        level.arrow.props.elements = [];
    }
    
    level.elitechain = spawnstruct();
    level.elitechain.var_60c7e4332d6e6faa = getdvarfloat( @"hash_70ef135fc04c3389", 10 );
    level.elitechain.var_496b8acd2c121c7b = getdvarfloat( @"hash_ac014bb205a8be1b", 4 );
    level.elitechain.var_1af44a4462b37a27 = getdvarint( @"hash_bd9d409f92df1acb", 0 );
    level.elitechain.var_857ad197f58d4fe0 = getdvarfloat( @"hash_c925212317237c46", 5 );
    level.elitechain.var_fc6add02cc658030 = getdvarint( @"hash_874611dd811f8821", 1 );
    level.elitechain.var_260b7b6b4cd0cf49 = getdvarint( @"hash_a5e032420010e148", 1 );
    level.elitechain.var_70aafcc7a8564bd9 = getdvarint( @"hash_23744d43aae71c76", 1 );
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6cd
// Size: 0xa5
function setupcallbacks()
{
    scripts\engine\utility::registersharedfunc( "eliteChain", "addEliteQuestChain", &addelitequestchain );
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc( "eliteWatchTeamWipe", &watchteamwipe );
    
    foreach ( element in level.arrow.elementlist )
    {
        scriptablename = element.var_f391bf01090b356c;
        level.var_5635125e56693c8[ scriptablename ] = &onpickupelement;
    }
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x77a
// Size: 0xb4
function inittablets()
{
    level endon( "game_ended" );
    namespace_6c622b52017c6808::function_ef0d52837c9e7954();
    waitframe();
    
    if ( !isdefined( level.arrow.props ) || !isdefined( level.arrow.props.tablets ) )
    {
        return;
    }
    
    foreach ( tablet in level.arrow.props.tablets )
    {
        tablet function_742e94df649bd24();
    }
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x836
// Size: 0x13
function addelitequestchain( tablet )
{
    tablet function_742e94df649bd24();
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x851
// Size: 0x3a
function function_742e94df649bd24()
{
    tablet = self;
    tablet function_8fb6c06939b794d7( "elite", &function_3ecdcdbc9f0b5fe0, &function_ce5b38ccbacff64, &function_d6a940bdd49c18ca, &function_cede041f1b6728e0, &function_d75b66b46e0f7273, &function_6091d72afc11f381 );
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x893
// Size: 0x59
function function_906171e231788d8c( index )
{
    task = self.task;
    
    if ( !isdefined( task ) || !isdefined( task.questchain ) )
    {
        logstring( "elite_chain::tabletSetQuestChainIndex - invalid task without a quest chain!" );
        return;
    }
    
    task.questchain.index = index;
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8f4
// Size: 0x59
function function_84ca8e2e2b054149( count )
{
    task = self.task;
    
    if ( !isdefined( task ) || !isdefined( task.questchain ) )
    {
        logstring( "elite_chain::tabletSetDropCount - invalid task without a quest chain!" );
        return;
    }
    
    task.questchain.dropcount = count;
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x955
// Size: 0x15
function function_3ecdcdbc9f0b5fe0( team )
{
    function_b550bb18a012e142( team, 1 );
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x972
// Size: 0x67
function function_ce5b38ccbacff64( team )
{
    questchain = level.var_81e77c935dfefd11.teaminstances[ team ];
    
    if ( isdefined( questchain ) )
    {
        index = questchain.index + 1;
        function_e17d51f3f2435d87( team, index );
        logstring( "elite_chain::onChainContinue - moving to index: " + index + " " + team );
    }
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9e1
// Size: 0x62
function function_d6a940bdd49c18ca( team, success )
{
    if ( istrue( success ) )
    {
        function_cafda4ae3a3fef17( team );
        function_e17d51f3f2435d87( team, 0 );
        function_b550bb18a012e142( team, 3 );
        logstring( "elite_chain::onChainEnd - success! " + team );
        return;
    }
    
    function_e17d51f3f2435d87( team, 0 );
    function_b550bb18a012e142( team, 0 );
    logstring( "elite_chain::onChainEnd - failure! " + team );
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa4b
// Size: 0x90
function function_cede041f1b6728e0( team )
{
    level endon( "game_ended" );
    teaminfo = level.arrow.teaminfo[ team ];
    
    if ( !isdefined( teaminfo ) )
    {
        return;
    }
    
    logstring( "elite_chain::onChainWait - start!" + team );
    function_b550bb18a012e142( team, 2 );
    var_ba9b215007eb7888 = teaminfo namespace_6c622b52017c6808::function_1a9ee6a7092d4536();
    
    if ( !var_ba9b215007eb7888 )
    {
        wait level.var_81e77c935dfefd11.waittime;
    }
    
    function_b550bb18a012e142( team, 1 );
    logstring( "elite_chain::onChainWait - end! " + team );
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xae3
// Size: 0x3a
function function_d75b66b46e0f7273( team, rewardorigin, rewardangles )
{
    element = function_f517a8eefb0eb61a( team );
    function_cc25131864fa213c( team, rewardorigin, rewardangles, element, undefined );
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb25
// Size: 0x32
function function_6091d72afc11f381( team, success )
{
    if ( istrue( level.arrow.defused ) )
    {
        function_7f492ecaca596834( team );
    }
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb5f
// Size: 0xad
function onpickupelement( instance, player )
{
    scriptable = instance.instance;
    
    if ( !isdefined( scriptable ) )
    {
        return;
    }
    
    element = scriptable.elementref;
    
    if ( !isdefined( element ) )
    {
        return;
    }
    
    if ( !istrue( element.firstpickup ) )
    {
        return;
    }
    
    if ( !istrue( element.var_e9405cee0a584dea ) )
    {
        return;
    }
    
    questchain = level.var_81e77c935dfefd11.teaminstances[ player.team ];
    
    if ( isdefined( questchain ) )
    {
        element.var_e9405cee0a584dea = undefined;
        questchain notify( "reward_pickup", instance );
    }
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc14
// Size: 0xdb
function watchteamwipe( teaminfo, reason )
{
    if ( isdefined( reason ) && reason == "arrow_player_removed" )
    {
        return 0;
    }
    
    bombsite = level.arrow.props.bombsite;
    
    if ( !isdefined( bombsite ) )
    {
        return;
    }
    
    if ( istrue( bombsite.var_27db4eb198cd48b9 ) && teaminfo.state == 5 )
    {
        level thread function_cdcf6d5075e1b64b( teaminfo );
        return 1;
    }
    else if ( level.arrow.dvars.var_6f397e9d54ef92bf && teaminfo.state <= level.arrow.dvars.var_64c3fa68bcd43f4d )
    {
        function_2bc410bebeaf0563( teaminfo );
    }
    
    return 0;
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcf8
// Size: 0x84
function function_cdcf6d5075e1b64b( teaminfo )
{
    level endon( "game_ended" );
    
    if ( isdefined( level.arrow.props.bombsite ) )
    {
        level.arrow.props.bombsite.armedwipe = 1;
    }
    
    teaminfo function_56ee84f1b091647a();
    showsplashtoall( function_130af1b9f6740479( "elite_arrow_team_wipe" ), undefined, undefined, undefined, undefined, undefined );
    teaminfo notify( "team_info_watch" );
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd84
// Size: 0x5c
function function_cafda4ae3a3fef17( team )
{
    if ( istrue( level.elitechain.var_260b7b6b4cd0cf49 ) )
    {
        function_c4516dcf97c05302();
    }
    
    if ( istrue( level.elitechain.var_70aafcc7a8564bd9 ) )
    {
        level thread function_9635bbd80a84f4de();
    }
    
    level thread revealbombsite( team );
    level thread function_637768bc790b225a();
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xde8
// Size: 0x6a
function function_637768bc790b225a()
{
    if ( !isdefined( level.arrow.props.bombsite ) )
    {
        return;
    }
    
    bombsite = level.arrow.props.bombsite;
    bombsite endon( "death" );
    level endon( "game_ended" );
    bombsite waittill( "arm_complete" );
    function_4cdb704e5b9db9a3();
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe5a
// Size: 0x2
function function_4cdb704e5b9db9a3()
{
    
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe64
// Size: 0xbb
function function_7f492ecaca596834( team )
{
    if ( !isdefined( level.arrow.props.bombsite ) )
    {
        return;
    }
    
    defuser = level.arrow.props.bombsite.lastuser;
    
    if ( !isdefined( defuser ) )
    {
        return;
    }
    
    if ( isdefined( game[ "dialog" ][ "arrow_defused_extract" ] ) )
    {
        level thread scripts\mp\gametypes\br_public::brleaderdialogteam( "arrow_defused_extract", defuser.team, undefined, 2 );
    }
    
    level thread endgame( defuser.team, game[ "end_reason" ][ "nuke_end" ], undefined, 0, 1 );
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf27
// Size: 0x2cc
function function_2bc410bebeaf0563( teaminfo )
{
    if ( !function_73689348205a9057( teaminfo.targetteam ) )
    {
        return;
    }
    
    questchain = function_c6ec58a3c19cd74d( teaminfo.targetteam );
    dropcount = questchain.dropcount;
    
    if ( dropcount >= level.arrow.dvars.var_1a9061c53594239b )
    {
        logstring( "elite_chain::handleEliteTabletDrop - drop count limit reached, not dropping a new CQ tablet!" );
        return;
    }
    
    teaminfo.var_6e323a77bd00084 = 1;
    spawnorigin = teaminfo function_b16ba489ca372332();
    tablet = namespace_6c622b52017c6808::function_3ff56f0ba058501a( spawnorigin, ( 0, 0, 0 ) );
    level.arrow.props.var_62a2559833eb4ac2[ teaminfo.targetteam ] = tablet;
    showsplashtoallexceptteam( teaminfo.targetteam, function_130af1b9f6740479( "elite_arrow_dropped_tablet" ), undefined, undefined, undefined, undefined, undefined );
    tablet function_742e94df649bd24();
    questindex = questchain.index - 1;
    
    if ( istrue( questchain.var_e9405cee0a584dea ) )
    {
        questindex += 1;
    }
    
    tablet function_906171e231788d8c( questindex );
    tablet function_84ca8e2e2b054149( dropcount + 1 );
    tablet.task.skiptoken = 1;
    tablet.task.dropteam = teaminfo.targetteam;
    tablet.task.var_36847cfbae9581 = istrue( questchain.complete ) && istrue( questchain.success );
    tablet.task.payload = function_35ad50d0a725c013( teaminfo.targetteam );
    
    if ( isdefined( tablet.task.payload ) && isdefined( tablet.task.payload.time ) )
    {
        tablet.count = tablet.task.payload.time;
    }
    
    foreach ( player in level.players )
    {
        tablet.task.tabletent showtoplayer( player );
        tablet enablescriptableplayeruse( player );
    }
    
    logstring( "elite_chain::handleEliteTabletDrop - dropping a new CQ tablet off of a team wipe! " + spawnorigin );
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11fb
// Size: 0x72
function function_35ad50d0a725c013( team )
{
    task = level.contractmanager.var_b6fae9c9655c73bf[ team ];
    
    if ( !isdefined( task ) )
    {
        return undefined;
    }
    
    if ( !isdefined( task.type.funcs[ "getOnEliteDropQuestPayload" ] ) )
    {
        return undefined;
    }
    
    return task [[ task.type.funcs[ "getOnEliteDropQuestPayload" ] ]]();
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1276
// Size: 0xeb
function function_b16ba489ca372332()
{
    teaminfo = self;
    spawnorigin = teaminfo function_50b388aa83aeca2c();
    spawnorigin = scripts\mp\gametypes\br_public::droptogroundmultitrace( spawnorigin, 50 );
    
    if ( level.arrow.dvars.var_b0912248e98682c2 > 0 )
    {
        mindistsq = level.arrow.dvars.var_b06e2c48e9605108 * level.arrow.dvars.var_b06e2c48e9605108;
        maxdistsq = level.arrow.dvars.var_b0912248e98682c2 * level.arrow.dvars.var_b0912248e98682c2;
        spawnorigin = namespace_1eb3c4e0e28fac71::function_bef688acd85ee3a3( spawnorigin, mindistsq, maxdistsq, 1, 1 );
    }
    
    return spawnorigin;
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x136a
// Size: 0x13
function function_9635bbd80a84f4de()
{
    level endon( "game_ended" );
    level.secondaryvictory = undefined;
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1385
// Size: 0xb5
function revealbombsite( team )
{
    level endon( "game_ended" );
    
    if ( level.elitechain.var_60c7e4332d6e6faa > 0 )
    {
        wait level.elitechain.var_60c7e4332d6e6faa;
    }
    
    teaminfo = level.arrow.teaminfo[ team ];
    
    if ( isdefined( teaminfo ) && isdefined( level.arrow.props.bombsite ) )
    {
        level.arrow.props.bombsite arrow_bombsitereveal( teaminfo.champion );
    }
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1442
// Size: 0x7a
function function_b550bb18a012e142( team, status )
{
    teammates = getteamdata( team, "players" );
    
    foreach ( player in teammates )
    {
        player setclientomnvar( "ui_br_elite_quest_chain_status", status );
    }
}

// Namespace namespace_8559d2200e7e7e86 / namespace_2c0e84fc96f7dc98
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14c4
// Size: 0x7a
function function_e17d51f3f2435d87( team, questindex )
{
    teammates = getteamdata( team, "players" );
    
    foreach ( player in teammates )
    {
        player setclientomnvar( "ui_br_elite_quest_chain_progress", questindex );
    }
}

