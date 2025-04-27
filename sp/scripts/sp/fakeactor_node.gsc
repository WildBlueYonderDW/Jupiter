#using scripts\common\utility;
#using scripts\engine\sp\utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\sp\anim;
#using scripts\sp\debug;
#using scripts\sp\utility;

#namespace fakeactor_node;

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x351
// Size: 0x3de
function fakeactor_node_setup()
{
    if ( !isdefined( self.angles ) )
    {
        self.angles = ( 0, 0, 0 );
    }
    
    if ( self.script_fakeactor_node == "path" || self.script_fakeactor_node == "turn" )
    {
        self.wait_state = 2;
    }
    else
    {
        self.wait_state = 0;
    }
    
    switch ( self.script_fakeactor_node )
    {
        case #"hash_c2850561e0f6b33b":
            if ( isdefined( self.target ) )
            {
                path_nodes = getnodearray( self.target, "targetname" );
                
                if ( !path_nodes.size )
                {
                    if ( isdefined( self.script_linkto ) )
                    {
                        path_nodes = getnodearray( self.script_linkto, "script_linkname" );
                    }
                }
                
                if ( path_nodes.size > 0 )
                {
                    foreach ( path_node in path_nodes )
                    {
                        if ( path_node.type == "Begin" )
                        {
                            self.traverse_animscript = path_node.animscript;
                        }
                    }
                }
                
                assertex( isdefined( self.traverse_animscript ), "fakeactor node at " + self.origin + " is marked as \"traverse\" but is not linked to a prefab that has a proper traverse_animscript." );
                all_structs = getstructarray( self.target, "targetname" );
                
                if ( isdefined( self.script_linkto ) )
                {
                    all_structs = array_combine( all_structs, getstructarray( self.script_linkto, "script_linkname" ) );
                }
                
                foreach ( struct in all_structs )
                {
                    if ( isdefined( struct.animation ) )
                    {
                        self.origin = struct.origin;
                        self.angles = struct.angles;
                    }
                }
            }
            
            break;
        case #"hash_fcf513967a3ef3d":
            assertex( isdefined( self.animation ), "You must have an animation in an animation node... I mean come on." );
            break;
    }
    
    fakeactor_node_init_type();
    fakeactor_node_init_params();
    fakeactor_node_init_flags();
    waitframe();
    
    switch ( self.script_fakeactor_node )
    {
        case #"hash_fcf513967a3ef3d":
            self.anim_node = spawnstruct();
            self.anim_node.origin = self.origin;
            self.anim_node.angles = self.angles;
            assertex( hasanim_generic( self.animation ), "You must define the animation as a generic" );
            play_animation = getanim_generic( self.animation );
            new_origin = getstartorigin( self.origin, self.angles, play_animation );
            new_angles = getstartangles( self.origin, self.angles, play_animation );
            self.origin = new_origin;
            self.angles = new_angles;
            
            /#
                move_delta = getmovedelta( play_animation, 0, 1 );
                angles_delta = getangledelta3d( play_animation, 0, 1 );
                var_d0c16329c928493d = invertangles( angles_delta );
                self.end_angles = combineangles( self.angles, var_d0c16329c928493d );
                self.end_origin = self.origin - rotatevector( move_delta, self.end_angles );
            #/
            
            break;
    }
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x737
// Size: 0x7f
function fakeactor_node_init_type()
{
    switch ( self.script_fakeactor_node )
    {
        case #"hash_4ddb655e251e06c8":
            self.type = "Cover Left";
            return;
        case #"hash_175771022bc5e75d":
            self.type = "Cover Right";
            return;
        case #"hash_9d76c99eddd14433":
            self.type = "Cover Crouch";
            return;
        case #"hash_f1676baca0ae608b":
            self.type = "Cover Stand";
            return;
    }
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7be
// Size: 0xa9
function fakeactor_node_init_params()
{
    if ( !isdefined( self.script_parameters ) )
    {
        return;
    }
    
    node_groups = strtok( self.script_parameters, " " );
    
    foreach ( node_group in node_groups )
    {
        if ( !isdefined( level.fakeactor_node_group[ node_group ] ) )
        {
            level.fakeactor_node_group[ node_group ] = [];
        }
        
        level.fakeactor_node_group[ node_group ] = array_add( level.fakeactor_node_group[ node_group ], self );
    }
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x86f
// Size: 0x1a7
function fakeactor_node_init_flags()
{
    if ( !isdefined( self.spawnflags ) )
    {
        self.spawnflags = 0;
    }
    
    if ( !( self.spawnflags & 64 ) )
    {
        up = 32 * anglestoup( self.angles );
        down = -20000 * anglestoup( self.angles );
        trace = ray_trace( self.origin + up, self.origin + down, undefined, create_solid_ai_contents() );
        
        /#
            if ( trace[ "<dev string:x1c>" ] == "<dev string:x24>" )
            {
                println( trace[ "<dev string:x31>" ] < 1, "<dev string:x3a>" + self.origin + "<dev string:x4f>" );
            }
        #/
        
        self.origin = trace[ "position" ];
        
        if ( self.spawnflags & 32 )
        {
            if ( isdefined( trace[ "entity" ] ) )
            {
                self.ground_ent = trace[ "entity" ];
                self.ground_ent_offset = self.ground_ent worldtolocalcoords( self.origin );
                
                if ( !isdefined( self.angles ) )
                {
                    self.angles = ( 0, 0, 0 );
                }
                
                self.ground_ent_angles_offset = self.angles - self.ground_ent.angles;
            }
        }
    }
    
    if ( self.spawnflags & 8 )
    {
        fakeactor_node_set_disabled( 1 );
    }
    
    if ( self.spawnflags & 16 )
    {
        self.wait_state = 2;
    }
    
    self.node_claimed = [];
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa1e
// Size: 0x6c
function setup_fakeactor_nodes()
{
    level.fakeactor_node_group = [];
    level.var_213ef198a84b4bba = &random;
    
    foreach ( fakeactor_node in level.var_d5043478289af856 )
    {
        fakeactor_node thread fakeactor_node_setup();
    }
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa92
// Size: 0xc, Type: bool
function is_fakeactor_node()
{
    return isdefined( self.script_fakeactor_node );
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaa7
// Size: 0xc4
function fakeactor_node_update()
{
    if ( !isdefined( self.ground_ent ) )
    {
        return;
    }
    
    self.origin = self.ground_ent localtoworldcoords( self.ground_ent_offset );
    struct_angles = spawn( "script_origin", ( 0, 0, 0 ) );
    struct_angles.angles = self.ground_ent.angles;
    struct_angles addpitch( self.ground_ent_angles_offset[ 0 ] );
    struct_angles addyaw( self.ground_ent_angles_offset[ 1 ] );
    struct_angles addroll( self.ground_ent_angles_offset[ 2 ] );
    self.angles = struct_angles.angles;
    struct_angles delete();
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb73
// Size: 0x11a
function fakeactor_node_get_cover_list()
{
    cover_list = [];
    spawnflags = 0;
    
    if ( isdefined( self.spawnflags ) )
    {
        spawnflags = self.spawnflags;
    }
    
    if ( self.script_fakeactor_node == "cover_left" )
    {
        if ( !( spawnflags & 1 ) )
        {
            cover_list = array_add( cover_list, "cover_left" );
        }
        
        if ( !( spawnflags & 2 ) )
        {
            cover_list = array_add( cover_list, "cover_left_crouch" );
        }
    }
    else if ( self.script_fakeactor_node == "cover_right" )
    {
        if ( !( spawnflags & 1 ) )
        {
            cover_list = array_add( cover_list, "cover_right" );
        }
        
        if ( !( spawnflags & 2 ) )
        {
            cover_list = array_add( cover_list, "cover_right_crouch" );
        }
    }
    else if ( self.script_fakeactor_node == "cover_stand" )
    {
        cover_list = array_add( cover_list, "cover_stand" );
    }
    else if ( self.script_fakeactor_node == "cover_crouch" )
    {
        cover_list = array_add( cover_list, "cover_crouch" );
    }
    else
    {
        cover_list = array_add( cover_list, "exposed" );
    }
    
    if ( cover_list.size == 0 )
    {
        assertmsg( "you created a fake actor node with no possible cover types. you cannot both DONT_STAND and DONT_CROUCH on the same struct!" );
    }
    
    return cover_list;
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc96
// Size: 0x36
function fakeactor_node_get_next()
{
    if ( !isdefined( self.target ) )
    {
        return undefined;
    }
    
    valid_nodes = fakeactor_node_get_all_valid();
    
    if ( valid_nodes.size )
    {
        return self [[ level.var_213ef198a84b4bba ]]( valid_nodes );
    }
    
    return undefined;
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcd5
// Size: 0xa2
function fakeactor_node_get_all_valid()
{
    valid_nodes = [];
    
    if ( !isdefined( self.target ) )
    {
        return valid_nodes;
    }
    
    all_nodes = getstructarray( self.target, "targetname" );
    
    foreach ( this_node in all_nodes )
    {
        if ( !this_node is_fakeactor_node() )
        {
            continue;
        }
        
        if ( !this_node fakeactor_node_is_valid() )
        {
            continue;
        }
        
        valid_nodes = array_add( valid_nodes, this_node );
    }
    
    return valid_nodes;
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd80
// Size: 0x9b
function fakeactor_node_get_valid_count()
{
    if ( !isdefined( self.target ) )
    {
        return 0;
    }
    
    all_nodes = getstructarray( self.target, "targetname" );
    valid_count = 0;
    
    foreach ( this_node in all_nodes )
    {
        if ( !this_node is_fakeactor_node() )
        {
            continue;
        }
        
        if ( !this_node fakeactor_node_is_valid() )
        {
            continue;
        }
        
        valid_count++;
    }
    
    return valid_count;
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe24
// Size: 0x106
function fakeactor_node_get_angles( frantic )
{
    if ( !isdefined( frantic ) )
    {
        frantic = 0;
    }
    
    struct_angles = spawn( "script_origin", ( 0, 0, 0 ) );
    
    if ( isdefined( self.angles ) )
    {
        struct_angles.angles = self.angles;
    }
    
    if ( isdefined( self.type ) )
    {
        if ( frantic && isdefined( anim.fa_franticnodeyaws ) )
        {
            if ( isdefined( anim.fa_franticnodeyaws[ self.type ] ) )
            {
                struct_angles addyaw( anim.fa_franticnodeyaws[ self.type ] );
            }
        }
        else if ( isdefined( anim.fa_nodeyaws ) )
        {
            if ( isdefined( anim.fa_nodeyaws[ self.type ] ) )
            {
                struct_angles addyaw( anim.fa_nodeyaws[ self.type ] );
            }
        }
    }
    
    angles = struct_angles.angles;
    struct_angles delete();
    return angles;
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xf33
// Size: 0x40d
function fakeactor_node_get_path( first_node, start_pos, frantic, wants_to_move )
{
    node_path = [];
    node_path[ 0 ][ "origin" ] = start_pos;
    node_path[ 0 ][ "dist" ] = 0;
    node_path[ 0 ][ "radius" ] = 0;
    node_path[ 0 ][ "node" ] = undefined;
    node_path[ 0 ][ "total_dist" ] = 0;
    var_886c12b4294e7175 = 1;
    var_537a83e31cd7daca = 200;
    
    while ( true )
    {
        index = node_path.size;
        assertex( node_path.size < 100, "Insanely large fakeactor path at start pos: " + start_pos );
        next_node = undefined;
        
        if ( var_886c12b4294e7175 )
        {
            next_node = first_node;
            var_886c12b4294e7175 = 0;
        }
        else
        {
            next_node = node_path[ index - 1 ][ "node" ] fakeactor_node_get_next();
        }
        
        if ( !isdefined( next_node ) )
        {
            break;
        }
        
        looping_path = 0;
        
        if ( index > 1 )
        {
            for (node_index = 1; node_index < node_path.size - 1; node_index++) {
                if ( node_path[ node_index ][ "node" ] == next_node )
                {
                    looping_path = 1;
                    break;
                }
            }
            
            if ( looping_path )
            {
                node_path[ index ][ "dist" ] = 0;
                node_path[ index ][ "node" ] = next_node;
                node_path[ index ][ "looping" ] = 1;
                node_path[ index ][ "origin" ] = next_node.origin;
                node_path[ index ][ "angles" ] = next_node fakeactor_node_get_angles( frantic );
                to_next_node = next_node.origin - node_path[ index - 1 ][ "origin" ];
                node_path[ index - 1 ][ "dist" ] = length( to_next_node );
                node_path[ index - 1 ][ "to_next_node" ] = vectornormalize( to_next_node );
                break;
            }
        }
        
        node_path[ index ][ "node" ] = next_node;
        node_origin = next_node.origin;
        
        if ( isdefined( next_node.radius ) )
        {
            assert( next_node.radius > 0 );
            
            if ( !isdefined( self.dronerunoffset ) )
            {
                self.dronerunoffset = -1 + randomfloat( 2 );
            }
            
            if ( !isdefined( next_node.angles ) )
            {
                next_node.angles = ( 0, 0, 0 );
            }
            
            forwardvec = anglestoforward( next_node.angles );
            rightvec = anglestoright( next_node.angles );
            upvec = anglestoup( next_node.angles );
            relativeoffset = ( 0, self.dronerunoffset * next_node.radius, 0 );
            node_origin += forwardvec * relativeoffset[ 0 ];
            node_origin += rightvec * relativeoffset[ 1 ];
            node_origin += upvec * relativeoffset[ 2 ];
        }
        
        node_path[ index ][ "origin" ] = node_origin;
        node_path[ index ][ "angles" ] = next_node fakeactor_node_get_angles( frantic );
        
        if ( index > 0 )
        {
            to_next_node = node_origin - node_path[ index - 1 ][ "origin" ];
            node_path[ index - 1 ][ "dist" ] = length( to_next_node );
            node_path[ 0 ][ "total_dist" ] = node_path[ 0 ][ "total_dist" ] + node_path[ index - 1 ][ "dist" ];
            node_path[ index - 1 ][ "to_next_node" ] = vectornormalize( to_next_node );
            
            if ( isdefined( next_node.radius ) )
            {
                node_path[ index - 1 ][ "radius" ] = next_node.radius;
            }
            else
            {
                node_path[ index - 1 ][ "radius" ] = var_537a83e31cd7daca;
            }
        }
        
        var_57a303d3d9923446 = wants_to_move && index == 1;
        
        if ( next_node fakeactor_node_is_end_path( var_57a303d3d9923446 ) )
        {
            break;
        }
    }
    
    node_path[ index ][ "dist" ] = 0;
    node_path[ index ][ "radius" ] = 0;
    node_path[ index ][ "to_next_node" ] = node_path[ index - 1 ][ "to_next_node" ];
    return node_path;
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1349
// Size: 0x13, Type: bool
function fakeactor_node_is_valid()
{
    if ( isdefined( self.disabled ) )
    {
        return false;
    }
    
    return true;
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1365
// Size: 0x69, Type: bool
function fakeactor_node_is_end_path( wants_to_move )
{
    if ( fakeactor_node_is_animation() && !wants_to_move )
    {
        return true;
    }
    
    if ( fakeactor_node_is_traverse() && !wants_to_move )
    {
        return true;
    }
    
    if ( fakeactor_node_is_turn() && !wants_to_move )
    {
        return true;
    }
    
    if ( fakeactor_node_get_valid_count() == 0 )
    {
        return true;
    }
    
    if ( fakeactor_node_is_passthrough() )
    {
        return false;
    }
    
    if ( fakeactor_node_is_wait() && wants_to_move )
    {
        return false;
    }
    
    return true;
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13d7
// Size: 0x27
function fakeactor_node_set_disabled( disabled )
{
    if ( disabled )
    {
        self.disabled = 1;
        return;
    }
    
    self.disabled = undefined;
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1406
// Size: 0x76
function fakeactor_node_group_set_disabled( node_group, disabled )
{
    if ( isdefined( level.fakeactor_node_group[ node_group ] ) )
    {
        foreach ( fakeactor_node in level.fakeactor_node_group[ node_group ] )
        {
            fakeactor_node fakeactor_node_set_disabled( disabled );
        }
    }
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1484
// Size: 0x15
function fakeactor_node_set_path_claimed( ent )
{
    self.path_claimed = ent;
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14a1
// Size: 0xc
function fakeactor_node_clear_path_claimed()
{
    self.path_claimed = undefined;
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14b5
// Size: 0x21
function fakeactor_node_set_claimed( ent )
{
    self.node_claimed[ self.node_claimed.size ] = ent;
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14de
// Size: 0x6f, Type: bool
function fakeactor_node_is_claimed_by( checked_ent )
{
    if ( self.node_claimed.size <= 0 )
    {
        return false;
    }
    
    foreach ( ent in self.node_claimed )
    {
        if ( ent == checked_ent )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1556
// Size: 0x76
function fakeactor_node_remove_claimed( removed_ent )
{
    new_array = [];
    
    foreach ( ent in self.node_claimed )
    {
        if ( ent != removed_ent )
        {
            new_array[ new_array.size ] = ent;
        }
    }
    
    self.node_claimed = new_array;
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15d4
// Size: 0xc
function fakeactor_node_clear_claimed()
{
    self.node_claimed = [];
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15e8
// Size: 0xc
function fakeactor_node_set_wait()
{
    self.wait_state = 0;
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15fc
// Size: 0xd
function fakeactor_node_set_locked()
{
    self.wait_state = 1;
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1611
// Size: 0xd
function fakeactor_node_set_passthrough()
{
    self.wait_state = 2;
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1626
// Size: 0xd, Type: bool
function fakeactor_node_is_wait()
{
    return self.wait_state == 0;
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x163c
// Size: 0xe, Type: bool
function fakeactor_node_is_locked()
{
    return self.wait_state == 1;
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1653
// Size: 0xe, Type: bool
function fakeactor_node_is_passthrough()
{
    return self.wait_state == 2;
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x166a
// Size: 0xc, Type: bool
function fakeactor_node_is_on_moving_platform()
{
    return isdefined( self.ground_ent );
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x167f
// Size: 0xc, Type: bool
function fakeactor_node_is_disabled()
{
    return isdefined( self.disabled );
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1694
// Size: 0x11, Type: bool
function fakeactor_node_is_turn()
{
    return self.script_fakeactor_node == "turn";
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16ae
// Size: 0x1f, Type: bool
function fakeactor_node_is_traverse()
{
    return self.script_fakeactor_node == "traverse" && isdefined( self.traverse_animscript );
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16d6
// Size: 0x11, Type: bool
function fakeactor_node_is_animation()
{
    return self.script_fakeactor_node == "animation";
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16f0
// Size: 0xf, Type: bool
function fakeactor_node_allow_exits()
{
    return !( self.spawnflags & 128 );
}

// Namespace fakeactor_node / scripts\sp\fakeactor_node
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1708
// Size: 0x10, Type: bool
function fakeactor_node_allow_arrivals()
{
    return !( self.spawnflags & 256 );
}

/#

    // Namespace fakeactor_node / scripts\sp\fakeactor_node
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1721
    // Size: 0x6e7, Type: dev
    function fakeactor_node_debug()
    {
        setdvarifuninitialized( @"hash_4d695f34fb13688a", 0 );
        fakeactor_nodes = level.var_d5043478289af856;
        waitframe();
        text_scale = 0.5;
        new_line = 11 * text_scale;
        debug_info = [];
        debug_info[ "<dev string:x94>" ][ "<dev string:x9f>" ] = ( 0.5, 0.35, 0 );
        debug_info[ "<dev string:x94>" ][ "<dev string:xa5>" ] = 32;
        debug_info[ "<dev string:xaa>" ][ "<dev string:x9f>" ] = ( 0.425, 0.425, 0.05 );
        debug_info[ "<dev string:xaa>" ][ "<dev string:xa5>" ] = 32;
        debug_info[ "<dev string:xb6>" ][ "<dev string:x9f>" ] = ( 0, 0.27, 0.33 );
        debug_info[ "<dev string:xb6>" ][ "<dev string:xa5>" ] = 32;
        debug_info[ "<dev string:xc2>" ][ "<dev string:x9f>" ] = ( 0, 0.46, 0.36 );
        debug_info[ "<dev string:xc2>" ][ "<dev string:xa5>" ] = 32;
        debug_info[ "<dev string:xcf>" ][ "<dev string:x9f>" ] = ( 0.5, 0, 0.5 );
        debug_info[ "<dev string:xcf>" ][ "<dev string:xa5>" ] = 16;
        debug_info[ "<dev string:xd4>" ][ "<dev string:x9f>" ] = ( 0.55, 0.45, 0.1 );
        debug_info[ "<dev string:xd4>" ][ "<dev string:xa5>" ] = 16;
        debug_info[ "<dev string:xd9>" ][ "<dev string:x9f>" ] = ( 0.15, 0.55, 0.35 );
        debug_info[ "<dev string:xd9>" ][ "<dev string:xa5>" ] = 16;
        debug_info[ "<dev string:xe2>" ][ "<dev string:x9f>" ] = ( 0.45, 0.2, 0.1 );
        debug_info[ "<dev string:xe2>" ][ "<dev string:xa5>" ] = 16;
        
        while ( true )
        {
            if ( getdvar( @"hash_4d695f34fb13688a" ) == "<dev string:xec>" )
            {
                cam_angles = level.player getplayerangles();
                cam_up = anglestoup( cam_angles );
                
                foreach ( fakeactor_node in fakeactor_nodes )
                {
                    if ( distance( level.player.origin, fakeactor_node.origin ) > 1024 )
                    {
                        continue;
                    }
                    
                    text_pos = fakeactor_node.origin;
                    draw_node( fakeactor_node.origin, fakeactor_node.angles, debug_info[ fakeactor_node.script_fakeactor_node ][ "<dev string:x9f>" ], debug_info[ fakeactor_node.script_fakeactor_node ][ "<dev string:xa5>" ] );
                    
                    if ( fakeactor_node.script_fakeactor_node != "<dev string:xcf>" )
                    {
                        print3d( text_pos, fakeactor_node.script_fakeactor_node, ( 1, 1, 1 ), 1, text_scale );
                    }
                    
                    if ( isdefined( fakeactor_node.radius ) )
                    {
                        draw_circle( fakeactor_node.origin, fakeactor_node.radius, ( 1, 0, 0 ), 1, 1, 1 );
                    }
                    
                    if ( fakeactor_node fakeactor_node_is_disabled() )
                    {
                        print3d( text_pos - cam_up * new_line * -2, "<dev string:xee>", ( 1, 0, 0 ), 1, text_scale );
                        draw_node( fakeactor_node.origin, fakeactor_node.angles, ( 1, 0, 0 ), debug_info[ fakeactor_node.script_fakeactor_node ][ "<dev string:xa5>" ] * 1.1 );
                    }
                    
                    if ( isdefined( fakeactor_node.path_claimed ) )
                    {
                        print3d( text_pos - cam_up * new_line * -1, "<dev string:xf7>", ( 0, 1, 1 ), 1, text_scale );
                        line( fakeactor_node.origin, fakeactor_node.path_claimed.origin, ( 0.5, 0.5, 1 ), 1, 0, 1 );
                    }
                    
                    if ( isdefined( fakeactor_node.traverse_animscript ) )
                    {
                        print3d( text_pos - cam_up * new_line * 1, "<dev string:x104>" + fakeactor_node.traverse_animscript, ( 1, 1, 1 ), 1, text_scale );
                    }
                    else if ( isdefined( fakeactor_node.animation ) )
                    {
                        print3d( text_pos - cam_up * new_line * 1, "<dev string:x10b>" + fakeactor_node.animation, ( 1, 1, 1 ), 1, text_scale );
                    }
                    
                    if ( isdefined( fakeactor_node.ground_ent ) )
                    {
                        fakeactor_node fakeactor_node_update();
                        print3d( text_pos - cam_up * new_line * 2, "<dev string:x112>", ( 1, 1, 0 ), 1, text_scale );
                        line( fakeactor_node.origin, fakeactor_node.ground_ent.origin, ( 1, 1, 0 ), 0.5, 1, 1 );
                    }
                    
                    if ( isdefined( fakeactor_node.script_parameters ) )
                    {
                        print3d( text_pos - cam_up * new_line * 3, "<dev string:x125>" + fakeactor_node.script_parameters, ( 1, 1, 1 ), 1, text_scale );
                    }
                    
                    if ( isdefined( fakeactor_node.end_origin ) )
                    {
                        line( fakeactor_node.origin, fakeactor_node.end_origin, ( 0.5, 1, 0.5 ), 0.5, 1, 1 );
                        draw_node( fakeactor_node.end_origin, fakeactor_node.end_angles, 0.5 * debug_info[ fakeactor_node.script_fakeactor_node ][ "<dev string:x9f>" ], debug_info[ fakeactor_node.script_fakeactor_node ][ "<dev string:xa5>" ] * 1.1 );
                    }
                    
                    if ( isdefined( fakeactor_node.target ) )
                    {
                        connected_nodes = getstructarray( fakeactor_node.target, "<dev string:x12e>" );
                        
                        if ( connected_nodes.size )
                        {
                            foreach ( this_node in connected_nodes )
                            {
                                start_pos = fakeactor_node.origin;
                                
                                if ( isdefined( fakeactor_node.end_origin ) )
                                {
                                    start_pos = fakeactor_node.end_origin;
                                }
                                
                                if ( this_node fakeactor_node_is_valid() )
                                {
                                    line( start_pos, this_node.origin, ( 0, 1, 0 ), 1, 1, 1 );
                                    continue;
                                }
                                
                                line( start_pos, this_node.origin, ( 1, 0, 0 ), 1, 1, 1 );
                            }
                        }
                    }
                }
            }
            
            waitframe();
        }
    }

#/
