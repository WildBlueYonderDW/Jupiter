#using script_2b848668600efa30;
#using script_33781ab60ef13663;
#using script_35ccbf5e9962bcaa;
#using script_38c251115537f16e;
#using script_3badb8914eb5ac16;
#using script_5ebf1c5fd7739a16;
#using script_5f3926616512ec0;
#using script_7edf952f8921aa6b;
#using scripts\aitypes\bt_util;
#using scripts\anim\utility_common;
#using scripts\anim\weaponlist;
#using scripts\asm\asm;
#using scripts\asm\asm_bb;
#using scripts\asm\shared\utility;
#using scripts\common\callbacks;
#using scripts\common\metabone;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\engine\utility;

#namespace zombie_mangler;

// Namespace zombie_mangler / scripts\aitypes\zombie_mangler\zombie_mangler
// Params 1
// Checksum 0x0, Offset: 0x36f
// Size: 0x3a
function precache( params )
{
    settings = function_cb7771bf461049eb( params );
    
    if ( isdefined( settings ) )
    {
        add_fx( "mangler_weakpoint_impact_fx", settings.var_b8482d7232ea8ac4 );
    }
}

// Namespace zombie_mangler / scripts\aitypes\zombie_mangler\zombie_mangler
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3b1
// Size: 0x186
function private function_f49a30f92555b827( params )
{
    function_4c0620b02e3730ce();
    level.scr_anim[ self.animname ][ "spawn" ] = "spawn";
    function_8e401d26d58bc32d();
    function_3ff40056b91b6e90();
    function_303a0a4b0a91563();
    callback::function_e7fddda1f0b46b5e( self.animsetname ) callback::add( "on_turned", &function_e809d2e0583ea302 );
    callback::function_e7fddda1f0b46b5e( self.animsetname ) callback::add( "shocked", &function_c8bbb80c04cd9a37 );
    callback::function_e7fddda1f0b46b5e( self.animsetname ) callback::add( "shocked_end", &function_deadba29b36b687d );
    callback::function_e7fddda1f0b46b5e( self.animsetname ) callback::add( "burned", &function_bf0fe7b30fa14180 );
    callback::function_e7fddda1f0b46b5e( self.animsetname ) callback::add( "burned_end", &function_788a3fa28ef17f52 );
    callback::function_e7fddda1f0b46b5e( self.animsetname ) callback::add( "napalm_burned", &function_dbb5710ec418627e );
    callback::function_e7fddda1f0b46b5e( self.animsetname ) callback::add( "napalm_burned_end", &function_afa5ec2deb3f62a0 );
    callback::function_e7fddda1f0b46b5e( self.animsetname ) callback::add( "pre_killed_body_cloned", &function_299ef5b8dcedc53f );
    callback::function_e7fddda1f0b46b5e( self.animsetname ) callback::add( "killed_body_cloned", &function_c8c10b313b3fcf09 );
    callback::function_e7fddda1f0b46b5e( self.animsetname ) callback::add( "on_zombie_ai_damaged", &function_c3fded253ea1fc75 );
}

// Namespace zombie_mangler / scripts\aitypes\zombie_mangler\zombie_mangler
// Params 1
// Checksum 0x0, Offset: 0x53f
// Size: 0xb3
function function_e3e1894798c371bf( taskid )
{
    assert( isdefined( self.zombieaisetting ) );
    function_7415ae9399ba8e75( self.zombieaisetting );
    assert( isdefined( self.zombieaisettings.var_e58a65b7a8f5973c ) );
    callback::add( "on_first_ai_init", &function_f49a30f92555b827 );
    function_265e0e58c950559();
    function_76b312fdb8a57ebb();
    function_33d5240ded5ff831();
    function_1fc0eb1eb90c8dd0( "walk", 85 );
    function_1fc0eb1eb90c8dd0( "sprint", 175 );
    function_1eba107019abdc18();
    self.var_c3554a26521188a8 = &function_a8c9248308033e4e;
    thread initscriptable();
    return anim.success;
}

// Namespace zombie_mangler / scripts\aitypes\zombie_mangler\zombie_mangler
// Params 0
// Checksum 0x0, Offset: 0x5fb
// Size: 0x30
function initscriptable()
{
    self endon( "death" );
    scripts\engine\utility::flag_wait( "scriptables_ready" );
    waitframe();
    
    if ( self isscriptable() )
    {
        utility::function_3ab9164ef76940fd( "base", "base_on" );
    }
}

// Namespace zombie_mangler / scripts\aitypes\zombie_mangler\zombie_mangler
// Params 1
// Checksum 0x0, Offset: 0x633
// Size: 0x4b
function function_c3fded253ea1fc75( params )
{
    if ( isdefined( params.metabonename ) && !function_cec565632b7fc419( params.metabonename ) )
    {
        playfx( getfx( "mangler_weakpoint_impact_fx" ), params.vpoint );
    }
}

// Namespace zombie_mangler / scripts\aitypes\zombie_mangler\zombie_mangler
// Params 0
// Checksum 0x0, Offset: 0x686
// Size: 0x13, Type: bool
function function_a8c9248308033e4e()
{
    if ( istrue( self.var_f8a44d7cde24460a ) )
    {
        return false;
    }
    
    return true;
}

// Namespace zombie_mangler / scripts\aitypes\zombie_mangler\zombie_mangler
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6a2
// Size: 0x16e
function private function_299ef5b8dcedc53f( params )
{
    self.var_c5d25d8048e64092 = [];
    utility::function_3ab9164ef76940fd( "base", "base_off" );
    
    if ( self.var_f719fcdc90b79bb8 && self.zombieaisettings.var_e58a65b7a8f5973c.var_c7869dfe1aa33f55 )
    {
        if ( utility::function_3ab9164ef76940fd( "j_weapon_spin", "destroyed_loot" ) )
        {
            self.var_c5d25d8048e64092[ "j_weapon_spin" ] = "destroyed_loot";
        }
    }
    else if ( utility::function_3ab9164ef76940fd( "j_weapon_spin", "destroyed" ) )
    {
        self.var_c5d25d8048e64092[ "j_weapon_spin" ] = "destroyed";
    }
    
    if ( utility::function_3ab9164ef76940fd( "armored_head", "destroyed" ) )
    {
        self.var_c5d25d8048e64092[ "armored_head" ] = "destroyed";
    }
    
    if ( utility::function_3ab9164ef76940fd( "armored_torso", "destroyed" ) )
    {
        self.var_c5d25d8048e64092[ "armored_torso" ] = "destroyed";
    }
    
    if ( utility::function_3ab9164ef76940fd( "armored_shoulder_left", "destroyed" ) )
    {
        self.var_c5d25d8048e64092[ "armored_shoulder_left" ] = "destroyed";
    }
    
    if ( utility::function_3ab9164ef76940fd( "armored_leg_right", "destroyed" ) )
    {
        self.var_c5d25d8048e64092[ "armored_leg_right" ] = "destroyed";
    }
    
    if ( utility::function_3ab9164ef76940fd( "armored_leg_left", "destroyed" ) )
    {
        self.var_c5d25d8048e64092[ "armored_leg_left" ] = "destroyed";
    }
}

// Namespace zombie_mangler / scripts\aitypes\zombie_mangler\zombie_mangler
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x818
// Size: 0x139
function private function_c8c10b313b3fcf09( params )
{
    if ( isdefined( params.body ) && !istrue( self.var_1b5192e7fa448467 ) )
    {
        foreach ( part, state in self.var_c5d25d8048e64092 )
        {
            params.body setscriptablepartstate( part, state, 1 );
        }
        
        params.body thread function_33bbf5c8cadc9958();
    }
    
    if ( istrue( ent_flag( "burned" ) ) )
    {
        if ( isdefined( params.body ) )
        {
            params.body utility::function_3ab9164ef76940fd( "burned", "burned_on" );
            params.body thread function_d13d798c34386976();
        }
        
        return;
    }
    
    if ( istrue( ent_flag( "napalm_burned" ) ) )
    {
        if ( isdefined( params.body ) )
        {
            params.body utility::function_3ab9164ef76940fd( "napalm_burned", "napalm_burned_on" );
            params.body thread function_c14610f0b3bdffe6();
        }
    }
}

// Namespace zombie_mangler / scripts\aitypes\zombie_mangler\zombie_mangler
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x959
// Size: 0x1e
function private function_33bbf5c8cadc9958()
{
    wait 3;
    
    if ( isdefined( self ) )
    {
        utility::function_3677f2be30fdd581( "j_weapon_spin", "dead" );
    }
}

// Namespace zombie_mangler / scripts\aitypes\zombie_mangler\zombie_mangler
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x97f
// Size: 0x1e
function private function_d13d798c34386976()
{
    wait 3;
    
    if ( isdefined( self ) )
    {
        utility::function_3677f2be30fdd581( "burned", "burned_off" );
    }
}

// Namespace zombie_mangler / scripts\aitypes\zombie_mangler\zombie_mangler
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9a5
// Size: 0x1e
function private function_c14610f0b3bdffe6()
{
    wait 3;
    
    if ( isdefined( self ) )
    {
        utility::function_3677f2be30fdd581( "napalm_burned", "napalm_burned_off" );
    }
}

// Namespace zombie_mangler / scripts\aitypes\zombie_mangler\zombie_mangler
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x9cb
// Size: 0x1c
function private function_c8bbb80c04cd9a37( var_a21093610d4de2ed )
{
    utility::function_3ab9164ef76940fd( "shocked", "shocked_on" );
}

// Namespace zombie_mangler / scripts\aitypes\zombie_mangler\zombie_mangler
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x9ef
// Size: 0x1c
function private function_deadba29b36b687d( var_a21093610d4de2ed )
{
    utility::function_3677f2be30fdd581( "shocked", "shocked_off" );
}

// Namespace zombie_mangler / scripts\aitypes\zombie_mangler\zombie_mangler
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa13
// Size: 0x1c
function private function_bf0fe7b30fa14180( var_12c084a213d7ad2 )
{
    utility::function_3ab9164ef76940fd( "burned", "burned_on" );
}

// Namespace zombie_mangler / scripts\aitypes\zombie_mangler\zombie_mangler
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa37
// Size: 0x1c
function private function_788a3fa28ef17f52( var_12c084a213d7ad2 )
{
    utility::function_3677f2be30fdd581( "burned", "burned_off" );
}

// Namespace zombie_mangler / scripts\aitypes\zombie_mangler\zombie_mangler
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa5b
// Size: 0x1c
function private function_dbb5710ec418627e( var_12c084a213d7ad2 )
{
    utility::function_3ab9164ef76940fd( "napalm_burned", "napalm_burned_on" );
}

// Namespace zombie_mangler / scripts\aitypes\zombie_mangler\zombie_mangler
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa7f
// Size: 0x1c
function private function_afa5ec2deb3f62a0( var_12c084a213d7ad2 )
{
    utility::function_3677f2be30fdd581( "napalm_burned", "napalm_burned_off" );
}

// Namespace zombie_mangler / scripts\aitypes\zombie_mangler\zombie_mangler
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xaa3
// Size: 0x3c
function private function_e809d2e0583ea302( var_8c62cb683d643eb7 )
{
    utility::function_3ab9164ef76940fd( "brainrot", "brainrot_on" );
    namespace_277ce153e9305d9d::function_d04d397bd793d2a3( 0, 1 );
    self._blackboard.var_8d19c6ba087e7a86 = 1;
}

