#using scripts\unittest\util;

#namespace namespace_106f587ebebd0cab;

/#

    // Namespace namespace_106f587ebebd0cab / scripts\unittest\private
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xa2
    // Size: 0x11, Type: dev
    function private dev_internal()
    {
        test_print( "<dev string:x1c>" );
    }

#/

// Namespace namespace_106f587ebebd0cab / scripts\unittest\private
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xbb
// Size: 0xe
function private _internal()
{
    test_print( "call to scriptsunittestprivate::_internal" );
}

// Namespace namespace_106f587ebebd0cab / scripts\unittest\private
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd1
// Size: 0x2b
function main()
{
    test_begin( "Private" );
    _internal();
    
    /#
        dev_internal();
    #/
    
    test_end( "Private" );
}

