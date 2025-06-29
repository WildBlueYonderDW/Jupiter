#using script_185660037b9236c1;
#using script_3ab210ea917601e7;
#using script_3ac7886f9e4eceef;
#using script_3e31016b9c11a616;
#using script_41387eecc35b88bf;
#using script_7f9409b703dad400;
#using scripts\common\data_tracker;
#using scripts\common\progress_tracker;
#using scripts\common\utility;
#using scripts\engine\utility;

#namespace namespace_a8e6d792fb89051e;

// Namespace namespace_a8e6d792fb89051e / namespace_2bb19978a7035533
// Params 4
// Checksum 0x0, Offset: 0x1d6
// Size: 0x5f
function function_b05f987b9adfdc21( uniquename, var_cc3e7fbaface5a17, var_b76b3aee05993635, customcallbackfunction )
{
    progresstracker = function_b58813f6489727f2( var_cc3e7fbaface5a17, var_b76b3aee05993635 );
    function_5d8afaa62329ec72( uniquename, progresstracker, customcallbackfunction );
    activitynexuslog( "Progress Tracker: " + uniquename + " was added to an Activity.", @"hash_c6dd0e44e8224971", self );
}

// Namespace namespace_a8e6d792fb89051e / namespace_2bb19978a7035533
// Params 3
// Checksum 0x0, Offset: 0x23d
// Size: 0x56
function function_76c04b66e3485690( uniquename, var_84b03d3d5cf4dd29, customcallbackfunction )
{
    var_eec7d321c580f401 = function_eb40bea3220ba871( var_84b03d3d5cf4dd29 );
    function_5d8afaa62329ec72( uniquename, var_eec7d321c580f401, customcallbackfunction );
    activitynexuslog( "Stopwatch Progress Tracker: " + uniquename + " was added to an Activity.", @"hash_c6dd0e44e8224971", self );
}

// Namespace namespace_a8e6d792fb89051e / namespace_2bb19978a7035533
// Params 3
// Checksum 0x0, Offset: 0x29b
// Size: 0x56
function function_95f8d1b9f6685b61( uniquename, timeinseconds, customcallbackfunction )
{
    var_62f399d3210cb2a6 = function_3eec8a169e8a0936( timeinseconds );
    function_5d8afaa62329ec72( uniquename, var_62f399d3210cb2a6, customcallbackfunction );
    activitynexuslog( "Countdown Progress Tracker: " + uniquename + " was added to an Activity.", @"hash_c6dd0e44e8224971", self );
}

// Namespace namespace_a8e6d792fb89051e / namespace_2bb19978a7035533
// Params 3
// Checksum 0x0, Offset: 0x2f9
// Size: 0x56
function function_6a79e7a24a17e101( uniquename, var_ded14ae1ea8c4446, customcallbackfunction )
{
    var_ad4459eadc3dee86 = function_194d5c2394f0c8f6( var_ded14ae1ea8c4446 );
    function_5d8afaa62329ec72( uniquename, var_ad4459eadc3dee86, customcallbackfunction );
    activitynexuslog( "Kill Progress Tracker: " + uniquename + " was added to an Activity.", @"hash_c6dd0e44e8224971", self );
}

// Namespace namespace_a8e6d792fb89051e / namespace_2bb19978a7035533
// Params 0
// Checksum 0x0, Offset: 0x357
// Size: 0x5f
function function_f3a73e1c537a55ae()
{
    if ( function_2cd8a95641b4e4f1() )
    {
        foreach ( progresstracker in self.var_e3d833b1e5d30b03 )
        {
            function_2d8ae6d7b07724e2( progresstracker );
        }
    }
}

// Namespace namespace_a8e6d792fb89051e / namespace_2bb19978a7035533
// Params 1
// Checksum 0x0, Offset: 0x3be
// Size: 0x42
function function_b0afa182f3914d4f( uniquename )
{
    progresstracker = self.var_e3d833b1e5d30b03[ uniquename ];
    assertex( isdefined( progresstracker ), "<dev string:x1c>" + uniquename + "<dev string:x2e>" );
    function_2d8ae6d7b07724e2( progresstracker );
}

// Namespace namespace_a8e6d792fb89051e / namespace_2bb19978a7035533
// Params 2
// Checksum 0x0, Offset: 0x408
// Size: 0xb1
function function_9ff369ea020a30a6( uniquename, pausetimer )
{
    progresstracker = self.var_e3d833b1e5d30b03[ uniquename ];
    assertex( isdefined( progresstracker ), "<dev string:x6c>" + uniquename + "<dev string:x2e>" );
    assertex( isdefined( progresstracker.paused ), "<dev string:x6c>" + uniquename + "<dev string:x80>" );
    
    if ( pausetimer && !progresstracker.paused )
    {
        progresstracker.paused = 1;
        return;
    }
    
    if ( !pausetimer && progresstracker.paused )
    {
        progresstracker.paused = 0;
        progresstracker notify( "resume" );
    }
}

// Namespace namespace_a8e6d792fb89051e / namespace_2bb19978a7035533
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x4c1
// Size: 0x53
function private function_5d8afaa62329ec72( uniquename, progresstracker, customcallbackfunction )
{
    progresstracker addcallback( self, &function_864b19ca6e4a3a81 );
    
    if ( isdefined( customcallbackfunction ) )
    {
        progresstracker addcallback( self, customcallbackfunction );
    }
    
    function_53a8c0ab528f44cd( uniquename, progresstracker );
    scripts\common\data_tracker::function_e4b4be816ed43365( uniquename, progresstracker );
    namespace_68dc261109a9503f::function_ce906635a152d2d0( self, uniquename );
}

// Namespace namespace_a8e6d792fb89051e / namespace_2bb19978a7035533
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x51c
// Size: 0x74
function private function_864b19ca6e4a3a81( progresstracker )
{
    uniquename = progresstracker scripts\common\progress_tracker::function_4f3f1f9cedf2d883();
    scripts\common\data_tracker::function_5aa098a0e2a91e3e( uniquename );
    activitynexuslog( "Progress Tracker: " + uniquename + " 's value has been updated. Progress Remaining: " + progresstracker scripts\common\progress_tracker::function_cfeb21bf93c30dae(), @"hash_c6dd0e44e8224971", self );
    
    if ( progresstracker iscomplete() )
    {
        activitynexuslog( "Progress Tracker: " + uniquename + " is complete.", @"hash_c6dd0e44e8224971", self );
    }
}

// Namespace namespace_a8e6d792fb89051e / namespace_2bb19978a7035533
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x598
// Size: 0x5d
function private function_2d8ae6d7b07724e2( progresstracker )
{
    uniquename = progresstracker function_4f3f1f9cedf2d883();
    scripts\common\data_tracker::removedata( uniquename );
    function_f2a618a7ad2f558d( uniquename, self.var_6c29f2fdb0054bbe );
    function_11bf7ad9c1fdc527( uniquename );
    activitynexuslog( "Progress Tracker: " + uniquename + " has ended for the activity. ", @"hash_c6dd0e44e8224971", self );
}

