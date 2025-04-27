#using scripts\common\utility;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\cp_mp\vehicles\vehicle_damage;
#using scripts\engine\utility;

#namespace vehicle_mines;

// Namespace vehicle_mines / scripts\cp_mp\vehicles\vehicle_mines
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18a
// Size: 0x72
function vehicle_mines_init()
{
    assertex( isdefined( level.vehicle ), "vehicle_mines_init() called before vehicle_init()." );
    leveldata = spawnstruct();
    leveldata.minedata = [];
    level.vehicle.minetriggerdata = leveldata;
    
    if ( issharedfuncdefined( "vehicle_mines", "init" ) )
    {
        [[ getsharedfunc( "vehicle_mines", "init" ) ]]();
    }
}

// Namespace vehicle_mines / scripts\cp_mp\vehicles\vehicle_mines
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x204
// Size: 0x37
function vehicle_mines_getleveldata()
{
    assertex( isdefined( level.vehicle.minetriggerdata ), "vehicle_mines_getLevelData() called before vehicle_mines_init()." );
    return level.vehicle.minetriggerdata;
}

// Namespace vehicle_mines / scripts\cp_mp\vehicles\vehicle_mines
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x244
// Size: 0xcf
function vehicle_mines_getleveldataforvehicle( vehicleref, create )
{
    leveldataforvehicle = scripts\cp_mp\vehicles\vehicle_damage::vehicle_damage_getleveldataforvehicle( vehicleref, create );
    
    if ( ( !isdefined( leveldataforvehicle ) || !isdefined( leveldataforvehicle.frontextents ) ) && istrue( create ) )
    {
        if ( !isdefined( leveldataforvehicle ) )
        {
            leveldataforvehicle = spawnstruct();
        }
        
        leveldataforvehicle.frontextents = 90;
        leveldataforvehicle.backextents = 115;
        leveldataforvehicle.leftextents = 38;
        leveldataforvehicle.rightextents = 38;
        leveldataforvehicle.bottomextents = 20;
        leveldataforvehicle.distancetobottom = 35;
        leveldataforvehicle.loscheckoffset = ( 0, 0, 37 );
        scripts\cp_mp\vehicles\vehicle::function_29b4292c92443328( vehicleref ).damage = leveldataforvehicle;
    }
    
    return leveldataforvehicle;
}

// Namespace vehicle_mines / scripts\cp_mp\vehicles\vehicle_mines
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x31c
// Size: 0x78
function vehicle_mines_getleveldataformine( equipref, create )
{
    leveldata = vehicle_mines_getleveldata();
    leveldataformine = leveldata.minedata[ equipref ];
    
    if ( !isdefined( leveldataformine ) && istrue( create ) )
    {
        leveldataformine = spawnstruct();
        leveldataformine.radius = 10;
        leveldataformine.triggercallback = undefined;
        leveldata.minedata[ equipref ] = leveldataformine;
    }
    
    return leveldataformine;
}

// Namespace vehicle_mines / scripts\cp_mp\vehicles\vehicle_mines
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x39d
// Size: 0x374, Type: bool
function vehicle_mines_shouldvehicletriggermine( vehicle, mine )
{
    if ( !vehicle scripts\cp_mp\vehicles\vehicle::isvehicle() )
    {
        return false;
    }
    
    leveldataforvehicle = vehicle_mines_getleveldataforvehicle( vehicle.vehiclename );
    
    if ( !isdefined( leveldataforvehicle ) )
    {
        return false;
    }
    
    leveldataformine = vehicle_mines_getleveldataformine( mine.equipmentref );
    
    if ( !isdefined( leveldataformine ) )
    {
        return false;
    }
    
    if ( istrue( mine.exploding ) )
    {
        return false;
    }
    
    if ( lengthsquared( vehicle vehicle_getvelocity() ) < 100 )
    {
        if ( lengthsquared( vehicle vehicle_getangularvelocity() ) < 400 )
        {
            return false;
        }
    }
    
    if ( vehicle scripts\cp_mp\vehicles\vehicle::isvehicledestroyed() )
    {
        return false;
    }
    
    if ( istrue( vehicle.var_547a08a57461960d ) )
    {
        return false;
    }
    
    frontoffsetvec = anglestoforward( vehicle.angles ) * leveldataforvehicle.frontextents;
    backoffsetvec = anglestoforward( vehicle.angles ) * -1 * leveldataforvehicle.frontextents;
    leftoffsetvec = anglestoright( vehicle.angles ) * -1 * leveldataforvehicle.leftextents;
    rightoffsetvec = anglestoright( vehicle.angles ) * leveldataforvehicle.rightextents;
    vehicleorigin = vehicle.origin + leveldataforvehicle.loscheckoffset;
    frontleft = vehicleorigin + frontoffsetvec + leftoffsetvec;
    frontright = vehicleorigin + frontoffsetvec + rightoffsetvec;
    backleft = vehicleorigin + backoffsetvec + leftoffsetvec;
    backright = vehicleorigin + backoffsetvec + rightoffsetvec;
    var_6bd8d3846ab52bf3 = ( frontright - frontleft ) * ( 1, 1, 0 );
    var_29c1906132100543 = ( frontleft - backleft ) * ( 1, 1, 0 );
    between = frontleft - mine.origin;
    betweendot = vectordot( vectornormalize( vehicle_mines_getnormal2d( var_6bd8d3846ab52bf3 ) ), between );
    
    if ( betweendot > leveldataformine.radius )
    {
        return false;
    }
    
    betweendot = vectordot( vectornormalize( vehicle_mines_getnormal2d( var_29c1906132100543 ) ), between );
    
    if ( betweendot > leveldataformine.radius )
    {
        return false;
    }
    
    var_15701247fdeed7f1 = ( backleft - backright ) * ( 1, 1, 0 );
    var_430a35006e71a02c = ( backright - frontright ) * ( 1, 1, 0 );
    between = backright - mine.origin;
    betweendot = vectordot( vectornormalize( vehicle_mines_getnormal2d( var_15701247fdeed7f1 ) ), between );
    
    if ( betweendot > leveldataformine.radius )
    {
        return false;
    }
    
    betweendot = vectordot( vectornormalize( vehicle_mines_getnormal2d( var_430a35006e71a02c ) ), between );
    
    if ( betweendot > leveldataformine.radius )
    {
        return false;
    }
    
    between = vehicleorigin + anglestoup( vehicle.angles ) * leveldataforvehicle.bottomextents - mine.origin;
    betweendot = vectordot( between, anglestoup( vehicle.angles ) );
    
    if ( betweendot > leveldataforvehicle.distancetobottom )
    {
        return false;
    }
    else if ( betweendot < 0 )
    {
        return false;
    }
    
    return true;
}

// Namespace vehicle_mines / scripts\cp_mp\vehicles\vehicle_mines
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x71a
// Size: 0xb4
function vehicle_mines_minetrigger( vehicle, mine )
{
    leveldataformine = vehicle_mines_getleveldataformine( mine.equipmentref );
    
    if ( isdefined( leveldataformine.triggercallback ) )
    {
        thread [[ leveldataformine.triggercallback ]]( vehicle, mine );
    }
    
    leveldataforvehicle = vehicle_mines_getleveldataforvehicle( vehicle.vehiclename );
    
    if ( isdefined( leveldataforvehicle.triggercallback ) )
    {
        thread [[ leveldataforvehicle.triggercallback ]]( vehicle, mine );
    }
    
    if ( issharedfuncdefined( "vehicle_mines", "trigger" ) )
    {
        thread [[ getsharedfunc( "vehicle_mines", "trigger" ) ]]( vehicle, mine );
    }
}

// Namespace vehicle_mines / scripts\cp_mp\vehicles\vehicle_mines
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7d6
// Size: 0x11d
function vehicle_mines_isfriendlytomine( mine )
{
    friendlytomine = 0;
    
    if ( level.teambased )
    {
        mineteam = mine.team;
        
        if ( !isdefined( mineteam ) )
        {
            if ( isdefined( mine.owner ) )
            {
                mineteam = mine.owner.team;
            }
        }
        
        if ( isdefined( mineteam ) )
        {
            friendlytomine = scripts\cp_mp\vehicles\vehicle::vehicle_isfriendlytoteam( self, mineteam );
        }
    }
    else if ( isdefined( mine.owner ) )
    {
        friendlytomine = scripts\cp_mp\vehicles\vehicle::vehicle_isfriendlytoplayer( self, mine.owner );
    }
    
    if ( !istrue( friendlytomine ) )
    {
        if ( isdefined( self.owner ) )
        {
            if ( level.teambased )
            {
                if ( isdefined( mine.team ) && self.owner.team == mine.team )
                {
                    friendlytomine = 1;
                }
            }
            else if ( isdefined( mine.owner ) && self.owner == mine.owner )
            {
                friendlytomine = 1;
            }
        }
    }
    
    return friendlytomine;
}

// Namespace vehicle_mines / scripts\cp_mp\vehicles\vehicle_mines
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8fc
// Size: 0x17
function vehicle_mines_getnormal2d( vector )
{
    return ( vector[ 1 ], vector[ 0 ] * -1, 0 );
}

// Namespace vehicle_mines / scripts\cp_mp\vehicles\vehicle_mines
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x91c
// Size: 0x35
function vehicle_mines_getloscheckcontents()
{
    return physics_createcontents( [ "physicscontents_water", "physicscontents_glass", "physicscontents_item", "physicscontents_vehicle", "physicscontents_ainosight" ] );
}

