#using script_4cdabcd91a92977;
#using scripts\common\ae_utility;
#using scripts\cp_mp\playerachievements;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\vehicles\vehicle_occupancy;
#using scripts\engine\utility;

#namespace namespace_bd89c4c41be78d43;

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28c
// Size: 0x12f
function main()
{
    if ( !getdvarint( @"hash_22eddf44003baf9", 0 ) )
    {
        return;
    }
    
    level.lobbyid = function_4f9373a1227db35c();
    level.var_73e946a3eadc84be = function_8345f2ac499e5ab();
    level.var_f60ab21fbeb423c = undefined;
    level.var_37767375d12e7150 = [];
    level.var_3da7cf812433fd50 = getdvarint( @"hash_35fe3b926d86a034", 1 );
    level.var_e20af527a1d336f6 = getdvarint( @"hash_d5ff0d8a153049ed", 1 );
    level.var_93535d58322394f6 = getdvarint( @"hash_52278a2e894c7b5b", 5 );
    level.var_41a1383064b06b78 = getdvarint( @"hash_730841e9076cb2d7", 1 ) == 1;
    level.var_a92efeef2c4f6e45 = getdvarint( @"hash_5d13c057b0e9cc7b", 0 ) == 1;
    level.var_8c4a1a7b619d8e7c = getdvarint( @"hash_ae52a11cd305ab26", 1 ) == 1;
    level.var_bcd757fb7c2137b1 = getdvarfloat( @"hash_522795feb86c7c2a", 1 );
    level.var_83b8cf86ae62e3da = undefined;
    
    if ( !isdefined( game[ "rejoinedPlayers" ] ) )
    {
        game[ "rejoinedPlayers" ] = [];
    }
    
    level thread function_860ade42d09bcc50();
    level thread function_990e6e94fef53e1a();
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c3
// Size: 0x24, Type: bool
function function_e3bd94413509bc25()
{
    return getdvarint( @"hash_925f7dceb8e6205e", 0 ) && getdvarint( @"hash_22eddf44003baf9", 0 );
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f0
// Size: 0x15
function function_8ce5b106fbba9e9f( callbackfn )
{
    level.var_f60ab21fbeb423c = callbackfn;
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x40d
// Size: 0x4b
function function_8fe6d6539ed31a88( callbackfn )
{
    if ( !getdvarint( @"hash_22eddf44003baf9", 0 ) )
    {
        return;
    }
    
    if ( !isdefined( level.var_37767375d12e7150 ) )
    {
        level.var_37767375d12e7150 = [];
    }
    
    level.var_37767375d12e7150[ level.var_37767375d12e7150.size ] = callbackfn;
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x460
// Size: 0x28
function function_ead10448a780a58( callbackfn )
{
    if ( !getdvarint( @"hash_22eddf44003baf9", 0 ) )
    {
        return;
    }
    
    level.var_83b8cf86ae62e3da = callbackfn;
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x490
// Size: 0x27
function function_884994e73914ee32( aeeventname )
{
    if ( isdefined( level.var_f60ab21fbeb423c ) )
    {
        return [[ level.var_f60ab21fbeb423c ]]( self, aeeventname );
    }
    
    return [];
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4c0
// Size: 0x28
function function_19f146e8ffa78ff9( disconnectreason )
{
    if ( isdefined( level.var_83b8cf86ae62e3da ) )
    {
        return [[ level.var_83b8cf86ae62e3da ]]( self, disconnectreason );
    }
    
    return 1;
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f1
// Size: 0x9c, Type: bool
function function_71fbbbf19edcef28()
{
    if ( istrue( level.var_e20af527a1d336f6 ) )
    {
        teammates = level.teamdata[ self.team ][ "alivePlayers" ];
        var_ffc368c1d2a95b7b = 0;
        
        foreach ( teammate in teammates )
        {
            if ( self == teammate )
            {
                continue;
            }
            
            var_ffc368c1d2a95b7b++;
        }
        
        if ( var_ffc368c1d2a95b7b > 0 )
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    
    return true;
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x596
// Size: 0xae, Type: bool
function function_c9b26cfb4d93ae50()
{
    if ( isdefined( level.var_93535d58322394f6 ) && level.var_93535d58322394f6 >= 1 )
    {
        teamsremaining = 0;
        
        foreach ( entry in level.teamnamelist )
        {
            alivecount = level.teamdata[ entry ][ "aliveCount" ];
            
            if ( alivecount > 0 )
            {
                teamsremaining++;
            }
            
            if ( teamsremaining >= level.var_93535d58322394f6 )
            {
                return true;
            }
        }
        
        return false;
    }
    
    return true;
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x64d
// Size: 0x125, Type: bool
function function_87fc9992c0b60276( var_c4f3e9732aa81389 )
{
    var_9642449afa2ebf37 = 0;
    
    switch ( var_c4f3e9732aa81389 )
    {
        case 0:
            var_9642449afa2ebf37 = 0;
            break;
        case 1:
        case 2:
            var_9642449afa2ebf37 = getdvarint( @"hash_1839b10b70a97d91", 0 );
            break;
        case 3:
            var_9642449afa2ebf37 = getdvarint( @"hash_f690f29f47f7a379", 0 );
            break;
        case 6:
            var_9642449afa2ebf37 = getdvarint( @"hash_b37dbaa903c45ccd", 1 );
            break;
        case 7:
            var_9642449afa2ebf37 = getdvarint( @"hash_bea9cf0dccf411ec", 0 );
            break;
        case 14:
            var_9642449afa2ebf37 = getdvarint( @"hash_8f3adc0694ded53c", 0 );
            break;
        default:
            var_9642449afa2ebf37 = 1;
            break;
    }
    
    if ( !var_9642449afa2ebf37 )
    {
        return false;
    }
    
    var_9642449afa2ebf37 = function_19f146e8ffa78ff9( var_c4f3e9732aa81389 );
    
    if ( !var_9642449afa2ebf37 )
    {
        return false;
    }
    
    var_9642449afa2ebf37 = function_c9b26cfb4d93ae50();
    
    if ( !var_9642449afa2ebf37 )
    {
        return false;
    }
    
    var_9642449afa2ebf37 = function_71fbbbf19edcef28();
    
    if ( !var_9642449afa2ebf37 )
    {
        return false;
    }
    
    return true;
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x77b
// Size: 0x301
function function_69359e69555329ac( disconnectreason )
{
    player = self;
    level endon( "game_ended" );
    player notify( "rejoin_analytics_start" );
    player endon( "rejoin_analytics_start" );
    isplayeronground = player isonground();
    isplayerinvehicle = player scripts\cp_mp\utility\player_utility::isinvehicle();
    isplayerinwater = player isswimming();
    var_15ad7f4a17476a54 = player ispcplayer();
    var_7d723d78c14b4a78 = player usinggamepad();
    playerorigin = player.origin;
    var_79544f8fc581743a = gettime();
    playerteam = player.team;
    var_3ee23976deb888b9 = player waittill_any_return_2( "successfully_disconnect_rejoin", "rejected_disconnect_rejoin" );
    
    if ( !isdefined( player ) )
    {
        return;
    }
    
    eventparams = [];
    eventparams[ eventparams.size ] = "is_rejoin_successful";
    isrejoinsuccessful = 0;
    
    if ( isdefined( var_3ee23976deb888b9 ) )
    {
        isrejoinsuccessful = ter_op( var_3ee23976deb888b9 == "successfully_disconnect_rejoin", 1, 0 );
    }
    
    eventparams[ eventparams.size ] = isrejoinsuccessful;
    eventparams[ eventparams.size ] = "rejoin_type";
    eventparams[ eventparams.size ] = disconnectreason;
    eventparams[ eventparams.size ] = "rejoin_duration";
    rejoinduration = -1;
    
    if ( isdefined( var_79544f8fc581743a ) )
    {
        rejoinduration = ( gettime() - var_79544f8fc581743a ) / 1000;
    }
    
    eventparams[ eventparams.size ] = rejoinduration;
    eventparams[ eventparams.size ] = "player_x";
    eventparams[ eventparams.size ] = playerorigin[ 0 ];
    eventparams[ eventparams.size ] = "player_y";
    eventparams[ eventparams.size ] = playerorigin[ 1 ];
    eventparams[ eventparams.size ] = "player_z";
    eventparams[ eventparams.size ] = playerorigin[ 2 ];
    eventparams[ eventparams.size ] = "squad_size";
    numteammates = -1;
    
    if ( isdefined( level.teamdata ) )
    {
        numteammates = int( level.teamdata[ playerteam ][ "players" ].size );
    }
    
    eventparams[ eventparams.size ] = numteammates;
    eventparams[ eventparams.size ] = "player_platform";
    eventparams[ eventparams.size ] = var_15ad7f4a17476a54;
    eventparams[ eventparams.size ] = "player_input";
    eventparams[ eventparams.size ] = var_7d723d78c14b4a78;
    eventparams[ eventparams.size ] = "match_alive_players_left";
    alivecounttotal = -1;
    
    if ( isdefined( level.teamnamelist ) && isdefined( level.teamdata ) )
    {
        foreach ( entry in level.teamnamelist )
        {
            alivecounttotal += level.teamdata[ entry ][ "aliveCount" ];
        }
        
        alivecounttotal++;
    }
    
    eventparams[ eventparams.size ] = alivecounttotal;
    eventparams[ eventparams.size ] = "is_player_swimming";
    eventparams[ eventparams.size ] = isplayerinwater;
    eventparams[ eventparams.size ] = "is_player_in_vehicle";
    eventparams[ eventparams.size ] = isplayerinvehicle;
    eventparams[ eventparams.size ] = "is_player_on_ground";
    eventparams[ eventparams.size ] = isplayeronground;
    player dlog_recordplayerevent( "dlog_event_br_disconnect_rejoin", eventparams );
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa84
// Size: 0x3d
function function_2e8537357f01a56b( var_1e904d14a41d4385, key )
{
    i = 0;
    
    while ( i < var_1e904d14a41d4385.size - 1 )
    {
        if ( var_1e904d14a41d4385[ i ] == key )
        {
            return i;
        }
        
        i += 2;
    }
    
    return undefined;
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xaca
// Size: 0x19a
function function_2fcdc8c12f068abb( array1, array2, var_e1e0e4a54c3d275c )
{
    combined = [];
    
    if ( !isarray( array1 ) || array1.size % 2 != 0 || !isarray( array2 ) || array2.size % 2 != 0 )
    {
        scripts\engine\utility::error( "called rejoin_utility::combineKVPArrays with invalid array" );
        return combined;
    }
    
    keys = [];
    values = [];
    i = 0;
    j = 0;
    
    while ( i < array1.size - 1 || j < array2.size - 1 )
    {
        if ( i < array1.size - 1 && !scripts\engine\utility::array_contains( keys, array1[ i ] ) )
        {
            keys[ keys.size ] = array1[ i ];
            values[ values.size ] = array1[ i + 1 ];
        }
        
        if ( j < array2.size - 1 && !scripts\engine\utility::array_contains( keys, array2[ j ] ) )
        {
            keys[ keys.size ] = array2[ j ];
            values[ values.size ] = array2[ j + 1 ];
        }
        
        i += 2;
        j += 2;
    }
    
    var_71eb150f91b3456b = scripts\engine\utility::ter_op( istrue( var_e1e0e4a54c3d275c ), array2, array1 );
    i = 0;
    
    while ( i < var_71eb150f91b3456b.size - 1 )
    {
        key = var_71eb150f91b3456b[ i ];
        var_2172db62590952ae = scripts\engine\utility::array_find( keys, key );
        
        if ( isdefined( var_2172db62590952ae ) )
        {
            values[ var_2172db62590952ae ] = var_71eb150f91b3456b[ i + 1 ];
        }
        
        i += 2;
    }
    
    for (i = 0; i < keys.size; i++) {
        combined[ combined.size ] = keys[ i ];
        combined[ combined.size ] = values[ i ];
    }
    
    return combined;
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc6d
// Size: 0x52
function function_dc60e20e9216b5b2()
{
    if ( !level.onlinegame )
    {
        println( "<dev string:x1c>" );
        return;
    }
    
    if ( !getdvarint( @"hash_22eddf44003baf9", 0 ) )
    {
        return;
    }
    
    var_ba664f53dea8a25c = getdvarint( @"hash_925f7dceb8e6205e", 0 );
    function_c5728699e6b79552( var_ba664f53dea8a25c );
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcc7
// Size: 0x2d
function function_4064a2271de12b97()
{
    if ( !getdvarint( @"hash_22eddf44003baf9", 0 ) )
    {
        return;
    }
    
    function_c5728699e6b79552( 0 );
    setdvar( @"hash_925f7dceb8e6205e", 0 );
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcfc
// Size: 0x79
function function_342af7ea8a120b16()
{
    if ( !level.onlinegame )
    {
        println( "<dev string:x55>" );
        return;
    }
    
    if ( !getdvarint( @"hash_22eddf44003baf9", 0 ) )
    {
        return;
    }
    
    var_ba664f53dea8a25c = getdvarint( @"hash_925f7dceb8e6205e", 0 );
    aeeventname = #"connection_update";
    
    if ( var_ba664f53dea8a25c )
    {
        function_74b707898164ed78( 0, aeeventname, [] );
        return;
    }
    
    function_e90d7800fb5eec03( 0, aeeventname, [] );
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd7d
// Size: 0x18a
function function_59121677f31f75a5()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    
    if ( !getdvarint( @"hash_22eddf44003baf9", 0 ) )
    {
        return;
    }
    
    xuid = self getxuid();
    
    if ( getdvarint( @"hash_7d06167bc4176e5e", 0 ) )
    {
        if ( isdefined( level.var_67a646dc2b984dac ) )
        {
            self thread [[ level.var_67a646dc2b984dac ]]();
        }
        
        if ( isdefined( level.var_62a7b43f2b60646d ) )
        {
            self [[ level.var_62a7b43f2b60646d ]]();
        }
    }
    
    if ( !array_contains( game[ "rejoinedPlayers" ], xuid ) )
    {
        println( "<dev string:x95>" + self.name + "<dev string:xbd>" + xuid + "<dev string:xc0>" );
        game[ "rejoinedPlayers" ] = array_add_safe( game[ "rejoinedPlayers" ], xuid );
    }
    else
    {
        println( "<dev string:xda>" + self.name + "<dev string:xbd>" + xuid + "<dev string:xfb>" );
    }
    
    self.var_632bad3edb4e449e = 0;
    self notify( "successfully_disconnect_rejoin" );
    self notify( "afk_tracking_resume" );
    self.var_cbece90c5beea82 = 0;
    
    if ( isdefined( level.var_2f60d02380cd603d ) )
    {
        self [[ level.var_2f60d02380cd603d ]]();
    }
    
    if ( isdefined( level.var_37767375d12e7150 ) )
    {
        foreach ( callback in level.var_37767375d12e7150 )
        {
            [[ callback ]]( self );
        }
    }
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf0f
// Size: 0x1b9
function function_8cf8ff669ac52156( disconnectreason, var_cf51d5a9282df88b )
{
    aeeventname = #"connection_update";
    additionalkvps = function_884994e73914ee32( aeeventname );
    var_ba664f53dea8a25c = getdvarint( @"hash_925f7dceb8e6205e", 0 );
    
    if ( getdvarint( @"hash_22eddf44003baf9", 0 ) != 0 && var_ba664f53dea8a25c )
    {
        var_c4f3e9732aa81389 = function_4f6df967144e2cb4( disconnectreason );
        
        if ( isdefined( var_cf51d5a9282df88b ) && var_cf51d5a9282df88b )
        {
            self.var_632bad3edb4e449e = 1;
        }
        
        var_38968ef355b4d2ec = 0;
        
        if ( var_c4f3e9732aa81389 != 0 )
        {
            var_38968ef355b4d2ec = function_87fc9992c0b60276( var_c4f3e9732aa81389 );
            
            if ( var_38968ef355b4d2ec )
            {
                xuid = self getxuid();
                
                if ( array_contains( game[ "rejoinedPlayers" ], xuid ) )
                {
                    var_c4f3e9732aa81389 = 5;
                    var_38968ef355b4d2ec = getdvarint( @"hash_42d413a1a32e906f", 0 );
                }
            }
        }
        
        if ( !istrue( var_cf51d5a9282df88b ) )
        {
            var_38968ef355b4d2ec = 0;
        }
        
        if ( var_38968ef355b4d2ec )
        {
            function_74b707898164ed78( var_c4f3e9732aa81389, aeeventname, additionalkvps );
            thread function_69359e69555329ac( var_c4f3e9732aa81389 );
            self.var_cbece90c5beea82 = 1;
            
            if ( istrue( level.var_41a1383064b06b78 ) )
            {
                wait level.var_bcd757fb7c2137b1;
                vehicle = self.vehicle;
                
                if ( isdefined( vehicle ) )
                {
                    driver = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getdriver( vehicle );
                    
                    if ( isdefined( driver ) && driver == self )
                    {
                        thread scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_exit( vehicle, undefined, self, undefined, 1 );
                    }
                }
            }
            
            if ( istrue( level.var_a92efeef2c4f6e45 ) )
            {
                wait level.var_bcd757fb7c2137b1;
                self suicide();
            }
        }
        else
        {
            function_e90d7800fb5eec03( var_c4f3e9732aa81389, aeeventname, additionalkvps );
            self notify( "rejected_disconnect_rejoin" );
        }
        
        return;
    }
    
    function_13399aa20634edce( aeeventname, additionalkvps );
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x10d0
// Size: 0xf7
function private function_860ade42d09bcc50()
{
    level endon( "game_ended" );
    
    while ( true )
    {
        waitdelayseconds = getdvarint( @"hash_cb027608b7396745", 30 );
        wait waitdelayseconds;
        var_a1e7045e3e4ca353 = [];
        
        foreach ( player in level.players )
        {
            if ( !isdefined( player ) )
            {
                continue;
            }
            
            if ( isdefined( player.var_632bad3edb4e449e ) && player.var_632bad3edb4e449e == 1 )
            {
                if ( isdefined( player.var_2ff6825157b156e ) && player.var_2ff6825157b156e == 1 )
                {
                    var_a1e7045e3e4ca353[ var_a1e7045e3e4ca353.size ] = player;
                }
            }
        }
        
        var_f0fa8d0645074b69 = getdvarint( @"hash_3c26c38af324c343", 7446 );
        function_10a17a516d1e84ed( var_a1e7045e3e4ca353, var_f0fa8d0645074b69 );
    }
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x11cf
// Size: 0x121
function private function_990e6e94fef53e1a()
{
    level endon( "game_ended" );
    
    while ( true )
    {
        waitdelayseconds = getdvarint( @"hash_e1b1c0bfb40859f", 1 );
        wait waitdelayseconds;
        
        foreach ( player in level.players )
        {
            if ( !isdefined( player ) )
            {
                continue;
            }
            
            if ( isdefined( player.var_97ca959a561f976e ) && player.var_97ca959a561f976e == 1 )
            {
                kick( player getentitynumber(), "EXE/PLAYERKICKED_REJOIN" );
                continue;
            }
            
            if ( isdefined( player.var_632bad3edb4e449e ) && player.var_632bad3edb4e449e == 1 )
            {
                if ( isdefined( player.var_2ff6825157b156e ) && player.var_2ff6825157b156e == 0 )
                {
                    /#
                        logstring( "<dev string:x12c>" + player getxuid() + "<dev string:x178>" );
                    #/
                    
                    kick( player getentitynumber(), "EXE/PLAYERKICKED_REJOIN" );
                }
            }
        }
    }
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x12f8
// Size: 0x150
function function_a1b2dc3090437789( achievementid, progressdata )
{
    var_f0fa8d0645074b69 = getdvarint( @"hash_3c26c38af324c343", 7446 );
    
    if ( achievementid == var_f0fa8d0645074b69 )
    {
        var_2a7a539b9d1d9972 = scripts\cp_mp\playerachievements::function_691880160b33d133( "sub_progress" );
        subprogress = 0;
        
        for (index = 0; index < progressdata.progress_values.size; index++) {
            progress_id = progressdata.progress_values[ index ].progress_id;
            
            if ( var_2a7a539b9d1d9972 == progress_id )
            {
                subprogress = progressdata.progress_values[ index ].progress;
                break;
            }
        }
        
        println( "<dev string:x19c>" + self.name + "<dev string:x1dd>" + achievementid + "<dev string:x1e7>" + subprogress );
        
        if ( subprogress == 10 )
        {
            /#
                logstring( "<dev string:x1f6>" + self getxuid() + "<dev string:x236>" );
            #/
            
            self.var_97ca959a561f976e = 1;
            return;
        }
        
        if ( subprogress == 11 )
        {
            /#
                logstring( "<dev string:x1f6>" + self getxuid() + "<dev string:x253>" );
            #/
            
            self.var_97ca959a561f976e = 1;
            self.var_5bf9e082ad798489 = 1;
        }
    }
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1450
// Size: 0xa4
function function_c5728699e6b79552( var_38968ef355b4d2ec )
{
    var_ba664f53dea8a25c = getdvarint( @"hash_925f7dceb8e6205e", 0 );
    aeeventname = #"connection_update";
    
    foreach ( player in level.players )
    {
        if ( var_ba664f53dea8a25c && var_38968ef355b4d2ec )
        {
            player function_74b707898164ed78( 0, aeeventname, [] );
            continue;
        }
        
        player function_e90d7800fb5eec03( 0, aeeventname, [] );
    }
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14fc
// Size: 0x4d
function function_fb67b62bbd718b34()
{
    now = getsystemtime() * 1000;
    rejoin_duration = getdvarint( @"hash_f4417cc21744fb67", 0 ) * 1000;
    var_1517a9cfb1f4de62 = scripts\engine\utility::ter_op( rejoin_duration == 0, 0, now + rejoin_duration );
    return var_1517a9cfb1f4de62;
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1552
// Size: 0x1f9
function function_74b707898164ed78( reason, aeeventname, additionalkvps )
{
    if ( !level.onlinegame )
    {
        println( "<dev string:x273>" );
        return;
    }
    
    if ( !getdvarint( @"hash_925f7dceb8e6205e", 0 ) )
    {
        println( "<dev string:x2b2>" + self.name + "<dev string:x2e5>" );
        return;
    }
    
    if ( !isdefined( reason ) )
    {
        println( "<dev string:x2b2>" + self.name + "<dev string:x301>" );
        return;
    }
    
    if ( !isint( reason ) )
    {
        println( "<dev string:x2b2>" + self.name + "<dev string:x31d>" );
        return;
    }
    
    self.var_2ff6825157b156e = 1;
    var_1517a9cfb1f4de62 = namespace_bf9ffd2b22c7d819::function_fb67b62bbd718b34();
    println( "<dev string:x337>" + self.name + "<dev string:x36b>" + reason + "<dev string:x376>" + level.var_73e946a3eadc84be + "<dev string:x383>" + level.lobbyid + "<dev string:x38f>" + var_1517a9cfb1f4de62 );
    var_bd15d7d46de8f2de = [ function_d6f771aedba70ce7( aeeventname, #"hash_b212dbb46f19de20" ), 1, function_d6f771aedba70ce7( aeeventname, #"disconnect_reason" ), reason, function_d6f771aedba70ce7( aeeventname, #"gametype" ), level.var_73e946a3eadc84be, function_d6f771aedba70ce7( aeeventname, #"hash_d8d873c978f56981" ), level.lobbyid, function_d6f771aedba70ce7( aeeventname, #"hash_ab984d923d5f2c96" ), var_1517a9cfb1f4de62, function_d6f771aedba70ce7( aeeventname, #"playlist_version" ), getplaylistversion() ];
    
    if ( isdefined( additionalkvps ) && additionalkvps.size > 0 )
    {
        var_bd15d7d46de8f2de = function_2fcdc8c12f068abb( var_bd15d7d46de8f2de, additionalkvps, 1 );
    }
    
    function_13399aa20634edce( aeeventname, var_bd15d7d46de8f2de );
    self function_10f8291e7ffed82c( 1 );
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1753
// Size: 0x199
function function_e90d7800fb5eec03( reason, aeeventname, additionalkvps )
{
    if ( !level.onlinegame )
    {
        println( "<dev string:x39f>" );
        return;
    }
    
    if ( !isdefined( reason ) )
    {
        println( "<dev string:x3d9>" + self.name + "<dev string:x301>" );
        return;
    }
    
    if ( !isint( reason ) )
    {
        println( "<dev string:x3d9>" + self.name + "<dev string:x31d>" );
        return;
    }
    
    println( "<dev string:x413>" + self.name + "<dev string:x36b>" + reason + "<dev string:x376>" + level.var_73e946a3eadc84be + "<dev string:x383>" + level.lobbyid + "<dev string:x44e>" );
    self.var_2ff6825157b156e = 0;
    var_bd15d7d46de8f2de = [ function_d6f771aedba70ce7( aeeventname, #"hash_b212dbb46f19de20" ), 0, function_d6f771aedba70ce7( aeeventname, #"disconnect_reason" ), reason, function_d6f771aedba70ce7( aeeventname, #"gametype" ), level.var_73e946a3eadc84be, function_d6f771aedba70ce7( aeeventname, #"hash_d8d873c978f56981" ), level.lobbyid, function_d6f771aedba70ce7( aeeventname, #"playlist_version" ), getplaylistversion() ];
    
    if ( isdefined( additionalkvps ) && additionalkvps.size > 0 )
    {
        var_bd15d7d46de8f2de = function_2fcdc8c12f068abb( var_bd15d7d46de8f2de, additionalkvps, 1 );
    }
    
    function_13399aa20634edce( aeeventname, var_bd15d7d46de8f2de );
    self function_10f8291e7ffed82c( 0 );
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18f4
// Size: 0x39
function function_13399aa20634edce( aeeventname, var_1e904d14a41d4385 )
{
    if ( !isdefined( var_1e904d14a41d4385 ) || !isdefined( var_1e904d14a41d4385.size ) || var_1e904d14a41d4385.size < 2 )
    {
        return;
    }
    
    self function_db073176839d77fb( function_6e2deb013c9ca85e( aeeventname ), var_1e904d14a41d4385 );
}

// Namespace namespace_bd89c4c41be78d43 / namespace_bf9ffd2b22c7d819
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1935
// Size: 0x95
function function_4f6df967144e2cb4( disconnectreason )
{
    if ( disconnectreason == %"EXE/PLAYERKICKED_TEAMKILLS" )
    {
        return 3;
    }
    else if ( disconnectreason == %"exe/disconnected" )
    {
        return 14;
    }
    else if ( disconnectreason == %"hash_7ca98f63b2722011" )
    {
        return 2;
    }
    else if ( disconnectreason == %"hash_7194ffe36169ca7" )
    {
        return 2;
    }
    else if ( disconnectreason == %"hash_5b309dc0bff1f44d" )
    {
        return 2;
    }
    else if ( disconnectreason == %"exe/timedout" )
    {
        return 6;
    }
    else if ( disconnectreason == %"EXE/PLAYERKICKED_INACTIVE" )
    {
        return 7;
    }
    
    return 0;
}

