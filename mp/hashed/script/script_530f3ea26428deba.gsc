#using script_3f8889c16399185c;
#using script_6981400abfcd765c;
#using scripts\cp_mp\weapon;
#using scripts\mp\gamelogic;
#using scripts\mp\rank;
#using scripts\mp\weaponrank;

#namespace namespace_41183c2c6273d8f;

// Namespace namespace_41183c2c6273d8f / namespace_b5e6108f786dfb5a
// Params 0
// Checksum 0x0, Offset: 0x109
// Size: 0x1f, Type: bool
function function_89e1a31bd1de0567()
{
    return function_94b952789d039abb() && getdvarint( @"hash_81f6cb3096a4d43d", 1 ) == 1;
}

// Namespace namespace_41183c2c6273d8f / namespace_b5e6108f786dfb5a
// Params 0
// Checksum 0x0, Offset: 0x131
// Size: 0x25, Type: bool
function function_ee43f827080726b1()
{
    player = self;
    return player function_83fc92d8ce12ec9e( 2 ) && !player function_83fc92d8ce12ec9e( 3 );
}

// Namespace namespace_41183c2c6273d8f / namespace_b5e6108f786dfb5a
// Params 1
// Checksum 0x0, Offset: 0x15f
// Size: 0x3e
function function_87ecb716bc207294( player )
{
    if ( isbot( player ) )
    {
        return undefined;
    }
    
    if ( player function_ee43f827080726b1() )
    {
        player function_e05669c955312c22( 3, 1 );
        
        if ( function_89e1a31bd1de0567() )
        {
            return player function_2d8bac720c7f42bb();
        }
    }
    
    return undefined;
}

// Namespace namespace_41183c2c6273d8f / namespace_b5e6108f786dfb5a
// Params 0
// Checksum 0x0, Offset: 0x1a6
// Size: 0x6a
function function_8b40ab90e906603c()
{
    if ( !function_83fc92d8ce12ec9e( 2 ) )
    {
        return 0;
    }
    
    var_cda7f1d4f4ad320f = function_ee43f827080726b1();
    
    if ( var_cda7f1d4f4ad320f )
    {
        self.var_56f36fd7cc3d8098 = 1;
    }
    
    tipsenabled = var_cda7f1d4f4ad320f;
    
    if ( !tipsenabled )
    {
        for ( progress = 3; progress <= 12 ; progress++ )
        {
            if ( function_6e6a5ca23b27a0f7( progress ) )
            {
                tipsenabled = 1;
                break;
            }
        }
    }
    
    return tipsenabled;
}

// Namespace namespace_41183c2c6273d8f / namespace_b5e6108f786dfb5a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x219
// Size: 0x91, Type: bool
function private function_6e6a5ca23b27a0f7( match )
{
    if ( match < 3 )
    {
        return false;
    }
    
    if ( match == 4 || match == 6 )
    {
        return false;
    }
    
    if ( function_83fc92d8ce12ec9e( match ) )
    {
        return false;
    }
    
    setprogress = 1;
    
    if ( self getprivatepartysize() > 1 )
    {
        setprogress = getdvarint( @"hash_c8e3d38b6e1b91f8", 1 ) == 0;
        
        if ( setprogress )
        {
            setprogress = getdvarint( @"hash_d9d26a804ed1a1aa", 1 ) == 0 || !self isfireteamleader();
        }
    }
    
    if ( setprogress )
    {
        function_e05669c955312c22( match, 1 );
    }
    
    return true;
}

// Namespace namespace_41183c2c6273d8f / namespace_b5e6108f786dfb5a
// Params 0
// Checksum 0x0, Offset: 0x2b3
// Size: 0x26, Type: bool
function function_70781ace6e552a59()
{
    return isplayer( self ) && !isbot( self ) && inprematch() && function_ee43f827080726b1();
}

// Namespace namespace_41183c2c6273d8f / namespace_b5e6108f786dfb5a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2e2
// Size: 0x12
function private function_4e21c98001ba4234()
{
    return getdvarint( @"hash_13a4ace57e9b30c9", 3 );
}

// Namespace namespace_41183c2c6273d8f / namespace_b5e6108f786dfb5a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2fd
// Size: 0x12
function private function_d6bb894eceead27a()
{
    return getdvarint( @"hash_6bc7552224fa36e3", 1 );
}

// Namespace namespace_41183c2c6273d8f / namespace_b5e6108f786dfb5a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x318
// Size: 0x15
function private function_15ca97c3fbeb7f4c()
{
    return getdvar( @"hash_9652fdeee6b218ab", "iw9_ar_mike4" );
}

// Namespace namespace_41183c2c6273d8f / namespace_b5e6108f786dfb5a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x336
// Size: 0x2e, Type: bool
function private function_7aeef922b38c730b()
{
    player = self;
    return !isbot( player ) && player getrankxp() < getrankinfomaxxp( function_4e21c98001ba4234() );
}

// Namespace namespace_41183c2c6273d8f / namespace_b5e6108f786dfb5a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x36d
// Size: 0x49, Type: bool
function private function_f2a89a989cfa8bc7()
{
    player = self;
    curweapon = player getcurrentweapon();
    weapname = scripts\cp_mp\weapon::getweaponrootname( curweapon );
    return !isbot( player ) && scripts\mp\weaponrank::getplayerweaponrank( weapname ) < function_d6bb894eceead27a();
}

// Namespace namespace_41183c2c6273d8f / namespace_b5e6108f786dfb5a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3bf
// Size: 0x12c
function private function_2d8bac720c7f42bb()
{
    player = self;
    givexpreward = player function_7aeef922b38c730b();
    giveweaponxpreward = player function_f2a89a989cfa8bc7();
    values = spawnstruct();
    xpneeded = 0;
    
    if ( givexpreward )
    {
        xpneeded = player function_ab7376cf3322041f();
    }
    
    values.finalxp = xpneeded;
    values.timexp = xpneeded;
    values.basexp = xpneeded;
    values.placementxp = 0;
    values.bonusxp = 0;
    var_46b845634a24856c = 0;
    weaponlootid = 0;
    
    if ( giveweaponxpreward )
    {
        var_1bd089321bb876b3 = function_15ca97c3fbeb7f4c();
        
        if ( isdefined( level.weaponmapdata[ var_1bd089321bb876b3 ] ) && isdefined( level.weaponmapdata[ var_1bd089321bb876b3 ].weaponlootid ) )
        {
            weaponlootid = level.weaponmapdata[ var_1bd089321bb876b3 ].weaponlootid;
        }
        
        var_46b845634a24856c = player function_8cb6f3856a8745af();
    }
    
    values.weaponlootid = weaponlootid;
    values.weaponxp = var_46b845634a24856c;
    return values;
}

// Namespace namespace_41183c2c6273d8f / namespace_b5e6108f786dfb5a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4f4
// Size: 0x86
function private function_ab7376cf3322041f()
{
    player = self;
    desiredrank = getdvarint( @"hash_13a4ace57e9b30c9", 0 );
    rankxp = getrankinfomaxxp( desiredrank );
    currentplayerxp = player getplayerdata( "common", "mpProgression", "playerLevel", "xp" ) + player.pers[ "summary" ][ "xp" ];
    return int( max( rankxp - 1 - currentplayerxp, 0 ) );
}

// Namespace namespace_41183c2c6273d8f / namespace_b5e6108f786dfb5a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x583
// Size: 0x39
function private function_8cb6f3856a8745af()
{
    player = self;
    return int( max( scripts\mp\weaponrank::getweaponrankinfominxp( function_d6bb894eceead27a() ) - player scripts\mp\weaponrank::getplayerweaponrankxp( function_15ca97c3fbeb7f4c(), "mp" ), 0 ) );
}

