#using scripts\common\callbacks;
#using scripts\common\exploder;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\emp_debuff;
#using scripts\cp_mp\hostmigration;
#using scripts\cp_mp\killstreaks\killstreakdeploy;
#using scripts\cp_mp\utility\audio_utility;
#using scripts\cp_mp\utility\damage_utility;
#using scripts\cp_mp\utility\dialog_utility;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\cp_mp\utility\shellshock_utility;
#using scripts\cp_mp\utility\team_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\engine\utility;
#using scripts\killstreaks\emp;
#using scripts\killstreaks\killstreak_shared;
#using scripts\mp\objidpoolmanager;

#namespace emp;

// Namespace emp / scripts\killstreaks\emp
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x88a
// Size: 0x18
function autoexec main()
{
    function_df7ab5b0f898e8bc( function_1823ff50bb28148d( "emp" ), &init );
}

// Namespace emp / scripts\killstreaks\emp
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x8aa
// Size: 0xff
function private init()
{
    if ( issharedfuncdefined( "killstreak", "registerKillstreak" ) )
    {
        [[ getsharedfunc( "killstreak", "registerKillstreak" ) ]]( "emp", &tryuseemp );
    }
    
    if ( issharedfuncdefined( "emp", "init" ) )
    {
        [[ getsharedfunc( "emp", "init" ) ]]();
    }
    
    registersharedfunc( "emp", "setEMP_Applied_Callback", &setemp_applied_callback );
    registersharedfunc( "emp", "setEMP_Started_Callback", &setemp_started_callback );
    registersharedfunc( "emp", "setEMP_Cleared_Callback", &setemp_cleared_callback );
    registersharedfunc( "emp", "setEMP_Cleared_callback", &watch_checkforlauncherweapons );
    function_a4f524ed48312204();
    level.var_2c73f3bef5a3079 = [];
    level.var_c75aa35bb2f6a4e2 = [];
    level._effect[ "emp_shockwave" ] = loadfx( "vfx/iw8_mp/perk/vfx_emp_drone_exp_fieldupgrades.vfx" );
    level._effect[ "predator_pod_break" ] = loadfx( "vfx/iw8_mp/killstreak/vfx_cruise_predator_explosion.vfx" );
}

// Namespace emp / scripts\killstreaks\emp
// Params 0
// Checksum 0x0, Offset: 0x9b1
// Size: 0x1b
function function_a4f524ed48312204()
{
    game[ "dialog" ][ "emp_use" ] = "killstreak_remote_operator" + "_request_response";
}

// Namespace emp / scripts\killstreaks\emp
// Params 1
// Checksum 0x0, Offset: 0x9d4
// Size: 0x25, Type: bool
function tryuseemp( streakinfo )
{
    if ( !isdefined( streakinfo ) )
    {
        streakinfo = createstreakinfo( "emp", self );
    }
    
    return tryuseempfromstruct( streakinfo );
}

// Namespace emp / scripts\killstreaks\emp
// Params 1
// Checksum 0x0, Offset: 0xa02
// Size: 0x1fc, Type: bool
function tryuseempfromstruct( streakinfo )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    
    if ( isdefined( level.var_2c73f3bef5a3079[ self.team ] ) )
    {
        if ( level.var_2c73f3bef5a3079[ self.team ] > 0 )
        {
            if ( issharedfuncdefined( "hud", "showErrorMessage" ) )
            {
                [[ getsharedfunc( "hud", "showErrorMessage" ) ]]( "KILLSTREAKS/FRIENDLY_EMP_ACTIVE" );
            }
            
            return false;
        }
    }
    
    if ( isdefined( level.killstreaktriggeredfunc ) )
    {
        if ( !level [[ level.killstreaktriggeredfunc ]]( streakinfo ) )
        {
            return false;
        }
    }
    
    deployresult = scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_dogesturedeploy( streakinfo, makeweapon( "ks_gesture_phone_mp" ) );
    
    if ( !istrue( deployresult ) )
    {
        return false;
    }
    
    if ( isdefined( level.killstreakbeginusefunc ) )
    {
        if ( !level [[ level.killstreakbeginusefunc ]]( streakinfo ) )
        {
            return false;
        }
    }
    
    if ( isplayer( self ) )
    {
        if ( issharedfuncdefined( "sound", "playKillstreakDeployDialog" ) )
        {
            [[ getsharedfunc( "sound", "playKillstreakDeployDialog" ) ]]( self, streakinfo.streakname );
            var_52a5be2e2f91d710 = 2.5;
        }
        
        thread playkillstreakoperatordialog( streakinfo.streakname, streakinfo.streakname + "_use", 1, var_52a5be2e2f91d710 );
    }
    
    if ( issharedfuncdefined( "hud", "teamPlayerCardSplash" ) )
    {
        self thread [[ getsharedfunc( "hud", "teamPlayerCardSplash" ) ]]( "used_" + streakinfo.streakname, self );
        
        if ( isdefined( level.var_2c73f3bef5a3079[ self.team ] ) )
        {
            level.var_2c73f3bef5a3079[ self.team ]++;
        }
        else if ( !isdefined( level.var_2c73f3bef5a3079[ self.team ] ) )
        {
            level.var_2c73f3bef5a3079[ self.team ] = 1;
        }
    }
    
    result = function_3f5928ab9073266c( streakinfo );
    function_f1aed36ab4598ea( "kls_jup_emp" );
    return true;
}

// Namespace emp / scripts\killstreaks\emp
// Params 1
// Checksum 0x0, Offset: 0xc07
// Size: 0x2fd
function function_3f5928ab9073266c( streakinfo )
{
    heightent = scripts\cp_mp\utility\killstreak_utility::getkillstreakairstrikeheightent();
    heightoffset = 6000;
    horizontaloffset = 8000;
    targetoffset = 5000;
    spawncenterpos = level.mapcenter;
    bundle = level.streakglobals.streakbundles[ "emp" ];
    
    if ( istrue( bundle.var_602f50872af4ba48 ) )
    {
        spawncenterpos = self.origin;
        horizontaloffset = 400;
    }
    
    forwardvector = anglestoforward( ( 0, randomint( 360 ), 0 ) );
    additionaltargetoffset = ( 0, horizontaloffset, heightoffset );
    
    switch ( randomint( 8 ) )
    {
        case 1:
            additionaltargetoffset = ( horizontaloffset, 0, heightoffset );
            break;
        case 2:
            additionaltargetoffset = ( 0, horizontaloffset, heightoffset );
            break;
        case 3:
            additionaltargetoffset = ( horizontaloffset / 2, horizontaloffset / 2, heightoffset );
            break;
        case 4:
            additionaltargetoffset = ( -1 * horizontaloffset, 0, heightoffset );
            break;
        case 5:
            additionaltargetoffset = ( 0, -1 * horizontaloffset, heightoffset );
            break;
        case 6:
            additionaltargetoffset = ( -1 * horizontaloffset / 2, -1 * horizontaloffset / 2, heightoffset );
            break;
        case 7:
            additionaltargetoffset = ( -1 * horizontaloffset / 2, horizontaloffset / 2, heightoffset );
            break;
        case 8:
            additionaltargetoffset = ( horizontaloffset / 2, -1 * horizontaloffset / 2, heightoffset );
            break;
        default:
            additionaltargetoffset = ( 0, horizontaloffset, heightoffset );
            break;
    }
    
    targetpos = spawncenterpos + ( 0, 0, targetoffset );
    missileoffset = targetpos + additionaltargetoffset;
    startpos = missileoffset - forwardvector * 3000;
    missilepod = spawn( "script_model", startpos );
    missilepod setmodel( "wmd_vm_missile_cruise_mp" );
    missilepod.owner = self;
    missilepod.origin = startpos;
    missilepod.angles = vectortoangles( targetpos - startpos );
    missilepod.type = "remote";
    missilepod.team = self.team;
    missilepod.entitynumber = missilepod getentitynumber();
    missilepod.streakinfo = streakinfo;
    missilepod.duration = 30;
    missilepod.animstate = "pod_flying";
    self.restoreangles = self.angles;
    level.rockets[ missilepod.entitynumber ] = missilepod;
    level.remotemissileinprogress = 1;
    result = function_4fa820930b2857d6( missilepod, targetpos, streakinfo );
    return result;
}

// Namespace emp / scripts\killstreaks\emp
// Params 3
// Checksum 0x0, Offset: 0xf0d
// Size: 0x1b2, Type: bool
function function_4fa820930b2857d6( pod, breakpos, streakinfo )
{
    var_7b7bc27e7e8b05e2 = get_notetrack_time( script_model#mp_cruise_missile_move_intro, "wingtrails" );
    var_2cf1418bd3474069 = get_notetrack_time( script_model#mp_cruise_missile_move_intro, "shell_break" );
    var_9e0fa77c44b24bf9 = get_notetrack_time( script_model#mp_cruise_missile_move_intro, "second_missile_thruster" );
    var_6431d9c900610f5b = get_notetrack_time( script_model#mp_cruise_missile_move_intro, "anim_end" );
    stage1delay = var_7b7bc27e7e8b05e2;
    stage2delay = var_2cf1418bd3474069 - var_7b7bc27e7e8b05e2;
    stage3delay = var_9e0fa77c44b24bf9 - var_2cf1418bd3474069;
    stage4delay = var_6431d9c900610f5b - var_9e0fa77c44b24bf9;
    podmoveanim = "mp_cruise_missile_move_intro";
    pod scriptmodelplayanimdeltamotion( podmoveanim );
    pod setscriptablepartstate( "main_emp_thruster", "on", 0 );
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause( stage1delay );
    pod setscriptablepartstate( "wing_trails", "on" );
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause( stage2delay );
    pod.animstate = "pod_break";
    pod setscriptablepartstate( "wing_trails", "off" );
    pod setscriptablepartstate( "main_emp_thruster", "off", 0 );
    playfxontag( getfx( "predator_pod_break" ), pod, "tag_missile" );
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause( stage3delay );
    pod.animstate = "missile_thrusters";
    pod setscriptablepartstate( "sub_thruster", "on", 0 );
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause( stage4delay - 0.05 );
    thread function_861e303c08602058( pod, streakinfo, breakpos );
    return true;
}

// Namespace emp / scripts\killstreaks\emp
// Params 3
// Checksum 0x0, Offset: 0x10c8
// Size: 0x230
function function_861e303c08602058( pod, streakinfo, targetpos )
{
    pod endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    pod setscriptablepartstate( "sub_thruster", "off", 0 );
    missile = spawn( "script_model", pod gettagorigin( "tag_missile" ) );
    missile.angles = pod.angles;
    missile setmodel( "wmd_vm_missile_cruise_warhead_mp" );
    missile.team = self.team;
    missile.streakinfo = streakinfo;
    missile.owner = self;
    missile.lifetime = 10;
    missile.weapon_name = "cruise_proj_mp";
    streakinfo.shots_fired++;
    missile setscriptablepartstate( "warhead_emp_thruster", "on", 0 );
    missile thread function_ecc8ce9e6c65dae6();
    missile thread function_f292f763187b6ac5();
    missile endon( "death" );
    fxent = spawn( "script_model", missile gettagorigin( "tag_fx" ) );
    fxent setmodel( "ks_cruise_predator_mp" );
    fxent.angles = missile gettagangles( "tag_fx" );
    fxent.team = missile.team;
    fxent.owner = missile.owner;
    fxent.streakinfo = missile.streakinfo;
    fxent linkto( missile, "tag_fx" );
    fxent setscriptablepartstate( "fake_trail_emp", "on", 0 );
    fxent setotherent( self );
    fxent thread function_11126110d38cf99e( missile, streakinfo );
    fxent thread function_7750c53508718dbd( missile );
    fxent thread function_9d55bde0bcef1158( missile );
    missile thread function_9814fc51454dfe88( "disconnect" );
    missile thread function_9814fc51454dfe88( "joined_team" );
    missile thread function_9814fc51454dfe88( "joined_spectators" );
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause( 0.05 );
    missile thread function_6c9d4dd877455600( self );
    missile thread function_76178b6493ecf6d7( self, targetpos );
    waitframe();
    
    if ( isdefined( pod ) )
    {
        pod delete();
    }
}

// Namespace emp / scripts\killstreaks\emp
// Params 0
// Checksum 0x0, Offset: 0x1300
// Size: 0x122
function function_ecc8ce9e6c65dae6()
{
    if ( scripts\engine\utility::issharedfuncdefined( "game", "requestObjectiveID" ) )
    {
        objid = [[ scripts\engine\utility::getsharedfunc( "game", "requestObjectiveID" ) ]]( 99 );
        self.var_49be89641b10a107 = objid;
        scripts\mp\objidpoolmanager::objective_add_objective( objid, "active", self.origin, "hud_icon_minimap_killstreak_cruise_missile", "icon_medium" );
        scripts\mp\objidpoolmanager::objective_set_play_intro( objid, 0 );
        scripts\mp\objidpoolmanager::objective_set_play_outro( objid, 0 );
        
        foreach ( player in level.players )
        {
            if ( !isdefined( player ) || isbot( player ) || player == self )
            {
                continue;
            }
            
            scripts\mp\objidpoolmanager::objective_playermask_addshowplayer( objid, player );
        }
        
        scripts\mp\objidpoolmanager::update_objective_onentitywithrotation( objid, self );
        scripts\mp\objidpoolmanager::update_objective_setbackground( objid, 1 );
        
        if ( level.teambased )
        {
            scripts\mp\objidpoolmanager::update_objective_ownerteam( objid, self.team );
            return;
        }
        
        scripts\mp\objidpoolmanager::update_objective_ownerclient( objid, self.owner );
    }
}

// Namespace emp / scripts\killstreaks\emp
// Params 0
// Checksum 0x0, Offset: 0x142a
// Size: 0x42
function function_f292f763187b6ac5()
{
    destpoint = self.origin + anglestoforward( self.angles ) * 50000;
    missilemovetime = 16.6667;
    self moveto( destpoint, missilemovetime );
}

// Namespace emp / scripts\killstreaks\emp
// Params 2
// Checksum 0x0, Offset: 0x1474
// Size: 0x6e
function function_76178b6493ecf6d7( rider, targetpos )
{
    self endon( "death" );
    rider endon( "disconnect" );
    level endon( "game_ended" );
    
    while ( true )
    {
        var_1d9b2df64a70f35a = self gettagorigin( "tag_missile" );
        var_7a7468a3f3fd54b = distancesquared( targetpos, var_1d9b2df64a70f35a );
        
        if ( var_7a7468a3f3fd54b <= 10000 )
        {
            self notify( "explode" );
            break;
        }
        
        waitframe();
    }
}

// Namespace emp / scripts\killstreaks\emp
// Params 2
// Checksum 0x0, Offset: 0x14ea
// Size: 0x5d
function function_11126110d38cf99e( missile, streakinfo )
{
    missile endon( "death" );
    missile endon( "cruise_missile_explode" );
    self endon( "death" );
    self.owner endon( "disconnect" );
    level waittill_any_2( "start_game_ended", "game_ended" );
    missile notify( "cruise_missile_force_eject" );
    
    if ( isdefined( missile ) )
    {
        missile delete();
    }
}

// Namespace emp / scripts\killstreaks\emp
// Params 1
// Checksum 0x0, Offset: 0x154f
// Size: 0x43
function function_7750c53508718dbd( missile )
{
    self endon( "death" );
    
    while ( true )
    {
        self.missilelastpos = missile.origin;
        self.missilelastangle = missile.angles;
        waitframe();
    }
}

// Namespace emp / scripts\killstreaks\emp
// Params 1
// Checksum 0x0, Offset: 0x159a
// Size: 0x225
function function_9d55bde0bcef1158( missile )
{
    missile endon( "cruise_missile_force_eject" );
    explodepos = undefined;
    missileangles = undefined;
    streakinfo = missile.streakinfo;
    explodeinfo = undefined;
    
    while ( true )
    {
        explodeinfo = missile function_db4cffecf38064e7( "collision", "explode", "death", "disowned", "emp_defused", "trophy_blocked" );
        
        if ( isdefined( explodeinfo.msg ) && explodeinfo.msg == "collision" )
        {
            surface = physics_getsurfacetypefromflags( explodeinfo.param4 );
            surfacetype = getsubstr( surface[ "name" ], 9 );
            collisiondebug = getdvarint( @"hash_b1fa07a51b801b6b", 0 );
            
            /#
                if ( collisiondebug )
                {
                    iprintln( "<dev string:x1c>" + surfacetype );
                    continue;
                }
            #/
            
            if ( surfacetype == "glass_pane" )
            {
                continue;
            }
        }
        
        break;
    }
    
    if ( isdefined( missile ) )
    {
        missile setscriptablepartstate( "warhead_emp_thruster", "off", 0 );
        missile notify( "cruise_missile_explode" );
        scripts\engine\utility::function_f3bb4f4911a1beb2( "game", "returnObjectiveID", missile.var_49be89641b10a107 );
    }
    
    if ( isdefined( self ) )
    {
        self setscriptablepartstate( "fake_trail_emp", "off", 0 );
        explodepos = self.missilelastpos;
        missileangles = self.missilelastangle;
        
        if ( isdefined( missile ) )
        {
            missile delete();
        }
        
        if ( !isdefined( explodeinfo ) || explodeinfo.msg != "emp_defused" && explodeinfo.msg != "trophy_blocked" )
        {
            explosionradius = 600;
            var_5d28f39073721e59 = "MOD_EXPLOSIVE";
            var_23f8c678bd9d023e = "cruise_proj_mp";
        }
        
        if ( issharedfuncdefined( "shellshock", "artillery_earthQuake" ) )
        {
            [[ getsharedfunc( "shellshock", "artillery_earthQuake" ) ]]( explodepos );
        }
        
        thread function_d09b046309c9310( explodeinfo, missile.owner, streakinfo );
    }
}

// Namespace emp / scripts\killstreaks\emp
// Params 6
// Checksum 0x0, Offset: 0x17c7
// Size: 0x1a5
function function_db4cffecf38064e7( var_e127af0eab592c1a, var_e127ae0eab5929e7, var_e127ad0eab5927b4, var_e127ac0eab592581, var_e127ab0eab59234e, var_e127aa0eab59211b )
{
    ent = spawnstruct();
    
    if ( isdefined( var_e127af0eab592c1a ) )
    {
        thread waittill_explodestring( var_e127af0eab592c1a, ent );
    }
    
    if ( isdefined( var_e127ae0eab5929e7 ) )
    {
        thread waittill_explodestring( var_e127ae0eab5929e7, ent );
    }
    
    if ( isdefined( var_e127ad0eab5927b4 ) )
    {
        thread waittill_explodestring( var_e127ad0eab5927b4, ent );
    }
    
    if ( isdefined( var_e127ac0eab592581 ) )
    {
        thread waittill_explodestring( var_e127ac0eab592581, ent );
    }
    
    if ( isdefined( var_e127ab0eab59234e ) )
    {
        thread waittill_explodestring( var_e127ab0eab59234e, ent );
    }
    
    if ( isdefined( var_e127aa0eab59211b ) )
    {
        thread waittill_explodestring( var_e127aa0eab59211b, ent );
    }
    
    ent waittill( "returned", msg, param1, param2, param3, param4, param5, param6, param7, param8 );
    ent notify( "die" );
    explodeinfo = spawnstruct();
    explodeinfo.msg = msg;
    explodeinfo.param1 = param1;
    explodeinfo.param2 = param2;
    explodeinfo.param3 = param3;
    explodeinfo.param4 = param4;
    explodeinfo.param5 = param5;
    explodeinfo.param6 = param6;
    explodeinfo.param7 = param7;
    explodeinfo.param8 = param8;
    return explodeinfo;
}

// Namespace emp / scripts\killstreaks\emp
// Params 2
// Checksum 0x0, Offset: 0x1975
// Size: 0x76
function waittill_explodestring( msg, ent )
{
    self endon( "death" );
    ent endon( "die" );
    self waittill( msg, param1, param2, param3, param4, param5, param6 );
    ent notify( "returned", msg, param1, param2, param3, param4, param5, param6 );
}

// Namespace emp / scripts\killstreaks\emp
// Params 0
// Checksum 0x0, Offset: 0x19f3
// Size: 0xc
function function_597149e92e028cc()
{
    exploder( 777 );
}

// Namespace emp / scripts\killstreaks\emp
// Params 3
// Checksum 0x0, Offset: 0x1a07
// Size: 0x16d
function function_d09b046309c9310( explodeinfo, owner, streakinfo )
{
    self endon( "death" );
    self unlink();
    
    if ( !isdefined( explodeinfo ) || explodeinfo.msg == "explode" || explodeinfo.msg == "disowned" || explodeinfo.msg == "emp_defused" || explodeinfo.msg == "trophy_blocked" )
    {
        self setscriptablepartstate( "emp_air_explosion", "on", 0 );
        scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause( 0.2 );
        owner thread function_ef236a24af5b02ee();
        owner applyemp( self.origin, streakinfo );
        self delete();
    }
    
    worldup = ( 0, 0, 1 );
    surfacenormal = explodeinfo.param6;
    self.angles = vectortoangles( surfacenormal );
    angledirection = vectordot( surfacenormal, worldup );
    
    if ( angledirection >= 0.7 )
    {
        self setscriptablepartstate( "emp_ground_explosion", "on", 0 );
    }
    else
    {
        self setscriptablepartstate( "emp_air_explosion", "on", 0 );
    }
    
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause( 1 );
    owner thread function_ef236a24af5b02ee();
    owner applyemp( self.origin, streakinfo );
    self delete();
}

// Namespace emp / scripts\killstreaks\emp
// Params 0
// Checksum 0x0, Offset: 0x1b7c
// Size: 0x82
function function_ef236a24af5b02ee()
{
    var_da8cec9bce12f9cb = self.pers[ "team" ];
    characterref = function_d3c62d251d2af8e6( var_da8cec9bce12f9cb );
    character = scripts\cp_mp\utility\dialog_utility::function_309f1876dda94360( "Character", characterref );
    dialogalias = "dx_mp_core_anno_" + character + "_cege";
    self queuedialogforplayer( dialogalias, "emp_detonated", 1 );
    self.currentkillstreakopvo = "emp_detonated";
    thread clearstoredkillstreakoperatordialog( 5 );
}

// Namespace emp / scripts\killstreaks\emp
// Params 1
// Checksum 0x0, Offset: 0x1c06
// Size: 0x41
function function_9814fc51454dfe88( action )
{
    self endon( "death" );
    self endon( "disowned" );
    level endon( "game_ended" );
    missileowner = self.owner;
    missileowner waittill( action );
    self notify( "disowned" );
}

// Namespace emp / scripts\killstreaks\emp
// Params 0
// Checksum 0x0, Offset: 0x1c4f
// Size: 0x31
function function_43bec35d6ecff18b()
{
    self endon( "death" );
    self endon( "cruise_missile_explode" );
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause( 0.75 );
    self vehphys_enablecollisioncallback( 1 );
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause( 1.25 );
}

// Namespace emp / scripts\killstreaks\emp
// Params 1
// Checksum 0x0, Offset: 0x1c88
// Size: 0x2f
function function_6c9d4dd877455600( rider )
{
    self endon( "death" );
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause( 500.1 );
    self notify( "explode", self.origin );
}

// Namespace emp / scripts\killstreaks\emp
// Params 3
// Checksum 0x0, Offset: 0x1cbf
// Size: 0x54
function function_43755e1816ee895b( scriptable, empcallback, reactivatefunc )
{
    scriptable scripts\cp_mp\emp_debuff::set_apply_emp_callback( empcallback );
    scriptable.var_3545410459b16762 = empcallback;
    scriptable.reactivatefunc = reactivatefunc;
    level.var_c75aa35bb2f6a4e2[ level.var_c75aa35bb2f6a4e2.size ] = scriptable;
}

// Namespace emp / scripts\killstreaks\emp
// Params 2
// Checksum 0x0, Offset: 0x1d1b
// Size: 0x297
function applyemp( explodelocation, streakinfo )
{
    level endon( "game_ended" );
    myteam = self.team;
    enemyplayers = getenemyplayers( myteam, 1 );
    empduration = 45;
    
    /#
        empduration = getdvarfloat( @"hash_35492017c44a48a5", 45 );
    #/
    
    bundle = level.streakglobals.streakbundles[ "emp" ];
    
    if ( istrue( bundle.var_602f50872af4ba48 ) )
    {
        thread function_429c035df406caf8( explodelocation, empduration );
    }
    
    if ( isdefined( enemyplayers ) )
    {
        if ( istrue( bundle.var_602f50872af4ba48 ) )
        {
            emprange = default_to( bundle.var_34716d4fdcd275ed, 3000 );
            var_388aeb1962fad84a = emprange * emprange;
            closeenemies = [];
            
            foreach ( enemy in enemyplayers )
            {
                if ( !isdefined( enemy ) )
                {
                    continue;
                }
                
                if ( distance_2d_squared( explodelocation, enemy.origin ) < var_388aeb1962fad84a )
                {
                    closeenemies[ closeenemies.size ] = enemy;
                }
            }
            
            enemyplayers = closeenemies;
        }
        
        foreach ( enemy in enemyplayers )
        {
            enemy thread applyempplayer( enemy.team, self, explodelocation );
            
            if ( !istrue( bundle.var_602f50872af4ba48 ) )
            {
                thread function_a488516398cf6ae3( enemy.team, self, explodelocation, empduration );
            }
        }
        
        wait empduration;
        
        foreach ( enemy in enemyplayers )
        {
            enemy thread function_33b7f0d067af5e39();
            
            if ( !istrue( bundle.var_602f50872af4ba48 ) )
            {
                thread function_dc8d8685a0b3a582( enemy.team, self, explodelocation, empduration );
            }
        }
    }
    
    scripts\cp_mp\utility\killstreak_utility::recordkillstreakendstats( streakinfo );
    level.var_2c73f3bef5a3079[ self.team ]--;
    
    if ( level.var_2c73f3bef5a3079[ self.team ] <= 0 )
    {
        level.var_2c73f3bef5a3079[ self.team ] = undefined;
    }
}

// Namespace emp / scripts\killstreaks\emp
// Params 2
// Checksum 0x0, Offset: 0x1fba
// Size: 0x8d
function function_429c035df406caf8( explodelocation, empduration )
{
    bundle = level.streakglobals.streakbundles[ "emp" ];
    assert( istrue( bundle.var_602f50872af4ba48 ) );
    emprange = default_to( bundle.var_34716d4fdcd275ed, 3000 );
    activeobjects = function_a488516398cf6ae3( undefined, self, explodelocation, empduration, emprange );
    wait empduration;
    function_e0c2272bd4e5c0f( activeobjects, self, explodelocation, empduration );
}

// Namespace emp / scripts\killstreaks\emp
// Params 5
// Checksum 0x0, Offset: 0x204f
// Size: 0x9f3
function function_a488516398cf6ae3( victimteam, attacker, explodelocation, empduration, emprange )
{
    var_6c845d64be969ce8 = level.activekillstreaks;
    equipmentarray = [[ level.getactiveequipmentarray ]]();
    var_5b037ec7465246f3 = undefined;
    
    if ( isdefined( victimteam ) )
    {
        var_5b037ec7465246f3 = level.var_d381da74cc527ec5[ "tacticalCameraList" ][ victimteam ];
    }
    
    var_dec749c32138b943 = level.recondronesupers;
    var_20e441421ce5b1cb = level.mines;
    var_6416b99a514e17ee = level.allsupportboxes;
    vehiclearray = level.vehicle.interact.vehicles;
    var_60ee6fb3ef15a69c = level.trackers;
    objweapon = makeweapon( "emp" );
    activeobjects = [];
    
    if ( isdefined( var_6c845d64be969ce8 ) )
    {
        activeobjects = array_combine_unique( activeobjects, var_6c845d64be969ce8 );
    }
    
    if ( isdefined( equipmentarray ) )
    {
        activeobjects = array_combine_unique( activeobjects, equipmentarray );
    }
    
    if ( isdefined( var_5b037ec7465246f3 ) )
    {
        activeobjects = array_combine_unique( activeobjects, var_5b037ec7465246f3 );
    }
    
    if ( isdefined( var_dec749c32138b943 ) )
    {
        activeobjects = array_combine_unique( activeobjects, var_dec749c32138b943 );
    }
    
    if ( isdefined( var_20e441421ce5b1cb ) )
    {
        activeobjects = array_combine_unique( activeobjects, var_20e441421ce5b1cb );
    }
    
    if ( isdefined( var_6416b99a514e17ee ) )
    {
        activeobjects = array_combine_unique( activeobjects, var_6416b99a514e17ee );
    }
    
    if ( isdefined( vehiclearray ) )
    {
        activeobjects = array_combine_unique( activeobjects, vehiclearray );
    }
    
    if ( isdefined( var_60ee6fb3ef15a69c ) )
    {
        activeobjects = array_combine_unique( activeobjects, var_60ee6fb3ef15a69c );
    }
    
    if ( !isdefined( victimteam ) )
    {
        foreach ( team in level.teamnamelist )
        {
            if ( team != attacker.team )
            {
                activeobjects = array_combine_unique( activeobjects, level.var_d381da74cc527ec5[ "tacticalCameraList" ][ team ] );
            }
        }
    }
    
    if ( isdefined( level.holdprop ) && istrue( level.holdprop.canemp ) )
    {
        foreach ( stronghold in level.var_f1073fbd45b59a06.var_df987907a483df89 )
        {
            if ( isdefined( stronghold.task.holdpoint ) )
            {
                activeobjects[ activeobjects.size ] = stronghold.task.holdpoint.trigger;
            }
        }
    }
    
    if ( istrue( level.var_684d782689230a50 ) )
    {
        foreach ( towerstruct in level.uavtowers )
        {
            if ( isdefined( towerstruct ) && isdefined( towerstruct.uav_station ) )
            {
                activeobjects[ activeobjects.size ] = towerstruct.uav_station;
            }
        }
    }
    
    if ( istrue( level.var_3976c9c03dc06d9b ) )
    {
        if ( isdefined( level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c ) )
        {
            foreach ( drone in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c )
            {
                if ( !istrue( drone.b_occupied ) )
                {
                    continue;
                }
                
                activeobjects[ activeobjects.size ] = drone;
            }
        }
        
        if ( isdefined( level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c ) )
        {
            foreach ( var_35c58d03684416f7 in level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c )
            {
                activeobjects[ activeobjects.size ] = var_35c58d03684416f7;
            }
        }
    }
    
    if ( isdefined( level.deployablekiosks ) && istrue( level.deployablekiosks.var_8bf814f9559f53 ) )
    {
        if ( isdefined( level.deployablekiosks.drones ) )
        {
            foreach ( drone in level.deployablekiosks.drones )
            {
                activeobjects[ activeobjects.size ] = drone;
            }
        }
    }
    
    if ( isdefined( level.deployablekiosks ) && istrue( level.deployablekiosks.var_aaa31c1e28a5663c ) )
    {
        if ( isdefined( level.deployablekiosks.buystations ) )
        {
            foreach ( buystation in level.deployablekiosks.buystations )
            {
                activeobjects[ activeobjects.size ] = buystation;
            }
        }
    }
    
    if ( isdefined( level.spydrones ) && isdefined( level.spydrones.vehiclename ) && level.spydrones.vehiclename != "" && istrue( level.spydrones.var_4e9df5e4d1c7d66f ) )
    {
        if ( isdefined( level.vehicle ) && isdefined( level.vehicle.instances ) && isdefined( level.vehicle.instances[ level.spydrones.vehiclename ] ) )
        {
            foreach ( spy_drone in level.vehicle.instances[ level.spydrones.vehiclename ] )
            {
                if ( isdefined( spy_drone ) )
                {
                    activeobjects[ activeobjects.size ] = spy_drone;
                }
            }
        }
    }
    
    if ( isdefined( level.var_c75aa35bb2f6a4e2 ) )
    {
        activeobjects = array_combine_unique( activeobjects, level.var_c75aa35bb2f6a4e2 );
    }
    
    if ( isdefined( activeobjects ) )
    {
        if ( isdefined( emprange ) )
        {
            var_388aeb1962fad84a = emprange * emprange;
            tempobjects = [];
            
            foreach ( object in activeobjects )
            {
                if ( !isdefined( object ) )
                {
                    continue;
                }
                
                if ( distance_2d_squared( explodelocation, object.origin ) < var_388aeb1962fad84a )
                {
                    tempobjects[ tempobjects.size ] = object;
                }
            }
            
            activeobjects = tempobjects;
        }
        
        foreach ( object in activeobjects )
        {
            if ( isdefined( object ) )
            {
                if ( isdefined( object.team ) )
                {
                    if ( object.team == attacker.team )
                    {
                        continue;
                    }
                }
                
                if ( isdefined( object.ownerteam ) )
                {
                    if ( object.ownerteam == attacker.team )
                    {
                        continue;
                    }
                }
                
                if ( isdefined( object.towerstruct ) && isdefined( object.towerstruct.uav_station ) )
                {
                    if ( isdefined( object.towerstruct.uav_station.activeteam ) && istrue( object.towerstruct.uav_station.activeteam == attacker.team ) )
                    {
                        continue;
                    }
                }
                
                if ( isdefined( object.stronghold ) && isdefined( object.stronghold.capturedteam ) )
                {
                    if ( istrue( object.stronghold.capturedteam == attacker.team ) )
                    {
                        continue;
                    }
                }
                
                if ( isdefined( object.var_3545410459b16762 ) )
                {
                    data = packdamagedata( attacker, object, 1, objweapon, "MOD_EXPLOSIVE", attacker, explodelocation );
                    data.time = empduration;
                    data.reason = "EMP_KS";
                    object thread [[ object.var_3545410459b16762 ]]( data );
                    object notify( "emp_started" );
                    
                    if ( !isdefined( object.var_5d67315cdcf62026 ) )
                    {
                        if ( isdefined( object.empcount ) )
                        {
                            object.empcount++;
                        }
                        else
                        {
                            object.empcount = 1;
                        }
                        
                        object.ksempd = 1;
                    }
                }
                
                if ( isdefined( object.var_5d67315cdcf62026 ) )
                {
                    data = packdamagedata( attacker, object, 1, objweapon, "MOD_EXPLOSIVE", attacker, explodelocation );
                    data.ksemp = 1;
                    object thread [[ object.var_5d67315cdcf62026 ]]( data );
                    object notify( "emp_applied" );
                    
                    if ( isdefined( object.empcount ) )
                    {
                        object.empcount++;
                    }
                    else
                    {
                        object.empcount = 1;
                    }
                    
                    object.ksempd = 1;
                }
            }
        }
    }
    
    return activeobjects;
}

// Namespace emp / scripts\killstreaks\emp
// Params 4
// Checksum 0x0, Offset: 0x2a4b
// Size: 0x155
function function_dc8d8685a0b3a582( victimteam, attacker, explodelocation, empduration )
{
    var_6c845d64be969ce8 = level.activekillstreaks;
    equipmentarray = [[ level.getactiveequipmentarray ]]();
    
    if ( isdefined( victimteam ) )
    {
        var_5b037ec7465246f3 = level.var_d381da74cc527ec5[ "tacticalCameraList" ][ victimteam ];
    }
    
    var_dec749c32138b943 = level.recondronesupers;
    var_20e441421ce5b1cb = level.mines;
    var_6416b99a514e17ee = level.allsupportboxes;
    vehiclearray = level.vehicle.interact.vehicles;
    activeobjects = [];
    
    if ( isdefined( var_6c845d64be969ce8 ) )
    {
        activeobjects = array_combine_unique( activeobjects, var_6c845d64be969ce8 );
    }
    
    if ( isdefined( equipmentarray ) )
    {
        activeobjects = array_combine_unique( activeobjects, equipmentarray );
    }
    
    if ( isdefined( var_5b037ec7465246f3 ) )
    {
        activeobjects = array_combine_unique( activeobjects, var_5b037ec7465246f3 );
    }
    
    if ( isdefined( var_dec749c32138b943 ) )
    {
        activeobjects = array_combine_unique( activeobjects, var_dec749c32138b943 );
    }
    
    if ( isdefined( var_20e441421ce5b1cb ) )
    {
        activeobjects = array_combine_unique( activeobjects, var_20e441421ce5b1cb );
    }
    
    if ( isdefined( var_6416b99a514e17ee ) )
    {
        activeobjects = array_combine_unique( activeobjects, var_6416b99a514e17ee );
    }
    
    if ( isdefined( vehiclearray ) )
    {
        activeobjects = array_combine_unique( activeobjects, vehiclearray );
    }
    
    function_e0c2272bd4e5c0f( activeobjects, attacker, explodelocation, empduration );
}

// Namespace emp / scripts\killstreaks\emp
// Params 4
// Checksum 0x0, Offset: 0x2ba8
// Size: 0xf9
function function_e0c2272bd4e5c0f( activeobjects, attacker, explodelocation, empduration )
{
    if ( isdefined( activeobjects ) )
    {
        objweapon = makeweapon( "emp" );
        
        foreach ( object in activeobjects )
        {
            if ( object scripts\cp_mp\emp_debuff::is_empd() || istrue( object.ksempd ) )
            {
                if ( isdefined( object.var_2ba749157b05bad7 ) )
                {
                    data = packdamagedata( attacker, object, 1, objweapon, "MOD_EXPLOSIVE", attacker, explodelocation );
                    object thread [[ object.var_2ba749157b05bad7 ]]( data );
                }
                
                object.empcount = undefined;
                object.ksempd = undefined;
                object notify( "emp_cleared" );
            }
        }
    }
}

// Namespace emp / scripts\killstreaks\emp
// Params 3
// Checksum 0x0, Offset: 0x2ca9
// Size: 0x123
function applyempplayer( victimteam, attacker, explodelocation )
{
    if ( issharedfuncdefined( "perk", "hasPerk" ) && ( self [[ getsharedfunc( "perk", "hasPerk" ) ]]( "specialty_emp_immunity" ) || self [[ getsharedfunc( "perk", "hasPerk" ) ]]( "specialty_empimmune" ) ) )
    {
        return;
    }
    
    objweapon = makeweapon( "emp" );
    empdata = packdamagedata( attacker, self, 1, objweapon, "MOD_EXPLOSIVE", attacker, explodelocation );
    self.var_5c079aa1be2b9bb = empdata;
    
    if ( isdefined( self.empcount ) )
    {
        self.empcount++;
        self.ksempd = 1;
    }
    else
    {
        self.ksempd = 1;
        self.empcount = 1;
    }
    
    self notify( "emp_started" );
    self notify( "emp_applied" );
    thread function_377c97bfdd963952();
    thread watch_checkforlauncherweapons();
    thread function_9196f8b48901a902( attacker );
    
    if ( isdefined( self.var_5d67315cdcf62026 ) )
    {
        self thread [[ self.var_5d67315cdcf62026 ]]( empdata );
    }
}

// Namespace emp / scripts\killstreaks\emp
// Params 1
// Checksum 0x0, Offset: 0x2dd4
// Size: 0x52
function function_9196f8b48901a902( owner )
{
    self endon( "emp_cleared" );
    level endon( "game_ended" );
    self waittill( "death", attacker );
    
    if ( level.var_d11891ea093da336 && attacker != owner )
    {
        owner utility::function_f3bb4f4911a1beb2( "killstreak", "rewardAssistPoints" );
    }
}

// Namespace emp / scripts\killstreaks\emp
// Params 0
// Checksum 0x0, Offset: 0x2e2e
// Size: 0x49
function function_377c97bfdd963952()
{
    val::set( "ksEMP", "killstreaks", 0 );
    scripts\cp_mp\emp_debuff::play_emp_scramble( 3 );
    self playsoundtoplayer( "kls_emp_hud_deactivate", self );
    wait 2;
    self setempjammed( 1 );
    utility::hidehudenable();
    scripts\cp_mp\emp_debuff::stop_emp_scramble( 3 );
}

// Namespace emp / scripts\killstreaks\emp
// Params 0
// Checksum 0x0, Offset: 0x2e7f
// Size: 0x84
function function_8887420281f3ff3f()
{
    if ( istrue( self.var_3570f4b5b40c02e4 ) )
    {
        self.var_3570f4b5b40c02e4 = undefined;
        thread scripts\cp_mp\emp_debuff::stop_emp_scramble( 4 );
    }
    
    self setempjammed( 0 );
    
    if ( isdefined( self.hidehudenabled ) && self.hidehudenabled > 0 )
    {
        utility::hidehuddisable();
    }
    
    val::reset( "ksEMP", "killstreaks" );
    scripts\cp_mp\emp_debuff::play_emp_scramble( 3 );
    self playsoundtoplayer( "kls_emp_hud_activate", self );
    wait 2;
    scripts\cp_mp\emp_debuff::stop_emp_scramble( 3 );
}

// Namespace emp / scripts\killstreaks\emp
// Params 0
// Checksum 0x0, Offset: 0x2f0b
// Size: 0x8b
function watch_checkforlauncherweapons()
{
    self endon( "death_or_disconnect" );
    self endon( "stopLauncherCheck" );
    level endon( "game_ended" );
    
    while ( true )
    {
        currentweapon = self getcurrentweapon();
        currentweaponname = currentweapon.basename;
        
        if ( currentweaponname == "iw9_la_gromeo_mp" || currentweaponname == "iw9_la_juliet_mp" || currentweaponname == "iw9_la_kgolf_mp" || currentweaponname == "jup_jp22_la_dromeo_mp" )
        {
            scripts\cp_mp\utility\weapon_utility::function_605b121f1fadd46c( 0 );
        }
        else
        {
            scripts\cp_mp\utility\weapon_utility::function_605b121f1fadd46c( 1 );
        }
        
        wait 1;
    }
}

// Namespace emp / scripts\killstreaks\emp
// Params 0
// Checksum 0x0, Offset: 0x2f9e
// Size: 0x71
function function_33b7f0d067af5e39()
{
    self notify( "emp_cleared" );
    self notify( "stopLauncherCheck" );
    self.empcount = undefined;
    self.ksempd = undefined;
    self.var_5c079aa1be2b9bb = undefined;
    
    if ( isdefined( self ) )
    {
        thread function_8887420281f3ff3f();
    }
    
    thread scripts\killstreaks\emp::function_56fe93fec9438968();
    self allowfire( 1 );
    scripts\cp_mp\utility\weapon_utility::function_605b121f1fadd46c( 1 );
    
    if ( isdefined( self.var_2ba749157b05bad7 ) )
    {
        self [[ self.var_2ba749157b05bad7 ]]();
    }
}

// Namespace emp / scripts\killstreaks\emp
// Params 1
// Checksum 0x0, Offset: 0x3017
// Size: 0x15
function setemp_applied_callback( applycallback )
{
    self.var_5d67315cdcf62026 = applycallback;
}

// Namespace emp / scripts\killstreaks\emp
// Params 1
// Checksum 0x0, Offset: 0x3034
// Size: 0x15
function setemp_cleared_callback( clearcallback )
{
    self.var_2ba749157b05bad7 = clearcallback;
}

// Namespace emp / scripts\killstreaks\emp
// Params 1
// Checksum 0x0, Offset: 0x3051
// Size: 0x15
function setemp_started_callback( startcallback )
{
    self.var_3545410459b16762 = startcallback;
}

// Namespace emp / scripts\killstreaks\emp
// Params 0
// Checksum 0x0, Offset: 0x306e
// Size: 0x11
function function_56fe93fec9438968()
{
    wait 5;
    function_f4e0ff5cb899686d( "kls_jup_emp" );
}

