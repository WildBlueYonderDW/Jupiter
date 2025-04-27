#using script_16ea1b94f0f381b3;
#using script_3e145703891d9d8d;
#using script_608c50392df8c7d1;
#using scripts\common\ae_utility;
#using scripts\common\callbacks;
#using scripts\common\elevators;
#using scripts\cp_mp\challenges;
#using scripts\cp_mp\emp_debuff;
#using scripts\cp_mp\ent_manager;
#using scripts\cp_mp\entityheadicons;
#using scripts\cp_mp\equipment;
#using scripts\cp_mp\equipment\haywire;
#using scripts\cp_mp\utility\player_utility;
#using scripts\engine\utility;

#namespace tracker_mine;

// Namespace tracker_mine / scripts\cp_mp\equipment\tracker_mine
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x4e5
// Size: 0x2e
function autoexec main()
{
    registersharedfunc( "equip_tracker_mine", "tracker_mine_used", &tracker_mine_used );
    registersharedfunc( "equip_tracker_mine", "tracker_mine_onOwnerChanged", &tracker_mine_onownerchanged );
}

// Namespace tracker_mine / scripts\cp_mp\equipment\tracker_mine
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x51b
// Size: 0x142
function tracker_mine_used( grenade )
{
    grenade scripts\cp_mp\ent_manager::registerspawn( 1, &function_94d121fb31a78605 );
    grenade function_63d1a11f8b22244( undefined, &function_9fb09350ae81bbf5, &function_2f7f87f09716e22e );
    thread function_f3bb4f4911a1beb2( "weapons", "monitorDisownedGrenade", self, grenade );
    result = grenade waittill_any_timeout_1( 20, "missile_stuck" );
    
    if ( result == "timeout" )
    {
        grenade delete();
        return;
    }
    
    if ( !function_ab670147f0d58a96( grenade ) )
    {
        return;
    }
    
    grenade setotherent( self );
    grenade setscriptablepartstate( "plant", "active", 0 );
    
    if ( issharedfuncdefined( "weapons", "onEquipmentPlanted" ) )
    {
        self [[ getsharedfunc( "weapons", "onEquipmentPlanted" ) ]]( grenade, "equip_tracker_mine", &function_2f7f87f09716e22e );
    }
    
    grenade thread function_f3bb4f4911a1beb2( "damage", "monitorDamage", grenade.bundle.maxhealth, "hitequip", &function_66a7440055d386c3, &function_7bdb3610d602438d, 0 );
    grenade.headiconid = grenade scripts\cp_mp\entityheadicons::setheadicon_factionimage( 0, 2, undefined, undefined, undefined, undefined, 1 );
    grenade function_21c1cf07d4287694();
    grenade function_8bdd230c4ff3a6cb();
    grenade thread function_f3bb4f4911a1beb2( "equipment", "makeExplosiveUsableTag", "tag_use", 1 );
}

// Namespace tracker_mine / scripts\cp_mp\equipment\tracker_mine
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x665
// Size: 0x129
function function_21c1cf07d4287694()
{
    triggerradius = getdvarfloat( @"hash_6c6e9afbbd83b8e1", self.bundle.var_38d31b4d3338a6e5 );
    var_fe8bddc6b3dcd02e = getdvarfloat( @"hash_7c715104d4c403f1", 25 );
    var_bac00540e0a9b221 = self.origin + anglestoup( self.angles ) * var_fe8bddc6b3dcd02e;
    triggerheight = getdvarfloat( @"hash_14e86cafccb72dbc", self.bundle.var_2144f074b125a5e8 );
    trigger = spawn( "trigger_rotatable_radius", var_bac00540e0a9b221, 0, triggerradius, triggerheight );
    trigger.angles = self.angles;
    self.trigger = trigger;
    trigger enablelinkto();
    trigger linkto( self );
    
    /#
        if ( getdvarint( @"hash_a0a1d37a6767ddb7", 0 ) > 0 )
        {
            endpos = var_bac00540e0a9b221 + anglestoup( self.angles ) * triggerheight;
            thread function_f9310df4c660fa53( triggerradius, var_bac00540e0a9b221, endpos, ( 0, 1, 0 ) );
        }
    #/
}

// Namespace tracker_mine / scripts\cp_mp\equipment\tracker_mine
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x796
// Size: 0x1b
function function_8bdd230c4ff3a6cb()
{
    self setscriptablepartstate( "arm", "active" );
    thread function_c7ab3c1622f5161();
}

// Namespace tracker_mine / scripts\cp_mp\equipment\tracker_mine
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7b9
// Size: 0x23c
function function_c7ab3c1622f5161()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "destroying" );
    self endon( "tracker_mine_disable" );
    var_fe8bddc6b3dcd02e = getdvarfloat( @"hash_7c715104d4c403f1", 25 );
    var_2dc0a299142b3d64 = self.origin + anglestoup( self.angles ) * var_fe8bddc6b3dcd02e;
    explosionradius = getdvarfloat( @"hash_2923d4daaf714540", self.bundle.var_9d68744a73e763e2 );
    var_b57d053d714f885f = getdvarfloat( @"hash_556b61004a4f8e1", self.bundle.var_8b5ba07abdc4bfbf );
    var_768afb5beab96ec5 = var_2dc0a299142b3d64 + anglestoup( self.angles ) * var_b57d053d714f885f;
    
    /#
        if ( getdvarint( @"hash_16fe65017617df1c", 0 ) > 0 )
        {
            thread function_f9310df4c660fa53( explosionradius, var_2dc0a299142b3d64, var_768afb5beab96ec5, ( 0, 0, 1 ) );
        }
    #/
    
    while ( true )
    {
        self.trigger waittill( "trigger", triggeredent );
        
        if ( function_a3f22e9cffa1ee57( triggeredent, var_2dc0a299142b3d64 ) )
        {
            if ( isdefined( level.delayminetime ) && istrue( triggeredent function_f3bb4f4911a1beb2( "perk", "hasPerk", "specialty_delaymine" ) ) )
            {
                wait level.delayminetime;
            }
            
            self setscriptablepartstate( "trigger", "triggered" );
            playercontents = physics_createcontents( [ "physicscontents_characterproxy" ] );
            var_545bb1480dd26598 = physics_spherecast( var_2dc0a299142b3d64, var_768afb5beab96ec5, explosionradius, playercontents, undefined, "physicsquery_all" );
            
            foreach ( hit in var_545bb1480dd26598 )
            {
                hitentity = hit[ "entity" ];
                
                if ( function_a3f22e9cffa1ee57( hitentity, var_2dc0a299142b3d64 ) )
                {
                    thread function_8613a680f1ec0b46( hitentity, self.owner, self.bundle, var_2dc0a299142b3d64 );
                    thread function_c8350e9ea22ae8e9( hitentity );
                }
            }
            
            function_94d121fb31a78605();
            break;
        }
    }
}

// Namespace tracker_mine / scripts\cp_mp\equipment\tracker_mine
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9fd
// Size: 0x59, Type: bool
function function_a3f22e9cffa1ee57( targetent, startpos )
{
    return ( isplayer( targetent ) || isai( targetent ) ) && self.owner isenemy( targetent ) && targetent function_c1d424f2639c370e( startpos ) && !istrue( function_f3bb4f4911a1beb2( "player", "isInLastStand", targetent ) );
}

/#

    // Namespace tracker_mine / scripts\cp_mp\equipment\tracker_mine
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0xa5f
    // Size: 0x4e, Type: dev
    function function_f9310df4c660fa53( radius, startpos, endpos, color )
    {
        level endon( "<dev string:x1c>" );
        self endon( "<dev string:x2a>" );
        self endon( "<dev string:x33>" );
        
        while ( true )
        {
            cylinder( startpos, endpos, radius, color );
            waitframe();
        }
    }

#/

// Namespace tracker_mine / scripts\cp_mp\equipment\tracker_mine
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xab5
// Size: 0x98
function function_c8350e9ea22ae8e9( victim )
{
    level endon( "game_ended" );
    victim waittill( "tracker_projectile_result", result );
    
    if ( istrue( result ) && isplayer( victim ) && istrue( function_f3bb4f4911a1beb2( "player", "isReallyAlive", victim ) ) )
    {
        scripts\cp_mp\challenges::function_b0f754c8a379154e( "equip_tracker_mine", self.owner, undefined, function_e2ff8f4b4e94f723( #"hash_83a2d67994d7e295", #"hit" ) );
        self.owner function_f3bb4f4911a1beb2( "equipment", "combatRecordTacticalStat", "equip_tracker_mine" );
    }
}

// Namespace tracker_mine / scripts\cp_mp\equipment\tracker_mine
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb55
// Size: 0x1b
function tracker_mine_disable()
{
    self notify( "tracker_mine_disable" );
    self setscriptablepartstate( "arm", "neutral" );
}

// Namespace tracker_mine / scripts\cp_mp\equipment\tracker_mine
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb78
// Size: 0xe
function function_94d121fb31a78605()
{
    callback( "on_functional_death" );
}

// Namespace tracker_mine / scripts\cp_mp\equipment\tracker_mine
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb8e
// Size: 0x2e
function function_9fb09350ae81bbf5( params )
{
    self notify( "destroying" );
    self setscriptablepartstate( "destroy", "active" );
    function_89439c68f99b17d5();
    wait 2;
}

// Namespace tracker_mine / scripts\cp_mp\equipment\tracker_mine
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbc5
// Size: 0x97
function function_2f7f87f09716e22e()
{
    if ( isdefined( self.trigger ) )
    {
        self.trigger delete();
    }
    
    function_89439c68f99b17d5();
    scripts\cp_mp\ent_manager::deregisterspawn();
    
    if ( isdefined( self.owner ) )
    {
        self.owner function_f3bb4f4911a1beb2( "weapons", "removeEquip", self );
    }
    
    if ( isdefined( self.dangerzone ) )
    {
        function_f3bb4f4911a1beb2( "spawn", "removeSpawnDangerZone", self.dangerzone );
    }
    
    if ( isdefined( self ) )
    {
        level.mines[ self getentitynumber() ] = undefined;
        self delete();
    }
}

// Namespace tracker_mine / scripts\cp_mp\equipment\tracker_mine
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc64
// Size: 0x29
function function_89439c68f99b17d5()
{
    if ( isdefined( self.headiconid ) )
    {
        scripts\cp_mp\entityheadicons::setheadicon_deleteicon( self.headiconid );
        self.headiconid = undefined;
    }
}

// Namespace tracker_mine / scripts\cp_mp\equipment\tracker_mine
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc95
// Size: 0x15c, Type: bool
function function_ab670147f0d58a96( grenade )
{
    if ( isdefined( level.var_ca4e08767cbdae12 ) )
    {
        canplant = grenade [[ level.var_ca4e08767cbdae12 ]]();
        
        if ( !canplant )
        {
            function_f3bb4f4911a1beb2( "hud", "showErrorMessage", "EQUIPMENT/PLANT_FAILED" );
            scripts\cp_mp\equipment::incrementequipmentslotammo( "secondary" );
            grenade delete();
            return false;
        }
    }
    
    grenade setnodeploy( 1 );
    grenade setnonstick( 1 );
    
    if ( !istrue( grenade.var_40e5b4307cb6229c ) )
    {
        grenade missileoutline();
    }
    
    grenade function_94c5d34d6f54f5fd();
    grenade function_84b0895c8cebc968();
    grenade set_apply_emp_callback( &function_21ca9d2c8fc54d2 );
    grenade set_clear_emp_callback( &function_523562e8b7ff6a39 );
    grenade function_f3bb4f4911a1beb2( "emp", "setEMP_Applied_Callback", &function_21ca9d2c8fc54d2 );
    grenade function_f3bb4f4911a1beb2( "emp", "setEMP_Cleared_Callback", &function_523562e8b7ff6a39 );
    grenade scripts\cp_mp\equipment\haywire::function_172d848d58051fdf( &function_c1b85fa145e2a6d3 );
    grenade scripts\common\elevators::function_49197cd063a740ea( &function_94d121fb31a78605 );
    
    if ( isdefined( level.elevators ) )
    {
        foreach ( elevators in level.elevators )
        {
            elevators thread scripts\common\elevators::isentitytouchingdoortrigger( grenade );
        }
    }
    
    return true;
}

// Namespace tracker_mine / scripts\cp_mp\equipment\tracker_mine
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdfa
// Size: 0x92
function function_84b0895c8cebc968()
{
    if ( istrue( level.dangerzoneskipequipment ) )
    {
        return;
    }
    
    if ( isdefined( self.dangerzone ) )
    {
        function_f3bb4f4911a1beb2( "spawn", "removeSpawnDangerZone", self.dangerzone );
    }
    
    if ( issharedfuncdefined( "spawn", "addSpawnDangerZone" ) )
    {
        self.dangerzone = function_f3bb4f4911a1beb2( "spawn", "addSpawnDangerZone", self.origin, 350, 70, self.owner.team, undefined, self.owner, 0, self, 1 );
    }
}

// Namespace tracker_mine / scripts\cp_mp\equipment\tracker_mine
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe94
// Size: 0x51
function function_94c5d34d6f54f5fd()
{
    if ( isdefined( self.sentientpool ) )
    {
        function_f3bb4f4911a1beb2( "game", "unregisterSentient", self.sentientpool, self.sentientpoolindex );
    }
    
    function_f3bb4f4911a1beb2( "game", "registerSentient", "Tactical_Static", self.owner );
}

// Namespace tracker_mine / scripts\cp_mp\equipment\tracker_mine
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeed
// Size: 0x44
function function_21ca9d2c8fc54d2( data )
{
    tracker_mine_disable();
    self setscriptablepartstate( "empd", "active" );
    data.attacker namespace_53fc9ddbb516e6e1::function_e800498086e36c29( "disabled_tracker_mine", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1 );
}

// Namespace tracker_mine / scripts\cp_mp\equipment\tracker_mine
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf39
// Size: 0x23
function function_523562e8b7ff6a39( data )
{
    function_8bdd230c4ff3a6cb();
    self setscriptablepartstate( "empd", "neutral" );
}

// Namespace tracker_mine / scripts\cp_mp\equipment\tracker_mine
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf64
// Size: 0x7f
function function_c1b85fa145e2a6d3( data )
{
    function_94d121fb31a78605();
    
    if ( issharedfuncdefined( "equipment", "giveScoreForEquipment" ) && isdefined( self.owner ) && isdefined( data.attacker ) && self.owner isenemy( data.attacker ) )
    {
        data.attacker function_f3bb4f4911a1beb2( "equipment", "giveScoreForEquipment", self, undefined );
    }
}

// Namespace tracker_mine / scripts\cp_mp\equipment\tracker_mine
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfeb
// Size: 0x61
function tracker_mine_onownerchanged( oldowner )
{
    self setscriptablepartstate( "hacked", "active" );
    function_84b0895c8cebc968();
    function_94c5d34d6f54f5fd();
    thread function_f3bb4f4911a1beb2( "equipment", "makeExplosiveUnusuableTag" );
    self.owner thread function_f3bb4f4911a1beb2( "weapons", "monitorDisownedGrenade", self.owner, self );
}

