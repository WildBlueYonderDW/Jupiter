#using scripts\common\string;
#using scripts\common\utility;
#using scripts\cp_mp\operator;
#using scripts\cp_mp\utility\loot;
#using scripts\engine\utility;

#namespace operator;

// Namespace operator / scripts\cp_mp\operator
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1c7
// Size: 0x38, Type: bool
function private isbuildingmap()
{
    /#
        if ( getdvarint( @"hash_e6afce2cf5cf7515", 0 ) == 1 )
        {
            return true;
        }
        
        if ( getdvar( @"hash_742caa13b3c2e685" ) == "<dev string:x1c>" )
        {
            return true;
        }
    #/
    
    return false;
}

// Namespace operator / scripts\cp_mp\operator
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x208
// Size: 0x18e
function private function_a10148d5861bcad7()
{
    if ( isdefined( level.var_b4e3b6bdd3147659 ) )
    {
        return;
    }
    
    level.var_b4e3b6bdd3147659 = [];
    
    if ( isbuildingmap() )
    {
        return;
    }
    
    gamemodebundle = level.gamemodebundle;
    
    if ( !isdefined( gamemodebundle.operatorlist ) )
    {
        return;
    }
    
    operatorlistbundle = getscriptbundle( hashcat( %"hash_303f703d848b60b4", gamemodebundle.operatorlist ) );
    
    /#
        if ( !isdefined( operatorlistbundle ) )
        {
            println( "<dev string:x21>" + gamemodebundle.operatorlist );
            return;
        }
    #/
    
    operatorlist = operatorlistbundle.operatorlist;
    
    for ( i = 0; i < operatorlist.size ; i++ )
    {
        if ( !isdefined( operatorlist[ i ].operator ) )
        {
            continue;
        }
        
        operatorref = operatorlist[ i ].operator;
        
        /#
            operatorbundle = getscriptbundle( hashcat( %"hash_7a53ff4b0b6730f0", operatorlist[ i ].operator ) );
            
            if ( !isdefined( operatorbundle ) )
            {
                println( "<dev string:x4f>" + gamemodebundle.operatorlist + "<dev string:x86>" + operatorlist[ i ].operator );
                continue;
            }
        #/
        
        level.var_b4e3b6bdd3147659[ level.var_b4e3b6bdd3147659.size ] = operatorref;
    }
    
    level.var_a4400aa5857d6e62[ 0 ] = operatorlistbundle.var_6f8d31c2e53e42c1;
    level.var_a4400aa5857d6e62[ 1 ] = operatorlistbundle.var_5b398f7cbbb428fb;
}

// Namespace operator / scripts\cp_mp\operator
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x39e
// Size: 0x277
function private function_c1fb26911511dc66()
{
    if ( isdefined( level.var_fbf434d7e58c4d3c ) )
    {
        return;
    }
    
    function_a10148d5861bcad7();
    level.var_6a1f54ff203845ec = [];
    level.var_fbf434d7e58c4d3c = [];
    level.var_c1a0b417f098e70c = [];
    level.var_a9f4f3ca6a32942f = [];
    level.var_148b9b0de8a67005 = [];
    
    if ( isbuildingmap() )
    {
        return;
    }
    
    foreach ( operatorref in level.var_b4e3b6bdd3147659 )
    {
        operatorbundle = function_a185fde559db8123( operatorref );
        
        if ( !isdefined( operatorbundle ) )
        {
            continue;
        }
        
        foreach ( var_7d6ffe57986670d0 in operatorbundle.skins )
        {
            if ( !isdefined( var_7d6ffe57986670d0.skin ) )
            {
                continue;
            }
            
            var_ff73ed080233394c = getscriptbundle( hashcat( %"hash_600bc392d3fffb6f", var_7d6ffe57986670d0.skin ) );
            skinref = var_7d6ffe57986670d0.skin;
            level.var_6a1f54ff203845ec[ level.var_6a1f54ff203845ec.size ] = skinref;
            level.var_fbf434d7e58c4d3c[ skinref ] = operatorref;
            
            if ( function_f2d38198420a4368( var_ff73ed080233394c.var_f06198ac145f8352 ) )
            {
                level.var_148b9b0de8a67005[ var_ff73ed080233394c.lootid ] = var_ff73ed080233394c.var_f06198ac145f8352;
            }
            
            if ( isdefined( level.var_c1a0b417f098e70c[ operatorref ] ) )
            {
                level.var_c1a0b417f098e70c[ operatorref ] = array_add( level.var_c1a0b417f098e70c[ operatorref ], skinref );
                continue;
            }
            
            level.var_c1a0b417f098e70c[ operatorref ] = [ skinref ];
        }
        
        if ( isdefined( operatorbundle.var_f91a44e31cde7d97 ) )
        {
            var_ff73ed080233394c = getscriptbundle( hashcat( %"hash_600bc392d3fffb6f", operatorbundle.var_f91a44e31cde7d97 ) );
            skinref = operatorbundle.var_f91a44e31cde7d97;
            
            if ( isdefined( var_ff73ed080233394c ) )
            {
                level.var_a9f4f3ca6a32942f[ operatorref ] = skinref;
                
                if ( function_f2d38198420a4368( var_ff73ed080233394c.var_f06198ac145f8352 ) )
                {
                    level.var_148b9b0de8a67005[ var_ff73ed080233394c.lootid ] = var_ff73ed080233394c.var_f06198ac145f8352;
                }
            }
        }
    }
}

// Namespace operator / scripts\cp_mp\operator
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x61d
// Size: 0x171
function private function_36a7c07e40354ae7()
{
    if ( isdefined( level.var_ea38f52d9a056cbf ) )
    {
        return;
    }
    
    level.var_ea38f52d9a056cbf = undefined;
    level.var_4426ab1a2f16d0c5 = [];
    level.var_ac25d91749a63b94 = [];
    level.defaultbody = spawnstruct();
    
    if ( isbuildingmap() )
    {
        return;
    }
    
    projectscriptbundle = level.projectbundle;
    var_728e4ee3adb777cd = getscriptbundle( hashcat( %"hash_630c0fff6758a320", projectscriptbundle.var_bc9940f5b35f3ff5 ) );
    
    /#
        if ( !isdefined( var_728e4ee3adb777cd ) )
        {
            println( "<dev string:x8c>" + projectscriptbundle.var_bc9940f5b35f3ff5 );
            return;
        }
    #/
    
    bodylist = var_728e4ee3adb777cd.var_bc9940f5b35f3ff5;
    level.var_ea38f52d9a056cbf = [];
    numbodies = 0;
    
    for ( i = 0; i < bodylist.size ; i++ )
    {
        bodybundlename = bodylist[ i ].operatorbody;
        
        if ( isdefined( bodybundlename ) && bodybundlename != "" )
        {
            bodydata = getscriptbundle( hashcat( %"hash_5401bb5448ac823c", bodybundlename ) );
            level.var_ea38f52d9a056cbf[ level.var_ea38f52d9a056cbf.size ] = bodydata;
            level.var_4426ab1a2f16d0c5[ bodydata.model ] = numbodies;
            level.var_ac25d91749a63b94[ bodydata.idx ] = numbodies;
            numbodies++;
        }
    }
}

// Namespace operator / scripts\cp_mp\operator
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x796
// Size: 0x176
function private function_53b243a75e43d0af()
{
    if ( isdefined( level.var_7b5ee4f867ed7544 ) )
    {
        return;
    }
    
    level.var_7b5ee4f867ed7544 = [];
    level.var_7aa36883fc908dd1 = [];
    
    if ( isbuildingmap() )
    {
        return;
    }
    
    gamemodebundle = level.gamemodebundle;
    
    if ( !isdefined( gamemodebundle.execution_list ) )
    {
        return;
    }
    
    var_edd8be499278b105 = getscriptbundle( hashcat( %"hash_3cf279fa8ccaf24e", gamemodebundle.execution_list ) );
    
    /#
        if ( !isdefined( var_edd8be499278b105 ) )
        {
            println( "<dev string:xbe>" + gamemodebundle.execution_list );
            return;
        }
    #/
    
    executionlist = var_edd8be499278b105.var_f56937ae2076fd;
    
    for ( i = 0; i < executionlist.size ; i++ )
    {
        if ( !isdefined( executionlist[ i ].operatorexecution ) )
        {
            continue;
        }
        
        executionbundle = getscriptbundle( hashcat( %"hash_3c0bcccfd8362f86", executionlist[ i ].operatorexecution ) );
        executionref = executionlist[ i ].operatorexecution;
        
        /#
            if ( !isdefined( executionbundle ) )
            {
                println( "<dev string:xee>" + gamemodebundle.execution_list + "<dev string:x86>" + executionlist[ i ].operatorexecution );
                continue;
            }
        #/
        
        level.var_7b5ee4f867ed7544[ executionref ] = executionbundle;
        level.var_7aa36883fc908dd1[ level.var_7aa36883fc908dd1.size ] = executionref;
    }
}

// Namespace operator / scripts\cp_mp\operator
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x914
// Size: 0x6c
function private function_a185fde559db8123( operatorref, var_faa66d6f4c6c9e1d )
{
    function_a10148d5861bcad7();
    
    if ( isdefined( var_faa66d6f4c6c9e1d ) )
    {
        operatorbundle = function_50f8a8f765bad85e( hashcat( %"hash_7a53ff4b0b6730f0", operatorref ), var_faa66d6f4c6c9e1d );
    }
    else
    {
        operatorbundle = getscriptbundle( hashcat( %"hash_7a53ff4b0b6730f0", operatorref ) );
    }
    
    assertex( isdefined( operatorbundle ), "<dev string:x126>" + operatorref );
    return operatorbundle;
}

// Namespace operator / scripts\cp_mp\operator
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x989
// Size: 0xde
function private function_a2f84a43b99f877a( skinref, var_faa66d6f4c6c9e1d )
{
    function_c1fb26911511dc66();
    
    if ( isdefined( level.var_6a1f54ff203845ec ) && isxhashasset( skinref ) )
    {
        foreach ( var_75e4598cf524ee17 in level.var_6a1f54ff203845ec )
        {
            if ( function_40fd49171fad19d3( var_75e4598cf524ee17 ) == skinref )
            {
                skinref = var_75e4598cf524ee17;
                break;
            }
        }
    }
    
    if ( isdefined( var_faa66d6f4c6c9e1d ) )
    {
        var_ff73ed080233394c = function_50f8a8f765bad85e( hashcat( %"hash_600bc392d3fffb6f", skinref ), var_faa66d6f4c6c9e1d );
    }
    else
    {
        var_ff73ed080233394c = getscriptbundle( hashcat( %"hash_600bc392d3fffb6f", skinref ) );
    }
    
    assertex( isdefined( var_ff73ed080233394c ), "<dev string:x146>" + skinref );
    return var_ff73ed080233394c;
}

// Namespace operator / scripts\cp_mp\operator
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa70
// Size: 0x39
function private function_23dac01799fd34a3( executionref )
{
    function_53b243a75e43d0af();
    assertex( isdefined( level.var_7b5ee4f867ed7544[ executionref ] ), "<dev string:x16b>" + executionref );
    return level.var_7b5ee4f867ed7544[ executionref ];
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0xab2
// Size: 0x18
function function_54240a5fc41f6590( operatorref )
{
    return array_contains( function_462ac94dd54da47d(), operatorref );
}

// Namespace operator / scripts\cp_mp\operator
// Params 0
// Checksum 0x0, Offset: 0xad3
// Size: 0x12
function function_462ac94dd54da47d()
{
    function_a10148d5861bcad7();
    return level.var_b4e3b6bdd3147659;
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0xaee
// Size: 0x5a, Type: bool
function getoperatorsuperfaction( operatorref )
{
    operatorbundle = function_a185fde559db8123( operatorref, [ #"superfaction" ] );
    
    if ( isdefined( operatorbundle ) && isdefined( operatorbundle.superfaction ) && operatorbundle.superfaction == "EAST" )
    {
        return true;
    }
    
    return false;
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0xb51
// Size: 0x52
function getoperatorvoice( operatorref )
{
    operatorbundle = function_a185fde559db8123( operatorref, [ #"voice" ] );
    
    if ( isdefined( operatorbundle ) && isdefined( operatorbundle.voice ) )
    {
        return operatorbundle.voice;
    }
    
    return "";
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0xbac
// Size: 0x61
function getoperatorgender( operatorref )
{
    operatorbundle = function_a185fde559db8123( operatorref, [ #"gender" ] );
    
    if ( isdefined( operatorbundle ) && isdefined( operatorbundle.gender ) && operatorbundle.gender == "FEMALE" )
    {
        return "female";
    }
    
    return "male";
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0xc16
// Size: 0x36
function function_df7d12571397a2b5( operatorref )
{
    function_c1fb26911511dc66();
    
    if ( array_contains_key( level.var_a9f4f3ca6a32942f, operatorref ) )
    {
        return level.var_a9f4f3ca6a32942f[ operatorref ];
    }
    
    return "";
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0xc55
// Size: 0x52
function function_a9722d35258230d2( operatorref )
{
    operatorbundle = function_a185fde559db8123( operatorref, [ #"defaultexecution" ] );
    
    if ( isdefined( operatorbundle ) && isdefined( operatorbundle.defaultexecution ) )
    {
        return operatorbundle.defaultexecution;
    }
    
    return "";
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0xcb0
// Size: 0x52
function function_179d82270f3ce3bf( operatorref )
{
    operatorbundle = function_a185fde559db8123( operatorref, [ #"defaultquip" ] );
    
    if ( isdefined( operatorbundle ) && isdefined( operatorbundle.defaultquip ) )
    {
        return operatorbundle.defaultquip;
    }
    
    return "";
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0xd0b
// Size: 0x52
function function_ada9a2308a4046e2( operatorref )
{
    operatorbundle = function_a185fde559db8123( operatorref, [ #"suit" ] );
    
    if ( isdefined( operatorbundle ) && isdefined( operatorbundle.suit ) )
    {
        return operatorbundle.suit;
    }
    
    return "";
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0xd66
// Size: 0x4f
function isoperatorunlocked( operatorref )
{
    operatorbundle = function_a185fde559db8123( operatorref, [ #"hash_1aad59b5bb5eb9fe" ] );
    
    if ( isdefined( operatorbundle ) && isdefined( operatorbundle.var_842b638c4baa9422 ) )
    {
        return operatorbundle.var_842b638c4baa9422;
    }
    
    return 1;
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0xdbe
// Size: 0x58
function function_119cb1191ea939ca( operatorref )
{
    operatorbundle = function_a185fde559db8123( operatorref, [ #"botinvalid" ] );
    
    if ( isdefined( operatorbundle ) )
    {
        if ( isdefined( operatorbundle.botinvalid ) )
        {
            return !operatorbundle.botinvalid;
        }
        else
        {
            return 1;
        }
        
        return;
    }
    
    return 0;
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0xe1e
// Size: 0x52
function function_efe20cf7f3e2a003( operatorref )
{
    operatorbundle = function_a185fde559db8123( operatorref, [ #"botgroup" ] );
    
    if ( isdefined( operatorbundle ) && isdefined( operatorbundle.botgroup ) )
    {
        return operatorbundle.botgroup;
    }
    
    return "";
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0xe79
// Size: 0x4e
function function_396b82c66e727528( operatorref )
{
    operatorbundle = function_a185fde559db8123( operatorref, [ #"lootid" ] );
    
    if ( isdefined( operatorbundle ) && isdefined( operatorbundle.lootid ) )
    {
        return operatorbundle.lootid;
    }
    
    return 0;
}

// Namespace operator / scripts\cp_mp\operator
// Params 2
// Checksum 0x0, Offset: 0xed0
// Size: 0x53
function function_c0d1f4a038f29b6b( operatorref, skinindex )
{
    function_c1fb26911511dc66();
    
    if ( isdefined( level.var_c1a0b417f098e70c[ operatorref ] ) )
    {
        skinrefs = level.var_c1a0b417f098e70c[ operatorref ];
        
        if ( skinindex >= 0 && skinindex < skinrefs.size )
        {
            return skinrefs[ skinindex ];
        }
    }
    
    return undefined;
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0xf2c
// Size: 0x4e
function function_29b2af59258d6501( skinref )
{
    var_ff73ed080233394c = function_a2f84a43b99f877a( skinref, [ #"lootid" ] );
    
    if ( isdefined( var_ff73ed080233394c ) && isdefined( var_ff73ed080233394c.lootid ) )
    {
        return var_ff73ed080233394c.lootid;
    }
    
    return 0;
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0xf83
// Size: 0x32
function function_58145d3d8b15c8( operatorref )
{
    function_c1fb26911511dc66();
    
    if ( array_contains_key( level.var_c1a0b417f098e70c, operatorref ) )
    {
        return level.var_c1a0b417f098e70c[ operatorref ];
    }
    
    return [];
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0xfbe
// Size: 0x92
function function_b3b2c9581b1eea75( operatorref )
{
    skinlootid = 0;
    
    if ( !isagent( self ) )
    {
        if ( utility::issharedfuncdefined( "instanceInventory", "getActiveOperatorSkinLootID" ) )
        {
            skinlootid = [[ utility::getsharedfunc( "instanceInventory", "getActiveOperatorSkinLootID" ) ]]( self );
        }
        else if ( isdefined( operatorref ) )
        {
            skinlootid = self getplayerdata( level.loadoutsgroup, "customizationSetup", "operatorCustomization", operatorref, "skin" );
        }
    }
    
    if ( !isdefined( skinlootid ) || skinlootid == 0 )
    {
        return function_df7d12571397a2b5( operatorref );
    }
    
    return scripts\cp_mp\utility\loot::function_793e8a72cedb8ef3( skinlootid );
}

// Namespace operator / scripts\cp_mp\operator
// Params 2
// Checksum 0x0, Offset: 0x1058
// Size: 0xa3
function function_5e2fa33279816be2( operatorref, var_8e0a26a04f19263d )
{
    executionlootid = 0;
    
    if ( !isagent( self ) )
    {
        if ( utility::issharedfuncdefined( "instanceInventory", "getActiveOperatorExecutionLootID" ) )
        {
            executionlootid = [[ utility::getsharedfunc( "instanceInventory", "getActiveOperatorExecutionLootID" ) ]]( self );
        }
        else
        {
            executionlootid = self getplayerdata( level.loadoutsgroup, "customizationSetup", "operatorCustomization", operatorref, "execution" );
        }
    }
    
    if ( executionlootid == 0 )
    {
        if ( isdefined( var_8e0a26a04f19263d ) && var_8e0a26a04f19263d != "" )
        {
            return var_8e0a26a04f19263d;
        }
        else
        {
            return function_a9722d35258230d2( operatorref );
        }
        
        return;
    }
    
    return scripts\cp_mp\utility\loot::function_793e8a72cedb8ef3( executionlootid );
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x1103
// Size: 0x6c
function function_ac45022bf37cddfb( operatorref )
{
    quiplootid = 0;
    
    if ( !isagent( self ) )
    {
        quiplootid = self getplayerdata( level.loadoutsgroup, "customizationSetup", "operatorCustomization", operatorref, "taunt" );
    }
    
    if ( quiplootid == 0 )
    {
        return function_179d82270f3ce3bf( operatorref );
    }
    
    quipref = scripts\cp_mp\utility\loot::function_793e8a72cedb8ef3( quiplootid );
    return function_45a67ff0b6b4624c( quipref );
}

// Namespace operator / scripts\cp_mp\operator
// Params 0
// Checksum 0x0, Offset: 0x1177
// Size: 0x12
function function_6ab347c553a20a68()
{
    function_c1fb26911511dc66();
    return level.var_6a1f54ff203845ec;
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x1192
// Size: 0x39
function function_605079124463a67b( skinref )
{
    function_c1fb26911511dc66();
    assertex( isdefined( level.var_fbf434d7e58c4d3c[ skinref ] ), "<dev string:x195>" + skinref );
    return level.var_fbf434d7e58c4d3c[ skinref ];
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x11d4
// Size: 0x52
function function_223061772e2a61b9( skinref )
{
    var_ff73ed080233394c = function_a2f84a43b99f877a( skinref, [ #"headmodel" ] );
    
    if ( isdefined( var_ff73ed080233394c ) && isdefined( var_ff73ed080233394c.headmodel ) )
    {
        return var_ff73ed080233394c.headmodel;
    }
    
    return "";
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x122f
// Size: 0x52
function function_8eba78e65f4be793( skinref )
{
    var_ff73ed080233394c = function_a2f84a43b99f877a( skinref, [ #"bodymodel" ] );
    
    if ( isdefined( var_ff73ed080233394c ) && isdefined( var_ff73ed080233394c.bodymodel ) )
    {
        return var_ff73ed080233394c.bodymodel;
    }
    
    return "";
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x128a
// Size: 0x52
function function_6fa0ec9562a76f6c( skinref )
{
    var_ff73ed080233394c = function_a2f84a43b99f877a( skinref, [ #"hash_f171c2efd1b161cf" ] );
    
    if ( isdefined( var_ff73ed080233394c ) && isdefined( var_ff73ed080233394c.var_e3ce410e060b25db ) )
    {
        return var_ff73ed080233394c.var_e3ce410e060b25db;
    }
    
    return "";
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x12e5
// Size: 0x52
function function_3af837eb38560aad( skinref )
{
    var_ff73ed080233394c = function_a2f84a43b99f877a( skinref, [ #"hash_f0045d079ca24066" ] );
    
    if ( isdefined( var_ff73ed080233394c ) && isdefined( var_ff73ed080233394c.var_dd7ae969382854ba ) )
    {
        return var_ff73ed080233394c.var_dd7ae969382854ba;
    }
    
    return "";
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x1340
// Size: 0x4f
function function_9c50981a840033dc( skinref )
{
    var_ff73ed080233394c = function_a2f84a43b99f877a( skinref, [ #"canequip" ] );
    
    if ( isdefined( var_ff73ed080233394c ) && isdefined( var_ff73ed080233394c.canequip ) )
    {
        return var_ff73ed080233394c.canequip;
    }
    
    return 1;
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x1398
// Size: 0x58
function function_539b94879a3b6157( skinref )
{
    var_ff73ed080233394c = function_a2f84a43b99f877a( skinref, [ #"botinvalid" ] );
    
    if ( isdefined( var_ff73ed080233394c ) )
    {
        if ( isdefined( var_ff73ed080233394c.botinvalid ) )
        {
            return !var_ff73ed080233394c.botinvalid;
        }
        else
        {
            return 1;
        }
        
        return;
    }
    
    return 0;
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x13f8
// Size: 0x52
function function_9e28d6dc0ac60d69( skinref )
{
    var_ff73ed080233394c = function_a2f84a43b99f877a( skinref, [ #"lootimage" ] );
    
    if ( isdefined( var_ff73ed080233394c ) && isdefined( var_ff73ed080233394c.lootimage ) )
    {
        return var_ff73ed080233394c.lootimage;
    }
    
    return "";
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x1453
// Size: 0x52
function function_32d5918a7844bd9a( skinref )
{
    var_ff73ed080233394c = function_a2f84a43b99f877a( skinref, [ #"hash_a190b92d12131db0" ] );
    
    if ( isdefined( var_ff73ed080233394c ) && isdefined( var_ff73ed080233394c.var_43e35a3d7240fb8c ) )
    {
        return var_ff73ed080233394c.var_43e35a3d7240fb8c;
    }
    
    return "";
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x14ae
// Size: 0x52
function function_112bf281c4f02cd5( skinref )
{
    var_ff73ed080233394c = function_a2f84a43b99f877a( skinref, [ #"hash_2e5c6d338f029967" ] );
    
    if ( isdefined( var_ff73ed080233394c ) && isdefined( var_ff73ed080233394c.var_c39442ad4d5b1983 ) )
    {
        return var_ff73ed080233394c.var_c39442ad4d5b1983;
    }
    
    return "";
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x1509
// Size: 0x52
function function_3d7626401bb1161a( skinref )
{
    var_ff73ed080233394c = function_a2f84a43b99f877a( skinref, [ #"brinfilsmokesuffix" ] );
    
    if ( isdefined( var_ff73ed080233394c ) && isdefined( var_ff73ed080233394c.brinfilsmokesuffix ) )
    {
        return var_ff73ed080233394c.brinfilsmokesuffix;
    }
    
    return "";
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x1564
// Size: 0x52
function function_c7f632b62e2da6dc( skinref )
{
    var_ff73ed080233394c = function_a2f84a43b99f877a( skinref, [ #"hash_e5cac6afd35e1f45" ] );
    
    if ( isdefined( var_ff73ed080233394c ) && isdefined( var_ff73ed080233394c.var_9a0058cb6bccd641 ) )
    {
        return var_ff73ed080233394c.var_9a0058cb6bccd641;
    }
    
    return "";
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x15bf
// Size: 0x4e
function function_7efecf1510ed84a1( skinref )
{
    var_ff73ed080233394c = function_a2f84a43b99f877a( skinref, [ #"lootid" ] );
    
    if ( isdefined( var_ff73ed080233394c ) && isdefined( var_ff73ed080233394c.lootid ) )
    {
        return var_ff73ed080233394c.lootid;
    }
    
    return 0;
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x1616
// Size: 0xd6
function function_f2d38198420a4368( var_ddd84cf9c2e0bb79 )
{
    if ( !isdefined( var_ddd84cf9c2e0bb79 ) || var_ddd84cf9c2e0bb79 == #"" )
    {
        return 0;
    }
    
    assert( isxhash( var_ddd84cf9c2e0bb79 ) );
    
    if ( !isdefined( level.var_2c1f93711731bd71 ) )
    {
        var_625e370ce0d6193 = strtok( getdvar( @"hash_888c1a8e6ebb7178", "" ), "," );
        level.var_2c1f93711731bd71 = [];
        
        foreach ( var_da5b6db3f7f78874 in var_625e370ce0d6193 )
        {
            level.var_2c1f93711731bd71[ function_1823ff50bb28148d( var_da5b6db3f7f78874 ) ] = 1;
        }
    }
    
    return array_contains_key( level.var_2c1f93711731bd71, var_ddd84cf9c2e0bb79 );
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x16f5
// Size: 0x32
function function_6a80a96a06a99d38( lootid )
{
    function_c1fb26911511dc66();
    
    if ( array_contains_key( level.var_148b9b0de8a67005, lootid ) )
    {
        return level.var_148b9b0de8a67005[ lootid ];
    }
    
    return undefined;
}

// Namespace operator / scripts\cp_mp\operator
// Params 0
// Checksum 0x0, Offset: 0x1730
// Size: 0x12
function function_232a4826a2bd2bfd()
{
    function_53b243a75e43d0af();
    return level.var_7aa36883fc908dd1;
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x174b
// Size: 0x39
function function_ddfc149035f1c97c( executionid )
{
    function_53b243a75e43d0af();
    assertex( isdefined( level.var_7aa36883fc908dd1[ executionid ] ), "<dev string:x1bc>" + executionid );
    return level.var_7aa36883fc908dd1[ executionid ];
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x178d
// Size: 0x41
function function_3daf6bb451cf826e( executionref )
{
    function_53b243a75e43d0af();
    executionid = array_find( level.var_7aa36883fc908dd1, executionref );
    assertex( isdefined( executionid ), "<dev string:x1e7>" + executionref );
    return executionid;
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x17d7
// Size: 0x40
function function_bbc044f8ae9428a8( executionref )
{
    executionbundle = function_23dac01799fd34a3( executionref );
    
    if ( isdefined( executionbundle ) && isdefined( executionbundle.lootid ) )
    {
        return executionbundle.lootid;
    }
    
    return 0;
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x1820
// Size: 0x44
function function_75322d3c8f9c9ccb( executionref )
{
    executionbundle = function_23dac01799fd34a3( executionref );
    
    if ( isdefined( executionbundle ) && isdefined( executionbundle.execution ) )
    {
        return executionbundle.execution;
    }
    
    return "none";
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x186d
// Size: 0x44
function function_3bd82b573b8f64f3( executionref )
{
    executionbundle = function_23dac01799fd34a3( executionref );
    
    if ( isdefined( executionbundle ) && isdefined( executionbundle.propweapon ) )
    {
        return executionbundle.propweapon;
    }
    
    return "none";
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x18ba
// Size: 0x19
function function_834ef5d317d107fd( quipid )
{
    return tablelookup( "operatorQuips.csv", 0, quipid, 1 );
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x18dc
// Size: 0x1a
function function_45a67ff0b6b4624c( quipref )
{
    return tablelookup( "operatorQuips.csv", 1, quipref, 6 );
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x18ff
// Size: 0x61
function function_8b76557a4ddccf83( bodymodel )
{
    function_36a7c07e40354ae7();
    
    if ( array_contains_key( level.var_4426ab1a2f16d0c5, bodymodel ) )
    {
        var_d0adf714c26662f3 = level.var_4426ab1a2f16d0c5[ bodymodel ];
        return level.var_ea38f52d9a056cbf[ var_d0adf714c26662f3 ];
    }
    
    assertmsg( "<dev string:x213>" + bodymodel );
    return level.defaultbody;
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x1969
// Size: 0x61
function function_bc7534da0e22321a( bodyindex )
{
    function_36a7c07e40354ae7();
    
    if ( array_contains_key( level.var_ac25d91749a63b94, bodyindex ) )
    {
        var_d0adf714c26662f3 = level.var_ac25d91749a63b94[ bodyindex ];
        return level.var_ea38f52d9a056cbf[ var_d0adf714c26662f3 ];
    }
    
    assertmsg( "<dev string:x23f>" + bodyindex );
    return level.defaultbody;
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x19d3
// Size: 0x40
function function_3cacd1cd869c0feb( bodyindex )
{
    bodydata = function_bc7534da0e22321a( bodyindex );
    return isdefined( bodydata.model ) ? bodydata.model : "";
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x1a1c
// Size: 0x40
function function_aa32c85a2c2a2d8b( bodymodel )
{
    bodydata = function_8b76557a4ddccf83( bodymodel );
    return isdefined( bodydata.armmodel ) ? bodydata.armmodel : "";
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x1a65
// Size: 0x40
function function_6fd12f8316d3acc6( bodymodel )
{
    bodydata = function_8b76557a4ddccf83( bodymodel );
    return isdefined( bodydata.foleytype ) ? bodydata.foleytype : "vestlight";
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x1aae
// Size: 0x3c
function function_9745c4739bb8fdc0( bodymodel )
{
    bodydata = function_8b76557a4ddccf83( bodymodel );
    return isdefined( bodydata.var_9350091af671d6d8 ) ? bodydata.var_9350091af671d6d8 : 0;
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x1af3
// Size: 0x40
function function_df03c0302b44fe9f( bodymodel )
{
    bodydata = function_8b76557a4ddccf83( bodymodel );
    return isdefined( bodydata.watchstyle ) ? bodydata.watchstyle : "";
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x1b3c
// Size: 0x75
function function_515a572a9271c11b( operator )
{
    if ( isbuildingmap() )
    {
        return;
    }
    
    operatorbundle = getscriptbundle( hashcat( %"hash_7a53ff4b0b6730f0", operator ) );
    operatorref = operator;
    
    /#
        if ( !isdefined( operatorbundle ) )
        {
            println( "<dev string:x26b>" + operator );
            return;
        }
    #/
    
    level.var_b4e3b6bdd3147659[ level.var_b4e3b6bdd3147659.size ] = operatorref;
    function_1886c9c9213a60a2( operatorref, operatorbundle );
}

// Namespace operator / scripts\cp_mp\operator
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1bb9
// Size: 0x1de
function private function_1886c9c9213a60a2( operatorref, operatorbundle )
{
    if ( isbuildingmap() )
    {
        return;
    }
    
    assert( isdefined( level.var_fbf434d7e58c4d3c ) );
    
    foreach ( var_7d6ffe57986670d0 in operatorbundle.skins )
    {
        var_ff73ed080233394c = getscriptbundle( hashcat( %"hash_600bc392d3fffb6f", var_7d6ffe57986670d0.skin ) );
        skinref = var_7d6ffe57986670d0.skin;
        level.var_6a1f54ff203845ec[ level.var_6a1f54ff203845ec.size ] = skinref;
        level.var_fbf434d7e58c4d3c[ skinref ] = operatorref;
        
        if ( function_f2d38198420a4368( var_ff73ed080233394c.var_f06198ac145f8352 ) )
        {
            level.var_148b9b0de8a67005[ var_ff73ed080233394c.lootid ] = var_ff73ed080233394c.var_f06198ac145f8352;
        }
        
        if ( isdefined( level.var_c1a0b417f098e70c[ operatorref ] ) )
        {
            level.var_c1a0b417f098e70c[ operatorref ] = array_add( level.var_c1a0b417f098e70c[ operatorref ], skinref );
            continue;
        }
        
        level.var_c1a0b417f098e70c[ operatorref ] = [ skinref ];
    }
    
    if ( isdefined( operatorbundle.var_f91a44e31cde7d97 ) )
    {
        var_ff73ed080233394c = getscriptbundle( hashcat( %"hash_600bc392d3fffb6f", operatorbundle.var_f91a44e31cde7d97 ) );
        skinref = operatorbundle.var_f91a44e31cde7d97;
        
        if ( isdefined( var_ff73ed080233394c ) )
        {
            level.var_a9f4f3ca6a32942f[ operatorref ] = skinref;
            
            if ( function_f2d38198420a4368( var_ff73ed080233394c.var_f06198ac145f8352 ) )
            {
                level.var_148b9b0de8a67005[ var_ff73ed080233394c.lootid ] = var_ff73ed080233394c.var_f06198ac145f8352;
            }
        }
    }
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x1d9f
// Size: 0x40
function function_2dc6ef8b84dfec64( skinref )
{
    var_ff73ed080233394c = function_a2f84a43b99f877a( skinref, [ #"hash_6474931f3a449b2a" ] );
    return isdefined( var_ff73ed080233394c ) ? var_ff73ed080233394c.var_3291e2cbec055766 : undefined;
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x1de8
// Size: 0x40
function function_a317055d4d0a4605( skinref )
{
    var_ff73ed080233394c = function_a2f84a43b99f877a( skinref, [ #"hash_b74126130fe1bde8" ] );
    return isdefined( var_ff73ed080233394c ) ? var_ff73ed080233394c.var_6012de269b5278ac : undefined;
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x1e31
// Size: 0x40
function function_81360519d4836bf7( skinref )
{
    var_ff73ed080233394c = function_a2f84a43b99f877a( skinref, [ #"hash_a30796472eab0efe" ] );
    return isdefined( var_ff73ed080233394c ) ? var_ff73ed080233394c.var_c32ff41e38b39322 : undefined;
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x1e7a
// Size: 0x40
function function_8d92d3fb88a9d34( skinref )
{
    var_ff73ed080233394c = function_a2f84a43b99f877a( skinref, [ #"hash_babfddf124746871" ] );
    return isdefined( var_ff73ed080233394c ) ? var_ff73ed080233394c.var_e2ce402981e2259d : undefined;
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x1ec3
// Size: 0x40
function function_e0b3eff8c73f5475( skinref )
{
    var_ff73ed080233394c = function_a2f84a43b99f877a( skinref, [ #"hash_321fae418d44abbc" ] );
    return isdefined( var_ff73ed080233394c ) ? var_ff73ed080233394c.var_887c00efb656cce0 : undefined;
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x1f0c
// Size: 0x40
function function_a3195a1d60bb2d90( skinref )
{
    var_ff73ed080233394c = function_a2f84a43b99f877a( skinref, [ #"hash_3f979bdff8dd6b0d" ] );
    return isdefined( var_ff73ed080233394c ) ? var_ff73ed080233394c.var_942d00befa8c1d9 : undefined;
}

// Namespace operator / scripts\cp_mp\operator
// Params 0
// Checksum 0x0, Offset: 0x1f55
// Size: 0xd
function function_71eed529fc87a7c3()
{
    return level.var_a4400aa5857d6e62[ 0 ];
}

// Namespace operator / scripts\cp_mp\operator
// Params 0
// Checksum 0x0, Offset: 0x1f6b
// Size: 0xe
function function_28b97877f95c9049()
{
    return level.var_a4400aa5857d6e62[ 1 ];
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x1f82
// Size: 0x23
function function_9242a55834c7ead8( var_e9a5f25420e74f74 )
{
    if ( var_e9a5f25420e74f74 == 1 )
    {
        return function_28b97877f95c9049();
    }
    
    return function_71eed529fc87a7c3();
}

// Namespace operator / scripts\cp_mp\operator
// Params 1
// Checksum 0x0, Offset: 0x1fad
// Size: 0x95
function function_9660556edac85b3( var_e9a5f25420e74f74 )
{
    assert( isdefined( self ) );
    assert( isplayer( self ) );
    assert( var_e9a5f25420e74f74 == 0 || var_e9a5f25420e74f74 == 1 );
    operatorref = self getplayerdata( level.loadoutsgroup, "customizationSetup", "operators", var_e9a5f25420e74f74 );
    
    if ( !string::function_46b9c00bb0535aa3( operatorref ) && scripts\cp_mp\operator::function_54240a5fc41f6590( operatorref ) )
    {
        return self getplayerdata( level.loadoutsgroup, "customizationSetup", "operatorCustomization", operatorref, "skin" );
    }
}

// Namespace operator / scripts\cp_mp\operator
// Params 0
// Checksum 0x0, Offset: 0x204a
// Size: 0x9
function function_e64d40930c925cd8()
{
    return function_9660556edac85b3( 0 );
}

// Namespace operator / scripts\cp_mp\operator
// Params 0
// Checksum 0x0, Offset: 0x205c
// Size: 0xa
function function_9b7c8b7b979d92de()
{
    return function_9660556edac85b3( 1 );
}

// Namespace operator / scripts\cp_mp\operator
// Params 0
// Checksum 0x0, Offset: 0x206f
// Size: 0xaa
function function_c9a8541cdb0479bb()
{
    /#
        if ( getdvarint( @"hash_4753586a2ac8718f", 0 ) == 0 )
        {
            println( "<dev string:x294>" + "<dev string:x2d3>" );
            return;
        }
    #/
    
    headsize = 1;
    head = self.operatorcustomization.head;
    var_fddbb981b32afe9f = head[ head.size - 1 ];
    
    switch ( var_fddbb981b32afe9f )
    {
        case #"hash_31103fbc01bd840c":
            headsize = 1;
            break;
        case #"hash_311042bc01bd88c5":
            headsize = 2;
            break;
        case #"hash_311041bc01bd8732":
            headsize = 3;
            break;
    }
    
    return headsize;
}

