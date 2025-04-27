#using scripts\common\utility;
#using scripts\engine\utility;

#namespace data_tracker;

// Namespace data_tracker / scripts\common\data_tracker
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc9
// Size: 0x8
function function_b205b5926c02717f()
{
    return function_9c7053f2799c3238();
}

// Namespace data_tracker / scripts\common\data_tracker
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xda
// Size: 0x2a
function function_4d1de11b1a5630ec( var_fc27cf5aa6482417 )
{
    if ( !isstruct( var_fc27cf5aa6482417 ) )
    {
        assertmsg( "<dev string:x1c>" );
    }
    
    function_9c7053f2799c3238( var_fc27cf5aa6482417 );
}

// Namespace data_tracker / scripts\common\data_tracker
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10c
// Size: 0x40
function function_3234a152a64387c7( dataobject )
{
    if ( !isdefined( dataobject.uniquename ) )
    {
        assertmsg( "<dev string:x5f>" );
        return;
    }
    
    self.dataobjects[ dataobject.uniquename ] = dataobject;
}

// Namespace data_tracker / scripts\common\data_tracker
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x154
// Size: 0x67
function adddata( var_f22b51105fa16a29, datatype, value, callbackfunction )
{
    if ( isdefined( self.dataobjects[ var_f22b51105fa16a29 ] ) )
    {
        assertmsg( "<dev string:xc2>" + var_f22b51105fa16a29 + "<dev string:xee>" );
        return;
    }
    
    dataobject = function_29564ce8dc854f53( var_f22b51105fa16a29, datatype, value, callbackfunction );
    function_3234a152a64387c7( dataobject );
}

// Namespace data_tracker / scripts\common\data_tracker
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1c3
// Size: 0x4a
function function_b584ae8dddb33821( var_f22b51105fa16a29, value, callbackfunction )
{
    if ( !isint( value ) )
    {
        assertmsg( "<dev string:x11d>" + var_f22b51105fa16a29 + "<dev string:x150>" );
        return;
    }
    
    adddata( var_f22b51105fa16a29, "Integer", value, callbackfunction );
}

// Namespace data_tracker / scripts\common\data_tracker
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x215
// Size: 0x4a
function function_a5bdec253a251d2a( var_f22b51105fa16a29, value, callbackfunction )
{
    if ( !isfloat( value ) )
    {
        assertmsg( "<dev string:x189>" + var_f22b51105fa16a29 + "<dev string:x1be>" );
        return;
    }
    
    adddata( var_f22b51105fa16a29, "Float", value, callbackfunction );
}

// Namespace data_tracker / scripts\common\data_tracker
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x267
// Size: 0x4a
function function_e39de66971de6959( var_f22b51105fa16a29, value, callbackfunction )
{
    if ( !isstring( value ) )
    {
        assertmsg( "<dev string:x1f4>" + var_f22b51105fa16a29 + "<dev string:x22a>" );
        return;
    }
    
    adddata( var_f22b51105fa16a29, "String", value, callbackfunction );
}

// Namespace data_tracker / scripts\common\data_tracker
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2b9
// Size: 0x2a
function function_e4b4be816ed43365( var_f22b51105fa16a29, value, callbackfunction )
{
    adddata( var_f22b51105fa16a29, "ProgressTracker", value, callbackfunction );
}

// Namespace data_tracker / scripts\common\data_tracker
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2eb
// Size: 0x16
function removedata( var_f22b51105fa16a29 )
{
    self.dataobjects[ var_f22b51105fa16a29 ] = undefined;
}

// Namespace data_tracker / scripts\common\data_tracker
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x309
// Size: 0x5b
function updatedata( var_9e5a064a346c5b42, updatedvalue )
{
    dataobject = self.dataobjects[ var_9e5a064a346c5b42 ];
    
    if ( !isdefined( dataobject ) )
    {
        assertmsg( "<dev string:x261>" + var_9e5a064a346c5b42 + "<dev string:x290>" );
        return;
    }
    
    dataobject.value = updatedvalue;
    function_5aa098a0e2a91e3e( var_9e5a064a346c5b42 );
}

// Namespace data_tracker / scripts\common\data_tracker
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x36c
// Size: 0x46
function function_5aa098a0e2a91e3e( var_9e5a064a346c5b42 )
{
    dataobject = self.dataobjects[ var_9e5a064a346c5b42 ];
    
    if ( !isdefined( dataobject ) )
    {
        assertmsg( "<dev string:x2ba>" + var_9e5a064a346c5b42 + "<dev string:x290>" );
        return;
    }
    
    function_755936e0aeeb43f6( var_9e5a064a346c5b42 );
}

// Namespace data_tracker / scripts\common\data_tracker
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3ba
// Size: 0x3d
function addcallback( callbackfunction, var_1fd2df2315da3137 )
{
    newcallback = function_72504163d8901997( callbackfunction, var_1fd2df2315da3137 );
    self.var_6b6f2974d8fc8810[ self.var_6b6f2974d8fc8810.size ] = newcallback;
}

// Namespace data_tracker / scripts\common\data_tracker
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3ff
// Size: 0x58
function function_c0a81a4aa88ede55( callbackfunction, var_9e5a064a346c5b42, var_1fd2df2315da3137 )
{
    dataobject = self.dataobjects[ var_9e5a064a346c5b42 ];
    
    if ( !isdefined( dataobject ) )
    {
        assertmsg( "<dev string:x2f7>" + var_9e5a064a346c5b42 + "<dev string:x290>" );
        return;
    }
    
    function_18c71d7e16a8c68c( dataobject, callbackfunction, var_1fd2df2315da3137 );
}

// Namespace data_tracker / scripts\common\data_tracker
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x45f
// Size: 0x6a
function removecallback( callbackfunction )
{
    for (callbackid = 0; callbackid < self.var_6b6f2974d8fc8810.size; callbackid++) {
        if ( self.var_6b6f2974d8fc8810[ callbackid ].callbackfunction == callbackfunction )
        {
            self.var_6b6f2974d8fc8810[ callbackid ] = undefined;
        }
    }
    
    self.var_6b6f2974d8fc8810 = array_removeundefined( self.callbacks );
}

// Namespace data_tracker / scripts\common\data_tracker
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4d1
// Size: 0xae
function function_d6f2becdeb4c29be( callbackfunction, var_9e5a064a346c5b42 )
{
    dataobject = self.dataobjects[ var_9e5a064a346c5b42 ];
    
    if ( !isdefined( dataobject ) )
    {
        assertmsg( "<dev string:x332>" + var_9e5a064a346c5b42 + "<dev string:x290>" );
        return;
    }
    
    for (callbackid = 0; callbackid < dataobject.callbacks.size; callbackid++) {
        if ( dataobject.callbacks[ callbackid ].callbackfunction == callbackfunction )
        {
            dataobject.callbacks[ callbackid ] = undefined;
        }
    }
    
    dataobject.callbacks = array_removeundefined( dataobject.callbacks );
}

// Namespace data_tracker / scripts\common\data_tracker
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x587
// Size: 0x49
function function_e989e3f023f50368( var_9e5a064a346c5b42 )
{
    dataobject = self.dataobjects[ var_9e5a064a346c5b42 ];
    
    if ( !isdefined( dataobject ) )
    {
        assertmsg( "<dev string:x370>" + var_9e5a064a346c5b42 + "<dev string:x290>" );
        return;
    }
    
    return dataobject.value;
}

// Namespace data_tracker / scripts\common\data_tracker
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d9
// Size: 0x3f
function function_f709e958aa6900( var_9e5a064a346c5b42 )
{
    dataobject = self.dataobjects[ var_9e5a064a346c5b42 ];
    
    if ( !isdefined( dataobject ) )
    {
        assertmsg( "<dev string:x370>" + var_9e5a064a346c5b42 + "<dev string:x290>" );
        return;
    }
    
    return dataobject;
}

// Namespace data_tracker / scripts\common\data_tracker
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x621
// Size: 0x17, Type: bool
function function_6a26856f16c6a207( var_9e5a064a346c5b42 )
{
    return isdefined( self.dataobjects[ var_9e5a064a346c5b42 ] );
}

// Namespace data_tracker / scripts\common\data_tracker
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x641
// Size: 0x110
function function_755936e0aeeb43f6( var_9e5a064a346c5b42 )
{
    dataobject = self.dataobjects[ var_9e5a064a346c5b42 ];
    
    if ( !isdefined( dataobject ) )
    {
        assertmsg( "<dev string:x3a0>" + var_9e5a064a346c5b42 + "<dev string:x290>" );
        return;
    }
    
    foreach ( callback in dataobject.callbacks )
    {
        if ( isdefined( callback ) )
        {
            callback.callon thread [[ callback.callbackfunction ]]( self, dataobject );
        }
    }
    
    foreach ( callback in self.var_6b6f2974d8fc8810 )
    {
        if ( isdefined( callback ) )
        {
            callback.callon thread [[ callback.callbackfunction ]]( self, dataobject );
        }
    }
}

// Namespace data_tracker / scripts\common\data_tracker
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x759
// Size: 0x16
function function_71667164a3e75714( dataobject )
{
    return dataobject.uniquename;
}

// Namespace data_tracker / scripts\common\data_tracker
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x778
// Size: 0x34
function private function_9c7053f2799c3238( var_9bc4f97e08bcc10e )
{
    var_9bc4f97e08bcc10e = default_to( var_9bc4f97e08bcc10e, spawnstruct() );
    var_9bc4f97e08bcc10e.dataobjects = [];
    var_9bc4f97e08bcc10e.var_6b6f2974d8fc8810 = [];
    return var_9bc4f97e08bcc10e;
}

// Namespace data_tracker / scripts\common\data_tracker
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x7b5
// Size: 0x77
function private function_29564ce8dc854f53( uniquename, datatype, value, callbackfunction )
{
    dataobject = spawnstruct();
    dataobject.uniquename = uniquename;
    dataobject.datatype = datatype;
    dataobject.value = value;
    dataobject.callbacks = [];
    
    if ( isdefined( callbackfunction ) )
    {
        function_18c71d7e16a8c68c( dataobject, callbackfunction );
    }
    
    return dataobject;
}

// Namespace data_tracker / scripts\common\data_tracker
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x835
// Size: 0x46
function private function_72504163d8901997( callbackfunction, var_1fd2df2315da3137 )
{
    newcallback = spawnstruct();
    newcallback.callon = default_to( var_1fd2df2315da3137, level );
    newcallback.callbackfunction = callbackfunction;
    return newcallback;
}

// Namespace data_tracker / scripts\common\data_tracker
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x884
// Size: 0x49
function private function_18c71d7e16a8c68c( dataobject, callbackfunction, var_1fd2df2315da3137 )
{
    newcallback = function_72504163d8901997( callbackfunction, var_1fd2df2315da3137 );
    dataobject.callbacks[ dataobject.callbacks.size ] = newcallback;
}

