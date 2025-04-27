#using script_53f4e6352b0b2425;
#using script_6bf6c8e2e1fdccaa;
#using scripts\engine\utility;

#namespace snd_draw;

/#

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 7, eflags: 0x0
    // Checksum 0x0, Offset: 0xbc
    // Size: 0xe3, Type: dev
    function function_8c3a8f58cbd39dca( posx, posy, text, color, alpha, scale, duration )
    {
        if ( isdefined( text ) == 0 || text == "<dev string:x1c>" )
        {
            return;
        }
        
        color = default_to( color, ( 1, 1, 1 ) );
        alpha = default_to( alpha, 1 );
        scale = default_to( scale, 1 );
        duration = default_to( duration, 1 );
        
        if ( function_ea27c1335507c840( level.snd.callbacks[ "<dev string:x1d>" ] ) )
        {
            [[ level.snd.callbacks[ "<dev string:x1d>" ] ]]( posx, posy, text, color, alpha, scale, duration );
            return;
        }
        
        printtoscreen2d( posx, posy, text, color, scale );
    }

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a7
    // Size: 0xcd, Type: dev
    function function_d4355e5f7ead5aff( text, scale )
    {
        assert( isdefined( text ) );
        
        if ( isdefined( scale ) == 0 )
        {
            scale = 1;
        }
        
        var_4abd463c3a5d6022 = function_d8bcdde57d13f7fc();
        var_b835ae2157a354ac = var_4abd463c3a5d6022[ 0 ];
        var_67a206c222c5563b = var_4abd463c3a5d6022[ 1 ];
        textlength = text.size;
        textwidth = textlength * 8 * scale;
        centerx = var_b835ae2157a354ac * 0.5 - textwidth * 0.5;
        centery = var_67a206c222c5563b * 0.5 - 8;
        center = [ centerx, centery ];
        return center;
    }

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x27c
    // Size: 0x6d, Type: dev
    function function_9e5b1c32235027a1( text, scale )
    {
        centerpos = function_d4355e5f7ead5aff( text, scale );
        var_c73310f7c3115ea0 = centerpos[ 0 ];
        var_c73311f7c31160d3 = centerpos[ 1 ];
        var_c73311f7c31160d3 = var_c73311f7c31160d3 * 0.5 + 8;
        defaultpos = [ var_c73310f7c3115ea0, var_c73311f7c31160d3 ];
        return defaultpos;
    }

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 7, eflags: 0x4
    // Checksum 0x0, Offset: 0x2f1
    // Size: 0x335, Type: dev
    function private function_b443cb2ef9d9f62e( posx, posy, text, color, scale, fadeoutseconds, blinkseconds )
    {
        rowincrement = 16 * scale;
        frametime = function_e448203aedcadcf8();
        frametotal = int( fadeoutseconds / frametime );
        framecount = 0;
        blinkframes = int( blinkseconds / frametime );
        var_1a6b830aa7112a1b = 1;
        blinkcount = 0;
        
        if ( istrue( level.snd.var_ab52ccadc04df539 ) )
        {
            var_1a6b830aa7112a1b = 2;
        }
        
        assertex( isstruct( level.snd ), "<dev string:x29>" );
        
        if ( isarray( level.snd.var_efef27a9405ace5e ) == 0 )
        {
            level.snd.var_efef27a9405ace5e = [];
        }
        
        assert( isarray( level.snd.var_efef27a9405ace5e ) );
        
        if ( level.snd.var_efef27a9405ace5e.size > 0 )
        {
            foreach ( row in level.snd.var_efef27a9405ace5e )
            {
                if ( array_contains( level.snd.var_efef27a9405ace5e, posy ) )
                {
                    posy += rowincrement;
                    continue;
                }
                
                break;
            }
        }
        
        level.snd.var_efef27a9405ace5e[ level.snd.var_efef27a9405ace5e.size ] = posy;
        
        while ( framecount < frametotal )
        {
            if ( framecount < blinkframes )
            {
                blinkstate = int( float( framecount ) / float( var_1a6b830aa7112a1b ) );
                blinkstate %= 2;
                
                if ( blinkstate )
                {
                    framecount += 1;
                    waitframe();
                    continue;
                }
            }
            
            framefrac = float( framecount ) / float( frametotal );
            framefrac = clamp( framefrac, 0, 1 );
            alpha = namespace_53c50dd747d66443::function_e6ef280f5472a1d2( 1 - framefrac, "<dev string:x42>" );
            alphasq = alpha * alpha;
            colorscale = function_1f9e5d44e92014a5( color, alpha );
            function_136df9498dfe620e( text, posx, posy, scale, "<dev string:x4a>", colorscale, alpha, ( 0, 0, 0 ), alphasq, ( 1, 1, 1 ), alphasq, 1 );
            framecount += 1;
            waitframe();
        }
        
        if ( isarray( level.snd.var_efef27a9405ace5e ) )
        {
            level.snd.var_efef27a9405ace5e = array_remove( level.snd.var_efef27a9405ace5e, posy );
        }
    }

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 7, eflags: 0x0
    // Checksum 0x0, Offset: 0x62e
    // Size: 0xe2, Type: dev
    function function_265429989bce8de3( text, posx, posy, color, scale, fadeoutseconds, blinkseconds )
    {
        assert( isdefined( text ) );
        color = default_to( color, ( 1, 0.5, 0.5 ) );
        scale = default_to( scale, 1.75 );
        fadeoutseconds = default_to( fadeoutseconds, 4 );
        blinkseconds = default_to( blinkseconds, 1 );
        
        if ( isdefined( posx ) == 0 || isdefined( posy ) == 0 )
        {
            defaultpos = function_9e5b1c32235027a1( text, scale );
            
            if ( isdefined( posx ) == 0 )
            {
                posx = defaultpos[ 0 ];
            }
            
            if ( isdefined( posy ) == 0 )
            {
                posy = defaultpos[ 1 ];
            }
        }
        
        level thread function_b443cb2ef9d9f62e( posx, posy, text, color, scale, fadeoutseconds, blinkseconds );
        println( text );
    }

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x718
    // Size: 0x62, Type: dev
    function function_946a9bcdca68c4b0( var_77b899748c172731 )
    {
        assertex( isstruct( level.snd ), "<dev string:x29>" );
        
        if ( isdefined( var_77b899748c172731 ) && var_77b899748c172731 != 0 )
        {
            level.snd.var_e5679e17677f3e17 = 1;
            return;
        }
        
        level.snd.var_e5679e17677f3e17 = undefined;
    }

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 7, eflags: 0x0
    // Checksum 0x0, Offset: 0x782
    // Size: 0x4c, Type: dev
    function snd_print3d( origin, text, color, alpha, scale, duration, centered )
    {
        print3d( origin, text, color, alpha, scale, duration, centered );
    }

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 7, eflags: 0x0
    // Checksum 0x0, Offset: 0x7d6
    // Size: 0x4d, Type: dev
    function function_978f0bcacd3604af( origin, text, color, alpha, scale, duration, right )
    {
        print3d( origin, text, color, alpha, scale, duration, 1 );
    }

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 12, eflags: 0x0
    // Checksum 0x0, Offset: 0x82b
    // Size: 0x274, Type: dev
    function function_136df9498dfe620e( text, x, y, scale, var_8c2efb8562e518db, color, alpha, shadowcolor, shadowalpha, lightcolor, lightalpha, duration )
    {
        color = default_to( color, ( 1, 1, 1 ) );
        alpha = default_to( alpha, 1 );
        scale = default_to( scale, 1 );
        var_8c2efb8562e518db = default_to( var_8c2efb8562e518db, "<dev string:x4c>" );
        duration = default_to( duration, 1 );
        offset = ( 0, 0, 0 );
        width = 8 * scale * text.size;
        
        switch ( var_8c2efb8562e518db )
        {
            case 0:
            case #"hash_311044bc01bd8beb":
            case #"hash_c9b3133a17a3b2d0":
            default:
                break;
            case 1:
            case #"hash_311041bc01bd8732":
            case #"hash_5a33ecbc44e76355":
            case #"hash_bf1a695c21e57fe4":
                offset += ( width * -0.5, 0, 0 );
                break;
            case 2:
            case #"hash_311052bc01bda1f5":
            case #"hash_96815ce4f2a3dbc5":
                offset += ( width * -1, 0, 0 );
                break;
        }
        
        lightcolor = undefined;
        
        if ( isdefined( shadowcolor ) )
        {
            shadowoffset = 1;
            
            if ( !isdefined( shadowalpha ) )
            {
                shadowalpha = alpha * 0.7333;
            }
            
            position = ( x + 1.333 * scale, y + 1.333 * scale, 0 ) + offset;
            function_8c3a8f58cbd39dca( position[ 0 ], position[ 1 ], text, shadowcolor, shadowalpha, scale, duration );
        }
        
        if ( isdefined( lightcolor ) )
        {
            if ( !isdefined( lightalpha ) )
            {
                lightalpha = alpha * 0.7333;
            }
            
            position = ( x + -0.666 * scale, y + -0.666 * scale, 0 ) + offset;
            function_8c3a8f58cbd39dca( position[ 0 ], position[ 1 ], text, lightcolor, lightalpha, scale, duration );
        }
        
        position = ( x, y, 0 ) + offset;
        function_8c3a8f58cbd39dca( position[ 0 ], position[ 1 ], text, color, alpha, scale, duration );
    }

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 11, eflags: 0x0
    // Checksum 0x0, Offset: 0xaa7
    // Size: 0x453, Type: dev
    function print3dplus( text, origin, scale, var_8c2efb8562e518db, color, alpha, shadowcolor, shadowalpha, lightcolor, lightalpha, duration )
    {
        color = default_to( color, ( 1, 1, 1 ) );
        alpha = default_to( alpha, 1 );
        scale = default_to( scale, 1 );
        var_8c2efb8562e518db = default_to( var_8c2efb8562e518db, "<dev string:x4c>" );
        duration = int( default_to( duration, 1 ) );
        contsize = scale < 0;
        scale = abs( scale );
        textsize = text.size;
        
        if ( issubstr( text, "<dev string:x6b>" ) )
        {
            lines = strtok( text, "<dev string:x6b>" );
            
            if ( isarray( lines ) && lines.size > 1 )
            {
                longest = 0;
                
                foreach ( line in lines )
                {
                    if ( line.size > longest )
                    {
                        longest = line.size;
                    }
                }
                
                textsize = longest;
            }
        }
        
        viewanglesright = ( 1, 0, 0 );
        viewanglesup = ( 0, 0, 1 );
        players = getplayerssafe();
        
        if ( isarray( players ) && isdefined( players[ 0 ] ) )
        {
            player = players[ 0 ];
            vieworigin = player getplayervieworigin();
            viewangles = player getplayerviewangles();
            viewanglesright = anglestoright( viewangles );
            viewanglesup = anglestoup( viewangles );
            
            if ( contsize )
            {
                dist = distance( origin, vieworigin );
                var_abeed90f073feea9 = dist * 0.00133333;
                scale *= var_abeed90f073feea9;
            }
        }
        
        width = 8 * scale * textsize;
        offset = ( 0, 0, 2 * scale * -1 );
        offsetright = viewanglesright * offset[ 0 ];
        offsetup = viewanglesup * offset[ 2 ];
        centered = 0;
        
        switch ( var_8c2efb8562e518db )
        {
            case 0:
            case #"hash_311044bc01bd8beb":
            case #"hash_c9b3133a17a3b2d0":
            default:
                break;
            case 1:
            case #"hash_311041bc01bd8732":
            case #"hash_5a33ecbc44e76355":
            case #"hash_bf1a695c21e57fe4":
                centered = 1;
                break;
            case 2:
            case #"hash_311052bc01bda1f5":
            case #"hash_96815ce4f2a3dbc5":
                offset += ( width * -1, 0, 0 );
                break;
        }
        
        shadowcolor = undefined;
        lightcolor = undefined;
        
        if ( isdefined( shadowcolor ) )
        {
            if ( !isdefined( shadowalpha ) )
            {
                shadowalpha = alpha * 0.72974;
            }
            
            shadowoffset = viewanglesright * 1.333 * scale + viewanglesup * -1.333 * scale;
            position = origin + viewanglesright * offset[ 0 ] + viewanglesup * offset[ 2 ];
            position += shadowoffset;
            print3d( position, text, shadowcolor, shadowalpha, scale, duration, centered );
        }
        
        if ( isdefined( lightcolor ) )
        {
            if ( !isdefined( lightalpha ) )
            {
                lightalpha = alpha * 0.72974;
            }
            
            lightoffset = viewanglesright * -0.666 * scale + viewanglesup * 0.666 * scale;
            position = origin + viewanglesright * offset[ 0 ] + viewanglesup * offset[ 2 ];
            position += lightoffset;
            print3d( position, text, lightcolor, lightalpha, scale, duration, centered );
        }
        
        position = origin + viewanglesright * offset[ 0 ] + viewanglesup * offset[ 2 ];
        print3d( position, text, color, alpha, scale, duration, centered );
    }

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 4, eflags: 0x4
    // Checksum 0x0, Offset: 0xf02
    // Size: 0xef, Type: dev
    function private function_fc51b1db9f1aa696( color, depthtest, drawpatharray, offset )
    {
        if ( drawpatharray.size < 2 )
        {
            return;
        }
        
        linecount = drawpatharray.size - 1;
        alpha = 1;
        alphastep = 1 / linecount;
        colorscale = color;
        
        while ( linecount > 0 )
        {
            orgend = drawpatharray[ linecount ];
            orgstart = drawpatharray[ linecount - 1 ];
            
            if ( isvector( orgend ) && isvector( orgstart ) && orgend != orgstart )
            {
                if ( isvector( offset ) )
                {
                    orgend += offset;
                    orgstart += offset;
                }
                
                line( orgend, orgstart, colorscale, alpha, depthtest, 1 );
            }
            
            colorscale = vectorscale( color, alpha * 1.5 );
            alpha -= alphastep;
            linecount--;
        }
    }

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 4, eflags: 0x4
    // Checksum 0x0, Offset: 0xff9
    // Size: 0x117, Type: dev
    function private function_e58246b402adf0b1( color, depthtest, duration, offset )
    {
        assert( isdefined( self.origin ), "<dev string:x6d>" );
        assert( isvector( color ), "<dev string:x8f>" );
        assert( isdefined( duration ), "<dev string:xaa>" );
        framecount = 0;
        drawpatharray = [];
        drawpatharray[ 0 ] = self.origin;
        self endon( "<dev string:xc8>" );
        
        while ( drawpatharray.size > 0 )
        {
            var_7b8c6389c2a19ab1 = [];
            
            if ( framecount >= duration )
            {
                for (i = 1; i < drawpatharray.size; i++) {
                    var_7b8c6389c2a19ab1[ i - 1 ] = drawpatharray[ i ];
                }
            }
            else
            {
                var_7b8c6389c2a19ab1 = drawpatharray;
            }
            
            if ( isdefined( self ) && isdefined( self.origin ) && function_5b8457b9d8edb521( self ) == 0 )
            {
                var_7b8c6389c2a19ab1[ var_7b8c6389c2a19ab1.size ] = self.origin;
            }
            
            drawpatharray = var_7b8c6389c2a19ab1;
            function_fc51b1db9f1aa696( color, depthtest, drawpatharray, offset );
            framecount++;
            waitframe();
        }
    }

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0x1118
    // Size: 0xc3, Type: dev
    function snd_drawpath( movingobject, color, depthtest, duration, offset )
    {
        color = default_to( color, ( 1, 1, 1 ) );
        depthtest = default_to( depthtest, 0 );
        duration = default_to( duration, 5 );
        
        if ( function_110d3ab280057f5b( !isdefined( movingobject ), "<dev string:xda>" ) )
        {
            return;
        }
        
        if ( istrue( level.snd.var_ab52ccadc04df539 ) )
        {
            duration = int( 60 * duration );
        }
        else
        {
            duration = int( 20 * duration );
        }
        
        assert( duration > 2, "<dev string:xff>" );
        movingobject thread function_e58246b402adf0b1( color, depthtest, duration, offset );
    }

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 7, eflags: 0x0
    // Checksum 0x0, Offset: 0x11e3
    // Size: 0x248, Type: dev
    function function_35b7df275c1ba312( origin, angles, extents, color, alpha, depthtest, duration )
    {
        half = extents * 0.5;
        halv = ( half, half, half );
        mins = origin - halv;
        maxs = origin + halv;
        side1[ 0 ] = ( maxs[ 0 ], maxs[ 1 ], maxs[ 2 ] );
        side1[ 1 ] = ( maxs[ 0 ], maxs[ 1 ], mins[ 2 ] );
        side1[ 2 ] = ( mins[ 0 ], maxs[ 1 ], mins[ 2 ] );
        side1[ 3 ] = ( mins[ 0 ], maxs[ 1 ], maxs[ 2 ] );
        side2[ 0 ] = ( maxs[ 0 ], mins[ 1 ], maxs[ 2 ] );
        side2[ 1 ] = ( maxs[ 0 ], mins[ 1 ], mins[ 2 ] );
        side2[ 2 ] = ( mins[ 0 ], mins[ 1 ], mins[ 2 ] );
        side2[ 3 ] = ( mins[ 0 ], mins[ 1 ], maxs[ 2 ] );
        
        if ( angles != ( 0, 0, 0 ) )
        {
            side1[ 0 ] = origin + rotatevector( origin - side1[ 0 ], angles );
            side1[ 1 ] = origin + rotatevector( origin - side1[ 1 ], angles );
            side1[ 2 ] = origin + rotatevector( origin - side1[ 2 ], angles );
            side1[ 3 ] = origin + rotatevector( origin - side1[ 3 ], angles );
            side2[ 0 ] = origin + rotatevector( origin - side2[ 0 ], angles );
            side2[ 1 ] = origin + rotatevector( origin - side2[ 1 ], angles );
            side2[ 2 ] = origin + rotatevector( origin - side2[ 2 ], angles );
            side2[ 3 ] = origin + rotatevector( origin - side2[ 3 ], angles );
        }
        
        for (i = 0; i < 4; i++) {
            j = i + 1;
            
            if ( j == 4 )
            {
                j = 0;
            }
            
            line( side1[ i ], side1[ j ], color, alpha, depthtest, duration );
            line( side2[ i ], side2[ j ], color, alpha, depthtest, duration );
            line( side1[ i ], side2[ i ], color, alpha, depthtest, duration );
        }
    }

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 7, eflags: 0x0
    // Checksum 0x0, Offset: 0x1433
    // Size: 0x4d, Type: dev
    function cube( origin, angles, sidelength, color, alpha, depthtest, duration )
    {
        function_35b7df275c1ba312( origin, angles, sidelength, color, alpha, depthtest, duration );
    }

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 7, eflags: 0x0
    // Checksum 0x0, Offset: 0x1488
    // Size: 0x1fd, Type: dev
    function debugcrosshair( origin, size, angles, color, alpha, depthtest, duration )
    {
        forward = ( 1, 0, 0 );
        right = ( 0, 1, 0 );
        up = ( 0, 0, 1 );
        size = default_to( size, 16 );
        angles = default_to( angles, ( 0, 0, 0 ) );
        color = default_to( color, ( 1, 1, 1 ) );
        alpha = default_to( alpha, 1 );
        depthtest = default_to( depthtest, 0 );
        duration = default_to( duration, 1 );
        
        if ( angles != ( 0, 0, 0 ) )
        {
            forward = anglestoforward( angles );
            right = anglestoright( angles ) * -1;
            up = anglestoup( angles );
        }
        
        half = size * 0.5;
        forward *= half;
        right *= half;
        up *= half;
        mulc = 0.333;
        mulv = ( mulc, mulc, mulc );
        colr = color * mulv + ( 1, 0, 0 );
        colg = color * mulv + ( 0, 1, 0 );
        colb = color * mulv + ( 0, 0, 1 );
        line( origin - forward, origin + forward, colr, alpha, depthtest, duration );
        line( origin - right, origin + right, colg, alpha, depthtest, duration );
        line( origin - up, origin + up, colb, alpha, depthtest, duration );
    }

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 8, eflags: 0x0
    // Checksum 0x0, Offset: 0x168d
    // Size: 0x229, Type: dev
    function debugarrow( origin, angles, length, headsize, color, alpha, depthtest, duration )
    {
        assert( isvector( origin ) );
        assert( isvector( angles ) );
        length = default_to( length, 12 );
        headsize = default_to( headsize, 4 );
        color = default_to( color, ( 1, 1, 1 ) );
        alpha = default_to( alpha, 1 );
        depthtest = default_to( depthtest, 0 );
        duration = int( default_to( duration, 1 ) );
        arrow_forward = anglestoforward( angles );
        arrowhead_forward = arrow_forward;
        arrowhead_right = anglestoright( angles );
        arrowhead_up = anglestoup( angles );
        arrowhead_down = arrowhead_up;
        arrow_forward = vectorscale( arrow_forward, length );
        arrowhead_forward = vectorscale( arrowhead_forward, length - headsize );
        arrowhead_right = vectorscale( arrowhead_right, headsize );
        arrowhead_up = vectorscale( arrowhead_up, headsize );
        arrowhead_down = vectorscale( arrowhead_down, -1 * headsize );
        o = origin;
        a = o + arrow_forward;
        b = o + arrowhead_forward - arrowhead_right;
        c = o + arrowhead_forward + arrowhead_right;
        d = o + arrowhead_forward + arrowhead_up;
        e = o + arrowhead_forward + arrowhead_down;
        line( o, a, color, alpha, depthtest, duration );
        line( a, b, color, alpha, depthtest, duration );
        line( b, c, color, alpha, depthtest, duration );
        line( c, a, color, alpha, depthtest, duration );
        line( a, d, color, alpha, depthtest, duration );
        line( d, e, color, alpha, depthtest, duration );
        line( e, a, color, alpha, depthtest, duration );
    }

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 6, eflags: 0x0
    // Checksum 0x0, Offset: 0x18be
    // Size: 0x56, Type: dev
    function linesphere( origin, radius, color, alpha, depthtest, duration )
    {
        depthtest = default_to( depthtest, 0 );
        duration = default_to( duration, 1 );
        sphere( origin, radius, color, depthtest, duration );
    }

#/

// Namespace snd_draw / namespace_b5325e4326813876
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x191c
// Size: 0x1c
function function_1589f10b96600d0f( screenheight )
{
    var_c67e2413c92619a6 = 480 / screenheight;
    return var_c67e2413c92619a6;
}

// Namespace snd_draw / namespace_b5325e4326813876
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1941
// Size: 0x6d
function function_d6886acce6238019( var_b83b258fc6e7927c, screensize )
{
    screensize = default_to( screensize, function_d8bcdde57d13f7fc() );
    var_c67e2413c92619a6 = function_1589f10b96600d0f( screensize[ 1 ] );
    hudwidth = var_b83b258fc6e7927c[ 0 ] * var_c67e2413c92619a6;
    hudheight = var_b83b258fc6e7927c[ 1 ] * var_c67e2413c92619a6;
    return [ int( hudwidth ), int( hudheight ) ];
}

// Namespace snd_draw / namespace_b5325e4326813876
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19b7
// Size: 0xa2
function function_a540f05eecfe7e96( var_b83b258fc6e7927c, screensize )
{
    screensize = default_to( screensize, function_d8bcdde57d13f7fc() );
    var_c67e2413c92619a6 = function_1589f10b96600d0f( screensize[ 1 ] );
    hudx = var_b83b258fc6e7927c[ 0 ] * var_c67e2413c92619a6;
    hudy = var_b83b258fc6e7927c[ 1 ] * var_c67e2413c92619a6;
    screenaspect = screensize[ 0 ] / screensize[ 1 ];
    var_766fc6b1f18eeeab = screenaspect * 480;
    hudxoffset = -0.5 * ( var_766fc6b1f18eeeab - 640 );
    hudx += hudxoffset;
    return [ hudx, hudy ];
}

// Namespace snd_draw / namespace_b5325e4326813876
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1a62
// Size: 0x15a
function private function_55792e20398965bf()
{
    if ( isdefined( level.snd.var_4893b4259503b919 ) )
    {
        return;
    }
    
    level.snd.var_4893b4259503b919 = getthread();
    
    while ( isdefined( level.snd.debughuds ) )
    {
        now = gettime();
        var_d09fe962dd2b94c6 = [];
        
        foreach ( hud in level.snd.debughuds )
        {
            assert( function_5b8457b9d8edb521( hud ) == 0 );
            
            if ( hud.duration > 0 )
            {
                var_d09fe962dd2b94c6[ var_d09fe962dd2b94c6.size ] = hud;
                
                if ( hud.time == now )
                {
                    continue;
                }
                
                hud.duration -= 1;
                
                if ( hud.timeofdeath <= now )
                {
                    hud.alpha = 0;
                    hud settext( "" );
                }
                
                continue;
            }
            
            hud destroy();
        }
        
        level.snd.debughuds = var_d09fe962dd2b94c6;
        waitframe();
    }
}

// Namespace snd_draw / namespace_b5325e4326813876
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1bc4
// Size: 0x13a
function private function_bc5b7015df7542d1( duration )
{
    hud = undefined;
    now = gettime();
    timeofdeath = duration * 50;
    
    /#
        foreach ( hud in level.snd.debughuds )
        {
            assert( function_5b8457b9d8edb521( hud ) == 0 );
            
            if ( now >= hud.timeofdeath )
            {
                hud.time = now;
                hud.timeofdeath = now + timeofdeath;
                hud.duration = duration;
                return hud;
            }
        }
        
        hud = newhudelem();
        hud.time = now;
        hud.timeofdeath = now + timeofdeath;
        hud.duration = duration;
        index = level.snd.debughuds.size;
        level.snd.debughuds[ index ] = hud;
    #/
    
    return hud;
}

// Namespace snd_draw / namespace_b5325e4326813876
// Params 7, eflags: 0x4
// Checksum 0x0, Offset: 0x1d07
// Size: 0x237
function private function_b712ac81c5cb013b( posx, posy, text, color, alpha, scale, duration )
{
    hud_width = 640;
    hud_height = 480;
    var_4445d2b30afaabdb = hud_width / hud_height;
    var_4abd463c3a5d6022 = function_d8bcdde57d13f7fc();
    var_b835ae2157a354ac = var_4abd463c3a5d6022[ 0 ];
    var_67a206c222c5563b = var_4abd463c3a5d6022[ 1 ];
    var_2d6e500898a10090 = var_b835ae2157a354ac / var_67a206c222c5563b;
    widthoffset = -0.5 * ( hud_height * var_2d6e500898a10090 - hud_width );
    hudx = posx / var_b835ae2157a354ac * hud_width + ( 1 - posx / var_b835ae2157a354ac * 0.5 ) * widthoffset;
    hudy = posy / var_67a206c222c5563b * hud_height;
    assertex( isstruct( level.snd ), "snd was not initialized." );
    
    if ( isdefined( level.snd.debughuds ) == 0 )
    {
        level.snd.debughuds = [];
    }
    
    level thread function_55792e20398965bf();
    hud = function_bc5b7015df7542d1( duration );
    hud.x = hudx;
    hud.y = hudy;
    hud settext( text );
    hud.color = color;
    hud.alpha = alpha;
    hud.fontscale = scale * 0.5;
    hud.font = "smallfixed";
    hud.alignx = "left";
    hud.aligny = "bottom";
    hud.var_406fd34934f7e3d2 = "fullscreen";
    hud.vertalign = "fullscreen";
    hud.xoffset = 0;
    hud.yoffset = 0;
    hud.xpadding = 0;
    hud.ypadding = 0;
}

/#

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1f46
    // Size: 0x2c, Type: dev
    function private function_7c3d0b968c966668( num )
    {
        if ( num <= 9 && num >= 0 )
        {
            return ( "<dev string:x121>" + num );
        }
        
        return "<dev string:x1c>" + num;
    }

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 3, eflags: 0x4
    // Checksum 0x0, Offset: 0x1f7a
    // Size: 0x1bb, Type: dev
    function private function_9aaed43357848f20( framecount, fps, var_4e6d89fb533555bb )
    {
        assert( isdefined( framecount ) );
        
        if ( isdefined( fps ) == 0 )
        {
            fps = 20;
        }
        
        if ( isdefined( var_4e6d89fb533555bb ) == 0 )
        {
            var_4e6d89fb533555bb = 0;
        }
        
        totalseconds = int( framecount / fps );
        totalminutes = int( totalseconds / 60 );
        totalhours = int( totalminutes / 60 );
        totaldays = int( totalhours / 24 );
        frames = framecount % fps;
        var_9b51060e1a10fcbb = frames / fps * 100;
        seconds = totalseconds % 60;
        minutes = totalminutes % 60;
        hours = totalhours % 60;
        days = totaldays % 99;
        framesstring = function_7c3d0b968c966668( frames );
        var_5a6ff3568f35765e = function_7c3d0b968c966668( var_9b51060e1a10fcbb );
        secondsstring = function_7c3d0b968c966668( seconds );
        minutesstring = function_7c3d0b968c966668( minutes );
        hoursstring = function_7c3d0b968c966668( hours );
        daysstring = function_7c3d0b968c966668( days );
        var_85143a456ffcf2a0 = daysstring + "<dev string:x123>" + hoursstring + "<dev string:x123>" + minutesstring + "<dev string:x123>" + secondsstring;
        
        if ( var_4e6d89fb533555bb == 1 )
        {
            var_85143a456ffcf2a0 += "<dev string:x125>" + var_5a6ff3568f35765e;
        }
        else
        {
            var_85143a456ffcf2a0 += "<dev string:x123>" + framesstring;
        }
        
        return var_85143a456ffcf2a0;
    }

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 3, eflags: 0x4
    // Checksum 0x0, Offset: 0x213d
    // Size: 0x6d, Type: dev
    function private function_9313eda58ed29e3e( var_7cf09fa8c49859b, var_287879caa47775be, fps )
    {
        if ( isdefined( var_7cf09fa8c49859b ) == 0 )
        {
            var_7cf09fa8c49859b = 0;
        }
        
        assertex( var_7cf09fa8c49859b >= 0, "<dev string:x127>" );
        framestep = fps / 20;
        framecount = var_7cf09fa8c49859b;
        framecount += var_287879caa47775be * framestep;
        framecount = floor( framecount );
        framecount = int( framecount );
        return framecount;
    }

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x21b2
    // Size: 0x3f8, Type: dev
    function private function_2b151de570c1d056( var_7cf09fa8c49859b )
    {
        assert( isdefined( level.snd.timecode ) );
        
        if ( isdefined( var_7cf09fa8c49859b ) == 0 )
        {
            var_7cf09fa8c49859b = 0;
        }
        
        assertex( var_7cf09fa8c49859b >= 0, "<dev string:x127>" );
        framestep = level.snd.timecode.fps / 20;
        level.snd.timecode endon( "<dev string:x157>" );
        level.snd.timecode.isactive = 1;
        level.snd.timecode.framecount = 0;
        level.snd.timecode.var_7cf09fa8c49859b = var_7cf09fa8c49859b;
        
        while ( isdefined( level.snd.timecode ) && level.snd.timecode.isactive == 1 )
        {
            posx = level.snd.timecode.posx;
            posy = level.snd.timecode.posy;
            alpha = 1;
            scale = level.snd.timecode.scale;
            framecount = function_9313eda58ed29e3e( var_7cf09fa8c49859b, level.snd.timecode.framecount, level.snd.timecode.fps );
            var_85143a456ffcf2a0 = function_9aaed43357848f20( framecount, level.snd.timecode.fps );
            function_8c3a8f58cbd39dca( posx, posy, var_85143a456ffcf2a0, ( 1, 1, 1 ), alpha, scale, 1 );
            
            if ( level.snd.timecode.marksarray.size > 0 )
            {
                posy += scale * 12;
                function_8c3a8f58cbd39dca( posx, posy, "<dev string:x169>", ( 1, 1, 1 ), alpha, scale, 1 );
                posy += scale * 12;
                
                foreach ( mark in level.snd.timecode.marksarray )
                {
                    markstring = mark[ 1 ];
                    var_66f170dfaea4c0f8 = function_9313eda58ed29e3e( var_7cf09fa8c49859b, mark[ 0 ], level.snd.timecode.fps );
                    timecode = function_9aaed43357848f20( var_66f170dfaea4c0f8, level.snd.timecode.fps );
                    marksstring = timecode + "<dev string:x178>" + markstring + "<dev string:x6b>";
                    function_8c3a8f58cbd39dca( posx, posy, marksstring, ( 1, 1, 1 ), alpha, scale, 1 );
                    posy += scale * 12;
                }
            }
            
            level.snd.timecode.framecount += 1;
            waitframe();
        }
    }

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x25b2
    // Size: 0x157, Type: dev
    function function_b6bd12cc4f34415e()
    {
        if ( isdefined( level.snd.timecode ) == 0 )
        {
            return;
        }
        
        level.snd.timecode notify( "<dev string:x157>" );
        level.snd.timecode.isactive = 0;
        level.snd.timecode.isvisible = 0;
        var_66f170dfaea4c0f8 = function_9313eda58ed29e3e( level.snd.timecode.var_7cf09fa8c49859b, level.snd.timecode.framecount, level.snd.timecode.fps );
        timecode = function_9aaed43357848f20( var_66f170dfaea4c0f8, level.snd.timecode.fps );
        markstring = timecode + "<dev string:x17c>";
        println( markstring );
        level.snd.timecode.marksarray = undefined;
        level.snd.timecode = undefined;
    }

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x2711
    // Size: 0x150, Type: dev
    function function_d24a92cfbc477ca7( text )
    {
        if ( isdefined( level.snd.timecode ) == 0 )
        {
            function_5177fa294d4fe5cd();
        }
        
        var_e6d566083f4ec4ba = level.snd.timecode.marksarray.size;
        level.snd.timecode.marksarray[ var_e6d566083f4ec4ba ] = [ level.snd.timecode.framecount, text ];
        var_66f170dfaea4c0f8 = function_9313eda58ed29e3e( level.snd.timecode.var_7cf09fa8c49859b, level.snd.timecode.framecount, level.snd.timecode.fps );
        timecode = function_9aaed43357848f20( var_66f170dfaea4c0f8, level.snd.timecode.fps );
        markstring = timecode + "<dev string:x178>" + text;
        println( markstring );
    }

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2869
    // Size: 0x92, Type: dev
    function function_4680808ae4ce7935()
    {
        if ( isdefined( level.snd.timecode ) && isdefined( level.snd.timecode.marksarray ) )
        {
            for (i = 0; i < level.snd.timecode.marksarray.size; i++) {
                level.snd.timecode.marksarray[ i ] = undefined;
            }
        }
    }

    // Namespace snd_draw / namespace_b5325e4326813876
    // Params 6, eflags: 0x0
    // Checksum 0x0, Offset: 0x2903
    // Size: 0x26e, Type: dev
    function function_5177fa294d4fe5cd( var_ada09577e62e45ee, scale, posx, posy, var_4e6d89fb533555bb, var_7cf09fa8c49859b )
    {
        isvisible = 1;
        assertex( isstruct( level.snd ), "<dev string:x29>" );
        
        if ( isdefined( level.snd.timecode ) )
        {
            function_b6bd12cc4f34415e();
        }
        
        assert( isdefined( level.snd.timecode ) == 0 );
        level.snd.timecode = spawnstruct();
        level.snd.timecode.marksarray = [];
        
        if ( isdefined( var_ada09577e62e45ee ) == 0 )
        {
            var_ada09577e62e45ee = 20;
        }
        
        if ( isdefined( scale ) == 0 )
        {
            scale = 2;
        }
        
        scale /= 1;
        var_4abd463c3a5d6022 = function_d8bcdde57d13f7fc();
        var_b835ae2157a354ac = var_4abd463c3a5d6022[ 0 ];
        var_67a206c222c5563b = var_4abd463c3a5d6022[ 1 ];
        var_f46497512c0f2957 = 6 * 14 * scale;
        centerx = var_b835ae2157a354ac * 0.5 - var_f46497512c0f2957 * 0.5;
        centery = var_67a206c222c5563b * 0.5 - 12 * 0.5;
        
        if ( isdefined( posx ) == 0 )
        {
            posx = centerx;
        }
        
        if ( isdefined( posy ) == 0 )
        {
            centeroffset = 192;
            posy = centery + centeroffset;
        }
        
        level.snd.timecode.posx = posx;
        level.snd.timecode.posy = posy;
        level.snd.timecode.scale = scale;
        level.snd.timecode.fps = var_ada09577e62e45ee;
        level.snd.timecode.isvisible = isvisible;
        level.snd.timecode.var_4e6d89fb533555bb = var_4e6d89fb533555bb;
        level.snd.timecode thread function_2b151de570c1d056( var_7cf09fa8c49859b );
    }

#/
