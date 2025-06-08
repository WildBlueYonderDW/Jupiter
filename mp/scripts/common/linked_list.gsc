#using scripts\common\utility;
#using scripts\engine\utility;

#namespace linked_list;

// Namespace linked_list / scripts\common\linked_list
// Params 0
// Checksum 0x0, Offset: 0x98
// Size: 0x45
function function_e0143bb4b41a77c4()
{
    linkedlist = spawnstruct();
    linkedlist.startnode = undefined;
    linkedlist.endnode = undefined;
    linkedlist.nodecount = 0;
    linkedlist.var_dd1ede0842d8e484 = 1;
    return linkedlist;
}

// Namespace linked_list / scripts\common\linked_list
// Params 1
// Checksum 0x0, Offset: 0xe6
// Size: 0x23, Type: bool
function function_dd1ede0842d8e484( var_ab177af9e881324f )
{
    return isstruct( var_ab177af9e881324f ) && var_ab177af9e881324f.var_dd1ede0842d8e484 == 1;
}

// Namespace linked_list / scripts\common\linked_list
// Params 0
// Checksum 0x0, Offset: 0x112
// Size: 0x2a
function function_11a80ea7fe6ea9e0()
{
    node = spawnstruct();
    node.nextnode = undefined;
    node.prevnode = undefined;
    return node;
}

// Namespace linked_list / scripts\common\linked_list
// Params 2
// Checksum 0x0, Offset: 0x145
// Size: 0x117
function addnode( newnode, var_f3b9a2fb70be7 )
{
    assertex( function_dd1ede0842d8e484( self ), "<dev string:x1c>" );
    linkedlist = self;
    
    if ( linkedlist getsize() == 0 )
    {
        linkedlist.startnode = newnode;
        linkedlist.endnode = newnode;
    }
    else if ( istrue( var_f3b9a2fb70be7 ) )
    {
        newnode.nextnode = linkedlist.startnode;
        linkedlist.startnode.prevnode = newnode;
        linkedlist.startnode = newnode;
    }
    else
    {
        linkedlist.endnode.nextnode = newnode;
        newnode.prevnode = linkedlist.endnode;
        linkedlist.endnode = newnode;
    }
    
    linkedlist.nodecount += 1;
    
    /#
        if ( linkedlist function_63fe00fb459ea917() )
        {
            function_22573254f7088750( "<dev string:x7a>" );
            linkedlist function_808f3bc4b7fcee6d();
        }
    #/
}

// Namespace linked_list / scripts\common\linked_list
// Params 1
// Checksum 0x0, Offset: 0x264
// Size: 0x13e
function removenode( var_7dcdc8e8873aeb30 )
{
    assertex( function_dd1ede0842d8e484( self ), "<dev string:x1c>" );
    linkedlist = self;
    isstartnode = !isdefined( var_7dcdc8e8873aeb30.prevnode );
    isendnode = !isdefined( var_7dcdc8e8873aeb30.nextnode );
    
    if ( isstartnode && linkedlist getsize() > 1 )
    {
        linkedlist.startnode = var_7dcdc8e8873aeb30.nextnode;
    }
    else if ( !isstartnode )
    {
        var_7dcdc8e8873aeb30.prevnode.nextnode = var_7dcdc8e8873aeb30.nextnode;
    }
    
    if ( isendnode && linkedlist getsize() > 1 )
    {
        linkedlist.endnode = var_7dcdc8e8873aeb30.prevnode;
    }
    else if ( !isendnode )
    {
        var_7dcdc8e8873aeb30.nextnode.prevnode = var_7dcdc8e8873aeb30.prevnode;
    }
    
    linkedlist.nodecount = max( linkedlist.nodecount - 1, 0 );
    
    /#
        if ( linkedlist function_63fe00fb459ea917() )
        {
            function_22573254f7088750( "<dev string:x88>" );
            linkedlist function_808f3bc4b7fcee6d();
        }
    #/
}

// Namespace linked_list / scripts\common\linked_list
// Params 0
// Checksum 0x0, Offset: 0x3aa
// Size: 0xd1
function removestartnode()
{
    assertex( function_dd1ede0842d8e484( self ), "<dev string:x1c>" );
    linkedlist = self;
    
    if ( isdefined( linkedlist.startnode ) && linkedlist getsize() > 1 )
    {
        linkedlist.startnode = linkedlist.startnode.nextnode;
        linkedlist.startnode.prevnode = undefined;
    }
    else
    {
        linkedlist.startnode = undefined;
        linkedlist.endnode = undefined;
    }
    
    linkedlist.nodecount = max( linkedlist.nodecount - 1, 0 );
    
    /#
        if ( linkedlist function_63fe00fb459ea917() )
        {
            function_22573254f7088750( "<dev string:x88>" );
            linkedlist function_808f3bc4b7fcee6d();
        }
    #/
}

// Namespace linked_list / scripts\common\linked_list
// Params 0
// Checksum 0x0, Offset: 0x483
// Size: 0xd1
function removeendnode()
{
    assertex( function_dd1ede0842d8e484( self ), "<dev string:x1c>" );
    linkedlist = self;
    
    if ( isdefined( linkedlist.endnode ) && linkedlist getsize() > 1 )
    {
        linkedlist.endnode = linkedlist.endnode.prevnode;
        linkedlist.endnode.nextnode = undefined;
    }
    else
    {
        linkedlist.startnode = undefined;
        linkedlist.endnode = undefined;
    }
    
    linkedlist.nodecount = max( linkedlist.nodecount - 1, 0 );
    
    /#
        if ( linkedlist function_63fe00fb459ea917() )
        {
            function_22573254f7088750( "<dev string:x88>" );
            linkedlist function_808f3bc4b7fcee6d();
        }
    #/
}

// Namespace linked_list / scripts\common\linked_list
// Params 1
// Checksum 0x0, Offset: 0x55c
// Size: 0x73
function function_7f2de7f012dc412f( var_d9e7db9b48a182d5 )
{
    assertex( function_dd1ede0842d8e484( self ), "<dev string:x1c>" );
    linkedlist = self;
    
    if ( linkedlist.startnode == var_d9e7db9b48a182d5 )
    {
        return;
    }
    
    linkedlist removenode( var_d9e7db9b48a182d5 );
    linkedlist addnode( var_d9e7db9b48a182d5, 1 );
    
    /#
        if ( linkedlist function_63fe00fb459ea917() )
        {
            function_22573254f7088750( "<dev string:x98>" );
            linkedlist function_808f3bc4b7fcee6d();
        }
    #/
}

// Namespace linked_list / scripts\common\linked_list
// Params 0
// Checksum 0x0, Offset: 0x5d7
// Size: 0x2f
function getsize()
{
    assertex( function_dd1ede0842d8e484( self ), "<dev string:x1c>" );
    linkedlist = self;
    return linkedlist.nodecount;
}

// Namespace linked_list / scripts\common\linked_list
// Params 0
// Checksum 0x0, Offset: 0x60f
// Size: 0x2f
function getstartnode()
{
    assertex( function_dd1ede0842d8e484( self ), "<dev string:x1c>" );
    linkedlist = self;
    return linkedlist.startnode;
}

// Namespace linked_list / scripts\common\linked_list
// Params 0
// Checksum 0x0, Offset: 0x647
// Size: 0x2f
function getendnode()
{
    assertex( function_dd1ede0842d8e484( self ), "<dev string:x1c>" );
    linkedlist = self;
    return linkedlist.endnode;
}

/#

    // Namespace linked_list / scripts\common\linked_list
    // Params 0
    // Checksum 0x0, Offset: 0x67f
    // Size: 0x5, Type: dev
    function function_d35c195d3d01e75e()
    {
        
    }

    // Namespace linked_list / scripts\common\linked_list
    // Params 1
    // Checksum 0x0, Offset: 0x68c
    // Size: 0x2b, Type: dev
    function function_c09bf9c86f65e4ac( var_ad80ec0659e85f9e )
    {
        var_93981ad709abb3f9 = function_e0143bb4b41a77c4();
        var_93981ad709abb3f9 function_3a28dcc9cc1b6ae3( var_ad80ec0659e85f9e );
        return var_93981ad709abb3f9;
    }

    // Namespace linked_list / scripts\common\linked_list
    // Params 1
    // Checksum 0x0, Offset: 0x6bf
    // Size: 0x4b, Type: dev
    function function_3a28dcc9cc1b6ae3( var_ad80ec0659e85f9e )
    {
        assertex( function_dd1ede0842d8e484( self ), "<dev string:x1c>" );
        var_93981ad709abb3f9 = self;
        var_93981ad709abb3f9.var_1a19bd75a8860186 = 1;
        var_93981ad709abb3f9.var_ad80ec0659e85f9e = var_ad80ec0659e85f9e;
    }

    // Namespace linked_list / scripts\common\linked_list
    // Params 1
    // Checksum 0x0, Offset: 0x712
    // Size: 0xae, Type: dev
    function function_c4e2f2dcd675c939( var_ad80ec0659e85f9e )
    {
        assertex( function_dd1ede0842d8e484( self ), "<dev string:x1c>" );
        linkedlist = self;
        nodecount = 1;
        nodereference = linkedlist.startnode;
        function_22573254f7088750( "<dev string:xbf>" );
        function_22573254f7088750( "<dev string:xe0>" + linkedlist getsize() );
        
        while ( isdefined( nodereference ) )
        {
            function_22573254f7088750( "<dev string:xef>" + nodecount + "<dev string:x105>" );
            [[ var_ad80ec0659e85f9e ]]( nodereference );
            nodereference = nodereference.nextnode;
            nodecount++;
        }
        
        function_22573254f7088750( "<dev string:x10b>" );
    }

    // Namespace linked_list / scripts\common\linked_list
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x7c8
    // Size: 0x39, Type: dev
    function private function_808f3bc4b7fcee6d()
    {
        assertex( function_dd1ede0842d8e484( self ), "<dev string:x1c>" );
        var_93981ad709abb3f9 = self;
        function_c4e2f2dcd675c939( var_93981ad709abb3f9.var_ad80ec0659e85f9e );
    }

    // Namespace linked_list / scripts\common\linked_list
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x809
    // Size: 0x34, Type: dev
    function private function_63fe00fb459ea917()
    {
        assertex( function_dd1ede0842d8e484( self ), "<dev string:x1c>" );
        linkedlist = self;
        return istrue( linkedlist.var_1a19bd75a8860186 );
    }

    // Namespace linked_list / scripts\common\linked_list
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x845
    // Size: 0xb, Type: dev
    function private function_276db0f5dc47fd04()
    {
        return "<dev string:x12a>";
    }

    // Namespace linked_list / scripts\common\linked_list
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x858
    // Size: 0x1c, Type: dev
    function private function_22573254f7088750( var_f0443bfaa4783689 )
    {
        iprintln( function_276db0f5dc47fd04() + var_f0443bfaa4783689 );
    }

#/
