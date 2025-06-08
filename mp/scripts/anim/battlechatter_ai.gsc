#using script_433d8f78f7e5fb;
#using scripts\anim\battlechatter;
#using scripts\anim\battlechatter_events;
#using scripts\asm\asm;
#using scripts\common\utility;
#using scripts\engine\utility;

#namespace battlechatter_ai;

// Namespace battlechatter_ai / scripts\anim\battlechatter_ai
// Params 0
// Checksum 0x0, Offset: 0x1db
// Size: 0x143
function addtosystem()
{
    if ( !isdefined( level.battlechatter ) )
    {
        return;
    }
    
    self endon( "death" );
    assert( isdefined( self.squad ) );
    
    if ( !isdefined( self.battlechatterallowed ) )
    {
        self.battlechatterallowed = 1;
    }
    
    self.battlechatter.friendlyfire_force = 1;
    
    if ( isplayer( self ) )
    {
        self.battlechatterallowed = 0;
        self.type = "human";
        return;
    }
    
    if ( self.unittype == "dog" || self.unittype == "juggernaut" || self.team == "neutral" )
    {
        self.battlechatterallowed = 0;
        return;
    }
    
    self.headknob = asm_getxanim( "knobs", asm_lookupanimfromalias( "knobs", "head" ) );
    self.scriptedtalkingknob = asm_getxanim( "knobs", asm_lookupanimfromalias( "knobs", "scripted_talking" ) );
    self.defaulttalk = asm_getxanim( "knobs", asm_lookupanimfromalias( "knobs", "default_talking" ) );
    setvoice();
    thread aithreadwaiter();
    self.chatinitialized = 1;
}

// Namespace battlechatter_ai / scripts\anim\battlechatter_ai
// Params 3
// Checksum 0x0, Offset: 0x326
// Size: 0x94
function setup_mp_hero( var_c6910a7018189965, var_4189af81d34b8804, var_10e927a072c477b )
{
    var_e530e91be23a6bc9 = tolower( default_to( var_c6910a7018189965, self.script_friendname ) );
    self.battlechatter.countryid = var_e530e91be23a6bc9;
    self.battlechatter.npcid = undefined;
    self.battlechatter.ishero = 1;
    anim.var_6d557183af1d1db5[ var_e530e91be23a6bc9 ] = var_4189af81d34b8804;
    anim.var_7f532a5dc6603698[ var_e530e91be23a6bc9 ] = var_10e927a072c477b;
}

/#

    // Namespace battlechatter_ai / scripts\anim\battlechatter_ai
    // Params 2
    // Checksum 0x0, Offset: 0x3c2
    // Size: 0x20, Type: dev
    function function_ffd2cfb5b8a113ac( text, duration )
    {
        thread function_c3cc4c3fb0ac344c( text, duration );
    }

    // Namespace battlechatter_ai / scripts\anim\battlechatter_ai
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x3ea
    // Size: 0x62, Type: dev
    function private function_c3cc4c3fb0ac344c( text, duration )
    {
        self endon( "<dev string:x1c>" );
        
        if ( !isdefined( self.var_446bf46cbf43cf30 ) )
        {
            return;
        }
        
        self.var_446bf46cbf43cf30[ self.var_446bf46cbf43cf30.size ] = text;
        
        if ( !isdefined( duration ) )
        {
            return;
        }
        
        wait duration;
        self.var_446bf46cbf43cf30 = function_57091b2d67654a14( self.var_446bf46cbf43cf30, text );
    }

    // Namespace battlechatter_ai / scripts\anim\battlechatter_ai
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x454
    // Size: 0xa7, Type: dev
    function private function_c911f04ca7e627e8()
    {
        self endon( "<dev string:x1c>" );
        self.var_446bf46cbf43cf30 = [];
        
        for ( ;; )
        {
            height = 30;
            
            foreach ( debugln in self.var_446bf46cbf43cf30 )
            {
                print3d( self gettagorigin( "<dev string:x25>" ) + ( 0, 0, height ), debugln, ( 1, 1, 1 ), 1, 0.5, 1, 1 );
                height += 10;
            }
            
            waitframe();
        }
    }

#/

// Namespace battlechatter_ai / scripts\anim\battlechatter_ai
// Params 0
// Checksum 0x0, Offset: 0x503
// Size: 0xc1
function clearvoice()
{
    if ( isdefined( self.battlechatter.npcid ) && isdefined( self.voice ) )
    {
        foreach ( usedid in anim.usedids[ self.voice ] )
        {
            if ( usedid.npcid == self.battlechatter.npcid )
            {
                usedid.count--;
                break;
            }
        }
    }
    
    self.battlechatter.npcid = undefined;
}

// Namespace battlechatter_ai / scripts\anim\battlechatter_ai
// Params 1
// Checksum 0x0, Offset: 0x5cc
// Size: 0x9a
function setvoice( voice )
{
    if ( isdefined( voice ) )
    {
        self.voice = voice;
    }
    
    if ( !isdefined( self.voice ) )
    {
        return;
    }
    
    if ( isdefined( self.battlechatter ) && isdefined( self.battlechatter.npcid ) )
    {
        clearvoice();
    }
    
    self.battlechatter.countryid = anim.countryids[ self.voice ];
    
    if ( !isdefined( self.battlechatter.countryid ) )
    {
        return;
    }
    
    assign_npcid();
}

// Namespace battlechatter_ai / scripts\anim\battlechatter_ai
// Params 0
// Checksum 0x0, Offset: 0x66e
// Size: 0x10
function function_da324cd732971e8c()
{
    clearvoice();
    assign_npcid();
}

// Namespace battlechatter_ai / scripts\anim\battlechatter_ai
// Params 1
// Checksum 0x0, Offset: 0x686
// Size: 0x185
function removefromsystem( squad )
{
    if ( !isdefined( level.battlechatter ) || !isdefined( self ) )
    {
        return;
    }
    
    if ( !isalive( self ) && isdefined( self.attacker ) && !is_equal( squad.team, self.attacker.team ) && squad.team != "neutral" )
    {
        self.attacker thread function_453b3867c6ec0ceb( self, self.attacker.team );
        thread function_f649c4ef3acdec1d( squad.team );
    }
    
    if ( isdefined( self.battlechatter ) && isdefined( self.battlechatter.npcid ) && isdefined( self.voice ) )
    {
        clearvoice();
        
        if ( isdefined( level.stealth ) && isdefined( level.var_621af16ef0684a11 ) )
        {
            thread function_bd6944098e09347f( squad.team, self.battlechatter.countryid, self.battlechatter.npcid, self.battlechatter.name );
        }
    }
    else if ( isdefined( self.var_4413114d1d17278b ) )
    {
        self.var_4413114d1d17278b notify( "death" );
        self.var_4413114d1d17278b delete();
    }
    
    self notify( "removed from battleChatter" );
}

// Namespace battlechatter_ai / scripts\anim\battlechatter_ai
// Params 4
// Checksum 0x0, Offset: 0x813
// Size: 0x195
function function_bd6944098e09347f( team, countryid, npcid, name )
{
    if ( istrue( level.var_ecafb96516684c19 ) )
    {
        return;
    }
    
    origin = self.origin;
    voice = self.voice;
    
    if ( !issp() )
    {
        function_3e6d99e336341602();
        return;
    }
    
    entnum = self getentitynumber();
    corpse = undefined;
    
    while ( !isdefined( corpse ) )
    {
        array = [[ level.var_621af16ef0684a11 ]]( level.var_798aa343368f724e );
        
        foreach ( corpseent in array )
        {
            if ( corpseent getentitynumber() == entnum )
            {
                corpse = corpseent;
            }
        }
        
        waitframe();
    }
    
    corpse.team = team;
    corpse.voice = voice;
    corpse.battlechatter = spawnstruct();
    corpse.battlechatter.countryid = countryid;
    corpse.battlechatter.npcid = npcid;
    corpse.battlechatter.name = name;
    corpse.battlechatterallowed = 1;
    
    if ( isdefined( level.stealth ) )
    {
        corpse thread corpseloop();
    }
}

// Namespace battlechatter_ai / scripts\anim\battlechatter_ai
// Params 0
// Checksum 0x0, Offset: 0x9b0
// Size: 0x2
function function_3e6d99e336341602()
{
    
}

// Namespace battlechatter_ai / scripts\anim\battlechatter_ai
// Params 0
// Checksum 0x0, Offset: 0x9ba
// Size: 0x2
function corpseloop()
{
    
}

// Namespace battlechatter_ai / scripts\anim\battlechatter_ai
// Params 0
// Checksum 0x0, Offset: 0x9c4
// Size: 0xe7
function setnpcid()
{
    assert( !isdefined( self.battlechatter.npcid ) );
    usedids = anim.usedids[ self.voice ];
    numids = usedids.size;
    startindex = randomint( numids );
    lowestid = startindex;
    
    for ( index = 0; index <= numids ; index++ )
    {
        if ( usedids[ ( startindex + index ) % numids ].count < usedids[ lowestid ].count )
        {
            lowestid = ( startindex + index ) % numids;
        }
    }
    
    anim.usedids[ self.voice ][ lowestid ].count++;
    self.battlechatter.npcid = usedids[ lowestid ].npcid;
}

// Namespace battlechatter_ai / scripts\anim\battlechatter_ai
// Params 1
// Checksum 0x0, Offset: 0xab3
// Size: 0x13
function evaluateattackevent( weapon )
{
    useevent( weapon );
}

// Namespace battlechatter_ai / scripts\anim\battlechatter_ai
// Params 0
// Checksum 0x0, Offset: 0xace
// Size: 0x47
function aithreadwaiter()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    self notify( "aiThreadWaiter" );
    self endon( "aiThreadWaiter" );
    childthread waittill_missile_fire();
    childthread waittill_grenade_fire();
    childthread function_ad344a5a58977b39();
    childthread waittill_move();
    childthread function_69110de99255d852();
}

// Namespace battlechatter_ai / scripts\anim\battlechatter_ai
// Params 0
// Checksum 0x0, Offset: 0xb1d
// Size: 0x4c
function waittill_missile_fire()
{
    while ( true )
    {
        self waittill( "missile_fire", missile, objweapon );
        var_fc3f189c0832aec2 = function_c666e714b2411844( objweapon );
        
        if ( isdefined( var_fc3f189c0832aec2 ) )
        {
            function_216c67ab6749137a( self, undefined, "use", var_fc3f189c0832aec2 );
        }
    }
}

// Namespace battlechatter_ai / scripts\anim\battlechatter_ai
// Params 0
// Checksum 0x0, Offset: 0xb71
// Size: 0x66
function waittill_grenade_fire()
{
    while ( true )
    {
        self waittill( "grenade_fire", grenade );
        
        if ( isdefined( grenade ) && isdefined( grenade.weapon_object ) )
        {
            var_fc3f189c0832aec2 = function_c666e714b2411844( grenade.weapon_object );
            
            if ( function_8f8de1d6f307f960( var_fc3f189c0832aec2 ) )
            {
                function_216c67ab6749137a( self, grenade, "grenade_danger", var_fc3f189c0832aec2 );
            }
        }
    }
}

// Namespace battlechatter_ai / scripts\anim\battlechatter_ai
// Params 0
// Checksum 0x0, Offset: 0xbdf
// Size: 0x1f
function function_ad344a5a58977b39()
{
    while ( true )
    {
        self waittill( "weapon_fired" );
        function_216c67ab6749137a( self, undefined, "attack" );
    }
}

// Namespace battlechatter_ai / scripts\anim\battlechatter_ai
// Params 0
// Checksum 0x0, Offset: 0xc06
// Size: 0x3d
function waittill_move()
{
    while ( true )
    {
        self waittill( "goal_changed" );
        
        if ( distance2dsquared( self.origin, self.goalpos ) > 10000 )
        {
            function_216c67ab6749137a( self, undefined, "move" );
        }
    }
}

// Namespace battlechatter_ai / scripts\anim\battlechatter_ai
// Params 0
// Checksum 0x0, Offset: 0xc4b
// Size: 0x37
function function_69110de99255d852()
{
    var_5fedaa69e3ddfd3 = 0;
    
    while ( true )
    {
        if ( var_5fedaa69e3ddfd3 != function_3f51c5f6398bff45() )
        {
            var_5fedaa69e3ddfd3 = !var_5fedaa69e3ddfd3;
            
            if ( var_5fedaa69e3ddfd3 )
            {
                function_216c67ab6749137a( self, undefined, "red_alert" );
            }
        }
        
        waitframe();
    }
}

// Namespace battlechatter_ai / scripts\anim\battlechatter_ai
// Params 0
// Checksum 0x0, Offset: 0xc8a
// Size: 0x2
function aivehiclekillwaiter()
{
    
}

// Namespace battlechatter_ai / scripts\anim\battlechatter_ai
// Params 6
// Checksum 0x0, Offset: 0xc94
// Size: 0x40
function custom_battlechatter_internal( phrase, sequence, priority, timeout, cooldown, endons )
{
    function_d54e84a9513b0e45( phrase, phrase, priority, timeout, cooldown, endons );
}

