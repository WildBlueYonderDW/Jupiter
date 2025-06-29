#using scripts\common\utility;
#using scripts\engine\utility;

#namespace progress_tracker;

// Namespace progress_tracker / scripts\common\progress_tracker
// Params 2
// Checksum 0x0, Offset: 0x98
// Size: 0x83
function function_b58813f6489727f2( var_cc3e7fbaface5a17, var_b76b3aee05993635 )
{
    progresstracker = spawnstruct();
    progresstracker.progresscomplete = 0;
    progresstracker.callbacks = [];
    progresstracker.var_cc3e7fbaface5a17 = var_cc3e7fbaface5a17;
    progresstracker.var_621cb2c0d9b1cdae = var_cc3e7fbaface5a17;
    progresstracker.var_b76b3aee05993635 = var_b76b3aee05993635;
    
    /#
        if ( isdefined( var_b76b3aee05993635 ) && var_cc3e7fbaface5a17 == var_b76b3aee05993635 )
        {
            assertmsg( "<dev string:x1c>" );
        }
    #/
    
    return progresstracker;
}

// Namespace progress_tracker / scripts\common\progress_tracker
// Params 0
// Checksum 0x0, Offset: 0x124
// Size: 0x32
function function_cfeb21bf93c30dae()
{
    assertex( isdefined( self.var_b76b3aee05993635 ), "<dev string:x8c>" );
    return abs( self.var_b76b3aee05993635 - self.var_621cb2c0d9b1cdae );
}

// Namespace progress_tracker / scripts\common\progress_tracker
// Params 1
// Checksum 0x0, Offset: 0x15f
// Size: 0x15
function function_5cd1865af5a5edcf( uniquename )
{
    self.uniquename = uniquename;
}

// Namespace progress_tracker / scripts\common\progress_tracker
// Params 0
// Checksum 0x0, Offset: 0x17c
// Size: 0x3d
function function_4f3f1f9cedf2d883()
{
    /#
        if ( !isdefined( self.uniquename ) || self.uniquename == "<dev string:xd3>" )
        {
            assertmsg( "<dev string:xd7>" );
        }
    #/
    
    return self.uniquename;
}

// Namespace progress_tracker / scripts\common\progress_tracker
// Params 0
// Checksum 0x0, Offset: 0x1c2
// Size: 0xb
function iscomplete()
{
    return self.progresscomplete;
}

// Namespace progress_tracker / scripts\common\progress_tracker
// Params 2
// Checksum 0x0, Offset: 0x1d6
// Size: 0x54
function addcallback( var_1fd2df2315da3137, callbackfunction )
{
    newcallback = spawnstruct();
    newcallback.callon = var_1fd2df2315da3137;
    newcallback.callbackfunction = callbackfunction;
    self.callbacks[ self.callbacks.size ] = newcallback;
}

// Namespace progress_tracker / scripts\common\progress_tracker
// Params 0
// Checksum 0x0, Offset: 0x232
// Size: 0x9b
function function_e619a5f97879fa4a()
{
    var_9eb651441b8f9d6f = 0;
    
    foreach ( callback in self.callbacks )
    {
        if ( isdefined( callback ) )
        {
            callback.callon [[ callback.callbackfunction ]]( self );
            continue;
        }
        
        var_9eb651441b8f9d6f = 1;
    }
    
    if ( var_9eb651441b8f9d6f )
    {
        self.callbacks = array_removeundefined( self.callbacks );
    }
}

// Namespace progress_tracker / scripts\common\progress_tracker
// Params 1
// Checksum 0x0, Offset: 0x2d5
// Size: 0x3d
function function_a370b85e4225923c( incrementvalue )
{
    if ( iscomplete() )
    {
        return;
    }
    
    if ( !isdefined( incrementvalue ) )
    {
        incrementvalue = 1;
    }
    
    var_8ccf1248fb22534c = self.var_621cb2c0d9b1cdae + incrementvalue;
    function_c664e1d4584b1dcd( var_8ccf1248fb22534c );
}

// Namespace progress_tracker / scripts\common\progress_tracker
// Params 1
// Checksum 0x0, Offset: 0x31a
// Size: 0x46
function function_1e9e5153831d8c68( decrementvalue )
{
    if ( iscomplete() )
    {
        return;
    }
    
    if ( !isdefined( decrementvalue ) )
    {
        decrementvalue = 1;
    }
    
    var_7b277612b5f42940 = self.var_621cb2c0d9b1cdae - decrementvalue;
    var_7b277612b5f42940 = max( var_7b277612b5f42940, 0 );
    function_c664e1d4584b1dcd( var_7b277612b5f42940 );
}

// Namespace progress_tracker / scripts\common\progress_tracker
// Params 1
// Checksum 0x0, Offset: 0x368
// Size: 0x40
function function_7681e7890758b69b( progressvalue )
{
    if ( progressvalue < self.var_621cb2c0d9b1cdae )
    {
        function_1e9e5153831d8c68( self.var_621cb2c0d9b1cdae - progressvalue );
        return;
    }
    
    function_a370b85e4225923c( progressvalue - self.var_621cb2c0d9b1cdae );
}

// Namespace progress_tracker / scripts\common\progress_tracker
// Params 1
// Checksum 0x0, Offset: 0x3b0
// Size: 0x3f
function function_ea45d380408d2922( finalvalue )
{
    if ( iscomplete() )
    {
        return;
    }
    
    assertex( isdefined( finalvalue ), "<dev string:x112>" );
    self.var_b76b3aee05993635 = finalvalue;
    function_c664e1d4584b1dcd( self.var_621cb2c0d9b1cdae );
}

// Namespace progress_tracker / scripts\common\progress_tracker
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3f7
// Size: 0x4d
function private function_c664e1d4584b1dcd( var_6f4eb8a505d5c52f )
{
    self.progresscomplete = function_c076b6b5c85274d8( var_6f4eb8a505d5c52f );
    
    if ( self.progresscomplete )
    {
        self.var_621cb2c0d9b1cdae = self.var_b76b3aee05993635;
    }
    else
    {
        self.var_621cb2c0d9b1cdae = var_6f4eb8a505d5c52f;
    }
    
    function_e619a5f97879fa4a();
}

// Namespace progress_tracker / scripts\common\progress_tracker
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x44c
// Size: 0xdc, Type: bool
function private function_c076b6b5c85274d8( var_6f4eb8a505d5c52f )
{
    if ( !isdefined( self.var_b76b3aee05993635 ) )
    {
        return false;
    }
    
    var_47378a790f40bbe2 = self.var_cc3e7fbaface5a17 < self.var_b76b3aee05993635 && var_6f4eb8a505d5c52f >= self.var_b76b3aee05993635;
    var_e1836bac44cbf54a = self.var_cc3e7fbaface5a17 > self.var_b76b3aee05993635 && var_6f4eb8a505d5c52f <= self.var_b76b3aee05993635;
    var_feef1209b8b0a9ea = self.var_cc3e7fbaface5a17 == self.var_b76b3aee05993635 || iscomplete();
    var_d49232a821579d29 = isfloat( var_6f4eb8a505d5c52f ) && abs( var_6f4eb8a505d5c52f - self.var_b76b3aee05993635 ) <= 0.25;
    
    if ( var_47378a790f40bbe2 || var_e1836bac44cbf54a || var_feef1209b8b0a9ea || var_d49232a821579d29 )
    {
        return true;
    }
    
    return false;
}

