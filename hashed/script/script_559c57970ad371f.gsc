// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_65f58f3c394dcf9a;

#namespace namespace_aed319c762c2b87c;

// Namespace namespace_aed319c762c2b87c/namespace_fbe0d13c598c2ab5
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x80
// Size: 0x58
function private function_17495f409b110fff(text, var_db85e7b6b9fb517e, var_a56227b8efdaf514) {
    /#
        var_a56227b8efdaf514 = function_53c4c53197386572(var_a56227b8efdaf514, 0);
        while (isstring(text) && text.size < var_db85e7b6b9fb517e) {
            if (var_a56227b8efdaf514) {
                text = "<unknown string>" + text;
            } else {
                text = text + "<unknown string>";
            }
        }
        return text;
    #/
}

// Namespace namespace_aed319c762c2b87c/namespace_fbe0d13c598c2ab5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdf
// Size: 0x5c
function function_23e1b955d1a7c9a1(text) {
    /#
        if (isarray(text)) {
            return text;
        }
        if (isnumber(text)) {
            return [0:"<unknown string>" + text];
        }
        if (isstring(text)) {
            if (issubstr(text, "<unknown string>")) {
                return strtok(text, "<unknown string>");
            }
            return [0:text];
        }
        return [];
    #/
}

// Namespace namespace_aed319c762c2b87c/namespace_fbe0d13c598c2ab5
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x142
// Size: 0x147
function private function_f034cfbc42d3956f(state) {
    /#
        state = function_53c4c53197386572(state, "<unknown string>");
        color = undefined;
        /#
            assertex(isstring(state), "<unknown string>");
        #/
        switch (state) {
        case #"hash_d2a4c56b6b9ff274":
        default:
            color = (randomfloatrange(0.5, 1), randomfloatrange(0.5, 1), randomfloatrange(0.5, 1));
            break;
        case #"hash_1c39674e5b0de0f3":
        case #"hash_4d6a329017fe1bd0":
        case #"hash_9128327eb51e0b7b":
        case #"hash_c6076a90d1a76064":
            color = (0.5, 1, 0.5);
            break;
        case #"hash_186d745a92c317d9":
        case #"hash_21c69ec47c409a66":
            color = (1, 1, 0.333);
            break;
        case #"hash_2d1406e602f0875d":
        case #"hash_9e02cd4a0f3ca981":
            color = (1, 0.5, 0.5);
            break;
        case #"hash_cf14c509efeb3c87":
            color = (0.2, 0.2, 0.2);
            break;
        }
        return color;
    #/
}

// Namespace namespace_aed319c762c2b87c/namespace_fbe0d13c598c2ab5
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x290
// Size: 0x10f
function private function_6c0578d086f3d6b9(ent) {
    /#
        /#
            assertex(isent(ent), "<unknown string>");
        #/
        var_592693dd118f7c52 = getdvarint(@"hash_f86fbee6ae5321ec", "<unknown string>");
        if (istrue(var_592693dd118f7c52)) {
            var_e52f572dfadb149f = undefined;
            var_e23b09de2e27ed9 = undefined;
            if (isstruct(ent.var_566868292ee2a1b)) {
                var_e52f572dfadb149f = ent.var_566868292ee2a1b.var_56524c0776d62d8c;
                var_e23b09de2e27ed9 = ent.var_566868292ee2a1b.var_1910de7604c2d4a0;
            }
            return namespace_b1b96b070bb1349c::function_2d29365e60139df1(ent, var_e52f572dfadb149f, var_e23b09de2e27ed9);
        }
        if (isagent(ent) && isstring(ent.alertlevel)) {
            return ent.alertlevel;
        } else if (ent.classname == "<unknown string>" && isstring(ent.currentstate)) {
            return ent.currentstate;
        }
        return "<unknown string>";
    #/
}

// Namespace namespace_aed319c762c2b87c/namespace_fbe0d13c598c2ab5
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3a6
// Size: 0x62
function private function_806b0eaacf7b76e9(var_566868292ee2a1b) {
    /#
        /#
            assertex(isstruct(var_566868292ee2a1b), "<unknown string>");
        #/
        if (istrue(var_566868292ee2a1b.killed)) {
            return "<unknown string>";
        } else if (isdefined(var_566868292ee2a1b.boss)) {
            return function_6c0578d086f3d6b9(var_566868292ee2a1b.boss);
        }
        return "<unknown string>";
    #/
}

// Namespace namespace_aed319c762c2b87c/namespace_fbe0d13c598c2ab5
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x40f
// Size: 0xb4
function private function_6d8e5c7e9ef61fc2(x, y, text, color, scale) {
    /#
        color = function_53c4c53197386572(color, (1, 1, 1));
        scale = function_53c4c53197386572(scale, 1);
        text = function_23e1b955d1a7c9a1(text);
        yy = y;
        if (isarray(text)) {
            for (i = 0; i < text.size; i++) {
                yy = y + 16 * scale * i;
                var_afe3ca01808d2595 = text[i];
                printtoscreen2d(x, yy, var_afe3ca01808d2595, color, scale, 1);
            }
        }
        return yy;
    #/
}

// Namespace namespace_aed319c762c2b87c/namespace_fbe0d13c598c2ab5
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4ca
// Size: 0xcf
function function_16b7675a3ef3d04f(origin, text, color, scale) {
    /#
        if (!isvector(origin)) {
            return;
        }
        color = function_53c4c53197386572(color, (1, 1, 1));
        scale = function_53c4c53197386572(scale, 1);
        text = function_23e1b955d1a7c9a1(text);
        if (isarray(text)) {
            for (i = 0; i < text.size; i++) {
                var_ce322078f5862173 = text.size - 1 - i;
                var_40d9fe304f4b7c59 = origin + (0, 0, 14 * scale * var_ce322078f5862173);
                var_afe3ca01808d2595 = text[i];
                print3d(var_40d9fe304f4b7c59, var_afe3ca01808d2595, color, 1, scale, 1, 1);
            }
        }
    #/
}

// Namespace namespace_aed319c762c2b87c/namespace_fbe0d13c598c2ab5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5a0
// Size: 0x92
function function_d9799cc056122ed7(boss, name, state) {
    /#
        name = function_17495f409b110fff(function_53c4c53197386572(name, "<unknown string>"), 12, 1);
        health = function_17495f409b110fff(boss.health + "<unknown string>", 10, 1);
        state = function_17495f409b110fff(function_53c4c53197386572(state, "<unknown string>"), 10, 0);
        text = name + "<unknown string>" + health + "<unknown string>" + state;
        return text;
    #/
}

// Namespace namespace_aed319c762c2b87c/namespace_fbe0d13c598c2ab5
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x639
// Size: 0x82
function function_17d9f3785bf1042(x, y, text, color, scale, index) {
    /#
        scale = 1.25;
        index = function_53c4c53197386572(index, 0);
        var_3e453a0b525760e = 16 * scale;
        xx = x;
        yy = y + var_3e453a0b525760e * index;
        function_6d8e5c7e9ef61fc2(xx, yy, text, color, scale);
    #/
}

// Namespace namespace_aed319c762c2b87c/namespace_fbe0d13c598c2ab5
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x6c2
// Size: 0x1fb
function function_ebd5555b105d2c99(var_aed74300daf62896, var_566868292ee2a1b, x, y, index) {
    /#
        x = int(function_53c4c53197386572(x, 360));
        y = int(function_53c4c53197386572(y, 40));
        index = int(function_53c4c53197386572(index, 0));
        if (isdefined(var_566868292ee2a1b) && isdefined(var_566868292ee2a1b.boss)) {
            boss = var_566868292ee2a1b.boss;
            state = function_806b0eaacf7b76e9(var_566868292ee2a1b);
            text = function_d9799cc056122ed7(boss, var_aed74300daf62896.name, state);
            color = function_f034cfbc42d3956f(state);
            function_17d9f3785bf1042(x, y, text, color, 1, index);
            index = index + 1;
            if (isdefined(var_566868292ee2a1b.var_8a28fd9df2f03764)) {
                var_8a28fd9df2f03764 = var_566868292ee2a1b.var_8a28fd9df2f03764;
                state = function_6c0578d086f3d6b9(var_8a28fd9df2f03764);
                text = function_d9799cc056122ed7(var_8a28fd9df2f03764, "<unknown string>", state);
                color = function_f034cfbc42d3956f(state);
                function_17d9f3785bf1042(x, y, text, color, 1, index);
                index = index + 1;
            }
            if (isarray(boss.var_f78a17463eebcb84)) {
                foreach (minion in boss.var_f78a17463eebcb84) {
                    state = function_6c0578d086f3d6b9(minion);
                    text = function_d9799cc056122ed7(minion, minion.name, state);
                    color = function_f034cfbc42d3956f(state);
                    function_17d9f3785bf1042(x, y, text, color, 1, index);
                    index = index + 1;
                }
            }
        }
        return index;
    #/
}

// Namespace namespace_aed319c762c2b87c/namespace_fbe0d13c598c2ab5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8c4
// Size: 0x74
function function_d974aec0560c2d96(boss, name, state) {
    /#
        health = boss.health + "<unknown string>";
        name = function_53c4c53197386572(name, "<unknown string>");
        state = function_53c4c53197386572(state, "<unknown string>");
        text = [0:name, 1:health, 2:state];
        return text;
    #/
}

// Namespace namespace_aed319c762c2b87c/namespace_fbe0d13c598c2ab5
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x93f
// Size: 0xf1
function function_d75ea89dee2f86f4(origin, text, color, height, radius) {
    /#
        if (!isvector(origin)) {
            return;
        }
        color = function_53c4c53197386572(color, (0.5, 1, 0.5));
        height = function_53c4c53197386572(height, 72);
        radius = function_53c4c53197386572(radius, 24);
        var_ddf609ecde1c1031 = origin + (0, 0, 6);
        var_5fde3b7ca3518087 = origin + (0, 0, height);
        var_273d881b2c3e0e0f = origin + (0, 0, height + 16);
        var_273d871b2c3e0bdc = origin + (0, 0, height + 32);
        cylinder(origin, var_ddf609ecde1c1031, radius, color, 0, 1);
        line(origin, var_5fde3b7ca3518087, color, 1, 0, 1);
        function_16b7675a3ef3d04f(var_5fde3b7ca3518087, text, color, 1);
    #/
}

// Namespace namespace_aed319c762c2b87c/namespace_fbe0d13c598c2ab5
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xa37
// Size: 0xdb
function function_520b0777b699630b(origin, angles, text, color, radius, var_e9136a3ae00f9e47) {
    /#
        if (!isvector(origin)) {
            return;
        }
        color = function_53c4c53197386572(color, (0.5, 1, 0.5));
        var_5fde3b7ca3518087 = origin + (0, 0, 36);
        var_114b38af845250 = origin + (0, 0, -60);
        radius = function_53c4c53197386572(radius, 360);
        var_e9136a3ae00f9e47 = function_53c4c53197386572(var_e9136a3ae00f9e47, (320, 80, 80));
        cylinder(origin, var_5fde3b7ca3518087, radius, color, 0, 1);
        orientedbox(var_114b38af845250, var_e9136a3ae00f9e47, angles, color, 0, 1);
        function_16b7675a3ef3d04f(var_5fde3b7ca3518087, text, color, 4);
    #/
}

// Namespace namespace_aed319c762c2b87c/namespace_fbe0d13c598c2ab5
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xb19
// Size: 0xe4
function function_c9ef0d1abb4b9396(origin, angles, text, color, var_e9136a3ae00f9e47) {
    /#
        if (!isvector(origin)) {
            return;
        }
        var_e9136a3ae00f9e47 = function_53c4c53197386572(var_e9136a3ae00f9e47, (192, 80, 80));
        color = function_53c4c53197386572(color, (0.5, 1, 0.5));
        origin = origin + (0, 0, -24);
        var_5fde3b7ca3518087 = origin + (0, 0, 96);
        var_114b38af845250 = origin + (0, 0, var_e9136a3ae00f9e47[2] * 0.5);
        orientedbox(var_114b38af845250, var_e9136a3ae00f9e47, angles, color, 0, 1);
        line(origin, var_5fde3b7ca3518087, color, 1, 0, 1);
        function_16b7675a3ef3d04f(var_5fde3b7ca3518087, text, color, 1);
    #/
}

// Namespace namespace_aed319c762c2b87c/namespace_fbe0d13c598c2ab5
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xc04
// Size: 0xe4
function function_6cec87bd99735fe5(origin, angles, text, color, var_e9136a3ae00f9e47) {
    /#
        if (!isvector(origin)) {
            return;
        }
        var_e9136a3ae00f9e47 = function_53c4c53197386572(var_e9136a3ae00f9e47, (64, 40, 26));
        color = function_53c4c53197386572(color, (0.5, 1, 0.5));
        origin = origin + (0, 0, 3);
        var_5fde3b7ca3518087 = origin + (0, 0, 54);
        var_114b38af845250 = origin + (0, 0, var_e9136a3ae00f9e47[2] * 0.5);
        orientedbox(var_114b38af845250, var_e9136a3ae00f9e47, angles, color, 0, 1);
        line(origin, var_5fde3b7ca3518087, color, 1, 0, 1);
        function_16b7675a3ef3d04f(var_5fde3b7ca3518087, text, color, 1);
    #/
}

// Namespace namespace_aed319c762c2b87c/namespace_fbe0d13c598c2ab5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xcef
// Size: 0x3b7
function function_ebd16f5b10596ff0(var_aed74300daf62896, var_566868292ee2a1b) {
    /#
        if (isdefined(var_566868292ee2a1b) && isdefined(var_566868292ee2a1b.boss)) {
            boss = var_566868292ee2a1b.boss;
            state = function_806b0eaacf7b76e9(var_566868292ee2a1b);
            if (isagent(boss)) {
                health = boss.health + "<unknown string>";
                name = function_53c4c53197386572(var_aed74300daf62896.name, "<unknown string>");
                text = function_d974aec0560c2d96(boss, var_aed74300daf62896.name, state);
                color = function_f034cfbc42d3956f(state);
                function_d75ea89dee2f86f4(boss.origin, text, color);
            } else if (boss.classname == "<unknown string>") {
                if (var_aed74300daf62896.name == "<unknown string>") {
                    health = boss.health + "<unknown string>";
                    name = function_53c4c53197386572(var_aed74300daf62896.name, "<unknown string>");
                    text = function_d974aec0560c2d96(boss, var_aed74300daf62896.name, state);
                    color = function_f034cfbc42d3956f(state);
                    function_520b0777b699630b(boss.origin, boss.angles, text, color);
                } else if (var_aed74300daf62896.name == "<unknown string>") {
                    health = boss.health + "<unknown string>";
                    name = function_53c4c53197386572(var_aed74300daf62896.name, "<unknown string>");
                    text = function_d974aec0560c2d96(boss, var_aed74300daf62896.name, state);
                    color = function_f034cfbc42d3956f(state);
                    function_c9ef0d1abb4b9396(boss.origin, boss.angles, text, color);
                } else {
                    var_e9136a3ae00f9e47 = (72, 36, 36);
                    var_114b38af845250 = boss.origin + (0, 0, var_e9136a3ae00f9e47[2] * 0.5);
                    text = function_d974aec0560c2d96(boss, var_aed74300daf62896.name, state);
                    color = function_f034cfbc42d3956f(state);
                    orientedbox(var_114b38af845250, var_e9136a3ae00f9e47, boss.angles, color, 0, 1);
                }
            }
            if (isdefined(var_566868292ee2a1b.var_8a28fd9df2f03764)) {
                var_8a28fd9df2f03764 = var_566868292ee2a1b.var_8a28fd9df2f03764;
                state = function_6c0578d086f3d6b9(var_8a28fd9df2f03764);
                name = "<unknown string>";
                text = function_d974aec0560c2d96(var_8a28fd9df2f03764, name, state);
                color = function_f034cfbc42d3956f(state);
                function_6cec87bd99735fe5(var_8a28fd9df2f03764.origin, var_8a28fd9df2f03764.angles, text, color);
            }
            if (isarray(boss.var_f78a17463eebcb84)) {
                index = 0;
                foreach (minion in boss.var_f78a17463eebcb84) {
                    state = function_6c0578d086f3d6b9(minion);
                    text = function_d974aec0560c2d96(minion, minion.name, state);
                    color = function_f034cfbc42d3956f(state);
                    height = 88 + 16 * index;
                    function_d75ea89dee2f86f4(minion.origin, text, color, height);
                    index = index + 1;
                }
            }
        }
    #/
}

// Namespace namespace_aed319c762c2b87c/namespace_fbe0d13c598c2ab5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10ad
// Size: 0x1ec
function function_b9d60dcb9d82b507() {
    /#
        var_8b4df762ec032bc7 = getdvar(@"hash_a32ed8b3f923aa2d", "<unknown string>");
        var_b78030b29a1c9dae = var_8b4df762ec032bc7 != "<unknown string>" && var_8b4df762ec032bc7 != "<unknown string>";
        var_6e5f901a7b46c1e8 = istrue(var_b78030b29a1c9dae) && var_8b4df762ec032bc7 != "<unknown string>" && var_8b4df762ec032bc7 != "<unknown string>" && var_8b4df762ec032bc7 != "<unknown string>";
        if (isarray(level.bosses) && istrue(var_b78030b29a1c9dae)) {
            var_aaaa8a8df8f5c537 = getdvarint(@"hash_b7c9a158890bce5a", 1920);
            var_ab5696f7e031e1ba = getdvarint(@"hash_9139b4ad2f235c95", 1080);
            x = 360;
            y = 60;
            index = 0;
            foreach (boss in level.bosses) {
                if (isstruct(boss) && isarray(boss.instances)) {
                    var_c1a8c050f22b2f27 = var_6e5f901a7b46c1e8 && issubstr(boss.name, var_8b4df762ec032bc7);
                    if (!var_6e5f901a7b46c1e8 || var_c1a8c050f22b2f27) {
                        foreach (var_566868292ee2a1b in boss.instances) {
                            function_ebd16f5b10596ff0(boss, var_566868292ee2a1b);
                            index = function_ebd5555b105d2c99(boss, var_566868292ee2a1b, x, y, index);
                        }
                    }
                }
            }
        }
    #/
}

