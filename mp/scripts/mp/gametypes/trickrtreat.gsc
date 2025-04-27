#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\cp_mp\armor;
#using scripts\cp_mp\challenges;
#using scripts\cp_mp\playerachievements;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\weapon;
#using scripts\engine\utility;
#using scripts\mp\gametypes\countdown;
#using scripts\mp\utility\game;
#using scripts\mp\utility\player;
#using scripts\mp\utility\stats;

#namespace trickrtreat;

// Namespace trickrtreat / scripts\mp\gametypes\trickrtreat
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28a
// Size: 0x159
function init()
{
    level.lootitems = [];
    SetDvars();
    level.var_82b5ecc31717c4d4 = getdvarint( @"hash_fba804ece774767a", 0 ) == 1;
    level.conf_fx[ "vanish" ] = loadfx( "vfx/core/impacts/small_snowhit" );
    level.var_78a0087bea386662 = spawnstruct();
    level.var_78a0087bea386662.var_d04b4a9729479cad = &function_d04b4a9729479cad;
    level.var_78a0087bea386662.var_c80fb54710c9e5aa = &function_c80fb54710c9e5aa;
    level.var_78a0087bea386662.var_e807776b16dce7d4 = &get_reward;
    level.var_78a0087bea386662.var_d70ec56158c8530b = &function_fba8eb934ad3b08b;
    level.var_78a0087bea386662.onuse = &on_use;
    level.var_78a0087bea386662.var_35ad50d0a725c013 = &get_payload;
    utility::registersharedfunc( "game", "trickrtreatAchievementStateFetched", &function_695f31c017a09ce5 );
    level callback::add( "player_connect", &onplayerconnect );
    level callback::add( "player_disconnect", &onplayerdisconnect );
    thread function_899920a5f5f76a4b();
    
    if ( getdvarint( @"hash_5f60d5026cd2c8b0" ) == 1 )
    {
        thread function_92e1ac992073f2dd();
    }
    
    function_ea4aaa2f9aad1dbc( 45976, 1000000 );
}

// Namespace trickrtreat / scripts\mp\gametypes\trickrtreat
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3eb
// Size: 0xb4
function SetDvars()
{
    setdvarifuninitialized( @"hash_e44c66b854aeeebb", 0 );
    setdvarifuninitialized( @"hash_8d2054eb767885c0", 0.333333 );
    setdvarifuninitialized( @"hash_db7a7896756f4c35", 0.333333 );
    setdvarifuninitialized( @"hash_7d79b068a44a9c12", 0.333333 );
    setdvarifuninitialized( @"hash_6326b90bd33eec6f", 1 );
    setdvarifuninitialized( @"hash_5f60d5026cd2c8b0", 1 );
    setdvarifuninitialized( @"hash_51facc094fa68ceb", 1 );
    setdvarifuninitialized( @"hash_e81b83bf110b7c8d", 200 );
    setdvarifuninitialized( @"hash_4f63ef44f4328c06", 50 );
    setdvarifuninitialized( @"hash_4c87c583ae49e672", 150 );
}

// Namespace trickrtreat / scripts\mp\gametypes\trickrtreat
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a7
// Size: 0x7
function function_d04b4a9729479cad()
{
    return "trickrtreat_loot";
}

// Namespace trickrtreat / scripts\mp\gametypes\trickrtreat
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b7
// Size: 0x75
function get_reward()
{
    values = [ 1, 2, 3 ];
    weights = [ getdvarfloat( @"hash_8d2054eb767885c0" ), getdvarfloat( @"hash_db7a7896756f4c35" ), getdvarfloat( @"hash_7d79b068a44a9c12" ) ];
    reward = weighted_array_randomize( values, weights );
    return reward;
}

// Namespace trickrtreat / scripts\mp\gametypes\trickrtreat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x535
// Size: 0x23e
function function_fba8eb934ad3b08b( reward )
{
    if ( isdefined( reward ) )
    {
        switch ( reward )
        {
            case 1:
                var_57f7615bfae4f666 = hashcat( @"hash_75fdea4f42f7cf36", getbasegametype(), "_reward_1_amount" );
                var_d7d1886440562afd = getdvarint( var_57f7615bfae4f666, 18 );
                
                if ( !isdefined( level.var_509a4e442b1026ae ) )
                {
                    level.var_509a4e442b1026ae = 0;
                }
                
                if ( !isdefined( level.var_3d9321fad7de61fc ) )
                {
                    level.var_3d9321fad7de61fc = 0;
                }
                
                level.var_509a4e442b1026ae += 1;
                level.var_3d9321fad7de61fc += var_d7d1886440562afd;
                break;
            case 2:
                var_57f7615bfae4f666 = hashcat( @"hash_75fdea4f42f7cf36", getbasegametype(), "_reward_2_amount" );
                var_d7d1886440562afd = getdvarint( var_57f7615bfae4f666, 35 );
                
                if ( !isdefined( level.var_ef645306c7d37997 ) )
                {
                    level.var_ef645306c7d37997 = 0;
                }
                
                if ( !isdefined( level.var_a57db3076bd3b939 ) )
                {
                    level.var_a57db3076bd3b939 = 0;
                }
                
                level.var_ef645306c7d37997 += 1;
                level.var_a57db3076bd3b939 += var_d7d1886440562afd;
                break;
            case 3:
                var_57f7615bfae4f666 = hashcat( @"hash_75fdea4f42f7cf36", getbasegametype(), "_reward_3_amount" );
                var_d7d1886440562afd = getdvarint( var_57f7615bfae4f666, 70 );
                
                if ( !isdefined( level.var_f32504269cbbbe30 ) )
                {
                    level.var_f32504269cbbbe30 = 0;
                }
                
                if ( !isdefined( level.var_4870c7ef3543bfe ) )
                {
                    level.var_4870c7ef3543bfe = 0;
                }
                
                level.var_f32504269cbbbe30 += 1;
                level.var_4870c7ef3543bfe += var_d7d1886440562afd;
                break;
            default:
                var_d7d1886440562afd = 35;
                
                if ( !isdefined( level.var_ec8144a5f732f17d ) )
                {
                    level.var_ec8144a5f732f17d = 0;
                }
                
                if ( !isdefined( level.var_e4ccbbc61262c427 ) )
                {
                    level.var_e4ccbbc61262c427 = 0;
                }
                
                level.var_ec8144a5f732f17d += 1;
                level.var_e4ccbbc61262c427 += var_d7d1886440562afd;
                break;
        }
        
        return var_d7d1886440562afd;
    }
    
    return 35;
}

// Namespace trickrtreat / scripts\mp\gametypes\trickrtreat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x77b
// Size: 0x400
function on_use( player )
{
    if ( isdefined( player.owner ) )
    {
        player = player.owner;
    }
    
    switch ( self.reward )
    {
        case 1:
            if ( !isdefined( player.var_ee9bfea6c204ee1b ) )
            {
                player.var_ee9bfea6c204ee1b = 0;
            }
            
            if ( !isdefined( player.var_bc629c5fff0af845 ) )
            {
                player.var_bc629c5fff0af845 = 0;
            }
            
            player.var_ee9bfea6c204ee1b += 1;
            player.var_bc629c5fff0af845 += self.rewardcount;
            
            if ( !isdefined( level.var_ee9bfea6c204ee1b ) )
            {
                level.var_ee9bfea6c204ee1b = 0;
            }
            
            if ( !isdefined( level.var_bc629c5fff0af845 ) )
            {
                level.var_bc629c5fff0af845 = 0;
            }
            
            level.var_ee9bfea6c204ee1b += 1;
            level.var_bc629c5fff0af845 += self.rewardcount;
            break;
        case 2:
            if ( !isdefined( player.var_35f93f47b6c8e7d6 ) )
            {
                player.var_35f93f47b6c8e7d6 = 0;
            }
            
            if ( !isdefined( player.var_64479d98631b7f44 ) )
            {
                player.var_64479d98631b7f44 = 0;
            }
            
            player.var_35f93f47b6c8e7d6 += 1;
            player.var_64479d98631b7f44 += self.rewardcount;
            
            if ( !isdefined( level.var_35f93f47b6c8e7d6 ) )
            {
                level.var_35f93f47b6c8e7d6 = 0;
            }
            
            if ( !isdefined( level.var_64479d98631b7f44 ) )
            {
                level.var_64479d98631b7f44 = 0;
            }
            
            level.var_35f93f47b6c8e7d6 += 1;
            level.var_64479d98631b7f44 += self.rewardcount;
            break;
        case 3:
            if ( !isdefined( player.var_de86cab269eaee61 ) )
            {
                player.var_de86cab269eaee61 = 0;
            }
            
            if ( !isdefined( player.var_ea4ec8e5a8b097ab ) )
            {
                player.var_ea4ec8e5a8b097ab = 0;
            }
            
            player.var_de86cab269eaee61 += 1;
            player.var_ea4ec8e5a8b097ab += self.rewardcount;
            
            if ( !isdefined( level.var_de86cab269eaee61 ) )
            {
                level.var_de86cab269eaee61 = 0;
            }
            
            if ( !isdefined( level.var_ea4ec8e5a8b097ab ) )
            {
                level.var_ea4ec8e5a8b097ab = 0;
            }
            
            level.var_de86cab269eaee61 += 1;
            level.var_ea4ec8e5a8b097ab += self.rewardcount;
            break;
        default:
            if ( !isdefined( player.var_bdb2fe85c37c51c0 ) )
            {
                player.var_bdb2fe85c37c51c0 = 0;
            }
            
            if ( !isdefined( player.var_b812d573a696f26 ) )
            {
                player.var_b812d573a696f26 = 0;
            }
            
            player.var_bdb2fe85c37c51c0 += 1;
            player.var_b812d573a696f26 += self.rewardcount;
            
            if ( !isdefined( level.var_bdb2fe85c37c51c0 ) )
            {
                level.var_bdb2fe85c37c51c0 = 0;
            }
            
            if ( !isdefined( level.var_b812d573a696f26 ) )
            {
                level.var_b812d573a696f26 = 0;
            }
            
            level.var_bdb2fe85c37c51c0 += 1;
            level.var_b812d573a696f26 += self.rewardcount;
            break;
    }
    
    player scripts\cp_mp\challenges::function_8359cadd253f9604( player, "event_trt_candy", self.rewardcount );
    player function_77f5f08a39a2d9f8( self.reward, self.rewardcount );
    thread function_4ebd84f3e771db5( self.guid, undefined, player );
}

// Namespace trickrtreat / scripts\mp\gametypes\trickrtreat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb83
// Size: 0x6e
function function_c80fb54710c9e5aa( reward )
{
    scriptablename = [[ level.var_78a0087bea386662.var_d04b4a9729479cad ]]();
    
    if ( reward == 1 )
    {
        self setscriptablepartstate( scriptablename, "small" );
        return;
    }
    
    if ( reward == 2 )
    {
        self setscriptablepartstate( scriptablename, "medium" );
        return;
    }
    
    if ( reward == 3 )
    {
        self setscriptablepartstate( scriptablename, "large" );
    }
}

// Namespace trickrtreat / scripts\mp\gametypes\trickrtreat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbf9
// Size: 0x30
function get_payload( player )
{
    payload = [ #"teamselect", player getentitynumber() ];
    return payload;
}

// Namespace trickrtreat / scripts\mp\gametypes\trickrtreat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc32
// Size: 0xa7
function playerstancechanged( newstance )
{
    curtime = gettime();
    
    if ( newstance == "crouch" )
    {
        if ( isdefined( self.lastkillvictimpos ) )
        {
            if ( distancesquared( self.lastkillvictimpos, self.origin ) < 40000 )
            {
                timesincelastcrouch = curtime - self.laststancetimes[ "crouch" ];
                
                if ( timesincelastcrouch < 750 )
                {
                    if ( !isdefined( self.lastteabagtime ) || curtime - self.lastteabagtime > 5000 )
                    {
                        thread function_89d89d2cbde23371();
                    }
                    
                    self.lastteabagtime = curtime;
                }
            }
        }
    }
}

// Namespace trickrtreat / scripts\mp\gametypes\trickrtreat
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xce1
// Size: 0x79
function function_89d89d2cbde23371()
{
    self playcinematicforplayer( "bp_haunting_jumpscare_1" );
    
    if ( scripts\cp_mp\utility\game_utility::isbrstylegametype() )
    {
        if ( scripts\cp_mp\armor::hasarmor() )
        {
            scripts\cp_mp\armor::damagearmor( getdvarfloat( @"hash_4c87c583ae49e672" ) );
        }
        else
        {
            self dodamage( getdvarfloat( @"hash_4f63ef44f4328c06" ), self.origin, self );
        }
        
        return;
    }
    
    self dodamage( getdvarfloat( @"hash_4f63ef44f4328c06" ), self.origin, self );
}

// Namespace trickrtreat / scripts\mp\gametypes\trickrtreat
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd62
// Size: 0xf1
function function_92e1ac992073f2dd()
{
    level endon( "game_ended" );
    
    while ( !isdefined( level.struct_class_names ) )
    {
        waitframe();
    }
    
    level.var_29ac6b93266dfc1a = [];
    var_29ac6b93266dfc1a = getstructarray( "jackolantern", "script_noteworthy" );
    
    foreach ( jackolantern in var_29ac6b93266dfc1a )
    {
        model = spawn_model( "jup_food_halloween_jackolantern_01", jackolantern.origin, jackolantern.angles );
        model.enabled = 1;
        level.var_29ac6b93266dfc1a = array_add( level.var_29ac6b93266dfc1a, model );
        
        if ( getdvarint( @"hash_51facc094fa68ceb" ) == 1 )
        {
            model thread function_58265930964b758e();
        }
    }
}

// Namespace trickrtreat / scripts\mp\gametypes\trickrtreat
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe5b
// Size: 0x123
function function_58265930964b758e()
{
    level endon( "game_ended" );
    self.health = getdvarint( @"hash_e81b83bf110b7c8d" );
    self setcandamage( 1 );
    self setcanradiusdamage( 1 );
    
    while ( isdefined( self ) )
    {
        self waittill( "damage", damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, objweapon, origin, angles, normal, inflictor );
        
        if ( scripts\cp_mp\weapon::iskillstreakweapon( objweapon ) )
        {
            self.health += damage;
            continue;
        }
        
        if ( self.health <= 0 )
        {
            attacker thread function_89d89d2cbde23371();
            self hide();
            self.enabled = 0;
            function_68193adc1593a0e( self );
        }
    }
}

// Namespace trickrtreat / scripts\mp\gametypes\trickrtreat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf86
// Size: 0x9e
function function_68193adc1593a0e( var_9b43d82978786687 )
{
    foreach ( jackolantern in level.var_29ac6b93266dfc1a )
    {
        if ( jackolantern.enabled == 0 && jackolantern != var_9b43d82978786687 )
        {
            jackolantern show();
            jackolantern.enabled = 1;
            jackolantern.health = getdvarint( @"hash_e81b83bf110b7c8d" );
            return;
        }
    }
}

// Namespace trickrtreat / scripts\mp\gametypes\trickrtreat
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x102c
// Size: 0x71
function onplayerconnect( params )
{
    if ( !matchmakinggame() )
    {
        thread function_539593ba238cc26c();
    }
    
    foreach ( achievementid, struct in level.var_cb71fe1ecc4006b5 )
    {
        scripts\cp_mp\playerachievements::getstate( self, achievementid );
    }
}

// Namespace trickrtreat / scripts\mp\gametypes\trickrtreat
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10a5
// Size: 0x7b
function function_ea4aaa2f9aad1dbc( achievementid, var_7ab6dba5e9adbffb )
{
    if ( !isdefined( level.var_cb71fe1ecc4006b5 ) )
    {
        level.var_cb71fe1ecc4006b5 = [];
    }
    
    if ( !isdefined( level.var_cb71fe1ecc4006b5[ achievementid ] ) )
    {
        level.var_cb71fe1ecc4006b5[ achievementid ] = spawnstruct();
    }
    
    struct = level.var_cb71fe1ecc4006b5[ achievementid ];
    struct.achievementid = achievementid;
    struct.var_7ab6dba5e9adbffb = var_7ab6dba5e9adbffb;
}

// Namespace trickrtreat / scripts\mp\gametypes\trickrtreat
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1128
// Size: 0x5d
function function_539593ba238cc26c()
{
    self endon( "disconnect" );
    
    if ( getdvarint( @"hash_e44c66b854aeeebb", 0 ) == 1 )
    {
        [ achievementid, progressdata ] = function_5ba9e679fe13fe5e( 45976, 1000000 );
        function_695f31c017a09ce5( achievementid, progressdata );
    }
}

// Namespace trickrtreat / scripts\mp\gametypes\trickrtreat
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x118d
// Size: 0x8b
function function_5ba9e679fe13fe5e( achievementid, var_51c6029a1deceecf )
{
    progressdata = spawnstruct();
    progressdata.progress_values = [];
    progressdata.progress_values[ 0 ] = spawnstruct();
    progressdata.progress_values[ 0 ].progress_id = scripts\cp_mp\playerachievements::function_691880160b33d133( "progress" );
    progressdata.progress_values[ 0 ].progress = var_51c6029a1deceecf;
    return [ achievementid, progressdata ];
}

// Namespace trickrtreat / scripts\mp\gametypes\trickrtreat
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1221
// Size: 0xd4
function function_695f31c017a09ce5( achievementid, progressdata )
{
    if ( !isdefined( level.var_cb71fe1ecc4006b5[ achievementid ] ) )
    {
        return;
    }
    
    var_cb821ca45b880504 = scripts\cp_mp\playerachievements::function_691880160b33d133( "progress" );
    progress = 0;
    
    for (index = 0; index < progressdata.progress_values.size; index++) {
        progress_id = progressdata.progress_values[ index ].progress_id;
        
        if ( is_equal( var_cb821ca45b880504, progress_id ) )
        {
            progress = progressdata.progress_values[ index ].progress;
            break;
        }
    }
    
    if ( progress >= level.var_cb71fe1ecc4006b5[ achievementid ].var_7ab6dba5e9adbffb )
    {
        self.var_7affdedf6874a6b = 1;
    }
}

