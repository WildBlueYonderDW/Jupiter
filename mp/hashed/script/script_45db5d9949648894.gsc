#using script_40ee7223a578cbc8;
#using scripts\common\devgui;
#using scripts\engine\utility;

#namespace namespace_453f6d7726d3161e;

// Namespace namespace_453f6d7726d3161e / namespace_fc8e35fbcefcfd94
// Params 0
// Checksum 0x0, Offset: 0xc5
// Size: 0x5c
function function_7f1a5cba2db537c5()
{
    thread function_abafe9cd03c2c0ab();
    self._blackboard.var_d182b3cdaa8e3be7 = 3000;
    self._blackboard.var_d1a5a1cdaab45c09 = 5000;
    self._blackboard.var_4a850e88a81da5f9 = 7;
    self.var_306ac6ff52911f55 = &function_703e9acc55d0902b;
}

// Namespace namespace_453f6d7726d3161e / namespace_fc8e35fbcefcfd94
// Params 2
// Checksum 0x0, Offset: 0x129
// Size: 0x2e
function function_3f11738e6c8250e1( target_ent, arm_used )
{
    self.var_a48c549d4a877cd6 = arm_used;
    self.var_c24f43a7d0d8d195 = target_ent;
    function_306feec3952fc2ef();
}

// Namespace namespace_453f6d7726d3161e / namespace_fc8e35fbcefcfd94
// Params 0
// Checksum 0x0, Offset: 0x15f
// Size: 0x16, Type: bool
function function_550c2a40a7f8e322()
{
    return istrue( self._blackboard.var_6b0939cf3fd5d7a1 );
}

// Namespace namespace_453f6d7726d3161e / namespace_fc8e35fbcefcfd94
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x17e
// Size: 0x5e
function private function_abafe9cd03c2c0ab()
{
    self endon( "death" );
    
    while ( true )
    {
        self waittill( "unreachable_attack_start" );
        assertex( istrue( self._blackboard.var_285a93cddadff26a ), "<dev string:x1c>" );
        function_3f11738e6c8250e1( self.enemy, self._blackboard.var_37325e73c2b39c28 );
    }
}

// Namespace namespace_453f6d7726d3161e / namespace_fc8e35fbcefcfd94
// Params 3
// Checksum 0x0, Offset: 0x1e4
// Size: 0x59
function function_703e9acc55d0902b( idamage, eattacker, objweapon )
{
    if ( isdefined( eattacker.var_b285453af8b7df75 ) && isdefined( eattacker.grenadeweapon ) && objweapon == eattacker.grenadeweapon )
    {
        idamage = eattacker.var_b285453af8b7df75;
    }
    
    return idamage;
}

/#

    // Namespace namespace_453f6d7726d3161e / namespace_fc8e35fbcefcfd94
    // Params 0
    // Checksum 0x0, Offset: 0x246
    // Size: 0x30, Type: dev
    function function_a9bcc765070d0b08()
    {
        function_6e7290c8ee4f558b( "<dev string:x54>" );
        function_a9a864379a098ad6( "<dev string:x68>", "<dev string:x80>", &function_f104d7887d46f98e, 1 );
        function_fe953f000498048f();
    }

    // Namespace namespace_453f6d7726d3161e / namespace_fc8e35fbcefcfd94
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x27e
    // Size: 0xc0, Type: dev
    function private function_f104d7887d46f98e()
    {
        zombies = getaispeciesarray( "<dev string:x98>", "<dev string:xa0>" );
        closest_zombie = scripts\engine\utility::get_array_of_closest( level.players[ 0 ].origin, zombies )[ 0 ];
        
        while ( true )
        {
            if ( !isdefined( closest_zombie ) || !isalive( closest_zombie ) )
            {
                return;
            }
            
            target = closest_zombie.enemy;
            
            if ( !closest_zombie function_550c2a40a7f8e322() )
            {
                closest_zombie._blackboard.var_6b0939cf3fd5d7a1 = 1;
                closest_zombie._blackboard.var_d15d23565f5a60a1 = randomint( 2 ) == 0;
                closest_zombie notify( "<dev string:xa7>" );
            }
            
            waitframe();
        }
    }

#/
