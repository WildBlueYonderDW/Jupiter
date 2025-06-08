#using script_185660037b9236c1;
#using script_220d0eb95a8fab7d;
#using script_3ab210ea917601e7;
#using script_3ac7886f9e4eceef;
#using script_3b78d23dad7ec5be;
#using script_3e31016b9c11a616;
#using script_41387eecc35b88bf;
#using script_46c7c73b1a7e4773;
#using script_4e6e58ab5d96c2b0;
#using script_4ef01fe6151dde4d;
#using script_4fa7e9e11630166c;
#using script_4fdefae8b7bcdf73;
#using script_5753ba9c28794a65;
#using script_5d8202968463a21d;
#using script_638d701d263ee1ed;
#using script_64351208cb856df9;
#using script_7956d56c4922bd1;
#using script_79deab1955343d5d;
#using script_9880b9dc28bc25e;
#using scripts\asm\shared\mp\utility;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\vehicle;
#using scripts\common\vehicle_paths;
#using scripts\cp_mp\calloutmarkerping;
#using scripts\cp_mp\interaction;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\cp_mp\vehicles\vehicle_airdrop;
#using scripts\cp_mp\vehicles\vehicle_tracking;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\objidpoolmanager;

#namespace namespace_d197b40cdbf4a1ea;

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0xc9a
// Size: 0xbc
function function_de62bc27675c1bfc()
{
    function_89384091f7a2dbd( "REV_OB_ESCORT_ZOMBIES", 0, &escort_idle );
    function_89384091f7a2dbd( "REV_OB_ESCORT_ZOMBIES", 1, &escort_init );
    function_89384091f7a2dbd( "REV_OB_ESCORT_ZOMBIES", 2, &function_65d47a407d91bf8f );
    function_89384091f7a2dbd( "REV_OB_ESCORT_ZOMBIES", 3, &function_6c78c7079abcb33a );
    function_89384091f7a2dbd( "REV_OB_ESCORT_ZOMBIES", 4, &function_1cc9926013901dc5 );
    function_89384091f7a2dbd( "REV_OB_ESCORT_ZOMBIES", 5, &function_937d984d2d97046 );
    function_8b5b2a3392fc7e2a( "PlayerJoin", &function_1531bbf5cff97dc0, "REV_OB_ESCORT_ZOMBIES" );
    function_8b5b2a3392fc7e2a( "PlayerLeave", &function_5c651df8cfad0810, "REV_OB_ESCORT_ZOMBIES" );
    function_8b5b2a3392fc7e2a( "PlayerAbandon", &function_540f9b357f3b5419, "REV_OB_ESCORT_ZOMBIES" );
    function_48e697a59457ec45();
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0xd5e
// Size: 0x119
function escort_idle()
{
    if ( istrue( level.var_dbca431b3ea02d2e ) )
    {
        self.var_e726c726c6fb7dec = 1;
    }
    
    var_45c17c8bd7095cc4 = function_b9c4aa88ad97ee68( self );
    self.variant_definition = var_45c17c8bd7095cc4;
    self.var_1be7d142b0b72909 = getstruct( self.varianttag, "targetname" );
    self.script_noteworthy = self.var_1be7d142b0b72909.script_noteworthy;
    self.var_d9a91303aea799de = function_a833053c48e37c08();
    self.routedifficulty = function_dac4378812650312( self.var_d9a91303aea799de.origin );
    [ self.interact_struct ] = getstructarray( self.varianttag, "script_noteworthy" );
    self.rocketlaunched = 0;
    thread function_97e82918ce08c384();
    
    if ( !vehicle_tracking::canspawnvehicle() )
    {
        namespace_a1fa5fb7614c23b6::activitynexuslog( "Reached max vehicle budget before Escort vehicle could spawn. Destroying contract.", @"hash_4a93c7546965668", self );
        namespace_4fda5d7358015a06::function_4bc22996edea81f1( self );
        return;
    }
    else
    {
        vehicle_tracking::reservevehicle( 1 );
    }
    
    function_b6fc2c96b463c007( self );
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0xe7f
// Size: 0x1e5
function escort_init()
{
    self endon( "activity_ended" );
    self endon( "instance_destroyed" );
    function_84610473025b148();
    thread namespace_277c27ef297ef569::function_1281c7fff9456e18( "contract_escort_air_drop_broadcast" );
    vehicle_tracking::clearvehiclereservation( 1 );
    self.vh_escort = spawn_escort_vehicle();
    
    if ( !isdefined( self.vh_escort ) )
    {
        namespace_a1fa5fb7614c23b6::activitynexuslog( "Attempted to Spawn Escort Vehicle but it returned undefined. Ending Contract.", @"hash_4a93c7546965668", self );
        activity_participation::function_ad54e18b503363a0( self, self.var_6c29f2fdb0054bbe );
        return;
    }
    
    self.ambushradius = self.variant_definition.ambushradius;
    self.floodradius = self.variant_definition.floodradius;
    self.escorticon = self.variant_definition.escorticon;
    thread function_6ce4a40939aa527b();
    self notify( "escort_mission_vo" );
    function_2674a21020618651();
    self.vh_escort.e_start waittill( "escort_started" );
    self.vh_escort.e_start delete();
    wait_time = function_c619613f382927df( "dx_ob_oesc_esca_acve_escbootup" ) + 1;
    self.vh_escort.vo_ent playsoundonmovingent( "dx_ob_oesc_esca_acve_escbootup" );
    self.vh_escort setscriptablepartstate( "engine", "start" );
    self.vh_escort setscriptablepartstate( "panel", "activate" );
    wait wait_time;
    self.vh_escort.vo_ent playsoundonmovingent( "dx_ob_oesc_esca_acve_escmovingout" );
    self.vh_escort setscriptablepartstate( "beacon_light", "active" );
    self.vh_escort setscriptablepartstate( "side_lights", "on" );
    function_da11a8810b7c3bc8();
    thread function_230154c54b0b938();
    thread function_f2dfc1507d2deaae();
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x106c
// Size: 0x102
function function_230154c54b0b938()
{
    self endon( "activity_ended" );
    self endon( "instance_destroyed" );
    self.vh_escort endon( "death" );
    var_f84c03de33d71429 = [ "cleansed_02", "cleansed_03", "cleansed_04" ];
    wait_time = self.vh_escort.var_c2c1024b2058e949 / var_f84c03de33d71429.size;
    
    while ( true )
    {
        self.vh_escort waittill( "cleansing" );
        
        for ( i = 0; i < var_f84c03de33d71429.size ; i++ )
        {
            wait wait_time;
            self.vh_escort function_ab34d26620cac9d8( var_f84c03de33d71429[ i ] );
        }
        
        wait 1;
        self.vh_escort notify( "cleansed" );
        self.vh_escort function_444329a225699862();
        waitframe();
        self.vh_escort.ent_crystal delete();
        self.vh_escort.ent_beams delete();
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1176
// Size: 0x83
function private function_444329a225699862()
{
    if ( isdefined( self.var_42e7c4e8d9aface2 ) )
    {
        self.var_42e7c4e8d9aface2 delete();
    }
    
    if ( isdefined( self.small_beams ) )
    {
        foreach ( beam in self.small_beams )
        {
            if ( isdefined( beam ) )
            {
                beam delete();
            }
        }
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x1201
// Size: 0xf7
function function_dfa7a2237d6910d2()
{
    self endon( "activity_ended" );
    self endon( "instance_destroyed" );
    self.vh_escort endon( "death" );
    current_time = 0;
    
    while ( istrue( self.vh_escort.var_5cd270934176a923 ) )
    {
        wait 1;
        current_time++;
        self.vh_escort.payload setscriptablepartstate( "rocket", "countdown" );
        self.vh_escort setscriptablepartstate( "rear_light", "countdown" );
        self.vh_escort childthread function_cd87cff6a50ddde( 0.5 );
        
        if ( current_time >= self.vh_escort.launchtime )
        {
            self.vh_escort.var_5cd270934176a923 = 0;
        }
    }
    
    wait 1;
    self.vh_escort notify( "launch_complete" );
    self.vh_escort setscriptablepartstate( "rear_light", "launch" );
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1300
// Size: 0x2f
function private function_cd87cff6a50ddde( n_delay )
{
    self endon( "death" );
    
    if ( isdefined( n_delay ) )
    {
        wait n_delay;
    }
    
    if ( isdefined( self ) )
    {
        self setscriptablepartstate( "rear_light", "off" );
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1
// Checksum 0x0, Offset: 0x1337
// Size: 0x37
function function_1531bbf5cff97dc0( var_b381b0883bcd4847 )
{
    player_list = var_b381b0883bcd4847.playerlist;
    var_a83ac3549acc2da2 = var_b381b0883bcd4847.var_b494ea8c4b70490;
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1
// Checksum 0x0, Offset: 0x1376
// Size: 0x22
function function_5c651df8cfad0810( var_b381b0883bcd4847 )
{
    player_list = var_b381b0883bcd4847.playerlist;
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1
// Checksum 0x0, Offset: 0x13a0
// Size: 0x67
function function_540f9b357f3b5419( var_b381b0883bcd4847 )
{
    wait 0.2;
    
    foreach ( player in var_b381b0883bcd4847.playerlist )
    {
        function_4a508fcbbea05afd( player );
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x140f
// Size: 0x25
function private function_4a508fcbbea05afd( player )
{
    if ( function_5acc35fc66331385( player, 17060 ) )
    {
        player ent_flag_clear( "quest_s0a1t5_chaperone_start" );
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x143c
// Size: 0x1b
function escort_begin()
{
    self endon( "activity_ended" );
    self endon( "instance_destroyed" );
    thread namespace_b3f32c8cb80b8124::function_e73a92bbeb2ae323();
    
    /#
    #/
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x145f
// Size: 0x155
function spawn_escort_vehicle()
{
    wait 1;
    spawndata = spawnstruct();
    spawndata.angles = self.var_d9a91303aea799de.angles;
    spawndata.team = self.var_6c29f2fdb0054bbe[ 0 ].team;
    spawndata.initai = 0;
    spawndata.origin = self.var_d9a91303aea799de.origin;
    spawndata.preventrespawn = 1;
    spawndata.str_payload = "rocket";
    spawndata.activity_instance = self;
    spawndata.var_699ac4a9c9e9f0ec = 1;
    spawndata.var_24993ee24f7c7c0 = 1;
    spawndata.nohitmarkers = 1;
    
    if ( isdefined( self.script_noteworthy ) && self.var_1be7d142b0b72909.script_noteworthy == self.script_noteworthy )
    {
        vh_escort = scripts\cp_mp\vehicles\vehicle_airdrop::vehicle_airdrop( "veh_jup_ob_tank_escort", spawndata );
        vh_escort.script_noteworthy = self.script_noteworthy;
        vh_escort function_65aa053c077c003a( 1 );
        vh_escort vehicleshowonminimap( 0 );
        vh_escort function_1cd1ee312fd03bb4( 1 );
        self notify( "vehicle_spawned" );
        return vh_escort;
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x15bc
// Size: 0x7f
function private function_43f53f0a182c23e6( str_state )
{
    crystals = getentitylessscriptablearray( self.varianttag + "_CRYSTAL", "script_noteworthy" );
    
    foreach ( crystal in crystals )
    {
        crystal setscriptablepartstate( "escort_crystal", str_state );
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1643
// Size: 0x115
function private function_6ce4a40939aa527b()
{
    self.damageent = spawn_tag_origin();
    self.damageent.team = "team_two_hundred";
    crystals = getentitylessscriptablearray( self.varianttag + "_CRYSTAL", "script_noteworthy" );
    self.crystals = crystals;
    
    foreach ( crystal in crystals )
    {
        crystal setscriptablepartstate( "escort_crystal", "open" );
    }
    
    wait 1;
    
    foreach ( crystal in crystals )
    {
        crystal setscriptablepartstate( "escort_crystal", "active" );
        crystal thread function_8ae28f8ad7c0b4e( self );
    }
    
    /#
        iprintlnbold( "<dev string:x1c>" );
    #/
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1760
// Size: 0x58
function private function_8ae28f8ad7c0b4e( activityinstance )
{
    self endon( "destroyed" );
    activityinstance endon( "activity_ended" );
    activityinstance endon( "instance_destroyed" );
    
    while ( isdefined( activityinstance.damageent ) )
    {
        radiusdamage( self.origin, 100, 2, 1, activityinstance.damageent );
        wait 1;
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x17c0
// Size: 0x4b
function function_a833053c48e37c08()
{
    self endon( "activity_ended" );
    self endon( "instance_destroyed" );
    s_startnode = getvehiclenode( self.script_noteworthy, "targetname" );
    
    if ( !isdefined( s_startnode ) )
    {
        s_startnode = getstructarray( self.script_noteworthy, "targetname" );
    }
    
    return s_startnode;
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x1814
// Size: 0x1f7
function function_2674a21020618651()
{
    self endon( "activity_ended" );
    self endon( "instance_destroyed" );
    self.vh_escort vehicle_turnengineoff();
    self.vh_escort setcandamage( 0 );
    self.vh_escort function_c3682430b317ca26();
    self.vh_escort thread function_9f2cf2de7d6032a2();
    self.vh_escort.vo_ent = spawn( "script_model", self.vh_escort.origin );
    self.vh_escort.vo_ent linkto( self.vh_escort, "tag_origin", ( 0, 0, 78 ), ( 0, 0, 0 ) );
    self.vh_escort.e_start = scripts\cp_mp\interaction::register_interact( self.vh_escort.origin, 48, &escort_interact, %JUP_OB_OBJECTIVES/ESCORT_ZOMBIES_START_ACV );
    self.vh_escort.e_start disableplayeruseforallplayers();
    self.vh_escort.e_start linkto( self.vh_escort, "tag_control_activate", ( 0, 0, 0 ), ( 0, 90, 0 ) );
    self.vh_escort.nd_start = getvehiclenode( self.vh_escort.script_noteworthy, "targetname" );
    self.vh_escort waittill( "freefall" );
    thread namespace_277c27ef297ef569::function_1281c7fff9456e18( "contract_escort_arrive_convo_broadcast" );
    wait 0.75;
    self.vh_escort scripts\common\vehicle::attach_vehicle( self.vh_escort.nd_start );
    self.vh_escort setscriptablepartstate( "panel", "open" );
    self.vh_escort thread function_5a233915821c0ea6( self );
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x1a13
// Size: 0x10c
function function_da11a8810b7c3bc8()
{
    self endon( "activity_ended" );
    self endon( "instance_destroyed" );
    self.vh_escort.var_aa4804cc1bc59e93 = 1;
    self.vh_escort.var_1cb92917037d8996 = 0;
    self.vh_escort function_315198e9ce4cd18c();
    self.vh_escort escort_setup( self );
    thread escort_begin();
    self.vh_escort thread scripts\common\vehicle::vehicle_paths( self.vh_escort.nd_start );
    scripts\common\vehicle_paths::gopath( self.vh_escort );
    thread namespace_277c27ef297ef569::function_1281c7fff9456e18( "contract_escort_briefing_broadcast" );
    self.vh_escort thread escort_think( self );
    self.vh_escort thread function_4e3e489bd31d3b7( self );
    self.vh_escort thread function_9c9e518280bea222( self );
    self.vh_escort thread function_1db9d507d5dd43da();
    thread function_baab7cceb29552a5();
    thread escort_complete();
    thread function_8543cb813eebd318();
    thread function_a46548c342e333f7();
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1b27
// Size: 0x16
function private function_84610473025b148()
{
    namespace_262d6474998a2356::function_f0361294db9d74a7( 100, 20 );
    namespace_262d6474998a2356::function_c661dba3e304266b( 100 );
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x1b45
// Size: 0x208
function function_8543cb813eebd318()
{
    self endon( "activity_ended" );
    self endon( "instance_destroyed" );
    self.vh_escort endon( "death" );
    n_start_health = self.vh_escort.health;
    var_d3f9d2fc8ac619b1 = 0;
    var_a905d9404522f094 = 0;
    var_eb40bbae0dbac309 = 0;
    
    while ( true )
    {
        self.vh_escort waittill( "damage", idamage, eattacker, vdir, vpoint, smeansofdeath, smodelname, stagname, spartname, idflags, objweapon, origin, angles, normal, einflictor, eventid );
        
        if ( isdefined( eattacker ) && isplayer( eattacker ) && isdefined( idamage ) )
        {
            self.vh_escort.health += idamage;
            continue;
        }
        
        /#
            iprintlnbold( self.vh_escort.health );
        #/
        
        function_32df7454369064fb( self.vh_escort.health, n_start_health );
        
        if ( isdefined( vpoint ) )
        {
            playsoundatpos( vpoint, "evt_ob_obj_acv_damage" );
        }
        
        if ( !var_a905d9404522f094 && self.vh_escort.health <= n_start_health * 0.75 )
        {
            var_a905d9404522f094 = 1;
            thread function_88cf521697f00f27( 1 );
            continue;
        }
        
        if ( !var_eb40bbae0dbac309 && self.vh_escort.health <= n_start_health * 0.25 )
        {
            var_eb40bbae0dbac309 = 1;
            thread function_88cf521697f00f27( 2 );
        }
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1d55
// Size: 0x65
function private function_32df7454369064fb( currentvalue, totalvalue )
{
    n_percent = 0;
    
    if ( isdefined( currentvalue ) && isdefined( totalvalue ) && totalvalue > 0 )
    {
        percentagecomplete = currentvalue / totalvalue * 100;
        n_percent = clamp( percentagecomplete, 0, 100 );
        n_percent = int( n_percent );
    }
    
    namespace_262d6474998a2356::function_f0361294db9d74a7( n_percent );
    namespace_262d6474998a2356::function_c661dba3e304266b( n_percent );
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1dc2
// Size: 0x2d
function private function_c619613f382927df( str_alias )
{
    var_c5fd8d562611e0e4 = lookupsoundlength( str_alias );
    var_c5fd8d562611e0e4 = float( var_c5fd8d562611e0e4 );
    var_c5fd8d562611e0e4 /= 1000;
    return var_c5fd8d562611e0e4;
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x1df8
// Size: 0xd8
function function_a46548c342e333f7()
{
    self endon( "activity_ended" );
    self endon( "instance_destroyed" );
    self.vh_escort endon( "rocket_launched" );
    self.vh_escort waittill( "death" );
    self.vh_escort.was_killed = 1;
    thread function_cb078cbf493f2b94();
    
    if ( isdefined( self.vh_escort.payload ) )
    {
        self.payload = self.vh_escort.payload;
        v_payload = self.vh_escort gettagorigin( "tag_attach_rocket" );
        thread function_7122f1d1f05e191c( v_payload, self.vh_escort.angles );
    }
    
    self.vh_escort.var_1cb92917037d8996 = 0;
    function_a1bfca674edbfb4d( 0 );
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1
// Checksum 0x0, Offset: 0x1ed8
// Size: 0x6c
function function_a1bfca674edbfb4d( success )
{
    if ( !success )
    {
        foreach ( player in self.var_6c29f2fdb0054bbe )
        {
            function_4a508fcbbea05afd( player );
        }
    }
    
    endactivity( self, success );
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x1f4c
// Size: 0x23a
function function_baab7cceb29552a5()
{
    self endon( "activity_ended" );
    self endon( "instance_destroyed" );
    self.vh_escort endon( "death" );
    self.vh_escort.progress = 0;
    
    while ( true )
    {
        self.vh_escort waittill( "neutralize" );
        self.vh_escort function_fdda881efcfe245e();
        self.vh_escort.var_1cb92917037d8996 = 1;
        thread function_e4d01e8e0a294fc8( self.variant_definition.floodencounters );
        self.vh_escort function_c3682430b317ca26();
        self.vh_escort function_65aa053c077c003a( 1 );
        self.vh_escort vehicle_setspeedimmediate( 0, self.vh_escort.accel, self.vh_escort.decel );
        self.vh_escort pausepath( 0 );
        self.vh_escort function_251b4856d66f56eb();
        self.vh_escort thread function_33acb64174d30e83();
        wait 0.2;
        self.vh_escort function_ab34d26620cac9d8( "cleansed_01" );
        self.vh_escort notify( "cleansing" );
        self.vh_escort thread function_fa1dfe49dc65f703( self );
        self.vh_escort thread function_6e1c45b2ef2eea51( self );
        self.vh_escort waittill( "cleansed" );
        thread function_ec872f85aad96184();
        self.vh_escort.progress++;
        self.vh_escort thread function_9df197808742ed1c();
        self.vh_escort function_ee05e3fc9e78dffd( self );
        self.vh_escort.var_1cb92917037d8996 = 0;
        
        if ( self.vh_escort.final_stop == 1 )
        {
            break;
        }
        
        if ( self.vh_escort.progress == 1 )
        {
            thread function_46c5c5dc4eb70411();
            continue;
        }
        
        if ( !istrue( self.var_ab38de8a32717302 ) && self.vh_escort.progress == 2 )
        {
            thread function_aae497883f04b1c6();
        }
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x218e
// Size: 0x5b
function private function_9df197808742ed1c()
{
    var_22b5bcbc290e0d3c = [ "fill_onethird", "fill_twothirds", "fill_full" ];
    
    if ( self.progress <= var_22b5bcbc290e0d3c.size )
    {
        self.payload setscriptablepartstate( "vials", var_22b5bcbc290e0d3c[ self.progress - 1 ] );
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x21f1
// Size: 0x1b
function private function_9f2cf2de7d6032a2()
{
    self.payload setscriptablepartstate( "vials", "empty" );
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2214
// Size: 0x82
function private function_6e1c45b2ef2eea51( activity_instance )
{
    switch ( self.progress )
    {
        case 0:
            function_3df5cdf48ba6eca( 1, activity_instance, self.var_c2c1024b2058e949 );
            break;
        case 1:
            function_3df5cdf48ba6eca( 2, activity_instance, self.var_c2c1024b2058e949 );
            break;
        default:
            function_3df5cdf48ba6eca( 3, activity_instance, self.var_c2c1024b2058e949 );
            break;
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x229e
// Size: 0x12c
function private function_3df5cdf48ba6eca( spawncount, activity_instance, f_time )
{
    self endon( "death" );
    spawns = 0;
    s_encounter = random( self.var_2f1c4d610c6efd62 );
    a_s_pts = function_a9c50e82fb0f743a();
    assertex( isdefined( a_s_pts ), "<dev string:x33>" );
    encounter_name = "ai_encounter:" + s_encounter.encounter;
    var_9e3cc96b3a2c2e2c = self.ambushradius;
    timer = f_time / spawncount;
    spawntimer = clamp( timer, 5, 15 );
    
    while ( true )
    {
        if ( isdefined( a_s_pts ) )
        {
            a_s_pts = array_randomize( a_s_pts );
            v_ground = a_s_pts[ 0 ].origin;
            request_id = activity_instance function_f8ccadcd850da124( encounter_name, v_ground, var_9e3cc96b3a2c2e2c, 1, 0, 1, 2 );
            
            /#
                function_d37068aac7785c04( request_id, activity_instance.routedifficulty, 1 );
            #/
            
            spawns++;
            
            if ( spawns >= spawncount )
            {
                break;
            }
        }
        
        wait spawntimer;
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x23d2
// Size: 0x135
function private function_fa1dfe49dc65f703( activity_instance )
{
    assertex( isdefined( self.crystal.target ), "<dev string:x78>" );
    
    if ( isdefined( self.crystal.target ) )
    {
        var_7a6ea3d91b32f0eb = getstruct( self.crystal.target, "targetname" );
        assertex( isdefined( var_7a6ea3d91b32f0eb ), "<dev string:xbd>" );
        v_ground = var_7a6ea3d91b32f0eb.origin;
        playsoundatpos( v_ground + ( 0, 0, 50 ), "evt_ob_obj_acv_zm_incoming_stinger" );
        earthquake( 0.4, 1, v_ground, 1500 );
        s_encounter = random( activity_instance.variant_definition.var_5fcaf114c800213 );
        encounter_name = "ai_encounter:" + s_encounter.encounter;
        request_id = activity_instance function_f8ccadcd850da124( encounter_name, v_ground, 500, 1, 0, 1, 2 );
        
        /#
            function_d37068aac7785c04( request_id, activity_instance.routedifficulty, 1 );
        #/
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x250f
// Size: 0x34
function private function_251b4856d66f56eb()
{
    self endon( "death" );
    self.vo_ent playsoundonmovingent( "dx_ob_oesc_esca_acve_escneutralizestart" );
    self setscriptablepartstate( "maw", "maw_open" );
    wait 2.5;
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x254b
// Size: 0x56
function private function_ee05e3fc9e78dffd( activity_instance )
{
    self endon( "death" );
    
    if ( self.progress < activity_instance.crystals.size )
    {
        self.vo_ent playsoundonmovingent( "dx_ob_oesc_esca_acve_esccontaincomplete" );
    }
    
    self setscriptablepartstate( "maw", "maw_close" );
    wait 2.5;
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x25a9
// Size: 0x33b
function private function_33acb64174d30e83()
{
    self endon( "cleansed" );
    self endon( "death" );
    v_start = self gettagorigin( "tag_fx_beam" );
    v_angles = self gettagangles( "tag_fx_beam" );
    self setscriptablepartstate( "maw", "beam_begin" );
    self.vo_ent playsoundonmovingent( "dx_ob_oesc_esca_acve_esccontainstart" );
    
    if ( isdefined( self.crystal ) )
    {
        crystal = self.crystal;
        v_end = crystal.origin;
        self.ent_crystal = spawn( "script_model", crystal.origin );
        self.ent_crystal setmodel( "tag_origin" );
        face_angles = vectortoangles( v_start - self.ent_crystal.origin );
        self.ent_crystal rotateto( face_angles, 0.1 );
        v_intersection = v_start + vectornormalize( v_end - v_start ) * 80;
        self.ent_beams = spawn( "script_model", v_intersection );
        self.ent_beams setmodel( "tag_origin" );
        self.ent_beams linkto( self );
        waitframe();
        function_afed347bad41b68a();
        playfxontag( getfx( "escort_laser_glow_energy_point" ), self.ent_beams, "tag_origin" );
        wait 0.2;
        self.var_42e7c4e8d9aface2 = playfxontagsbetweenclients( getfx( "escort_laser_ch" ), self, "tag_fx_beam", self.ent_crystal, "tag_origin" );
        
        if ( isdefined( self.var_42e7c4e8d9aface2 ) )
        {
            self.var_42e7c4e8d9aface2 forcenetfieldhighlod( 1 );
        }
        
        playfxontag( getfx( "escort_laser_absorb" ), self.ent_crystal, "tag_origin" );
        
        while ( true )
        {
            contents = scripts\engine\trace::create_character_contents();
            ignorelist = [];
            results = physics_spherecast( v_start, v_end, 20, contents, ignorelist, "physicsquery_all" );
            
            foreach ( cast in results )
            {
                ent = cast[ "entity" ];
                
                if ( isdefined( ent.team ) && ent.team == "team_two_hundred" )
                {
                    if ( 9999 >= ent.health )
                    {
                        ent ent_flag_set( "plasma_death" );
                    }
                    
                    ent dodamage( 9999, self.origin, self, undefined, "MOD_ELEMENTAL_ELEC" );
                }
                
                if ( isplayer( ent ) )
                {
                    ent dodamage( 1, self.origin, self.markerattach, undefined, "MOD_ELEMENTAL_ELEC" );
                }
            }
            
            /#
                sphere( self.ent_beams.origin, 20, ( 1, 0, 0 ), undefined, 1 );
            #/
            
            wait 0.5;
        }
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x28ec
// Size: 0xd3
function private function_afed347bad41b68a()
{
    fx_tags = [ "tag_fx_maw_laser_top", "tag_fx_maw_laser_bottom", "tag_fx_maw_laser_right", "tag_fx_maw_laser_left" ];
    self.small_beams = [];
    
    foreach ( fx_tag in fx_tags )
    {
        self.small_beams[ self.small_beams.size ] = playfxontagsbetweenclients( getfx( "escort_laser_sm" ), self, fx_tag, self.ent_beams, "tag_origin" );
        self.small_beams[ self.small_beams.size - 1 ] forcenetfieldhighlod( 1 );
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x29c7
// Size: 0x5c
function private function_fdda881efcfe245e()
{
    nd_current = self.currentnode;
    
    if ( isdefined( nd_current.script_label ) )
    {
        [ crystal ] = getentitylessscriptablearray( nd_current.script_label, "targetname" );
        self.crystal = crystal;
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2a2b
// Size: 0x2d
function private function_ab34d26620cac9d8( str_state )
{
    if ( isdefined( self.crystal ) )
    {
        self.crystal setscriptablepartstate( "escort_crystal", str_state );
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2a60
// Size: 0xfe
function private function_ec872f85aad96184()
{
    self.vh_escort setscriptablepartstate( "maw", "beam_end" );
    self.vh_escort function_ab34d26620cac9d8( "destroyed" );
    wait 0.25;
    f_radius = 500;
    v_origin = self.vh_escort.crystal.origin;
    radiusdamage( v_origin, f_radius, 200, 100, self.vh_escort );
    a_ai = getaiarrayinradius( v_origin, f_radius, "team_two_hundred" );
    
    foreach ( ai in a_ai )
    {
        ai namespace_db1ce2c035564e2c::knockdown_ai( v_origin );
    }
    
    self.vh_escort.crystal notify( "destroyed" );
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2b66
// Size: 0x189
function private function_9ead1dc90952b037( activity_instance )
{
    activity_instance endon( "activity_ended" );
    activity_instance endon( "instance_destroyed" );
    self endon( "death" );
    var_eb33024041d39010 = activity_instance.variant_definition.launchtime;
    total_time = var_eb33024041d39010 + 4;
    activity_instance thread namespace_277c27ef297ef569::function_1281c7fff9456e18( "contract_escort_vortex_03_complete_conv_broadcast" );
    self.var_5cd270934176a923 = 1;
    self setscriptablepartstate( "beacon_light", "off" );
    self setscriptablepartstate( "headlight_left", "off" );
    self setscriptablepartstate( "headlight_right", "off" );
    thread function_3df5cdf48ba6eca( 2, activity_instance, total_time );
    activity_instance thread function_e4d01e8e0a294fc8( activity_instance.variant_definition.floodencounters );
    wait 4;
    
    if ( isdefined( self.payload ) )
    {
        self.payload setscriptablepartstate( "rocket", "init" );
        self.payload setscriptablepartstate( "body", "init" );
    }
    
    self setscriptablepartstate( "rear_light", "countdown_begin" );
    thread function_cd87cff6a50ddde( 0.75 );
    wait 3;
    
    if ( isdefined( self ) )
    {
        self.vo_ent playsoundonmovingent( "dx_ob_oesc_esca_acve_esclaunchseqstart" );
        
        if ( isdefined( self ) )
        {
            activity_instance thread function_dfa7a2237d6910d2();
        }
    }
    
    self waittill( "launch_complete" );
    scripts\common\vehicle::godon();
    activity_instance thread function_c1de7c2624911246( self );
    thread function_372d5a3adb0626d0();
    activity_instance.rocketlaunched = 1;
    self notify( "rocket_launched" );
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2cf7
// Size: 0xb2
function private function_372d5a3adb0626d0()
{
    earthquake( 0.8, 1.6, self.origin, 750 );
    
    if ( isdefined( self.payload ) )
    {
        self.payload unlink();
        self.payload setscriptablepartstate( "body", "idle" );
        self.payload setscriptablepartstate( "rocket", "movement" );
        self.payload connectpaths();
        self.payload movez( 5000, 10, 10 );
    }
    
    wait 10;
    
    if ( isdefined( self.payload ) )
    {
        self.payload delete();
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2db1
// Size: 0x11a
function private function_c1de7c2624911246( explosion_source )
{
    radius = 250;
    magnitude = 120;
    radiusdamage( explosion_source.origin, 250, 400, 300, self.vh_escort );
    
    foreach ( ent in function_143526130b12b2b6( explosion_source.origin, radius ) )
    {
        if ( isplayer( ent ) )
        {
            ent knockback( ent.origin - explosion_source.origin, radius * magnitude / length( ent.origin - explosion_source.origin ) );
            continue;
        }
        
        if ( isdefined( ent.team ) && ent.team == "team_two_hundred" )
        {
            ent namespace_db1ce2c035564e2c::knockdown_ai( explosion_source.origin );
        }
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x2ed3
// Size: 0x74
function function_f2dfc1507d2deaae()
{
    self.vh_escort.final_stop = 0;
    self.vh_escort waittill( "final_stop" );
    self.vh_escort.final_stop = 1;
    self.vh_escort notify( "neutralize" );
    self.vh_escort waittill( "cleansed" );
    wait 0.1;
    self.vh_escort function_9ead1dc90952b037( self );
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1
// Checksum 0x0, Offset: 0x2f4f
// Size: 0xec
function function_e4d01e8e0a294fc8( var_890c2a3be167e8d1 )
{
    self endon( "activity_ended" );
    self endon( "instance_destroyed" );
    self.vh_escort endon( "death" );
    self.vh_escort endon( "cleansed" );
    self.vh_escort endon( "rocket_launched" );
    var_9e3cc96b3a2c2e2c = self.floodradius;
    s_encounter = random( var_890c2a3be167e8d1 );
    encounter_name = "ai_flood_fill_encounter:" + s_encounter.floodencounter;
    request_id = function_f8ccadcd850da124( encounter_name, self.vh_escort.origin, var_9e3cc96b3a2c2e2c, 1, 0, 1, 2 );
    
    /#
        function_d37068aac7785c04( request_id, self.routedifficulty, 1 );
    #/
    
    function_c67c7b9e7cbf3821( request_id, &function_2e62ea3d9cf903c8, undefined );
    function_c6942df117004b8( request_id, &function_81c821849ca00d25, self.vh_escort );
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 2
// Checksum 0x0, Offset: 0x3043
// Size: 0x15, Type: bool
function function_2e62ea3d9cf903c8( requestid, userdata )
{
    return true;
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 2
// Checksum 0x0, Offset: 0x3061
// Size: 0x50, Type: bool
function function_81c821849ca00d25( requestid, userdata )
{
    if ( isdefined( userdata.var_5cd270934176a923 ) )
    {
        return !userdata.var_5cd270934176a923;
    }
    else if ( isdefined( userdata.var_1cb92917037d8996 ) )
    {
        return !userdata.var_1cb92917037d8996;
    }
    
    return true;
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1
// Checksum 0x0, Offset: 0x30ba
// Size: 0x253
function escort_setup( activity_instance )
{
    self.team = level.players[ 0 ].team;
    self.health = activity_instance.variant_definition.escorthealth;
    self.var_c2c1024b2058e949 = activity_instance.variant_definition.var_2cfefd04e3fce3df;
    self.launchtime = activity_instance.variant_definition.launchtime;
    self.basespeed = activity_instance.variant_definition.var_de0c6b19da7810df;
    self.speedincrease = activity_instance.variant_definition.speedincrease;
    self.accel = activity_instance.variant_definition.escortaccel;
    self.decel = activity_instance.variant_definition.escortdecel;
    self.proximity = activity_instance.variant_definition.escortproximity;
    self.attractradi = activity_instance.variant_definition.var_31c07988f05debcf;
    self.ambushradius = activity_instance.variant_definition.ambushradius;
    self.ambushdist = activity_instance.variant_definition.ambushdistance;
    self.var_2f1c4d610c6efd62 = activity_instance.variant_definition.var_95befe60b7ccfec6;
    self.var_c70842e4e81f2852 = 1;
    self.var_fa004eae3663dc6c = 2;
    
    if ( getdvar( @"hash_a3cd7baf4609ce24", "-1" ) != "-1" )
    {
        self.health = getdvarint( @"hash_a3cd7baf4609ce24" );
    }
    
    if ( getdvar( @"hash_1138e73c40e1324a", "-1" ) != "-1" )
    {
        self.basespeed = getdvarfloat( @"hash_1138e73c40e1324a" );
    }
    
    self setcandamage( 1 );
    self function_65aa053c077c003a( 0 );
    self.attractor = add_attractor( self, 1, self.attractradi, 1, undefined, &function_1282eec91da30219 );
    function_24879cc9b7867fa9( self.attractor, 90 );
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1
// Checksum 0x0, Offset: 0x3315
// Size: 0x2ee
function escort_think( activity_instance )
{
    self endon( "death" );
    self endon( "reached_end_node" );
    n_proximity = squared( self.proximity );
    self.generateslots = 0;
    
    while ( true )
    {
        self.b_proximity = 0;
        self.n_players = 0;
        a_players = activity_instance.var_6c29f2fdb0054bbe;
        
        foreach ( player in a_players )
        {
            if ( isdefined( player ) && isdefined( self ) && distancesquared( self.origin, player.origin ) <= n_proximity )
            {
                self.b_proximity = 1;
                self.n_players++;
            }
        }
        
        n_players = self.n_players - 1;
        n_players = clamp( n_players, 0, 3 );
        var_578e9d1584d07d25 = n_players * self.speedincrease + 1;
        self.n_speed = self.basespeed * var_578e9d1584d07d25;
        self.n_speed = clamp( self.n_speed, 1, 12 );
        wait 0.5;
        
        if ( !self.b_proximity || istrue( self.var_1cb92917037d8996 ) || istrue( self.final_stop ) )
        {
            self vehicle_setspeedimmediate( 0, self.accel, self.decel );
            self function_65aa053c077c003a( 1 );
            waitframe();
            self pausepath( 0 );
            function_c3682430b317ca26();
            
            if ( !self.b_proximity && !self.var_1cb92917037d8996 && !self.final_stop )
            {
                self setscriptablepartstate( "chassis", "alert" );
                self setscriptablepartstate( "beacon_light", "alert" );
                self setscriptablepartstate( "headlight_left", "alert" );
                self setscriptablepartstate( "headlight_right", "alert" );
                self setscriptablepartstate( "brakes", "on" );
                self notify( "no_escorts" );
            }
        }
        else
        {
            self function_65aa053c077c003a( 0 );
            self resumepath();
            waitframe();
            function_315198e9ce4cd18c();
            self vehicle_setspeedimmediate( self.n_speed, self.accel, self.decel );
            self setscriptablepartstate( "beacon_light", "active" );
            self setscriptablepartstate( "headlight_left", "active" );
            self setscriptablepartstate( "headlight_right", "active" );
            self setscriptablepartstate( "brakes", "off" );
        }
        
        vehspeed = self vehicle_getspeed();
        
        if ( vehspeed <= self.var_fa004eae3663dc6c )
        {
            function_a52670a99736f59d();
            continue;
        }
        
        function_6e427a8504ec078c();
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x360b
// Size: 0xcb
function private function_1db9d507d5dd43da()
{
    self endon( "death" );
    turret_types = [ "sentry_turret", "remote_turret" ];
    self vehphys_enablecollisioncallback( 1 );
    
    while ( true )
    {
        self waittill( "collision", body0, body1, flag0, flag1, position, normal, normalspeed, ent, partenum );
        
        if ( isdefined( ent.turrettype ) && array_contains( turret_types, ent.turrettype ) )
        {
            ent notify( "kill_turret", 1 );
        }
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x36de
// Size: 0x108
function function_a52670a99736f59d()
{
    self endon( "death" );
    
    if ( self.generateslots == 0 )
    {
        return;
    }
    
    var_c38db2e51d5f66a2 = anglestoforward( self.angles );
    var_e560aa662258c25d = anglestoright( self.angles );
    var_40fc788beae80d60 = [];
    var_1f46821b0fd03c67 = function_fc784a7d07e0449a( 36, -90, var_c38db2e51d5f66a2, var_e560aa662258c25d );
    var_40fc788beae80d60 = function_6d6af8144a5131f1( var_40fc788beae80d60, var_1f46821b0fd03c67 );
    var_1f46821b0fd03c67 = function_fc784a7d07e0449a( 36, 90, var_c38db2e51d5f66a2, var_e560aa662258c25d );
    var_40fc788beae80d60 = function_6d6af8144a5131f1( var_40fc788beae80d60, var_1f46821b0fd03c67 );
    var_1f46821b0fd03c67 = function_fc784a7d07e0449a( -24, -90, var_c38db2e51d5f66a2, var_e560aa662258c25d );
    var_40fc788beae80d60 = function_6d6af8144a5131f1( var_40fc788beae80d60, var_1f46821b0fd03c67 );
    var_1f46821b0fd03c67 = function_fc784a7d07e0449a( -24, 90, var_c38db2e51d5f66a2, var_e560aa662258c25d );
    var_40fc788beae80d60 = function_6d6af8144a5131f1( var_40fc788beae80d60, var_1f46821b0fd03c67 );
    var_1f46821b0fd03c67 = function_fc784a7d07e0449a( -72, -90, var_c38db2e51d5f66a2, var_e560aa662258c25d );
    var_40fc788beae80d60 = function_6d6af8144a5131f1( var_40fc788beae80d60, var_1f46821b0fd03c67 );
    var_1f46821b0fd03c67 = function_fc784a7d07e0449a( -72, 90, var_c38db2e51d5f66a2, var_e560aa662258c25d );
    var_40fc788beae80d60 = function_6d6af8144a5131f1( var_40fc788beae80d60, var_1f46821b0fd03c67 );
    function_357609ca7ca5486e( self.attractor, var_40fc788beae80d60 );
    self.generateslots = 0;
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x37ee
// Size: 0x42
function function_6e427a8504ec078c()
{
    self endon( "death" );
    
    if ( self.generateslots == 1 )
    {
        return;
    }
    
    a_empty = [];
    function_357609ca7ca5486e( self.attractor, a_empty );
    self.generateslots = 1;
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 4
// Checksum 0x0, Offset: 0x3838
// Size: 0x52
function function_fc784a7d07e0449a( xoffset, yoffset, anglesforward, anglesright )
{
    var_1e0625e95bbc715c = spawnstruct();
    var_1e0625e95bbc715c.origin = self.origin + anglesforward * xoffset + anglesright * yoffset;
    return var_1e0625e95bbc715c;
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1
// Checksum 0x0, Offset: 0x3893
// Size: 0x40
function function_4e3e489bd31d3b7( activity_instance )
{
    activity_instance endon( "activity_ended" );
    activity_instance endon( "instance_destroyed" );
    self endon( "reached_end_node" );
    self endon( "death" );
    
    while ( true )
    {
        self waittill( "ambush" );
        thread function_908ef63da5570348( activity_instance );
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 2
// Checksum 0x0, Offset: 0x38db
// Size: 0xb8
function function_1282eec91da30219( attractor, zombie )
{
    if ( isdefined( zombie.var_941802a0997e0c42 ) )
    {
        return 0;
    }
    
    if ( isdefined( level.players ) )
    {
        player = getclosest( zombie.origin, level.players, 3500 );
        
        if ( isdefined( player ) && distance2dsquared( zombie.origin, player.origin ) < distance2dsquared( zombie.origin, attractor.source.origin ) )
        {
            return 0;
        }
    }
    
    if ( isalive( zombie ) && isdefined( attractor ) )
    {
        return 1;
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x399b
// Size: 0x144
function private function_5a233915821c0ea6( activity_instance )
{
    self.e_start endon( "escort_started" );
    activity_instance endon( "activity_ended" );
    activity_instance endon( "instance_destroyed" );
    
    while ( isdefined( self.e_start ) )
    {
        vehicle_forward = anglestoforward( self.angles );
        
        foreach ( player in activity_instance.var_6c29f2fdb0054bbe )
        {
            dot = vectordot( vehicle_forward, anglestoforward( player.angles ) );
            
            if ( dot >= 0.6 )
            {
                fov = cos( 20 );
                
                if ( player getcamerathirdperson() )
                {
                    fov = cos( 75 );
                }
                
                if ( within_fov( player geteye(), player.angles, self.e_start.origin, fov ) )
                {
                    self.e_start enableplayeruse( player );
                }
                
                continue;
            }
            
            self.e_start disableplayeruse( player );
        }
        
        wait 0.2;
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1
// Checksum 0x0, Offset: 0x3ae7
// Size: 0x4d
function escort_interact( player )
{
    if ( !isplayer( player ) )
    {
        return;
    }
    
    if ( istrue( player.inlaststand ) || !isalive( player ) )
    {
        return;
    }
    
    if ( player isreloading() || player isgestureplaying() )
    {
        return;
    }
    
    player thread function_86953a5b59ac4e80( self );
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1
// Checksum 0x0, Offset: 0x3b3c
// Size: 0xb5
function function_86953a5b59ac4e80( interact )
{
    self setstance( "stand" );
    self freezecontrols( 1 );
    time = self getgestureanimlength( "jup_ges_button_press_01" );
    self forceplaygestureviewmodel( "jup_ges_button_press_01" );
    vehicle = interact getlinkedparent();
    wait time * 0.275;
    
    if ( istrue( self.inlaststand ) || !isalive( self ) )
    {
        self freezecontrols( 0 );
        return;
    }
    
    vehicle setscriptablepartstate( "screen", "on" );
    vehicle setscriptablepartstate( "button", "pressed" );
    wait time * 0.25;
    self freezecontrols( 0 );
    interact notify( "escort_started" );
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x3bf9
// Size: 0x58
function escort_complete()
{
    self endon( "activity_ended" );
    self endon( "instance_destroyed" );
    self.vh_escort endon( "death" );
    self.vh_escort waittill( "rocket_launched" );
    remove_attractor( self.vh_escort.attractor );
    wait 5;
    function_a1bfca674edbfb4d( 1 );
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1
// Checksum 0x0, Offset: 0x3c59
// Size: 0x129
function function_908ef63da5570348( activity_instance )
{
    self endon( "death" );
    activity_instance endon( "activity_ended" );
    activity_instance endon( "instance_destroyed" );
    s_encounter = random( activity_instance.variant_definition.ambushencounters );
    a_s_pts = function_a9c50e82fb0f743a();
    assertex( isdefined( a_s_pts ), "<dev string:xfe>" );
    encounter_name = "ai_encounter:" + s_encounter.encounter;
    var_9e3cc96b3a2c2e2c = self.ambushradius;
    
    if ( isdefined( a_s_pts ) )
    {
        a_s_pts = array_randomize( a_s_pts );
        v_ground = a_s_pts[ 0 ].origin;
        request_id = activity_instance function_f8ccadcd850da124( encounter_name, v_ground, var_9e3cc96b3a2c2e2c, 1, 0, 1, 2 );
        
        /#
            function_d37068aac7785c04( request_id, activity_instance.routedifficulty, 1 );
        #/
        
        return;
    }
    
    v_ground = function_a6441613846cbe1b();
    
    if ( !isdefined( v_ground ) )
    {
        return;
    }
    
    request_id = activity_instance function_f8ccadcd850da124( encounter_name, v_ground, var_9e3cc96b3a2c2e2c, 1, 0, 1, 2 );
    
    /#
        function_d37068aac7785c04( request_id, activity_instance.routedifficulty, 1 );
    #/
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x3d8a
// Size: 0x7d
function function_a9c50e82fb0f743a()
{
    self endon( "death" );
    nd_current = self.currentnode;
    s_pt = undefined;
    assertex( isdefined( nd_current.target2 ), "<dev string:x139>" );
    
    if ( isdefined( nd_current.target2 ) )
    {
        a_s_pts = getstructarray( nd_current.target2, "targetname" );
    }
    else
    {
        return;
    }
    
    if ( isdefined( a_s_pts ) )
    {
        return a_s_pts;
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x3e0f
// Size: 0x40
function function_1cc9926013901dc5()
{
    centerpoint = undefined;
    
    if ( isdefined( self.vh_escort ) )
    {
        centerpoint = self.vh_escort.origin + ( 0, 0, 48 );
    }
    
    return centerpoint;
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x3e58
// Size: 0x35
function function_6c78c7079abcb33a()
{
    self.was_cancelled = 1;
    function_cb078cbf493f2b94();
    function_43f53f0a182c23e6( "hidden" );
    
    if ( isdefined( self.vh_escort ) )
    {
        thread function_dde0f987d9eb62a6();
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3e95
// Size: 0xa9
function private function_dde0f987d9eb62a6()
{
    vehicle = self.vh_escort;
    
    while ( isdefined( vehicle ) && !vehicle vehicle_isonground() )
    {
        /#
            iprintln( "<dev string:x179>" );
        #/
        
        wait 0.1;
    }
    
    if ( isdefined( vehicle.payload ) )
    {
        self.payload = vehicle.payload;
        v_payload = vehicle gettagorigin( "tag_attach_rocket" );
        thread function_7122f1d1f05e191c( v_payload, self.vh_escort.angles );
    }
    
    if ( !istrue( vehicle.was_killed ) )
    {
        thread function_5969f20c2a27e510( vehicle );
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3f46
// Size: 0x12c
function private function_cb078cbf493f2b94()
{
    if ( isdefined( self.damageent ) )
    {
        self.damageent delete();
    }
    
    if ( isdefined( self.vh_escort ) )
    {
        if ( isdefined( self.vh_escort.e_start ) )
        {
            self.vh_escort.e_start delete();
        }
        
        if ( isdefined( self.vh_escort.vo_ent ) )
        {
            self.vh_escort.vo_ent delete();
        }
        
        self.vh_escort function_444329a225699862();
        
        if ( isdefined( self.vh_escort.ent_crystal ) )
        {
            self.vh_escort.ent_crystal delete();
        }
        
        if ( isdefined( self.vh_escort.ent_beams ) )
        {
            self.vh_escort.ent_beams delete();
        }
        
        if ( isdefined( self.vh_escort.attractor ) )
        {
            remove_attractor( self.vh_escort.attractor );
        }
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x407a
// Size: 0x2
function function_65d47a407d91bf8f()
{
    
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4084
// Size: 0x89
function private function_5969f20c2a27e510( vehicle )
{
    if ( vehicle.health > 0 )
    {
        vehicle scripts\common\vehicle::godoff();
        vehicle setcandamage( 1 );
        zoneradii = namespace_8480efeffcd6e233::function_5bbdc39a533d9d57( self, "Awareness_Zone" );
        
        if ( zoneradii.size > 0 )
        {
            firstradius = zoneradii[ 0 ].radius;
            earthquake( 0.8, 1.3, vehicle.origin, firstradius * 2 );
        }
        
        vehicle scripts\cp_mp\vehicles\vehicle::function_9672da471530b44a();
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x4115
// Size: 0x128
function private function_7122f1d1f05e191c( v_payload, vehicle_angles )
{
    if ( istrue( self.debris_spawned ) )
    {
        return;
    }
    
    self.debris_spawned = 1;
    
    if ( !istrue( self.rocketlaunched ) )
    {
        if ( isdefined( self.payload ) )
        {
            self.payload delete();
        }
        
        if ( cointoss() )
        {
            v_nose = ( 0, 100, 10 );
            v_thruster = ( 0, -100, 10 );
        }
        else
        {
            v_nose = ( 0, -100, 10 );
            v_thruster = ( 0, 100, 10 );
        }
        
        var_f04e4b9c85234d0f = function_3ef2924f5cc4e9af( "veh_jup_zm_tank_escort_rocket_dst_debris", v_payload, v_nose, vehicle_angles );
        payload_husk = function_3ef2924f5cc4e9af( "veh_jup_zm_tank_escort_rocket_dst", v_payload, v_thruster, vehicle_angles );
        f_time = 30;
        wait f_time;
        var_f04e4b9c85234d0f delete();
        payload_husk delete();
        return;
    }
    
    f_time = 11;
    wait f_time;
    
    if ( isdefined( self.payload ) )
    {
        self.payload delete();
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x4245
// Size: 0x137
function private function_3ef2924f5cc4e9af( xmodel, v_payload, v_offset, vehicle_angles, v_force )
{
    if ( !isdefined( v_offset ) )
    {
        v_offset = ( 0, 0, 0 );
    }
    
    if ( !isdefined( v_force ) )
    {
        force_x = randomintrange( -6, 6 );
        force_y = randomintrange( -6, 6 );
        force_z = randomintrange( 8, 12 );
        v_force = ( force_x, force_y, force_z );
    }
    
    v_forward = anglestoforward( vehicle_angles );
    v_right = anglestoright( vehicle_angles );
    v_up = anglestoup( vehicle_angles );
    v_debris = v_payload + v_forward * v_offset[ 0 ] + v_right * v_offset[ 1 ] + v_up * v_offset[ 2 ];
    debris = spawn( "script_model", v_debris );
    debris setmodel( xmodel );
    debris.angles = ( randomfloatrange( 0, 360 ), randomfloatrange( 0, 360 ), randomfloatrange( 0, 360 ) );
    debris physicslaunchserver( debris.origin, v_force );
    return debris;
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x4385
// Size: 0x6a
function function_48e697a59457ec45()
{
    level._effect[ "escort_laser_ch" ] = loadfx( "vfx/jup/ob/gameplay/zm/vfx_escort_laser_ch.vfx" );
    level._effect[ "escort_laser_absorb" ] = loadfx( "vfx/jup/ob/gameplay/zm/vfx_escort_laser_absorb.vfx" );
    level._effect[ "escort_laser_sm" ] = loadfx( "vfx/jup/ob/gameplay/zm/vfx_escort_laser_sm.vfx" );
    level._effect[ "escort_laser_glow_energy_point" ] = loadfx( "vfx/jup/ob/gameplay/zm/vfx_escort_laser_glow_energy_point.vfx" );
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x43f7
// Size: 0xd3
function function_a6441613846cbe1b()
{
    self endon( "death" );
    nd_current = self.currentnode;
    v_ground = undefined;
    
    if ( isdefined( nd_current ) )
    {
        v_forward = vectornormalize( anglestoforward( nd_current.angles ) ) * self.ambushdist + nd_current.origin;
    }
    else
    {
        v_forward = vectornormalize( anglestoforward( self.angles ) ) * self.ambushdist + self.origin;
    }
    
    if ( isdefined( v_forward ) )
    {
        v_ground = utility::groundpos( v_forward );
    }
    
    if ( !isdefined( v_ground ) )
    {
        if ( isdefined( self.nextnode ) )
        {
            v_ground = self.nextnode.origin;
        }
        else
        {
            v_ground = self.origin;
        }
    }
    
    return v_ground;
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x44d3
// Size: 0x229
function function_97e82918ce08c384()
{
    self endon( "activity_ended" );
    self endon( "instance_destroyed" );
    self waittill( "vehicle_spawned" );
    waitframe();
    self.vh_escort.markerattach = spawn( "script_model", self.vh_escort.origin );
    self.vh_escort.markerattach.team = "neutral";
    self.vh_escort.markerattach linkto( self.vh_escort.e_start, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    
    if ( isdefined( level.var_7f1d1c7c6153a9bf ) && [[ level.var_7f1d1c7c6153a9bf ]]() )
    {
        self.activity_id = function_36a95c9de2ace25a( "ob_escort_marker_rift_run", 0, 1 );
    }
    else
    {
        self.activity_id = function_36a95c9de2ace25a( "ob_escort_marker", 0, 1 );
    }
    
    scripts\mp\objidpoolmanager::update_objective_onentity( self.activity_id, self.vh_escort.markerattach );
    scripts\mp\objidpoolmanager::objective_set_play_intro( self.activity_id, 0 );
    self.ping_index = self.var_6c29f2fdb0054bbe[ 0 ] scripts\cp_mp\calloutmarkerping::calloutmarkerping_createcallout( 11, self.vh_escort.markerattach.origin, self.activity_id );
    self.vh_escort.e_start thread scripts\cp_mp\calloutmarkerping::function_9a7200f5142066ba( self.var_6c29f2fdb0054bbe[ 0 ], self.ping_index, undefined, [ "escort_started" ] );
    self.vh_escort.e_start waittill( "escort_started" );
    self.vh_escort.markerattach unlink();
    self.vh_escort.markerattach linkto( self.vh_escort, "tag_attach_rocket", ( 0, 0, 110 ), ( 0, 0, 0 ) );
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x4704
// Size: 0xc5
function function_84129aa0676cd1ce()
{
    self endon( "activity_ended" );
    self endon( "instance_destroyed" );
    
    while ( true )
    {
        a_players = function_3a322911903bddb5( 1.25 );
        
        foreach ( player in level.players )
        {
            if ( isalive( player ) && isdefined( a_players ) && a_players.size && array_contains( a_players, player ) )
            {
                scripts\mp\objidpoolmanager::objective_playermask_addshowplayer( self.var_2ed04f1a09291250, player );
                continue;
            }
            
            scripts\mp\objidpoolmanager::objective_playermask_hidefrom( self.var_2ed04f1a09291250, player );
        }
        
        wait 0.1;
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x47d1
// Size: 0x2a
function function_c3682430b317ca26()
{
    if ( istrue( self.var_d91d989332dd1866 ) )
    {
        self.var_d91d989332dd1866 = 0;
        self setscriptablepartstate( "engine", "idle" );
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x4803
// Size: 0x32
function function_315198e9ce4cd18c()
{
    if ( !istrue( self.var_d91d989332dd1866 ) && isdefined( self ) )
    {
        self.var_d91d989332dd1866 = 1;
        self setscriptablepartstate( "engine", "active" );
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0
// Checksum 0x0, Offset: 0x483d
// Size: 0x2c
function function_937d984d2d97046()
{
    s_reward = undefined;
    s_reward = getstruct( self.varianttag + "_REWARD", "targetname" );
    return s_reward;
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4872
// Size: 0x3e
function private function_dac4378812650312( location )
{
    escort_difficulty = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10( location );
    
    if ( escort_difficulty == "difficulty_undefined" )
    {
        escort_difficulty = getdvar( @"hash_b1c2f60cf246f369", "difficulty_easy" );
    }
    
    return escort_difficulty;
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x48b9
// Size: 0x50
function private function_9c9e518280bea222( activity_instance )
{
    self endon( "death" );
    self endon( "reached_end_node" );
    
    while ( true )
    {
        wait 30;
        self waittill( "no_escorts" );
        
        if ( isdefined( self.vo_ent ) )
        {
            self.vo_ent playsoundonmovingent( "dx_ob_oesc_esca_acve_escnoescortsinrange" );
        }
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4911
// Size: 0x43
function private function_d0278222727e2658( activity_instance )
{
    self endon( "death" );
    self endon( "reached_end_node" );
    
    while ( true )
    {
        wait 30;
        self waittill( "start_moving" );
        self.vo_ent playsoundonmovingent( "dx_ob_oesc_esca_acve_escmovingout" );
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x495c
// Size: 0x30
function private function_46c5c5dc4eb70411()
{
    if ( cointoss() )
    {
        thread namespace_277c27ef297ef569::function_1281c7fff9456e18( "contract_escort_vortex_02_broadcast" );
        self.var_ab38de8a32717302 = 1;
        return;
    }
    
    self.var_ab38de8a32717302 = 0;
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4994
// Size: 0x18
function private function_aae497883f04b1c6()
{
    if ( cointoss() )
    {
        thread namespace_277c27ef297ef569::function_1281c7fff9456e18( "contract_escort_vortex_03_conv_broadcast" );
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1
// Checksum 0x0, Offset: 0x49b4
// Size: 0x31
function function_3a322911903bddb5( n_multi )
{
    a_players = namespace_8480efeffcd6e233::function_7ec62d1550b9897e( self, "Awareness_Zone", n_multi );
    
    if ( isdefined( a_players ) && a_players.size )
    {
        return a_players;
    }
}

// Namespace namespace_d197b40cdbf4a1ea / namespace_d38a1af3e02dea2f
// Params 1
// Checksum 0x0, Offset: 0x49ed
// Size: 0x6c
function function_88cf521697f00f27( n_index )
{
    switch ( n_index )
    {
        case 1:
            self.vh_escort.vo_ent playsoundonmovingent( "dx_ob_oesc_esca_acve_escacvhealth75" );
            break;
        case 2:
            thread namespace_277c27ef297ef569::function_1281c7fff9456e18( "contract_escort_acv_health_25_broadcast" );
            break;
        default:
            break;
    }
}

