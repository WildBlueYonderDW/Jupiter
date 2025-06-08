#using script_3b78d23dad7ec5be;
#using script_405d05c89e998922;
#using script_7edf952f8921aa6b;
#using scripts\common\callbacks;
#using scripts\common\values;
#using scripts\engine\utility;

#namespace namespace_4a108cfc226ec7d6;

// Namespace namespace_4a108cfc226ec7d6 / namespace_8d6af00582bd6cb4
// Params 0
// Checksum 0x0, Offset: 0x10f
// Size: 0x42
function function_976734974e28596e()
{
    callback::function_e7fddda1f0b46b5e( self.animsetname ) callback::add( "on_zombie_ai_damaged", &on_damaged );
    callback::function_e7fddda1f0b46b5e( self.animsetname ) callback::add( "on_is_crawling_changed", &on_is_crawling_changed );
}

// Namespace namespace_4a108cfc226ec7d6 / namespace_8d6af00582bd6cb4
// Params 0
// Checksum 0x0, Offset: 0x159
// Size: 0x1a
function init_knockdown()
{
    self.knockdowndamagethreshold = self.health * 0.01;
}

// Namespace namespace_4a108cfc226ec7d6 / namespace_8d6af00582bd6cb4
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x17b
// Size: 0x9c
function private on_damaged( params )
{
    if ( isexplosivedamagemod( params.smeansofdeath ) && ( !isdefined( params.einflictor ) || !istrue( params.einflictor.prevent_knockdown ) ) && !function_aa75c57142022473( params.sweapon ) )
    {
        if ( params.idamage > self.knockdowndamagethreshold )
        {
            if ( !function_e67a89537ae7d4b7() )
            {
                knockdown_ai( params.vpoint );
            }
        }
    }
    
    return params.idamage;
}

// Namespace namespace_4a108cfc226ec7d6 / namespace_8d6af00582bd6cb4
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x220
// Size: 0x22
function private on_is_crawling_changed( params )
{
    val::set( "is_crawling", "disallow_knockdown", namespace_9e6ef02d993a7eba::is_crawling() );
}

// Namespace namespace_4a108cfc226ec7d6 / namespace_8d6af00582bd6cb4
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x24a
// Size: 0x50, Type: bool
function private function_aa75c57142022473( weapon_object )
{
    if ( isdefined( weapon_object ) && isdefined( weapon_object.basename ) && isdefined( level.var_c16493593d07b88f ) && array_contains( level.var_c16493593d07b88f, weapon_object.basename ) )
    {
        return true;
    }
    
    return false;
}

