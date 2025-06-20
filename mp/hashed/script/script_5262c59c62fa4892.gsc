#using scripts\asm\asm;

#namespace cap_ai_revival;

// Namespace cap_ai_revival / namespace_55d2e8f86217c54a
// Params 3
// Checksum 0x0, Offset: 0x1aa
// Size: 0x5b, Type: bool
function function_a09401c58c128dc7( asmname, statename, params )
{
    var_47a4a726ad89e165 = absangleclamp180( self.revivetargetangles[ 1 ] - self.angles[ 1 ] );
    turnthresh = 45;
    
    if ( var_47a4a726ad89e165 > turnthresh )
    {
        return true;
    }
    
    return false;
}

// Namespace cap_ai_revival / namespace_55d2e8f86217c54a
// Params 3
// Checksum 0x0, Offset: 0x20e
// Size: 0x69
function function_85c5a3c3c6f345c4( asmname, statename, params )
{
    var_47a4a726ad89e165 = angleclamp180( self.revivetargetangles[ 1 ] - self.angles[ 1 ] );
    animindex = scripts\asm\asm::yawdiffto2468( var_47a4a726ad89e165 );
    turnanim = scripts\asm\asm::asm_lookupanimfromalias( statename, animindex );
    return turnanim;
}

// Namespace cap_ai_revival / namespace_55d2e8f86217c54a
// Params 3
// Checksum 0x0, Offset: 0x280
// Size: 0x84
function function_17d1a1ec59138f9a( asmname, statename, params )
{
    dyingguy = function_fa0aae45ce9c1727();
    self.var_3b3c2e088b48d1e2 = 6;
    self.damagedirsuffix = "_back";
    
    if ( isdefined( dyingguy ) )
    {
        self.var_3b3c2e088b48d1e2 = function_a1e95f167c3c1107( dyingguy, self );
        self.damagedirsuffix = dyingguy getdamagedirectionsuffix();
    }
    
    self notify( "reviving_intro_starts" );
    return scripts\asm\asm::asm_lookupanimfromalias( statename, self.var_3b3c2e088b48d1e2 );
}

// Namespace cap_ai_revival / namespace_55d2e8f86217c54a
// Params 3
// Checksum 0x0, Offset: 0x30d
// Size: 0x35
function function_16c469f0054f397e( asmname, statename, params )
{
    return scripts\asm\asm::asm_lookupanimfromalias( statename, self.var_3b3c2e088b48d1e2 + self.damagedirsuffix );
}

// Namespace cap_ai_revival / namespace_55d2e8f86217c54a
// Params 3
// Checksum 0x0, Offset: 0x34b
// Size: 0x35
function function_bad4052c136a233e( asmname, statename, params )
{
    return scripts\asm\asm::asm_lookupanimfromalias( statename, self.var_3b3c2e088b48d1e2 + self.damagedirsuffix );
}

// Namespace cap_ai_revival / namespace_55d2e8f86217c54a
// Params 3
// Checksum 0x0, Offset: 0x389
// Size: 0x77
function function_de7e772f8f75b5e7( asmname, statename, params )
{
    helper = function_bc9015ad281a7a18();
    self.var_3b3c2e088b48d1e2 = 6;
    
    if ( isdefined( helper ) )
    {
        self.var_3b3c2e088b48d1e2 = function_a1e95f167c3c1107( self, helper );
    }
    
    self.damagedirsuffix = getdamagedirectionsuffix();
    return scripts\asm\asm::asm_lookupanimfromalias( statename, self.var_3b3c2e088b48d1e2 + self.damagedirsuffix );
}

// Namespace cap_ai_revival / namespace_55d2e8f86217c54a
// Params 3
// Checksum 0x0, Offset: 0x409
// Size: 0x35
function function_421eb5914b4e0e01( asmname, statename, params )
{
    return scripts\asm\asm::asm_lookupanimfromalias( statename, self.var_3b3c2e088b48d1e2 + self.damagedirsuffix );
}

// Namespace cap_ai_revival / namespace_55d2e8f86217c54a
// Params 3
// Checksum 0x0, Offset: 0x447
// Size: 0x35
function function_9b9513aae33ced31( asmname, statename, params )
{
    return scripts\asm\asm::asm_lookupanimfromalias( statename, self.var_3b3c2e088b48d1e2 + self.damagedirsuffix );
}

// Namespace cap_ai_revival / namespace_55d2e8f86217c54a
// Params 2
// Checksum 0x0, Offset: 0x485
// Size: 0x5a
function function_abc0c090a4a71a80( note, params )
{
    scriptablepart = "revival_helper_stim";
    
    if ( self isscriptable() && self getscriptablehaspart( scriptablepart ) )
    {
        statename = self asmgetcurrentstate( self.asmname );
        function_41d5881b0952a9d5( note, statename );
    }
}

// Namespace cap_ai_revival / namespace_55d2e8f86217c54a
// Params 3
// Checksum 0x0, Offset: 0x4e7
// Size: 0xc8
function function_c723942576c01fdc( asmname, statename, params )
{
    self.var_3b3c2e088b48d1e2 = 8;
    
    if ( isdefined( self.revivetarget ) )
    {
        totarget = self.revivetarget.origin - self.origin;
        var_47a4a726ad89e165 = angleclamp180( vectortoyaw( totarget ) - self.angles[ 1 ] );
        self.var_3b3c2e088b48d1e2 = scripts\asm\asm::yawdiffto2468( var_47a4a726ad89e165 );
    }
    
    stance = "";
    
    if ( self.currentpose == "crouch" )
    {
        stance = "_crouch";
    }
    
    return scripts\asm\asm::asm_lookupanimfromalias( statename, self.var_3b3c2e088b48d1e2 + stance );
}

// Namespace cap_ai_revival / namespace_55d2e8f86217c54a
// Params 3
// Checksum 0x0, Offset: 0x5b8
// Size: 0x4f
function function_8a538717dfbbb166( asmname, statename, params )
{
    self.var_3b3c2e088b48d1e2 = 6;
    self.damagedirsuffix = getdamagedirectionsuffix();
    return scripts\asm\asm::asm_lookupanimfromalias( statename, self.var_3b3c2e088b48d1e2 + self.damagedirsuffix );
}

// Namespace cap_ai_revival / namespace_55d2e8f86217c54a
// Params 2
// Checksum 0x0, Offset: 0x610
// Size: 0x5c
function function_27bee089d16bc7c2( note, params )
{
    switch ( note )
    {
        case #"hash_2c1d80fc22d55f17":
            self shoot( 100, self.revivetarget );
            self.var_f69704726b42b5c2 = gettime();
            self.revivetarget notify( "shot_by_revive_pistol" );
            return;
    }
}

// Namespace cap_ai_revival / namespace_55d2e8f86217c54a
// Params 2
// Checksum 0x0, Offset: 0x674
// Size: 0x3e
function function_a1e95f167c3c1107( from, to )
{
    angle = getangle( from, to );
    index = 6;
    
    if ( angle >= 0 )
    {
        index = 4;
    }
    
    return index;
}

// Namespace cap_ai_revival / namespace_55d2e8f86217c54a
// Params 0
// Checksum 0x0, Offset: 0x6bb
// Size: 0x91
function getdamagedirectionsuffix()
{
    forcedsuffix = function_d0ddf895ca401eba();
    
    if ( isdefined( forcedsuffix ) )
    {
        return forcedsuffix;
    }
    
    if ( self.var_10ec904bc7121440 )
    {
        return "";
    }
    
    if ( !isdefined( self.damageyaw ) )
    {
        return "_back";
    }
    
    yawabs = abs( self.damageyaw );
    
    if ( yawabs > 135 )
    {
        return "_belly";
    }
    else if ( yawabs < 45 )
    {
        return "_back";
    }
    else if ( self.damageyaw < 0 )
    {
        return "_r";
    }
    
    return "_l";
}

// Namespace cap_ai_revival / namespace_55d2e8f86217c54a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x755
// Size: 0x87
function private function_41d5881b0952a9d5( note, statename )
{
    self endon( "death" );
    self endon( statename + "_finished" );
    scriptablepart = "revival_helper_stim";
    
    if ( isstartstr( note, "stim_attach" ) )
    {
        if ( isrighthand( note ) )
        {
            self setscriptablepartstate( scriptablepart, "active_right" );
        }
        else
        {
            self setscriptablepartstate( scriptablepart, "active_left" );
        }
        
        return;
    }
    
    if ( isstartstr( note, "stim_detach" ) )
    {
        self setscriptablepartstate( scriptablepart, "default" );
    }
}

// Namespace cap_ai_revival / namespace_55d2e8f86217c54a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x7e4
// Size: 0x3f
function private isrighthand( note )
{
    res = 1;
    hand = getsubstr( note, 12 );
    
    if ( isdefined( hand ) && hand == "left" )
    {
        res = 0;
    }
    
    return res;
}

// Namespace cap_ai_revival / namespace_55d2e8f86217c54a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x82c
// Size: 0x2c
function private function_bc9015ad281a7a18()
{
    id = self function_92435c7a6ae85c3c();
    users = function_fce201c1f66b31b6( id, "reviving_guy" );
    return users[ 0 ];
}

// Namespace cap_ai_revival / namespace_55d2e8f86217c54a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x861
// Size: 0x2c
function private function_fa0aae45ce9c1727()
{
    id = self function_92435c7a6ae85c3c();
    users = function_fce201c1f66b31b6( id, "dying_guy" );
    return users[ 0 ];
}

// Namespace cap_ai_revival / namespace_55d2e8f86217c54a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x896
// Size: 0x73
function private getangle( guy, otherguy )
{
    if ( isdefined( guy ) && isdefined( otherguy ) )
    {
        pos = guy.origin;
        otherpos = otherguy.origin;
        var_fd24f036bf2a8475 = vectortoyaw( otherpos - pos );
        return angleclamp180( var_fd24f036bf2a8475 - guy.angles[ 1 ] );
    }
    
    return 0;
}

// Namespace cap_ai_revival / namespace_55d2e8f86217c54a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x912
// Size: 0xd1
function private function_d0ddf895ca401eba()
{
    if ( !isdefined( self.forcelongdeath ) )
    {
        return undefined;
    }
    
    switch ( self.forcelongdeath )
    {
        case 37:
        case 38:
        case 47:
        case 48:
            return "";
        case 39:
        case 40:
            return "_back";
        case 41:
        case 42:
            return "_belly";
        case 43:
        case 45:
            return "_l";
        case 44:
        case 46:
            return "_r";
    }
    
    return undefined;
}

