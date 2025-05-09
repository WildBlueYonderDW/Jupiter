#using scripts\anim\animselector;
#using scripts\asm\asm;
#using scripts\asm\asm_bb;
#using scripts\asm\shared\utility;
#using scripts\common\ai;
#using scripts\common\utility;
#using scripts\engine\math;
#using scripts\engine\utility;

#namespace traverse;

// Namespace traverse / scripts\asm\traverse
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa2c
// Size: 0x363
function playtraversearrivalanim( asmname, statename, params )
{
    self endon( "death" );
    self endon( "terminate_ai_threads" );
    self endon( statename + "_finished" );
    traverseanim = asm_getanim( asmname, statename );
    assert( isdefined( traverseanim ) );
    traversexanim = asm_getxanim( statename, traverseanim );
    scripts\asm\asm_bb::bb_requeststance( "stand" );
    
    if ( self.var_32a34987ee1b3095 == "nodeless" || self.var_32a34987ee1b3095 == "linkless" )
    {
        if ( isdefined( self.var_64b933af90edc53c.traverse_height_delta ) )
        {
            self.var_64b933af90edc53c.traverse_height = self.var_64b933af90edc53c.origin[ 2 ] + self.var_64b933af90edc53c.traverse_height_delta;
        }
    }
    else
    {
        startnode = self getnegotiationstartnode();
        
        if ( !isdefined( startnode ) && isdefined( self.traversal_start_node ) )
        {
            startnode = self.traversal_start_node;
        }
        
        assert( isdefined( startnode ) );
        
        if ( isdefined( startnode.traverse_height_delta ) )
        {
            startnode.traverse_height = startnode.origin[ 2 ] + startnode.traverse_height_delta;
        }
        
        endnode = self getnegotiationendnode();
        
        if ( !isdefined( endnode ) && isdefined( self.traversal_end_node ) )
        {
            endnode = self.traversal_end_node;
        }
        
        /#
            if ( !isdefined( endnode ) )
            {
                println( "<dev string:x1c>" + startnode.origin );
            }
        #/
        
        self.traversestartnode = startnode;
        self.traverseendnode = endnode;
    }
    
    self animmode( "noclip" );
    self.traversestartz = self.origin[ 2 ];
    self orientmode( "face angle", self.angles[ 1 ] );
    asm_playfacialanim( asmname, statename, traversexanim );
    self.traversexanim = traversexanim;
    self.traverseanimroot = asm_getbodyknob();
    
    if ( isanimation( traverseanim ) )
    {
        assertex( self.var_e2b4fc394eef5c0f == "traverse_warp_external", "result of choose anim can only be an xanim in the case of a custom traverse" );
        assert( utility::issp() );
        self aisetanim( statename, 0 );
        self clearanim( asm_getinnerrootknob(), 0.2 );
        self setflaggedanim( statename, traverseanim );
    }
    else
    {
        self aisetanim( statename, traverseanim );
    }
    
    if ( self.var_32a34987ee1b3095 == "linkless" )
    {
        self starttraversearrival( 120, self.var_e2b4fc394eef5c0f, self.var_64b933af90edc53c.origin, self.var_64b933af90edc53c.endpos );
    }
    else if ( self.var_32a34987ee1b3095 == "nodeless" )
    {
        self starttraversearrival( 120, self.var_e2b4fc394eef5c0f );
    }
    else
    {
        self starttraversearrival( 120 );
    }
    
    self.traversedeathindex = 0;
    self.traversedeathanim = undefined;
    self.useanimgoalweight = 1;
    return_note = asm_donotetracks( asmname, statename, &handletraversearrivalwarpnotetracks );
    self animmode( "gravity" );
    
    if ( self.delayeddeath )
    {
        terminatetraverse( asmname, statename );
        return;
    }
}

// Namespace traverse / scripts\asm\traverse
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd97
// Size: 0x25
function function_e9cc41df0c7dfd7b( asmname, statename, params )
{
    playtraversearrivalanim( asmname, statename, params );
}

// Namespace traverse / scripts\asm\traverse
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xdc4
// Size: 0xa7
function function_eadd4123f9b2da38( asmname, statename, params )
{
    assert( isdefined( level.var_bb5f04e5a0a5c13 ) );
    assert( isdefined( self.traversal_start_node ) );
    assert( isdefined( self.traversal_start_node.animscript ) );
    assert( isdefined( level.var_bb5f04e5a0a5c13[ self.traversal_start_node.animscript ] ) );
    return [[ level.var_bb5f04e5a0a5c13[ self.traversal_start_node.animscript ] ]]( asmname, statename, params );
}

// Namespace traverse / scripts\asm\traverse
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe74
// Size: 0xacf
function playtraverseanim_scaled( asmname, statename, params )
{
    self endon( "death" );
    self endon( "terminate_ai_threads" );
    self endon( statename + "_finished" );
    checktraverse( statename );
    var_ddbf32a121351dd = 1;
    var_a1567247b6c748b3 = 0;
    
    if ( self.var_32a34987ee1b3095 == "not_set" )
    {
        var_ddbf32a121351dd = self setuptraversaltransitioncheck( 120 );
    }
    
    if ( var_ddbf32a121351dd )
    {
        if ( self.var_32a34987ee1b3095 == "linkless" )
        {
            startpos = self function_ad3c975cb94e4736();
            
            if ( !isdefined( startpos ) )
            {
                self starttraversearrival( 120, self.var_e2b4fc394eef5c0f, self.var_64b933af90edc53c.origin, self.var_64b933af90edc53c.endpos );
            }
            
            var_a1567247b6c748b3 = isdefined( self.var_64b933af90edc53c ) && istrue( self.var_64b933af90edc53c.var_e25867ac07f6cb19 );
        }
        else if ( self.var_32a34987ee1b3095 == "nodeless" )
        {
            startpos = self function_ad3c975cb94e4736();
            
            if ( !isdefined( startpos ) )
            {
                self starttraversearrival( 120, self.var_e2b4fc394eef5c0f );
            }
            
            var_a1567247b6c748b3 = isdefined( self.var_64b933af90edc53c ) && istrue( self.var_64b933af90edc53c.var_e25867ac07f6cb19 );
        }
        else if ( self.var_32a34987ee1b3095 == "node_based" )
        {
            startnode = self getnegotiationstartnode();
            
            if ( !isdefined( startnode ) )
            {
                self starttraversearrival( 120 );
                startnode = self getnegotiationstartnode();
                
                if ( !isdefined( startnode ) )
                {
                    startnode = self.traversal_start_node;
                }
            }
            
            endnode = self getnegotiationendnode();
            
            if ( !isdefined( endnode ) )
            {
                endnode = self.traversal_end_node;
            }
            
            /#
                if ( isdefined( startnode ) && !isdefined( endnode ) )
                {
                    println( "<dev string:x1c>" + startnode.origin );
                }
            #/
            
            self.traversestartnode = startnode;
            self.traverseendnode = endnode;
            var_a1567247b6c748b3 = isdefined( startnode ) && isdefined( endnode ) && isdefined( startnode.apex_delta );
        }
    }
    
    if ( !var_a1567247b6c748b3 )
    {
        terminatetraverse( asmname, statename );
        return;
    }
    
    if ( self.var_20a0e88052918576 )
    {
        if ( self.var_32a34987ee1b3095 == "nodeless" || self.var_32a34987ee1b3095 == "linkless" )
        {
            if ( length( self.var_a836173c912579bd - self.var_64b933af90edc53c.origin ) > 0.001 )
            {
                self.var_20a0e88052918576 = 0;
            }
        }
        else if ( self.var_32a34987ee1b3095 == "node_based" )
        {
            if ( self.var_691b939374451d39 != self.traversestartnode )
            {
                self.var_20a0e88052918576 = 0;
            }
        }
    }
    
    traverseanim = asm_getanim( asmname, statename );
    assert( isdefined( traverseanim ) );
    traversexanim = asm_getxanim( statename, traverseanim );
    scripts\asm\asm_bb::bb_requeststance( "stand" );
    
    if ( !isdefined( traverseanim ) || !isdefined( traversexanim ) || !animisleaf( traversexanim ) )
    {
        if ( isdefined( traversexanim ) )
        {
            assertmsg( "Invalid traverse anim: " + traversexanim + ".  Anim is not leaf" );
        }
        else
        {
            assertmsg( "Failed to find traversal anim in asm: " + asmname + " for state: " + statename );
        }
        
        endpos = undefined;
        
        if ( self.var_32a34987ee1b3095 == "nodeless" || self.var_32a34987ee1b3095 == "linkless" )
        {
            endpos = self.var_64b933af90edc53c.endpos;
        }
        else
        {
            endpos = self.traverseendnode.origin;
        }
        
        if ( isdefined( endpos ) )
        {
            self forceteleport( endpos, self.angles );
        }
        
        terminatetraverse( asmname, statename );
        return;
    }
    
    var_370a8c08be55a7a5 = getnotetracktimes( traversexanim, "code_move" );
    
    if ( var_370a8c08be55a7a5.size > 0 )
    {
        self.requestarrivalnotify = 1;
    }
    
    if ( self.var_32a34987ee1b3095 == "nodeless" || self.var_32a34987ee1b3095 == "linkless" )
    {
        if ( isdefined( self.var_64b933af90edc53c.traverse_height_delta ) )
        {
            self.var_64b933af90edc53c.traverse_height = self.var_64b933af90edc53c.origin[ 2 ] + self.var_64b933af90edc53c.traverse_height_delta;
        }
    }
    else if ( isdefined( self.traversestartnode.traverse_height_delta ) )
    {
        self.traversestartnode.traverse_height = self.traversestartnode.origin[ 2 ] + self.traversestartnode.traverse_height_delta;
    }
    
    self animmode( "noclip" );
    self.traversestartz = self.origin[ 2 ];
    
    if ( istrue( self.var_157e0150178595f2 ) )
    {
        if ( self.var_32a34987ee1b3095 == "nodeless" || self.var_32a34987ee1b3095 == "linkless" )
        {
            self orientmode( "face angle", self.var_64b933af90edc53c.angles[ 1 ] );
        }
        else
        {
            self orientmode( "face angle", self.traversestartnode.angles[ 1 ] );
        }
    }
    else
    {
        self orientmode( "face angle", self.angles[ 1 ] );
    }
    
    shouldusewarpnotetracks = shouldusewarpnotetracks( traversexanim );
    shouldusewarparrival = shouldusewarparrival( traversexanim );
    
    if ( shouldusewarpnotetracks )
    {
        notetrackhandle = &handletraversewarpnotetracks;
    }
    else
    {
        notetrackhandle = &handletraverselegacynotetracks;
        println( "<dev string:x5d>", traversexanim, "<dev string:x73>", statename, "<dev string:x7e>" );
        
        if ( self.var_32a34987ee1b3095 == "nodeless" || self.var_32a34987ee1b3095 == "linkless" )
        {
            self orientmode( "face angle", self.var_64b933af90edc53c.angles[ 1 ] );
        }
        else
        {
            self orientmode( "face angle", self.traversestartnode.angles[ 1 ] );
        }
        
        if ( !animhasnotetrack( traversexanim, "traverse_align" ) )
        {
            println( "<dev string:x5d>", traversexanim, "<dev string:x73>", statename, "<dev string:xbd>" );
            handletraversealignment();
        }
    }
    
    asm_playfacialanim( asmname, statename, traversexanim );
    self.traversexanim = traversexanim;
    self.traverseanimroot = asm_getbodyknob();
    
    if ( statename == "traverse_external" || statename == "traverse_warp_external" )
    {
        assert( utility::issp() );
        self aisetanim( statename, 0 );
        self clearanim( asm_getinnerrootknob(), 0.2 );
        self setflaggedanim( statename, self.traversexanim );
    }
    else
    {
        self aisetanim( statename, traverseanim, self.animplaybackratedefault, default_to( self.var_d74f2d1e6f517141, 0 ) );
    }
    
    if ( shouldusewarparrival && !isagent( self ) && ( !self.var_20a0e88052918576 || !istrue( self.var_c4ef68fe2a3931e5 ) ) )
    {
        assert( animhasnotetrack( traversexanim, "warp_arrival_end" ) );
        arrivalendtime = getnotetracktimes( traversexanim, "warp_arrival_end" )[ 0 ];
        self setanimtime( traversexanim, arrivalendtime );
    }
    
    self.traversedeathindex = 0;
    self.traversedeathanim = undefined;
    self.useanimgoalweight = 1;
    traversalattributes = spawnstruct();
    
    if ( self.var_32a34987ee1b3095 == "nodeless" || self.var_32a34987ee1b3095 == "linkless" )
    {
        traversalattributes.startpos = self.var_64b933af90edc53c.origin;
        traversalattributes.endpos = self.var_e341ef38b14d5cd3;
        traversalattributes.apex_delta = self.var_64b933af90edc53c.apex_delta;
        traversalattributes.angles = self.var_64b933af90edc53c.angles;
        traversalattributes.across_delta = self.var_64b933af90edc53c.across_delta;
    }
    else
    {
        assertex( isdefined( self.traversestartnode ) && isdefined( self.traversestartnode.apex_delta ), "Data for node-based traversal has not been calculated. This should have happened during traverseThink() or traverseProceduralThink()" );
        traversalattributes.startpos = self.traversestartnode.origin;
        traversalattributes.apex_delta = self.traversestartnode.apex_delta;
        traversalattributes.angles = self.traversestartnode.angles;
        
        if ( isdefined( self.traverseendnode ) )
        {
            traversalattributes.endpos = self.traverseendnode.origin;
        }
        else
        {
            assertmsg( "invalid end node for node based traversal starting at: " + traversalattributes.startpos );
            terminatetraverse( asmname, statename );
            return;
        }
        
        traversalattributes.across_delta = self.traversestartnode.across_delta;
    }
    
    self function_742e699e544869c2( traversalattributes.startpos, traversalattributes.endpos, traversalattributes.angles, traversalattributes.apex_delta, traversalattributes.across_delta );
    return_note = asm_donotetracks( asmname, statename, notetrackhandle, undefined, undefined, 0 );
    
    if ( return_note == "code_move" )
    {
        assertex( var_370a8c08be55a7a5.size > 0, "Animation requires code_move: " + function_3c8848a3a11b2553( getanimname( traversexanim ) ) );
        
        if ( isdefined( self.pathgoalpos ) )
        {
            self motionwarpcancel();
            self animmode( "normal" );
            self orientmode( "face motion" );
        }
        
        if ( !asm_eventfired( asmname, "finish" ) && !asm_eventfired( asmname, "end" ) )
        {
            asm_donotetracks( asmname, statename, notetrackhandle );
        }
    }
    
    self animmode( "gravity" );
    
    if ( self.delayeddeath )
    {
        terminatetraverse( asmname, statename );
        return;
    }
    
    self.a.nodeath = 0;
    self.a.movement = "run";
    self.traverseanimroot = undefined;
    self.traversexanim = undefined;
    clear_deathanim();
    terminatetraverse( asmname, statename );
}

// Namespace traverse / scripts\asm\traverse
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x194b
// Size: 0x74
function terminatetraverse( asmname, statename )
{
    self.useanimgoalweight = 0;
    self.var_20a0e88052918576 = 0;
    self.istraversing = 0;
    self.jump_over_position = undefined;
    self.traversal_start_node = undefined;
    self.traversestartnode = undefined;
    self.traverseendnode = undefined;
    asm_fireevent( asmname, "traverse_end" );
    self finishtraverse();
    self motionwarpcancel();
}

// Namespace traverse / scripts\asm\traverse
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19c7
// Size: 0xa8
function handletraversealignment()
{
    self animmode( "noclip" );
    var_256ca46d1effdd41 = undefined;
    
    if ( self.var_32a34987ee1b3095 == "nodeless" || self.var_32a34987ee1b3095 == "linkless" )
    {
        var_256ca46d1effdd41 = self.var_64b933af90edc53c.traverse_height;
    }
    else
    {
        var_256ca46d1effdd41 = self.traversestartnode.traverse_height;
    }
    
    if ( isdefined( self.traverseheight ) && isdefined( var_256ca46d1effdd41 ) )
    {
        currentheight = var_256ca46d1effdd41 - self.traversestartz;
        thread teleportthread( currentheight - self.traverseheight );
    }
}

// Namespace traverse / scripts\asm\traverse
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a77
// Size: 0x44
function handletraverselegacynotetracks( note )
{
    if ( note == "traverse_death" )
    {
        return handletraversedeathnotetrack();
    }
    
    if ( note == "traverse_align" )
    {
        return handletraversealignment();
    }
    
    if ( note == "traverse_drop" )
    {
        return handletraversedrop();
    }
}

// Namespace traverse / scripts\asm\traverse
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ac3
// Size: 0x31a
function handletraversedrop()
{
    self animmode( "noclip" );
    endnode = self.traverseendnode;
    
    if ( !isdefined( endnode ) )
    {
        endnode = spawnstruct();
        endnode.angles = self.traversestartnode.angles;
        endnode.origin = self getnegotiationendpos();
        assert( isdefined( endnode.origin ) );
    }
    
    endnotetracks = getnotetracktimes( self.traversexanim, "footstep_left_large" );
    
    if ( endnotetracks.size == 0 )
    {
        endnotetracks = getnotetracktimes( self.traversexanim, "footstep_right_large" );
    }
    
    var_47b4bdc915cff70d = 1;
    
    if ( endnotetracks.size > 0 )
    {
        var_47b4bdc915cff70d = endnotetracks[ 0 ];
    }
    
    animstartfrac = getnotetracktimes( self.traversexanim, "traverse_drop" )[ 0 ];
    animdelta = getmovedelta( self.traversexanim, animstartfrac, var_47b4bdc915cff70d );
    animdelta = rotatevector( animdelta, endnode.angles );
    var_2ed406669fbe4377 = 512;
    tracestart = ( self.origin[ 0 ] + animdelta[ 0 ], self.origin[ 1 ] + animdelta[ 1 ], self.origin[ 2 ] );
    targetpos = getgroundposition( tracestart, 10, var_2ed406669fbe4377, 12 );
    assertex( tracestart[ 2 ] - targetpos[ 2 ] < var_2ed406669fbe4377, "Unable to find ground pos within " + var_2ed406669fbe4377 + " of traverse end " + tracestart );
    var_49601ab0e39bf185 = 0.05;
    var_cc2baf1e6d41c416 = 30;
    zdelta = abs( targetpos[ 2 ] - self.origin[ 2 ] );
    
    if ( zdelta < var_49601ab0e39bf185 * abs( animdelta[ 2 ] ) || zdelta > var_cc2baf1e6d41c416 )
    {
        println( "<dev string:xde>" + self.traversestartnode.origin + "<dev string:x110>" );
        targetpos = ( targetpos[ 0 ], targetpos[ 1 ], endnode.origin[ 2 ] );
    }
    
    nextcorner = self getpointafternegotiation();
    targetangles = endnode.angles;
    
    if ( !isdefined( endnode.origin ) )
    {
        endnode.origin = self.traversestartnode.end_node_origin;
    }
    
    if ( isdefined( nextcorner ) )
    {
        targetyaw = vectortoyaw( nextcorner - endnode.origin );
        targetdist = clamp( angleclamp180( targetyaw - self.angles[ 1 ] ), -30, 30 );
        targetyaw = angleclamp180( self.angles[ 1 ] + targetdist );
        targetangles = ( 0, targetyaw, 0 );
    }
    
    motionwarpwithtimes( self.traversexanim, targetpos, targetangles, animstartfrac, var_47b4bdc915cff70d );
    thread finishtraversedrop( targetpos[ 2 ] );
}

// Namespace traverse / scripts\asm\traverse
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1de5
// Size: 0x46
function finishtraversedrop( finalz )
{
    self endon( "killanimscript" );
    self endon( "death" );
    finalz += 2;
    
    while ( true )
    {
        if ( self.origin[ 2 ] < finalz )
        {
            self motionwarpcancel();
            break;
        }
        
        waitframe();
    }
}

// Namespace traverse / scripts\asm\traverse
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e33
// Size: 0x6a
function teleportthread( verticaloffset )
{
    self endon( "killanimscript" );
    self notify( "endTeleportThread" );
    self endon( "endTeleportThread" );
    reps = 5;
    offset = ( 0, 0, verticaloffset / reps );
    
    for (i = 0; i < reps; i++) {
        self forceteleport( self.origin + offset );
        waitframe();
    }
}

// Namespace traverse / scripts\asm\traverse
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1ea5
// Size: 0xd8
function teleportthreadex( verticaloffset, delay, frames, animrate )
{
    self endon( "killanimscript" );
    self endon( "death" );
    self notify( "endTeleportThread" );
    self endon( "endTeleportThread" );
    
    if ( verticaloffset == 0 || frames <= 0 )
    {
        return;
    }
    
    if ( delay > 0 )
    {
        wait delay;
    }
    
    offset = ( 0, 0, verticaloffset / frames );
    
    if ( isdefined( animrate ) && animrate < 1 )
    {
        self aisetanimrate( self.traversexanim, animrate );
    }
    
    for (i = 0; i < frames; i++) {
        self forceteleport( self.origin + offset );
        waitframe();
    }
    
    if ( isdefined( animrate ) && animrate < 1 )
    {
        self aisetanimrate( self.traversexanim, 1 );
    }
}

// Namespace traverse / scripts\asm\traverse
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f85
// Size: 0xea, Type: bool
function shouldusewarpnotetracks( traversexanim )
{
    if ( animhasnotetrack( traversexanim, "warp_up_start" ) )
    {
        assert( animhasnotetrack( traversexanim, "warp_up_end" ) );
        return true;
    }
    
    if ( animhasnotetrack( traversexanim, "warp_across_start" ) )
    {
        assert( animhasnotetrack( traversexanim, "warp_across_end" ) );
        return true;
    }
    
    if ( animhasnotetrack( traversexanim, "warp_down_start" ) )
    {
        assert( animhasnotetrack( traversexanim, "warp_down_end" ) );
        return true;
    }
    
    if ( animhasnotetrack( traversexanim, "warp_up_start_new" ) )
    {
        assert( animhasnotetrack( traversexanim, "warp_up_end_new" ) );
        return true;
    }
    
    if ( animhasnotetrack( traversexanim, "warp_down_start_new" ) )
    {
        assert( animhasnotetrack( traversexanim, "warp_down_end_new" ) );
        return true;
    }
    
    if ( animhasnotetrack( traversexanim, "MotionWarpNoteStart" ) )
    {
        assert( animhasnotetrack( traversexanim, "MotionWarpNoteStart" ) );
        return true;
    }
    
    return false;
}

// Namespace traverse / scripts\asm\traverse
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2078
// Size: 0x31, Type: bool
function shouldusewarparrival( traversexanim )
{
    if ( animhasnotetrack( traversexanim, "warp_arrival_start" ) )
    {
        assert( animhasnotetrack( traversexanim, "warp_arrival_end" ) );
        return true;
    }
    
    return false;
}

// Namespace traverse / scripts\asm\traverse
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x20b2
// Size: 0xde, Type: bool
function function_bff8ca6cd5006152( asmname, statename, tostatename, params )
{
    if ( self.var_32a34987ee1b3095 == "not_set" )
    {
        return false;
    }
    
    if ( self.var_32a34987ee1b3095 == "nodeless" || self.var_32a34987ee1b3095 == "linkless" )
    {
        start_pos = self.var_c97cd7821467b22c;
    }
    else
    {
        assert( self.var_32a34987ee1b3095 == "normal" );
        start_pos = self.traversal_start_node.origin;
    }
    
    disttonode = distance2d( self.origin, start_pos );
    look_ahead = 120;
    
    if ( isdefined( params ) )
    {
        look_ahead = int( params );
    }
    
    if ( disttonode > look_ahead )
    {
        return false;
    }
    
    return true;
}

// Namespace traverse / scripts\asm\traverse
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2199
// Size: 0x35, Type: bool
function shoulddotraditionaltraverse( asmname, statename, tostatename, params )
{
    if ( self.var_e2b4fc394eef5c0f != params )
    {
        return false;
    }
    
    return true;
}

// Namespace traverse / scripts\asm\traverse
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x21d7
// Size: 0x33
function traverse_cleanup( asmname, statename, params )
{
    self motionwarpcancel();
    self finishtraverse();
    self.var_20a0e88052918576 = 0;
}

/#

    // Namespace traverse / scripts\asm\traverse
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0x2212
    // Size: 0x516, Type: dev
    function function_ceba701c6c68b2ee( featurearray, alias, var_9beb646264506c87, translationstartfrac )
    {
        no_recorder = getdvarint( @"recorder_enablerec", 0 ) <= 0;
        textheight = 70;
        
        if ( no_recorder )
        {
            print3d( self.origin + ( 0, 0, textheight ), "<dev string:x198>" + self.var_e2b4fc394eef5c0f + "<dev string:x19f>", ( 1, 0, 1 ), 1, 0.5, 80 );
        }
        
        record3dtext( "<dev string:x198>" + self.var_e2b4fc394eef5c0f + "<dev string:x19f>", self.origin + ( 0, 0, textheight ), ( 1, 0, 1 ) );
        
        foreach ( key, value in featurearray )
        {
            textheight -= 10;
            
            if ( no_recorder )
            {
                print3d( self.origin + ( 0, 0, textheight ), key + "<dev string:x1a1>" + value + "<dev string:x19f>", ( 1, 0, 1 ), 1, 0.5, 80 );
            }
            
            record3dtext( key + "<dev string:x1a1>" + value + "<dev string:x19f>", self.origin + ( 0, 0, textheight ), ( 1, 0, 1 ) );
        }
        
        if ( isdefined( alias ) )
        {
            textheight -= 10;
            
            if ( no_recorder )
            {
                print3d( self.origin + ( 0, 0, textheight ), "<dev string:x1a4>" + alias + "<dev string:x19f>", ( 1, 0, 1 ), 1, 0.5, 80 );
            }
            
            record3dtext( "<dev string:x1a4>" + alias + "<dev string:x19f>", self.origin + ( 0, 0, textheight ), ( 1, 0, 1 ) );
        }
        
        if ( isdefined( var_9beb646264506c87 ) )
        {
            textheight -= 10;
            
            if ( no_recorder )
            {
                print3d( self.origin + ( 0, 0, textheight ), "<dev string:x1b5>" + var_9beb646264506c87, ( 1, 0, 1 ), 1, 0.5, 80 );
            }
            
            record3dtext( "<dev string:x1b5>" + var_9beb646264506c87, self.origin + ( 0, 0, textheight ), ( 1, 0, 1 ) );
        }
        
        if ( translationstartfrac > 0 )
        {
            textheight -= 10;
            
            if ( no_recorder )
            {
                print3d( self.origin + ( 0, 0, textheight ), "<dev string:x1cc>" + translationstartfrac, ( 1, 0, 1 ), 1, 0.5, 80 );
            }
            
            record3dtext( "<dev string:x1cc>" + translationstartfrac, self.origin + ( 0, 0, textheight ), ( 1, 0, 1 ) );
        }
        
        startnode = default_to( self.traversal_start_node, self.var_64b933af90edc53c );
        debugstart = startnode.origin;
        debugapex = undefined;
        
        if ( isdefined( startnode.apex_delta ) )
        {
            debugapex = debugstart + startnode.apex_delta;
        }
        
        if ( isdefined( self.traversal_end_node ) )
        {
            debugend = self.traversal_end_node.origin;
        }
        else
        {
            debugend = self.var_64b933af90edc53c.endpos;
        }
        
        sphere( debugstart, 5, ( 0, 0, 1 ), 0, 80 );
        recordsphere( debugstart, 5, ( 0, 0, 1 ) );
        
        if ( isdefined( debugapex ) )
        {
            line( debugstart, debugapex, ( 0, 1, 0 ), 1, 0, 80 );
            recordline( debugstart, debugapex, ( 0, 1, 0 ) );
            sphere( debugapex, 5, ( 0, 1, 0 ), 0, 80 );
            recordsphere( debugstart, 5, ( 0, 1, 0 ) );
            
            if ( isdefined( startnode.across_delta ) )
            {
                debugacross = debugapex + startnode.across_delta;
                sphere( debugacross, 5, ( 1, 0, 0 ), 0, 80 );
                recordsphere( debugacross, 5, ( 1, 0, 0 ) );
                line( debugapex, debugacross, ( 1, 0, 0 ), 0, 80 );
                recordline( debugapex, debugacross, ( 1, 0, 0 ) );
                debugapex = debugacross;
            }
            
            line( debugapex, debugend, ( 1, 0, 1 ), 1, 0, 80 );
            recordline( debugapex, debugend, ( 1, 0, 0 ) );
        }
        
        sphere( debugend, 5, ( 1, 0, 1 ), 0, 80 );
        recordsphere( debugend, 5, ( 1, 0, 1 ) );
    }

#/

// Namespace traverse / scripts\asm\traverse
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2730
// Size: 0xf0
function function_3bb347b40346528a()
{
    var_73ba1b0a68c224f5 = self.var_c97cd7821467b22c;
    var_ef78260982b9116c = self.var_e341ef38b14d5cd3;
    warp_params = spawnstruct();
    apex_point = self.var_eb21849fd8c2f23;
    
    if ( isdefined( apex_point ) )
    {
        warp_params.var_e25867ac07f6cb19 = 1;
        warp_params.traverse_height = apex_point[ 2 ];
        warp_params.traverse_height_delta = apex_point[ 2 ] - var_73ba1b0a68c224f5[ 2 ];
        warp_params.traverse_drop_height_delta = apex_point[ 2 ] - var_ef78260982b9116c[ 2 ];
        warp_params.apex_delta = apex_point - var_73ba1b0a68c224f5;
        warp_params.angles = vectortoangles( flat_origin( var_ef78260982b9116c - var_73ba1b0a68c224f5 ) );
        warp_params.origin = var_73ba1b0a68c224f5;
        warp_params.endpos = var_ef78260982b9116c;
        warp_params.traversetype = "traverse_warp_over";
    }
    
    return warp_params;
}

// Namespace traverse / scripts\asm\traverse
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2829
// Size: 0xd5f
function calctraversetype( asmname, statename, params )
{
    var_e8885693728fd806 = undefined;
    var_a8354f77f1ab9157 = self.var_32a34987ee1b3095 == "nodeless" || self.var_32a34987ee1b3095 == "linkless";
    
    if ( var_a8354f77f1ab9157 )
    {
        if ( self.var_32a34987ee1b3095 == "linkless" && self.var_59c43504d7aabb7a == "fence" )
        {
            var_e8885693728fd806 = &function_3bb347b40346528a;
        }
        else if ( isdefined( self.var_bb9dc4a1372891c6 ) )
        {
            var_e8885693728fd806 = self.var_bb9dc4a1372891c6;
        }
        
        assertex( isdefined( var_e8885693728fd806 ), "<dev string:x1e9>" );
        self.var_64b933af90edc53c = self [[ var_e8885693728fd806 ]]();
    }
    
    self.var_20a0e88052918576 = 1;
    self.var_e2b4fc394eef5c0f = self.var_ad4d9f5a34656396;
    
    if ( var_a8354f77f1ab9157 )
    {
        self.var_e2b4fc394eef5c0f = self.var_64b933af90edc53c.traversetype;
        self.var_ad4d9f5a34656396 = self.var_64b933af90edc53c.traversetype;
        self.var_a836173c912579bd = self.var_64b933af90edc53c.origin;
    }
    else
    {
        if ( isdefined( self.var_371c13977bb78c59 ) )
        {
            self.var_e2b4fc394eef5c0f = [[ self.var_371c13977bb78c59 ]]( self.var_e2b4fc394eef5c0f );
        }
        
        self.var_691b939374451d39 = self.traversal_start_node;
    }
    
    if ( !isdefined( self.var_e2b4fc394eef5c0f ) || !self asmhasstate( asmname, self.var_e2b4fc394eef5c0f ) )
    {
        function_beef4a855ca0ca3c();
        return;
    }
    else if ( self.var_e2b4fc394eef5c0f == "traverse_warp_external" )
    {
        assertex( self.var_32a34987ee1b3095 == "node_based", "traverse_warp_external must be node-based." );
        assertex( isdefined( self.traversal_start_node ), "Missing traversal start node for '" + self.var_32a34987ee1b3095 + "' " + self.var_ad4d9f5a34656396 + "' traversal" );
        assert( isdefined( self.traversal_start_node.animscript ) );
        customname = self.traversal_start_node.animscript;
        assertex( isdefined( level.var_bb5f04e5a0a5c13 ), "cannot use traverse warp external without setting custom choose arrival function in level.scr_traverse_choosearrivalfn: " + customname );
        assert( isdefined( level.var_bb5f04e5a0a5c13[ customname ] ), "cannot use traverse external without setting custom choose arrival function in level.scr_traverse_choosearrivalfn[ " + customname + " ]." );
        self.traversalhasarrival = 1;
        self.var_c4ef68fe2a3931e5 = 1;
        traverseanim = self [[ level.var_bb5f04e5a0a5c13[ customname ] ]]( asmname, statename, params );
        assert( isdefined( traverseanim ) );
        assert( isanimation( traverseanim ) );
        self.var_64759b639d9fb8d6 = getmovedelta( traverseanim, 0, 1 );
        return;
    }
    
    if ( var_a8354f77f1ab9157 )
    {
        assertex( isdefined( self.var_64b933af90edc53c ), "Missing traversal nodeless data for '" + self.var_32a34987ee1b3095 + "' " + self.var_ad4d9f5a34656396 + "' traversal" );
        featurearray = [];
        featurearray[ "height" ] = self.var_64b933af90edc53c.traverse_height_delta;
        featurearray[ "drop_height" ] = self.var_64b933af90edc53c.traverse_drop_height_delta;
        featurearray[ "arrival_yaw" ] = angleclamp180( self.var_64b933af90edc53c.angles[ 1 ] - self.angles[ 1 ] );
        featurearray[ "speed" ] = self aigettargetspeed();
        
        if ( self.var_e2b4fc394eef5c0f == "traverse_warp_across" && isdefined( self.var_64b933af90edc53c.across_delta ) )
        {
            featurearray[ "length" ] = length2d( self.var_64b933af90edc53c.across_delta );
        }
    }
    else if ( self.var_32a34987ee1b3095 == "node_based" )
    {
        assertex( isdefined( self.traversal_start_node ), "Missing traversal start node for '" + self.var_32a34987ee1b3095 + "' " + self.var_ad4d9f5a34656396 + "' traversal" );
        assertex( isdefined( self.traversal_start_node.type ), "Invalid traversal start node - missing type. Start node location: " + self.traversal_start_node.origin );
        assertex( self.traversal_start_node.type == "Begin", "Invalid traversal start node type: '" + self.traversal_start_node.type + "' Start node location: " + self.traversal_start_node.origin );
        assertex( isdefined( self.traversal_start_node.traverse_height ), "Missing computed traversal data for '" + self.var_32a34987ee1b3095 + "' " + self.var_ad4d9f5a34656396 + "' traversal. Start node location: " + self.traversal_start_node.origin );
        featurearray = [];
        featurearray[ "height" ] = self.traversal_start_node.traverse_height_delta;
        featurearray[ "drop_height" ] = self.traversal_start_node.traverse_drop_height_delta;
        featurearray[ "arrival_yaw" ] = angleclamp180( self.traversal_start_node.angles[ 1 ] - self.angles[ 1 ] );
        featurearray[ "speed" ] = self aigettargetspeed();
        
        if ( self.var_e2b4fc394eef5c0f == "traverse_warp_across" && isdefined( self.traversal_start_node.across_delta ) )
        {
            featurearray[ "length" ] = length2d( self.traversal_start_node.across_delta );
        }
    }
    else
    {
        assertmsg( "Invalid traverse_navtype: '" + self.var_32a34987ee1b3095 + "', traverse_traverseType: " + self.var_ad4d9f5a34656396 );
        return;
    }
    
    if ( isdefined( self.var_12a6a7d538790f6e ) )
    {
        featurearray = [[ self.var_12a6a7d538790f6e ]]( featurearray, self.var_e2b4fc394eef5c0f );
    }
    
    alias = undefined;
    
    if ( self.var_e2b4fc394eef5c0f == "traverse_ground" || self.var_e2b4fc394eef5c0f == "traverse_wall" )
    {
        alias = self function_654683bad8975183( "move" );
        
        if ( asm_hasalias( self.var_e2b4fc394eef5c0f, alias ) == 0 )
        {
            alias = undefined;
        }
    }
    
    if ( !isdefined( alias ) )
    {
        alias = function_77bfc94ee479c823( self.animsetname, self.var_e2b4fc394eef5c0f, featurearray );
    }
    
    if ( !isdefined( alias ) )
    {
        traverserindex = gettraverserindex();
        
        if ( traverserindex < 0 )
        {
            /#
                assertstring = "<dev string:x237>" + default_to( self.var_e2b4fc394eef5c0f, "<dev string:x27a>" ) + "<dev string:x27c>" + self.origin + "<dev string:x28b>" + self getbasearchetype() + "<dev string:x29c>";
                
                foreach ( value in featurearray )
                {
                    assertstring += key + "<dev string:x2ae>" + value + "<dev string:x2b0>";
                }
                
                assertmsg( assertstring );
            #/
            
            return;
        }
        
        alias = selectanim( self.var_e2b4fc394eef5c0f, featurearray, traverserindex );
    }
    
    assertex( asm_hasalias( self.var_e2b4fc394eef5c0f, alias ), "ASM state " + self.var_e2b4fc394eef5c0f + " has no anims with selected alias " + alias );
    traverseanim = asm_lookupanimfromalias( self.var_e2b4fc394eef5c0f, alias );
    xanim = asm_getxanim( self.var_e2b4fc394eef5c0f, traverseanim );
    self.var_2078d7b4461a7a13 = alias;
    arrivalstate = self.var_e2b4fc394eef5c0f + "_arrival";
    self.traversalhasarrival = 0;
    arrivalxanim = undefined;
    traversearrivalanim = asm_lookupanimfromaliasifexists( arrivalstate, alias );
    
    if ( isdefined( traversearrivalanim ) )
    {
        arrivalxanim = asm_getxanim( arrivalstate, traversearrivalanim );
        assertex( animhasnotetrack( arrivalxanim, "warp_arrival_start" ) && animhasnotetrack( arrivalxanim, "warp_arrival_end" ), "Anim alias " + alias + " in state " + self.var_e2b4fc394eef5c0f + " arrival missing required warp_arrival notetracks." );
        assertex( !animhasnotetrack( xanim, "warp_arrival_start" ) && !animhasnotetrack( xanim, "warp_arrival_end" ), "Anim alias " + alias + " in state " + self.var_e2b4fc394eef5c0f + " traverse with arrival animation contains warp_arrival notetracks." );
        self.traversalhasarrival = 1;
        self.var_c4ef68fe2a3931e5 = 1;
    }
    
    arrival = xanim;
    
    if ( isdefined( arrivalxanim ) )
    {
        arrival = arrivalxanim;
    }
    
    translationdelta = ( 0, 0, 0 );
    arrivalstartfrac = getnotetracktimes( arrival, "warp_arrival_start" )[ 0 ];
    var_8407bdeaf8ce633 = getnotetracktimes( arrival, "warp_arrival_end" )[ 0 ];
    finishfrac = getnotetracktimes( arrival, "finish" )[ 0 ];
    translationstartfrac = 0;
    var_9beb646264506c87 = undefined;
    
    if ( self.var_e2b4fc394eef5c0f == "traverse_warp_down" )
    {
        apex_delta = undefined;
        start_pos = undefined;
        start_angles = undefined;
        
        if ( self.var_32a34987ee1b3095 == "nodeless" )
        {
            apex_delta = self.var_64b933af90edc53c.apex_delta;
            start_pos = self.var_64b933af90edc53c.origin;
            start_angles = self.var_64b933af90edc53c.angles;
        }
        else
        {
            apex_delta = self.traversal_start_node.apex_delta;
            start_pos = self.traversal_start_node.origin;
            start_angles = self.traversal_start_node.angles;
        }
        
        var_cc3113f81e554ed4 = vectornormalize2( apex_delta );
        var_3f7d96abff6aba8f = flat_origin( self.origin - start_pos );
        var_9beb646264506c87 = vectordot( var_cc3113f81e554ed4, var_3f7d96abff6aba8f );
        var_4deeaf3c904db7f4 = abs( vectordot( ( var_3f7d96abff6aba8f[ 1 ] * -1, var_3f7d96abff6aba8f[ 0 ], 0 ), var_cc3113f81e554ed4 ) );
        var_25e60fb59cc599b0 = length2d( apex_delta );
        
        if ( var_25e60fb59cc599b0 > 0 )
        {
            var_7f49d8e116150fc4 = undefined;
            apexstartfrac = function_c60db10715908b8d( xanim );
            
            if ( isdefined( apexstartfrac ) )
            {
                var_f5d1f0df5f0f9b9f = getmovedelta( xanim, default_to( var_8407bdeaf8ce633, 0 ), apexstartfrac );
                var_5c06589420922de2 = var_25e60fb59cc599b0 - var_9beb646264506c87;
                var_38372b31f3a04497 = length2d( var_f5d1f0df5f0f9b9f );
                
                if ( var_5c06589420922de2 < var_38372b31f3a04497 && var_5c06589420922de2 > 0 )
                {
                    var_7f49d8e116150fc4 = 1 - var_5c06589420922de2 / var_38372b31f3a04497;
                }
                
                var_a2dde6ba8dda0eb1 = vectordot( anglestoforward( self.angles ), var_cc3113f81e554ed4 );
                var_4361923c279dfbbf = 0.5;
                var_6462f9ecbc36b984 = 15;
                
                if ( isdefined( var_7f49d8e116150fc4 ) && var_4deeaf3c904db7f4 < var_6462f9ecbc36b984 && ( var_a2dde6ba8dda0eb1 > var_4361923c279dfbbf || length2dsquared( var_3f7d96abff6aba8f ) < squared( var_6462f9ecbc36b984 ) ) )
                {
                    trace_dist = 60;
                    x = trace_dist * cos( start_angles[ 1 ] );
                    y = trace_dist * sin( start_angles[ 1 ] );
                    pos = ( x, y, 0 ) + self.origin;
                    var_4526111c13164192 = 50;
                    capsule_radius = 15;
                    
                    if ( self aiphysicstracepassed( self.origin + ( 0, 0, 10 ), pos + ( 0, 0, 10 ), capsule_radius, var_4526111c13164192, 1 ) )
                    {
                        var_57d445b13e734d93 = math::remap( var_7f49d8e116150fc4, 0, 1, default_to( var_8407bdeaf8ce633, 0 ), apexstartfrac );
                        var_721088140522b32b = length2d( getmovedelta( xanim, var_57d445b13e734d93, apexstartfrac ) );
                        var_f3eb64c84d9ad6e = 2;
                        
                        if ( var_721088140522b32b - var_5c06589420922de2 > var_f3eb64c84d9ad6e )
                        {
                            var_7f49d8e116150fc4 *= var_721088140522b32b / var_5c06589420922de2;
                            var_7f49d8e116150fc4 = clamp( var_7f49d8e116150fc4, 0, 1 );
                            var_57d445b13e734d93 = math::remap( var_7f49d8e116150fc4, 0, 1, default_to( var_8407bdeaf8ce633, 0 ), apexstartfrac );
                        }
                        
                        translationstartfrac = var_57d445b13e734d93;
                        self.var_c4ef68fe2a3931e5 = 0;
                    }
                }
                
                if ( translationstartfrac >= apexstartfrac )
                {
                    translationstartfrac = max( 0, apexstartfrac - 0.01 );
                }
            }
        }
    }
    
    /#
        if ( getdvarint( @"hash_8f1b9e23aa212024", 0 ) == 1 )
        {
            function_ceba701c6c68b2ee( featurearray, alias, var_9beb646264506c87, translationstartfrac );
        }
    #/
    
    self.var_d74f2d1e6f517141 = translationstartfrac;
    
    if ( isdefined( arrivalstartfrac ) && isdefined( var_8407bdeaf8ce633 ) && isdefined( finishfrac ) )
    {
        var_5d7268f5f03b60c3 = ter_op( isdefined( arrivalxanim ), finishfrac, var_8407bdeaf8ce633 );
        translationdelta = getmovedelta( arrival, translationstartfrac, var_5d7268f5f03b60c3 );
    }
    
    self.var_64759b639d9fb8d6 = translationdelta;
}

// Namespace traverse / scripts\asm\traverse
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3590
// Size: 0x15a
function traversechooseanim( asmname, statename, params )
{
    alias = undefined;
    
    if ( self.var_20a0e88052918576 && isdefined( self.var_e2b4fc394eef5c0f ) && isdefined( self.var_2078d7b4461a7a13 ) )
    {
        statename = self.var_e2b4fc394eef5c0f;
        alias = self.var_2078d7b4461a7a13;
    }
    else
    {
        setupsuccess = self setuptraversaltransitioncheck( 120 );
        assertex( setupsuccess, "Traversal setup failed for entity " + self getentitynumber() + " for state " + statename + " around location " + self.origin );
        calctraversetype( asmname, statename, params );
        
        if ( self.var_32a34987ee1b3095 == "nodeless" || self.var_32a34987ee1b3095 == "linkless" )
        {
            nodedist = distance2d( self.var_64b933af90edc53c.origin, self.origin );
        }
        else
        {
            nodedist = distance2d( self.traversal_start_node.origin, self.origin );
        }
        
        if ( nodedist < 4 )
        {
            self.var_c4ef68fe2a3931e5 = 0;
        }
        
        statename = self.var_e2b4fc394eef5c0f;
        alias = self.var_2078d7b4461a7a13;
    }
    
    return asm_chooseanim( asmname, statename, alias );
}

// Namespace traverse / scripts\asm\traverse
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x36f3
// Size: 0x1c
function handletraversearrivalwarpnotetracks( note )
{
    if ( note == "warp_arrival_start" )
    {
        return handlewarparrivalnotetrack();
    }
}

// Namespace traverse / scripts\asm\traverse
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3717
// Size: 0x9a
function handletraversewarpnotetracks( note )
{
    if ( isdefined( self.var_acb02d417fdecc8f ) )
    {
        [[ self.var_acb02d417fdecc8f ]]( note );
    }
    
    if ( note == "traverse_death" )
    {
        return handletraversedeathnotetrack();
    }
    
    if ( note == "warp_arrival_start" )
    {
        return handlewarparrivalnotetrack();
    }
    
    if ( note == "warp_up_start" )
    {
        return handlewarpupnotetrack();
    }
    
    if ( note == "warp_across_start" )
    {
        return handlewarpacrossnotetrack();
    }
    
    if ( note == "warp_down_start" )
    {
        return handlewarpdownstartnotetrack();
    }
    
    if ( note == "warp_down_end" )
    {
        return handlewarpdownendnotetrack();
    }
}

// Namespace traverse / scripts\asm\traverse
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x37b9
// Size: 0x47
function handletraversedeathnotetrack()
{
    if ( isdefined( self.traversedeathanim ) )
    {
        deathanimarray = self.traversedeathanim[ self.traversedeathindex ];
        set_deathanim( deathanimarray[ randomint( deathanimarray.size ) ] );
        self.traversedeathindex++;
    }
}

// Namespace traverse / scripts\asm\traverse
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3808
// Size: 0x110
function handlewarparrivalnotetrack()
{
    self animmode( "noclip" );
    
    if ( self.var_32a34987ee1b3095 == "nodeless" || self.var_32a34987ee1b3095 == "linkless" )
    {
        if ( !isdefined( self.var_64b933af90edc53c ) )
        {
            println( "<dev string:x2b3>" + self.var_32a34987ee1b3095 + "<dev string:x2ed>" );
            return;
        }
        
        targetpos = self.var_64b933af90edc53c.origin;
        targetangles = self.var_64b933af90edc53c.angles;
    }
    else
    {
        if ( !isdefined( self.traversestartnode ) )
        {
            println( "<dev string:x306>" + self.var_32a34987ee1b3095 + "<dev string:x33a>" );
            return;
        }
        
        targetpos = self.traversestartnode.origin;
        targetangles = self.traversestartnode.angles;
    }
    
    motionwarpwithnotetracks( self.traversexanim, targetpos, targetangles, "warp_arrival_start", "warp_arrival_end" );
}

// Namespace traverse / scripts\asm\traverse
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3920
// Size: 0x29b
function handlewarpupnotetrack()
{
    self animmode( "noclip" );
    
    if ( self.var_32a34987ee1b3095 == "nodeless" || self.var_32a34987ee1b3095 == "linkless" )
    {
        if ( !isdefined( self.var_64b933af90edc53c ) )
        {
            println( "<dev string:x2b3>" + self.var_32a34987ee1b3095 + "<dev string:x352>" );
            return;
        }
        
        assertex( isdefined( self.var_64b933af90edc53c.origin ), "Undefined traversal nav type [" + self.var_32a34987ee1b3095 + "] origin in warp up notetrack." );
        assertex( isdefined( self.var_64b933af90edc53c.apex_delta ), "Undefined traversal nav type [" + self.var_32a34987ee1b3095 + "] apex delta in warp up notetrack." );
        targetpos = self.var_64b933af90edc53c.origin + self.var_64b933af90edc53c.apex_delta;
        targetangles = self.var_64b933af90edc53c.angles;
    }
    else
    {
        if ( !isdefined( self.traversestartnode ) )
        {
            println( "<dev string:x306>" + self.var_32a34987ee1b3095 + "<dev string:x366>" );
            return;
        }
        
        assertex( isdefined( self.traversestartnode.origin ), "Undefined traverse start node origin in warp up notetrack." );
        assertex( isdefined( self.traversestartnode.apex_delta ), "Undefined traverse start node apex delta in warp up notetrack." );
        targetpos = self.traversestartnode.origin + self.traversestartnode.apex_delta;
        targetangles = self.traversestartnode.angles;
    }
    
    if ( animhasnotetrack( self.traversexanim, "warp_up_apex" ) )
    {
        animstartfrac = getnotetracktimes( self.traversexanim, "warp_up_start" )[ 0 ];
        var_47b4bdc915cff70d = getnotetracktimes( self.traversexanim, "warp_up_end" )[ 0 ];
        animlength = getanimlength( self.traversexanim );
        assertex( var_47b4bdc915cff70d - animstartfrac >= 0, "Invalid warp up traverse anim start and/or end fraction." );
        duration = int( ( var_47b4bdc915cff70d - animstartfrac ) * animlength * 1000 );
        motionwarpwithnotetracks( self.traversexanim, targetpos, targetangles, "warp_up_start", "warp_up_apex", duration );
        return;
    }
    
    motionwarpwithnotetracks( self.traversexanim, targetpos, targetangles, "warp_up_start", "warp_up_end" );
}

// Namespace traverse / scripts\asm\traverse
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3bc3
// Size: 0x28f
function handlewarpacrossnotetrack()
{
    self animmode( "noclip" );
    endnode = self.traverseendnode;
    
    if ( !isdefined( endnode ) )
    {
        endnode = spawnstruct();
        
        if ( self.var_32a34987ee1b3095 == "nodeless" || self.var_32a34987ee1b3095 == "linkless" )
        {
            if ( !isdefined( self.var_64b933af90edc53c ) )
            {
                println( "<dev string:x2b3>" + self.var_32a34987ee1b3095 + "<dev string:x379>" );
                return;
            }
            
            endnode.angles = self.var_64b933af90edc53c.angles;
        }
        else
        {
            if ( !isdefined( self.traversestartnode ) )
            {
                println( "<dev string:x306>" + self.var_32a34987ee1b3095 + "<dev string:x391>" );
            }
            
            endnode.angles = self.traversestartnode.angles;
        }
    }
    
    startnode = self.traversestartnode;
    
    if ( !isdefined( startnode ) )
    {
        startnode = spawnstruct();
        
        if ( self.var_32a34987ee1b3095 == "nodeless" || self.var_32a34987ee1b3095 == "linkless" )
        {
            startnode.across_delta = self.var_64b933af90edc53c.across_delta;
            startnode.apex_delta = self.var_64b933af90edc53c.apex_delta;
            startnode.origin = self.var_64b933af90edc53c.origin;
        }
    }
    
    /#
        assertex( isdefined( startnode.apex_delta ), "<dev string:x3a8>" + startnode.origin );
        assertex( isdefined( startnode.across_delta ), "<dev string:x3ec>" + startnode.origin );
    #/
    
    apex_delta = default_to( startnode.apex_delta, ( 0, 0, 0 ) );
    across_delta = default_to( startnode.across_delta, ( 0, 0, 0 ) );
    assertex( isdefined( self function_ad3c975cb94e4736() ), " undefined GetNegotiationStartPos in handleWarpAcrossNotetrack. " );
    targetpos = startnode.origin + apex_delta + across_delta;
    targetangles = endnode.angles;
    motionwarpwithnotetracks( self.traversexanim, targetpos, targetangles, "warp_across_start", "warp_across_end" );
}

// Namespace traverse / scripts\asm\traverse
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e5a
// Size: 0x4c6
function handlewarpdownstartnotetrack()
{
    self animmode( "noclip" );
    endnode = self.traverseendnode;
    
    if ( !isdefined( endnode ) )
    {
        endnode = spawnstruct();
        
        if ( self.var_32a34987ee1b3095 == "nodeless" || self.var_32a34987ee1b3095 == "linkless" )
        {
            if ( !isdefined( self.var_64b933af90edc53c ) )
            {
                println( "<dev string:x432>" + self.var_32a34987ee1b3095 + "<dev string:x463>" );
                return;
            }
            
            endnode.angles = self.var_64b933af90edc53c.angles;
            endnode.origin = self.var_e341ef38b14d5cd3;
        }
        else
        {
            if ( !isdefined( self.traversestartnode ) )
            {
                println( "<dev string:x432>" + self.var_32a34987ee1b3095 + "<dev string:x463>" );
                return;
            }
            
            endnode.angles = self.traversestartnode.angles;
            endnode.origin = self getnegotiationendpos();
        }
        
        assert( isdefined( endnode.origin ) );
    }
    else if ( !isdefined( endnode.origin ) )
    {
        endnode.origin = self.traversestartnode.end_node_origin;
    }
    
    animstartfrac = getnotetracktimes( self.traversexanim, "warp_down_start" )[ 0 ];
    var_47b4bdc915cff70d = getnotetracktimes( self.traversexanim, "warp_down_end" )[ 0 ];
    animdelta = getmovedelta( self.traversexanim, animstartfrac, var_47b4bdc915cff70d );
    animdelta = rotatevector( animdelta, endnode.angles );
    assertex( var_47b4bdc915cff70d - animstartfrac >= 0, "Invalid warp down traverse anim start and/or end fraction." );
    var_2ed406669fbe4377 = 512;
    tracestart = ( self.origin[ 0 ] + animdelta[ 0 ], self.origin[ 1 ] + animdelta[ 1 ], self.origin[ 2 ] );
    targetpos = undefined;
    
    if ( isdefined( self.var_70a168924eccff58 ) )
    {
        targetpos = self.var_70a168924eccff58;
        self.var_70a168924eccff58 = undefined;
    }
    else
    {
        targetpos = getgroundposition( tracestart, 10, var_2ed406669fbe4377, 12 );
    }
    
    /#
        if ( tracestart[ 2 ] - targetpos[ 2 ] > var_2ed406669fbe4377 )
        {
            traversestartpos = ( 0, 0, 0 );
            
            if ( self.var_32a34987ee1b3095 == "<dev string:x47e>" || self.var_32a34987ee1b3095 == "<dev string:x487>" )
            {
                traversestartpos = self.var_c97cd7821467b22c;
            }
            else if ( self.var_32a34987ee1b3095 == "<dev string:x490>" )
            {
                traversestartpos = self function_ad3c975cb94e4736();
            }
            
            assertmsg( "<dev string:x49b>" + var_2ed406669fbe4377 + "<dev string:x4bd>" + tracestart + "<dev string:x4cf>" + traversestartpos );
        }
    #/
    
    /#
        if ( getdvarint( @"hash_8f1b9e23aa212024", 0 ) == 1 )
        {
            line( tracestart, targetpos, ( 0, 1, 0 ), 1, 0, 80 );
        }
    #/
    
    var_49601ab0e39bf185 = 0.05;
    var_cc2baf1e6d41c416 = 30;
    zdelta = abs( targetpos[ 2 ] - self.origin[ 2 ] );
    
    if ( zdelta < var_49601ab0e39bf185 * abs( animdelta[ 2 ] ) || zdelta > var_cc2baf1e6d41c416 )
    {
        if ( self.var_32a34987ee1b3095 == "nodeless" || self.var_32a34987ee1b3095 == "linkless" )
        {
            startpos = self.var_64b933af90edc53c.origin;
        }
        else
        {
            startpos = self.traversestartnode.origin;
        }
        
        println( "<dev string:xde>" + startpos + "<dev string:x110>" );
        
        if ( isdefined( endnode.origin ) )
        {
            targetpos = endnode.origin;
        }
    }
    
    nextcorner = self getpointafternegotiation();
    targetangles = endnode.angles;
    
    if ( isdefined( nextcorner ) )
    {
        targetyaw = vectortoyaw( nextcorner - endnode.origin );
        targetdist = clamp( angleclamp180( targetyaw - self.angles[ 1 ] ), -30, 30 );
        targetyaw = angleclamp180( self.angles[ 1 ] + targetdist );
        targetangles = ( 0, targetyaw, 0 );
    }
    
    motionwarpwithnotetracks( self.traversexanim, targetpos, targetangles, "warp_down_start", "warp_down_end" );
}

// Namespace traverse / scripts\asm\traverse
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4328
// Size: 0x29
function handlewarpdownendnotetrack()
{
    if ( !isagent( self ) )
    {
        self setanimrate( self.traversexanim, 1 );
    }
    
    self animmode( "gravity" );
}

// Namespace traverse / scripts\asm\traverse
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4359
// Size: 0x179
function function_beef4a855ca0ca3c()
{
    var_a8354f77f1ab9157 = self.var_32a34987ee1b3095 == "nodeless" || self.var_32a34987ee1b3095 == "linkless";
    endpos = undefined;
    
    if ( var_a8354f77f1ab9157 )
    {
        endpos = self.var_64b933af90edc53c.endpos;
    }
    else
    {
        endpos = self getnegotiationendpos();
        
        if ( !isdefined( endpos ) )
        {
            endnode = self getnegotiationendnode();
            
            if ( isdefined( endnode ) )
            {
                endpos = endnode.origin;
            }
            else if ( isdefined( self.traversal_end_node ) )
            {
                endpos = self.traversal_end_node.origin;
            }
        }
    }
    
    self forceteleport( endpos, self.angles );
    
    /#
        startpos = undefined;
        
        if ( var_a8354f77f1ab9157 )
        {
            startpos = self.var_64b933af90edc53c.origin;
        }
        else
        {
            startpos = self function_ad3c975cb94e4736();
            
            if ( !isdefined( startpos ) )
            {
                startnode = self getnegotiationstartnode();
                
                if ( isdefined( startnode ) )
                {
                    startpos = startnode.origin;
                }
                else if ( isdefined( self.traversal_start_node ) )
                {
                    startpos = self.traversal_start_node.origin;
                }
            }
        }
        
        println( "<dev string:x4e9>" + startpos );
        record3dtext( "<dev string:x544>", self.origin + ( 0, 0, 70 ), ( 1, 0, 1 ) );
    #/
}

// Namespace traverse / scripts\asm\traverse
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x44da
// Size: 0x22d
function checktraverse( statename )
{
    /#
        new_state = "<dev string:x564>";
        
        switch ( statename )
        {
            case #"hash_13f1836afb769794":
                new_state = "<dev string:x576>";
                break;
            case #"hash_6304cbcba2e946b0":
            case #"hash_d82745219ff3c265":
                new_state = "<dev string:x5a0>";
                break;
            case #"hash_866c4635f52e9798":
                new_state = "<dev string:x5b7>";
                break;
            case #"hash_866fce35f531ac47":
            case #"hash_9f0dc66f883f25c3":
                new_state = "<dev string:x5da>";
                break;
            case #"hash_1d12ff1ecb04aba4":
            case #"hash_b447ff4d4a51e9fb":
                new_state = "<dev string:x5fd>";
                break;
            case #"hash_db11de90ac6688ff":
                new_state = "<dev string:x614>";
                break;
            case #"hash_3ea04fbb868d6bb3":
                new_state = "<dev string:x630>";
                break;
            case #"hash_3ebccfbb86a3fb82":
                new_state = "<dev string:x65b>";
                break;
            case #"hash_3ec2dbbb86a88b94":
            case #"hash_898e0c97630ee383":
                new_state = "<dev string:x683>";
                break;
            case #"hash_3ec5dfbb86aad077":
            case #"hash_898b0e97630ca812":
                new_state = "<dev string:x6ba>";
                break;
            case #"hash_b6f5a750ffd1a966":
                new_state = "<dev string:x6d3>";
                break;
            case #"hash_79b045449d1f54ab":
                new_state = "<dev string:x6f1>";
                break;
            case #"hash_79ad39449d1d0330":
                new_state = "<dev string:x713>";
                break;
            case #"hash_79d645449d3d69bf":
                new_state = "<dev string:x749>";
                break;
            case #"hash_2807abfb86a05ec9":
            case #"hash_33ca12afe07d839a":
            case #"hash_525a0d9590c85cfc":
                new_state = "<dev string:x564>";
                break;
            default:
                return;
        }
        
        if ( new_state == "<dev string:x564>" )
        {
            iprintlnbold( "<dev string:x78d>" + statename + "<dev string:x799>" + self.origin + "<dev string:x7a0>" );
            return;
        }
        
        iprintlnbold( "<dev string:x78d>" + statename + "<dev string:x799>" + self.origin + "<dev string:x7cb>" + new_state + "<dev string:x7ef>" );
    #/
}

