#using script_7534b1d3ac3ea47a;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\interaction;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\engine\utility;
#using scripts\mp\gameobjects;

#namespace namespace_166fd5d99fbeb429;

/#

    // Namespace namespace_166fd5d99fbeb429 / namespace_29b5250e9959ea
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x242
    // Size: 0xd, Type: dev
    function function_75d03a2a8cb2b64()
    {
        thread function_13ef2d3c992a2954();
    }

#/

// Namespace namespace_166fd5d99fbeb429 / namespace_29b5250e9959ea
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x257
// Size: 0x195, Type: bool
function function_aec261e207cbd04a( device, player, activation_time, interact_struct, restrictmovement )
{
    if ( !isdefined( restrictmovement ) )
    {
        restrictmovement = 1;
    }
    
    if ( !isvaliddevice( device ) )
    {
        return false;
    }
    
    if ( isdefined( player.using_device ) && istrue( player.using_device ) )
    {
        return false;
    }
    
    player setclientomnvar( "ui_hackingdevice_state", -1 );
    player.using_device = 1;
    
    if ( isdefined( interact_struct ) )
    {
        interact_struct makeunusable();
    }
    
    device = switchtodevice( device, player, restrictmovement );
    player setclientomnvar( "ui_hackingdevice_state", 0 );
    thread function_2a27403675796f41( player );
    thread function_f3f4132cb28e3739( player, activation_time );
    thread watchcancel( player );
    buttontime = 0;
    
    while ( buttontime < activation_time )
    {
        if ( istrue( player.cancel_device ) || !isalive( player ) || isdefined( player.fauxdeath ) && player.fauxdeath )
        {
            player inventory_utility::getridofweapon( device );
            player function_26f48c219f97a889();
            
            if ( isdefined( interact_struct ) )
            {
                interact_struct makeusable();
            }
            
            player.using_device = 0;
            return false;
        }
        
        buttontime += level.framedurationseconds;
        waitframe();
    }
    
    player inventory_utility::getridofweapon( device );
    
    if ( isdefined( player ) )
    {
        player notifyonplayercommandremove( "cancel", "+weapnext" );
        player notifyonplayercommandremove( "cancel", "-weapnext" );
    }
    
    player function_26f48c219f97a889();
    player.using_device = 0;
    player notify( "interaction_complete" );
    return true;
}

// Namespace namespace_166fd5d99fbeb429 / namespace_29b5250e9959ea
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3f5
// Size: 0x1e, Type: bool
function private isvaliddevice( device )
{
    if ( !utility::is_equal( device, "jup_hacking_device_ob" ) )
    {
        return false;
    }
    
    return true;
}

// Namespace namespace_166fd5d99fbeb429 / namespace_29b5250e9959ea
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x41c
// Size: 0x60
function private switchtodevice( device, player, restrictmovement )
{
    deviceweapon = makeweapon( device );
    player inventory_utility::_giveweapon( deviceweapon, undefined, undefined, 0 );
    player setweaponammostock( deviceweapon, 0 );
    player setweaponammoclip( deviceweapon, 0 );
    player function_2d339ccf11a6db49( restrictmovement );
    player gameobjects::switchtouseweapon( deviceweapon, 1 );
    return deviceweapon;
}

// Namespace namespace_166fd5d99fbeb429 / namespace_29b5250e9959ea
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x485
// Size: 0x82
function private function_2d339ccf11a6db49( isrestricted )
{
    if ( isrestricted )
    {
        val::set( "using_device", "allow_movement", 0 );
        val::set( "using_device", "allow_jump", 0 );
    }
    
    val::set( "using_device", "equipment_primary", 0 );
    val::set( "using_device", "equipment_secondary", 0 );
    val::set( "using_device", "gesture", 0 );
    val::set( "using_device", "weapon_pickup", 0 );
    self function_35501b42058d4de9();
}

// Namespace namespace_166fd5d99fbeb429 / namespace_29b5250e9959ea
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x50f
// Size: 0x23
function private function_26f48c219f97a889()
{
    val::reset_all( "using_device" );
    self function_bb04491d50d9e43e();
    self setclientomnvar( "ui_hackingdevice_state", -1 );
}

// Namespace namespace_166fd5d99fbeb429 / namespace_29b5250e9959ea
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x53a
// Size: 0x8a
function private watchcancel( player )
{
    player endon( "interaction_complete" );
    player endon( "death" );
    player notifyonplayercommand( "cancel", "+weapnext" );
    player notifyonplayercommand( "cancel", "-weapnext" );
    player.cancel_device = 0;
    player waittill_any_2( "cancel", "super_use_started" );
    player.cancel_device = 1;
    player notifyonplayercommandremove( "cancel", "+weapnext" );
    player notifyonplayercommandremove( "cancel", "-weapnext" );
}

// Namespace namespace_166fd5d99fbeb429 / namespace_29b5250e9959ea
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x5cc
// Size: 0xa1
function function_3cec1b2981075936( interaction_device, scriptable, on_use_function, var_81adce70ad13cf33, var_f3bf6e6da951239b, activation_time )
{
    scriptable.interaction_device = interaction_device;
    scriptable.on_use_function = on_use_function;
    scriptable.var_81adce70ad13cf33 = var_81adce70ad13cf33;
    scriptable.var_f3bf6e6da951239b = var_f3bf6e6da951239b;
    scriptable = interaction::function_32645103f7520635( scriptable, &function_3cd671ed8c469f52, &function_e4571272ae008ea7, &function_d562e8fefd4e2fb );
    scriptable interaction::function_9a0883b5a0999dac();
    scriptable.players_interacting = [];
    scriptable.activation_time = activation_time;
}

// Namespace namespace_166fd5d99fbeb429 / namespace_29b5250e9959ea
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x675
// Size: 0x42
function function_e9aa849fed70470d( origin, angles )
{
    angles = default_to( angles, ( 0, 0, 0 ) );
    use_scriptable = spawnscriptable( "ob_hacking_device_default", origin, angles );
    return use_scriptable;
}

// Namespace namespace_166fd5d99fbeb429 / namespace_29b5250e9959ea
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6c0
// Size: 0x1a5
function private function_d562e8fefd4e2fb( player )
{
    player endon( "interaction_complete" );
    thread function_ff435575adff1b0f( player );
    
    if ( isdefined( self.var_f3bf6e6da951239b ) )
    {
        thread [[ self.var_f3bf6e6da951239b ]]( player );
    }
    
    if ( !isvaliddevice( self.interaction_device ) )
    {
        return 0;
    }
    
    if ( isdefined( player.using_device ) && istrue( player.using_device ) )
    {
        return 0;
    }
    
    player setclientomnvar( "ui_hackingdevice_state", -1 );
    player.using_device = 1;
    self.wasused = 0;
    device = switchtodevice( self.interaction_device, player, 1 );
    self.players_interacting = array_add( self.players_interacting, player );
    player setclientomnvar( "ui_hackingdevice_state", 0 );
    thread function_2a27403675796f41( player );
    thread function_f3f4132cb28e3739( player, self.activation_time );
    self.var_2b37e5554c33ef0b = 0;
    wait 0.2;
    
    while ( !istrue( self.wasused ) )
    {
        if ( !isalive( player ) || isdefined( player.fauxdeath ) && player.fauxdeath || istrue( player.cancel_device ) )
        {
            self disablescriptableplayeruse( player );
            player inventory_utility::getridofweapon( device, 1 );
            player function_26f48c219f97a889();
            player.using_device = 0;
            self.var_2b37e5554c33ef0b = 1;
            self.players_interacting = array_remove( self.players_interacting, player );
            wait 0.5;
            self enablescriptableplayeruse( player );
            return;
        }
        
        waitframe();
    }
}

// Namespace namespace_166fd5d99fbeb429 / namespace_29b5250e9959ea
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x86d
// Size: 0x4d
function private function_2a27403675796f41( player, var_ddad3435bff34bfe )
{
    if ( !isdefined( var_ddad3435bff34bfe ) )
    {
        var_ddad3435bff34bfe = 0.65;
    }
    
    player endon( "cancel" );
    player endon( "super_use_started" );
    wait var_ddad3435bff34bfe;
    
    if ( !istrue( player.cancel_device ) )
    {
        player setclientomnvar( "ui_hackingdevice_state", 1 );
    }
}

// Namespace namespace_166fd5d99fbeb429 / namespace_29b5250e9959ea
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x8c2
// Size: 0x50
function private function_f3f4132cb28e3739( player, activationtime )
{
    if ( !isdefined( activationtime ) )
    {
        activationtime = 2;
    }
    
    player endon( "cancel" );
    player endon( "super_use_started" );
    wait activationtime - 0.65;
    
    if ( !istrue( player.cancel_device ) )
    {
        player setclientomnvar( "ui_hackingdevice_state", 2 );
    }
}

// Namespace namespace_166fd5d99fbeb429 / namespace_29b5250e9959ea
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x91a
// Size: 0x25
function private function_e4571272ae008ea7( player )
{
    if ( isdefined( self.var_81adce70ad13cf33 ) )
    {
        [[ self.var_81adce70ad13cf33 ]]( player );
    }
}

// Namespace namespace_166fd5d99fbeb429 / namespace_29b5250e9959ea
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x947
// Size: 0x225
function private function_3cd671ed8c469f52( player )
{
    self.wasused = 1;
    player notify( "interaction_complete" );
    
    if ( isarray( self.players_interacting ) )
    {
        foreach ( player_check in self.players_interacting )
        {
            if ( !is_equal( player_check, player ) )
            {
                player notify( "cancel" );
            }
        }
    }
    
    if ( isdefined( self.on_use_function ) )
    {
        thread [[ self.on_use_function ]]( player );
    }
    
    if ( isdefined( self.var_ce27baf629c783b8 ) && self.var_ce27baf629c783b8 )
    {
        self setscriptablepartstate( "interact", "unusable" );
    }
    
    immediatecancel = getdvarint( @"hash_7c14bd5d6a04f082", 1 );
    player inventory_utility::getridofweapon( self.interaction_device, immediatecancel );
    
    if ( isdefined( player ) )
    {
        player notifyonplayercommandremove( "cancel", "-usereload" );
        player notifyonplayercommandremove( "cancel", "-activate" );
    }
    
    player function_26f48c219f97a889();
    player.using_device = 0;
    
    if ( isarray( self.players_interacting ) )
    {
        if ( isplayer( player ) && array_contains( self.players_interacting, player ) )
        {
            self.players_interacting = array_remove( self.players_interacting, player );
        }
        
        if ( self.players_interacting.size > 0 )
        {
            foreach ( interacting_player in self.players_interacting )
            {
                interacting_player function_70946e24f54d3f1a( self.interaction_device );
            }
            
            self.players_interacting = [];
        }
    }
    
    if ( isdefined( self.var_ce27baf629c783b8 ) && self.var_ce27baf629c783b8 )
    {
        self freescriptable();
    }
}

// Namespace namespace_166fd5d99fbeb429 / namespace_29b5250e9959ea
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xb74
// Size: 0xb4
function private function_ff435575adff1b0f( player )
{
    player endon( "interaction_complete" );
    player endon( "death" );
    player.cancel_device = 0;
    player notifyonplayercommand( "cancel", "-usereload" );
    player notifyonplayercommand( "cancel", "-activate" );
    
    if ( player usebuttonpressed( 1 ) )
    {
        player waittill_any_2( "cancel", "super_use_started" );
        player.cancel_device = 1;
    }
    else
    {
        player.cancel_device = 1;
    }
    
    player setclientomnvar( "ui_hackingdevice_state", -1 );
    player notifyonplayercommandremove( "cancel", "-usereload" );
    player notifyonplayercommandremove( "cancel", "-activate" );
}

// Namespace namespace_166fd5d99fbeb429 / namespace_29b5250e9959ea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc30
// Size: 0x82
function function_70946e24f54d3f1a( interact_device )
{
    if ( isdefined( self.using_device ) )
    {
        if ( !self.using_device )
        {
            return;
        }
        
        device = makeweapon( interact_device );
        
        if ( self.currentweapon == device )
        {
            inventory_utility::getridofweapon( device, 1 );
            self notifyonplayercommandremove( "cancel", "-usereload" );
            self notifyonplayercommandremove( "cancel", "-activate" );
            function_26f48c219f97a889();
            self.using_device = 0;
        }
    }
}

// Namespace namespace_166fd5d99fbeb429 / namespace_29b5250e9959ea
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xcba
// Size: 0x89
function function_a7ed9b756a764621( interaction_device, var_22e1dd3e25642d69, var_28f03cd0fca2c176, on_use_function, var_81adce70ad13cf33, var_f3bf6e6da951239b )
{
    if ( !isdefined( var_28f03cd0fca2c176 ) )
    {
        var_28f03cd0fca2c176 = "ob_anim_interact";
    }
    
    var_621e019ea4ee3223 = spawnscriptable( var_28f03cd0fca2c176, var_22e1dd3e25642d69 );
    
    while ( !isdefined( var_621e019ea4ee3223 ) )
    {
        waitframe();
    }
    
    var_621e019ea4ee3223 setscriptablepartstate( "interact", "usable" );
    var_621e019ea4ee3223.var_ce27baf629c783b8 = 1;
    function_3cec1b2981075936( interaction_device, var_621e019ea4ee3223, on_use_function, var_81adce70ad13cf33, var_f3bf6e6da951239b );
    return var_621e019ea4ee3223;
}

/#

    // Namespace namespace_166fd5d99fbeb429 / namespace_29b5250e9959ea
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xd4c
    // Size: 0x54, Type: dev
    function function_13ef2d3c992a2954( params )
    {
        wait 5;
        devgui::function_6e7290c8ee4f558b( "<dev string:x1c>" );
        devgui::function_b23a59dfb4ca49a1( "<dev string:x43>", "<dev string:x4a>", &function_e0a739780149a4c3, 1 );
        devgui::function_b23a59dfb4ca49a1( "<dev string:x57>", "<dev string:x6b>", &function_dd51ec3ef232fe0f, 1 );
        devgui::function_fe953f000498048f();
    }

    // Namespace namespace_166fd5d99fbeb429 / namespace_29b5250e9959ea
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xda8
    // Size: 0x32, Type: dev
    function function_e0a739780149a4c3( params )
    {
        interaction_result = namespace_29b5250e9959ea::function_aec261e207cbd04a( "<dev string:x7e>", level.players[ 0 ], 2 );
    }

    // Namespace namespace_166fd5d99fbeb429 / namespace_29b5250e9959ea
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xde2
    // Size: 0x86, Type: dev
    function function_dd51ec3ef232fe0f( params )
    {
        if ( isdefined( level.var_46aae20c1089909c ) )
        {
            level.var_46aae20c1089909c freescriptable();
            level.var_46aae20c1089909c notify( "<dev string:x97>" );
        }
        
        level.var_46aae20c1089909c = function_e9aa849fed70470d( level.players[ 0 ].origin + ( 30, 30, 0 ) );
        namespace_29b5250e9959ea::function_3cec1b2981075936( "<dev string:x7e>", level.var_46aae20c1089909c, &function_a0cf72fa5939f30b );
    }

    // Namespace namespace_166fd5d99fbeb429 / namespace_29b5250e9959ea
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xe70
    // Size: 0xe, Type: dev
    function function_a0cf72fa5939f30b( params )
    {
        
    }

#/
