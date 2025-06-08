#using script_16ea1b94f0f381b3;
#using script_185660037b9236c1;
#using script_220d0eb95a8fab7d;
#using script_3ab210ea917601e7;
#using script_41387eecc35b88bf;
#using script_46c7c73b1a7e4773;
#using script_4ef01fe6151dde4d;
#using script_4fdefae8b7bcdf73;
#using script_638d701d263ee1ed;
#using script_64351208cb856df9;
#using script_6d70705bb9712bb;
#using script_7956d56c4922bd1;
#using script_79deab1955343d5d;
#using script_7edf952f8921aa6b;
#using script_9880b9dc28bc25e;
#using script_d60e0219a7419e0;
#using scripts\asm\shared\mp\utility;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\agents\ai_spawn_director;
#using scripts\cp_mp\calloutmarkerping;
#using scripts\cp_mp\challenges;
#using scripts\cp_mp\interaction;
#using scripts\cp_mp\loot\common_cache;
#using scripts\cp_mp\loot\common_item;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\cp_mp\utility\squad_utility;
#using scripts\cp_mp\zombie_perks;
#using scripts\engine\scriptable;
#using scripts\engine\utility;
#using scripts\mp\ai_behavior;
#using scripts\mp\anim;
#using scripts\mp\gameobjects;
#using scripts\mp\hud_message;
#using scripts\mp\objidpoolmanager;
#using scripts\mp\pmc_missions;
#using scripts\mp\utility\entity;
#using scripts\mp\utility\infilexfil;
#using scripts\mp\utility\player;
#using scripts\mp\utility\teams;

#namespace namespace_5c6deef041b03f11;

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 0
// Checksum 0x0, Offset: 0xd9a
// Size: 0x9b
function function_d3befda2a868e1ac()
{
    if ( !challengesenabled() )
    {
        return;
    }
    
    namespace_70f0bf4af2b789eb::main();
    scripts\engine\utility::registersharedfunc( "ob_quest_missions", "onConvoyActive", &onconvoyactive );
    scripts\engine\utility::registersharedfunc( "ob_quest_missions", "onMercStrongholdActive", &onmercstrongholdactive );
    scripts\engine\utility::registersharedfunc( "ob_quest_missions", "onOutlastActive", &onoutlastactive );
    scripts\engine\utility::registersharedfunc( "ob_quest_missions", "onSabotageExtractorDisabled", &onsabotageextractordisabled );
    scripts\engine\utility::registersharedfunc( "ob_quest_missions", "OnWeaponStashActive", &onweaponstashactive );
    callback::add( "merc_warlord_death", &function_e23b5eafc9d0c7bf );
    level thread function_5233ec7f3a4cfa23();
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 1
// Checksum 0x0, Offset: 0xe3d
// Size: 0xbd
function onconvoyactive( activity_instance )
{
    activity_instance callback::callback( "on_convoy_begin" );
    var_f905b8919064b561 = undefined;
    
    foreach ( ai in activity_instance.var_70b5f128bfa2986e )
    {
        if ( isdefined( ai ) && isdefined( ai.agent_type ) && ( ai.agent_type == "actor_jup_ob_enemy_specialist_captain" || ai.agent_type == "actor_jup_ob_enemy_specialist_commander" ) )
        {
            activity_instance thread function_83f49b42abfbeddb( ai );
            break;
        }
    }
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 1
// Checksum 0x0, Offset: 0xf02
// Size: 0x161
function function_83f49b42abfbeddb( boss )
{
    boss waittill( "death", attacker );
    v_pos = getclosestpointonnavmesh( boss.origin );
    v_ground = getgroundposition( v_pos, 50 );
    item_keycard = function_38e113a4c30f6c0d( "obloot_key_human_stronghold", v_ground, ( 0, 0, 0 ), 0, 1, 1, 1 );
    
    if ( isdefined( item_keycard ) )
    {
        item_keycard.var_1018ba92f1186325 = 1;
        itembundle = getscriptbundle( "itemspawnentry:" + "ob_jup_item_key_human_stronghold" );
        lootid = function_6d15e119c2779a93( itembundle );
    }
    
    var_72b36e074e46074b = getplayersinradius( v_pos, 1500 );
    
    foreach ( player in var_72b36e074e46074b )
    {
        if ( namespace_838b439602b3acc7::function_5acc35fc66331385( player, 16093 ) || getdvarint( @"hash_7846a66ee6afec3e", 0 ) || getdvarint( @"hash_7b8b09c504a0c9a0", 0 ) )
        {
            player scripts\cp_mp\calloutmarkerping::calloutmarkerping_createcallout( 14, item_keycard.origin, item_keycard.index, lootid );
        }
    }
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 2
// Checksum 0x0, Offset: 0x106b
// Size: 0x4a
function onweaponstashactive( activity_instance, player )
{
    if ( namespace_838b439602b3acc7::function_5acc35fc66331385( player, 16140 ) || getdvarint( @"hash_7b8b09c504a0c9a0", 0 ) )
    {
        player.var_d1e277c70c37ea5a = 1;
        activity_instance thread function_64e8f53ac12ac246();
    }
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 0
// Checksum 0x0, Offset: 0x10bd
// Size: 0x25
function function_64e8f53ac12ac246()
{
    self.safe waittill( "safe_unlocked" );
    self.safe.var_208c5333afcd7102 = undefined;
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 2
// Checksum 0x0, Offset: 0x10ea
// Size: 0x74
function onmercstrongholdactive( activity_instance, player )
{
    if ( namespace_838b439602b3acc7::function_5acc35fc66331385( player, 16946 ) || namespace_838b439602b3acc7::function_5acc35fc66331385( player, 17078 ) || getdvarint( @"hash_7b8b09c504a0c9a0", 0 ) || getdvarint( @"hash_7846a66ee6afec3e", 0 ) )
    {
        player.var_d1e277c70c37ea5a = 1;
        activity_instance thread function_4264199ac384ff4e();
        activity_instance thread function_fa4fe5913824beba();
    }
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 0
// Checksum 0x0, Offset: 0x1166
// Size: 0x16
function function_4264199ac384ff4e()
{
    self waittill( "merc_stronghold_cleared" );
    callback::callback( "merc_stronghold_cleared" );
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 0
// Checksum 0x0, Offset: 0x1184
// Size: 0x11a
function function_fa4fe5913824beba()
{
    self.safe waittill( "safe_unlocked" );
    callback::callback( "merc_stronghold_cleared" );
    v_pos = getclosestpointonnavmesh( self.safe.origin );
    item_intel = undefined;
    
    while ( !isdefined( item_intel ) )
    {
        item_intel = function_38e113a4c30f6c0d( "obloot_ava_intel_merc_stronghold", v_pos, ( 0, 0, 0 ), 0, 1, 1, 1 );
        waitframe();
    }
    
    wait 0.5;
    
    if ( isdefined( item_intel ) )
    {
        itembundle = getscriptbundle( "itemspawnentry:" + "ob_jup_item_act1_tier4_intel_tablet" );
        lootid = function_6d15e119c2779a93( itembundle );
        
        foreach ( player in self.var_6c29f2fdb0054bbe )
        {
            player scripts\cp_mp\calloutmarkerping::calloutmarkerping_createcallout( 14, item_intel.origin, item_intel.index, lootid );
        }
    }
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 0
// Checksum 0x0, Offset: 0x12a6
// Size: 0x1b1
function function_97386f131cccf1e6()
{
    level.safecrack = spawnstruct();
    level.safecrack.revealradius = getdvarint( @"hash_de0487f3e5f484a3", 24000 );
    level.safecrack.hideicons = getdvarint( @"hash_3cf3f91f9a2e76d8", 1 );
    level.safecrack.enabledefenders = getdvarint( @"hash_d69ece7d8e88eaad", 1 );
    level.safecrack.attractzombies = getdvarint( @"hash_134e75ab81aab7de", 1 );
    level.safecrack.revealradiussq = squared( level.safecrack.revealradius );
    scripts\engine\scriptable::scriptable_addusedcallbackbypart( "safe", &function_4b374266cdca5335 );
    function_5f1aa46d828ea326();
    game[ "dialog" ][ "safecrack_safe_is_near" ] = "dx_br_dmzo_cost_ovld_actualtoultra1target";
    game[ "dialog" ][ "safecrack_safe_bringing_heat" ] = "dx_br_dmzo_cost_ovld_ultra1beadvisedthats";
    game[ "dialog" ][ "safecrack_enemies_incoming" ] = "dx_br_dmzo_cost_ovld_ultra1yougothostiles";
    game[ "dialog" ][ "safecrack_enemies_alerted" ] = "dx_br_dmzo_cost_ovld_headsupultra1thatsaf";
    game[ "dialog" ][ "safecrack_safe_is_open0" ] = "dx_br_dmzo_cost_ovld_ultra1thesafeisopens";
    game[ "dialog" ][ "safecrack_safe_is_open1" ] = "dx_br_dmzo_cost_ovld_ultra1safeisopensecu";
    game[ "dialog" ][ "safecrack_safe_is_open2" ] = "dx_br_dmzo_cost_ovld_ultra1safeisopensecu_01";
    game[ "dialog" ][ "safecrack_enemies_at_safe" ] = "dx_br_dmzo_cost_ovld_ultra1enemyoperators";
    game[ "dialog" ][ "safecrack_enemies_near_safe" ] = "dx_br_dmzo_cost_ovld_actualtoultra1enemie";
    game[ "dialog" ][ "safecrack_enemies_opening_safe" ] = "dx_br_dmzo_cost_ovld_ultra1hostilesareatt";
    function_922249df70b163b4();
    function_c6335e6b5148073c();
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 0
// Checksum 0x0, Offset: 0x145f
// Size: 0xb7
function function_922249df70b163b4()
{
    if ( isdefined( self.safe_struct ) )
    {
        self.var_fb44575552fa682 = self.safe_struct;
        return;
    }
    
    other_structs = getstructarray( self.varianttag, "target" );
    
    foreach ( struct in other_structs )
    {
        if ( isdefined( struct.script_noteworthy ) && struct.script_noteworthy == "s_safe_spawn" )
        {
            self.var_fb44575552fa682 = struct;
            break;
        }
    }
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 0
// Checksum 0x0, Offset: 0x151e
// Size: 0x395
function function_c6335e6b5148073c()
{
    self endon( "activity_ended" );
    self endon( "instance_destroyed" );
    self.capture_radius = 150;
    self.attract_radius = 2048;
    self.lose_progress = 1;
    self.encounter_bundle = "jup_ob_safecrack_encounter";
    var_76903f9b275f23d4 = self.var_fb44575552fa682;
    self.origin = var_76903f9b275f23d4.origin;
    self.angles = var_76903f9b275f23d4.angles;
    self.region_difficulty = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10( self.origin );
    
    switch ( self.region_difficulty )
    {
        default:
            self.region_difficulty = "difficulty_easy";
        case #"hash_7bb2cd766703d463":
            self.capture_time = 75;
            self.var_48c4ba670a4f33fc = "ob_jup_items_activity_safecrack_green";
            break;
        case #"hash_af83e47edfa8900a":
            self.capture_time = 75;
            self.var_48c4ba670a4f33fc = "ob_jup_items_activity_safecrack_green";
            break;
        case #"hash_5343b465e56ec9a4":
            self.capture_time = 75;
            self.var_48c4ba670a4f33fc = "ob_jup_items_activity_safecrack_green";
            break;
        case #"hash_651f76c0ad6741ec":
            self.capture_time = 75;
            self.var_48c4ba670a4f33fc = "ob_jup_items_activity_safecrack_green";
            break;
    }
    
    self.capture_time = float( self.capture_time );
    self.var_82fe1c44f0e59dd5 = squared( self.capture_radius );
    self.var_287c8f447c48c9aa = squared( self.attract_radius );
    safe = spawnscriptable( "safecrack_safe", self.origin, self.angles );
    safe setscriptablepartstate( "safe", "usable_not_open" );
    safe.activity = self;
    self.safe = safe;
    safe.curorigin = safe.origin;
    safe.offset3d = ( 0, 0, 15 );
    safe scripts\mp\gameobjects::requestid( 1, 1, undefined, 1 );
    scripts\mp\objidpoolmanager::update_objective_setbackground( safe.objidnum, 1 );
    scripts\mp\objidpoolmanager::update_objective_setzoffset( safe.objidnum, 15 );
    scripts\mp\objidpoolmanager::update_objective_position( safe.objidnum, safe.origin + ( 0, 0, 15 ) );
    scripts\mp\objidpoolmanager::objective_pin_global( safe.objidnum, 1 );
    scripts\mp\objidpoolmanager::function_d7e3c4a08682c1b9( safe.objidnum, 1 );
    scripts\mp\objidpoolmanager::objective_set_play_intro( safe.objidnum, 0 );
    
    if ( level.safecrack.hideicons )
    {
        scripts\mp\objidpoolmanager::function_9cad42ac02eff950( safe.objidnum );
    }
    else
    {
        scripts\mp\objidpoolmanager::function_a28e8535e00d34f3( safe.objidnum );
    }
    
    scripts\mp\objidpoolmanager::function_6ae37618bb04ea60( safe.objidnum );
    safe.trigger = spawn( "trigger_radius", safe.origin, 0, self.capture_radius, self.capture_radius );
    safe.trigger trigger_off();
    safe thread function_972f4e9d555b09a6();
    
    if ( level.safecrack.enabledefenders )
    {
        safe thread function_74717c53a1ed7f5();
    }
    
    self.safe waittill( "safe_unlocking" );
    thread function_bdfe768bd3eed7fc();
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 0
// Checksum 0x0, Offset: 0x18bb
// Size: 0x20
function function_bdfe768bd3eed7fc()
{
    self endon( "activity_ended" );
    self endon( "instance_destroyed" );
    self.safe waittill( "safe_looted" );
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 1
// Checksum 0x0, Offset: 0x18e3
// Size: 0x35
function function_ed260c1f4a6de9f8( activity_succeeded )
{
    self endon( "instance_destroyed" );
    namespace_40713433c91dd86c::function_c402ecda1e84ba27( self.var_6c29f2fdb0054bbe, 0, self.difficulty_region, self.origin );
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 0
// Checksum 0x0, Offset: 0x1920
// Size: 0x9
function function_f0f250986bb9d773()
{
    self endon( "instance_destroyed" );
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 6
// Checksum 0x0, Offset: 0x1931
// Size: 0xb6
function function_4b374266cdca5335( safe, part, state, player, var_a5b2c541413aa895, usestring )
{
    if ( isdefined( player ) && istrue( player.var_859654e0445a36d9 ) )
    {
        player scripts\mp\hud_message::showerrormessage( "MP/DENY_USE_CARRY" );
        return;
    }
    
    if ( state == "usable_not_open" )
    {
        thread function_58ab5bffacda35c3( safe, part, state, player );
        return;
    }
    
    if ( state == "open_usable" )
    {
        if ( !isdefined( safe.contents ) )
        {
            safe notify( "safe_looted" );
            safe.containertype = 4;
            common_cache::function_d71a41afca697376( safe, "ob_jup_items_contract_weaponstash", 5 );
        }
        
        scripts\cp_mp\loot\common_cache::function_30f5ea60517f9e06( safe, player );
    }
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 4
// Checksum 0x0, Offset: 0x19ef
// Size: 0x10c
function function_58ab5bffacda35c3( safe, part, state, player )
{
    safe setscriptablepartstate( part, "unusable" );
    safe.successfuluse = 0;
    safe thread function_6af78ce78267233c( player );
    safe function_5317479fee3ffd7d( player );
    
    if ( istrue( safe.successfuluse ) )
    {
        safe.teams = [ player.team ];
        safe.trigger trigger_on();
        
        if ( level.safecrack.attractzombies )
        {
        }
        
        safe notify( "safe_unlocking" );
        scripts\mp\objidpoolmanager::update_objective_state( safe.objidnum, "current" );
        scripts\mp\objidpoolmanager::objective_show_progress( safe.objidnum, 1 );
        scripts\mp\objidpoolmanager::objective_teammask_addtomask( safe.objidnum, player.team );
        safe thread function_76d84b28702a71fb();
        return;
    }
    
    safe setscriptablepartstate( part, "usable_not_open" );
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 0
// Checksum 0x0, Offset: 0x1b03
// Size: 0x25c
function function_76d84b28702a71fb()
{
    level endon( "game_ended" );
    self endon( "safe_unlocked" );
    self.progress = 0;
    var_306804c6c85c36b0 = undefined;
    intervalindex = 0;
    shownplayers = [];
    
    while ( true )
    {
        if ( isdefined( self.trigger ) && !istrue( self.trigger.trigger_off ) )
        {
            if ( !isdefined( var_306804c6c85c36b0 ) )
            {
                var_306804c6c85c36b0 = [ 0, self.activity.capture_time / 4, self.activity.capture_time / 2, self.activity.capture_time / 100 * 75 ];
            }
            
            if ( self.nearbyplayers.size > 0 )
            {
                progressbefore = self.progress;
                self.progress = min( self.activity.capture_time, self.progress + level.framedurationseconds );
            }
            else if ( self.activity.lose_progress )
            {
                progressbefore = self.progress;
                self.progress = max( 0, self.progress - level.framedurationseconds * 0.5 );
            }
            
            progress = self.progress / self.activity.capture_time;
            shownplayers = function_c24e63b1bc58730( self.nearbyplayers, shownplayers, progress );
            scripts\mp\objidpoolmanager::objective_set_progress( self.objidnum, progress );
            
            if ( self.progress >= self.activity.capture_time )
            {
                thread function_81207cdee7c85896();
                thread function_dc8aff8faf2a6a3b();
            }
            else if ( self.nearbyplayers.size > 0 && isdefined( var_306804c6c85c36b0[ intervalindex ] ) && self.progress >= var_306804c6c85c36b0[ intervalindex ] )
            {
                intervalindex++;
                function_99b95e1bcf411ecd();
                
                if ( !istrue( self.reinforcementscalled ) && intervalindex == 2 )
                {
                    self.shouldreinforce = 1;
                }
            }
            else if ( self.nearbyplayers.size == 0 && intervalindex > 0 )
            {
                intervalindex = 0;
            }
        }
        
        waitframe();
    }
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 0
// Checksum 0x0, Offset: 0x1d67
// Size: 0xb9
function function_dc8aff8faf2a6a3b()
{
    v_pos = getclosestpointonnavmesh( self.origin );
    item_keycard = function_38e113a4c30f6c0d( "ob_jup_item_act1_tier4_intel_tablet", v_pos, ( 0, 0, 0 ), 0, 1, 1, 1 );
    item_keycard = undefined;
    wait 0.5;
    
    if ( isdefined( item_keycard ) )
    {
        itembundle = getscriptbundle( "itemspawnentry:" + "ob_jup_item_act1_tier4_intel_tablet" );
        lootid = function_6d15e119c2779a93( itembundle );
        player = random( level.players );
        player scripts\cp_mp\calloutmarkerping::calloutmarkerping_createcallout( 14, item_keycard.origin, item_keycard.index, lootid );
    }
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 3
// Checksum 0x0, Offset: 0x1e28
// Size: 0x110
function function_c24e63b1bc58730( nearbyplayers, shownplayers, progress )
{
    allplayers = array_combine( nearbyplayers, shownplayers );
    var_f6fd7b0e73c3270c = shownplayers;
    
    foreach ( player in allplayers )
    {
        if ( !isdefined( player ) )
        {
            continue;
        }
        
        if ( !array_contains( shownplayers, player ) && array_contains( nearbyplayers, player ) )
        {
            if ( scripts\mp\objidpoolmanager::function_ce702e5925e31fc9( self.objidnum, player, 1, 2, %MP_DMZ_MISSIONS/OPENING_SAFE ) )
            {
                scripts\mp\objidpoolmanager::objective_playermask_addshowplayer( self.objidnum, player );
                var_f6fd7b0e73c3270c = array_add( var_f6fd7b0e73c3270c, player );
            }
            
            continue;
        }
        
        if ( array_contains( shownplayers, player ) && !array_contains( nearbyplayers, player ) )
        {
            scripts\mp\objidpoolmanager::function_26259bd38697b5ad( self.objidnum, player );
            var_f6fd7b0e73c3270c = array_remove( var_f6fd7b0e73c3270c, player );
        }
    }
    
    return var_f6fd7b0e73c3270c;
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 0
// Checksum 0x0, Offset: 0x1f41
// Size: 0x182
function function_81207cdee7c85896()
{
    if ( !istrue( self.unlocked ) )
    {
        self.unlocked = 1;
    }
    
    foreach ( team in self.teams )
    {
        foreach ( player in getteamdata( team, "players" ) )
        {
            scripts\mp\objidpoolmanager::objective_unpin_player( self.objidnum, player );
            scripts\mp\objidpoolmanager::function_26259bd38697b5ad( self.objidnum, player );
            
            if ( !isdefined( player.var_6b41d67653e80c4b ) )
            {
                player.var_6b41d67653e80c4b = 0;
            }
            
            player.var_6b41d67653e80c4b++;
        }
        
        self.activity function_1281c7fff9456e18( "safecrack_unlocked", getteamdata( team, "players" ) );
    }
    
    self setscriptablepartstate( "safe", "opening" );
    function_2169641d6a403864( self.encounterid );
    
    if ( level.safecrack.attractzombies )
    {
        namespace_5381a59d140f4df8::remove_attractor( self.zombie_attractor );
    }
    
    self.trigger delete();
    scripts\mp\gameobjects::releaseid();
    self notify( "safe_unlocked" );
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 0
// Checksum 0x0, Offset: 0x20cb
// Size: 0xbe
function function_972f4e9d555b09a6()
{
    level endon( "game_ended" );
    self endon( "safe_unlocked" );
    self.nearbyplayers = [];
    
    while ( true )
    {
        self.trigger waittill( "trigger", player );
        
        if ( !isplayer( player ) || array_contains( self.nearbyplayers, player ) )
        {
            continue;
        }
        
        if ( !array_contains( self.teams, player.team ) )
        {
            self.teams[ self.teams.size ] = player.team;
        }
        
        self.nearbyplayers = array_add( self.nearbyplayers, player );
        childthread function_5372077bc94f2397( player );
    }
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 1
// Checksum 0x0, Offset: 0x2191
// Size: 0x8b
function function_5372077bc94f2397( player )
{
    while ( isdefined( self.trigger ) && isdefined( player ) && isalive( player ) && distancesquared( self.trigger.origin, player.origin ) < 1.1 * self.activity.var_82fe1c44f0e59dd5 )
    {
        wait 0.2;
    }
    
    self.nearbyplayers = array_remove( self.nearbyplayers, player );
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 0
// Checksum 0x0, Offset: 0x2224
// Size: 0xac
function function_74717c53a1ed7f5()
{
    self.agents = [];
    self.encounterid = scripts\cp_mp\agents\ai_spawn_director::spawn_request( "ai_encounter:" + self.activity.encounter_bundle, self.origin, 1024, 1, 1, 0 );
    
    if ( isdefined( self.encounterid ) )
    {
        function_d37068aac7785c04( self.encounterid, self.activity.region_difficulty, 1 );
        scripts\cp_mp\agents\ai_spawn_director::function_e4a67fe4ddca7ed5( self.encounterid, &function_111b3e11bf99b915, [ self ] );
        scripts\cp_mp\agents\ai_spawn_director::function_7a2920be35f4386( self.encounterid, &function_6d930ef0e465d1c6, [ self ] );
    }
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 4
// Checksum 0x0, Offset: 0x22d8
// Size: 0xbc
function function_111b3e11bf99b915( requestid, userdata, agent, data )
{
    agent endon( "death" );
    safe = userdata[ 0 ];
    
    if ( isalive( agent ) )
    {
        safe.agents[ safe.agents.size ] = agent;
        
        if ( safe.agents.size <= 2 )
        {
            childthread scripts\mp\ai_behavior::function_b11c1964f528574b( agent, 0 );
        }
        else
        {
            childthread scripts\mp\ai_behavior::function_9bbf1713a14fa580( agent, 512, 256, safe.origin );
        }
        
        agent function_65cdab0fc78aba8f( safe.origin, safe.activity.capture_radius );
    }
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 3
// Checksum 0x0, Offset: 0x239c
// Size: 0x5c, Type: bool
function function_6d930ef0e465d1c6( requestid, userdata, wavenumber )
{
    safe = userdata[ 0 ];
    
    if ( !istrue( safe.reinforcementscalled ) && istrue( safe.shouldreinforce ) )
    {
        safe.reinforcementscalled = 1;
        return true;
    }
    
    return false;
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 0
// Checksum 0x0, Offset: 0x2401
// Size: 0x107
function function_99b95e1bcf411ecd()
{
    agents = scripts\mp\utility\entity::function_d9ce8fb00f0e5fa1( self.origin, self.activity.attract_radius, "team_hundred_ninety" );
    attracted = [];
    
    foreach ( agent in agents )
    {
        if ( !isplayer( agent ) )
        {
            attracted[ attracted.size ] = agent;
        }
    }
    
    agents = attracted;
    
    foreach ( agent in agents )
    {
        agent thread scripts\mp\ai_behavior::function_a5117518725da028( agent, self.origin, 128, 64, undefined, 1, agents, 0 );
    }
    
    self.agents = array_combine_unique( self.agents, agents );
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 2
// Checksum 0x0, Offset: 0x2510
// Size: 0xb7, Type: bool
function function_7d06997663e2b19f( attractor, zombie )
{
    safe = attractor.source.safe;
    
    if ( is_equal( zombie.aicategory, "normal" ) && distance( zombie.origin, safe.origin ) > safe.activity.capture_radius / 2 )
    {
        if ( zombie.team == "team_two_hundred" )
        {
            safe.agents[ safe.agents.size ] = zombie;
            return true;
        }
    }
    
    return false;
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 0
// Checksum 0x0, Offset: 0x25d0
// Size: 0xc6
function function_5f1aa46d828ea326()
{
    level.scr_animtree[ "safe_drill_player" ] = #script_model;
    level.scr_anim[ "safe_drill_player" ][ "safedrill_enter" ] = script_model#iw9_dmz_safedrill_enter_sdr;
    level.scr_eventanim[ "safe_drill_player" ][ "safedrill_enter" ] = %"safedrill_enter";
    level.scr_viewmodelanim[ "safe_drill_player" ][ "safedrill_enter" ] = "iw9_dmz_safedrill_enter_sdr";
    level.scr_anim[ "safe_drill_player" ][ "safedrill_exit" ] = script_model#iw9_dmz_safedrill_exit_sdr;
    level.scr_eventanim[ "safe_drill_player" ][ "safedrill_exit" ] = %"safedrill_exit";
    level.scr_viewmodelanim[ "safe_drill_player" ][ "safedrill_exit" ] = "iw9_dmz_safedrill_exit_sdr";
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 1
// Checksum 0x0, Offset: 0x269e
// Size: 0x2ba
function function_5317479fee3ffd7d( player )
{
    player endon( "death_or_disconnect" );
    player endon( "enter_live_ragdoll" );
    player endon( "interact_interrupt" );
    player function_583c8ddc51dd46d6( 0 );
    playerviewangles = player getplayerangles();
    player.linktoent = player spawn_tag_origin( player.origin, player.playerviewangles );
    player playerlinktodelta( player.linktoent, "tag_origin", 1, 0, 0, 30, 30, 0, 1 );
    goalpos = self.origin + rotatevector( ( 50.586, -6.262, 0 ), self.angles );
    forward = ( 0, 0, 0 ) - anglestoforward( self.angles );
    up = ( 0, 0, 1 );
    right = vectorcross( forward, up );
    goalangles = axistoangles( forward, right, up );
    movetotime = 0.5;
    player.linktoent moveto( goalpos, movetotime, 0.1, 0.1 );
    player.linktoent rotateto( goalangles, movetotime, 0.1, 0.1 );
    player setstance( "stand" );
    var_cd9982adb17761a8 = gettime();
    player scripts\cp_mp\utility\inventory_utility::function_fc6a5b145563be33();
    var_698cc218e4ade75f = gettime();
    var_218f64cb035d54be = movetotime - ( var_698cc218e4ade75f - var_cd9982adb17761a8 ) / 1000;
    waittime = max( 0, var_218f64cb035d54be );
    wait waittime;
    player setorigin( goalpos );
    player setplayerangles( goalangles );
    player thread scripts\mp\utility\infilexfil::infil_player_rig_updated( "safe_drill_player", player.origin, player.angles );
    player.player_rig showonlytoplayer( player );
    self setscriptablepartstate( "safe", "unusable_intro_drilling" );
    scripts\mp\anim::anim_player_solo( player, player.player_rig, "safedrill_enter" );
    
    if ( isreallyalive( player ) )
    {
        scripts\mp\anim::anim_player_solo( player, player.player_rig, "safedrill_exit" );
    }
    
    if ( isdefined( player ) && isreallyalive( player ) )
    {
        player notify( "interact_finished" );
    }
    
    waitframe();
    
    if ( istrue( level.gameended ) )
    {
        return;
    }
    
    if ( isdefined( player ) )
    {
        player notify( "remove_rig" );
        
        if ( isreallyalive( player ) )
        {
            player function_583c8ddc51dd46d6( 1 );
        }
    }
    
    self.successfuluse = 1;
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 1
// Checksum 0x0, Offset: 0x2960
// Size: 0x128
function function_583c8ddc51dd46d6( isallowed )
{
    if ( !isallowed )
    {
        val::set( "drilling", "allow_jump", 0 );
        val::set( "drilling", "gesture", 0 );
        val::set( "drilling", "melee", 0 );
        val::set( "drilling", "mantle", 0 );
        val::set( "drilling", "offhand_weapons", 0 );
        val::set( "drilling", "allow_movement", 0 );
        val::set( "drilling", "sprint", 0 );
        val::set( "drilling", "fire", 0 );
        val::set( "drilling", "reload", 0 );
        val::set( "drilling", "weapon_pickup", 0 );
        val::set( "drilling", "weapon_switch", 0 );
        val::set( "drilling", "offhand_weapons", 0 );
        val::set( "drilling", "execution_victim", 0 );
        val::set( "drilling", "vehicle_use", 0 );
        self function_35501b42058d4de9();
        return;
    }
    
    val::reset_all( "drilling" );
    self function_bb04491d50d9e43e();
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 1
// Checksum 0x0, Offset: 0x2a90
// Size: 0x7c
function function_6af78ce78267233c( player )
{
    player endon( "interact_finished" );
    player scripts\engine\utility::waittill_any_3( "death_or_disconnect", "enter_live_ragdoll", "last_stand_start" );
    player notify( "interact_interrupt" );
    player stopanimscriptsceneevent();
    
    if ( isdefined( player.linktoent ) )
    {
        player unlink();
        player.linktoent delete();
        player.linktoent = undefined;
    }
    
    player notify( "remove_rig" );
    player function_583c8ddc51dd46d6( 1 );
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 1
// Checksum 0x0, Offset: 0x2b14
// Size: 0xb7
function function_e34b2762fa082dcc( player )
{
    wait 4;
    player thread scripts\mp\hud_message::showsplash( "safecrack_revealed", undefined, undefined, undefined, 1, "splash_list_jup_ob" );
    
    foreach ( safe in level.safes )
    {
        if ( distance2dsquared( safe.origin, player.origin ) <= level.safecrack.revealradiussq )
        {
            scripts\mp\objidpoolmanager::objective_playermask_addshowplayer( safe.objidnum, player );
        }
    }
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 1
// Checksum 0x0, Offset: 0x2bd3
// Size: 0x14
function onoutlastactive( activity_instance )
{
    activity_instance thread function_da3f7ddab34651a2();
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 0
// Checksum 0x0, Offset: 0x2bef
// Size: 0x3c2
function function_da3f7ddab34651a2()
{
    self endon( "activity_ended" );
    self endon( "instance_destroyed" );
    self waittill( "outlast_space_entered_first_time" );
    var_3ec90d6d2afa472f = [];
    
    foreach ( dressing in self.var_cd05af3824c52cde )
    {
        if ( isdefined( dressing.targetname ) && dressing.targetname == "jup_zm_phase_crystal_floor" )
        {
            if ( dressing.origin[ 2 ] > self.pnd_device.origin[ 2 ] + -10 && dressing.origin[ 2 ] < self.pnd_device.origin[ 2 ] + 10 )
            {
                var_3ec90d6d2afa472f[ var_3ec90d6d2afa472f.size ] = dressing;
            }
        }
    }
    
    spawn_origin = undefined;
    var_ee6145d714e45387 = undefined;
    
    if ( isarray( var_3ec90d6d2afa472f ) && var_3ec90d6d2afa472f.size > 0 )
    {
        ground_prop = random( var_3ec90d6d2afa472f );
        spawn_origin = ground_prop.origin;
    }
    else if ( isdefined( self.pnd_device ) )
    {
        spawn_origin = self.pnd_device.origin;
    }
    
    if ( isdefined( spawn_origin ) )
    {
        var_ee6145d714e45387 = getclosestpointonnavmesh( spawn_origin );
    }
    
    if ( !isdefined( var_ee6145d714e45387 ) )
    {
        if ( isarray( self.var_2d5b80c94b21ea0e ) && self.var_2d5b80c94b21ea0e.size > 0 )
        {
            rand_player = random( self.var_2d5b80c94b21ea0e );
            var_ee6145d714e45387 = rand_player.origin;
        }
        else if ( isarray( self.var_6c29f2fdb0054bbe ) && self.var_6c29f2fdb0054bbe.size > 0 )
        {
            rand_player = random( self.var_6c29f2fdb0054bbe );
            var_ee6145d714e45387 = rand_player.origin;
        }
        else
        {
            return;
        }
    }
    
    if ( isarray( self.content_structs[ "ava_tablet" ] ) && isdefined( self.content_structs[ "ava_tablet" ][ 0 ] ) )
    {
        var_ee6145d714e45387 = default_to( self.content_structs[ "ava_tablet" ][ 0 ].origin, var_ee6145d714e45387 );
    }
    
    self waittill( "outlast_complete" );
    on_mission = 0;
    
    foreach ( player in self.var_6c29f2fdb0054bbe )
    {
        if ( namespace_838b439602b3acc7::function_5acc35fc66331385( player, 16822 ) || getdvarint( @"hash_7b8b09c504a0c9a0", 0 ) )
        {
            on_mission = 1;
        }
    }
    
    if ( istrue( on_mission ) )
    {
        item_tablet = function_38e113a4c30f6c0d( "obloot_intel_tablet", var_ee6145d714e45387, ( 0, 0, 0 ), 0, 1, undefined, 1 );
        item_tablet.playerlist = self.var_6c29f2fdb0054bbe;
        wait 0.5;
        
        if ( isdefined( item_tablet ) )
        {
            item_tablet.var_6965f4722cba59d8 = 1;
            itembundle = getscriptbundle( "itemspawnentry:" + "ob_jup_item_act1_tier6_avas_tablet" );
            lootid = function_6d15e119c2779a93( itembundle );
            
            foreach ( player in self.var_6c29f2fdb0054bbe )
            {
                player scripts\cp_mp\calloutmarkerping::calloutmarkerping_createcallout( 14, item_tablet.origin, item_tablet.index, lootid );
            }
        }
    }
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 1
// Checksum 0x0, Offset: 0x2fb9
// Size: 0x37
function function_8361aeffba083290( player )
{
    pickup_sfx = "uin_ob_pickup_valuable";
    player playsound( pickup_sfx );
    callback::callback( "outlast_tablet_interact" );
    self freescriptable();
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 2
// Checksum 0x0, Offset: 0x2ff8
// Size: 0x15c
function onsabotageextractordisabled( activity_instance, extractor )
{
    if ( activity_instance function_b978f5e2753317a4( 16446 ) || getdvarint( @"force_challenges", 0 ) || getdvarint( @"hash_7b8b09c504a0c9a0", 0 ) )
    {
        if ( !isdefined( activity_instance.var_da225ff88f5191eb ) || !activity_instance.var_da225ff88f5191eb )
        {
            quest_item = undefined;
            v_pos = getclosestpointonnavmesh( extractor.origin );
            
            while ( !isdefined( quest_item ) )
            {
                quest_item = function_38e113a4c30f6c0d( "obloot_quest_a2t4_container", v_pos, undefined, undefined, undefined, undefined, 1 );
                wait 0.5;
            }
            
            if ( isdefined( quest_item ) )
            {
                itembundle = getscriptbundle( "itemspawnentry:" + "ob_jup_item_act2_tier4_container" );
                lootid = function_6d15e119c2779a93( itembundle );
                
                foreach ( player in activity_instance.var_6c29f2fdb0054bbe )
                {
                    player scripts\cp_mp\calloutmarkerping::calloutmarkerping_createcallout( 14, quest_item.origin, quest_item.index, lootid );
                }
            }
            
            activity_instance.var_da225ff88f5191eb = 1;
        }
    }
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x315c
// Size: 0x15c
function private function_bebd651e6464d232()
{
    s_bazaar = getstruct( "quest_a2t3_essence_bazaar", "targetname" );
    var_a4871cdc42d9531b = function_38e113a4c30f6c0d( "obloot_quest_a2t3_bazaar_container", s_bazaar.origin, s_bazaar.angles, undefined, 1, 1, 1 );
    interact = scripts\cp_mp\interaction::function_32645103f7520635( var_a4871cdc42d9531b, &function_9dab7ca9c27dfb18 );
    interact.str_poi = "bazaar";
    interact setscriptablepartstate( "obloot_quest_a2t3_bazaar_container", "visible" );
    
    foreach ( player in level.players )
    {
        if ( getdvarint( @"hash_7b8b09c504a0c9a0", 0 ) && !istrue( player.var_7f15f872dea27203 ) )
        {
            interact enablescriptablepartplayeruse( interact.type, player );
        }
        else if ( !function_c7d3c1cb4a3958cf( player, 16655 ) )
        {
            interact disablescriptablepartplayeruse( interact.type, player );
        }
        else if ( istrue( player.var_7f15f872dea27203 ) )
        {
            interact disablescriptablepartplayeruse( interact.type, player );
        }
        
        player thread function_d8e6504221fc91c6( interact, 16655 );
    }
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x32c0
// Size: 0x15c
function private function_66be43782ac9255e()
{
    var_f23a4a1705f1a6dc = getstruct( "quest_a2t3_essence_retail", "targetname" );
    var_d9c350b9933516d3 = function_38e113a4c30f6c0d( "obloot_quest_a2t3_retail_container", var_f23a4a1705f1a6dc.origin, var_f23a4a1705f1a6dc.angles, undefined, 1, 1, 1 );
    interact = scripts\cp_mp\interaction::function_32645103f7520635( var_d9c350b9933516d3, &function_e81f6a73b0d66d0 );
    interact.str_poi = "retail";
    interact setscriptablepartstate( "obloot_quest_a2t3_retail_container", "visible" );
    
    foreach ( player in level.players )
    {
        if ( getdvarint( @"hash_7b8b09c504a0c9a0", 0 ) && !istrue( player.var_f21eaf07ce1d28cb ) )
        {
            interact enablescriptablepartplayeruse( interact.type, player );
        }
        else if ( !function_c7d3c1cb4a3958cf( player, 16655 ) )
        {
            interact disablescriptablepartplayeruse( interact.type, player );
        }
        else if ( istrue( player.var_f21eaf07ce1d28cb ) )
        {
            interact disablescriptablepartplayeruse( interact.type, player );
        }
        
        player thread function_d8e6504221fc91c6( interact, 16655 );
    }
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3424
// Size: 0x15c
function private function_48f5535dced65762()
{
    s_shops = getstruct( "quest_a2t3_essence_shops", "targetname" );
    var_cbe0ad7315f99ee1 = function_38e113a4c30f6c0d( "obloot_quest_a2t3_shops_container", s_shops.origin, s_shops.angles, undefined, 1, 1, 1 );
    interact = scripts\cp_mp\interaction::function_32645103f7520635( var_cbe0ad7315f99ee1, &function_4224be92f5fc92be );
    interact.str_poi = "shops";
    interact setscriptablepartstate( "obloot_quest_a2t3_shops_container", "visible" );
    
    foreach ( player in level.players )
    {
        if ( getdvarint( @"hash_7b8b09c504a0c9a0", 0 ) && !istrue( player.var_329019ddf92d6969 ) )
        {
            interact enablescriptablepartplayeruse( interact.type, player );
        }
        else if ( !function_c7d3c1cb4a3958cf( player, 16655 ) )
        {
            interact disablescriptablepartplayeruse( interact.type, player );
        }
        else if ( istrue( player.var_329019ddf92d6969 ) )
        {
            interact disablescriptablepartplayeruse( interact.type, player );
        }
        
        player thread function_d8e6504221fc91c6( interact, 16655 );
    }
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 2
// Checksum 0x0, Offset: 0x3588
// Size: 0x92
function function_d8e6504221fc91c6( container, missionid )
{
    self endon( "death_or_disconnect" );
    
    while ( true )
    {
        self waittill( "mission_completed" );
        wait 5;
        
        if ( function_c7d3c1cb4a3958cf( self, missionid ) || getdvarint( @"hash_7b8b09c504a0c9a0", 0 ) )
        {
            container enablescriptablepartplayeruse( container.type, self );
        }
        
        wait 5;
        
        if ( function_c7d3c1cb4a3958cf( self, missionid ) || getdvarint( @"hash_7b8b09c504a0c9a0", 0 ) )
        {
            container enablescriptablepartplayeruse( container.type, self );
        }
    }
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 0
// Checksum 0x0, Offset: 0x3622
// Size: 0x26
function function_5233ec7f3a4cfa23()
{
    level flag_wait( "ob_infil_completed" );
    function_bebd651e6464d232();
    waitframe();
    function_66be43782ac9255e();
    waitframe();
    function_48f5535dced65762();
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3650
// Size: 0x38
function private function_9dab7ca9c27dfb18( player )
{
    player.var_7f15f872dea27203 = 1;
    self disablescriptablepartplayeruse( self.type, player );
    level thread function_442e8b1568008551( "bazaar" );
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3690
// Size: 0x38
function private function_e81f6a73b0d66d0( player )
{
    player.var_f21eaf07ce1d28cb = 1;
    self disablescriptablepartplayeruse( self.type, player );
    level thread function_442e8b1568008551( "retail" );
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x36d0
// Size: 0x38
function private function_4224be92f5fc92be( player )
{
    player.var_329019ddf92d6969 = 1;
    self disablescriptablepartplayeruse( self.type, player );
    level thread function_442e8b1568008551( "shops" );
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3710
// Size: 0x6c
function private function_442e8b1568008551( poi_location )
{
    level endon( "game_ended" );
    
    switch ( poi_location )
    {
        case #"hash_ddc6dedfe833e70e":
            function_bebd651e6464d232();
            break;
        case #"hash_1c8aec9a2f0ee502":
            function_66be43782ac9255e();
            break;
        case #"hash_1f59933efce7a50e":
            function_48f5535dced65762();
            break;
        default:
            break;
    }
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3784
// Size: 0x14d
function private function_e23b5eafc9d0c7bf( params )
{
    player = params.player;
    var_1b68ba89f80f2b5c = params.var_1b68ba89f80f2b5c;
    
    if ( namespace_838b439602b3acc7::function_5acc35fc66331385( player, 17078 ) || getdvarint( @"hash_7b8b09c504a0c9a0", 0 ) )
    {
        v_pos = getclosestpointonnavmesh( var_1b68ba89f80f2b5c );
        item_tablet = undefined;
        
        while ( !isdefined( item_tablet ) )
        {
            item_tablet = function_38e113a4c30f6c0d( "obloot_strauss_research_tablet", v_pos, ( 0, 0, 0 ), 0, 1, 1, 1 );
            waitframe();
        }
        
        wait 0.5;
        
        if ( isdefined( item_tablet ) )
        {
            itembundle = getscriptbundle( "itemspawnentry:" + "ob_jup_item_act3_tier3_strauss_research_tablet" );
            lootid = function_6d15e119c2779a93( itembundle );
            squadmembers = player scripts\cp_mp\utility\squad_utility::getsquadmembers();
            
            foreach ( member in squadmembers )
            {
                member scripts\cp_mp\calloutmarkerping::calloutmarkerping_createcallout( 14, item_tablet.origin, item_tablet.index, lootid );
            }
        }
    }
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 0
// Checksum 0x0, Offset: 0x38d9
// Size: 0x4, Type: bool
function function_f3782faa5666a45c()
{
    return true;
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 0
// Checksum 0x0, Offset: 0x38e6
// Size: 0x4, Type: bool
function function_bfe3066e432b33e()
{
    return true;
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 1
// Checksum 0x0, Offset: 0x38f3
// Size: 0x8e, Type: bool
function function_b978f5e2753317a4( challengeid )
{
    if ( !isdefined( challengeid ) )
    {
        return false;
    }
    
    if ( isdefined( self ) && isdefined( self.var_6c29f2fdb0054bbe ) && self.var_6c29f2fdb0054bbe.size )
    {
        foreach ( player in self.var_6c29f2fdb0054bbe )
        {
            if ( scripts\mp\pmc_missions::function_c7d3c1cb4a3958cf( player, challengeid ) )
            {
                return true;
            }
        }
    }
    
    return false;
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 1
// Checksum 0x0, Offset: 0x398a
// Size: 0xd, Type: bool
function function_7ee98f5b4994fad8( mission )
{
    return true;
}

// Namespace namespace_5c6deef041b03f11 / namespace_948fdc1b77d1dc95
// Params 1
// Checksum 0x0, Offset: 0x39a0
// Size: 0xd, Type: bool
function function_70b80e541c8ef42( mission )
{
    return true;
}

