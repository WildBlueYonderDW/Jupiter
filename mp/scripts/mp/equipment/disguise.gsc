#using script_67015c88c47ec4f8;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\execution;
#using scripts\cp_mp\operator;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\utility\vision_utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\ai_mp_controller;
#using scripts\mp\hud_message;
#using scripts\mp\pmc_missions;
#using scripts\mp\utility\player;
#using scripts\mp\utility\script;

#namespace disguise;

// Namespace disguise / scripts\mp\equipment\disguise
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54d
// Size: 0xb5
function function_83599506981c29cd()
{
    level.var_8c0f3022529be75e = spawnstruct();
    function_38cf81cf267278dc();
    
    if ( level.mapname == "mp_br_mechanics" && getdvarint( @"hash_8fa9d384348cb11b", 0 ) )
    {
        concealprefab = getent( "player_conceal", "targetname" );
        concealclip = spawn( "script_model", ( 0, 0, 0 ) );
        concealclip.angles = ( 0, 0, 0 );
        concealclip clonebrushmodeltoscriptmodel( concealprefab );
        concealclip dontinterpolate();
        level.var_8c0f3022529be75e.concealclip = concealclip;
    }
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x60a
// Size: 0xb8
function function_38cf81cf267278dc()
{
    if ( !isdefined( level.var_8c0f3022529be75e ) )
    {
        return;
    }
    
    level.var_8c0f3022529be75e.disguises = [];
    function_4981209c2c509828( "alqatala", "body_dmz_disguised_al_qatala_iw9_1_1", "head_dmz_disguised_al_qatala_iw9_1_1", "mp_vm_opforce_al_qatala_elite_ar_1_1", "vestlight", "milhvygr" );
    function_4981209c2c509828( "shadowcompany", "body_dmz_disguised_shadow_company_iw9_1_1", "head_dmz_disguised_shadow_company_iw9_1_1", "mp_vm_opforce_shadow_company_elite_1_1", "nylon", "millghtgr" );
    function_4981209c2c509828( "konnig", "body_dmz_disguised_unidentified_iw9_1_1", "head_dmz_disguised_unidentified_iw9_1_1", "mp_vm_dmz_disguised_unidentified_iw9_1_1", "nylon", "millghtgr" );
    
    if ( issharedfuncdefined( "disguise", "disguiseRegisterCustom" ) )
    {
        function_f3bb4f4911a1beb2( "disguise", "disguiseRegisterCustom" );
    }
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6ca
// Size: 0x44
function function_eb1fe3a0083b03df( factionname )
{
    assertex( isdefined( level.var_8c0f3022529be75e.disguises[ factionname ] ), "<dev string:x1c>" );
    return level.var_8c0f3022529be75e.disguises[ factionname ];
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x717
// Size: 0x4e
function function_291a4b6e765bfcc6( factionname )
{
    assertex( isdefined( level.var_8c0f3022529be75e.disguises[ factionname ] ), "<dev string:x1c>" );
    return level.var_8c0f3022529be75e.disguises[ factionname ].head;
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x76e
// Size: 0x4e
function function_4d2ad5e5595384f0( factionname )
{
    assertex( isdefined( level.var_8c0f3022529be75e.disguises[ factionname ] ), "<dev string:x1c>" );
    return level.var_8c0f3022529be75e.disguises[ factionname ].body;
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7c5
// Size: 0x4e
function function_aba28cc8c36eeaf7( factionname )
{
    assertex( isdefined( level.var_8c0f3022529be75e.disguises[ factionname ] ), "<dev string:x1c>" );
    return level.var_8c0f3022529be75e.disguises[ factionname ].arms;
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x81c
// Size: 0x9d
function function_4981209c2c509828( key, body, head, vmarms, cloth, gear )
{
    outfitstruct = spawnstruct();
    outfitstruct.body = body;
    outfitstruct.head = head;
    outfitstruct.arms = vmarms;
    outfitstruct.cloth = cloth;
    outfitstruct.gear = gear;
    level.var_8c0f3022529be75e.disguises[ key ] = outfitstruct;
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8c1
// Size: 0x5c
function function_310843b56a04e24c()
{
    subarea = scripts\mp\ai_mp_controller::function_a44e168e8cced18( self.origin );
    nationality = scripts\mp\ai_mp_controller::function_f851a2f41cffa860();
    
    if ( isdefined( subarea ) && isdefined( subarea.nationalityoverride ) )
    {
        nationality = subarea.nationalityoverride;
    }
    
    return function_eb1fe3a0083b03df( function_466e5ad92c500882( nationality ) );
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x926
// Size: 0x9f
function function_466e5ad92c500882( nationality )
{
    assertex( isdefined( nationality ), "<dev string:x6d>" );
    
    if ( issharedfuncdefined( "disguise", "disguiseNationalityOverride" ) )
    {
        return function_f3bb4f4911a1beb2( "disguise", "disguiseNationalityOverride" );
    }
    
    switch ( nationality )
    {
        case #"hash_916b14e9c168191":
        case #"hash_19b89634f50eeda4":
            return "shadowcompany";
        case #"hash_fa18d1f6bd5790c7":
            return "alqatala";
        case #"hash_fa53bdf6bd853c80":
            return "konnig";
        default:
            return "alqatala";
    }
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9cd
// Size: 0xf1
function function_67d03e329e13f612( itemslotindex, quantity )
{
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );
    
    if ( !isdefined( self.operatorcustomization ) )
    {
        return;
    }
    
    function_7e30d4841d0abe41( 1 );
    self.disguised = 1;
    function_a1650ef824a7be56( 1 );
    function_a8cb3b8e739c633e( itemslotindex, quantity );
    self playsound( "fly_dmz_disguise_on" );
    scripts\mp\pmc_missions::function_2d3c14faa38e2146( self );
    
    if ( !istrue( self.var_859654e0445a36d9 ) )
    {
        self forceplaygestureviewmodel( "iw9_vm_ges_disguise_on" );
    }
    
    var_a78681b284f9ae0a = getdvarfloat( @"hash_62171a84e10129ab", 0.35 );
    childthread function_9292cbe2dec7d826( var_a78681b284f9ae0a, 1 );
    childthread function_b02057aaa6d29ba1( 1, var_a78681b284f9ae0a );
    thread function_d8d7a08a9fd9a9f();
    
    if ( issharedfuncdefined( "disguise", "disguiseOnUsed" ) )
    {
        function_f3bb4f4911a1beb2( "disguise", "disguiseOnUsed" );
    }
    
    scripts\engine\utility::delaythread( var_a78681b284f9ae0a, &function_7e30d4841d0abe41, 0 );
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xac6
// Size: 0xb0
function function_a8cb3b8e739c633e( itemslotindex, quantity )
{
    if ( !isdefined( quantity ) )
    {
        quantity = 108;
    }
    
    dstruct = spawnstruct();
    dstruct.executionref = scripts\cp_mp\execution::execution_getrefbyplayer( self );
    dstruct.head = self.operatorcustomization.head;
    dstruct.body = self.operatorcustomization.body;
    dstruct.health = quantity;
    dstruct.maxhealth = 108;
    dstruct.backpackslot = itemslotindex;
    self.var_454034054e53bd79 = dstruct;
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb7e
// Size: 0x31
function function_9ee717001acd63a0( newindex )
{
    var_8c0f3022529be75e = function_3275d6441a8e838a();
    
    if ( !isdefined( var_8c0f3022529be75e ) )
    {
        return 0;
    }
    
    var_8c0f3022529be75e.backpackslot = newindex;
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbb7
// Size: 0x47, Type: bool
function function_8e1f9b3b6c83372d( index )
{
    if ( !istrue( self.disguised ) )
    {
        return false;
    }
    
    var_8c0f3022529be75e = function_3275d6441a8e838a();
    
    if ( !isdefined( var_8c0f3022529be75e ) )
    {
        return false;
    }
    
    if ( var_8c0f3022529be75e.backpackslot == index )
    {
        return true;
    }
    
    return false;
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc07
// Size: 0xc
function function_81475bb5a5a5c48f()
{
    self.var_454034054e53bd79 = undefined;
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc1b
// Size: 0x23
function function_3275d6441a8e838a()
{
    assertex( isdefined( self.var_454034054e53bd79 ), "<dev string:xa6>" );
    return self.var_454034054e53bd79;
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc47
// Size: 0x4c
function function_7e30d4841d0abe41( istransitioning )
{
    self.var_74642c7f377a42c5 = istransitioning;
    
    if ( istransitioning )
    {
        array = [ "offhand_weapons" ];
        scripts\common\values::set_array( "disguise", array, 0 );
        return;
    }
    
    scripts\common\values::reset_all( "disguise" );
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc9b
// Size: 0xc, Type: bool
function function_65a78266ead29817()
{
    return istrue( self.var_74642c7f377a42c5 );
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xcb0
// Size: 0x4f
function function_c2afddb38bd47f6f( itemslotindex, quantity )
{
    if ( istrue( self.var_ef8c89617046f3b7 ) || !function_43207ffc5e843003() )
    {
        scripts\mp\hud_message::showerrormessage( "MP/CANNOT_USE_GENERIC" );
        return;
    }
    
    if ( function_65a78266ead29817() )
    {
        return;
    }
    
    function_67d03e329e13f612( itemslotindex, quantity );
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd07
// Size: 0x165
function function_9292cbe2dec7d826( delay, ison )
{
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );
    wait delay;
    
    if ( ison )
    {
        function_8dd1c5e3042447b8( 1 );
        function_890834271f0a6fc5();
        var_d2f434df04eb7ede = function_310843b56a04e24c();
        self function_ecdccfda4326de02();
        self setcustomization( var_d2f434df04eb7ede.body, var_d2f434df04eb7ede.head );
        self setclothtype( var_d2f434df04eb7ede.cloth );
        self function_8abe5a968cc3c220( var_d2f434df04eb7ede.gear );
        thread namespace_e0526929a9f43046::function_8bfea85875208730();
        delaythread( 1, &function_8dd1c5e3042447b8, 0 );
        return;
    }
    
    scripts\cp_mp\execution::_giveexecution( self.var_454034054e53bd79.executionref );
    self setscriptablepartstate( "disguise", "off", 0 );
    self setcustomization( self.operatorcustomization.body, self.operatorcustomization.head );
    var_8f23fe410ad2500e = scripts\cp_mp\operator::function_2dc6ef8b84dfec64( self.operatorcustomization.skinref );
    
    if ( isdefined( var_8f23fe410ad2500e ) )
    {
        self.operatorcustomization.var_3291e2cbec055766 = var_8f23fe410ad2500e;
        self function_602b3de054f2a81( self.operatorcustomization.var_3291e2cbec055766 );
    }
    
    function_81475bb5a5a5c48f();
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe74
// Size: 0x36
function function_8dd1c5e3042447b8( ison )
{
    state = ter_op( ison, "on", "off" );
    self setscriptablepartstate( "disguise", state, 0 );
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xeb2
// Size: 0x17
function function_d3b190ee881c5ca7()
{
    if ( !istrue( self.disguised ) )
    {
        return 0;
    }
    
    return 1;
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xed1
// Size: 0x3d
function function_3ede6b66136c0f93( var_8a127de2ec4f8b49 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    
    if ( !istrue( self.disguised ) || function_65a78266ead29817() )
    {
        return;
    }
    
    function_da46be98ff60908d( var_8a127de2ec4f8b49 );
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf16
// Size: 0x21f
function function_da46be98ff60908d( var_575bccb498ed7f9e )
{
    level endon( "game_ended" );
    self endon( "death" );
    
    if ( !istrue( self.disguised ) )
    {
        return;
    }
    
    function_7e30d4841d0abe41( 1 );
    
    if ( issharedfuncdefined( "disguise", "should_finish_execution_first" ) )
    {
        if ( function_f3bb4f4911a1beb2( "disguise", "should_finish_execution_first" ) )
        {
            while ( isplayer( self ) && self isinexecutionattack() )
            {
                waitframe();
            }
        }
    }
    
    function_a1650ef824a7be56( 0 );
    self playsound( "fly_dmz_disguise_off" );
    currentweapon = self getcurrentweapon();
    
    if ( !scripts\cp_mp\utility\player_utility::isinvehicle() && !istrue( self.var_859654e0445a36d9 ) && isdefined( currentweapon ) && !isnullweapon( currentweapon ) )
    {
        self forceplaygestureviewmodel( "iw9_vm_ges_disguise_off" );
    }
    
    takeoffdelay = getdvarfloat( @"hash_307d1884bcaef28f", 0.45 );
    childthread function_9292cbe2dec7d826( takeoffdelay, 0 );
    childthread function_b02057aaa6d29ba1( 0, takeoffdelay );
    self.disguised = undefined;
    
    if ( isdefined( self.operatorcustomization ) && isdefined( self.operatorcustomization.clothtype ) && self.operatorcustomization.clothtype != "" )
    {
        self setclothtype( self.operatorcustomization.clothtype );
    }
    else
    {
        self setclothtype( "vestlight" );
    }
    
    if ( isdefined( self.operatorcustomization ) && isdefined( self.operatorcustomization.geartype ) && self.operatorcustomization.geartype != "" )
    {
        self function_8abe5a968cc3c220( self.operatorcustomization.geartype );
    }
    else
    {
        self function_8abe5a968cc3c220( "millghtgr" );
    }
    
    self setclientomnvar( "ui_dmz_disguise_sixth_sense_glow", 0 );
    scripts\engine\utility::delaythread( takeoffdelay, &function_7e30d4841d0abe41, 0 );
    
    if ( issharedfuncdefined( "disguise", "disguiseOff" ) )
    {
        function_f3bb4f4911a1beb2( "disguise", "disguiseOff" );
    }
    
    self notify( "disguise_ended" );
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x113d
// Size: 0x7b
function function_b02057aaa6d29ba1( ison, delay )
{
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );
    wait delay;
    self setclientomnvar( "ui_dmz_disguise_state", ison );
    
    if ( issharedfuncdefined( "disguise", "getCustomDisguiseVisionSet" ) )
    {
        var_6b46ba0029c65f1 = function_f3bb4f4911a1beb2( "disguise", "getCustomDisguiseVisionSet" );
    }
    
    if ( isdefined( var_6b46ba0029c65f1 ) )
    {
        if ( ison )
        {
            vision_utility::function_27a921508cb04613( var_6b46ba0029c65f1 );
            return;
        }
        
        vision_utility::function_9a92ae402e209ecc( var_6b46ba0029c65f1 );
    }
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11c0
// Size: 0x11b
function function_a1650ef824a7be56( var_74fa01bd3626f0b7 )
{
    if ( isdefined( level.var_8c0f3022529be75e.concealclip ) )
    {
        if ( var_74fa01bd3626f0b7 )
        {
            var_54a491b5dd59f575 = level.var_8c0f3022529be75e.concealclip;
            var_54a491b5dd59f575.origin = self.origin;
            var_54a491b5dd59f575.angles = self.angles;
            var_54a491b5dd59f575.owner = self;
            var_54a491b5dd59f575 linkto( self );
            self.var_c8395b9bae721f6b.concealclip = var_54a491b5dd59f575;
        }
        else
        {
            self.var_c8395b9bae721f6b.concealclip unlink();
            self.var_c8395b9bae721f6b.concealclip.origin = ( 0, 0, 0 );
            self.var_c8395b9bae721f6b.concealclip.owner = undefined;
            self.var_c8395b9bae721f6b.concealclip = undefined;
        }
        
        return;
    }
    
    function_ed9b1ddd2ec82dab( self, var_74fa01bd3626f0b7 );
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12e3
// Size: 0x37
function function_d8d7a08a9fd9a9f()
{
    self endon( "death_or_disconnect" );
    self endon( "disguise_ended" );
    
    if ( getdvarint( @"hash_8303972c0cfbece0", 1 ) != 1 )
    {
        return;
    }
    
    while ( true )
    {
        function_d293a200fe5d81c1();
        waitframe();
    }
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1322
// Size: 0x6c
function function_bc96cf8a43c99435()
{
    origin = self.origin;
    radius = getdvarfloat( @"hash_1ef2c1fad9dad02f", 1000 );
    var_674daafffc0aacf3 = undefined;
    
    if ( function_a794fcf9545f2062() )
    {
        var_674daafffc0aacf3 = function_b1eef70090b5b7b5( origin, radius, function_869ccb4e3451b8c6( [ "etype_ai" ] ), undefined, undefined );
    }
    else
    {
        var_674daafffc0aacf3 = getaiarrayinradius( origin, radius );
    }
    
    return var_674daafffc0aacf3;
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1397
// Size: 0x193
function function_d293a200fe5d81c1()
{
    contents = scripts\engine\trace::create_default_contents( 1 );
    debug = getdvarint( @"hash_c6b2b86fd34e0636", 0 ) == 1;
    process = 0;
    sightmask = 0;
    tootherplayer = undefined;
    var_746071ab06f38fd = undefined;
    time = getsystemtimeinmicroseconds();
    
    if ( !isdefined( self ) )
    {
        return 0;
    }
    
    if ( !istrue( self.disguised ) )
    {
        return 0;
    }
    
    var_674daafffc0aacf3 = function_bc96cf8a43c99435();
    var_24f9b94a171cca52 = scripts\mp\utility\player::getstancecenter();
    
    foreach ( agent in var_674daafffc0aacf3 )
    {
        if ( process >= 25 )
        {
            process = 0;
            waitframe();
        }
        
        if ( !function_7e44e1aadd3ddf3a( agent ) )
        {
            continue;
        }
        
        process++;
        agentpos = agent.origin;
        threatlevel = agent getthreatsight( self );
        
        if ( threatlevel < 0.25 )
        {
            continue;
        }
        
        sightmask |= function_8cd5129459f5cd9c( agent );
    }
    
    function_443abc2e017f4e40( sightmask );
    
    if ( sightmask != 0 )
    {
        if ( !isdefined( self.var_db46ac7f2e05d19d ) || ( gettime() - self.var_db46ac7f2e05d19d ) / 1000 >= 4 )
        {
            self playlocalsound( "iw9_mp_disguise_alert" );
            self.var_db46ac7f2e05d19d = gettime();
        }
    }
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1532
// Size: 0x3b
function function_7e44e1aadd3ddf3a( agent )
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( !scripts\cp_mp\utility\player_utility::_isalive() )
    {
        return 0;
    }
    
    if ( !isdefined( agent ) )
    {
        return 0;
    }
    
    if ( !isalive( agent ) )
    {
        return 0;
    }
    
    if ( scripts\common\utility::isusingremote() )
    {
        return 0;
    }
    
    return 1;
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1576
// Size: 0x108
function function_8cd5129459f5cd9c( agent )
{
    forward = vectornormalize( anglestoforward( self getplayerangles() ) );
    toenemy = vectornormalize( agent.origin - self.origin );
    dot = vectordot( forward, toenemy );
    
    if ( dot >= 0.92388 )
    {
        return 2;
    }
    
    if ( dot >= 0.707107 )
    {
        return ter_op( utility::isleft2d( self.origin, forward, agent.origin ), 4, 1 );
    }
    
    if ( dot >= 0.5 )
    {
        return ter_op( utility::isleft2d( self.origin, forward, agent.origin ), 128, 64 );
    }
    
    if ( dot >= -0.707107 )
    {
        return ter_op( utility::isleft2d( self.origin, forward, agent.origin ), 32, 8 );
    }
    
    return 16;
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1686
// Size: 0x18
function function_443abc2e017f4e40( sightmask )
{
    self setclientomnvar( "ui_dmz_disguise_sixth_sense_glow", sightmask );
}

// Namespace disguise / scripts\mp\equipment\disguise
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16a6
// Size: 0x5f
function function_890834271f0a6fc5()
{
    var_cb11f01bf67d6e03 = [ "000", "001", "022", "023" ];
    randomidx = var_cb11f01bf67d6e03[ randomint( var_cb11f01bf67d6e03.size ) ];
    execref = "execution_" + randomidx;
    scripts\cp_mp\execution::_giveexecution( execref );
}

