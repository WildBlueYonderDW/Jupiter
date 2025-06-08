#using script_608c50392df8c7d1;
#using scripts\common\ae_utility;
#using scripts\common\elevators;
#using scripts\common\interactive;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\challenges;
#using scripts\cp_mp\damagefeedback;
#using scripts\cp_mp\emp_debuff;
#using scripts\cp_mp\entityheadicons;
#using scripts\cp_mp\equipment\haywire;
#using scripts\cp_mp\playerhealth;
#using scripts\cp_mp\supers\supers;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\utility\train_utility;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace med_box;

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x737
// Size: 0x18
function autoexec main()
{
    registersharedfunc( "super_med_box", "init", &function_40e8a5a7f496a5e1 );
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 0
// Checksum 0x0, Offset: 0x757
// Size: 0xda
function function_40e8a5a7f496a5e1()
{
    setdvarifuninitialized( @"hash_f0fb5d0ed88ab0c1", 0.2 );
    setdvarifuninitialized( @"hash_8421e297e070a231", 15 );
    setdvarifuninitialized( @"hash_aab0b04330cc870b", 0 );
    setdvarifuninitialized( @"hash_8ed5cff8032a5943", 0 );
    level.var_326bb184c77c764b = [];
    scripts\common\interactive::interactive_addusedcallback( &function_3122c424cb613711, "equip_medbox" );
    
    if ( issharedfuncdefined( "team_utility", "joinTeamAggregator" ) )
    {
        [[ getsharedfunc( "team_utility", "joinTeamAggregator" ) ]]( &function_7189d58307e0232d );
    }
    
    level._effect[ "vfx/iw9/fieldupgrades/ammobox/vfx_ammobox_timeout.vfx" ] = loadfx( "vfx/iw9/fieldupgrades/ammobox/vfx_ammobox_timeout.vfx" );
    level._effect[ "vfx/jup/equipment/vfx_equip_medcrate_vignette.vfx" ] = loadfx( "vfx/jup/equipment/vfx_equip_medcrate_vignette.vfx" );
    registersharedfunc( "super_med_box", "medBox_used", &medbox_used );
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 1
// Checksum 0x0, Offset: 0x839
// Size: 0x65
function function_7189d58307e0232d( player )
{
    foreach ( medbox in level.var_326bb184c77c764b )
    {
        if ( isdefined( medbox ) )
        {
            medbox function_693a82b036cfba91( player );
        }
    }
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 4
// Checksum 0x0, Offset: 0x8a6
// Size: 0x347
function box_used_common_setup( grenade, equipmentname, superid, headicon )
{
    grenade.var_f89ce82fc6abacd5 = 0;
    grenade endon( "death" );
    grenade.issuper = 1;
    staticsuperdata = level.superglobals.staticsuperdata[ superid ];
    grenade.superid = staticsuperdata.id;
    grenade.lifetime = staticsuperdata.bundle.lifetime;
    
    if ( isdefined( grenade.lifetime ) && grenade.lifetime > 0 )
    {
        grenade thread function_cdfda8cc0153b5d6();
    }
    
    grenade thread function_5fac0b2ef5c1e31c();
    grenade thread function_7c185a75f2dfdaf9( self );
    grenade waittill( "missile_stuck", stuckto );
    
    if ( isdefined( level.var_ca4e08767cbdae12 ) )
    {
        canplant = grenade [[ level.var_ca4e08767cbdae12 ]]();
        
        if ( !canplant )
        {
            if ( issharedfuncdefined( "supers", "refundSuper" ) )
            {
                self [[ getsharedfunc( "supers", "refundSuper" ) ]]();
            }
            
            if ( issharedfuncdefined( "hud", "showErrorMessage" ) )
            {
                self [[ getsharedfunc( "hud", "showErrorMessage" ) ]]( "EQUIPMENT/PLANT_FAILED" );
            }
            
            grenade delete();
            return;
        }
    }
    
    grenade function_354b5edf045a416d( stuckto );
    grenade.bundle = scripts\cp_mp\supers\supers::function_bf9c7e9dd30180e3( superid );
    
    if ( issharedfuncdefined( "weapons", "onEquipmentPlanted" ) )
    {
        self [[ getsharedfunc( "weapons", "onEquipmentPlanted" ) ]]( grenade, equipmentname, &function_2850334505f6e7f7 );
    }
    
    level.var_326bb184c77c764b[ grenade getentitynumber() ] = grenade;
    grenade scripts\cp_mp\emp_debuff::set_apply_emp_callback( &function_91bbfcf9c145de2c );
    
    if ( issharedfuncdefined( "emp", "setEMP_Applied_Callback" ) )
    {
        grenade [[ getsharedfunc( "emp", "setEMP_Applied_Callback" ) ]]( &function_91bbfcf9c145de2c );
    }
    
    self.var_719e5222169cb898 = grenade;
    grenade scripts\cp_mp\equipment\haywire::function_172d848d58051fdf( &function_396418c8b2e4fc03 );
    grenade function_49197cd063a740ea( &function_2850334505f6e7f7 );
    
    if ( isdefined( level.elevators ) )
    {
        foreach ( elevators in level.elevators )
        {
            elevators thread scripts\common\elevators::isentitytouchingdoortrigger( grenade );
        }
    }
    
    if ( !istrue( grenade.madedamageable ) )
    {
        grenade function_c5fc51cc2864328();
    }
    
    grenade.makedamageable = undefined;
    grenade setscriptablepartstate( "visibility", "show", 0 );
    wait 0;
    
    if ( !scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924() )
    {
        grenade function_5ab1f822624461d( headicon );
    }
    
    wait 0.75;
    grenade setscriptablepartstate( "effects", "plant", 0 );
    grenade setscriptablepartstate( "anims", "open", 0 );
    wait grenade function_71823b2e5023e827();
    grenade setscriptablepartstate( "beacon", "active", 0 );
    grenade setscriptablepartstate( "anims", "openIdle", 0 );
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 1
// Checksum 0x0, Offset: 0xbf5
// Size: 0x128
function function_7c185a75f2dfdaf9( player )
{
    self endon( "death" );
    self endon( "missile_stuck" );
    player endon( "disconnect" );
    msg = waittill_any_timeout_1( 2, "touching_platform" );
    
    if ( msg == "timeout" )
    {
        return;
    }
    
    groundentity = undefined;
    ignoreents = vehicle_getarrayinradius( self.origin, 500, 500 );
    ignoreents[ ignoreents.size ] = self;
    tracecontents = scripts\engine\trace::create_contents( 0, 1, 1, 1, 0, 1, 1, 0, 1 );
    tracestart = self.origin;
    var_3a7f0173b03f5767 = -2000;
    traceend = self.origin + ( 0, 0, var_3a7f0173b03f5767 );
    traceresults = scripts\engine\trace::ray_trace( tracestart, traceend, ignoreents, tracecontents );
    
    if ( traceresults[ "fraction" ] < 1 )
    {
        groundentity = traceresults[ "entity" ];
        
        if ( isdefined( groundentity ) )
        {
            if ( is_train_ent( groundentity ) )
            {
                self.origin = player.origin;
            }
        }
    }
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 1
// Checksum 0x0, Offset: 0xd25
// Size: 0x9e, Type: bool
function is_train_ent( hitent )
{
    if ( isdefined( level.wztrain_info ) )
    {
        foreach ( ent in level.wztrain_info.train_array )
        {
            if ( ent == hitent )
            {
                return true;
            }
            
            if ( isdefined( ent.linked_model ) && ent.linked_model == hitent )
            {
                return true;
            }
        }
    }
    
    return false;
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 1
// Checksum 0x0, Offset: 0xdcc
// Size: 0x10f
function medbox_used( grenade )
{
    grenade endon( "death" );
    vfxtimeout = "vfx/iw9/fieldupgrades/ammobox/vfx_ammobox_timeout.vfx";
    vfxbuff = "vfx/jup/equipment/vfx_equip_medcrate_vignette.vfx";
    equipname = "equip_medbox";
    supername = "super_med_box";
    headicon = "jup_hud_icon_equipment_med_box";
    usehint = ter_op( self usinggamepad(), %EQUIPMENT_HINTS/MED_BOX_HOLD_USE, %EQUIPMENT_HINTS/MED_BOX_PRESS_USE );
    
    if ( isdefined( self.var_719e5222169cb898 ) )
    {
        self.var_719e5222169cb898 thread function_2850334505f6e7f7( 0 );
    }
    
    grenade.timeoutvfxname = vfxtimeout;
    grenade.var_774fe42bb6fc7cc7 = vfxbuff;
    box_used_common_setup( grenade, equipname, supername, headicon );
    grenade function_67340ce4394d6a9( equipname, usehint );
    
    if ( getdvarint( @"hash_8ed5cff8032a5943" ) >= 1 )
    {
        thread function_3122c424cb613711( grenade, self );
    }
    
    scripts\cp_mp\challenges::function_d997435895422ecc( supername, function_e2ff8f4b4e94f723( #"hash_83a2d67994d7e295", #"use" ) );
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 1
// Checksum 0x0, Offset: 0xee3
// Size: 0x6c
function function_5fac0b2ef5c1e31c( time )
{
    self endon( "death" );
    self endon( "missile_stuck" );
    hideduration = getdvarfloat( @"hash_ed9a51db36904e30", 0 );
    self setscriptablepartstate( "visibility", "hide", 0 );
    wait hideduration;
    self.madedamageable = 1;
    function_c5fc51cc2864328();
    self setscriptablepartstate( "visibility", "show", 0 );
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 0
// Checksum 0x0, Offset: 0xf57
// Size: 0x9a
function function_311a39a241b6e438()
{
    if ( true )
    {
        foreach ( superequip in self.plantedsuperequip )
        {
            if ( superequip.equipmentref == "equip_medbox" )
            {
                superequip thread function_2850334505f6e7f7( 1 );
                
                if ( issharedfuncdefined( "weapons", "removeEquip" ) )
                {
                    self [[ getsharedfunc( "weapons", "removeEquip" ) ]]( superequip );
                }
            }
        }
    }
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 3
// Checksum 0x0, Offset: 0xff9
// Size: 0x19d
function function_2850334505f6e7f7( immediate, wasdestroyed, var_d3f5ceb48370a22a )
{
    if ( !isdefined( immediate ) )
    {
        immediate = !istrue( self.planted );
    }
    
    timeoutvfxname = "vfx/iw9/fieldupgrades/ammobox/vfx_ammobox_timeout.vfx";
    
    if ( isdefined( self.timeoutvfxname ) )
    {
        timeoutvfxname = self.timeoutvfxname;
    }
    
    closetime = 0;
    
    if ( istrue( var_d3f5ceb48370a22a ) )
    {
        closetime = function_4868d9728ebf387a();
    }
    
    deletiondelay = 0;
    
    if ( !istrue( immediate ) )
    {
        deletiondelay = 0.1;
    }
    
    thread function_b349fbedc61f01e4( deletiondelay, wasdestroyed );
    moving_platform = undefined;
    fxoriginoffset = undefined;
    
    if ( isdefined( self ) )
    {
        fxorigin = self.origin;
        fxforward = anglestoforward( self.angles );
        fxup = anglestoup( self.angles );
        var_dfdfaa4e665b31fc = self getlinkedparent();
        
        if ( isdefined( var_dfdfaa4e665b31fc ) )
        {
            moving_platform = var_dfdfaa4e665b31fc;
            fxoriginoffset = moving_platform.origin - fxorigin;
        }
        
        self setscriptablepartstate( "beacon", "neutral", 0 );
        self setscriptablepartstate( "hacked", "neutral", 0 );
        
        if ( istrue( var_d3f5ceb48370a22a ) )
        {
            self setscriptablepartstate( "anims", "close", 0 );
            wait closetime;
            self setscriptablepartstate( "anims", "closedIdle", 0 );
            wait 1;
        }
        
        if ( isdefined( moving_platform ) && isent( moving_platform ) )
        {
            fxorigin = moving_platform.origin - fxoriginoffset;
        }
        
        self setscriptablepartstate( "effects", "destroy", 0 );
    }
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 2
// Checksum 0x0, Offset: 0x119e
// Size: 0x112
function function_b349fbedc61f01e4( deletiondelay, wasdestroyed )
{
    self notify( "death" );
    self.isdestroyed = 1;
    self setcandamage( 0 );
    
    if ( isdefined( self.owner ) )
    {
        if ( issharedfuncdefined( "weapons", "removeEquip" ) )
        {
            self.owner [[ getsharedfunc( "weapons", "removeEquip" ) ]]( self );
        }
    }
    
    function_8463e9c51dc49f4c();
    medbox_makeunusable();
    supername = "super_med_box";
    
    if ( supername == "super_med_box" )
    {
        self.owner scripts\cp_mp\challenges::function_d997435895422ecc( supername, function_e2ff8f4b4e94f723( #"hash_83a2d67994d7e295", #"end" ), self.usedcount );
    }
    
    if ( issharedfuncdefined( "dlog", "fieldUpgradeExpired" ) )
    {
        [[ getsharedfunc( "dlog", "fieldUpgradeExpired" ) ]]( self.owner, self.superid, self.usedcount, istrue( wasdestroyed ) );
    }
    
    wait deletiondelay;
    self delete();
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 2
// Checksum 0x0, Offset: 0x12b8
// Size: 0x8d
function function_67340ce4394d6a9( equipmentname, hintstring )
{
    scripts\common\interactive::interactive_addusedcallbacktoentity( equipmentname );
    self.playersused = [];
    self.usedcount = 0;
    self makeusable();
    self setusepriority( -1 );
    self enablemissilehint( 1 );
    self setcursorhint( "HINT_NOICON" );
    self sethintstring( hintstring );
    self setuserange( 128 );
    self setuseholdduration( "duration_short" );
    self sethintrequiresholding( 0 );
    self sethinttag( "tag_use" );
    thread function_7debe3e49eeb21cb();
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 0
// Checksum 0x0, Offset: 0x134d
// Size: 0x7b
function medbox_makeunusable()
{
    self notify( "medBox_makeUnusable" );
    scripts\common\interactive::interactive_removeusedcallbackfromentity();
    self makeunusable();
    
    if ( isdefined( self.playersused ) )
    {
        foreach ( player in self.playersused )
        {
        }
    }
    
    self.playersused = undefined;
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 0
// Checksum 0x0, Offset: 0x13d0
// Size: 0x45
function function_7debe3e49eeb21cb()
{
    self endon( "death" );
    self endon( "medBox_makeUnusable" );
    var_47facc6abff4fd71 = gettime();
    
    while ( true )
    {
        if ( gettime() >= var_47facc6abff4fd71 )
        {
            function_7ab94d4ac032f716();
            var_47facc6abff4fd71 = gettime() + 150;
        }
        
        waitframe();
    }
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 0
// Checksum 0x0, Offset: 0x141d
// Size: 0x84
function function_7ab94d4ac032f716()
{
    nearplayers = utility::playersnear( self.origin, 300 );
    
    foreach ( player in nearplayers )
    {
        if ( isdefined( player ) )
        {
            if ( !function_cb4fbeffb3529c7( player ) )
            {
                self disableplayeruse( player );
                continue;
            }
            
            self enableplayeruse( player );
        }
    }
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 0
// Checksum 0x0, Offset: 0x14a9
// Size: 0xb0
function function_42d1dd4813d81681()
{
    foreach ( player in self.playersused )
    {
        if ( isdefined( player ) )
        {
            entnum = player getentitynumber();
            
            if ( issharedfuncdefined( "player", "isReallyAlive" ) )
            {
                if ( ![[ getsharedfunc( "player", "isReallyAlive" ) ]]( player ) && isdefined( self.playersused[ entnum ] ) )
                {
                    self.playersused[ entnum ] = undefined;
                    function_693a82b036cfba91( player );
                }
            }
        }
    }
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 1
// Checksum 0x0, Offset: 0x1561
// Size: 0x74, Type: bool
function function_cb4fbeffb3529c7( player )
{
    if ( issharedfuncdefined( "player", "isReallyAlive" ) )
    {
        if ( ![[ getsharedfunc( "player", "isReallyAlive" ) ]]( player ) )
        {
            return false;
        }
    }
    
    if ( !player val::get( "crate_use" ) )
    {
        return false;
    }
    
    if ( isdefined( self.playersused[ player getentitynumber() ] ) )
    {
        return false;
    }
    
    if ( scripts\cp_mp\utility\player_utility::playersareenemies( player, self.owner ) )
    {
        return false;
    }
    
    return true;
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 1
// Checksum 0x0, Offset: 0x15de
// Size: 0x58
function function_7a3ec75c9ecb32a( player )
{
    if ( !isdefined( self.equipmentref ) )
    {
        assertmsg( "<dev string:x1c>" );
        return;
    }
    
    function_ac68a8c0957eeeeb( player );
    thread function_9dc18231b25d8653();
    self.var_ee55bd57abd7930b = 1;
    supername = "super_med_box";
    return 1;
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 1
// Checksum 0x0, Offset: 0x163f
// Size: 0x1d
function function_ac68a8c0957eeeeb( player )
{
    if ( isdefined( player ) )
    {
        player playsoundtoplayer( "jup_med_box_use", player );
    }
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 0
// Checksum 0x0, Offset: 0x1664
// Size: 0x57
function function_9dc18231b25d8653()
{
    self endon( "death" );
    
    if ( istrue( self.onuseanimplaying ) )
    {
        return;
    }
    
    self setscriptablepartstate( "anims", "openUse", 0 );
    self.onuseanimplaying = 1;
    wait function_d3cc6eb39b0771f5();
    self setscriptablepartstate( "anims", "openIdle", 0 );
    self.onuseanimplaying = undefined;
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 0
// Checksum 0x0, Offset: 0x16c3
// Size: 0x75
function function_c5fc51cc2864328()
{
    bundle = self.bundle;
    boxmaxhealth = 100;
    
    if ( isdefined( bundle ) )
    {
        boxmaxhealth = default_to( bundle.var_e53ecfd9f4fef4fa, 100 );
    }
    
    if ( issharedfuncdefined( "damage", "monitorDamage" ) )
    {
        self thread [[ getsharedfunc( "damage", "monitorDamage" ) ]]( boxmaxhealth, "hitequip", &function_12b512237730ace8, &function_79a97ee01dc267d3 );
    }
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 1
// Checksum 0x0, Offset: 0x1740
// Size: 0x29
function function_12b512237730ace8( data )
{
    function_2bdf5e5dc8f22e66( data.attacker );
    thread function_2850334505f6e7f7( 0, 1, 0 );
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 0
// Checksum 0x0, Offset: 0x1771
// Size: 0x3f
function function_320b2af6f6bd1910()
{
    if ( isdefined( self.outlineid ) )
    {
        if ( issharedfuncdefined( "outline", "outlineDisable" ) )
        {
            [[ getsharedfunc( "outline", "outlineDisable" ) ]]( self.outlineid, self );
        }
    }
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 1
// Checksum 0x0, Offset: 0x17b8
// Size: 0x47
function function_5ab1f822624461d( headicon )
{
    self.headiconbox = scripts\cp_mp\entityheadicons::setheadicon_singleimage( [], headicon, 20, 1, 1000, 100, undefined, 1 );
    self.headiconfaction = scripts\cp_mp\entityheadicons::setheadicon_factionimage( 0, 20, undefined, undefined, undefined, undefined, 1 );
    function_69873580a9e98ea();
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 0
// Checksum 0x0, Offset: 0x1807
// Size: 0x50
function function_8463e9c51dc49f4c()
{
    if ( isdefined( self.headiconbox ) )
    {
        scripts\cp_mp\entityheadicons::setheadicon_deleteicon( self.headiconbox );
        self.headiconbox = undefined;
    }
    
    if ( isdefined( self.headiconfaction ) )
    {
        scripts\cp_mp\entityheadicons::setheadicon_deleteicon( self.headiconfaction );
        self.headiconfaction = undefined;
    }
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 2
// Checksum 0x0, Offset: 0x185f
// Size: 0x112
function function_2bdf5e5dc8f22e66( attacker, fromemp )
{
    if ( !isdefined( self.owner ) || istrue( scripts\cp_mp\utility\player_utility::playersareenemies( self.owner, attacker ) ) )
    {
        attacker notify( "destroyed_equipment" );
        
        if ( issharedfuncdefined( "player", "doScoreEvent" ) )
        {
            var_ad8c6c5cc50af10b = 0;
            
            if ( istrue( fromemp ) )
            {
                var_ad8c6c5cc50af10b = 1;
            }
            
            attacker thread [[ getsharedfunc( "player", "doScoreEvent" ) ]]( #"destroyed_equipment", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, var_ad8c6c5cc50af10b );
        }
        
        if ( isdefined( self.weapon_name ) )
        {
            if ( self.weapon_name == "ammo_box_mp" )
            {
                if ( issharedfuncdefined( "battlechatter", "onFieldUpgradeDestroy" ) )
                {
                    attacker thread [[ getsharedfunc( "battlechatter", "onFieldUpgradeDestroy" ) ]]( #"bc_fieldupgrade_killfirm_ammobox" );
                }
                
                return;
            }
            
            if ( issharedfuncdefined( "battlechatter", "onFieldUpgradeDestroy" ) )
            {
                attacker thread [[ getsharedfunc( "battlechatter", "onFieldUpgradeDestroy" ) ]]( #"bc_fieldupgrade_killfirm_armorbox" );
            }
        }
    }
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 4
// Checksum 0x0, Offset: 0x1979
// Size: 0xef
function function_e2df8d98b73b2414( player, eventname, persstat, supername )
{
    if ( isdefined( self.owner ) && !scripts\cp_mp\utility\player_utility::playersareenemies( self.owner, player ) )
    {
        if ( self.owner != player )
        {
            if ( issharedfuncdefined( "player", "doScoreEvent" ) )
            {
                self.owner thread [[ getsharedfunc( "player", "doScoreEvent" ) ]]( eventname );
            }
        }
        
        if ( issharedfuncdefined( "pers", "incPersStat" ) )
        {
            self.owner [[ getsharedfunc( "pers", "incPersStat" ) ]]( persstat, 1 );
        }
        
        if ( issharedfuncdefined( "supers", "combatRecordSuperMisc" ) )
        {
            self.owner [[ getsharedfunc( "supers", "combatRecordSuperMisc" ) ]]( supername );
        }
        
        self.usedcount++;
    }
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 1
// Checksum 0x0, Offset: 0x1a70
// Size: 0x13
function function_65c63d1724f6b2a7( data )
{
    function_2850334505f6e7f7( 0 );
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 1
// Checksum 0x0, Offset: 0x1a8b
// Size: 0xd9
function function_246699c2be1e55c2( data )
{
    owner = self.owner;
    
    if ( !isdefined( owner ) )
    {
        return;
    }
    
    if ( issharedfuncdefined( "player", "getCurrentSuper" ) )
    {
        superinfo = owner [[ getsharedfunc( "player", "getCurrentSuper" ) ]]();
        
        if ( isdefined( superinfo ) && level.allowsupers )
        {
            if ( !istrue( self.var_ee55bd57abd7930b ) )
            {
                superinfo.wasrefunded = 1;
                
                if ( issharedfuncdefined( "supers", "setSuperBasePoints" ) && issharedfuncdefined( "supers", "getSuperPointsNeeded" ) )
                {
                    owner [[ getsharedfunc( "supers", "setSuperBasePoints" ) ]]( owner [[ getsharedfunc( "supers", "getSuperPointsNeeded" ) ]]() );
                }
            }
        }
    }
    
    function_2850334505f6e7f7( 0 );
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 1
// Checksum 0x0, Offset: 0x1b6c
// Size: 0xba
function function_354b5edf045a416d( stuckto )
{
    data = spawnstruct();
    data.linkparent = stuckto;
    data.deathoverridecallback = &function_65c63d1724f6b2a7;
    data.invalidparentoverridecallback = &function_246699c2be1e55c2;
    data.endonstring = "death";
    data.validateaccuratetouching = 1;
    
    if ( isdefined( stuckto ) && scripts\cp_mp\utility\train_utility::is_train_ent( stuckto ) )
    {
        data.var_49cb2c45d3230ed8 = 1;
        self function_7e73001e97fe87b9( 1 );
    }
    
    if ( issharedfuncdefined( "game", "handlemovingplatforms" ) )
    {
        self thread [[ getsharedfunc( "game", "handlemovingplatforms" ) ]]( data );
    }
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 0
// Checksum 0x0, Offset: 0x1c2e
// Size: 0x2c
function function_cdfda8cc0153b5d6()
{
    self endon( "death" );
    function_c13f96eaa3be2dab();
    
    if ( isdefined( self ) && !istrue( self.isdestroyed ) )
    {
        thread function_2850334505f6e7f7( 0 );
    }
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 0
// Checksum 0x0, Offset: 0x1c62
// Size: 0x81
function function_c13f96eaa3be2dab()
{
    self.owner endon( "disconnect" );
    self.owner endon( "joined_team" );
    self.owner endon( "joined_spectators" );
    level endon( "game_ended" );
    
    if ( isdefined( self.lifetime ) && self.lifetime > 0 )
    {
        if ( issharedfuncdefined( "hostmigration", "waitLongDurationWithPause" ) )
        {
            [[ getsharedfunc( "hostmigration", "waitLongDurationWithPause" ) ]]( self.lifetime );
        }
    }
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 1
// Checksum 0x0, Offset: 0x1ceb
// Size: 0x35
function function_91bbfcf9c145de2c( data )
{
    attacker = data.attacker;
    function_2bdf5e5dc8f22e66( attacker, 1 );
    thread function_2850334505f6e7f7( 0 );
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 1
// Checksum 0x0, Offset: 0x1d28
// Size: 0x33
function function_396418c8b2e4fc03( data )
{
    attacker = data.attacker;
    function_2bdf5e5dc8f22e66( attacker );
    thread function_2850334505f6e7f7( 0 );
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 0
// Checksum 0x0, Offset: 0x1d63
// Size: 0x5c
function function_69873580a9e98ea()
{
    foreach ( player in level.players )
    {
        if ( !isdefined( player ) )
        {
            return;
        }
        
        function_693a82b036cfba91( player );
    }
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 1
// Checksum 0x0, Offset: 0x1dc7
// Size: 0x10e
function function_693a82b036cfba91( player )
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( !isdefined( self.owner ) )
    {
        return;
    }
    
    if ( !isdefined( player ) )
    {
        return;
    }
    
    idbox = self.headiconbox;
    
    if ( !isdefined( idbox ) )
    {
        return;
    }
    
    idfaction = self.headiconfaction;
    
    if ( !isdefined( idfaction ) )
    {
        return;
    }
    
    if ( issharedfuncdefined( "player", "isFriendly" ) )
    {
        isfriendly = [[ getsharedfunc( "player", "isFriendly" ) ]]( self.owner.team, player );
        isused = isdefined( self.playersused ) && isdefined( self.playersused[ player getentitynumber() ] );
        
        if ( isfriendly && !isused )
        {
            scripts\cp_mp\entityheadicons::setheadicon_addclienttomask( idbox, player );
            scripts\cp_mp\entityheadicons::setheadicon_removeclientfrommask( idfaction, player );
            return;
        }
        
        if ( isfriendly )
        {
            scripts\cp_mp\entityheadicons::setheadicon_removeclientfrommask( idbox, player );
            scripts\cp_mp\entityheadicons::setheadicon_addclienttomask( idfaction, player );
            return;
        }
        
        scripts\cp_mp\entityheadicons::setheadicon_removeclientfrommask( idbox, player );
        scripts\cp_mp\entityheadicons::setheadicon_removeclientfrommask( idfaction, player );
    }
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 0
// Checksum 0x0, Offset: 0x1edd
// Size: 0x10
function function_71823b2e5023e827()
{
    return getanimlength( scriptables#wm_support_box_ground_open );
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 0
// Checksum 0x0, Offset: 0x1ef6
// Size: 0x10
function function_d3cc6eb39b0771f5()
{
    return getanimlength( scriptables#wm_support_box_ground_idle_open_use );
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 0
// Checksum 0x0, Offset: 0x1f0f
// Size: 0x10
function function_4868d9728ebf387a()
{
    return getanimlength( scriptables#wm_support_box_ground_close );
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 2
// Checksum 0x0, Offset: 0x1f28
// Size: 0x14e
function function_3122c424cb613711( entity, player )
{
    if ( istrue( player.isjuggernaut ) && !scripts\cp_mp\utility\game_utility::isbrstylegametype() )
    {
        if ( scripts\engine\utility::issharedfuncdefined( "hud", "showErrorMessage" ) )
        {
            player [[ scripts\engine\utility::getsharedfunc( "hud", "showErrorMessage" ) ]]( "KILLSTREAKS/JUGG_CANNOT_BE_USED" );
        }
        
        return;
    }
    
    if ( entity function_cb4fbeffb3529c7( player ) )
    {
        usesuccessful = 0;
        eventname = undefined;
        persstat = undefined;
        supername = undefined;
        
        if ( isdefined( entity.equipmentref ) )
        {
            eventname = #"hash_7ebcf978472ab1f4";
            persstat = "medBoxUsed";
            supername = "super_med_box";
            
            if ( getdvarint( @"hash_aab0b04330cc870b" ) >= 1 )
            {
                if ( !entity.var_f89ce82fc6abacd5 )
                {
                    thread function_708bb89e4bbfc40( entity, player );
                    entity.var_f89ce82fc6abacd5 = 1;
                }
            }
            
            player.var_908c151f034b37e8 = getdvarfloat( @"hash_f0fb5d0ed88ab0c1" );
            player thread function_58225ad9f963583d();
            usesuccessful = entity function_7a3ec75c9ecb32a( player );
            
            if ( usesuccessful )
            {
                entity.playersused[ player getentitynumber() ] = player;
                entity function_693a82b036cfba91( player );
                entity function_e2df8d98b73b2414( player, eventname, persstat, supername );
            }
        }
    }
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 1
// Checksum 0x0, Offset: 0x207e
// Size: 0x15
function function_49197cd063a740ea( callbackfunction )
{
    self.var_d1659ed0a33bf98f = callbackfunction;
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 0
// Checksum 0x0, Offset: 0x209b
// Size: 0x80
function function_58225ad9f963583d()
{
    self endon( "medBoxHealed" );
    
    if ( isdefined( self.var_908c151f034b37e8 ) )
    {
        self waittill( "death_or_disconnect" );
        self setscriptablepartstate( "medBoxVfx", "off", 0 );
        self.var_908c151f034b37e8 = undefined;
        self.var_7d5dc55c0e7c065b = undefined;
        
        if ( isdefined( self.var_808d06ddfc93a4e4 ) )
        {
            regendelay = getdvarfloat( @"hash_f7ec6896361f0e48" );
            scripts\cp_mp\playerhealth::function_5457f0107a845374( "battleRage_beginSuper", regendelay );
        }
        
        self notify( "medBoxHealed" );
    }
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 0
// Checksum 0x0, Offset: 0x2123
// Size: 0x1e
function function_6ed51e2f80c93fa6()
{
    self.var_7d5dc55c0e7c065b = undefined;
    self setscriptablepartstate( "medBoxVfx", "off", 0 );
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 0
// Checksum 0x0, Offset: 0x2149
// Size: 0x1f
function function_44ec1c3e385bd14b()
{
    self setscriptablepartstate( "medBoxVfx", "vfx_start", 0 );
    self.var_7d5dc55c0e7c065b = 1;
}

// Namespace med_box / scripts\cp_mp\supers\med_box
// Params 2
// Checksum 0x0, Offset: 0x2170
// Size: 0xe2
function function_708bb89e4bbfc40( grenade, player )
{
    teammates = scripts\cp_mp\utility\player_utility::getplayersinradius( grenade.origin, 600, player.team, player );
    
    foreach ( teammate in teammates )
    {
        if ( isalive( teammate ) )
        {
            teammate.var_908c151f034b37e8 = getdvarfloat( @"hash_f0fb5d0ed88ab0c1" );
            teammate thread function_58225ad9f963583d();
            usesuccessful = grenade function_7a3ec75c9ecb32a( teammate );
            
            if ( usesuccessful )
            {
                grenade.playersused[ teammate getentitynumber() ] = teammate;
                grenade function_693a82b036cfba91( teammate );
            }
        }
    }
}

