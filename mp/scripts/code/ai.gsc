#namespace ai;

// Namespace ai / scripts\code\ai
// Params 0
// Checksum 0x0, Offset: 0x587
// Size: 0x1e8
function free_expendable()
{
    if ( !isdefined( self.spawner ) || !isdefined( self.script_suspend ) )
    {
        return;
    }
    
    spawner = self.spawner;
    struct = spawnstruct();
    struct.origin = self.origin;
    struct.angles = self.angles;
    struct.suspendtime = gettime();
    
    if ( isdefined( self.suspendvars ) )
    {
        struct.suspendvars = self.suspendvars;
    }
    else
    {
        struct.suspendvars = spawnstruct();
    }
    
    if ( isdefined( self.stealth ) )
    {
        struct.stealth = spawnstruct();
        struct.stealth.bsmstate = self.var_fe5ebefa740c7106;
        
        if ( isdefined( self.var_743f5eeb386835f5 ) )
        {
            struct.stealth.investigateevent = self [[ self.var_743f5eeb386835f5 ]]();
        }
    }
    
    if ( isdefined( self.node ) )
    {
        if ( isdefined( self.using_goto_node ) )
        {
            if ( isdefined( self.node.targetname ) )
            {
                struct.target = self.node.targetname;
            }
            
            struct.node = self.node;
        }
        
        struct.target = self.node.targetname;
    }
    
    spawner.suspended_ai = struct;
    
    if ( isdefined( self.script_suspend_group ) && !isdefined( self.script_free ) )
    {
        free_groupname( self.script_suspend_group );
    }
    
    /#
        spawner thread function_1ef621491ffaeede();
    #/
}

// Namespace ai / scripts\code\ai
// Params 1
// Checksum 0x0, Offset: 0x777
// Size: 0x10b
function free_groupname( groupname )
{
    if ( !isdefined( level.processfreegroupname ) )
    {
        level.processfreegroupname = [];
    }
    
    if ( isdefined( level.processfreegroupname[ groupname ] ) )
    {
        return;
    }
    
    level.processfreegroupname[ groupname ] = 1;
    aiarray = getaiarray();
    
    foreach ( ai in aiarray )
    {
        if ( ai == self )
        {
            continue;
        }
        
        if ( !isdefined( ai.script_suspend_group ) )
        {
            continue;
        }
        
        if ( ai.script_suspend_group != groupname )
        {
            continue;
        }
        
        ai.script_free = 1;
        ai free_expendable();
        println( "<dev string:x1c>" + groupname + "<dev string:x31>" + ai.origin );
        ai delete();
    }
    
    level.processfreegroupname[ groupname ] = undefined;
}

/#

    // Namespace ai / scripts\code\ai
    // Params 1
    // Checksum 0x0, Offset: 0x88a
    // Size: 0xa9, Type: dev
    function function_1ef621491ffaeede( spawner )
    {
        self endon( "<dev string:x3e>" );
        
        if ( !isdefined( level.func ) )
        {
            return;
        }
        
        if ( !isdefined( level.func[ "<dev string:x47>" ] ) )
        {
            return;
        }
        
        while ( true )
        {
            waitframe();
            
            if ( !isdefined( self.suspended_ai ) )
            {
                return;
            }
            
            if ( getdvarint( @"hash_6efeeea168f0a561" ) == 0 )
            {
                continue;
            }
            
            [[ level.func[ "<dev string:x47>" ] ]]( self.suspended_ai.origin, self.suspended_ai.angles, ( 1, 0.5, 0.25 ) );
        }
    }

#/

// Namespace ai / scripts\code\ai
// Params 2
// Checksum 0x0, Offset: 0x93b
// Size: 0xf6
function create_weapon_in_script( weaponarray, weaponposition )
{
    if ( !isdefined( level.fnscriptedweaponassignment ) )
    {
        self.usescriptedweapon = undefined;
        
        if ( !isdefined( weaponarray ) )
        {
            weapon = nullweapon();
        }
        else if ( !isarray( weaponarray ) && weaponarray == "" )
        {
            weapon = nullweapon();
        }
        else if ( isarray( weaponarray ) )
        {
            weapon = makeweapon( weaponarray[ randomint( weaponarray.size ) ] );
        }
        else
        {
            weapon = makeweapon( weaponarray );
        }
        
        if ( !isnullweapon( weapon ) )
        {
            self.scriptedweaponfailed = 1;
            
            if ( isdefined( weaponposition ) && weaponposition == "sidearm" )
            {
                self.scriptedweaponfailed_sidearmarray = weaponarray;
            }
            else
            {
                self.scriptedweaponfailed_primaryarray = weaponarray;
            }
        }
        
        println( "<dev string:x57>" + self getentitynumber() + "<dev string:x91>" + getweaponbasename( weapon ) );
        return weapon;
    }
    
    return [[ level.fnscriptedweaponassignment ]]( weaponarray, weaponposition );
}

// Namespace ai / scripts\code\ai
// Params 6
// Checksum 0x0, Offset: 0xa39
// Size: 0x77, Type: bool
function stealth_callback( callbackname, ai, param1, param2, param3, param4 )
{
    result = undefined;
    
    if ( isdefined( level.stealth.var_e376d807bb8ce93b ) )
    {
        result = ai [[ level.stealth.var_e376d807bb8ce93b ]]( callbackname, param1, param2, param3, param4 );
    }
    
    return istrue( result );
}

// Namespace ai / scripts\code\ai
// Params 3
// Checksum 0x0, Offset: 0xab9
// Size: 0x37
function function_9aead378ca03cb28( charactertype, position, dormantindex )
{
    if ( isdefined( level.var_74e9c02b56e4ba52 ) )
    {
        [[ level.var_74e9c02b56e4ba52 ]]( charactertype, position, dormantindex );
    }
}

// Namespace ai / scripts\code\ai
// Params 2
// Checksum 0x0, Offset: 0xaf8
// Size: 0x2e
function dormant_callback( ent, dormantindex )
{
    if ( isdefined( level.var_8a42b71f799936ad ) )
    {
        [[ level.var_8a42b71f799936ad ]]( ent, dormantindex );
    }
}

// Namespace ai / scripts\code\ai
// Params 1
// Checksum 0x0, Offset: 0xb2e
// Size: 0x27
function function_d5ee270afc41e925( dormantindex )
{
    if ( isdefined( level.var_19ef4572543c12c1 ) )
    {
        return [[ level.var_19ef4572543c12c1 ]]( dormantindex );
    }
    
    return 1;
}

// Namespace ai / scripts\code\ai
// Params 3
// Checksum 0x0, Offset: 0xb5e
// Size: 0x37
function function_8ff6b395c2615881( callbackname, requestid, data )
{
    if ( isdefined( level.var_3ae5f7de11d142f ) )
    {
        return [[ level.var_3ae5f7de11d142f ]]( callbackname, requestid, data );
    }
}

// Namespace ai / scripts\code\ai
// Params 2
// Checksum 0x0, Offset: 0xb9d
// Size: 0x33
function function_2c18f4deacb75a6d( ent, state )
{
    if ( isdefined( ent.var_82420c8df7f30a5b ) )
    {
        ent thread [[ ent.var_82420c8df7f30a5b ]]( state );
    }
}

// Namespace ai / scripts\code\ai
// Params 0
// Checksum 0x0, Offset: 0xbd8
// Size: 0x2
function function_2392636ed67e9fed()
{
    
}

// Namespace ai / scripts\code\ai
// Params 0
// Checksum 0x0, Offset: 0xbe2
// Size: 0x7
function function_56543479237033c3()
{
    return &function_2392636ed67e9fed;
}

// Namespace ai / scripts\code\ai
// Params 0
// Checksum 0x0, Offset: 0xbf2
// Size: 0x9
function function_74939cb3d7c3057b()
{
    function_87dc2db63d1cfe13();
}

// Namespace ai / scripts\code\ai
// Params 0
// Checksum 0x0, Offset: 0xc03
// Size: 0x2099
function function_87dc2db63d1cfe13()
{
    if ( true )
    {
        var_5960b342a6ef48d = spawnstruct();
        var_5960b342a6ef48d.var_73d903554c10ec93[ 0 ] = spawnstruct();
        var_5960b342a6ef48d.var_73d903554c10ec93[ 0 ].name = "default";
        var_5960b342a6ef48d.var_73d903554c10ec93[ 0 ].query = spawnstruct();
        obj = var_5960b342a6ef48d.var_73d903554c10ec93[ 0 ].query;
        obj.var_9efb032663ad97c1[ 0 ] = 64;
        obj.var_3d5cc1a409a98fd0 = 300;
        obj.var_63173b6856e415e7 = 130;
        obj.var_94cf3022fca2b151 = 200;
        var_5960b342a6ef48d.var_73d903554c10ec93[ 0 ].combined[ 0 ] = spawnstruct();
        obj = var_5960b342a6ef48d.var_73d903554c10ec93[ 0 ].combined[ 0 ];
        obj.types = "aim_only";
        obj.decelwindow = spawnstruct();
        obj.decelwindow.speed = 80;
        obj.decelwindow.types = "aim_only";
        obj.action = spawnstruct();
        obj.action.var_c84c06a4463ee99c = 24;
        obj.action.var_d40d255ab3b9623b = 90;
        obj.action.var_fb95ad1022e86854 = 90;
        obj.action.var_1373755bb3b8c41 = 32;
        obj.validation = spawnstruct();
        obj.validation.var_d1e64a8da97c5f9a = 170;
        obj.validation.var_d40d255ab3b9623b = 70;
        obj.validation.var_fb95ad1022e86854 = 70;
        obj.validation.var_1373755bb3b8c41 = 32;
        obj.validation.var_c2866d21d8ade257 = 60;
        obj.validation.var_6af25e49ed56b1cc = 300;
        var_5960b342a6ef48d.var_73d903554c10ec93[ 0 ].combined[ 1 ] = spawnstruct();
        obj = var_5960b342a6ef48d.var_73d903554c10ec93[ 0 ].combined[ 1 ];
        obj.types = "strafe_only";
        obj.decelwindow = spawnstruct();
        obj.decelwindow.speed = 60;
        obj.decelwindow.types = "strafe_only";
        obj.action = spawnstruct();
        obj.action.var_c84c06a4463ee99c = 24;
        obj.action.var_d40d255ab3b9623b = 180;
        obj.action.var_fb95ad1022e86854 = 120;
        obj.action.var_1373755bb3b8c41 = 32;
        obj.action.var_2efd5c4e05ac0023 = 0.5;
        obj.validation = spawnstruct();
        obj.validation.var_d1e64a8da97c5f9a = 170;
        obj.validation.var_d40d255ab3b9623b = 90;
        obj.validation.var_fb95ad1022e86854 = 90;
        obj.validation.var_1373755bb3b8c41 = 32;
        obj.validation.var_c2866d21d8ade257 = 60;
        obj.validation.var_6af25e49ed56b1cc = 200;
        var_5960b342a6ef48d.var_73d903554c10ec93[ 0 ].combined[ 2 ] = spawnstruct();
        obj = var_5960b342a6ef48d.var_73d903554c10ec93[ 0 ].combined[ 2 ];
        obj.types = "shallow";
        obj.decelwindow = spawnstruct();
        obj.decelwindow.speed = 49;
        obj.decelwindow.maxspeedvalid = 75;
        obj.decelwindow.types = "shallow";
        obj.action = spawnstruct();
        obj.action.var_c84c06a4463ee99c = 24;
        obj.action.var_1373755bb3b8c41 = 32;
        obj.animtest = spawnstruct();
        obj.animtest.var_832c9aa8484af5bb = 48;
        obj.validation = spawnstruct();
        obj.validation.var_26e073f24350c158 = 40;
        obj.validation.var_d1e64a8da97c5f9a = 135;
        obj.validation.maxspeed = 50;
        obj.validation.asmstatename = "cautious_shallow_corner_check";
        obj.validation.var_1373755bb3b8c41 = 32;
        var_5960b342a6ef48d.var_73d903554c10ec93[ 0 ].decelwindows[ 0 ] = spawnstruct();
        var_5960b342a6ef48d.var_73d903554c10ec93[ 0 ].decelwindows[ 0 ].types = "shallow";
        var_5960b342a6ef48d.var_73d903554c10ec93[ 0 ].decelwindows[ 0 ].speed = 80;
        var_5960b342a6ef48d.var_73d903554c10ec93[ 0 ].decelwindows[ 0 ].minspeedvalid = 75;
        var_5960b342a6ef48d.var_73d903554c10ec93[ 0 ].validations[ 0 ] = spawnstruct();
        obj = var_5960b342a6ef48d.var_73d903554c10ec93[ 0 ].validations[ 0 ];
        obj.types = "shallow";
        obj.asmstatename = "cornercheck_shallow_fast";
        obj.maxspeed = 90;
        obj.minspeed = 75;
        obj.var_26e073f24350c158 = 40;
        obj.var_d1e64a8da97c5f9a = 135;
        var_5960b342a6ef48d.var_73d903554c10ec93[ 0 ].var_3951cabc31d342f = 6;
        var_5960b342a6ef48d.var_73d903554c10ec93[ 1 ] = structcopy( var_5960b342a6ef48d.var_73d903554c10ec93[ 0 ], 1 );
        var_5960b342a6ef48d.var_73d903554c10ec93[ 1 ].name = "nightwar_start";
        var_5960b342a6ef48d.var_73d903554c10ec93[ 1 ].allowedtypes = "shallow";
        var_5960b342a6ef48d.var_73d903554c10ec93[ 1 ].combined[ 0 ].visibility = spawnstruct();
        var_5960b342a6ef48d.var_73d903554c10ec93[ 1 ].combined[ 0 ].visibility.var_6bb8b086cbae934 = 0;
        var_5960b342a6ef48d.var_73d903554c10ec93[ 1 ].combined[ 0 ].visibility.var_5f5e6a9e5b0d045f = 0;
        var_5960b342a6ef48d.var_73d903554c10ec93[ 1 ].combined[ 1 ].visibility = spawnstruct();
        var_5960b342a6ef48d.var_73d903554c10ec93[ 1 ].combined[ 1 ].visibility.var_6bb8b086cbae934 = 0;
        var_5960b342a6ef48d.var_73d903554c10ec93[ 1 ].combined[ 1 ].visibility.var_5f5e6a9e5b0d045f = 0;
        var_5960b342a6ef48d.var_73d903554c10ec93[ 1 ].combined[ 2 ].visibility = spawnstruct();
        var_5960b342a6ef48d.var_73d903554c10ec93[ 1 ].combined[ 2 ].visibility.var_6bb8b086cbae934 = 0;
        var_5960b342a6ef48d.var_73d903554c10ec93[ 1 ].combined[ 2 ].visibility.var_5f5e6a9e5b0d045f = 0;
        var_5960b342a6ef48d.var_73d903554c10ec93[ 2 ] = structcopy( var_5960b342a6ef48d.var_73d903554c10ec93[ 0 ], 1 );
        var_5960b342a6ef48d.var_73d903554c10ec93[ 2 ].name = "soldier_paranoid";
        obj = var_5960b342a6ef48d.var_73d903554c10ec93[ 2 ].query;
        obj.var_9efb032663ad97c1[ 0 ] = 64;
        obj.var_9efb032663ad97c1[ 1 ] = 164;
        obj.var_3d5cc1a409a98fd0 = 300;
        obj.var_63173b6856e415e7 = 130;
        obj.var_94cf3022fca2b151 = 200;
        obj.var_f2801301f3d1c032 = 200;
        obj = var_5960b342a6ef48d.var_73d903554c10ec93[ 2 ].combined[ 0 ];
        obj.validation.var_d1e64a8da97c5f9a = 170;
        obj.validation.var_d40d255ab3b9623b = 70;
        obj.validation.var_fb95ad1022e86854 = 70;
        obj.validation.var_1373755bb3b8c41 = 32;
        obj.validation.var_c2866d21d8ade257 = 60;
        obj.validation.var_6af25e49ed56b1cc = 300;
        obj = var_5960b342a6ef48d.var_73d903554c10ec93[ 2 ].combined[ 1 ];
        obj.validation.var_d1e64a8da97c5f9a = 170;
        obj.validation.var_d40d255ab3b9623b = 90;
        obj.validation.var_fb95ad1022e86854 = 90;
        obj.validation.var_1373755bb3b8c41 = 32;
        obj.validation.var_c2866d21d8ade257 = 60;
        obj.validation.var_6af25e49ed56b1cc = 200;
        var_5960b342a6ef48d.var_73d903554c10ec93[ 3 ] = structcopy( var_5960b342a6ef48d.var_73d903554c10ec93[ 0 ], 1 );
        var_5960b342a6ef48d.var_73d903554c10ec93[ 3 ].name = "combat_default";
        var_5960b342a6ef48d.var_73d903554c10ec93[ 3 ].validations[ 0 ].requiretarget = 1;
        obj = var_5960b342a6ef48d.var_73d903554c10ec93[ 3 ].combined[ 0 ];
        obj.decelwindow.types = "";
        obj.validation.requiretarget = 1;
        obj = var_5960b342a6ef48d.var_73d903554c10ec93[ 3 ].combined[ 1 ];
        obj.decelwindow.types = "";
        obj.validation.requiretarget = 1;
        obj = var_5960b342a6ef48d.var_73d903554c10ec93[ 3 ].combined[ 2 ];
        obj.decelwindow.types = "";
        obj.validation.requiretarget = 1;
        function_6b4ab6c856a01415( "component", var_5960b342a6ef48d, "ai_cornercheck_behaviors", "ai_cornercheck_behaviors_default_script" );
    }
    
    if ( true )
    {
        var_62193d5aea59930f = spawnstruct();
        var_62193d5aea59930f.var_ec5d24a985f94861 = "simple";
        var_daf5681b8a09c71c = spawnstruct();
        var_daf5681b8a09c71c.var_73d903554c10ec93[ 0 ] = structcopy( var_62193d5aea59930f, 1 );
        obj = var_daf5681b8a09c71c.var_73d903554c10ec93[ 0 ];
        obj.name = "cover_right";
        obj.limit_left = 15;
        obj.limit_right = 30;
        obj.limit_up = 20;
        obj.limit_down = 30;
        var_daf5681b8a09c71c.var_73d903554c10ec93[ 1 ] = structcopy( var_62193d5aea59930f, 1 );
        obj = var_daf5681b8a09c71c.var_73d903554c10ec93[ 1 ];
        obj.name = "cover_left";
        obj.limit_left = 60;
        obj.limit_right = 15;
        obj.limit_up = 20;
        obj.limit_down = 30;
        var_daf5681b8a09c71c.var_73d903554c10ec93[ 2 ] = structcopy( var_62193d5aea59930f, 1 );
        obj = var_daf5681b8a09c71c.var_73d903554c10ec93[ 2 ];
        obj.name = "cover_crouch";
        obj.limit_left = 15;
        obj.limit_right = 45;
        obj.limit_up = 20;
        obj.limit_down = 30;
        var_daf5681b8a09c71c.var_73d903554c10ec93[ 3 ] = structcopy( var_62193d5aea59930f, 1 );
        obj = var_daf5681b8a09c71c.var_73d903554c10ec93[ 3 ];
        obj.name = "exposed";
        obj.limit_left = 45;
        obj.limit_right = 45;
        obj.limit_up = 30;
        obj.limit_down = 30;
        var_daf5681b8a09c71c.var_73d903554c10ec93[ 4 ] = structcopy( var_62193d5aea59930f, 1 );
        obj = var_daf5681b8a09c71c.var_73d903554c10ec93[ 4 ];
        obj.name = "default";
        obj.limit_left = 60;
        obj.limit_right = 60;
        obj.limit_up = 45;
        obj.limit_down = 45;
        var_daf5681b8a09c71c.var_73d903554c10ec93[ 5 ] = structcopy( var_62193d5aea59930f, 1 );
        obj = var_daf5681b8a09c71c.var_73d903554c10ec93[ 5 ];
        obj.name = "exposed_aim";
        obj.limit_left = 20;
        obj.limit_right = 20;
        obj.limit_up = 30;
        obj.limit_down = 10;
        var_daf5681b8a09c71c.var_73d903554c10ec93[ 6 ] = structcopy( var_daf5681b8a09c71c.var_73d903554c10ec93[ 4 ], 1 );
        obj = var_daf5681b8a09c71c.var_73d903554c10ec93[ 6 ];
        obj.name = "advanced_default";
        obj.var_ec5d24a985f94861 = "advanced_default";
        obj.limit_left = 120;
        obj.limit_right = 120;
        obj.limit_up = 80;
        obj.limit_down = 80;
        var_daf5681b8a09c71c.var_73d903554c10ec93[ 7 ] = structcopy( var_62193d5aea59930f, 1 );
        obj = var_daf5681b8a09c71c.var_73d903554c10ec93[ 7 ];
        obj.name = "tight_with_player";
        obj.limit_left = 60;
        obj.limit_right = 60;
        obj.limit_up = 45;
        obj.limit_down = 45;
        obj.overridepercent = 100;
        obj.var_6f341aa6029aa6a6 = 0;
        var_daf5681b8a09c71c.var_73d903554c10ec93[ 8 ] = structcopy( var_62193d5aea59930f, 1 );
        obj = var_daf5681b8a09c71c.var_73d903554c10ec93[ 8 ];
        obj.name = "default_no_spine";
        obj.limit_left = 60;
        obj.limit_right = 60;
        obj.limit_up = 45;
        obj.limit_down = 45;
        obj.var_ece6263298ae714 = 1;
        var_daf5681b8a09c71c.var_73d903554c10ec93[ 9 ] = structcopy( var_62193d5aea59930f, 1 );
        obj = var_daf5681b8a09c71c.var_73d903554c10ec93[ 9 ];
        obj.name = "animscripted_with_player";
        obj.limit_left = 100;
        obj.limit_right = 100;
        obj.limit_up = 45;
        obj.limit_down = 45;
        obj.var_fe3d05a9f4ea87e = 1;
        obj.var_cb96e471adcd131 = 0;
        function_6b4ab6c856a01415( "component", var_daf5681b8a09c71c, "ai_lookat_behaviors", "ai_lookat_behaviors_default_script" );
    }
    
    if ( true )
    {
        var_3f42592f8e297ea = spawnstruct();
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[ 0 ] = spawnstruct();
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[ 0 ].mappedname = "cover_right";
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[ 0 ].var_a3476363ca654e1c[ 0 ] = "cover_right_crouch";
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[ 0 ].var_a3476363ca654e1c[ 1 ] = "cover_right";
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[ 1 ] = spawnstruct();
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[ 1 ].mappedname = "cover_left";
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[ 1 ].var_a3476363ca654e1c[ 0 ] = "cover_left_crouch";
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[ 1 ].var_a3476363ca654e1c[ 1 ] = "cover_left";
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[ 2 ] = spawnstruct();
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[ 2 ].mappedname = "cover_crouch";
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[ 2 ].var_a3476363ca654e1c[ 0 ] = "cover_crouch";
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[ 3 ] = spawnstruct();
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[ 3 ].mappedname = "exposed";
        arr[ 0 ] = "cover_right_crouch_stand";
        arr[ arr.size ] = "cover_right_crouch_exposed_left";
        arr[ arr.size ] = "cover_right_crouch_exposed_right";
        arr[ arr.size ] = "cover_left_crouch_stand";
        arr[ arr.size ] = "cover_left_crouch_exposed_left";
        arr[ arr.size ] = "cover_left_crouch_exposed_right";
        arr[ arr.size ] = "cover_left_crouch_exposed_a";
        arr[ arr.size ] = "cover_left_crouch_exposed_b";
        arr[ arr.size ] = "cover_right_crouch_exposed_a";
        arr[ arr.size ] = "cover_right_crouch_exposed_b";
        arr[ arr.size ] = "cover_left_exposed_a";
        arr[ arr.size ] = "cover_left_exposed_b";
        arr[ arr.size ] = "cover_right_exposed_a";
        arr[ arr.size ] = "cover_right_exposed_b";
        arr[ arr.size ] = "exposed_idle";
        arr[ arr.size ] = "cover_stand";
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[ 3 ].var_a3476363ca654e1c = arr;
        function_6b4ab6c856a01415( "component", var_3f42592f8e297ea, "ai_lookat_anim_mappings", "ai_lookat_anim_mappings_default_script" );
    }
    
    if ( true )
    {
        var_b8c784bb7e525fcf = spawnstruct();
        var_b8c784bb7e525fcf.m_settings[ 0 ] = spawnstruct();
        var_b8c784bb7e525fcf.m_settings[ 0 ].name = "default";
        var_b8c784bb7e525fcf.m_settings[ 0 ].minaccuracy = getdvarfloat( @"hash_f8240d5c0c37ac7e", 0.4 );
        var_b8c784bb7e525fcf.m_settings[ 0 ].maxaccuracy = getdvarfloat( @"hash_960bb94e318db890", 1.2 );
        var_b8c784bb7e525fcf.m_settings[ 0 ].walkspeed = 55;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_93185d472b55082 = 120;
        var_b8c784bb7e525fcf.m_settings[ 0 ].runspeed = 200;
        var_b8c784bb7e525fcf.m_settings[ 0 ].acceleration = 300;
        var_b8c784bb7e525fcf.m_settings[ 0 ].deceleration = -300;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_26e7c5c27c4a71a5 = 200;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_810f84117b47d883 = 300;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_97184e9f093ea3a0 = 550;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_12fa7e4bf627b292 = 700;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_8756726934e12803 = 1000;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_3afd9cf782198639 = 0;
        var_b8c784bb7e525fcf.m_settings[ 0 ].stopdistance = 20;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_3facd58886dfd323 = 1500;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_6358e5c58d47f837 = 1000;
        var_b8c784bb7e525fcf.m_settings[ 0 ].chargecooldown = 3000;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_4ab749aad99e7631 = 4000;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_63bc3f012ac7583e = 2000;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_e1283f20324cb7dd = 100;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_2b44a72e6286cae7 = 4000;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_2efb9de526add856 = 10000;
        var_b8c784bb7e525fcf.m_settings[ 0 ].clustermaxdist = 512;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_f5f29f48bf54f95e = 0.86;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_e773207de29064c4 = 200;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_73849610029138d6 = 2500;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_e3462e8bcc2c2bbb = 7000;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_91adc28ce868e001 = 8000;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_d6c13152ac9aa81d = 1000;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_ee7e07bdbdae989b = 1250;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_f5d9e4cdce6fc2f9 = 200;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_f23d7d041b2acfb3 = 300;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_fa40aef304cab126 = 600;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_db66dd499f459cda = 50;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_dafbef1cc10672c0 = 100;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_97d83c01d694ebef = 200;
        var_b8c784bb7e525fcf.m_settings[ 0 ].var_4ddfc5d089928b41 = 300;
        function_6b4ab6c856a01415( "component", var_b8c784bb7e525fcf, "ai_jailer_settings", "ai_jailer_settings_default_script" );
    }
    
    if ( true )
    {
        var_6d75cadebb718bde = spawnstruct();
        var_6d75cadebb718bde.var_51112681bd4d019b[ 0 ] = spawnstruct();
        behaviorspec = var_6d75cadebb718bde.var_51112681bd4d019b[ 0 ];
        behaviorspec.name = "default";
        behaviorspec.var_4b83a6c557f7c86f[ 0 ] = spawnstruct();
        obj = behaviorspec.var_4b83a6c557f7c86f[ 0 ];
        obj.name = "default";
        obj.var_bcc1548fdc16ad48 = "look_glance";
        obj.var_c749ad488c6d5e09 = "aim_default";
        obj.var_f834d1a05586efc = "default";
        obj.var_b7960a38a0297273 = "default";
        obj.var_1d868cc67f9dd5bb = "default";
        behaviorspec.var_4b83a6c557f7c86f[ 1 ] = spawnstruct();
        obj = behaviorspec.var_4b83a6c557f7c86f[ 1 ];
        obj.name = "panic";
        obj.var_bcc1548fdc16ad48 = "look_glance";
        obj.var_c749ad488c6d5e09 = "aim_default";
        obj.var_f834d1a05586efc = "default";
        obj.var_b7960a38a0297273 = "default";
        obj.var_1d868cc67f9dd5bb = "default";
        behaviorspec.var_4b83a6c557f7c86f[ 2 ] = spawnstruct();
        obj = behaviorspec.var_4b83a6c557f7c86f[ 2 ];
        obj.name = "civ_default";
        obj.var_bcc1548fdc16ad48 = "look_glance";
        obj.var_c749ad488c6d5e09 = "aim_default";
        obj.var_f834d1a05586efc = "default";
        obj.var_b7960a38a0297273 = "no_aim";
        obj.var_1d868cc67f9dd5bb = "default";
        behaviorspec.var_89df35098e4c90a2[ 0 ] = spawnstruct();
        obj = behaviorspec.var_89df35098e4c90a2[ 0 ];
        obj.name = "default";
        obj.var_22366064e4b2b3ff = -1;
        obj.var_22136e64e48c8b11 = -1;
        obj.var_d8306289a5a3547b = 1000;
        obj.var_d80d5889a57cf6c5 = 2000;
        obj.var_2c42dba8ffe8e4d6 = 1500;
        obj.var_2c65cda9000f0dc4 = 3000;
        obj.var_c89e2d1e53b941ee = 1000;
        obj.var_ecbe7a4cf4c2babe = 4000;
        obj.var_ae27a0f08d1cf26d = 1500;
        behaviorspec.var_89df35098e4c90a2[ 1 ] = spawnstruct();
        obj = behaviorspec.var_89df35098e4c90a2[ 1 ];
        obj.name = "no_aim";
        obj.allowedsources = "none";
        behaviorspec.var_c371c157a0ead74a[ 0 ] = spawnstruct();
        obj = behaviorspec.var_c371c157a0ead74a[ 0 ];
        obj.name = "default";
        obj.var_22366064e4b2b3ff = 1500;
        obj.var_22136e64e48c8b11 = 3000;
        obj.var_d8306289a5a3547b = 1000;
        obj.var_d80d5889a57cf6c5 = 2000;
        obj.var_2c42dba8ffe8e4d6 = 1500;
        obj.var_2c65cda9000f0dc4 = 3000;
        obj.var_c89e2d1e53b941ee = 500;
        obj.var_ecbe7a4cf4c2babe = 500;
        obj.var_ae27a0f08d1cf26d = 1500;
        behaviorspec.var_c371c157a0ead74a[ 1 ] = spawnstruct();
        obj = behaviorspec.var_c371c157a0ead74a[ 1 ];
        obj.name = "no_look";
        obj.allowedsources = "none";
        behaviorspec.var_fd50e6db62ce8cc5[ 0 ] = spawnstruct();
        obj = behaviorspec.var_fd50e6db62ce8cc5[ 0 ];
        obj.name = "look_glance";
        obj.allowedsources = "all";
        obj.var_1550743f6e9673a5 = 60;
        obj.var_15737e3f6ebcd15b = 90;
        obj.anglebias = 10;
        obj.var_e16f134ab2dba426 = 60;
        obj.maxyaw = 90;
        obj.mindistance = 0;
        obj.maxdistance = 9999;
        behaviorspec.var_fd50e6db62ce8cc5[ 1 ] = spawnstruct();
        obj = behaviorspec.var_fd50e6db62ce8cc5[ 1 ];
        obj.name = "aim_default";
        obj.allowedsources = "all";
        obj.var_1550743f6e9673a5 = 0;
        obj.var_15737e3f6ebcd15b = 90;
        obj.anglebias = 10;
        obj.var_e16f134ab2dba426 = 60;
        obj.maxyaw = 90;
        obj.mindistance = 0;
        obj.maxdistance = 9999;
        behaviorspec.var_726cbdb5ce313d64[ 0 ] = spawnstruct();
        obj1 = behaviorspec.var_726cbdb5ce313d64[ 0 ];
        obj1.name = "default";
        obj1.var_40d773ffebb9d944[ 0 ] = spawnstruct();
        obj2 = obj1.var_40d773ffebb9d944[ 0 ];
        obj2.sources = "all";
        obj2.mindistance = 0;
        obj2.maxdistance = 512;
        obj2.minangle = -90;
        obj2.maxangle = 90;
        obj2.var_3821d46c3a4c58af = "default";
        behaviorspec.var_2c9fecf790dd3de3[ 0 ] = spawnstruct();
        obj = behaviorspec.var_2c9fecf790dd3de3[ 0 ];
        obj.name = "default";
        obj.startinginterest = 0;
        obj.var_d628c443c1ece758 = 700;
        obj.var_d64bda43c2135f72 = 1400;
        obj.var_a4ab7e2116dad865 = 2000;
        obj.var_a4cf88211703691b = 3000;
        obj.timeout = 5000;
        obj.priority = "background";
        function_6b4ab6c856a01415( "component", var_6d75cadebb718bde, "ai_focus_behaviors", "ai_focus_behaviors_default_script" );
    }
}

