#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp\damagefeedback;
#using scripts\cp\interaction;
#using scripts\cp\laststand;
#using scripts\cp\persistence;
#using scripts\cp\utility;
#using scripts\cp\utility\connect_event_aggregator;
#using scripts\cp_mp\armor;
#using scripts\cp_mp\challenges;
#using scripts\cp_mp\killstreaks\killstreakdeploy;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\cp_mp\vehicles\vehicle_occupancy;
#using scripts\engine\math;
#using scripts\engine\utility;

#namespace armor;

// Namespace armor / scripts\cp\armor
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c5
// Size: 0x1a
function init()
{
    scripts\cp\utility\connect_event_aggregator::registeronconnectcallback( &onplayerconnect_armor );
    
    /#
        level thread function_6e9ee0df5ab3c202();
    #/
}

// Namespace armor / scripts\cp\armor
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e7
// Size: 0x21
function onplayerconnect_armor()
{
    self.armorqueued = 0;
    self.var_4cb4a6ebd0885ffd = 150;
    self.armorhardened = 0;
}

// Namespace armor / scripts\cp\armor
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x510
// Size: 0x3f
function function_8ce284d6441202b8( buff_level )
{
    if ( buff_level == 0 )
    {
        self.var_4cb4a6ebd0885ffd = 150;
        return;
    }
    
    if ( buff_level == 1 )
    {
        self.var_4cb4a6ebd0885ffd = 200;
        return;
    }
    
    self.var_4cb4a6ebd0885ffd = 250;
}

// Namespace armor / scripts\cp\armor
// Params 14, eflags: 0x0
// Checksum 0x0, Offset: 0x557
// Size: 0xb3
function show_damage_direction( player, einflictor, attacker, damage_amount, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime, var_cb96f01f01795373, modelindex, partname )
{
    original_health = player.health;
    player finishplayerdamage( einflictor, attacker, 1, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime, var_cb96f01f01795373, modelindex, partname );
    player.health = original_health;
}

// Namespace armor / scripts\cp\armor
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x612
// Size: 0x4a
function function_ca71eb8be30f9e15( var_7aebecfc2ee6cf02 )
{
    full_armor = self.var_4cb4a6ebd0885ffd;
    armor_dvar = getdvarint( @"hash_e6924e7c0a5aad1f", 0 );
    
    if ( armor_dvar )
    {
        full_armor = armor_dvar;
    }
    
    self.armor = var_7aebecfc2ee6cf02;
}

// Namespace armor / scripts\cp\armor
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x664
// Size: 0x15
function function_62957c4b8e469641( var_7aebecfc2ee6cf02 )
{
    self.armor_health = var_7aebecfc2ee6cf02;
}

// Namespace armor / scripts\cp\armor
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x681
// Size: 0x25, Type: bool
function function_d249004b747bf5b4( perk_string )
{
    return isdefined( self.perk_data ) && isdefined( self.perk_data[ perk_string ] );
}

// Namespace armor / scripts\cp\armor
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6af
// Size: 0x16
function function_d92d499c7600838( perk_string )
{
    return self.perk_data[ perk_string ];
}

// Namespace armor / scripts\cp\armor
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6ce
// Size: 0x73
function function_47a88c4e1d36189a( damage_amount, attacker )
{
    damage_min = 1;
    var_47ba9b9f5dfef300 = 0;
    armor_dvar = getdvarint( @"hash_4a9f73175b3308e4", 0 );
    
    if ( armor_dvar )
    {
        var_47ba9b9f5dfef300 = 25;
    }
    
    damage_amount -= var_47ba9b9f5dfef300;
    var_19e04e90d1acc0c = function_3c53263a1ec58c23();
    damage_amount /= var_19e04e90d1acc0c;
    
    if ( damage_amount < damage_min )
    {
        damage_amount = damage_min;
    }
    
    return damage_amount;
}

// Namespace armor / scripts\cp\armor
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x74a
// Size: 0x104
function function_270c9d76e9075af8( damage_amount, attacker )
{
    var_9d6d671926fb4e4a = function_47a88c4e1d36189a( damage_amount, attacker );
    armor_amount = function_8e297d719d663b78();
    var_fb6f10d7080ed490 = min( armor_amount, var_9d6d671926fb4e4a );
    var_bab6dc781bcdf7e6 = int( var_9d6d671926fb4e4a - var_fb6f10d7080ed490 );
    var_7aebecfc2ee6cf02 = armor_amount - var_fb6f10d7080ed490;
    var_7aebecfc2ee6cf02 = max( var_7aebecfc2ee6cf02, 0 );
    
    if ( isplayer( self ) )
    {
        if ( isdefined( attacker ) && isplayer( attacker ) )
        {
            hitmarker_damage = max( var_bab6dc781bcdf7e6, 1 );
            attacker scripts\cp\damagefeedback::updatehitmarker( "cp_hitmarker_armor", 0, hitmarker_damage, 1, 0 );
        }
        
        scripts\cp_mp\armor::setarmorhealth( var_7aebecfc2ee6cf02 );
        broadcast_armor( var_7aebecfc2ee6cf02 );
        play_armor_sfx( attacker, var_7aebecfc2ee6cf02 );
        
        if ( var_7aebecfc2ee6cf02 <= 0 )
        {
            remove_player_armor( self );
        }
    }
    else
    {
        if ( isdefined( attacker ) && isplayer( attacker ) )
        {
            hitmarker_damage = max( var_bab6dc781bcdf7e6, 1 );
        }
        
        function_62957c4b8e469641( var_7aebecfc2ee6cf02 );
    }
    
    return var_bab6dc781bcdf7e6;
}

// Namespace armor / scripts\cp\armor
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x857
// Size: 0x1f
function function_8e297d719d663b78()
{
    if ( isplayer( self ) )
    {
        return scripts\cp_mp\armor::function_ac266fc218266d08();
    }
    
    return self.armor_health;
}

// Namespace armor / scripts\cp\armor
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x87e
// Size: 0x34
function function_3c53263a1ec58c23()
{
    if ( isagent( self ) )
    {
        return 1;
    }
    
    if ( getdvarint( @"hash_3578dcb6790fcfee", 0 ) )
    {
        return getdvarint( @"hash_3578dcb6790fcfee" );
    }
    
    return 3;
}

// Namespace armor / scripts\cp\armor
// Params 14, eflags: 0x0
// Checksum 0x0, Offset: 0x8bb
// Size: 0x8b
function damage_armored_player( player, einflictor, attacker, damage_amount, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime, var_cb96f01f01795373, modelindex, partname )
{
    var_5bad2a552da00704 = player function_270c9d76e9075af8( damage_amount, attacker );
    return var_5bad2a552da00704;
}

// Namespace armor / scripts\cp\armor
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x94f
// Size: 0xec, Type: bool
function armor_resistance_to_type( type, objweapon, einflictor, eattacker )
{
    if ( type == "MOD_FALLING" )
    {
        return false;
    }
    
    if ( type == "MOD_TRIGGER_HURT" )
    {
        return false;
    }
    
    if ( type == "MOD_FIRE" && !istrue( einflictor.ignore_fire_armor_check ) )
    {
        return false;
    }
    
    if ( type == "MOD_SUICIDE" )
    {
        return false;
    }
    
    switch ( objweapon.basename )
    {
        case #"hash_1e6ad4ef0904a0f1":
        case #"hash_1ee2bbd1bc80ea9a":
        case #"hash_2654d1bcc59b62b6":
        case #"hash_4f9064f9a7a4b7d1":
        case #"hash_fe08358bc8f9a34a":
            return false;
    }
    
    if ( isdefined( self ) && istrue( self.var_230a3287f9ad2965 ) )
    {
        self.var_230a3287f9ad2965 = undefined;
        return false;
    }
    
    if ( isdefined( eattacker ) && istrue( eattacker.armor_piercing ) )
    {
        return false;
    }
    
    return true;
}

// Namespace armor / scripts\cp\armor
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa44
// Size: 0x66
function play_armor_sfx( attacker, var_7aebecfc2ee6cf02 )
{
    alias = "cp_hit_indication_armor";
    
    if ( var_7aebecfc2ee6cf02 < 0 )
    {
        alias = "plr_armor_gone";
    }
    
    if ( isplayer( self ) && soundexists( alias ) )
    {
        self playlocalsound( alias );
    }
    
    if ( isplayer( attacker ) && soundexists( alias ) )
    {
        attacker playlocalsound( alias );
    }
}

// Namespace armor / scripts\cp\armor
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xab2
// Size: 0x4d
function broadcast_armor( amount )
{
    entity_num = self getentitynumber();
    armor = int( amount );
    self setclientomnvar( "ui_cp_armor_amount", armor );
    scripts\cp\persistence::setcoopplayerdata_for_everyone( "EoGPlayer", entity_num, "playerArmor", armor );
}

// Namespace armor / scripts\cp\armor
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb07
// Size: 0x3b
function function_e0d47de3df5f23ea()
{
    entity_num = self getentitynumber();
    
    if ( isdefined( self.armorhardened ) )
    {
        scripts\cp\persistence::setcoopplayerdata_for_everyone( "EoGPlayer", entity_num, "playerArmorHardened", self.armorhardened );
    }
}

// Namespace armor / scripts\cp\armor
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb4a
// Size: 0x13
function update_player_model( var_aa796102b09bd2a7, player )
{
    
}

// Namespace armor / scripts\cp\armor
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb65
// Size: 0x96
function setcharactermodels( bodymodelname, headmodelname, viewmodelname, hairmodel )
{
    if ( isdefined( self.headmodel ) )
    {
        self detach( self.headmodel );
    }
    
    self.bodymodel = bodymodelname;
    self setmodel( bodymodelname );
    self setviewmodel( viewmodelname );
    
    if ( isdefined( headmodelname ) )
    {
        self attach( headmodelname, "", 1 );
        self.headmodel = headmodelname;
    }
    
    if ( isdefined( hairmodel ) )
    {
        self attach( hairmodel, "", 1 );
        self.hairmodel = hairmodel;
    }
}

// Namespace armor / scripts\cp\armor
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc03
// Size: 0x77
function pick_up_armor_vest( interaction_struct, player )
{
    if ( player scripts\cp_mp\armor::function_79e0ab2aa0304a2c() )
    {
        return;
    }
    
    interaction_struct.model delete();
    scripts\cp\interaction::remove_from_current_interaction_list( interaction_struct );
    full_armor = player.var_4cb4a6ebd0885ffd;
    armor_dvar = getdvarint( @"hash_e6924e7c0a5aad1f", 0 );
    
    if ( armor_dvar )
    {
        full_armor = armor_dvar;
    }
    
    givearmor( player, full_armor );
}

// Namespace armor / scripts\cp\armor
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc82
// Size: 0x112
function usearmorplate( item, itemcount )
{
    self endon( "disconnect" );
    itemcount = self.armorqueued;
    
    if ( player_have_full_armor( self ) || scripts\cp\laststand::player_in_laststand( self ) )
    {
        return;
    }
    
    if ( !isdefined( itemcount ) || itemcount == 0 )
    {
        return;
    }
    else if ( istrue( self.insertingarmorplate ) )
    {
        return 0;
    }
    
    if ( !function_8b4861d7c2b23a5f() )
    {
        return;
    }
    
    if ( self isgestureplaying() )
    {
        if ( self isgestureplaying( "ges_swipe" ) )
        {
            self stopgestureviewmodel( "ges_swipe", 0, 1 );
            wait 0.05;
        }
        else
        {
            return;
        }
    }
    
    weaponobj = makeweapon( "iw9_armor_plate_deploy_mp" );
    streakinfo = scripts\cp_mp\utility\killstreak_utility::createstreakinfo( "", self );
    streakinfo.armorweapon = weaponobj;
    function_44069cec1ce1f09c( 1 );
    self.var_1d28f38751479256 = 0;
    thread function_27850a781863bbda();
    switchresult = scripts\cp_mp\killstreaks\killstreakdeploy::switchtodeployweapon( weaponobj, streakinfo, &insertarmor, undefined, &function_5428674b81737a6f, undefined, undefined, self.var_1d28f38751479256 );
}

// Namespace armor / scripts\cp\armor
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd9c
// Size: 0x1f2
function insertarmor( streakinfo )
{
    self endon( "death_or_disconnect" );
    self endon( "armor_repair_end" );
    
    if ( !function_8b4861d7c2b23a5f() || istrue( self.stoparmorinsert ) )
    {
        return;
    }
    
    currenttime = gettime();
    
    if ( istrue( self.var_1d28f38751479256 ) )
    {
        var_796ba59fc6c2ac9b = currenttime + 2800;
        var_3f536cbd3a3c3591 = 3000;
        armorendtime = 2800;
        var_48115c25c4a06354 = currenttime + 1125;
    }
    else
    {
        var_796ba59fc6c2ac9b = currenttime + 1860;
        var_3f536cbd3a3c3591 = 2000;
        armorendtime = 1860;
        var_48115c25c4a06354 = 0;
    }
    
    while ( currenttime < var_796ba59fc6c2ac9b )
    {
        if ( istrue( self.var_1d28f38751479256 ) && currenttime > var_48115c25c4a06354 )
        {
            self.var_1d28f38751479256 = 0;
        }
        
        if ( !isdefined( streakinfo.armorweapon ) || streakinfo.armorweapon != self getcurrentweapon() )
        {
            return;
        }
        
        waitframe();
        currenttime = gettime();
    }
    
    function_4c0f32bf2e194901();
    var_4d5f2c05f11db0ec = ( var_3f536cbd3a3c3591 - armorendtime ) / 1000;
    wait var_4d5f2c05f11db0ec;
    
    while ( function_71bfaff2d0aa4165() )
    {
        itemname = "iw9_armor_plate_deploy_mp";
        itemcount = self.armorqueued;
        
        if ( isdefined( itemname ) && isdefined( itemcount ) && itemcount > 0 && !player_have_full_armor( self ) )
        {
            var_bef0447316d92bfd = gettime() + 1250;
            
            while ( gettime() < var_bef0447316d92bfd )
            {
                if ( !isdefined( streakinfo.armorweapon ) || streakinfo.armorweapon != self getcurrentweapon() )
                {
                    return;
                }
                
                waitframe();
            }
            
            function_4c0f32bf2e194901();
            var_cf97caf9e7ec424 = ( 1500 - 1250 ) / 1000;
            wait var_cf97caf9e7ec424;
            continue;
        }
        
        break;
    }
    
    self notify( "armor_plate_done" );
}

// Namespace armor / scripts\cp\armor
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf96
// Size: 0x21
function function_865d357c1a33fd3b()
{
    self.armorqueued = 0;
    self setclientomnvar( "ui_equipment_id_health_numCharges", self.armorqueued );
}

// Namespace armor / scripts\cp\armor
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfbf
// Size: 0xe9
function function_1258f8d2084a2ce7( num )
{
    var_984a6df678d579cb = 5;
    
    if ( _hasperk( "specialty_armor_satchel" ) )
    {
        var_984a6df678d579cb = 8;
    }
    
    if ( !isdefined( num ) )
    {
        num = 1;
    }
    else if ( _hasperk( "specialty_armor_satchel" ) )
    {
        num += 3;
    }
    
    if ( !isdefined( self.armorqueued ) )
    {
        var_2cf7323dc1535b23 = num;
        self.armorqueued = num;
    }
    else
    {
        var_2cf7323dc1535b23 = self.armorqueued + num;
        self.armorqueued += num;
    }
    
    return_value = 0;
    
    if ( var_2cf7323dc1535b23 > var_984a6df678d579cb )
    {
        return_value = var_2cf7323dc1535b23 - var_984a6df678d579cb;
    }
    
    self.armorqueued = int( min( self.armorqueued, var_984a6df678d579cb ) );
    self setclientomnvar( "ui_equipment_id_health", 27 );
    self setclientomnvar( "ui_equipment_id_health_numCharges", self.armorqueued );
    return return_value;
}

// Namespace armor / scripts\cp\armor
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10b1
// Size: 0x1b
function function_6f49a313daf71b39()
{
    self setclientomnvar( "ui_br_has_plate_pouch", 1 );
    self.armor_satchel = 1;
}

// Namespace armor / scripts\cp\armor
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10d4
// Size: 0x19
function function_9a26bfc3788f86dc()
{
    self setclientomnvar( "ui_br_has_plate_pouch", 0 );
    self.armor_satchel = 0;
}

// Namespace armor / scripts\cp\armor
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10f5
// Size: 0x47, Type: bool
function function_71bfaff2d0aa4165()
{
    var_a5ea2300efaaa6a7 = is_player_gamepad_enabled() && self weaponswitchbuttonpressed();
    hasarmorqueue = isdefined( self.armorqueued ) && self.armorqueued > 0;
    return var_a5ea2300efaaa6a7 && hasarmorqueue;
}

// Namespace armor / scripts\cp\armor
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1145
// Size: 0x1e
function function_44069cec1ce1f09c( var_e12d78c11d85d9c2 )
{
    self allowmelee( !var_e12d78c11d85d9c2 );
    self.insertingarmorplate = var_e12d78c11d85d9c2;
}

// Namespace armor / scripts\cp\armor
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x116b
// Size: 0x21
function function_5428674b81737a6f( streakinfo, switchresult )
{
    if ( !istrue( switchresult ) )
    {
        function_44069cec1ce1f09c( 0 );
        return;
    }
}

// Namespace armor / scripts\cp\armor
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1194
// Size: 0x43, Type: bool
function function_8b4861d7c2b23a5f()
{
    if ( isdefined( self.vehicle ) )
    {
        seat = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getoccupantseat( self.vehicle, self );
        
        if ( seat == "driver" )
        {
            return false;
        }
    }
    
    if ( self isparachuting() )
    {
        return false;
    }
    
    return true;
}

// Namespace armor / scripts\cp\armor
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x11e0
// Size: 0x11b
function givearmor( player, armoramount, var_cf0a9d02644669ac )
{
    if ( player_have_full_armor( player ) )
    {
        return;
    }
    
    current_armor = player scripts\cp_mp\armor::function_ac266fc218266d08();
    entity_num = player getentitynumber();
    setomnvar( "ui_armor_gained", entity_num );
    var_7aebecfc2ee6cf02 = min( current_armor + armoramount, player.var_4cb4a6ebd0885ffd );
    var_cf0a9d02644669ac = istrue( var_cf0a9d02644669ac );
    
    if ( !var_cf0a9d02644669ac )
    {
        player val::set( "armor", "ads", 0 );
        player val::set( "armor", "fire", 0 );
        player val::set( "armor", "melee", 0 );
        player cancelreload();
        var_cf0a9d02644669ac = 1;
    }
    
    player broadcast_armor( var_7aebecfc2ee6cf02 );
    
    if ( !var_cf0a9d02644669ac )
    {
        wait player getgestureanimlength( "ges_vest_replace" );
        player playlocalsound( "plr_armor_salvage" );
    }
    
    player notify( "armorUseSuccess" );
    
    if ( !var_cf0a9d02644669ac )
    {
        player stopgestureviewmodel( "ges_vest_replace", 0.45 );
        player val::reset_all( "armor" );
    }
    
    player.armor = var_7aebecfc2ee6cf02;
}

// Namespace armor / scripts\cp\armor
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1303
// Size: 0x18, Type: bool
function player_have_armor( player )
{
    return player.armor > 0;
}

// Namespace armor / scripts\cp\armor
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1324
// Size: 0x4d, Type: bool
function player_have_full_armor( player )
{
    full_armor = self.var_4cb4a6ebd0885ffd;
    armor_dvar = getdvarint( @"hash_e6924e7c0a5aad1f", 0 );
    
    if ( armor_dvar )
    {
        full_armor = armor_dvar;
    }
    
    return player.armor == full_armor;
}

// Namespace armor / scripts\cp\armor
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x137a
// Size: 0x4f
function function_f9844e7b0cb6e736( player )
{
    var_984a6df678d579cb = 5;
    
    if ( _hasperk( "specialty_armor_satchel" ) )
    {
        var_984a6df678d579cb = 8;
    }
    
    var_fce0ad4f666e56a1 = isdefined( self.armorqueued ) && self.armorqueued >= var_984a6df678d579cb;
    return var_fce0ad4f666e56a1;
}

// Namespace armor / scripts\cp\armor
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13d2
// Size: 0x2c
function armor_vest_hint_func( interaction_struct, player )
{
    if ( player_have_full_armor( player ) )
    {
        return %COOP_CRAFTING/ARMOR_FULL;
    }
    
    return %COOP_CRAFTING/ARMOR_TAKE;
}

// Namespace armor / scripts\cp\armor
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1406
// Size: 0x75
function updatearmorvestmodel()
{
    self endon( "armorUseSuccess" );
    self endon( "disconnect" );
    self endon( "death" );
    wait 0.5;
    model = spawn( "script_model", self.origin );
    model setmodel( "loot_armor" );
    model notsolid();
    self playerlinktodelta( model );
    scripts\engine\utility::waittill_notify_or_timeout( "armorUseCancel", 1.2 );
    self unlink();
    model delete();
}

// Namespace armor / scripts\cp\armor
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1483
// Size: 0x43
function armorbreak( point )
{
    self shellshock( "armor_gone", 2.5 );
    earthquake( 0.3, 0.65, point, 5000 );
    self viewkick( 127, self.origin, 0 );
}

// Namespace armor / scripts\cp\armor
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14ce
// Size: 0x18
function armorinit( player )
{
    player.armor = 0;
}

// Namespace armor / scripts\cp\armor
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14ee
// Size: 0x37
function remove_player_armor( player )
{
    player.armor = 0;
    player playsoundtoplayer( "hit_marker_armor_break_plr", player );
    player setscriptablepartstate( "armor_break", "armor_break", 0 );
}

// Namespace armor / scripts\cp\armor
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x152d
// Size: 0x2f, Type: bool
function can_update_player_armor_model( player )
{
    if ( isdefined( player.can_update_player_armor_model ) && player.can_update_player_armor_model == 0 )
    {
        return false;
    }
    
    return true;
}

// Namespace armor / scripts\cp\armor
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1565
// Size: 0x20
function set_can_update_player_armor_model( player, value )
{
    player.can_update_player_armor_model = value;
}

// Namespace armor / scripts\cp\armor
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x158d
// Size: 0x9c
function function_4c0f32bf2e194901()
{
    hasarmorqueue = isdefined( self.armorqueued ) && self.armorqueued > 0;
    
    if ( !hasarmorqueue )
    {
        return;
    }
    
    if ( self isparachuting() )
    {
        self notify( "try_armor_cancel", "parachuting" );
        return;
    }
    
    if ( isdefined( self.armorqueued ) )
    {
        self.armorqueued--;
    }
    
    self setclientomnvar( "ui_equipment_id_health", 27 );
    self setclientomnvar( "ui_equipment_id_health_numCharges", self.armorqueued );
    givearmor( self, 50, 1 );
    scripts\cp_mp\challenges::onuseitem( "armor_plate" );
    self notify( "armor_plate_inserted" );
}

// Namespace armor / scripts\cp\armor
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1631
// Size: 0x54
function function_ab2214deae1e59b1( var_a33039d2420867ad )
{
    assert( isdefined( var_a33039d2420867ad ) );
    ent_flag_wait( "player_spawned_with_loadout" );
    
    for (i = 0; i < var_a33039d2420867ad; i++) {
        self setclientomnvar( "ui_equipment_id_health", 27 );
        givearmor( self, 50, 1 );
    }
}

// Namespace armor / scripts\cp\armor
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x168d
// Size: 0x61
function function_27850a781863bbda()
{
    self endon( "armor_repair_end" );
    self endon( "disconnect" );
    function_c0f8e3d4adc00c6b();
    thread function_6240b67b26d79ac9();
    self.stoparmorinsert = 0;
    waittill_any_6( "death", "mantle_start", "last_stand_start", "special_weapon_fired", "try_armor_cancel", "armor_plate_done" );
    self.stoparmorinsert = 1;
    thread armor_repair_end();
}

// Namespace armor / scripts\cp\armor
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16f6
// Size: 0x67
function armor_repair_end()
{
    self endon( "disconnect" );
    self notify( "armor_repair_end" );
    function_dcbe43eec086bcfa();
    
    while ( isdefined( self.currentweapon ) && isdefined( self.currentweapon.basename ) && self.currentweapon.basename == "iw9_armor_plate_deploy_mp" )
    {
        waitframe();
    }
    
    waitframe();
    function_44069cec1ce1f09c( 0 );
}

// Namespace armor / scripts\cp\armor
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1765
// Size: 0x68
function function_c0f8e3d4adc00c6b()
{
    self notifyonplayercommand( "try_armor_cancel", "+weapnext" );
    self notifyonplayercommand( "try_armor_cancel", "+weapprev" );
    self notifyonplayercommand( "try_armor_cancel", "+attack" );
    self notifyonplayercommand( "try_armor_cancel", "+smoke" );
    self notifyonplayercommand( "try_armor_cancel", "+frag" );
    self notifyonplayercommand( "try_armor_cancel", "+melee_zoom" );
}

// Namespace armor / scripts\cp\armor
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17d5
// Size: 0x68
function function_dcbe43eec086bcfa()
{
    self notifyonplayercommandremove( "try_armor_cancel", "+weapnext" );
    self notifyonplayercommandremove( "try_armor_cancel", "+weapprev" );
    self notifyonplayercommandremove( "try_armor_cancel", "+attack" );
    self notifyonplayercommandremove( "try_armor_cancel", "+smoke" );
    self notifyonplayercommandremove( "try_armor_cancel", "+frag" );
    self notifyonplayercommandremove( "try_armor_cancel", "+melee_zoom" );
}

// Namespace armor / scripts\cp\armor
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1845
// Size: 0xd0
function function_6240b67b26d79ac9()
{
    self endon( "disconnect" );
    self endon( "armor_repair_end" );
    
    while ( isdefined( self.currentweapon ) && isdefined( self.currentweapon.basename ) && self.currentweapon.basename != "iw9_armor_plate_deploy_mp" )
    {
        if ( self isonladder() )
        {
            self notify( "try_armor_cancel", "ladder_used" );
        }
        
        waitframe();
    }
    
    while ( isdefined( self.currentweapon ) && isdefined( self.currentweapon.basename ) && self.currentweapon.basename == "iw9_armor_plate_deploy_mp" )
    {
        if ( self isonladder() )
        {
            self notify( "try_armor_cancel", "ladder_used" );
        }
        
        waitframe();
    }
    
    self notify( "try_armor_cancel" );
}

// Namespace armor / scripts\cp\armor
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x191d
// Size: 0x23
function function_6e9ee0df5ab3c202()
{
    cmd = "devgui_cmd \"CP Debug:2 / Debug / Give 3 Armor\" \"set scr_give_armor 1\" \n";
    addentrytodevgui( cmd );
    level thread function_d251468d9c2fe73f();
}

// Namespace armor / scripts\cp\armor
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1948
// Size: 0x59
function function_d251468d9c2fe73f()
{
    level endon( "game_ended" );
    wait 10;
    
    while ( true )
    {
        while ( getdvarint( @"hash_5b9017dbf5c32c36", 0 ) == 0 )
        {
            wait 0.5;
        }
        
        level.player scripts\cp_mp\armor::function_9c6e9a6643b6c9a6( 3 );
        setdvar( @"hash_5b9017dbf5c32c36", 0 );
        wait 0.5;
    }
}

