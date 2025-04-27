#using script_7f36f22bad523244;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\damagefeedback;
#using scripts\cp_mp\utility\game_utility;
#using scripts\engine\scriptable;
#using scripts\engine\utility;
#using scripts\mp\equipment;
#using scripts\mp\gametypes\br_public;
#using scripts\mp\gametypes\force_field;
#using scripts\mp\hud_message;
#using scripts\mp\supers;
#using scripts\mp\utility\trigger;

#namespace mutation_shield;

// Namespace mutation_shield / namespace_70f55ec9ba5b3e64
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x586
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"mutation_shield", #"mutation", undefined, &function_d010653789d638e0 );
}

// Namespace mutation_shield / namespace_70f55ec9ba5b3e64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5af
// Size: 0x122
function function_d010653789d638e0()
{
    if ( !istrue( level.var_39faa7e60a6a717c ) || getdvarint( @"hash_435213878b4caa09", 1 ) == 0 )
    {
        return;
    }
    
    rechargetime = getdvarint( @"hash_dd9f45b423a49aa6", 40 );
    function_c5030224f9fb72f6( "equip_mutation_shield", "equip_mutation_give_shield", rechargetime, &function_4b3a8e81d4a07ffc );
    level.equipment.callbacks[ "equip_mutation_shield" ][ "onFired" ] = &shield_onuse;
    level.equipment.callbacks[ "equip_mutation_shield" ][ "onGive" ] = &function_cd9adddb8d4ff4b9;
    level.equipment.callbacks[ "equip_mutation_shield" ][ "onTake" ] = &function_39fb6cfef5d3b47a;
    scripts\engine\scriptable::scriptable_adddamagedcallback( &function_774a2c15e69350e4 );
    level.var_d57cae4a13c11233 = default_to( level.var_d57cae4a13c11233, [] );
    level.var_d57cae4a13c11233[ level.var_d57cae4a13c11233.size ] = "equip_mutation_shield";
    level.var_d57cae4a13c11233[ level.var_d57cae4a13c11233.size ] = "equip_mutation_give_shield";
}

// Namespace mutation_shield / namespace_70f55ec9ba5b3e64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6d9
// Size: 0x25
function function_f705d78f8780628d()
{
    if ( getdvarint( @"hash_4b664c074a868ac5", 0 ) == 1 )
    {
        setomnvar( "ui_arcade_forcefield_timer_total", 1600 );
    }
}

// Namespace mutation_shield / namespace_70f55ec9ba5b3e64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x706
// Size: 0x13
function function_4b3a8e81d4a07ffc()
{
    equipment::giveequipment( "equip_mutation_shield", "secondary" );
}

// Namespace mutation_shield / namespace_70f55ec9ba5b3e64
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x721
// Size: 0x4b
function function_cd9adddb8d4ff4b9( ref, slot, variantid )
{
    function_308f48ed405d1347();
    thread function_4f33e107ea6d27e2();
    
    if ( scripts\cp_mp\utility\game_utility::isbrstylegametype() )
    {
        function_ac1d7cccc34673ad( "secondary" );
        scripts\mp\hud_message::showsplash( "br_mutations_bubbleshield" );
    }
}

// Namespace mutation_shield / namespace_70f55ec9ba5b3e64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x774
// Size: 0x141
function function_308f48ed405d1347()
{
    data = spawnstruct();
    data.var_5e72947c193e5954 = getdvarint( @"hash_b53a897ed49ab701", 0 );
    data.var_c1f17036e06696b1 = getdvarint( @"hash_36ea71c83923b505", 1 );
    var_fa1ab29bf6705c71 = getdvarint( @"hash_bc705dcfc1f6e513", 1500 );
    data.var_1c6560ee7e2ff64a = var_fa1ab29bf6705c71 * var_fa1ab29bf6705c71;
    data.allowactions = getdvarint( @"hash_9534351f5f1a3237", 1 );
    data.var_685e45a9d6518e9 = getdvarint( @"hash_844b3f16404bcead", 0 );
    data.var_42ad0fcbadd4178c = getdvarint( @"hash_83dc8f89aa29fff", 30 );
    data.health = getdvarint( @"hash_e414deda6e7cb6a4", 1600 );
    data.var_703013f3bf400912 = getdvarint( @"hash_31aaebacad945c59", 0 );
    data.var_749b12fbe9926806 = getdvarfloat( @"hash_b7687673cb8463ff", 1 );
    data.var_2148987e7407ac96 = getdvarint( @"hash_a693b3ff14ab828d", 1 );
    self.var_c0520e995eb8892b = data;
}

// Namespace mutation_shield / namespace_70f55ec9ba5b3e64
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8bd
// Size: 0x23
function function_39fb6cfef5d3b47a( ref, slot, variantid )
{
    self notify( "mutation_shield_unobtained" );
}

// Namespace mutation_shield / namespace_70f55ec9ba5b3e64
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8e8
// Size: 0x183
function shield_onuse( equipmentref, slot, objweapon )
{
    data = self.var_c0520e995eb8892b;
    
    if ( data.var_703013f3bf400912 )
    {
        thread function_7292705688dce8eb( data.var_749b12fbe9926806 );
    }
    else if ( isdefined( data.var_53c5195bccb1f90b ) )
    {
        self notify( "mutation_shield_overridden" );
        waittillframeend();
    }
    
    function_f9b43f1eb48e7fca( 1 );
    function_7fd5e025bde6cbe7();
    self notify( "shield_deployed" );
    
    if ( isdefined( self.var_c0520e995eb8892b.trigger ) )
    {
        thread function_ca21df37de28e2fd();
        thread function_2ed82d9c826869d5();
    }
    
    function_1ce88a7adf3083e6( #"mutationbubbleshield" );
    
    if ( data.var_c1f17036e06696b1 )
    {
        thread function_e38ab1b44b09fe40( data );
    }
    
    if ( data.var_685e45a9d6518e9 )
    {
        waittill_any_in_array_or_timeout( [ "mutation_shield_broken", "mutation_shield_cancelled", "mutation_shield_unobtained", "mutation_shield_overridden", "mutation_shield_player_too_far", "last_stand_start", "death_or_disconnect" ], data.var_42ad0fcbadd4178c );
    }
    else
    {
        function_5adca43f839a3cce( [ "mutation_shield_broken", "mutation_shield_cancelled", "mutation_shield_unobtained", "mutation_shield_overridden", "mutation_shield_player_too_far", "last_stand_start", "death_or_disconnect" ] );
    }
    
    function_e85be9e36f8d7074();
}

// Namespace mutation_shield / namespace_70f55ec9ba5b3e64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa73
// Size: 0xad
function function_ca21df37de28e2fd()
{
    self endon( "death_or_disconnect" );
    self endon( "mutation_shield_use_ended" );
    
    while ( true )
    {
        self.var_c0520e995eb8892b.trigger waittill( "trigger_enter", player );
        
        if ( isdefined( player ) )
        {
            if ( istrue( self.var_c0520e995eb8892b.touching == 0 ) )
            {
                player playsoundonmovingent( "br_mutation_shield_enter" );
                self.var_c0520e995eb8892b.touching = 1;
            }
            
            player setsoundsubmix( "jup_br_mutation_shield", 1 );
            thread function_d7cd3062f426a6a1( player );
            wait 1;
            self.var_c0520e995eb8892b.touching = 0;
        }
    }
}

// Namespace mutation_shield / namespace_70f55ec9ba5b3e64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb28
// Size: 0xaf
function function_2ed82d9c826869d5()
{
    self endon( "death_or_disconnect" );
    self endon( "mutation_shield_use_ended" );
    
    while ( true )
    {
        self.var_c0520e995eb8892b.trigger waittill( "trigger_exit", player );
        
        if ( isdefined( player ) )
        {
            if ( istrue( self.var_c0520e995eb8892b.touching == 0 ) )
            {
                player playsoundonmovingent( "br_mutation_shield_exit" );
                self.var_c0520e995eb8892b.touching = 1;
            }
            
            player clearsoundsubmix( "jup_br_mutation_shield", 0.5 );
            player notify( "jup_shield_submix_clear" );
            wait 1;
            self.var_c0520e995eb8892b.touching = 0;
        }
    }
}

// Namespace mutation_shield / namespace_70f55ec9ba5b3e64
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbdf
// Size: 0xf5
function function_d7cd3062f426a6a1( player )
{
    player endon( "disconnect" );
    player endon( "jup_shield_submix_clear" );
    
    if ( self.var_c0520e995eb8892b.var_685e45a9d6518e9 )
    {
        waittill_any_in_array_or_timeout( [ "mutation_shield_broken", "mutation_shield_cancelled", "mutation_shield_unobtained", "mutation_shield_overridden", "mutation_shield_player_too_far", "last_stand_start", "death_or_disconnect" ], self.var_c0520e995eb8892b.var_42ad0fcbadd4178c );
        player clearsoundsubmix( "jup_br_mutation_shield", 0.5 );
        return;
    }
    
    function_5adca43f839a3cce( [ "mutation_shield_broken", "mutation_shield_cancelled", "mutation_shield_unobtained", "mutation_shield_overridden", "mutation_shield_player_too_far", "last_stand_start", "death_or_disconnect" ] );
    player clearsoundsubmix( "jup_br_mutation_shield", 0.5 );
}

// Namespace mutation_shield / namespace_70f55ec9ba5b3e64
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcdc
// Size: 0x5a
function function_e38ab1b44b09fe40( data )
{
    self endon( "mutation_shield_use_ended" );
    
    while ( true )
    {
        if ( distance2dsquared( self.origin, data.var_53c5195bccb1f90b.origin ) > data.var_1c6560ee7e2ff64a )
        {
            self notify( "mutation_shield_player_too_far" );
            break;
        }
        
        wait 3;
    }
}

// Namespace mutation_shield / namespace_70f55ec9ba5b3e64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd3e
// Size: 0x10e
function function_e85be9e36f8d7074()
{
    assert( isdefined( self.var_c0520e995eb8892b ), "<dev string:x1c>" );
    function_f9b43f1eb48e7fca( 0 );
    thread function_6e455baeba9b0da5( self.var_c0520e995eb8892b.var_53c5195bccb1f90b );
    
    if ( !scripts\cp_mp\utility\game_utility::isbrstylegametype() && getdvarint( @"hash_4b664c074a868ac5", 0 ) == 1 )
    {
        var_4761aa3b265d25fd = function_f3bb4f4911a1beb2( "perk", "hasPerk", "specialty_tac_mask" );
        
        if ( var_4761aa3b265d25fd && !istrue( self.var_c0520e995eb8892b.var_186108bccdd855ac ) )
        {
            function_f3bb4f4911a1beb2( "perk", "removePerk", "specialty_tac_mask" );
        }
        
        self.var_c0520e995eb8892b.var_186108bccdd855ac = undefined;
    }
    
    if ( isdefined( self.var_c0520e995eb8892b.trigger ) )
    {
        self.var_c0520e995eb8892b.trigger delete();
    }
    
    self.var_c0520e995eb8892b.var_53c5195bccb1f90b = undefined;
    self notify( "mutation_shield_use_ended" );
}

// Namespace mutation_shield / namespace_70f55ec9ba5b3e64
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe54
// Size: 0x26
function function_6e455baeba9b0da5( var_53c5195bccb1f90b )
{
    var_53c5195bccb1f90b setscriptablepartstate( "shield_base", "shield_destroyed" );
    wait 5;
    var_53c5195bccb1f90b freescriptable();
}

// Namespace mutation_shield / namespace_70f55ec9ba5b3e64
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe82
// Size: 0x3c
function function_7292705688dce8eb( var_66df87368f1b3634 )
{
    level endon( "game_ended" );
    self endon( "mutation_shield_use_ended" );
    self endon( "mutation_shield_unobtained" );
    wait var_66df87368f1b3634;
    
    while ( true )
    {
        waitframe();
        
        if ( self fragbuttonpressed() )
        {
            self notify( "mutation_shield_cancelled" );
        }
    }
}

// Namespace mutation_shield / namespace_70f55ec9ba5b3e64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xec6
// Size: 0x4f
function function_4f33e107ea6d27e2()
{
    self endon( "disconnect" );
    self endon( "mutation_shield_unobtained" );
    level endon( "game_ended" );
    
    while ( true )
    {
        if ( function_663227e408e37a78() )
        {
            val::reset( "mutation_shield_allow_use", "offhand_secondary_weapons" );
        }
        else
        {
            val::set( "mutation_shield_allow_use", "offhand_secondary_weapons", 0 );
        }
        
        waitframe();
    }
}

// Namespace mutation_shield / namespace_70f55ec9ba5b3e64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf1d
// Size: 0x5c, Type: bool
function function_663227e408e37a78()
{
    if ( !self isonground() )
    {
        return false;
    }
    
    if ( self isswimming() )
    {
        return false;
    }
    
    if ( self getstance() == "prone" )
    {
        return false;
    }
    
    if ( istrue( self.var_c0520e995eb8892b.var_703013f3bf400912 ) && isdefined( self.var_c0520e995eb8892b.var_53c5195bccb1f90b ) )
    {
        return false;
    }
    
    return true;
}

// Namespace mutation_shield / namespace_70f55ec9ba5b3e64
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf82
// Size: 0xe9
function function_f9b43f1eb48e7fca( shouldblock )
{
    if ( !self.var_c0520e995eb8892b.allowactions )
    {
        if ( shouldblock )
        {
            foreach ( action in [ "fire", "reload", "offhand_secondary_weapons", "offhand_primary_weapons", "supers", "ads", "prone", "allow_movement", "mantle", "allow_jump", "sprint" ] )
            {
                val::set( "mutation_shield", action, 0 );
            }
            
            return;
        }
        
        val::reset_all( "mutation_shield" );
    }
}

// Namespace mutation_shield / namespace_70f55ec9ba5b3e64
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1073
// Size: 0x2d
function function_5c3aab6c7e7025c( shield_anchor )
{
    waittill_any_3( "mutation_shield_broken", "death", "disconnected" );
    
    if ( isdefined( shield_anchor ) )
    {
        shield_anchor delete();
    }
}

// Namespace mutation_shield / namespace_70f55ec9ba5b3e64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10a8
// Size: 0x2e1
function function_7fd5e025bde6cbe7()
{
    data = self.var_c0520e995eb8892b;
    var_33c62722d1a9c0fb = self.origin;
    var_55fe158b04318983 = ( var_33c62722d1a9c0fb[ 0 ], var_33c62722d1a9c0fb[ 1 ], var_33c62722d1a9c0fb[ 2 ] + data.var_5e72947c193e5954 );
    
    if ( scripts\cp_mp\utility\game_utility::isbrstylegametype() )
    {
        shield = spawnscriptable( "mutation_shield_bubble", var_55fe158b04318983 );
    }
    else
    {
        shield = spawnscriptable( "mutation_shield_bubble_arcade", var_55fe158b04318983 );
        
        if ( self.team == "axis" || self.team == "allies" )
        {
            shield setscriptablepartstate( "shield_team", self.team );
        }
    }
    
    shield.connectedplayer = self;
    shield.maxhealth = clamp( data.health, 1, data.health );
    shield.health = data.health;
    shield.var_2148987e7407ac96 = data.var_2148987e7407ac96;
    data.var_53c5195bccb1f90b = shield;
    
    if ( scripts\cp_mp\utility\game_utility::isbrstylegametype() )
    {
        data.touching = 1;
        data.trigger = spawn( "noent_volume_trigger_radius", var_33c62722d1a9c0fb + ( 0, 0, data.var_5e72947c193e5954 ), 0, 95, 95 + data.var_5e72947c193e5954 );
        scripts\mp\utility\trigger::makeenterexittrigger( data.trigger );
        self setsoundsubmix( "jup_br_mutation_shield", 1 );
    }
    
    movingplatforment = self getmovingplatformparent();
    
    if ( !scripts\cp_mp\utility\game_utility::isbrstylegametype() && getdvarint( @"hash_4b664c074a868ac5", 0 ) == 1 )
    {
        shield_anchor = spawn( "script_model", self.origin );
        shield_anchor.angles = self.angles;
        shield_anchor linkto( self );
        localorigin = rotatevectorinverted( shield.origin - shield_anchor.origin, shield_anchor.angles );
        shield utility::function_6e506f39f121ea8a( shield_anchor, localorigin, shield.angles );
        thread function_5c3aab6c7e7025c( shield_anchor );
        
        if ( function_f3bb4f4911a1beb2( "perk", "hasPerk", "specialty_tac_mask" ) )
        {
            data.var_186108bccdd855ac = 1;
        }
        else
        {
            function_f3bb4f4911a1beb2( "perk", "givePerk", "specialty_tac_mask" );
        }
        
        return;
    }
    
    if ( isdefined( movingplatforment ) && !isdefined( shield.linkedparent ) )
    {
        localorigin = rotatevectorinverted( shield.origin - movingplatforment.origin, movingplatforment.angles );
        shield utility::function_6e506f39f121ea8a( movingplatforment, localorigin, shield.angles );
    }
}

// Namespace mutation_shield / namespace_70f55ec9ba5b3e64
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x1391
// Size: 0x2e4
function function_774a2c15e69350e4( einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname )
{
    if ( !isdefined( instance ) || !isdefined( instance.type ) || instance.type != "mutation_shield_bubble" && instance.type != "mutation_shield_bubble_arcade" )
    {
        return;
    }
    
    assert( isdefined( instance.health ) && isdefined( instance.connectedplayer ), "<dev string:x80>" );
    
    if ( !isenemyteam( instance.connectedplayer.team, eattacker.team ) )
    {
        return;
    }
    
    if ( isdefined( smeansofdeath ) && smeansofdeath == "MOD_EXPLOSIVE" )
    {
        var_26a5dcd3dec878c0 = getdvarfloat( @"hash_e6dc391984ae677", 1 );
        idamage *= var_26a5dcd3dec878c0;
    }
    
    if ( instance.connectedplayer == eattacker && objweapon.basename == "none" )
    {
        return;
    }
    
    if ( !scripts\cp_mp\utility\game_utility::isbrstylegametype() )
    {
        if ( istrue( instance.connectedplayer == einflictor ) && istrue( instance.connectedplayer.var_574a51d64266f7ef ) )
        {
            return;
        }
        
        victim = isdefined( instance.connectedplayer ) ? instance.connectedplayer : undefined;
        scripts\mp\gametypes\force_field::function_ebf9c5039dea6423( instance.health, instance.connectedplayer, eattacker, victim, idamage );
    }
    
    instance.health -= idamage;
    healthpercent = instance.health / instance.maxhealth;
    var_fadb80363ab99314 = instance getscriptablepartstate( "shield_base" );
    
    if ( var_fadb80363ab99314 == "shield_undamaged" && healthpercent <= 0.75 )
    {
        instance setscriptablepartstate( "shield_base", "shield_damaged_75" );
    }
    else if ( var_fadb80363ab99314 == "shield_damaged_75" && healthpercent <= 0.5 )
    {
        instance setscriptablepartstate( "shield_base", "shield_damaged_50" );
    }
    else if ( var_fadb80363ab99314 == "shield_damaged_50" && healthpercent <= 0.25 )
    {
        instance setscriptablepartstate( "shield_base", "shield_damaged_25" );
    }
    
    if ( instance.health <= 0 )
    {
        instance.connectedplayer notify( "mutation_shield_broken" );
    }
    
    if ( istrue( instance.var_2148987e7407ac96 ) && ( idflags & 8 ) == 0 )
    {
        eattacker updatedamagefeedback( "hitspawnprotect" );
    }
}

