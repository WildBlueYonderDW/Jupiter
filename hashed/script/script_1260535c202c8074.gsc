// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;
#using scripts\common\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\ai.gsc;
#using script_36d7680b337b15b;
#using script_7edf952f8921aa6b;

#namespace namespace_dc76b323a42dffcd;

// Namespace namespace_dc76b323a42dffcd/namespace_3ee1bcf1bebb6728
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x115
// Size: 0x61
function function_14c91797faca36ea() {
    self.var_544ffa1d219d6810 = undefined;
    self.var_a60b211ca1cf2a4e = 0;
    self.var_cadb0f258ae78683 = 400;
    self.var_ee9e6782a568c4b8 = (0, 0, 0);
    self.var_fbef01b91da52bb4 = (0, 0, 0);
    thread function_b0e7001af987a581();
    /#
        function_ac58fa04e888ee59();
    #/
}

// Namespace namespace_dc76b323a42dffcd/namespace_3ee1bcf1bebb6728
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17d
// Size: 0x132
function private function_c40494a8d15caec5() {
    self endon("death");
    self endon("head_banger_end");
    self.var_ee9e6782a568c4b8 = function_1e6eb451a42c6428();
    while (1) {
        var_3e77cb39c95ba5c = getdvarfloat(@"hash_a306914883c4c84c", 1);
        self.var_fbef01b91da52bb4 = vectorlerp(self.var_fbef01b91da52bb4, self.var_ee9e6782a568c4b8, var_3e77cb39c95ba5c * level.framedurationseconds);
        self.var_a60b211ca1cf2a4e = remap(self.var_fbef01b91da52bb4[0], -1, 1, -10, 10);
        self.var_cadb0f258ae78683 = remap(self.var_fbef01b91da52bb4[1], -1, 1, 500, 1000);
        self function_a490fd20800374d8(self.var_a60b211ca1cf2a4e);
        self function_12df4eebdbb4f79(self.var_cadb0f258ae78683);
        /#
            if (function_f21916a31744af3d()) {
                head_pos = self gettagorigin("<unknown string>");
                line(self.origin, head_pos, (1, 0, 0));
                function_ded744d746e2760b("<unknown string>" + distance2d(self.origin, head_pos), head_pos);
            }
        #/
        waitframe();
    }
}

// Namespace namespace_dc76b323a42dffcd/namespace_3ee1bcf1bebb6728
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b6
// Size: 0x47
function private function_b0e7001af987a581() {
    self endon("death");
    while (1) {
        self waittill("head_banger_start");
        thread function_c40494a8d15caec5();
        thread function_6a5dc7d9a0e40afd();
        ai::function_3e5ce428974325fb("head_banger_cooldown", getdvarint(@"hash_8d491b8262cfd18c", 15000));
    }
}

// Namespace namespace_dc76b323a42dffcd/namespace_3ee1bcf1bebb6728
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x304
// Size: 0xbc
function private function_6a5dc7d9a0e40afd() {
    self endon("death");
    self endon("head_banger_start");
    self endon("head_banger_end");
    var_4c7853a34cd074cf = [[ self.var_c54a21ea717fe8a5 ]]();
    while (1) {
        self waittill("head_banger_hit");
        head_pos = self gettagorigin("j_head");
        self.var_ee9e6782a568c4b8 = function_1e6eb451a42c6428();
        self setscriptablepartstate("audio", "headbanger_impact");
        damage = 2000;
        if (istrue(self.var_fa1a1806d30a40e1) && var_4c7853a34cd074cf >= 0.5 && self.var_f8adf1aaec88d636 > 1) {
            damage = damage * 10;
        }
        function_6c917394118c12ea(0, 800, damage);
    }
}

// Namespace namespace_dc76b323a42dffcd/namespace_3ee1bcf1bebb6728
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x3c7
// Size: 0x38
function private function_832a9a6b9710311b(player, var_5c0efef7a4d33535) {
    player function_2861d9b80e013196(player.origin - var_5c0efef7a4d33535, 400);
    player playrumbleonentity("heavy_1s");
}

// Namespace namespace_dc76b323a42dffcd/namespace_3ee1bcf1bebb6728
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x406
// Size: 0x42
function private function_1e6eb451a42c6428() {
    target_point = (randomfloat(1) - 0.5, randomfloat(1) - 0.5, 0);
    target_point = rotatepointaroundvector((0, 0, 1), target_point, 45);
    return target_point;
}

// Namespace namespace_dc76b323a42dffcd/namespace_3ee1bcf1bebb6728
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x450
// Size: 0x45
function function_ac58fa04e888ee59() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_c81577b184a48779);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_6eb4d0ea6eb40878);
        function_fe953f000498048f();
    #/
}

// Namespace namespace_dc76b323a42dffcd/namespace_3ee1bcf1bebb6728
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x49c
// Size: 0x46
function private function_c81577b184a48779() {
    /#
        var_33a6ac144efb85a6 = function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<unknown string>");
        if (!isdefined(var_33a6ac144efb85a6)) {
            return;
        }
        var_33a6ac144efb85a6 function_3e89eb3d8e3f1811("<unknown string>", 1);
    #/
}

// Namespace namespace_dc76b323a42dffcd/namespace_3ee1bcf1bebb6728
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4e9
// Size: 0x18
function private function_f21916a31744af3d() {
    /#
        return getdvarint(@"hash_2602a364f90130b2", 0) > 0;
    #/
}

// Namespace namespace_dc76b323a42dffcd/namespace_3ee1bcf1bebb6728
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x508
// Size: 0x1b
function private function_6eb4d0ea6eb40878() {
    /#
        function_2fb888667001fc39("<unknown string>", @"hash_2602a364f90130b2");
    #/
}

// Namespace namespace_dc76b323a42dffcd/namespace_3ee1bcf1bebb6728
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x52a
// Size: 0x5b
function private function_ded744d746e2760b(text, pos) {
    /#
        if (function_f21916a31744af3d()) {
            pos = function_53c4c53197386572(pos, self.origin + (0, 0, 70));
            print3d(pos, "<unknown string>" + text, (1, 0, 0));
        }
    #/
}

