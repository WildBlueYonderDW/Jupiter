#using script_7534b1d3ac3ea47a;
#using scripts\common\utility;
#using scripts\engine\utility;

#namespace namespace_7ee9a03c8b80c102;

// Namespace namespace_7ee9a03c8b80c102 / namespace_fd4c3f1f30da37b4
// Params 2
// Checksum 0x0, Offset: 0x6dd
// Size: 0xbe
function spawn_computer( location_struct, max_health )
{
    computer = spawn( "script_model", location_struct.origin );
    computer.scriptable = spawnscriptable( "jup_zm_merc_defend_computer_scriptable", location_struct.origin + ( 0, 0, 62 ) );
    computer model_swap( "jup_zm_merc_defend_computer_combined" );
    computer.maxhealth = max_health + 1000000;
    computer.health = max_health + 1000000;
    computer.angles = location_struct.angles;
    computer thread start_threads();
    load_vfx();
    return computer;
}

// Namespace namespace_7ee9a03c8b80c102 / namespace_fd4c3f1f30da37b4
// Params 1
// Checksum 0x0, Offset: 0x7a4
// Size: 0x108
function activate_computer( player )
{
    playerteam = ter_op( isdefined( player ), player.team, "allies" );
    self.computer makeentitysentient( playerteam );
    self.computer setcandamage( 1 );
    createthreatbiasgroup( "computer" );
    self.computer setthreatbiasgroup( "computer" );
    setignoremegroup( "computer", "team_two_hundred" );
    setignoremegroup( "computer", "allies" );
    setignoremegroup( "computer", "team_players" );
    createthreatbiasgroup( "defenders" );
    setignoremegroup( "computer", "defenders" );
    killfxontag( getfx( "merc_defend_idle" ), self.computer, "tag_origin" );
    playfxontag( getfx( "merc_defend_active" ), self.computer, "tag_origin" );
    self.computer notify( "begin_transmission" );
}

// Namespace namespace_7ee9a03c8b80c102 / namespace_fd4c3f1f30da37b4
// Params 0
// Checksum 0x0, Offset: 0x8b4
// Size: 0xef
function cleanup_computer()
{
    killfxontag( getfx( "merc_defend_idle" ), self, "tag_origin" );
    killfxontag( getfx( "merc_defend_active" ), self, "tag_origin" );
    killfxontag( getfx( "merc_defend_active_damage" ), self, "tag_origin" );
    killfxontag( getfx( "merc_defend_damage_25" ), self, "tag_origin" );
    killfxontag( getfx( "merc_defend_damage_50" ), self, "tag_origin" );
    killfxontag( getfx( "merc_defend_damage_75" ), self, "tag_origin" );
    killfxontag( getfx( "merc_defend_explode" ), self, "tag_origin" );
    killfxontag( getfx( "merc_defend_damage_destroyed" ), self, "tag_origin" );
    
    if ( isdefined( self.scriptable ) )
    {
        self.scriptable freescriptable();
        self.scriptable = undefined;
    }
    
    self notify( "deleted" );
    self delete();
}

// Namespace namespace_7ee9a03c8b80c102 / namespace_fd4c3f1f30da37b4
// Params 1
// Checksum 0x0, Offset: 0x9ab
// Size: 0x1c
function function_38df7cd1dc2f5bc9( computer )
{
    return computer.health - 1000000;
}

// Namespace namespace_7ee9a03c8b80c102 / namespace_fd4c3f1f30da37b4
// Params 1
// Checksum 0x0, Offset: 0x9d0
// Size: 0x2e
function function_1b71094fb5bf7c52( computer )
{
    return ( computer.health - 1000000 ) / ( computer.maxhealth - 1000000 );
}

// Namespace namespace_7ee9a03c8b80c102 / namespace_fd4c3f1f30da37b4
// Params 0
// Checksum 0x0, Offset: 0xa07
// Size: 0x2f
function start_threads()
{
    self endon( "deleted" );
    self endon( "death" );
    self endon( "objective_success" );
    childthread computer_update();
    childthread damage_watcher();
    childthread interact_watcher();
}

// Namespace namespace_7ee9a03c8b80c102 / namespace_fd4c3f1f30da37b4
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa3e
// Size: 0x17a
function private interact_watcher()
{
    self waittill( "activate_interact", players );
    playfxontag( getfx( "merc_defend_idle" ), self, "tag_origin" );
    
    if ( isdefined( self.scriptable ) )
    {
        self.scriptable setscriptablepartstate( "audio", "on_inactive" );
    }
    
    self.computer_interact = namespace_29b5250e9959ea::function_a7ed9b756a764621( "jup_hacking_device_ob", self.origin + ( 0, 0, 64 ), "ob_defend_computer_anim_interact", &activate_computer, undefined, undefined );
    self.computer_interact.computer = self;
    
    foreach ( player in level.players )
    {
        self.computer_interact disablescriptableplayeruse( player );
    }
    
    foreach ( var_835454e02a99b339 in players )
    {
        self.computer_interact enablescriptableplayeruse( var_835454e02a99b339 );
    }
    
    self waittill( "begin_transmission" );
    
    if ( isdefined( self.scriptable ) )
    {
        self.scriptable setscriptablepartstate( "audio", "on_active" );
    }
}

// Namespace namespace_7ee9a03c8b80c102 / namespace_fd4c3f1f30da37b4
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xbc0
// Size: 0x186
function private damage_watcher()
{
    real_health = self.maxhealth - 1000000;
    childthread damage_vfx();
    
    while ( true )
    {
        self waittill( "damage", amount, attacker, direction, point, damage_type, modelname, tagname, partname, idflags, objweapon );
        
        if ( array_contains( level.players, attacker ) || attacker.classname == "script_vehicle" )
        {
            self.health += amount;
            continue;
        }
        
        var_d223f098d6d86030 = function_9e4fe40b486284c8( real_health, objweapon );
        
        if ( amount > var_d223f098d6d86030 )
        {
            health_back = amount - var_d223f098d6d86030;
            self.health += int( health_back );
        }
        
        if ( self.health - 1000000 <= 0 && self.current_model != "jup_zm_merc_defend_computer_destroyed_combined" )
        {
            self.health -= 1000000;
            thread function_fbfb3bfa5318ab1();
            model_swap( "jup_zm_merc_defend_computer_destroyed_combined" );
            self notify( "damage_modify" );
            self notify( "death" );
        }
        
        self notify( "damage_modify" );
    }
}

// Namespace namespace_7ee9a03c8b80c102 / namespace_fd4c3f1f30da37b4
// Params 2
// Checksum 0x0, Offset: 0xd4e
// Size: 0x96
function function_9e4fe40b486284c8( totalhealth, objweapon )
{
    filter = 0.01;
    
    if ( !isdefined( objweapon ) || !isdefined( objweapon.classname ) )
    {
        return ( totalhealth * filter );
    }
    
    switch ( objweapon.classname )
    {
        case #"hash_690c0d6a821b42e":
            filter = 0.03;
            break;
        case #"hash_61e969dacaaf9881":
            filter = 0.1;
            break;
        case #"hash_e224d0b635d0dadd":
            filter = 0.1;
            break;
    }
    
    return totalhealth * filter;
}

// Namespace namespace_7ee9a03c8b80c102 / namespace_fd4c3f1f30da37b4
// Params 0
// Checksum 0x0, Offset: 0xded
// Size: 0xad
function function_fbfb3bfa5318ab1()
{
    playfxontag( getfx( "merc_defend_explode" ), self, "tag_origin" );
    playfxontag( getfx( "merc_defend_damage_destroyed" ), self, "tag_origin" );
    stopfxontag( getfx( "merc_defend_damage_75" ), self, "tag_origin" );
    self playsound( "c4_expl_swt" );
    
    if ( isdefined( self.scriptable ) )
    {
        self.scriptable freescriptable();
        self.scriptable = undefined;
    }
    
    wait 1;
    killfxontag( getfx( "merc_defend_active" ), self, "tag_origin" );
    killfxontag( getfx( "merc_defend_active_damage" ), self, "tag_origin" );
}

// Namespace namespace_7ee9a03c8b80c102 / namespace_fd4c3f1f30da37b4
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xea2
// Size: 0x7c
function private damage_vfx()
{
    self endon( "death" );
    
    while ( true )
    {
        self waittill( "damage_modify" );
        killfxontag( getfx( "merc_defend_active" ), self, "tag_origin" );
        playfxontag( getfx( "merc_defend_active_damage" ), self, "tag_origin" );
        wait 3;
        killfxontag( getfx( "merc_defend_active_damage" ), self, "tag_origin" );
        playfxontag( getfx( "merc_defend_active" ), self, "tag_origin" );
        waitframe();
    }
}

// Namespace namespace_7ee9a03c8b80c102 / namespace_fd4c3f1f30da37b4
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xf26
// Size: 0xfc
function private computer_update()
{
    current_state = 0;
    
    while ( true )
    {
        health_percentage = function_1b71094fb5bf7c52( self );
        
        switch ( current_state )
        {
            case 0:
                if ( health_percentage < 0.75 )
                {
                    playfxontag( getfx( "merc_defend_damage_25" ), self, "tag_origin" );
                    current_state = 1;
                }
                
                break;
            case 1:
                if ( health_percentage < 0.5 )
                {
                    current_state = 2;
                    playfxontag( getfx( "merc_defend_damage_50" ), self, "tag_origin" );
                    stopfxontag( getfx( "merc_defend_damage_25" ), self, "tag_origin" );
                }
                
                break;
            case 2:
                if ( health_percentage < 0.25 )
                {
                    current_state = 3;
                    playfxontag( getfx( "merc_defend_damage_75" ), self, "tag_origin" );
                    stopfxontag( getfx( "merc_defend_damage_50" ), self, "tag_origin" );
                }
                
                break;
        }
        
        waitframe();
    }
}

// Namespace namespace_7ee9a03c8b80c102 / namespace_fd4c3f1f30da37b4
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x102a
// Size: 0x1d
function private model_swap( newmodel )
{
    self.current_model = newmodel;
    self setmodel( newmodel );
}

// Namespace namespace_7ee9a03c8b80c102 / namespace_fd4c3f1f30da37b4
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x104f
// Size: 0x154
function private load_vfx()
{
    level._effect[ "merc_defend_explode" ] = loadfx( "vfx/iw9/killstreaks/bombdrone/vfx_bomb_drone_exp.vfx" );
    level._effect[ "merc_defend_idle" ] = loadfx( "vfx/jup/ob/gameplay/zm/vfx_mercdefend_idle.vfx" );
    level._effect[ "merc_defend_active" ] = loadfx( "vfx/jup/ob/gameplay/zm/vfx_mercdefend_active.vfx" );
    level._effect[ "merc_defend_active_damage" ] = loadfx( "vfx/jup/ob/gameplay/zm/vfx_mercdefend_active_damage.vfx" );
    level._effect[ "merc_defend_damage_25" ] = loadfx( "vfx/jup/ob/gameplay/zm/vfx_mercdefend_damage_25.vfx" );
    level._effect[ "merc_defend_damage_50" ] = loadfx( "vfx/jup/ob/gameplay/zm/vfx_mercdefend_damage_50.vfx" );
    level._effect[ "merc_defend_damage_75" ] = loadfx( "vfx/jup/ob/gameplay/zm/vfx_mercdefend_damage_75.vfx" );
    level._effect[ "merc_defend_damage_destroyed" ] = loadfx( "vfx/jup/ob/gameplay/zm/vfx_mercdefend_damage_destroyed.vfx" );
    level._effect[ "merc_defend_lights_red" ] = loadfx( "vfx/jup/ob/gameplay/zm/vfx_mercdefend_lights_blinking_red.vfx" );
    level._effect[ "merc_defend_lights_green" ] = loadfx( "vfx/jup/ob/gameplay/zm/vfx_mercdefend_lights_blinking_green.vfx" );
    level._effect[ "merc_defend_loadbar" ] = loadfx( "vfx/jup/ob/gameplay/zm/vfx_mercdefend_loadbar.vfx" );
    level._effect[ "merc_defend_cig_tray" ] = loadfx( "vfx/jup/ob/gameplay/zm/vfx_mercdefend_cigarette_tray_smoke.vfx" );
    level._effect[ "merc_defend_sparks_sml" ] = loadfx( "vfx/jup/ob/gameplay/zm/vfx_mercdefend_sparks_dir_sml.vfx" );
}

// Namespace namespace_7ee9a03c8b80c102 / namespace_fd4c3f1f30da37b4
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x11ab
// Size: 0x9
function private function_ebc62d30ce909ad2()
{
    self freeentitysentient();
}

