#using script_1336e8b6e220bbfa;
#using script_23b580b08abe064f;
#using script_2cd07641bf71242a;
#using script_3badb8914eb5ac16;
#using script_3fe2c7524c8d3505;
#using script_56e851046f535a9a;
#using script_7edf952f8921aa6b;
#using scripts\asm\asm;
#using scripts\asm\asm_bb;
#using scripts\asm\shared\variant_asm;
#using scripts\common\callbacks;
#using scripts\engine\utility;

#namespace namespace_dc9c4cdd011135ef;

// Namespace namespace_dc9c4cdd011135ef / namespace_1cf004a8aa98eafd
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x18d
// Size: 0xea
function private function_f49a30f92555b827()
{
    function_29b5fb70d7ea841();
    function_304c63cbb536c526();
    callback::function_e7fddda1f0b46b5e( self.animsetname ) callback::add( "on_move_speed_changed", &on_move_speed_changed );
    level.scr_anim[ self.animname ][ "spawn" ] = "spawn";
    level.scr_anim[ self.animname ][ "dig" ] = "dig";
    level.scr_anim[ self.animname ][ "drop" ] = "drop";
    level.scr_anim[ self.animname ][ "spawn_ground" ] = "spawn_ground";
    level.scr_anim[ self.animname ][ "howl" ] = "howl";
    level.scr_anim[ self.animname ][ "spawn_fast" ] = "spawn";
}

// Namespace namespace_dc9c4cdd011135ef / namespace_1cf004a8aa98eafd
// Params 3
// Checksum 0x0, Offset: 0x27f
// Size: 0xe7
function function_e62bc0179274066c( asmname, statename, params )
{
    function_a343ac31ca854535( &function_f49a30f92555b827 );
    self.asm.footsteps = spawnstruct();
    self.asm.footsteps.foot = "invalid";
    self.asm.footsteps.time = 0;
    self.asm.customdata = spawnstruct();
    asm_setmoveplaybackrate( 1 );
    init_melee();
    function_659c38a2f52dc596();
    function_64d97cf652a4d385();
    init_traverse();
    function_c1fd3bf3e4513334();
    callback::add( "on_ai_init", &on_ai_init );
    ent_flag_set( "zombie_asm_init_finished" );
}

// Namespace namespace_dc9c4cdd011135ef / namespace_1cf004a8aa98eafd
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x36e
// Size: 0x2e
function private on_ai_init( params )
{
    function_f1e5805da192a1ef( "run", "aitype_default", 0 );
    callback::remove( "on_ai_init", &on_ai_init );
}

// Namespace namespace_dc9c4cdd011135ef / namespace_1cf004a8aa98eafd
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3a4
// Size: 0xb
function private on_move_speed_changed( params )
{
    
}

