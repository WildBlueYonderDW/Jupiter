#using script_147448f3f080c636;
#using script_6a80b1f96116909e;
#using scripts\asm\asm;
#using scripts\asm\cap;
#using scripts\asm\shared\utility;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace cap_civ_react;

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x28d
// Size: 0x60
function function_12889d5fe2ea906e( asmname, statename, params )
{
    self.fnasm_playfacialanim = utility::getsharedfunc( "anim", "ASM_PlayFacialAnim" );
    namespace_603b0d6e06be2dbe::initcivreactcommon( asmname, statename, params );
    
    if ( !isai( self ) )
    {
        self.fnasm_handlenotetrack = utility::getsharedfunc( "anim", "HandleNotetrack" );
    }
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2f5
// Size: 0x6d, Type: bool
function function_86880dd17dc8bc39( asmname, statename, tostatename, params )
{
    if ( !isdefined( self.lasttimepushed ) )
    {
        return false;
    }
    
    timediff = gettime() - self.lasttimepushed;
    var_bd2c8d841d116e33 = 10000;
    return asm_eventfired( asmname, "player_pushed" ) && timediff < var_bd2c8d841d116e33;
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x36b
// Size: 0x10f
function function_d8ca3630d10c6e62( asmname, statename, params )
{
    player = namespace_2b520709cc9e7442::getclosestplayer( self.origin );
    
    if ( !isdefined( player ) )
    {
        randomalias = function_976d6ccb0a2807f3( statename );
        return function_18e6c36c02a94dbd( statename, randomalias );
    }
    
    if ( isdefined( self.reactdata.var_39cbcdce57275c53 ) )
    {
        self.reactdata.var_39cbcdce57275c53 = 0;
    }
    
    movedirnormalized = vectornormalize( self.origin - player.origin );
    targetangles = vectortoangles( movedirnormalized );
    targetyaw = angleclamp180( targetangles[ 1 ] - self.angles[ 1 ] );
    angleindex = scripts\asm\asm::yawdiffto2468( targetyaw );
    aliasname = "pushed_" + angleindex;
    turnanim = function_18e6c36c02a94dbd( statename, aliasname );
    return turnanim;
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x483
// Size: 0x230
function initcivreactcommon( asmname, statename, params )
{
    self.capeventdata = spawnstruct();
    self._blackboard.var_610cb18ecc1af719 = undefined;
    self.reactdata = spawnstruct();
    self.reactdata.var_9d92febdac913986 = 0;
    self.reactdata.var_a2f98561afe346c6 = 0;
    self.reactdata.var_1532b27e26d5db21 = "relaxed";
    self.reactdata.triggeredtime = 0;
    self.reactdata.var_af1d1102ede20fc2 = "relaxed";
    self.reactdata.var_ac13962f5c74201c = 0;
    self.reactdata.isglancing = 0;
    self.reactdata.var_a576b24ef9af6865 = 0;
    self.reactdata.var_44a0cae44b47f5ee = 1;
    self.reactdata.var_2141f7cb7ff397a6 = 0;
    self.sightdata = spawnstruct();
    self.sightdata.var_21965e18b854f978 = 0;
    self.sightdata.var_56d6f93840cb5f45 = 0;
    
    if ( isai( self ) )
    {
        self setanim( generic_human#lookat_procedural_node );
        self setanim( generic_human#lookat_eye_node );
        var_7a140ee03cfc699e = self findoverridearchetype( "animscript" );
        
        if ( isdefined( var_7a140ee03cfc699e ) )
        {
            headanim = archetypegetalias( var_7a140ee03cfc699e, "knobs", "head", 0 );
            
            if ( isdefined( headanim ) )
            {
                self setanim( headanim.anims, 1, 0.2 );
            }
            
            self.var_8effd09d2c6077d7 = var_7a140ee03cfc699e;
            self.var_be5b4c59c12df3a8 = asmname;
        }
    }
    else
    {
        self.fakeactor_face_anim = 1;
        self.facialstate = "asm";
        self.var_5247d15da29e8539 = 1;
    }
    
    self.var_d28e54645050df58 = 0;
    
    if ( istrue( self.var_6b1e93f4670936dc ) )
    {
    }
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6bb
// Size: 0x18c
function proximity_bump()
{
    self endon( "death" );
    self.script_pushable = 0;
    
    while ( true )
    {
        triggerevent = 0;
        player = namespace_2b520709cc9e7442::getclosestplayer( self.origin );
        
        if ( !isdefined( player ) )
        {
            waitframe();
            continue;
        }
        
        tome = self.origin - player.origin;
        var_214d72ecaf4fe659 = length2dsquared( tome );
        var_988ce1f3de29ab7b = 70;
        
        if ( isdefined( self.reactdata.var_988ce1f3de29ab7b ) )
        {
            var_988ce1f3de29ab7b = self.reactdata.var_988ce1f3de29ab7b;
        }
        else if ( isdefined( level.var_f62b6e59c0e00d48.var_988ce1f3de29ab7b ) )
        {
            var_988ce1f3de29ab7b = level.var_f62b6e59c0e00d48.var_988ce1f3de29ab7b;
        }
        
        if ( var_214d72ecaf4fe659 < var_988ce1f3de29ab7b * var_988ce1f3de29ab7b )
        {
            playervelocity = player getvelocity();
            var_a7417a94cd44dd6f = length2dsquared( playervelocity );
            
            if ( var_a7417a94cd44dd6f > 0 )
            {
                normalizedvelocity = vectornormalize( playervelocity );
                tome = vectornormalize( tome );
                dot = vectordot( normalizedvelocity, tome );
                triggerevent = dot > 0.866;
            }
        }
        
        if ( triggerevent && self.reactdata.var_44a0cae44b47f5ee )
        {
            scripts\asm\asm::asm_fireevent( self.asmname, "player_pushed" );
            var_1a28ad563a3f4806 = 0.25;
            wait var_1a28ad563a3f4806;
            continue;
        }
        
        waitframe();
    }
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x84f
// Size: 0x71
function function_8410016cf6ab1371()
{
    while ( true )
    {
        if ( getdvar( @"hash_39375e00c2cad343" ) != "" && isdefined( self.attitude ) )
        {
            level notify( "civreact_terminate" );
            
            if ( getdvar( @"hash_39375e00c2cad343", "relaxed" ) != self.attitude )
            {
                self.attitude = getdvar( @"hash_39375e00c2cad343" );
            }
        }
        
        wait 1;
    }
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8c8
// Size: 0x1b
function capcivreact( asmname )
{
    thread function_8410016cf6ab1371();
    thread function_d338069f6a281787();
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8eb
// Size: 0xe2
function capcivreact_handlebulletfired( originator )
{
    var_c70400922bccce61 = distance( originator.origin, self.origin );
    waittimems = var_c70400922bccce61 / level.var_f62b6e59c0e00d48.var_ffc29105fd388648 + randomfloat( 0, 0.5 ) * 1000;
    reacttime = waittimems + gettime();
    
    if ( isdefined( self.var_22c53a5480553773 ) < reacttime )
    {
        return;
    }
    
    self.capeventdata.lastevent = "bulletfired";
    self.capeventdata.var_650d1900b21e2bd1 = originator.origin;
    self.capeventdata.var_27f5cd190b4a24c3 = gettime();
    self notify( "CapCivReact_HandleBulletFired" );
    self endon( "CapCivReact_HandleBulletFired" );
    wait waittimems;
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9d5
// Size: 0x45
function function_d338069f6a281787()
{
    while ( true )
    {
        self waittill( "cap_event", eventname, originator );
        
        switch ( eventname )
        {
            case #"hash_cb9359e30cbc556b":
                capcivreact_handlebulletfired( originator );
                break;
        }
    }
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa22
// Size: 0x22
function function_b92973cdb6dc3f38()
{
    target = self._blackboard.var_610cb18ecc1af719;
    return target;
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa4d
// Size: 0x248
function function_20efa2e633463448( asmname, statename, params )
{
    selfent = self;
    
    if ( isdefined( self.capgroup ) )
    {
        capgroup = level.capgroups[ self.capgroup ];
        index = 0;
        
        for (capindex = 0; capindex < capgroup.size; capindex++) {
            if ( isalive( capgroup[ capindex ] ) )
            {
                selfent = capgroup[ capindex ];
                break;
            }
        }
    }
    
    player_target = function_b92973cdb6dc3f38();
    
    if ( !isdefined( player_target ) )
    {
        target = function_75996a8dac6970f2( 1024 );
    }
    else
    {
        target = player_target.origin;
    }
    
    yawtotarget = vectortoyaw( target - selfent.origin );
    anglediff = angleclamp180( yawtotarget - selfent.angles[ 1 ] );
    turnanim = undefined;
    
    if ( isdefined( params ) && params == "cardinal" )
    {
        absanglediff = abs( anglediff );
        animindex = "2";
        
        if ( absanglediff > 135 )
        {
            animindex = "8";
        }
        else if ( anglediff > 45 && anglediff <= 135 )
        {
            animindex = "6";
        }
        else if ( anglediff >= -135 && anglediff < -45 )
        {
            animindex = "4";
        }
        
        turnanim = scripts\asm\cap::function_18e6c36c02a94dbd( statename, animindex );
        assertex( isdefined( turnanim ), "<dev string:x1c>" + animindex + "<dev string:x39>" + self.animsetname );
    }
    else
    {
        animmap = [ "2", "3", "6", "9", "8", "7", "4", "1", "2" ];
        animindex = getangleindex( anglediff, 22.5 );
        turnanim = scripts\asm\cap::function_18e6c36c02a94dbd( statename, animmap[ animindex ] );
        assertex( isdefined( turnanim ), "<dev string:x57>" + animmap[ animindex ] + "<dev string:x39>" + self.animsetname );
    }
    
    return turnanim;
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xc9e
// Size: 0x19e, Type: bool
function function_14d651e2254bb00d( asmname, fromstate, tostate, params )
{
    if ( isdefined( params ) && params == "return" )
    {
        angles = self.interaction_angles;
        anglediff = angleclamp180( angles[ 1 ] - self.angles[ 1 ] );
        var_3ada4c6e49483364 = 22.5;
        return ( abs( anglediff ) > var_3ada4c6e49483364 );
    }
    
    target = function_b92973cdb6dc3f38();
    
    if ( isdefined( target ) )
    {
        totarget = target.origin - self.origin;
        yawtotarget = vectortoyaw( totarget );
        var_3ada4c6e49483364 = 45;
        
        if ( !isai( self ) )
        {
            var_b047d1b68e9701c9 = lengthsquared( totarget );
            var_706fe99ce1efa2b7 = [ [ 300, 23 ], [ 0, 45 ] ];
            
            foreach ( pair in var_706fe99ce1efa2b7 )
            {
                distancesqr = pair[ 0 ] * pair[ 0 ];
                
                if ( var_b047d1b68e9701c9 > distancesqr )
                {
                    var_3ada4c6e49483364 = pair[ 1 ];
                    break;
                }
            }
        }
        
        anglediff = angleclamp180( yawtotarget - self.angles[ 1 ] );
        
        if ( abs( anglediff ) > var_3ada4c6e49483364 )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe45
// Size: 0x65
function function_6e1cbd20dcaecf31( asmname, statename, params )
{
    if ( isdefined( params ) && isstring( params ) && params == "return" )
    {
        self._blackboard.var_7460b96395361857 = self._blackboard.var_c71a487341c700f3;
    }
    
    function_59308d53cabcdfdb( asmname, statename );
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xeb2
// Size: 0x163
function function_99f3112f53606865( asmname, statename, params )
{
    self endon( statename + "_finished" );
    turnanim = asm_getanim( asmname, statename );
    turnxanim = asm_getxanim( statename, turnanim );
    self.useanimgoalweight = 1;
    assert( !isdefined( params ) || isarray( params ) && params.size == 2 );
    rate = 1;
    
    if ( isai( self ) )
    {
        if ( isdefined( params ) )
        {
            if ( isdefined( params[ 0 ] ) )
            {
                tracktime = params[ 0 ];
                scripts\asm\cap::function_f9d6133768491200( turnxanim, tracktime );
            }
        }
        else
        {
            self function_1c339daaba3f71db( 0 );
        }
        
        self aisetanim( statename, turnanim, rate );
    }
    else
    {
        var_34ee65b16925d791 = asm_lookupanimfromalias( "knobs", "body" );
        bodyxanim = asm_getxanim( "knobs", var_34ee65b16925d791 );
        self setflaggedanimknoballrestart( statename, turnxanim, bodyxanim, 1, 0.2, 1 );
    }
    
    if ( !isdefined( params ) || params[ 1 ] )
    {
        thread function_737c17a2f5f59183( turnxanim, statename );
    }
    
    if ( !isai( self ) )
    {
        thread function_5c8ff3350d31ccf2( turnxanim, statename );
    }
    
    notehandler = asm_getnotehandler( asmname, statename );
    asm_donotetracks( asmname, statename, notehandler );
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x101d
// Size: 0x94
function function_5c8ff3350d31ccf2( turnxanim, statename )
{
    self endon( "death" );
    animlength = getanimlength( turnxanim );
    totaltraces = animlength / 0.4;
    interval = animlength / totaltraces;
    contents = scripts\engine\trace::create_solid_ai_contents( 1 );
    
    for (trace = 0; trace < totaltraces; trace++) {
        wait interval;
        self.origin = scripts\engine\utility::drop_to_ground( self.origin, 30, -30, undefined, contents );
    }
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10b9
// Size: 0x228
function function_737c17a2f5f59183( turnxanim, statename )
{
    self endon( "death" );
    self endon( statename + "_finished" );
    enemy = function_b92973cdb6dc3f38();
    
    if ( !isdefined( enemy ) )
    {
        return;
    }
    
    enemy endon( "death" );
    animlength = getanimlength( turnxanim );
    
    if ( animhasnotetrack( turnxanim, "start_aim" ) )
    {
        finish_time = getnotetracktimes( turnxanim, "start_aim" );
        animlength *= finish_time[ 0 ];
    }
    else if ( animhasnotetrack( turnxanim, "finish" ) )
    {
        finish_time = getnotetracktimes( turnxanim, "finish" );
        animlength *= finish_time[ 0 ];
    }
    
    numframes = int( animlength * 20 );
    remainingframes = numframes;
    
    if ( isai( self ) )
    {
        while ( remainingframes > 0 )
        {
            lerpfraction = 1 / remainingframes;
            yawtoenemy = angleclamp180( vectortoyaw( enemy.origin - self.origin ) - self.angles[ 1 ] );
            currentanimtime = undefined;
            currentanimtime = self aigetanimtime( turnxanim );
            var_993a8f9635e274cf = getangledelta( turnxanim, currentanimtime, 1 );
            remainingyaw = angleclamp180( yawtoenemy - var_993a8f9635e274cf );
            self orientmode( "face angle", angleclamp( self.angles[ 1 ] + remainingyaw * lerpfraction ) );
            remainingframes--;
            wait 0.05;
        }
        
        return;
    }
    
    while ( remainingframes > 0 )
    {
        lerpfraction = 1 / remainingframes;
        yawtoenemy = angleclamp180( vectortoyaw( enemy.origin - self.origin ) - self.angles[ 1 ] );
        currentanimtime = undefined;
        currentanimtime = self getanimtime( turnxanim );
        var_993a8f9635e274cf = getangledelta( turnxanim, currentanimtime, 1 );
        remainingyaw = angleclamp180( yawtoenemy - var_993a8f9635e274cf );
        yaw = angleclamp( self.angles[ 1 ] + remainingyaw * lerpfraction );
        self.angles = ( 0, yaw, 0 );
        remainingframes--;
        wait 0.05;
    }
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x12e9
// Size: 0x25
function playturnanim_cleanup( asmname, statename, params )
{
    self.useanimgoalweight = 0;
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1316
// Size: 0x89, Type: bool
function function_25d4ebb35db59893( asmname, statename, tostatename, params )
{
    if ( istrue( self._blackboard.var_b9fe3860c557e5d6 ) )
    {
        return false;
    }
    
    if ( self.attitude == "cower" )
    {
        return true;
    }
    
    if ( isdefined( self._blackboard.var_41830459efdaf2aa ) && gettime() >= self._blackboard.var_41830459efdaf2aa )
    {
        return true;
    }
    
    return false;
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x13a8
// Size: 0x57
function function_94ea0ca02f4d957( asmname, statename, params )
{
    if ( randomint( 100 ) < 30 )
    {
        self._blackboard.var_41830459efdaf2aa = gettime() + randomintrange( 3000, 5000 );
    }
    
    scripts\asm\cap::function_59308d53cabcdfdb( asmname, statename, params );
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1407
// Size: 0x2e
function function_8c45fec62914f2e3( asmname, statename, params )
{
    self._blackboard.var_41830459efdaf2aa = undefined;
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x143d
// Size: 0x4a
function function_c8421bb477a45b8a( note )
{
    if ( !isai( self ) )
    {
        return;
    }
    
    if ( note == "hp_on" )
    {
        self function_1c339daaba3f71db( 1 );
        self function_5621e511b99964a7( level.player );
    }
    
    if ( note == "hp_off" )
    {
        self function_1c339daaba3f71db( 0 );
    }
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x148f
// Size: 0x57
function function_15330ee53a46289d( asmname, fromstatename, tostatename, params )
{
    shouldpanic = istrue( self._blackboard.retriggerpanic );
    self._blackboard.retriggerpanic = undefined;
    return shouldpanic;
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x14ef
// Size: 0x73
function function_fbbcd3a4d551644c( asmname, statename, params )
{
    assert( isdefined( self._blackboard.var_40a41c70824fa4c4 ) );
    
    if ( self._blackboard.var_40a41c70824fa4c4 == "b" )
    {
        return function_a0dfeea159aa7f64( asmname, statename, "a_to_b" );
    }
    
    return function_a0dfeea159aa7f64( asmname, statename, "b_to_a" );
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x156a
// Size: 0x7f
function function_10e9a7601aef9c43( asmname, statename, params )
{
    if ( function_f179ede0989e6734( statename, "a" ) )
    {
        if ( !isdefined( self._blackboard.var_40a41c70824fa4c4 ) )
        {
            self._blackboard.var_40a41c70824fa4c4 = "a";
        }
        
        return function_a0dfeea159aa7f64( asmname, statename, self._blackboard.var_40a41c70824fa4c4 );
    }
    
    return function_a0dfeea159aa7f64( asmname, statename, params );
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x15f2
// Size: 0xbd
function function_f914d9aba63ded76( asmname, fromstatename, tostatename, params )
{
    if ( !function_15330ee53a46289d( asmname, fromstatename, tostatename, params ) )
    {
        return 0;
    }
    
    shouldswitch = function_f179ede0989e6734( fromstatename, "a" );
    
    if ( shouldswitch )
    {
        assert( isdefined( self._blackboard.var_40a41c70824fa4c4 ) );
        
        if ( self._blackboard.var_40a41c70824fa4c4 == "a" )
        {
            self._blackboard.var_40a41c70824fa4c4 = "b";
        }
        else
        {
            self._blackboard.var_40a41c70824fa4c4 = "a";
        }
    }
    
    return shouldswitch;
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x16b8
// Size: 0x2d, Type: bool
function function_d609e4ea4f9848a4( asmname, fromstatename, tostatename, params )
{
    return istrue( self.var_c492eecad94293be );
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x16ee
// Size: 0x42, Type: bool
function withingoaldist( asmname, statename, tostatename, param )
{
    disttogoal = 320;
    
    if ( isdefined( param ) )
    {
        disttogoal = param;
    }
    
    return self pathdisttogoal() < disttogoal;
}

// Namespace cap_civ_react / namespace_603b0d6e06be2dbe
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1739
// Size: 0x44, Type: bool
function function_1bb354204eb3d271( asmname, statename, tostatename, param )
{
    if ( !isdefined( self.var_6fca5c68cc5f9550 ) )
    {
        return false;
    }
    
    if ( !isdefined( param ) )
    {
        return false;
    }
    
    return self.var_6fca5c68cc5f9550 == param;
}

