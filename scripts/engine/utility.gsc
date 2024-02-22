// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\engine\flags.gsc;
#using scripts\common\exploder.gsc;
#using scripts\common\createfx.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\anim.gsc;

#namespace utility;

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1879
// Size: 0xb7
function noself_func(func, parm1, parm2, parm3, parm4) {
    if (!isdefined(level.func)) {
        return;
    }
    if (!isdefined(level.func[func])) {
        return;
    }
    if (isdefined(parm4)) {
        builtin [[ level.func[func] ]](parm1, parm2, parm3, parm4);
        return;
    }
    if (isdefined(parm3)) {
        builtin [[ level.func[func] ]](parm1, parm2, parm3);
        return;
    }
    if (isdefined(parm2)) {
        builtin [[ level.func[func] ]](parm1, parm2);
        return;
    }
    if (isdefined(parm1)) {
        builtin [[ level.func[func] ]](parm1);
        return;
    }
    builtin [[ level.func[func] ]]();
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1937
// Size: 0xb4
function noself_func_return(func, parm1, parm2, parm3, parm4) {
    if (!isdefined(level.func)) {
        return undefined;
    }
    if (!isdefined(level.func[func])) {
        return undefined;
    }
    if (isdefined(parm4)) {
        return builtin [[ level.func[func] ]](parm1, parm2, parm3, parm4);
    }
    if (isdefined(parm3)) {
        return builtin [[ level.func[func] ]](parm1, parm2, parm3);
    }
    if (isdefined(parm2)) {
        return builtin [[ level.func[func] ]](parm1, parm2);
    }
    if (isdefined(parm1)) {
        return builtin [[ level.func[func] ]](parm1);
    }
    return builtin [[ level.func[func] ]]();
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19f3
// Size: 0xcb
function self_func(func, parm1, parm2, parm3, parm4, var_77895a5b8a625552) {
    if (!isdefined(level.func[func])) {
        return;
    }
    if (isdefined(var_77895a5b8a625552)) {
        return self builtin [[ level.func[func] ]](parm1, parm2, parm3, parm4, var_77895a5b8a625552);
    }
    if (isdefined(parm4)) {
        return self builtin [[ level.func[func] ]](parm1, parm2, parm3, parm4);
    }
    if (isdefined(parm3)) {
        return self builtin [[ level.func[func] ]](parm1, parm2, parm3);
    }
    if (isdefined(parm2)) {
        return self builtin [[ level.func[func] ]](parm1, parm2);
    }
    if (isdefined(parm1)) {
        return self builtin [[ level.func[func] ]](parm1);
    }
    return self builtin [[ level.func[func] ]]();
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ac6
// Size: 0xb1
function script_func(func, parm1, parm2, parm3, parm4) {
    if (!isdefined(level.func[func])) {
        return;
    }
    if (isdefined(parm4)) {
        return self [[ level.func[func] ]](parm1, parm2, parm3, parm4);
    } else if (isdefined(parm3)) {
        return self [[ level.func[func] ]](parm1, parm2, parm3);
    } else if (isdefined(parm2)) {
        return self [[ level.func[func] ]](parm1, parm2);
    } else if (isdefined(parm1)) {
        return self [[ level.func[func] ]](parm1);
    } else {
        return self [[ level.func[func] ]]();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b7e
// Size: 0x37
function randomvector(num) {
    return (randomfloat(num) - num * 0.5, randomfloat(num) - num * 0.5, randomfloat(num) - num * 0.5);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1bbd
// Size: 0x9a
function randomvectorrange(var_c9a3b79b12aef49c, var_c980a59b1288854e) {
    /#
        assert(isdefined(var_c9a3b79b12aef49c));
    #/
    /#
        assert(isdefined(var_c980a59b1288854e));
    #/
    x = randomfloatrange(var_c9a3b79b12aef49c, var_c980a59b1288854e);
    if (randomint(2) == 0) {
        x = x * -1;
    }
    y = randomfloatrange(var_c9a3b79b12aef49c, var_c980a59b1288854e);
    if (randomint(2) == 0) {
        y = y * -1;
    }
    z = randomfloatrange(var_c9a3b79b12aef49c, var_c980a59b1288854e);
    if (randomint(2) == 0) {
        z = z * -1;
    }
    return (x, y, z);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c5f
// Size: 0x17
function sign(x) {
    if (x >= 0) {
        return 1;
    }
    return -1;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c7e
// Size: 0x2a
function function_e94027c662b8573b(vec) {
    return (sign(vec[0]), sign(vec[1]), sign(vec[2]));
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cb0
// Size: 0x6d
function randomonunitsphere() {
    theta = randomfloat(180);
    var_b201b10302d5e138 = randomfloat(360);
    x = cos(var_b201b10302d5e138) * cos(theta);
    y = cos(var_b201b10302d5e138) * sin(theta);
    z = sin(var_b201b10302d5e138);
    return (x, y, z);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d25
// Size: 0x52
function function_6174330574a2a273() {
    angle = randomfloat(360);
    dist = randomfloat(1);
    x = cos(angle) * dist;
    y = sin(angle) * dist;
    return (x, y, 0);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d7f
// Size: 0x45
function function_d553466cf817a4da() {
    while (1) {
        x = randomfloatrange(-1, 1);
        y = randomfloatrange(-1, 1);
        if (x * x + y * y < 1) {
            return (x, y, 0);
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dcb
// Size: 0x3a
function mod(var_a860076e6b45db06, var_f1563935aeeb5199) {
    q = int(var_a860076e6b45db06 / var_f1563935aeeb5199);
    if (var_a860076e6b45db06 * var_f1563935aeeb5199 < 0) {
        q = q - 1;
    }
    return var_a860076e6b45db06 - q * var_f1563935aeeb5199;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e0d
// Size: 0x4a
function get_enemy_team(team) {
    /#
        assertex(team != "neutral", "Team must be allies or axis");
    #/
    teams = [];
    teams["axis"] = "allies";
    teams["allies"] = "axis";
    return teams[team];
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e5f
// Size: 0x36
function clear_exception(type) {
    /#
        assert(isdefined(self.exception[type]));
    #/
    self.exception[type] = anim.defaultexception;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e9c
// Size: 0xd
function cointoss() {
    return randomint(100) >= 50;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eb1
// Size: 0x25
function function_51d76700600cebe3(probability) {
    /#
        assertex(isdefined(probability), "Must define probability of success.");
    #/
    return randomfloat(100) < probability;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ede
// Size: 0x61
function choose_from_weighted_array(values, weights) {
    /#
        assert(values.size == weights.size);
    #/
    randomval = randomint(weights[weights.size - 1] + 1);
    for (i = 0; i < weights.size; i++) {
        if (randomval <= weights[i]) {
            return values[i];
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f46
// Size: 0x39
function waittill_string(msg, ent) {
    if (msg != "death") {
        self endon("death");
    }
    ent endon("die");
    self waittill(msg);
    ent notify("returned", msg);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f86
// Size: 0x44
function waittillmatch_string(anim_name, msg, ent) {
    if (msg != "death") {
        self endon("death");
    }
    ent endon("die");
    self waittillmatch(anim_name, msg);
    ent notify("returned", msg);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fd1
// Size: 0x28
function waittill_string_no_endon_death(msg, ent) {
    ent endon("die");
    self waittill(msg);
    ent notify("returned", msg);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2000
// Size: 0x118
function waittill_multiple(string1, string2, string3, string4, string5) {
    /#
        assertex(issp(), "You must use a numbered version of the waittill_multiple function in CP/MP due to performance reasons");
    #/
    self endon("death");
    ent = spawnstruct();
    ent.threads = 0;
    if (isdefined(string1)) {
        childthread waittill_string(string1, ent);
        ent.threads++;
    }
    if (isdefined(string2)) {
        childthread waittill_string(string2, ent);
        ent.threads++;
    }
    if (isdefined(string3)) {
        childthread waittill_string(string3, ent);
        ent.threads++;
    }
    if (isdefined(string4)) {
        childthread waittill_string(string4, ent);
        ent.threads++;
    }
    if (isdefined(string5)) {
        childthread waittill_string(string5, ent);
        ent.threads++;
    }
    while (ent.threads) {
        ent waittill("returned");
        ent.threads--;
    }
    ent notify("die");
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x211f
// Size: 0x9b
function waittill_2(string1, string2) {
    self endon("death");
    ent = spawnstruct();
    ent.threads = 0;
    if (isdefined(string1)) {
        childthread waittill_string(string1, ent);
        ent.threads++;
    }
    if (isdefined(string2)) {
        childthread waittill_string(string2, ent);
        ent.threads++;
    }
    while (ent.threads) {
        ent waittill("returned");
        ent.threads--;
    }
    ent notify("die");
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x21c1
// Size: 0x2e
function waittillmatch_notify(anim_name, var_5d74daec5ce18458, notify_str) {
    self endon("death");
    self waittillmatch(anim_name, var_5d74daec5ce18458);
    self notify(notify_str);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21f6
// Size: 0x5f
function waittill_any_return_1(string1) {
    if (!isdefined(string1) || string1 != "death") {
        self endon("death");
    }
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string(string1, ent);
    }
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x225d
// Size: 0x88
function waittill_any_return_2(string1, string2) {
    if ((!isdefined(string1) || string1 != "death") && (!isdefined(string2) || string2 != "death")) {
        self endon("death");
    }
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string(string2, ent);
    }
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22ed
// Size: 0xb1
function waittill_any_return_3(string1, string2, string3) {
    if ((!isdefined(string1) || string1 != "death") && (!isdefined(string2) || string2 != "death") && (!isdefined(string3) || string3 != "death")) {
        self endon("death");
    }
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string(string2, ent);
    }
    if (isdefined(string3)) {
        childthread waittill_string(string3, ent);
    }
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23a6
// Size: 0xda
function waittill_any_return_4(string1, string2, string3, string4) {
    if ((!isdefined(string1) || string1 != "death") && (!isdefined(string2) || string2 != "death") && (!isdefined(string3) || string3 != "death") && (!isdefined(string4) || string4 != "death")) {
        self endon("death");
    }
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string(string2, ent);
    }
    if (isdefined(string3)) {
        childthread waittill_string(string3, ent);
    }
    if (isdefined(string4)) {
        childthread waittill_string(string4, ent);
    }
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2488
// Size: 0x107
function waittill_any_return_5(string1, string2, string3, string4, string5) {
    if ((!isdefined(string1) || string1 != "death") && (!isdefined(string2) || string2 != "death") && (!isdefined(string3) || string3 != "death") && (!isdefined(string4) || string4 != "death") && (!isdefined(string5) || string5 != "death")) {
        self endon("death");
    }
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string(string2, ent);
    }
    if (isdefined(string3)) {
        childthread waittill_string(string3, ent);
    }
    if (isdefined(string4)) {
        childthread waittill_string(string4, ent);
    }
    if (isdefined(string5)) {
        childthread waittill_string(string5, ent);
    }
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2597
// Size: 0x134
function waittill_any_return_6(string1, string2, string3, string4, string5, string6) {
    if ((!isdefined(string1) || string1 != "death") && (!isdefined(string2) || string2 != "death") && (!isdefined(string3) || string3 != "death") && (!isdefined(string4) || string4 != "death") && (!isdefined(string5) || string5 != "death") && (!isdefined(string6) || string6 != "death")) {
        self endon("death");
    }
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string(string2, ent);
    }
    if (isdefined(string3)) {
        childthread waittill_string(string3, ent);
    }
    if (isdefined(string4)) {
        childthread waittill_string(string4, ent);
    }
    if (isdefined(string5)) {
        childthread waittill_string(string5, ent);
    }
    if (isdefined(string6)) {
        childthread waittill_string(string6, ent);
    }
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x26d3
// Size: 0x161
function waittill_any_return_7(string1, string2, string3, string4, string5, string6, string7) {
    if ((!isdefined(string1) || string1 != "death") && (!isdefined(string2) || string2 != "death") && (!isdefined(string3) || string3 != "death") && (!isdefined(string4) || string4 != "death") && (!isdefined(string5) || string5 != "death") && (!isdefined(string6) || string6 != "death") && (!isdefined(string7) || string7 != "death")) {
        self endon("death");
    }
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string(string2, ent);
    }
    if (isdefined(string3)) {
        childthread waittill_string(string3, ent);
    }
    if (isdefined(string4)) {
        childthread waittill_string(string4, ent);
    }
    if (isdefined(string5)) {
        childthread waittill_string(string5, ent);
    }
    if (isdefined(string6)) {
        childthread waittill_string(string6, ent);
    }
    if (isdefined(string7)) {
        childthread waittill_string(string7, ent);
    }
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x283c
// Size: 0x1a2
function waittill_any_return(string1, string2, string3, string4, string5, string6, string7, var_e785cae7be33f7c) {
    /#
        assertex(issp(), "You must use a numbered version of the waittill_any_return function in CP/MP due to performance reasons");
    #/
    if ((!isdefined(string1) || string1 != "death") && (!isdefined(string2) || string2 != "death") && (!isdefined(string3) || string3 != "death") && (!isdefined(string4) || string4 != "death") && (!isdefined(string5) || string5 != "death") && (!isdefined(string6) || string6 != "death") && (!isdefined(string7) || string7 != "death") && (!isdefined(var_e785cae7be33f7c) || var_e785cae7be33f7c != "death")) {
        self endon("death");
    }
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string(string2, ent);
    }
    if (isdefined(string3)) {
        childthread waittill_string(string3, ent);
    }
    if (isdefined(string4)) {
        childthread waittill_string(string4, ent);
    }
    if (isdefined(string5)) {
        childthread waittill_string(string5, ent);
    }
    if (isdefined(string6)) {
        childthread waittill_string(string6, ent);
    }
    if (isdefined(string7)) {
        childthread waittill_string(string7, ent);
    }
    if (isdefined(var_e785cae7be33f7c)) {
        childthread waittill_string(var_e785cae7be33f7c, ent);
    }
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x29e6
// Size: 0x148
function waittillmatch_any_return(var_65dc1767352c19cd, string1, string2, string3, string4, string5, string6) {
    if ((!isdefined(string1) || string1 != "death") && (!isdefined(string2) || string2 != "death") && (!isdefined(string3) || string3 != "death") && (!isdefined(string4) || string4 != "death") && (!isdefined(string5) || string5 != "death") && (!isdefined(string6) || string6 != "death")) {
        self endon("death");
    }
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittillmatch_string(var_65dc1767352c19cd, string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittillmatch_string(var_65dc1767352c19cd, string2, ent);
    }
    if (isdefined(string3)) {
        childthread waittillmatch_string(var_65dc1767352c19cd, string3, ent);
    }
    if (isdefined(string4)) {
        childthread waittillmatch_string(var_65dc1767352c19cd, string4, ent);
    }
    if (isdefined(string5)) {
        childthread waittillmatch_string(var_65dc1767352c19cd, string5, ent);
    }
    if (isdefined(string6)) {
        childthread waittillmatch_string(var_65dc1767352c19cd, string6, ent);
    }
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b36
// Size: 0x47
function waittill_any_return_no_endon_death_1(string1) {
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string_no_endon_death(string1, ent);
    }
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b85
// Size: 0x5e
function waittill_any_return_no_endon_death_2(string1, string2) {
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string_no_endon_death(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string_no_endon_death(string2, ent);
    }
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2beb
// Size: 0x75
function waittill_any_return_no_endon_death_3(string1, string2, string3) {
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string_no_endon_death(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string_no_endon_death(string2, ent);
    }
    if (isdefined(string3)) {
        childthread waittill_string_no_endon_death(string3, ent);
    }
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c68
// Size: 0x8c
function waittill_any_return_no_endon_death_4(string1, string2, string3, string4) {
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string_no_endon_death(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string_no_endon_death(string2, ent);
    }
    if (isdefined(string3)) {
        childthread waittill_string_no_endon_death(string3, ent);
    }
    if (isdefined(string4)) {
        childthread waittill_string_no_endon_death(string4, ent);
    }
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cfc
// Size: 0xa5
function waittill_any_return_no_endon_death_5(string1, string2, string3, string4, string5) {
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string_no_endon_death(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string_no_endon_death(string2, ent);
    }
    if (isdefined(string3)) {
        childthread waittill_string_no_endon_death(string3, ent);
    }
    if (isdefined(string4)) {
        childthread waittill_string_no_endon_death(string4, ent);
    }
    if (isdefined(string5)) {
        childthread waittill_string_no_endon_death(string5, ent);
    }
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2da9
// Size: 0xbe
function waittill_any_return_no_endon_death_6(string1, string2, string3, string4, string5, string6) {
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string_no_endon_death(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string_no_endon_death(string2, ent);
    }
    if (isdefined(string3)) {
        childthread waittill_string_no_endon_death(string3, ent);
    }
    if (isdefined(string4)) {
        childthread waittill_string_no_endon_death(string4, ent);
    }
    if (isdefined(string5)) {
        childthread waittill_string_no_endon_death(string5, ent);
    }
    if (isdefined(string6)) {
        childthread waittill_string_no_endon_death(string6, ent);
    }
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e6f
// Size: 0xd7
function function_efe4706df8361219(string1, string2, string3, string4, string5, string6, string7) {
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string_no_endon_death(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string_no_endon_death(string2, ent);
    }
    if (isdefined(string3)) {
        childthread waittill_string_no_endon_death(string3, ent);
    }
    if (isdefined(string4)) {
        childthread waittill_string_no_endon_death(string4, ent);
    }
    if (isdefined(string5)) {
        childthread waittill_string_no_endon_death(string5, ent);
    }
    if (isdefined(string6)) {
        childthread waittill_string_no_endon_death(string6, ent);
    }
    if (isdefined(string7)) {
        childthread waittill_string_no_endon_death(string7, ent);
    }
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f4e
// Size: 0xd2
function waittill_any_return_no_endon_death(string1, string2, string3, string4, string5, string6) {
    /#
        assertex(issp(), "You must use a numbered version of the waittill_any_return function in CP/MP due to performance reasons");
    #/
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string_no_endon_death(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string_no_endon_death(string2, ent);
    }
    if (isdefined(string3)) {
        childthread waittill_string_no_endon_death(string3, ent);
    }
    if (isdefined(string4)) {
        childthread waittill_string_no_endon_death(string4, ent);
    }
    if (isdefined(string5)) {
        childthread waittill_string_no_endon_death(string5, ent);
    }
    if (isdefined(string6)) {
        childthread waittill_string_no_endon_death(string6, ent);
    }
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3028
// Size: 0x49
function function_5adca43f839a3cce(var_ab9868b0589a6052) {
    /#
        assertex(var_ab9868b0589a6052.size > 0, "Array must contain at least one string.");
    #/
    for (i = 0; i < var_ab9868b0589a6052.size - 1; i++) {
        self endon(var_ab9868b0589a6052[i]);
    }
    self waittill(var_ab9868b0589a6052[var_ab9868b0589a6052.size - 1]);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3078
// Size: 0xad
function waittill_any_in_array_return(var_ab9868b0589a6052) {
    ent = spawnstruct();
    hasdeath = 0;
    foreach (string in var_ab9868b0589a6052) {
        childthread waittill_string(string, ent);
        if (string == "death") {
            hasdeath = 1;
        }
    }
    if (!hasdeath) {
        self endon("death");
    }
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x312d
// Size: 0x87
function waittill_any_in_array_return_no_endon_death(var_ab9868b0589a6052) {
    ent = spawnstruct();
    foreach (string in var_ab9868b0589a6052) {
        childthread waittill_string_no_endon_death(string, ent);
    }
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31bc
// Size: 0xc0
function waittill_any_in_array_or_timeout(var_ab9868b0589a6052, timeout) {
    ent = spawnstruct();
    hasdeath = 0;
    foreach (string in var_ab9868b0589a6052) {
        childthread waittill_string(string, ent);
        if (string == "death") {
            hasdeath = 1;
        }
    }
    if (!hasdeath) {
        self endon("death");
    }
    ent childthread function_2c91b6c857aa73cc(timeout);
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3284
// Size: 0x9a
function waittill_any_in_array_or_timeout_no_endon_death(var_ab9868b0589a6052, timeout) {
    ent = spawnstruct();
    foreach (string in var_ab9868b0589a6052) {
        childthread waittill_string_no_endon_death(string, ent);
    }
    ent thread function_2c91b6c857aa73cc(timeout);
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3326
// Size: 0x4a
function waittill_all_in_array(var_ab9868b0589a6052) {
    /#
        assert(isdefined(var_ab9868b0589a6052));
    #/
    /#
        assert(isarray(var_ab9868b0589a6052));
    #/
    while (var_ab9868b0589a6052.size) {
        msg = waittill_any_in_array_return(var_ab9868b0589a6052);
        var_ab9868b0589a6052 = array_remove(var_ab9868b0589a6052, msg);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3377
// Size: 0x71
function waittill_any_timeout_1(timeout, string1) {
    if (!isdefined(string1) || string1 != "death") {
        self endon("death");
    }
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string(string1, ent);
    }
    ent childthread function_2c91b6c857aa73cc(timeout);
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33f0
// Size: 0x9a
function waittill_any_timeout_2(timeout, string1, string2) {
    if ((!isdefined(string1) || string1 != "death") && (!isdefined(string2) || string2 != "death")) {
        self endon("death");
    }
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string(string2, ent);
    }
    ent childthread function_2c91b6c857aa73cc(timeout);
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3492
// Size: 0xc3
function waittill_any_timeout_3(timeout, string1, string2, string3) {
    if ((!isdefined(string1) || string1 != "death") && (!isdefined(string2) || string2 != "death") && (!isdefined(string3) || string3 != "death")) {
        self endon("death");
    }
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string(string2, ent);
    }
    if (isdefined(string3)) {
        childthread waittill_string(string3, ent);
    }
    ent childthread function_2c91b6c857aa73cc(timeout);
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x355d
// Size: 0xed
function waittill_any_timeout_4(timeout, string1, string2, string3, string4) {
    if ((!isdefined(string1) || string1 != "death") && (!isdefined(string2) || string2 != "death") && (!isdefined(string3) || string3 != "death") && (!isdefined(string4) || string4 != "death")) {
        self endon("death");
    }
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string(string2, ent);
    }
    if (isdefined(string3)) {
        childthread waittill_string(string3, ent);
    }
    if (isdefined(string4)) {
        childthread waittill_string(string4, ent);
    }
    ent childthread function_2c91b6c857aa73cc(timeout);
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3652
// Size: 0x11a
function waittill_any_timeout_5(timeout, string1, string2, string3, string4, string5) {
    if ((!isdefined(string1) || string1 != "death") && (!isdefined(string2) || string2 != "death") && (!isdefined(string3) || string3 != "death") && (!isdefined(string4) || string4 != "death") && (!isdefined(string5) || string5 != "death")) {
        self endon("death");
    }
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string(string2, ent);
    }
    if (isdefined(string3)) {
        childthread waittill_string(string3, ent);
    }
    if (isdefined(string4)) {
        childthread waittill_string(string4, ent);
    }
    if (isdefined(string5)) {
        childthread waittill_string(string5, ent);
    }
    ent childthread function_2c91b6c857aa73cc(timeout);
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x3774
// Size: 0x147
function waittill_any_timeout_6(timeout, string1, string2, string3, string4, string5, string6) {
    if ((!isdefined(string1) || string1 != "death") && (!isdefined(string2) || string2 != "death") && (!isdefined(string3) || string3 != "death") && (!isdefined(string4) || string4 != "death") && (!isdefined(string5) || string5 != "death") && (!isdefined(string6) || string6 != "death")) {
        self endon("death");
    }
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string(string2, ent);
    }
    if (isdefined(string3)) {
        childthread waittill_string(string3, ent);
    }
    if (isdefined(string4)) {
        childthread waittill_string(string4, ent);
    }
    if (isdefined(string5)) {
        childthread waittill_string(string5, ent);
    }
    if (isdefined(string6)) {
        childthread waittill_string(string6, ent);
    }
    ent childthread function_2c91b6c857aa73cc(timeout);
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x38c3
// Size: 0x15b
function waittill_any_timeout(timeout, string1, string2, string3, string4, string5, string6) {
    /#
        assertex(issp(), "You must use a numbered version of the waittill_any_timeout function in CP/MP due to performance reasons");
    #/
    if ((!isdefined(string1) || string1 != "death") && (!isdefined(string2) || string2 != "death") && (!isdefined(string3) || string3 != "death") && (!isdefined(string4) || string4 != "death") && (!isdefined(string5) || string5 != "death") && (!isdefined(string6) || string6 != "death")) {
        self endon("death");
    }
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string(string2, ent);
    }
    if (isdefined(string3)) {
        childthread waittill_string(string3, ent);
    }
    if (isdefined(string4)) {
        childthread waittill_string(string4, ent);
    }
    if (isdefined(string5)) {
        childthread waittill_string(string5, ent);
    }
    if (isdefined(string6)) {
        childthread waittill_string(string6, ent);
    }
    ent childthread function_2c91b6c857aa73cc(timeout);
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a26
// Size: 0x22
function function_2c91b6c857aa73cc(delay) {
    self endon("die");
    wait(delay);
    self notify("returned", "timeout");
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a4f
// Size: 0x59
function waittill_any_timeout_no_endon_death_1(timeout, string1) {
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string_no_endon_death(string1, ent);
    }
    ent childthread function_2c91b6c857aa73cc(timeout);
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ab0
// Size: 0x70
function waittill_any_timeout_no_endon_death_2(timeout, string1, string2) {
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string_no_endon_death(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string_no_endon_death(string2, ent);
    }
    ent childthread function_2c91b6c857aa73cc(timeout);
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3b28
// Size: 0x87
function waittill_any_timeout_no_endon_death_3(timeout, string1, string2, string3) {
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string_no_endon_death(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string_no_endon_death(string2, ent);
    }
    if (isdefined(string3)) {
        childthread waittill_string_no_endon_death(string3, ent);
    }
    ent childthread function_2c91b6c857aa73cc(timeout);
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3bb7
// Size: 0x9f
function waittill_any_timeout_no_endon_death_4(timeout, string1, string2, string3, string4) {
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string_no_endon_death(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string_no_endon_death(string2, ent);
    }
    if (isdefined(string3)) {
        childthread waittill_string_no_endon_death(string3, ent);
    }
    if (isdefined(string4)) {
        childthread waittill_string_no_endon_death(string4, ent);
    }
    ent childthread function_2c91b6c857aa73cc(timeout);
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x3c5e
// Size: 0xb8
function waittill_any_timeout_no_endon_death_5(timeout, string1, string2, string3, string4, string5) {
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string_no_endon_death(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string_no_endon_death(string2, ent);
    }
    if (isdefined(string3)) {
        childthread waittill_string_no_endon_death(string3, ent);
    }
    if (isdefined(string4)) {
        childthread waittill_string_no_endon_death(string4, ent);
    }
    if (isdefined(string5)) {
        childthread waittill_string_no_endon_death(string5, ent);
    }
    ent childthread function_2c91b6c857aa73cc(timeout);
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x3d1e
// Size: 0xcc
function waittill_any_timeout_no_endon_death(timeout, string1, string2, string3, string4, string5) {
    /#
        assertex(issp(), "You must use a numbered version of the waittill_any_timeout_no_endon_death function in CP/MP due to performance reasons");
    #/
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string_no_endon_death(string1, ent);
    }
    if (isdefined(string2)) {
        childthread waittill_string_no_endon_death(string2, ent);
    }
    if (isdefined(string3)) {
        childthread waittill_string_no_endon_death(string3, ent);
    }
    if (isdefined(string4)) {
        childthread waittill_string_no_endon_death(string4, ent);
    }
    if (isdefined(string5)) {
        childthread waittill_string_no_endon_death(string5, ent);
    }
    ent childthread function_2c91b6c857aa73cc(timeout);
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3df2
// Size: 0x2b
function waittill_any_2(string1, string2) {
    /#
        assert(isdefined(string1));
    #/
    if (isdefined(string2)) {
        self endon(string2);
    }
    self waittill(string1);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e24
// Size: 0x3b
function waittill_any_3(string1, string2, string3) {
    /#
        assert(isdefined(string1));
    #/
    if (isdefined(string2)) {
        self endon(string2);
    }
    if (isdefined(string3)) {
        self endon(string3);
    }
    self waittill(string1);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e66
// Size: 0x4b
function waittill_any_4(string1, string2, string3, string4) {
    /#
        assert(isdefined(string1));
    #/
    if (isdefined(string2)) {
        self endon(string2);
    }
    if (isdefined(string3)) {
        self endon(string3);
    }
    if (isdefined(string4)) {
        self endon(string4);
    }
    self waittill(string1);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3eb8
// Size: 0x5b
function waittill_any_5(string1, string2, string3, string4, string5) {
    /#
        assert(isdefined(string1));
    #/
    if (isdefined(string2)) {
        self endon(string2);
    }
    if (isdefined(string3)) {
        self endon(string3);
    }
    if (isdefined(string4)) {
        self endon(string4);
    }
    if (isdefined(string5)) {
        self endon(string5);
    }
    self waittill(string1);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f1a
// Size: 0x6b
function waittill_any_6(string1, string2, string3, string4, string5, string6) {
    /#
        assert(isdefined(string1));
    #/
    if (isdefined(string2)) {
        self endon(string2);
    }
    if (isdefined(string3)) {
        self endon(string3);
    }
    if (isdefined(string4)) {
        self endon(string4);
    }
    if (isdefined(string5)) {
        self endon(string5);
    }
    if (isdefined(string6)) {
        self endon(string6);
    }
    self waittill(string1);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f8c
// Size: 0x7d
function waittill_any_7(string1, string2, string3, string4, string5, string6, string7) {
    /#
        assert(isdefined(string1));
    #/
    if (isdefined(string2)) {
        self endon(string2);
    }
    if (isdefined(string3)) {
        self endon(string3);
    }
    if (isdefined(string4)) {
        self endon(string4);
    }
    if (isdefined(string5)) {
        self endon(string5);
    }
    if (isdefined(string6)) {
        self endon(string6);
    }
    if (isdefined(string7)) {
        self endon(string7);
    }
    self waittill(string1);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4010
// Size: 0x8f
function waittill_any_8(string1, string2, string3, string4, string5, string6, string7, var_e785cae7be33f7c) {
    /#
        assert(isdefined(string1));
    #/
    if (isdefined(string2)) {
        self endon(string2);
    }
    if (isdefined(string3)) {
        self endon(string3);
    }
    if (isdefined(string4)) {
        self endon(string4);
    }
    if (isdefined(string5)) {
        self endon(string5);
    }
    if (isdefined(string6)) {
        self endon(string6);
    }
    if (isdefined(string7)) {
        self endon(string7);
    }
    if (isdefined(var_e785cae7be33f7c)) {
        self endon(var_e785cae7be33f7c);
    }
    self waittill(string1);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40a6
// Size: 0xa3
function waittill_any(string1, string2, string3, string4, string5, string6, string7, var_e785cae7be33f7c) {
    /#
        assertex(issp(), "You must use a numbered version of the waittill_any_return function in CP/MP due to performance reasons");
    #/
    /#
        assert(isdefined(string1));
    #/
    if (isdefined(string2)) {
        self endon(string2);
    }
    if (isdefined(string3)) {
        self endon(string3);
    }
    if (isdefined(string4)) {
        self endon(string4);
    }
    if (isdefined(string5)) {
        self endon(string5);
    }
    if (isdefined(string6)) {
        self endon(string6);
    }
    if (isdefined(string7)) {
        self endon(string7);
    }
    if (isdefined(var_e785cae7be33f7c)) {
        self endon(var_e785cae7be33f7c);
    }
    self waittill(string1);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 14, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4150
// Size: 0xf2
function waittill_any_ents(ent1, string1, ent2, string2, ent3, string3, ent4, string4, ent5, string5, ent6, string6, ent7, string7) {
    /#
        assert(isdefined(ent1));
    #/
    /#
        assert(isdefined(string1));
    #/
    if (isdefined(ent2) && isdefined(string2)) {
        ent2 endon(string2);
    }
    if (isdefined(ent3) && isdefined(string3)) {
        ent3 endon(string3);
    }
    if (isdefined(ent4) && isdefined(string4)) {
        ent4 endon(string4);
    }
    if (isdefined(ent5) && isdefined(string5)) {
        ent5 endon(string5);
    }
    if (isdefined(ent6) && isdefined(string6)) {
        ent6 endon(string6);
    }
    if (isdefined(ent7) && isdefined(string7)) {
        ent7 endon(string7);
    }
    ent1 waittill(string1);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params f, eflags: 0x0
// Checksum 0x0, Offset: 0x4249
// Size: 0x108
function function_cf308f348d516c65(delay, ent1, string1, ent2, string2, ent3, string3, ent4, string4, ent5, string5, ent6, string6, ent7, string7) {
    /#
        assert(isdefined(delay));
    #/
    /#
        assert(isdefined(ent1));
    #/
    /#
        assert(isdefined(string1));
    #/
    ent1 endon(string1);
    if (isdefined(ent2) && isdefined(string2)) {
        ent2 endon(string2);
    }
    if (isdefined(ent3) && isdefined(string3)) {
        ent3 endon(string3);
    }
    if (isdefined(ent4) && isdefined(string4)) {
        ent4 endon(string4);
    }
    if (isdefined(ent5) && isdefined(string5)) {
        ent5 endon(string5);
    }
    if (isdefined(ent6) && isdefined(string6)) {
        ent6 endon(string6);
    }
    if (isdefined(ent7) && isdefined(string7)) {
        ent7 endon(string7);
    }
    wait(delay);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params e, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4358
// Size: 0x160
function waittill_any_ents_return(ent1, string1, ent2, string2, ent3, string3, ent4, string4, ent5, string5, ent6, string6, ent7, string7) {
    /#
        assert(isdefined(ent1));
    #/
    /#
        assert(isdefined(string1));
    #/
    self endon("death");
    ent = spawnstruct();
    ent1 childthread waittill_string(string1, ent);
    if (isdefined(ent2) && isdefined(string2)) {
        ent2 childthread waittill_string(string2, ent);
    }
    if (isdefined(ent3) && isdefined(string3)) {
        ent3 childthread waittill_string(string3, ent);
    }
    if (isdefined(ent4) && isdefined(string4)) {
        ent4 childthread waittill_string(string4, ent);
    }
    if (isdefined(ent5) && isdefined(string5)) {
        ent5 childthread waittill_string(string5, ent);
    }
    if (isdefined(ent6) && isdefined(string6)) {
        ent6 childthread waittill_string(string6, ent);
    }
    if (isdefined(ent7) && isdefined(string7)) {
        ent7 childthread waittill_string(string7, ent);
    }
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 14, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44c0
// Size: 0x160
function function_7b9e0e7ca4b3b940(ent1, string1, ent2, string2, ent3, string3, ent4, string4, ent5, string5, ent6, string6, ent7, string7) {
    /#
        assert(isdefined(ent1));
    #/
    /#
        assert(isdefined(string1));
    #/
    self endon("death");
    ent = spawnstruct();
    ent1 childthread waittill_string_no_endon_death(string1, ent);
    if (isdefined(ent2) && isdefined(string2)) {
        ent2 childthread waittill_string_no_endon_death(string2, ent);
    }
    if (isdefined(ent3) && isdefined(string3)) {
        ent3 childthread waittill_string_no_endon_death(string3, ent);
    }
    if (isdefined(ent4) && isdefined(string4)) {
        ent4 childthread waittill_string_no_endon_death(string4, ent);
    }
    if (isdefined(ent5) && isdefined(string5)) {
        ent5 childthread waittill_string_no_endon_death(string5, ent);
    }
    if (isdefined(ent6) && isdefined(string6)) {
        ent6 childthread waittill_string_no_endon_death(string6, ent);
    }
    if (isdefined(ent7) && isdefined(string7)) {
        ent7 childthread waittill_string_no_endon_death(string7, ent);
    }
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4628
// Size: 0x108
function waittill_any_ents_array(ents, string1, string2, string3, string4, string5, string6, string7) {
    /#
        assert(isdefined(ents));
    #/
    /#
        assert(isarray(ents));
    #/
    /#
        assert(isdefined(ents[0]));
    #/
    /#
        assert(isdefined(string1));
    #/
    foreach (ent in ents) {
        if (ent != ents[0]) {
            ent endon(string1);
        }
        if (isdefined(string2)) {
            ent endon(string2);
        }
        if (isdefined(string3)) {
            ent endon(string3);
        }
        if (isdefined(string4)) {
            ent endon(string4);
        }
        if (isdefined(string5)) {
            ent endon(string5);
        }
        if (isdefined(string6)) {
            ent endon(string6);
        }
        if (isdefined(string7)) {
            ent endon(string7);
        }
    }
    ents[0] waittill(string1);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4737
// Size: 0x2c
function wait_time_in_ms(var_8911f71726832879) {
    var_754110404c0d574f = gettime() + var_8911f71726832879;
    while (gettime() < var_754110404c0d574f) {
        waitframe();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x476a
// Size: 0x57
function script_delay() {
    if (isdefined(self.script_delay)) {
        wait(self.script_delay);
        return 1;
    } else if (isdefined(self.script_delay_min) && isdefined(self.script_delay_max)) {
        wait(randomfloatrange(self.script_delay_min, self.script_delay_max));
        return 1;
    }
    return 0;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47c9
// Size: 0xd5
function script_wait() {
    starttime = gettime();
    if (isdefined(self.script_wait)) {
        wait(self.script_wait);
        if (isdefined(self.script_wait_add)) {
            self.script_wait = self.script_wait + self.script_wait_add;
        }
    } else if (isdefined(self.script_wait_min) && isdefined(self.script_wait_max)) {
        wait(randomfloatrange(self.script_wait_min, self.script_wait_max));
        if (isdefined(self.script_wait_add)) {
            self.script_wait_min = self.script_wait_min + self.script_wait_add;
            self.script_wait_max = self.script_wait_max + self.script_wait_add;
        }
    }
    return gettime() - starttime;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48a6
// Size: 0x34
function function_6c71c72547bb931(point) {
    var_2649564eba242b56 = [];
    return physics_querypoint(point, 0, physics_createcontents([0:"physicscontents_water"]), var_2649564eba242b56, "physicsquery_any");
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48e2
// Size: 0x21
function isflashed() {
    if (!isdefined(self.flashendtime)) {
        return 0;
    }
    return gettime() < self.flashendtime;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x490b
// Size: 0x21
function isstunned() {
    if (!isdefined(self.var_3ecd1eeaaf81797b)) {
        return 0;
    }
    return gettime() < self.var_3ecd1eeaaf81797b;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4934
// Size: 0x27
function flag_exist(message) {
    if (!isdefined(level.flag)) {
        return 0;
    }
    return isdefined(level.flag[message]);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4963
// Size: 0x32
function flag(message) {
    /#
        assertex(isdefined(message), "Tried to check flag but the flag was not defined.");
    #/
    return flag_exist(message) && level.flag[message];
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x499d
// Size: 0x8d
function flag_init(message) {
    if (!isdefined(level.flag)) {
        namespace_2ca3a93161121e96::init_flags();
    }
    /#
        if (isdefined(level.first_frame) && level.first_frame == -1) {
            /#
                assertex(!isdefined(level.flag[message]), "Tried to getstruct before the structs were init" + message);
            #/
        }
    #/
    level.flag[message] = 0;
    init_trigger_flags();
    if (!isdefined(level.trigger_flags[message])) {
        level.trigger_flags[message] = [];
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a31
// Size: 0xc
function empty_init_func(empty) {
    
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a44
// Size: 0x4d
function flag_set(message, var_ac9510cd03af7e12) {
    if (!flag_exist(message)) {
        flag_init(message);
    }
    level.flag[message] = 1;
    set_trigger_flag_permissions(message);
    if (isdefined(var_ac9510cd03af7e12)) {
        level notify(message, var_ac9510cd03af7e12);
    } else {
        level notify(message);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a98
// Size: 0x35
function flag_wait(msg) {
    other = undefined;
    while (!flag(msg)) {
        other = undefined;
        other = level waittill(msg);
    }
    if (isdefined(other)) {
        return other;
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ad4
// Size: 0x30
function flag_clear(message) {
    if (!flag(message)) {
        return;
    }
    level.flag[message] = 0;
    set_trigger_flag_permissions(message);
    level notify(message);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b0b
// Size: 0x1d
function flag_waitopen(msg) {
    while (flag(msg)) {
        level waittill(msg);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b2f
// Size: 0x82
function function_ef5098111fa4ae2c(flags) {
    flags = array_removeundefined(flags);
    foreach (f in flags) {
        if (!flag(f)) {
            return;
        }
    }
    while (1) {
        f = level waittill_any_in_array_return(flags);
        if (!flag(f)) {
            return;
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x4bb8
// Size: 0x83
function function_254e355bdfc30d6c(flag1, var_5228090a1cf6f05b, var_5228080a1cf6ee28, var_52280f0a1cf6fd8d, var_52280e0a1cf6fb5a, var_52280d0a1cf6f927, var_52280c0a1cf6f6f4, var_5228030a1cf6e329) {
    array = [0:flag1, 1:var_5228090a1cf6f05b, 2:var_5228080a1cf6ee28, 3:var_52280f0a1cf6fd8d, 4:var_52280e0a1cf6fb5a, 5:var_52280d0a1cf6f927, 6:var_52280c0a1cf6f6f4, 7:var_5228030a1cf6e329];
    function_ef5098111fa4ae2c(array);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4c42
// Size: 0x3d
function flag_waitopen_either(flag1, var_5228090a1cf6f05b) {
    while (1) {
        if (!flag(flag1) || !flag(var_5228090a1cf6f05b)) {
            return;
        }
        level waittill_any_2(flag1, var_5228090a1cf6f05b);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c86
// Size: 0x1c
function waittill_either(msg1, msg2) {
    self endon(msg1);
    self waittill(msg2);
    return msg2;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4caa
// Size: 0x48
function trigger_on(name, type) {
    if (isdefined(name) && isdefined(type)) {
        ents = getentarray(name, type);
        array_thread(ents, &trigger_on_proc);
    } else {
        trigger_on_proc();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cf9
// Size: 0x14
function trigger_on_proc() {
    self triggerenable();
    self.trigger_off = undefined;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d14
// Size: 0x48
function trigger_off(name, type) {
    if (isdefined(name) && isdefined(type)) {
        ents = getentarray(name, type);
        array_thread(ents, &trigger_off_proc);
    } else {
        trigger_off_proc();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d63
// Size: 0x33
function trigger_off_proc() {
    if (issubstr(self.classname, "trigger")) {
        self triggerdisable();
    }
    self.trigger_off = 1;
    self notify("trigger_off");
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d9d
// Size: 0x4e
function set_trigger_flag_permissions(msg) {
    if (!isdefined(level.trigger_flags)) {
        return;
    }
    level.trigger_flags[msg] = array_removeundefined(level.trigger_flags[msg]);
    array_thread(level.trigger_flags[msg], &update_trigger_based_on_flags);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4df2
// Size: 0x11d
function update_trigger_based_on_flags() {
    true_on = 1;
    if (isdefined(self.script_flag_true)) {
        true_on = 0;
        tokens = create_flags_and_return_tokens(self.script_flag_true);
        foreach (token in tokens) {
            if (flag(token)) {
                true_on = 1;
                break;
            }
        }
    }
    false_on = 1;
    if (isdefined(self.script_flag_false)) {
        tokens = create_flags_and_return_tokens(self.script_flag_false);
        foreach (token in tokens) {
            if (flag(token)) {
                false_on = 0;
                break;
            }
        }
    }
    [[ level.trigger_func[true_on && false_on] ]]();
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f16
// Size: 0x57
function create_flags_and_return_tokens(flags) {
    tokens = strtok(flags, " ");
    for (i = 0; i < tokens.size; i++) {
        if (!isdefined(level.flag[tokens[i]])) {
            flag_init(tokens[i]);
        }
    }
    return tokens;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f75
// Size: 0x44
function init_trigger_flags() {
    if (!add_init_script("trigger_flags", &init_trigger_flags)) {
        return;
    }
    level.trigger_flags = [];
    level.trigger_func[1] = &trigger_on;
    level.trigger_func[0] = &trigger_off;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fc0
// Size: 0x2d5
function function_1f6c1a9b7564dc61(struct) {
    /#
        assertex(isdefined(level.struct_class_names), "Tried to addstruct before the structs were init");
    #/
    if (isdefined(struct.targetname)) {
        if (!isdefined(level.struct_class_names["targetname"][struct.targetname])) {
            level.struct_class_names["targetname"][struct.targetname] = [];
        }
        size = level.struct_class_names["targetname"][struct.targetname].size;
        level.struct_class_names["targetname"][struct.targetname][size] = struct;
    }
    if (isdefined(struct.target)) {
        if (!isdefined(level.struct_class_names["target"][struct.target])) {
            level.struct_class_names["target"][struct.target] = [];
        }
        size = level.struct_class_names["target"][struct.target].size;
        level.struct_class_names["target"][struct.target][size] = struct;
    }
    if (isdefined(struct.script_noteworthy)) {
        if (!isdefined(level.struct_class_names["script_noteworthy"][struct.script_noteworthy])) {
            level.struct_class_names["script_noteworthy"][struct.script_noteworthy] = [];
        }
        size = level.struct_class_names["script_noteworthy"][struct.script_noteworthy].size;
        level.struct_class_names["script_noteworthy"][struct.script_noteworthy][size] = struct;
    }
    if (isdefined(struct.script_linkname)) {
        if (!isdefined(level.struct_class_names["script_linkname"][struct.script_linkname])) {
            level.struct_class_names["script_linkname"][struct.script_linkname] = [];
        }
        size = level.struct_class_names["script_linkname"][struct.script_linkname].size;
        level.struct_class_names["script_linkname"][struct.script_linkname][size] = struct;
    }
    if (isdefined(struct.variantname)) {
        if (!isdefined(level.struct_class_names["variantname"][struct.variantname])) {
            level.struct_class_names["variantname"][struct.variantname] = [];
        }
        size = level.struct_class_names["variantname"][struct.variantname].size;
        level.struct_class_names["variantname"][struct.variantname][size] = struct;
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x529c
// Size: 0x11b
function getstruct(name, type) {
    /#
        assertex(isdefined(name) && isdefined(type), "Did not fill in name and type");
    #/
    /#
        assertex(isdefined(level.struct_class_names), "Tried to getstruct before the structs were init");
    #/
    array = level.struct_class_names[type][name];
    if (!isdefined(array)) {
        return undefined;
    }
    if (array.size > 1) {
        if (isdefined(array[0]) && isdefined(array[0].origin)) {
            var_f1cd96ee2e0d7471 = "" + array[0].origin;
        } else {
            var_f1cd96ee2e0d7471 = "<UNKNOWN>";
        }
        if (isdefined(array[1]) && isdefined(array[1].origin)) {
            var_f1cd93ee2e0d6dd8 = "" + array[1].origin;
        } else {
            var_f1cd93ee2e0d6dd8 = "<UNKNOWN>";
        }
        /#
            assertmsg("getstruct used for more than one struct of type '" + type + "' called '" + name + "'. Two of the conflicting structs can be found at " + var_f1cd96ee2e0d7471 + " and " + var_f1cd93ee2e0d6dd8);
        #/
        return undefined;
    }
    return array[0];
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53bf
// Size: 0x69
function getstructarray(name, type) {
    if (!isdefined(level.struct_class_names)) {
        /#
            assertex(isdefined(level.struct_class_names), "Tried to getstruct before the structs were init");
        #/
        return [];
    }
    if (!isdefined(type) || !isdefined(name)) {
        return [];
    }
    array = level.struct_class_names[type][name];
    if (!isdefined(array)) {
        return [];
    }
    return array;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5430
// Size: 0x22b
function function_e89fc5f3b8084c2b(struct) {
    if (!isdefined(struct.var_88446e27ec9c8ed7)) {
        return;
    }
    if (!isdefined(level._fx)) {
        level._fx = spawnstruct();
    }
    if (!isdefined(level._fx.var_b00d482263f28aab)) {
        level._fx.var_b00d482263f28aab = spawnstruct();
    }
    if (!isdefined(level._fx.var_b00d482263f28aab.nodes)) {
        level._fx.var_b00d482263f28aab.nodes = [];
    }
    if (!isdefined(level._fx.var_b00d482263f28aab.nodes[struct.var_88446e27ec9c8ed7])) {
        level._fx.var_b00d482263f28aab.nodes[struct.var_88446e27ec9c8ed7] = [];
    }
    node = spawnstruct();
    node.origin = struct.origin;
    node.angles = struct.angles;
    if (isdefined(struct.var_9e2bbe262ca3c265)) {
        node.var_9e2bbe262ca3c265 = struct.var_9e2bbe262ca3c265;
    }
    if (isdefined(struct.var_975a876c9c8ced9d)) {
        node.var_975a876c9c8ced9d = struct.var_975a876c9c8ced9d;
    }
    if (isdefined(struct.var_48f95e175a12d9c4)) {
        node.var_48f95e175a12d9c4 = struct.var_48f95e175a12d9c4;
    }
    if (isdefined(struct.var_22ff57eef960b294)) {
        node.var_22ff57eef960b294 = struct.var_22ff57eef960b294;
    }
    level._fx.var_b00d482263f28aab.nodes[struct.var_88446e27ec9c8ed7][level._fx.var_b00d482263f28aab.nodes[struct.var_88446e27ec9c8ed7].size] = node;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5662
// Size: 0xa7
function add_smartobject_point(struct) {
    if (!isdefined(anim.smartobjectpoints)) {
        anim.smartobjectpoints = [];
    }
    anim.smartobjectpoints[anim.smartobjectpoints.size] = struct;
    var_edca2d230a0013aa = function_6bf2b684ed87ad5e(struct.origin);
    if (!isdefined(var_edca2d230a0013aa)) {
        return;
    }
    if (!isdefined(anim.var_463c0093dff0f81c)) {
        anim.var_463c0093dff0f81c = [];
    }
    if (!isdefined(anim.var_463c0093dff0f81c[var_edca2d230a0013aa])) {
        anim.var_463c0093dff0f81c[var_edca2d230a0013aa] = [];
    }
    anim.var_463c0093dff0f81c[var_edca2d230a0013aa][anim.var_463c0093dff0f81c[var_edca2d230a0013aa].size] = struct;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5710
// Size: 0x117
function store_linked_smartobjects() {
    if (!isdefined(anim.smartobjectpoints)) {
        return;
    }
    foreach (obj in anim.smartobjectpoints) {
        if (isdefined(obj.script_linkto)) {
            structs = obj get_linked_structs();
            foreach (var_ff1398c2bbae4c1d in structs) {
                if (var_ff1398c2bbae4c1d == obj) {
                    continue;
                }
                if (!isdefined(var_ff1398c2bbae4c1d.script_smartobject)) {
                    continue;
                }
                if (!isdefined(obj.linkedsmartobjects)) {
                    obj.linkedsmartobjects = [];
                }
                obj.linkedsmartobjects[obj.linkedsmartobjects.size] = var_ff1398c2bbae4c1d;
            }
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x582e
// Size: 0x282
function init_struct_class() {
    if (!add_init_script("struct_classes", &init_struct_class)) {
        return;
    }
    level.struct_class_names = [];
    level.struct_class_names["target"] = [];
    level.struct_class_names["targetname"] = [];
    level.struct_class_names["script_noteworthy"] = [];
    level.struct_class_names["script_linkname"] = [];
    level.struct_class_names["variantname"] = [];
    level.var_afb53d6348c4fc39 = [];
    level.var_d5043478289af856 = [];
    level.var_f99b1d319e65854c = [];
    level.var_a0b4eb1703be349a = [];
    var_7de0efbf334063a9 = level.struct_filter;
    var_c276b6aa8eb8993b = isdefined(var_7de0efbf334063a9);
    foreach (index, struct in level.struct) {
        if (istrue(struct.var_d63b146db6138e15)) {
            continue;
        }
        if (isdefined(struct.script_smartobject)) {
            add_smartobject_point(struct);
        }
        if (var_c276b6aa8eb8993b && ![[ var_7de0efbf334063a9 ]](struct)) {
            continue;
        }
        if (isdefined(struct.targetname) && struct.targetname == "delete_on_load") {
            continue;
        }
        if (isdefined(struct.script_prefab_exploder) || isdefined(struct.script_exploder)) {
            level.var_afb53d6348c4fc39[level.var_afb53d6348c4fc39.size] = struct;
        }
        if (isdefined(struct.script_fakeactor_node)) {
            level.var_d5043478289af856[level.var_d5043478289af856.size] = struct;
        }
        if (isdefined(struct.var_8ac77218f7a34e3e)) {
            level.var_f99b1d319e65854c[level.var_f99b1d319e65854c.size] = struct.var_8ac77218f7a34e3e;
            level.var_a0b4eb1703be349a[level.var_a0b4eb1703be349a.size] = struct;
        }
        if (isdefined(struct.script_noteworthy) && struct.script_noteworthy == "vfx_ambientwar_node") {
            function_e89fc5f3b8084c2b(struct);
        } else {
            function_1f6c1a9b7564dc61(struct);
            level.struct[index] = undefined;
        }
    }
    level.struct = undefined;
    if (isdefined(level.var_b32e30f2a469bc5c)) {
        level thread [[ level.var_b32e30f2a469bc5c ]]();
        level.var_b32e30f2a469bc5c = undefined;
    }
    store_linked_smartobjects();
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5ab7
// Size: 0x38
function deletestructarray(value, key, delay) {
    structs = getstructarray(value, key);
    deletestructarray_ref(structs, delay);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5af6
// Size: 0x362
function deletestruct_ref(struct) {
    if (!isdefined(struct)) {
        return;
    }
    value = struct.script_linkname;
    if (isdefined(value) && isdefined(level.struct_class_names["script_linkname"]) && isdefined(level.struct_class_names["script_linkname"][value])) {
        foreach (i, _struct in level.struct_class_names["script_linkname"][value]) {
            if (isdefined(_struct) && struct == _struct) {
                level.struct_class_names["script_linkname"][value][i] = undefined;
            }
        }
        if (level.struct_class_names["script_linkname"][value].size == 0) {
            level.struct_class_names["script_linkname"][value] = undefined;
        }
    }
    value = struct.script_noteworthy;
    if (isdefined(value) && isdefined(level.struct_class_names["script_noteworthy"]) && isdefined(level.struct_class_names["script_noteworthy"][value])) {
        foreach (i, _struct in level.struct_class_names["script_noteworthy"][value]) {
            if (isdefined(_struct) && struct == _struct) {
                level.struct_class_names["script_noteworthy"][value][i] = undefined;
            }
        }
        if (level.struct_class_names["script_noteworthy"][value].size == 0) {
            level.struct_class_names["script_noteworthy"][value] = undefined;
        }
    }
    value = struct.target;
    if (isdefined(value) && isdefined(level.struct_class_names["target"]) && isdefined(level.struct_class_names["target"][value])) {
        foreach (i, _struct in level.struct_class_names["target"][value]) {
            if (isdefined(_struct) && struct == _struct) {
                level.struct_class_names["target"][value][i] = undefined;
            }
        }
        if (level.struct_class_names["target"][value].size == 0) {
            level.struct_class_names["target"][value] = undefined;
        }
    }
    value = struct.targetname;
    if (isdefined(value) && isdefined(level.struct_class_names["targetname"]) && isdefined(level.struct_class_names["targetname"][value])) {
        foreach (i, _struct in level.struct_class_names["targetname"][value]) {
            if (isdefined(_struct) && struct == _struct) {
                level.struct_class_names["targetname"][value][i] = undefined;
            }
        }
        if (level.struct_class_names["targetname"][value].size == 0) {
            level.struct_class_names["targetname"][value] = undefined;
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e5f
// Size: 0xe7
function deletestructarray_ref(structs, delay) {
    if (!isdefined(structs) || !isarray(structs) || structs.size == 0) {
        return;
    }
    delay = ter_op(isdefined(delay), delay, 0);
    delay = ter_op(delay > 0, delay, 0);
    if (delay > 0) {
        foreach (struct in structs) {
            deletestruct_ref(struct);
            wait(delay);
        }
    } else {
        foreach (struct in structs) {
            deletestruct_ref(struct);
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f4d
// Size: 0x39
function getstructarray_delete(value, key, delay) {
    structs = getstructarray(value, key);
    deletestructarray_ref(structs, delay);
    return structs;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f8e
// Size: 0x55
function function_a5079b5837467402(name, key, var_6e4d14e327c27975) {
    ents = getentarray(name, key, function_53c4c53197386572(var_6e4d14e327c27975, 0));
    if (isdefined(level.struct_class_names)) {
        ents = array_combine(ents, getstructarray(name, key));
    }
    return ents;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5feb
// Size: 0x45
function getent_or_struct(name, key, var_6e4d14e327c27975) {
    ent = getent(name, key, function_53c4c53197386572(var_6e4d14e327c27975, 0));
    if (isdefined(ent)) {
        return ent;
    }
    return getstruct(name, key);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6038
// Size: 0x3a
function fileprint_start(file) {
    /#
        filename = file;
        level.fileprint = 1;
        level.fileprintlinecount = 0;
        level.fileprint_filename = filename;
    #/
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6079
// Size: 0x19
function fileprint_map_start() {
    /#
        level.fileprint_mapentcount = 0;
        fileprint_map_header(1);
    #/
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6099
// Size: 0x5f
function fileprint_map_header(binclude_blank_worldspawn) {
    if (!isdefined(binclude_blank_worldspawn)) {
        binclude_blank_worldspawn = 0;
    }
    /#
        fileprint_launcher("Can't open more than one file at a time to print through launcher.");
        fileprint_launcher("Launcher write to file successful!");
        fileprint_launcher("MOD_IMPACT");
        if (!binclude_blank_worldspawn) {
            return;
        }
        fileprint_map_entity_start();
        fileprint_map_keypairprint("flag_wait_any_array needs an array of flag names passed in.", "Called getanim on an inexistent anim");
        fileprint_map_entity_end();
    #/
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x60ff
// Size: 0x33
function fileprint_map_keypairprint(key1, key2) {
    /#
        fileprint_launcher("Cover Right Crouch" + key1 + "Tried to disable pain on a non ai" + key2 + "Cover Right Crouch");
    #/
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6139
// Size: 0x69
function fileprint_map_entity_start() {
    /#
        /#
            assert(isdefined(level.fileprint_mapentcount), "notify");
        #/
        /#
            assert(!isdefined(level.fileprint_entitystart));
        #/
        level.fileprint_entitystart = 1;
        fileprint_launcher("<unknown string>" + level.fileprint_mapentcount);
        fileprint_launcher("<unknown string>");
        level.fileprint_mapentcount++;
    #/
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x61a9
// Size: 0x1c
function fileprint_map_entity_end() {
    /#
        fileprint_launcher("<unknown string>");
        level.fileprint_entitystart = undefined;
    #/
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x61cc
// Size: 0x41
function fileprint_radiant_vec(vector) {
    /#
        string = "<unknown string>" + vector[0] + "<unknown string>" + vector[1] + "<unknown string>" + vector[2] + "<unknown string>";
        return string;
    #/
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6214
// Size: 0x30
function call_on_notify_no_endon_death(notifystring, method, param1, param2) {
    childthread call_on_notify_proc(notifystring, method, param1, param2);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x624b
// Size: 0x40
function call_on_notify(notifystring, method, param1, param2, param3) {
    self endon("death");
    childthread call_on_notify_proc(notifystring, method, param1, param2, param3);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6292
// Size: 0x66
function call_on_notify_proc(notifystring, method, param1, param2, param3) {
    self waittill(notifystring);
    if (isdefined(param3)) {
        self builtin [[ method ]](param1, param2, param3);
    } else if (isdefined(param2)) {
        self builtin [[ method ]](param1, param2);
    } else if (isdefined(param1)) {
        self builtin [[ method ]](param1);
    } else {
        self builtin [[ method ]]();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62ff
// Size: 0x39
function thread_on_notify_no_endon_death(notifystring, function, param1, param2, ent) {
    childthread thread_on_notify_proc(notifystring, function, param1, param2, ent);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x633f
// Size: 0x117
function thread_on_notify(notifystring, function, param1, param2, ent, var_d136cf00da26018c, var_f63c23b8ec55b127) {
    self endon("death");
    if (isdefined(var_d136cf00da26018c) && isdefined(var_f63c23b8ec55b127)) {
        if (!isarray(var_d136cf00da26018c)) {
            var_d136cf00da26018c = [0:var_d136cf00da26018c];
        }
        if (!isarray(var_f63c23b8ec55b127)) {
            var_f63c23b8ec55b127 = [0:var_f63c23b8ec55b127];
        }
        foreach (entity in var_d136cf00da26018c) {
            foreach (message in var_f63c23b8ec55b127) {
                entity endon(message);
            }
        }
    }
    childthread thread_on_notify_proc(notifystring, function, param1, param2, ent);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x645d
// Size: 0x5d
function thread_on_notify_proc(notifystring, function, param1, param2, ent) {
    self waittill(notifystring);
    if (!isdefined(ent)) {
        ent = self;
    }
    if (isdefined(param2)) {
        ent thread [[ function ]](param1, param2);
    } else if (isdefined(param1)) {
        ent thread [[ function ]](param1);
    } else {
        ent thread [[ function ]]();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x64c1
// Size: 0x10d
function function_fb7b452e8dd1dddc(notifystring, function, params, ent, var_d136cf00da26018c, var_f63c23b8ec55b127) {
    self endon("death");
    if (isdefined(var_d136cf00da26018c) && isdefined(var_f63c23b8ec55b127)) {
        if (!isarray(var_d136cf00da26018c)) {
            var_d136cf00da26018c = [0:var_d136cf00da26018c];
        }
        if (!isarray(var_f63c23b8ec55b127)) {
            var_f63c23b8ec55b127 = [0:var_f63c23b8ec55b127];
        }
        foreach (entity in var_d136cf00da26018c) {
            foreach (message in var_f63c23b8ec55b127) {
                entity endon(message);
            }
        }
    }
    childthread function_399a710b148277ad(notifystring, function, params, ent);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65d5
// Size: 0x17c
function function_399a710b148277ad(notifystring, function, params, ent) {
    self waittill(notifystring);
    if (!isdefined(ent)) {
        ent = self;
    }
    if (!isdefined(params)) {
        ent thread [[ function ]]();
    }
    switch (params.size) {
    case 0:
        ent thread [[ function ]]();
        break;
    case 1:
        ent thread [[ function ]](params[0]);
        break;
    case 2:
        ent thread [[ function ]](params[0], params[1]);
        break;
    case 3:
        ent thread [[ function ]](params[0], params[1], params[2]);
        break;
    case 4:
        ent thread [[ function ]](params[0], params[1], params[2], params[3]);
        break;
    case 5:
        ent thread [[ function ]](params[0], params[1], params[2], params[3], params[4]);
        break;
    case 6:
        ent thread [[ function ]](params[0], params[1], params[2], params[3], params[4], params[5]);
        break;
    case 7:
        ent thread [[ function ]](params[0], params[1], params[2], params[3], params[4], params[5], params[6]);
        break;
    default:
        /#
            assertmsg("thread_on_notify_infiniteParams_proc: Params array of size " + params.size + " not yet supported. A scripter can fix this :)");
        #/
        break;
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 14, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6758
// Size: 0x93
function delaycall(timer, func, param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807, var_5a6a89fa118825d4, var_5a6a8cfa11882c6d) {
    thread delaycall_proc(func, undefined, timer, param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807, var_5a6a89fa118825d4, var_5a6a8cfa11882c6d);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 15, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67f2
// Size: 0x9c
function function_ad9433aab9fcdf04(timer, endonevent, func, param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807, var_5a6a89fa118825d4, var_5a6a8cfa11882c6d) {
    thread delaycall_proc(func, endonevent, timer, param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807, var_5a6a89fa118825d4, var_5a6a8cfa11882c6d);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params f, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6895
// Size: 0x25c
function delaycall_proc(func, endonevent, timer, param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807, var_5a6a89fa118825d4, var_5a6a8cfa11882c6d) {
    if (issp() || iscp()) {
        self endon("death");
        self endon("stop_delay_call");
    }
    if (isdefined(endonevent)) {
        if (!isarray(endonevent)) {
            endonevent = [0:endonevent];
        }
        foreach (var_cb57658b734d4b0c in endonevent) {
            self endon(var_cb57658b734d4b0c);
        }
    }
    wait(timer);
    if (isdefined(var_5a6a8cfa11882c6d)) {
        self builtin [[ func ]](param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807, var_5a6a89fa118825d4, var_5a6a8cfa11882c6d);
    } else if (isdefined(var_5a6a89fa118825d4)) {
        self builtin [[ func ]](param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807, var_5a6a89fa118825d4);
    } else if (isdefined(var_5a6a8afa11882807)) {
        self builtin [[ func ]](param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807);
    } else if (isdefined(var_f3cb1651d632a555)) {
        self builtin [[ func ]](param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555);
    } else if (isdefined(param8)) {
        self builtin [[ func ]](param1, param2, param3, param4, param5, param6, param7, param8);
    } else if (isdefined(param7)) {
        self builtin [[ func ]](param1, param2, param3, param4, param5, param6, param7);
    } else if (isdefined(param6)) {
        self builtin [[ func ]](param1, param2, param3, param4, param5, param6);
    } else if (isdefined(param5)) {
        self builtin [[ func ]](param1, param2, param3, param4, param5);
    } else if (isdefined(param4)) {
        self builtin [[ func ]](param1, param2, param3, param4);
    } else if (isdefined(param3)) {
        self builtin [[ func ]](param1, param2, param3);
    } else if (isdefined(param2)) {
        self builtin [[ func ]](param1, param2);
    } else if (isdefined(param1)) {
        self builtin [[ func ]](param1);
    } else {
        self builtin [[ func ]]();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6af8
// Size: 0x1b
function string_starts_with(string, start) {
    return isstartstr(string, start);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b1b
// Size: 0x83
function function_996b01cd49d0128d(str_array, var_53ca40ab574ee9b8) {
    /#
        assertex(isdefined(str_array), "Must defined str_array");
    #/
    /#
        assertex(isdefined(str_array.size > 0), "str_array must not be empty");
    #/
    var_53ca40ab574ee9b8 = function_53c4c53197386572(var_53ca40ab574ee9b8, "");
    str = "";
    for (i = 0; i < str_array.size - 1; i++) {
        str = str + str_array[i] + var_53ca40ab574ee9b8;
    }
    return str + str_array[str_array.size - 1];
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6ba6
// Size: 0xa0
function function_d2b91c94ed0b3dff(str, var_53ca40ab574ee9b8) {
    /#
        assertex(isdefined(str), "str must be defined");
    #/
    /#
        assertex(isdefined(var_53ca40ab574ee9b8), "separator must be defined");
    #/
    if (str.size == 0) {
        return [];
    }
    array = [];
    start_index = 0;
    for (i = 0; i < str.size; i++) {
        if (str[i] == var_53ca40ab574ee9b8) {
            array = array_add(array, getsubstr(str, start_index, i));
            start_index = i + 1;
        }
    }
    array = array_add(array, getsubstr(str, start_index, str.size));
    return array;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c4e
// Size: 0x91
function plot_points(plotpoints, r, g, b, timer) {
    lastpoint = plotpoints[0];
    if (!isdefined(r)) {
        r = 1;
    }
    if (!isdefined(g)) {
        g = 1;
    }
    if (!isdefined(b)) {
        b = 1;
    }
    if (!isdefined(timer)) {
        timer = 0.05;
    }
    for (i = 1; i < plotpoints.size; i++) {
        thread draw_line_for_time(lastpoint, plotpoints[i], r, g, b, timer);
        lastpoint = plotpoints[i];
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ce6
// Size: 0x76
function draw_line_for_time(org1, org2, r, g, b, timer, endonevent) {
    if (isdefined(endonevent)) {
        level endon(endonevent);
    }
    timer = gettime() + timer * 1000;
    while (gettime() < timer) {
        /#
            line(org1, org2, (r, g, b), 1);
        #/
        wait(0.05);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d63
// Size: 0x147
function draw_circle(center, radius, color, alpha, depthtest, duration) {
    var_851df4cd0132b5fa = 16;
    anglefrac = 360 / var_851df4cd0132b5fa;
    var_8af33769f877b5d6 = [];
    for (i = 0; i < var_851df4cd0132b5fa; i++) {
        angle = anglefrac * i;
        var_8a9f895755fd607e = cos(angle) * radius;
        var_d867033ab311670b = sin(angle) * radius;
        x = center[0] + var_8a9f895755fd607e;
        y = center[1] + var_d867033ab311670b;
        z = center[2];
        var_8af33769f877b5d6[var_8af33769f877b5d6.size] = (x, y, z);
    }
    for (i = 0; i < var_8af33769f877b5d6.size; i++) {
        start = var_8af33769f877b5d6[i];
        if (i + 1 >= var_8af33769f877b5d6.size) {
            end = var_8af33769f877b5d6[0];
        } else {
            end = var_8af33769f877b5d6[i + 1];
        }
        /#
            line(start, end, color, alpha, depthtest, duration);
        #/
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6eb1
// Size: 0x1b
function array_add(array, object) {
    array[array.size] = object;
    return array;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ed4
// Size: 0x2f
function array_add_safe(array, object) {
    if (!isdefined(object)) {
        return array;
    }
    if (!isdefined(array)) {
        array[0] = object;
    } else {
        array[array.size] = object;
    }
    return array;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f0b
// Size: 0x2f
function function_6d6af8144a5131f1(array, object) {
    array = function_53c4c53197386572(array, []);
    if (!function_fc64178f71375137(array, object)) {
        array[array.size] = object;
    }
    return array;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f42
// Size: 0x5d
function array_delete(array) {
    foreach (ent in array) {
        if (isdefined(ent)) {
            ent delete();
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fa6
// Size: 0x78
function array_insert(array, object, index) {
    if (index == array.size) {
        temp = array;
        temp[temp.size] = object;
        return temp;
    }
    temp = [];
    offset = 0;
    for (i = 0; i < array.size; i++) {
        if (i == index) {
            temp[i] = object;
            offset = 1;
        }
        temp[i + offset] = array[i];
    }
    return temp;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7026
// Size: 0x86
function function_ef4b3df86351aa00(array1, array2, index) {
    /#
        assertex(index >= 0, "Index must be greater or equal to zero.");
    #/
    for (i = array1.size + array2.size - 1; 1; i--) {
        if (i < index + array2.size) {
            for (j = array2.size - 1; j >= 0; j--) {
                array1[i] = array2[j];
                i--;
            }
            return array1;
        }
        array1[i] = array1[i - array2.size];
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70b3
// Size: 0x1ba
function array_combine(array1, array2, var_4f6ff14f222afe0b, var_4f6ff64f222b090a, var_4f6ff74f222b0b3d) {
    array = [];
    if (isdefined(array1)) {
        foreach (item in array1) {
            array[array.size] = item;
        }
    }
    if (isdefined(array2)) {
        foreach (item in array2) {
            array[array.size] = item;
        }
    }
    if (isdefined(var_4f6ff14f222afe0b)) {
        foreach (item in var_4f6ff14f222afe0b) {
            array[array.size] = item;
        }
    }
    if (isdefined(var_4f6ff64f222b090a)) {
        foreach (item in var_4f6ff64f222b090a) {
            array[array.size] = item;
        }
    }
    if (isdefined(var_4f6ff74f222b0b3d)) {
        foreach (item in var_4f6ff74f222b0b3d) {
            array[array.size] = item;
        }
    }
    return array;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7275
// Size: 0xac
function array_combine_multiple(var_c70b9adbc218860a) {
    var_c706acdbc21284c9 = [];
    foreach (arr in var_c70b9adbc218860a) {
        foreach (item in arr) {
            var_c706acdbc21284c9[var_c706acdbc21284c9.size] = item;
        }
    }
    return var_c706acdbc21284c9;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7329
// Size: 0xbd
function array_combine_unique(array1, array2) {
    var_4f6ff14f222afe0b = [];
    foreach (item in array1) {
        var_4f6ff14f222afe0b[var_4f6ff14f222afe0b.size] = item;
    }
    foreach (item in array2) {
        if (function_fc64178f71375137(var_4f6ff14f222afe0b, item)) {
            continue;
        }
        var_4f6ff14f222afe0b[var_4f6ff14f222afe0b.size] = item;
    }
    return var_4f6ff14f222afe0b;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73ee
// Size: 0x66
function array_combine_unique_keys(array1, array2) {
    foreach (key, item in array2) {
        if (!isdefined(array1[key])) {
            array1[key] = item;
        }
    }
    return array1;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x745c
// Size: 0xc0
function array_combine_non_integer_indices(array1, array2) {
    var_4f6ff14f222afe0b = [];
    foreach (index, item in array1) {
        /#
            assert(!isdefined(var_4f6ff14f222afe0b[index]));
        #/
        var_4f6ff14f222afe0b[index] = item;
    }
    foreach (index, item in array2) {
        /#
            assert(!isdefined(var_4f6ff14f222afe0b[index]));
        #/
        var_4f6ff14f222afe0b[index] = item;
    }
    return var_4f6ff14f222afe0b;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7524
// Size: 0x76
function array_intersection(array1, array2) {
    var_4f6ff14f222afe0b = [];
    foreach (item in array1) {
        if (function_fc64178f71375137(array2, item)) {
            var_4f6ff14f222afe0b[var_4f6ff14f222afe0b.size] = item;
        }
    }
    return var_4f6ff14f222afe0b;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75a2
// Size: 0x76
function array_difference(array1, array2) {
    var_4f6ff14f222afe0b = [];
    foreach (item in array1) {
        if (!function_fc64178f71375137(array2, item)) {
            var_4f6ff14f222afe0b[var_4f6ff14f222afe0b.size] = item;
        }
    }
    return var_4f6ff14f222afe0b;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7620
// Size: 0x64
function array_convert_keys_to_ints(array) {
    var_8e3dccabce95e353 = [];
    foreach (item in array) {
        var_8e3dccabce95e353[var_8e3dccabce95e353.size] = item;
    }
    return var_8e3dccabce95e353;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x768c
// Size: 0x2a
function function_7a2aaa4a09a4d250(array) {
    if (array.size > 0) {
        random_index = randomint(array.size);
        return array[random_index];
    }
    return undefined;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76be
// Size: 0x56
function array_randomize(array) {
    for (i = 0; i < array.size - 1; i++) {
        j = randomintrange(i, array.size);
        temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
    return array;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x771c
// Size: 0xd6
function function_1bb9ae4b5f3e2ab(array, seed, a, c, m) {
    if (!isdefined(array) || !isdefined(seed)) {
        /#
            assertmsg("An undefined array or seed was passed into array_randomize_seeded");
        #/
        return [];
    }
    x = seed;
    a = function_53c4c53197386572(a, 29);
    c = function_53c4c53197386572(c, 19);
    m = function_53c4c53197386572(m, int(max(array.size, 41)));
    for (i = 0; i < array.size; i++) {
        x = (x * a + c) % m;
        var_795a46d2f3321b31 = x % array.size;
        tmp = array[i];
        array[i] = array[var_795a46d2f3321b31];
        array[var_795a46d2f3321b31] = tmp;
    }
    return array;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77fa
// Size: 0xda
function array_randomize_objects(array) {
    var_c2c83573883cbb37 = [];
    var_50f783a5617f8940 = array;
    while (var_50f783a5617f8940.size > 0) {
        randomindex = randomintrange(0, var_50f783a5617f8940.size);
        newarray = [];
        var_d4f588e7361c391 = 0;
        foreach (key, object in var_50f783a5617f8940) {
            if (var_d4f588e7361c391 == randomindex) {
                var_c2c83573883cbb37[ter_op(isstring(key), key, var_c2c83573883cbb37.size)] = object;
            } else {
                newarray[ter_op(isstring(key), key, newarray.size)] = object;
            }
            var_d4f588e7361c391++;
        }
        var_50f783a5617f8940 = newarray;
    }
    return var_c2c83573883cbb37;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78dc
// Size: 0x3d
function array_reverse(array) {
    array2 = [];
    for (i = array.size - 1; i >= 0; i--) {
        array2[array2.size] = array[i];
    }
    return array2;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7921
// Size: 0x94
function array_slice(array, startindex, endindex) {
    /#
        assert(isdefined(array) && isarray(array));
    #/
    /#
        assert(isdefined(startindex));
    #/
    if (array.size <= 0) {
        return [];
    }
    if (!isdefined(endindex) || endindex > array.size) {
        endindex = array.size;
    }
    if (startindex == 0 && endindex == array.size) {
        return array;
    }
    var_a8763f33264c3988 = [];
    for (index = startindex; index < endindex; index++) {
        var_a8763f33264c3988[var_a8763f33264c3988.size] = array[index];
    }
    return var_a8763f33264c3988;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79bd
// Size: 0x1b
function array_contains(array, compare) {
    return function_fc64178f71375137(array, compare);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79e0
// Size: 0x3c
function array_contains_key(array, key) {
    /#
        assertex(isarray(array), "array_contains_key() passed invalid array.");
    #/
    /#
        assertex(isdefined(key), "array_contains_key() passed undefind key.");
    #/
    return isdefined(array[key]);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a24
// Size: 0x62
function array_find(array, item) {
    foreach (idx, test in array) {
        if (test == item) {
            return idx;
        }
    }
    return undefined;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a8e
// Size: 0x1b
function array_remove(ents, var_f7e215bd10cc45e9) {
    return function_da1cac199ebc3dbe(ents, var_f7e215bd10cc45e9);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7ab1
// Size: 0x52
function array_exclude(array, var_8da65502dc92404) {
    newarray = array;
    for (i = 0; i < var_8da65502dc92404.size; i++) {
        if (function_fc64178f71375137(array, var_8da65502dc92404[i])) {
            newarray = array_remove(newarray, var_8da65502dc92404[i]);
        }
    }
    return newarray;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b0b
// Size: 0x64
function array_remove_array(ents, var_8f445b88c8c227a3) {
    foreach (var_f7e215bd10cc45e9 in var_8f445b88c8c227a3) {
        ents = array_remove(ents, var_f7e215bd10cc45e9);
    }
    return ents;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b77
// Size: 0x96
function array_remove_index(array, index, var_ca8b90cd9c832fd9) {
    newarray = [];
    foreach (var_109ebf347b2f2ece, value in array) {
        if (var_109ebf347b2f2ece == index) {
            continue;
        }
        if (istrue(var_ca8b90cd9c832fd9)) {
            var_c6b1a6d041f1309 = var_109ebf347b2f2ece;
        } else {
            var_c6b1a6d041f1309 = newarray.size;
        }
        newarray[var_c6b1a6d041f1309] = value;
    }
    return newarray;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c15
// Size: 0x8a
function array_removeundefined(array, var_6814b94851c2ef70) {
    newarray = [];
    var_6814b94851c2ef70 = function_53c4c53197386572(var_6814b94851c2ef70, 0);
    foreach (i, member in array) {
        if (!isdefined(member)) {
            continue;
        }
        if (var_6814b94851c2ef70) {
            newarray[i] = member;
        } else {
            newarray[newarray.size] = member;
        }
    }
    return newarray;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ca7
// Size: 0x95
function function_fdc9d5557c53078e(array, var_6814b94851c2ef70) {
    newarray = [];
    var_6814b94851c2ef70 = function_53c4c53197386572(var_6814b94851c2ef70, 0);
    foreach (i, member in array) {
        if (!isdefined(member) || !isalive(member)) {
            continue;
        }
        if (var_6814b94851c2ef70) {
            newarray[i] = member;
        } else {
            newarray[newarray.size] = member;
        }
    }
    return newarray;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d44
// Size: 0x8e
function array_removedead(array, var_6814b94851c2ef70) {
    newarray = [];
    var_6814b94851c2ef70 = function_53c4c53197386572(var_6814b94851c2ef70, 0);
    foreach (i, member in array) {
        if (!isalive(member)) {
            continue;
        }
        if (var_6814b94851c2ef70) {
            newarray[i] = member;
        } else {
            newarray[newarray.size] = member;
        }
    }
    return newarray;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7dda
// Size: 0x74
function array_remove_key(array, var_b3e77f92460be011) {
    newarray = [];
    foreach (key, item in array) {
        if (var_b3e77f92460be011 == key) {
            continue;
        }
        newarray[key] = item;
    }
    return newarray;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e56
// Size: 0x79
function array_remove_duplicates(array) {
    var_de1e630f4ea7f25c = [];
    foreach (item in array) {
        if (!isdefined(item)) {
            continue;
        }
        if (function_fc64178f71375137(var_de1e630f4ea7f25c, item)) {
            continue;
        }
        var_de1e630f4ea7f25c[var_de1e630f4ea7f25c.size] = item;
    }
    return var_de1e630f4ea7f25c;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ed7
// Size: 0x54
function array_get_first_item(array) {
    foreach (item in array) {
        return item;
    }
    return undefined;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f33
// Size: 0x61
function function_350e192b13bea45c(array) {
    last_item = undefined;
    foreach (item in array) {
        last_item = item;
    }
    return last_item;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f9c
// Size: 0x98
function function_57091b2d67654a14(array, var_f7e215bd10cc45e9) {
    result = [];
    removed = 0;
    foreach (item in array_reverse(array)) {
        if (!removed && item == var_f7e215bd10cc45e9) {
            removed = 1;
        } else {
            result[result.size] = item;
        }
    }
    return array_reverse(result);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x803c
// Size: 0x16a
function array_levelthread(array, process, var1, var_d2806725e4c80618, var_d2806825e4c8084b) {
    if (isdefined(var_d2806825e4c8084b)) {
        foreach (ent in array) {
            thread [[ process ]](ent, var1, var_d2806725e4c80618, var_d2806825e4c8084b);
        }
        return;
    }
    if (isdefined(var_d2806725e4c80618)) {
        foreach (ent in array) {
            thread [[ process ]](ent, var1, var_d2806725e4c80618);
        }
        return;
    }
    if (isdefined(var1)) {
        foreach (ent in array) {
            thread [[ process ]](ent, var1);
        }
        return;
    }
    foreach (ent in array) {
        thread [[ process ]](ent);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x81ad
// Size: 0x16a
function array_levelcall(array, process, var1, var_d2806725e4c80618, var_d2806825e4c8084b) {
    if (isdefined(var_d2806825e4c8084b)) {
        foreach (ent in array) {
            builtin [[ process ]](ent, var1, var_d2806725e4c80618, var_d2806825e4c8084b);
        }
        return;
    }
    if (isdefined(var_d2806725e4c80618)) {
        foreach (ent in array) {
            builtin [[ process ]](ent, var1, var_d2806725e4c80618);
        }
        return;
    }
    if (isdefined(var1)) {
        foreach (ent in array) {
            builtin [[ process ]](ent, var1);
        }
        return;
    }
    foreach (ent in array) {
        builtin [[ process ]](ent);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x831e
// Size: 0x95
function array_sort_with_func(array, compare_func) {
    /#
        assertex(isdefined(array), "Array not defined.");
    #/
    /#
        assertex(isdefined(compare_func), "Compare function not defined.");
    #/
    for (j = 1; j < array.size; j++) {
        key = array[j];
        for (i = j - 1; i >= 0 && ![[ compare_func ]](array[i], key); i--) {
            array[i + 1] = array[i];
        }
        array[i + 1] = key;
    }
    return array;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83bb
// Size: 0xb6
function array_sort_by_script_index(array) {
    var_8201c2d395d279d9 = [];
    for (index = 0; index < array.size; index++) {
        foreach (item in array) {
            if (is_equal(item.script_index, index)) {
                var_8201c2d395d279d9 = array_add(var_8201c2d395d279d9, item);
            }
        }
    }
    var_dfa02eaccc952a61 = array_remove_array(array, var_8201c2d395d279d9);
    var_8201c2d395d279d9 = array_combine(var_8201c2d395d279d9, var_dfa02eaccc952a61);
    return var_8201c2d395d279d9;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8479
// Size: 0x16
function array_average(array) {
    return array_sum(array) / array.size;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8497
// Size: 0x63
function array_sum(array) {
    var_be66de030b25508c = 0;
    foreach (item in array) {
        var_be66de030b25508c = var_be66de030b25508c + item;
    }
    return var_be66de030b25508c;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8502
// Size: 0xf7
function function_427c36d659d2f67(array, var_d1f4456463c5272d, var_3dfeb81d6a088812) {
    if (!isdefined(var_3dfeb81d6a088812)) {
        var_3dfeb81d6a088812 = 0;
    }
    /#
        assertex(isdefined(array) && isarray(array), "The first argument must be a valid array.");
    #/
    /#
        assertex(isdefined(var_d1f4456463c5272d) && isfunction(var_d1f4456463c5272d), "The second argument must be a valid function.");
    #/
    if (istrue(var_3dfeb81d6a088812)) {
        foreach (var_b1990cb9afdaf9f1 in array) {
            self thread [[ var_d1f4456463c5272d ]](var_b1990cb9afdaf9f1);
        }
    } else {
        foreach (var_b1990cb9afdaf9f1 in array) {
            self [[ var_d1f4456463c5272d ]](var_b1990cb9afdaf9f1);
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8600
// Size: 0x215
function function_ec65095e6f342856(array, var_d1f4456463c5272d, var_818871783e92735e, var_6fd8f67384dda4d0, var_8faa885b79ec7917, var_3dfeb81d6a088812) {
    if (!isdefined(var_818871783e92735e)) {
        var_818871783e92735e = undefined;
    }
    if (!isdefined(var_6fd8f67384dda4d0)) {
        var_6fd8f67384dda4d0 = undefined;
    }
    if (!isdefined(var_8faa885b79ec7917)) {
        var_8faa885b79ec7917 = 5;
    }
    if (!isdefined(var_3dfeb81d6a088812)) {
        var_3dfeb81d6a088812 = 0;
    }
    /#
        assertex(isdefined(array) && isarray(array), "The first argument must be a valid array.");
    #/
    /#
        assertex(isdefined(var_d1f4456463c5272d) && isfunction(var_d1f4456463c5272d), "The second argument must be a valid function.");
    #/
    var_7a73fce97b998437 = 0;
    if (isdefined(var_818871783e92735e) && isfunction(var_818871783e92735e)) {
        var_7a73fce97b998437 = 1;
    }
    var_344b31701913dda0 = array.size;
    var_609bfd613f331f2b = max(var_8faa885b79ec7917 / level.framedurationseconds, 1);
    var_9e5988ae3851a115 = max(var_344b31701913dda0 / var_609bfd613f331f2b, 1);
    var_9e5988ae3851a115 = ceil(var_9e5988ae3851a115);
    var_dce766d46ccbf3d4 = 0;
    if (istrue(var_3dfeb81d6a088812)) {
        foreach (var_b1990cb9afdaf9f1 in array) {
            var_e295a391c3f9155d = !var_7a73fce97b998437 || var_7a73fce97b998437 && self [[ var_818871783e92735e ]](var_b1990cb9afdaf9f1);
            if (var_e295a391c3f9155d) {
                self thread [[ var_d1f4456463c5272d ]](var_b1990cb9afdaf9f1);
            }
            var_dce766d46ccbf3d4++;
            if (var_dce766d46ccbf3d4 >= var_9e5988ae3851a115) {
                waitframe();
                var_dce766d46ccbf3d4 = 0;
            }
        }
    } else {
        foreach (var_b1990cb9afdaf9f1 in array) {
            var_e295a391c3f9155d = !var_7a73fce97b998437 || var_7a73fce97b998437 && self [[ var_818871783e92735e ]](var_b1990cb9afdaf9f1);
            if (var_e295a391c3f9155d) {
                self [[ var_d1f4456463c5272d ]](var_b1990cb9afdaf9f1);
            }
            var_dce766d46ccbf3d4++;
            if (var_dce766d46ccbf3d4 >= var_9e5988ae3851a115) {
                waitframe();
                var_dce766d46ccbf3d4 = 0;
            }
        }
    }
    if (isdefined(var_6fd8f67384dda4d0) && isfunction(var_6fd8f67384dda4d0)) {
        self [[ var_6fd8f67384dda4d0 ]]();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x881c
// Size: 0xaa
function function_e81fabd6ea651c21(array, var_d1f4456463c5272d, var_3dfeb81d6a088812) {
    if (!isdefined(var_3dfeb81d6a088812)) {
        var_3dfeb81d6a088812 = 0;
    }
    /#
        assertex(isdefined(array) && isarray(array), "The first argument must be a valid array.");
    #/
    /#
        assertex(isdefined(var_d1f4456463c5272d) && isfunction(var_d1f4456463c5272d), "The second argument must be a valid function.");
    #/
    if (istrue(var_3dfeb81d6a088812)) {
        for (index = 0; index < array.size; index++) {
            var_b1990cb9afdaf9f1 = array[index];
            self thread [[ var_d1f4456463c5272d ]](var_b1990cb9afdaf9f1);
        }
    } else {
        for (index = 0; index < array.size; index++) {
            var_b1990cb9afdaf9f1 = array[index];
            self [[ var_d1f4456463c5272d ]](var_b1990cb9afdaf9f1);
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x88cd
// Size: 0x37
function array_divide(array, var_f1563935aeeb5199) {
    for (i = 0; i < array.size; i++) {
        array[i] = array[i] / var_f1563935aeeb5199;
    }
    return array;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x890c
// Size: 0x67
function function_fcd0e0af8e1d238d(a_ents, e_volume) {
    foreach (e_ent in a_ents) {
        if (!e_ent istouching(e_volume)) {
            return 0;
        }
    }
    return 1;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x897b
// Size: 0x18
function function_ef2b4cd10b36a1ae(object) {
    return isdefined(object) && isplayer(object);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x899b
// Size: 0x1d
function function_5a522719a7ec12b8(object) {
    return function_ef2b4cd10b36a1ae(object) && isalive(object);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89c0
// Size: 0x105
function create_deck(var_4e30b77c0ee2f8ac, autoshuffle, var_85dd38782ccc953e, prevent_redraw) {
    if (!isdefined(var_4e30b77c0ee2f8ac)) {
        var_4e30b77c0ee2f8ac = [];
    } else if (!isarray(var_4e30b77c0ee2f8ac)) {
        var_4e30b77c0ee2f8ac = [0:var_4e30b77c0ee2f8ac];
    }
    var_81a329728abb79e4 = spawnstruct();
    var_81a329728abb79e4.items = [];
    var_81a329728abb79e4.index = 0;
    var_81a329728abb79e4.autoshuffle = !isdefined(autoshuffle) || autoshuffle;
    var_81a329728abb79e4.prevent_redraw = !isdefined(prevent_redraw) || prevent_redraw;
    foreach (item in var_4e30b77c0ee2f8ac) {
        var_81a329728abb79e4.items[var_81a329728abb79e4.items.size] = item;
    }
    if (istrue(var_85dd38782ccc953e)) {
        var_81a329728abb79e4 deck_shuffle();
    }
    return var_81a329728abb79e4;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8acd
// Size: 0xc2
function deck_draw() {
    /#
        assertex(isstruct(self) && isdefined(self.items) && isdefined(self.index), "draw_from_deck() must be called on a deck. Call create_deck()");
    #/
    var_81a329728abb79e4 = self;
    if (var_81a329728abb79e4.items.size == 0) {
        return undefined;
    }
    if (var_81a329728abb79e4.index >= var_81a329728abb79e4.items.size) {
        if (var_81a329728abb79e4.autoshuffle) {
            var_81a329728abb79e4 deck_shuffle();
        } else {
            var_81a329728abb79e4.index = 0;
        }
    }
    var_34e4e8ecc5db9e4b = var_81a329728abb79e4.items[var_81a329728abb79e4.index];
    var_81a329728abb79e4.index++;
    return var_34e4e8ecc5db9e4b;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b97
// Size: 0x195
function deck_shuffle() {
    /#
        assertex(isstruct(self) && isdefined(self.items) && isdefined(self.index), "deck_shuffle() must be called on a deck. Call create_deck()");
    #/
    var_81a329728abb79e4 = self;
    if (var_81a329728abb79e4.index == 0 || !var_81a329728abb79e4.prevent_redraw || var_81a329728abb79e4.items.size <= 1) {
        var_81a329728abb79e4.items = array_randomize(var_81a329728abb79e4.items);
        var_81a329728abb79e4.index = 0;
        return;
    }
    j = randomintrange(0, var_81a329728abb79e4.items.size - 1);
    if (j == var_81a329728abb79e4.index - 1) {
        j++;
    }
    temp = var_81a329728abb79e4.items[0];
    var_81a329728abb79e4.items[0] = var_81a329728abb79e4.items[j];
    var_81a329728abb79e4.items[j] = temp;
    for (i = 1; i < var_81a329728abb79e4.items.size - 1; i++) {
        j = randomintrange(i, var_81a329728abb79e4.items.size);
        temp = var_81a329728abb79e4.items[i];
        var_81a329728abb79e4.items[i] = var_81a329728abb79e4.items[j];
        var_81a329728abb79e4.items[j] = temp;
    }
    var_81a329728abb79e4.index = 0;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d33
// Size: 0x73
function random(array) {
    newarray = [];
    foreach (value in array) {
        newarray[newarray.size] = value;
    }
    if (!newarray.size) {
        return undefined;
    }
    return newarray[randomint(newarray.size)];
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8dae
// Size: 0x24
function function_f1164393dac4665a(array) {
    keys = getarraykeys(array);
    return random(keys);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8dda
// Size: 0x100
function function_6e4039e57d0a3e7e(array, weights) {
    /#
        assertex(array.size == weights.size, "array and weights must be of the same size!");
    #/
    totalweight = 0;
    foreach (value in weights) {
        totalweight = totalweight + value;
    }
    if (totalweight == 0) {
        return undefined;
    }
    weight = randomint(totalweight);
    var_f193d5e311236e6c = undefined;
    foreach (i, value in array) {
        if (weight < weights[i]) {
            var_f193d5e311236e6c = value;
            break;
        } else {
            weight = weight - weights[i];
        }
    }
    return var_f193d5e311236e6c;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8ee2
// Size: 0xf2
function function_a656c6dfb7dcb33a(var_5d99a225cb875dda) {
    totalweight = 0;
    foreach (struct in var_5d99a225cb875dda) {
        totalweight = totalweight + struct.weight;
    }
    var_afb27532ad1515a6 = randomint(totalweight);
    var_c2a009e075d70716 = 0;
    var_cc0cc8eadd280699 = undefined;
    foreach (struct in var_5d99a225cb875dda) {
        var_c2a009e075d70716 = var_c2a009e075d70716 + struct.weight;
        if (var_c2a009e075d70716 > var_afb27532ad1515a6) {
            var_cc0cc8eadd280699 = struct;
            break;
        }
    }
    return var_cc0cc8eadd280699;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8fdc
// Size: 0x92
function random_weight_sorted(array) {
    newarray = [];
    foreach (value in array) {
        newarray[newarray.size] = value;
    }
    if (!newarray.size) {
        return undefined;
    }
    var_ddcccbf258180536 = randomint(newarray.size * newarray.size);
    return newarray[newarray.size - 1 - int(sqrt(var_ddcccbf258180536))];
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9076
// Size: 0xa8
function alphabetize(array) {
    if (array.size <= 1) {
        return array;
    }
    count = 0;
    for (var_629422ef86dfd9e1 = array.size - 1; var_629422ef86dfd9e1 >= 1; var_629422ef86dfd9e1--) {
        var_c29e520efe22bbe7 = array[var_629422ef86dfd9e1];
        var_56120302dfee9eed = var_629422ef86dfd9e1;
        for (i = 0; i < var_629422ef86dfd9e1; i++) {
            string1 = array[i];
            if (stricmp(string1, var_c29e520efe22bbe7) > 0) {
                var_c29e520efe22bbe7 = string1;
                var_56120302dfee9eed = i;
            }
        }
        if (var_56120302dfee9eed != var_629422ef86dfd9e1) {
            array[var_56120302dfee9eed] = array[var_629422ef86dfd9e1];
            array[var_629422ef86dfd9e1] = var_c29e520efe22bbe7;
        }
    }
    return array;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 12, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9126
// Size: 0x7e
function array_thread_amortized(entities, process, var_b2f6e3841e5273bf, var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d, var_d2806b25e4c80ee4, var_d2806c25e4c81117, var_d2806125e4c7f8e6, var_d2806225e4c7fb19) {
    thread function_d049f2bd4e2b0918(entities, process, var_b2f6e3841e5273bf, var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d, var_d2806b25e4c80ee4, var_d2806c25e4c81117, var_d2806125e4c7f8e6, var_d2806225e4c7fb19);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params c, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91ab
// Size: 0x50c
function function_d049f2bd4e2b0918(entities, process, var_b2f6e3841e5273bf, var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d, var_d2806b25e4c80ee4, var_d2806c25e4c81117, var_d2806125e4c7f8e6, var_d2806225e4c7fb19) {
    if (!isdefined(var1)) {
        foreach (ent in entities) {
            if (isai(ent) && !isalive(ent) || !isdefined(ent)) {
                continue;
            }
            ent thread [[ process ]]();
            wait(var_b2f6e3841e5273bf);
        }
        return;
    }
    if (!isdefined(var_d2806725e4c80618)) {
        foreach (ent in entities) {
            if (isai(ent) && !isalive(ent) || !isdefined(ent)) {
                continue;
            }
            ent thread [[ process ]](var1);
            wait(var_b2f6e3841e5273bf);
        }
        return;
    }
    if (!isdefined(var_d2806825e4c8084b)) {
        foreach (ent in entities) {
            if (isai(ent) && !isalive(ent) || !isdefined(ent)) {
                continue;
            }
            ent thread [[ process ]](var1, var_d2806725e4c80618);
            wait(var_b2f6e3841e5273bf);
        }
        return;
    }
    if (!isdefined(var_d2806d25e4c8134a)) {
        foreach (ent in entities) {
            if (isai(ent) && !isalive(ent) || !isdefined(ent)) {
                continue;
            }
            ent thread [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b);
            wait(var_b2f6e3841e5273bf);
        }
        return;
    }
    if (!isdefined(var_d2806e25e4c8157d)) {
        foreach (ent in entities) {
            if (isai(ent) && !isalive(ent) || !isdefined(ent)) {
                continue;
            }
            ent thread [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a);
            wait(var_b2f6e3841e5273bf);
        }
        return;
    }
    if (!isdefined(var_d2806b25e4c80ee4)) {
        foreach (ent in entities) {
            if (isai(ent) && !isalive(ent) || !isdefined(ent)) {
                continue;
            }
            ent thread [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d);
            wait(var_b2f6e3841e5273bf);
        }
        return;
    }
    if (!isdefined(var_d2806c25e4c81117)) {
        foreach (ent in entities) {
            if (isai(ent) && !isalive(ent) || !isdefined(ent)) {
                continue;
            }
            ent thread [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d, var_d2806b25e4c80ee4);
            wait(var_b2f6e3841e5273bf);
        }
        return;
    }
    if (!isdefined(var_d2806125e4c7f8e6)) {
        foreach (ent in entities) {
            if (isai(ent) && !isalive(ent) || !isdefined(ent)) {
                continue;
            }
            ent thread [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d, var_d2806b25e4c80ee4, var_d2806c25e4c81117);
            wait(var_b2f6e3841e5273bf);
        }
        return;
    }
    if (!isdefined(var_d2806225e4c7fb19)) {
        foreach (ent in entities) {
            if (isai(ent) && !isalive(ent) || !isdefined(ent)) {
                continue;
            }
            ent thread [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d, var_d2806b25e4c80ee4, var_d2806c25e4c81117, var_d2806125e4c7f8e6);
            wait(var_b2f6e3841e5273bf);
        }
        return;
    }
    foreach (ent in entities) {
        if (isai(ent) && !isalive(ent) || !isdefined(ent)) {
            continue;
        }
        ent thread [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d, var_d2806b25e4c80ee4, var_d2806c25e4c81117, var_d2806125e4c7f8e6, var_d2806225e4c7fb19);
        wait(var_b2f6e3841e5273bf);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params b, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96bf
// Size: 0x3b0
function array_thread(entities, process, var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d, var_d2806b25e4c80ee4, var_d2806c25e4c81117, var_d2806125e4c7f8e6, var_d2806225e4c7fb19) {
    if (isdefined(var_d2806225e4c7fb19)) {
        foreach (ent in entities) {
            ent thread [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d, var_d2806b25e4c80ee4, var_d2806c25e4c81117, var_d2806125e4c7f8e6, var_d2806225e4c7fb19);
        }
        return;
    }
    if (isdefined(var_d2806125e4c7f8e6)) {
        foreach (ent in entities) {
            ent thread [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d, var_d2806b25e4c80ee4, var_d2806c25e4c81117, var_d2806125e4c7f8e6);
        }
        return;
    }
    if (isdefined(var_d2806c25e4c81117)) {
        foreach (ent in entities) {
            ent thread [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d, var_d2806b25e4c80ee4, var_d2806c25e4c81117);
        }
        return;
    }
    if (isdefined(var_d2806b25e4c80ee4)) {
        foreach (ent in entities) {
            ent thread [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d, var_d2806b25e4c80ee4);
        }
        return;
    }
    if (isdefined(var_d2806e25e4c8157d)) {
        foreach (ent in entities) {
            ent thread [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d);
        }
        return;
    }
    if (isdefined(var_d2806d25e4c8134a)) {
        foreach (ent in entities) {
            ent thread [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a);
        }
        return;
    }
    if (isdefined(var_d2806825e4c8084b)) {
        foreach (ent in entities) {
            ent thread [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b);
        }
        return;
    }
    if (isdefined(var_d2806725e4c80618)) {
        foreach (ent in entities) {
            ent thread [[ process ]](var1, var_d2806725e4c80618);
        }
        return;
    }
    if (isdefined(var1)) {
        foreach (ent in entities) {
            ent thread [[ process ]](var1);
        }
        return;
    }
    foreach (ent in entities) {
        ent thread [[ process ]]();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params b, eflags: 0x0
// Checksum 0x0, Offset: 0x9a76
// Size: 0x3b0
function function_9b971e1bc95bc1df(entities, process, var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d, var_d2806b25e4c80ee4, var_d2806c25e4c81117, var_d2806125e4c7f8e6, var_d2806225e4c7fb19) {
    if (isdefined(var_d2806225e4c7fb19)) {
        foreach (ent in entities) {
            ent childthread [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d, var_d2806b25e4c80ee4, var_d2806c25e4c81117, var_d2806125e4c7f8e6, var_d2806225e4c7fb19);
        }
        return;
    }
    if (isdefined(var_d2806125e4c7f8e6)) {
        foreach (ent in entities) {
            ent childthread [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d, var_d2806b25e4c80ee4, var_d2806c25e4c81117, var_d2806125e4c7f8e6);
        }
        return;
    }
    if (isdefined(var_d2806c25e4c81117)) {
        foreach (ent in entities) {
            ent childthread [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d, var_d2806b25e4c80ee4, var_d2806c25e4c81117);
        }
        return;
    }
    if (isdefined(var_d2806b25e4c80ee4)) {
        foreach (ent in entities) {
            ent childthread [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d, var_d2806b25e4c80ee4);
        }
        return;
    }
    if (isdefined(var_d2806e25e4c8157d)) {
        foreach (ent in entities) {
            ent childthread [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d);
        }
        return;
    }
    if (isdefined(var_d2806d25e4c8134a)) {
        foreach (ent in entities) {
            ent childthread [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a);
        }
        return;
    }
    if (isdefined(var_d2806825e4c8084b)) {
        foreach (ent in entities) {
            ent childthread [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b);
        }
        return;
    }
    if (isdefined(var_d2806725e4c80618)) {
        foreach (ent in entities) {
            ent childthread [[ process ]](var1, var_d2806725e4c80618);
        }
        return;
    }
    if (isdefined(var1)) {
        foreach (ent in entities) {
            ent childthread [[ process ]](var1);
        }
        return;
    }
    foreach (ent in entities) {
        ent childthread [[ process ]]();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params a, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e2d
// Size: 0x34a
function array_call(entities, process, var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d, var_d2806b25e4c80ee4, var_d2806c25e4c81117, var_d2806125e4c7f8e6) {
    if (isdefined(var_d2806125e4c7f8e6)) {
        foreach (ent in entities) {
            ent builtin [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d, var_d2806b25e4c80ee4, var_d2806c25e4c81117, var_d2806125e4c7f8e6);
        }
        return;
    }
    if (isdefined(var_d2806c25e4c81117)) {
        foreach (ent in entities) {
            ent builtin [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d, var_d2806b25e4c80ee4, var_d2806c25e4c81117);
        }
        return;
    }
    if (isdefined(var_d2806b25e4c80ee4)) {
        foreach (ent in entities) {
            ent builtin [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d, var_d2806b25e4c80ee4);
        }
        return;
    }
    if (isdefined(var_d2806e25e4c8157d)) {
        foreach (ent in entities) {
            ent builtin [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a, var_d2806e25e4c8157d);
        }
        return;
    }
    if (isdefined(var_d2806d25e4c8134a)) {
        foreach (ent in entities) {
            ent builtin [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a);
        }
        return;
    }
    if (isdefined(var_d2806825e4c8084b)) {
        foreach (ent in entities) {
            ent builtin [[ process ]](var1, var_d2806725e4c80618, var_d2806825e4c8084b);
        }
        return;
    }
    if (isdefined(var_d2806725e4c80618)) {
        foreach (ent in entities) {
            ent builtin [[ process ]](var1, var_d2806725e4c80618);
        }
        return;
    }
    if (isdefined(var1)) {
        foreach (ent in entities) {
            ent builtin [[ process ]](var1);
        }
        return;
    }
    foreach (ent in entities) {
        ent builtin [[ process ]]();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa17e
// Size: 0x1f
function flat_angle(angle) {
    rangle = (0, angle[1], 0);
    return rangle;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1a5
// Size: 0x21
function flat_origin(org) {
    var_e2d5c1c592830f55 = (org[0], org[1], 0);
    return var_e2d5c1c592830f55;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1ce
// Size: 0x44
function flatten_vector(var_cc24231b0f3f7333, var_c351a25db18897ae) {
    if (!isdefined(var_c351a25db18897ae)) {
        var_c351a25db18897ae = (0, 0, 1);
    }
    var_1a5cb4a628237ae7 = vectornormalize(var_cc24231b0f3f7333 - vectordot(var_c351a25db18897ae, var_cc24231b0f3f7333) * var_c351a25db18897ae);
    return var_1a5cb4a628237ae7;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa21a
// Size: 0x189
function draw_arrow_time(start, end, color, duration, endonevent) {
    if (isdefined(endonevent)) {
        level endon(endonevent);
    }
    level endon("newpath");
    pts = [];
    angles = vectortoangles(start - end);
    right = anglestoright(angles);
    forward = anglestoforward(angles);
    up = anglestoup(angles);
    dist = distance(start, end);
    arrow = [];
    range = 0.1;
    arrow[0] = start;
    arrow[1] = start + right * dist * range + forward * dist * -0.1;
    arrow[2] = end;
    arrow[3] = start + right * dist * -1 * range + forward * dist * -0.1;
    arrow[4] = start;
    arrow[5] = start + up * dist * range + forward * dist * -0.1;
    arrow[6] = end;
    arrow[7] = start + up * dist * -1 * range + forward * dist * -0.1;
    arrow[8] = start;
    r = color[0];
    g = color[1];
    b = color[2];
    plot_points(arrow, r, g, b, duration);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa3aa
// Size: 0x120
function draw_arrow(start, end, color) {
    level endon("newpath");
    pts = [];
    angles = vectortoangles(start - end);
    right = anglestoright(angles);
    forward = anglestoforward(angles);
    dist = distance(start, end);
    arrow = [];
    range = 0.05;
    arrow[0] = start;
    arrow[1] = start + right * dist * range + forward * dist * -0.2;
    arrow[2] = end;
    arrow[3] = start + right * dist * -1 * range + forward * dist * -0.2;
    for (p = 0; p < 4; p++) {
        nextpoint = p + 1;
        if (nextpoint >= 4) {
            nextpoint = 0;
        }
        /#
            line(arrow[p], arrow[nextpoint], color, 1);
        #/
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4d1
// Size: 0x1d3
function draw_capsule(pos, radius, height, angles, color, depthtest, duration) {
    if (!isdefined(angles)) {
        angles = (0, 0, 0);
    }
    if (!isdefined(depthtest)) {
        depthtest = 0;
    }
    if (!isdefined(duration)) {
        duration = 1;
    }
    forward = anglestoforward(angles);
    right = anglestoright(angles);
    up = anglestoup(angles);
    /#
        var_7dc73e992d2ba545 = pos + up * radius;
        sphere(var_7dc73e992d2ba545, radius, color, depthtest, duration);
        var_622e4dc32dd8dabb = pos + up * height;
        var_622e4dc32dd8dabb = var_622e4dc32dd8dabb - up * radius;
        sphere(var_622e4dc32dd8dabb, radius, color, depthtest, duration);
        var_e3e4708f2b15cdc = var_7dc73e992d2ba545 + forward * radius;
        var_c082cafefe1be9e0 = var_622e4dc32dd8dabb + forward * radius;
        line(var_e3e4708f2b15cdc, var_c082cafefe1be9e0, color, 1, depthtest, duration);
        var_35e9e473f5743470 = var_7dc73e992d2ba545 - forward * radius;
        var_f06f5503d572a834 = var_622e4dc32dd8dabb - forward * radius;
        line(var_35e9e473f5743470, var_f06f5503d572a834, color, 1, depthtest, duration);
        var_154fc976c8007720 = var_7dc73e992d2ba545 + right * radius;
        var_c826cf340204f3e4 = var_622e4dc32dd8dabb + right * radius;
        line(var_154fc976c8007720, var_c826cf340204f3e4, color, 1, depthtest, duration);
        var_29521623860703fa = var_7dc73e992d2ba545 - right * radius;
        var_2bc57f4bb1103296 = var_622e4dc32dd8dabb - right * radius;
        line(var_29521623860703fa, var_2bc57f4bb1103296, color, 1, depthtest, duration);
    #/
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa6ab
// Size: 0x57
function draw_character_capsule(color, depthtest, duration) {
    var_3ac658a13ffcbfb5 = self physics_getcharactercollisioncapsule();
    draw_capsule(self getorigin(), var_3ac658a13ffcbfb5["radius"], var_3ac658a13ffcbfb5["half_height"] * 2, self.angles, color, depthtest, duration);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa709
// Size: 0x54
function draw_player_capsule(color, depthtest, duration) {
    var_3ac658a13ffcbfb5 = self physics_getcharactercollisioncapsule();
    draw_capsule(self getorigin(), var_3ac658a13ffcbfb5["radius"], var_3ac658a13ffcbfb5["half_height"] * 2, self getplayerangles(), color, depthtest, duration);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa764
// Size: 0x59
function draw_ent_bone_forever(bone_name, var_e0b935b0c281315b) {
    self endon("stop_drawing_axis");
    self endon("death");
    while (1) {
        var_6768e6a26fff835e = self gettagorigin(bone_name);
        var_4d6c1d9aee8512f4 = self gettagangles(bone_name);
        draw_angles(var_4d6c1d9aee8512f4, var_6768e6a26fff835e, var_e0b935b0c281315b);
        waitframe();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa7c4
// Size: 0x35
function draw_ent_axis_forever(var_e0b935b0c281315b, scale) {
    self endon("stop_drawing_axis");
    self endon("death");
    while (1) {
        draw_ent_axis(var_e0b935b0c281315b, undefined, scale);
        waitframe();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa800
// Size: 0x3e
function draw_tag_axis_forever(tag, var_e0b935b0c281315b, scale) {
    self endon("stop_drawing_axis");
    self endon("death");
    while (1) {
        draw_tag_axis(tag, var_e0b935b0c281315b, undefined, scale);
        waitframe();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa845
// Size: 0x64
function draw_ent_axis(var_e0b935b0c281315b, duration, scale) {
    waittillframeend();
    if (isdefined(self.angles)) {
        angles = self.angles;
    } else {
        angles = (0, 0, 0);
    }
    draw_angles(angles, self.origin, var_e0b935b0c281315b, duration, scale);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8b0
// Size: 0x55
function draw_tag_axis(tag, var_e0b935b0c281315b, duration, scale) {
    waittillframeend();
    angles = self gettagangles(tag);
    origin = self gettagorigin(tag);
    draw_angles(angles, origin, var_e0b935b0c281315b, duration, scale);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa90c
// Size: 0x12f
function draw_angles(angles, origin, var_e0b935b0c281315b, duration, scale) {
    waittillframeend();
    forward = anglestoforward(angles);
    right = anglestoright(angles);
    up = anglestoup(angles);
    /#
        assert(vectordot(forward, right) == 0);
    #/
    /#
        assert(vectordot(forward, up) == 0);
    #/
    /#
        assert(vectordot(up, right) == 0);
    #/
    if (!isdefined(var_e0b935b0c281315b)) {
        var_e0b935b0c281315b = (1, 0, 1);
    }
    if (!isdefined(duration)) {
        duration = 1;
    }
    if (!isdefined(scale)) {
        scale = 10;
    }
    /#
        sphere(origin, 1, var_e0b935b0c281315b, 0, duration);
        line(origin, origin + forward * scale, (1, 0, 0), 1, 0, duration);
        line(origin, origin + right * scale, (0, 1, 0), 1, 0, duration);
        line(origin, origin + up * scale, (0, 0, 1), 1, 0, duration);
    #/
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xaa42
// Size: 0x202
function draw_entity_bounds(ent, var_201cfe915c2ea802, color, dynamic, var_d88c48911f4bf6a0) {
    /#
        assert(isdefined(ent));
    #/
    /#
        assert(var_201cfe915c2ea802 > 0);
    #/
    if (!isdefined(color)) {
        color = (0, 1, 0);
    }
    if (!isdefined(dynamic)) {
        dynamic = 0;
    }
    if (!isdefined(var_d88c48911f4bf6a0)) {
        var_d88c48911f4bf6a0 = level.framedurationseconds;
    }
    if (dynamic) {
        var_4e7f34cec022d55a = int(var_d88c48911f4bf6a0 / level.framedurationseconds);
    } else {
        var_4e7f34cec022d55a = int(var_201cfe915c2ea802 / level.framedurationseconds);
    }
    var_1d29919376ad4830 = [];
    var_1d29949376ad4ec9 = [];
    current = gettime();
    end = current + var_201cfe915c2ea802 * 1000;
    while (current < end && isdefined(ent)) {
        var_1d29919376ad4830[0] = ent getpointinbounds(1, 1, 1);
        var_1d29919376ad4830[1] = ent getpointinbounds(1, 1, -1);
        var_1d29919376ad4830[2] = ent getpointinbounds(-1, 1, -1);
        var_1d29919376ad4830[3] = ent getpointinbounds(-1, 1, 1);
        var_1d29949376ad4ec9[0] = ent getpointinbounds(1, -1, 1);
        var_1d29949376ad4ec9[1] = ent getpointinbounds(1, -1, -1);
        var_1d29949376ad4ec9[2] = ent getpointinbounds(-1, -1, -1);
        var_1d29949376ad4ec9[3] = ent getpointinbounds(-1, -1, 1);
        /#
            for (i = 0; i < 4; i++) {
                j = i + 1;
                if (j == 4) {
                    j = 0;
                }
                line(var_1d29919376ad4830[i], var_1d29919376ad4830[j], color, 1, 0, var_4e7f34cec022d55a);
                line(var_1d29949376ad4ec9[i], var_1d29949376ad4ec9[j], color, 1, 0, var_4e7f34cec022d55a);
                line(var_1d29919376ad4830[i], var_1d29949376ad4ec9[i], color, 1, 0, var_4e7f34cec022d55a);
            }
        #/
        if (!dynamic) {
            return;
        }
        wait(var_d88c48911f4bf6a0);
        current = gettime();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac4b
// Size: 0x39
function getfx(fx) {
    /#
        assertex(isdefined(level._effect[fx]), "Fx " + fx + " is not defined in level._effect.");
    #/
    return level._effect[fx];
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac8c
// Size: 0x18
function fxexists(fx) {
    return isdefined(level._effect[fx]);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xacac
// Size: 0xf4
function playerunlimitedammothread() {
    /#
        if (!isdefined(self) || self == level || isdefined(self.code_classname) && self.code_classname != "<unknown string>") {
            player = level.player;
        } else {
            player = self;
        }
        /#
            assert(isdefined(player));
        #/
        while (1) {
            wait(0.5);
            if (getdvar(@"hash_764407b83534f838") == "<unknown string>") {
                continue;
            }
            currentweapon = player getcurrentweapon();
            if (!isnullweapon(currentweapon)) {
                currentammo = player getfractionmaxammo(currentweapon);
                if (currentammo < 0.2) {
                    player givemaxammo(currentweapon);
                }
            }
            currentoffhand = player getcurrentoffhand();
            if (!isnullweapon(currentoffhand)) {
                currentammo = player getfractionmaxammo(currentoffhand);
                if (currentammo < 0.4) {
                    player givemaxammo(currentoffhand);
                }
            }
        }
    #/
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xada7
// Size: 0xa5
function spawn_tag_origin(org, ang) {
    if (!isdefined(ang) && isdefined(self.angles)) {
        ang = self.angles;
    }
    if (!isdefined(org) && isdefined(self.origin)) {
        org = self.origin;
    } else if (!isdefined(org)) {
        org = (0, 0, 0);
    }
    tag_origin = spawn("script_model", org);
    tag_origin setmodel("tag_origin");
    tag_origin hide();
    if (isdefined(ang)) {
        tag_origin.angles = ang;
    }
    return tag_origin;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae54
// Size: 0x19
function waittill_notify_or_timeout(msg, timer) {
    self endon(msg);
    wait(timer);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae74
// Size: 0x4c
function waittill_notify_or_timeout_return(notifymessage, timer) {
    var_624f473fe3ee62f1 = spawnstruct();
    thread waittill_notify_proc(var_624f473fe3ee62f1, notifymessage);
    thread waittill_timeout_proc(var_624f473fe3ee62f1, timer);
    result = var_624f473fe3ee62f1 waittill("waittill_proc");
    return result;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaec8
// Size: 0x28
function waittill_notify_proc(var_624f473fe3ee62f1, notifymessage) {
    var_624f473fe3ee62f1 endon("waittill_proc");
    self waittill(notifymessage);
    var_624f473fe3ee62f1 notify("waittill_proc", notifymessage);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaef7
// Size: 0x2a
function waittill_timeout_proc(var_624f473fe3ee62f1, timeout) {
    var_624f473fe3ee62f1 endon("waittill_proc");
    wait(timeout);
    var_624f473fe3ee62f1 notify("waittill_proc", "timeout");
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xaf28
// Size: 0x62
function waittill_notify_and_time(msg, time) {
    starttime = gettime();
    self waittill(msg);
    endtime = starttime + time * 1000;
    timeleft = endtime - starttime;
    if (timeleft > 0) {
        waittime = timeleft / 1000;
        wait(waittime);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf91
// Size: 0xbe
function array_wait(array, message, timeout) {
    var_624f473fe3ee62f1 = spawnstruct();
    if (istrue(timeout)) {
        thread array_wait_timeout_proc(var_624f473fe3ee62f1, timeout);
        var_624f473fe3ee62f1 endon("array_wait_timeout");
    }
    foreach (element in array) {
        thread array_wait_proc(var_624f473fe3ee62f1, element, message);
    }
    for (i = 0; i < array.size; i++) {
        var_624f473fe3ee62f1 waittill("array_wait_proc");
    }
    var_624f473fe3ee62f1 notify("array_wait_success");
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb056
// Size: 0x39
function array_wait_proc(var_624f473fe3ee62f1, element, message) {
    var_624f473fe3ee62f1 endon("array_wait_success");
    element waittill_any_2(message, "death");
    var_624f473fe3ee62f1 notify("array_wait_proc");
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb096
// Size: 0x25
function array_wait_timeout_proc(var_624f473fe3ee62f1, timeout) {
    var_624f473fe3ee62f1 endon("array_wait_success");
    wait(timeout);
    var_624f473fe3ee62f1 notify("array_wait_timeout");
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb0c2
// Size: 0x89
function array_any_wait(array, message) {
    var_624f473fe3ee62f1 = spawnstruct();
    foreach (element in array) {
        thread array_any_wait_proc(var_624f473fe3ee62f1, element, message);
    }
    result = var_624f473fe3ee62f1 waittill("array_wait_proc");
    return result;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb153
// Size: 0x9c
function array_any_wait_timeout(array, message, timeout) {
    var_624f473fe3ee62f1 = spawnstruct();
    thread array_any_wait_timeout_proc(var_624f473fe3ee62f1, timeout);
    foreach (element in array) {
        thread array_any_wait_proc(var_624f473fe3ee62f1, element, message);
    }
    result = var_624f473fe3ee62f1 waittill("array_wait_proc");
    return result;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1f7
// Size: 0x3d
function array_any_wait_proc(var_624f473fe3ee62f1, element, message) {
    result = element waittill_any_return_no_endon_death(message, "death");
    var_624f473fe3ee62f1 notify("array_wait_proc", result);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb23b
// Size: 0x2a
function array_any_wait_timeout_proc(var_624f473fe3ee62f1, timeout) {
    var_624f473fe3ee62f1 endon("array_wait_proc");
    wait(timeout);
    var_624f473fe3ee62f1 notify("array_wait_proc", "timeout");
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb26c
// Size: 0x7f
function array_any_wait_return(array, message) {
    var_624f473fe3ee62f1 = spawnstruct();
    foreach (element in array) {
        thread array_any_wait_return_proc(var_624f473fe3ee62f1, element, message);
    }
    element = var_624f473fe3ee62f1 waittill("array_wait_proc");
    return element;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2f3
// Size: 0x3d
function array_any_wait_return_proc(var_624f473fe3ee62f1, element, message) {
    result = element waittill_any_return_2(message, "death");
    var_624f473fe3ee62f1 notify("array_wait_proc", element);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb337
// Size: 0x3d
function fileprint_launcher_start_file() {
    /#
        assertex(!isdefined(level.fileprint_launcher), "Can't open more than one file at a time to print through launcher.");
    #/
    level.fileprintlauncher_linecount = 0;
    level.fileprint_launcher = 1;
    fileprint_launcher("GAMEPRINTSTARTFILE:");
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb37b
// Size: 0x58
function fileprint_launcher(string) {
    /#
        assert(isdefined(level.fileprintlauncher_linecount));
    #/
    level.fileprintlauncher_linecount++;
    if (level.fileprintlauncher_linecount > 200) {
        wait(0.05);
        level.fileprintlauncher_linecount = 0;
    }
    /#
        println("<unknown string>" + string);
    #/
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb3da
// Size: 0x190
function fileprint_launcher_end_file(var_82996f577af7f7f3, var_91a1926479dd5e50) {
    if (!isdefined(var_91a1926479dd5e50)) {
        var_91a1926479dd5e50 = 0;
    }
    /#
        setdevdvarifuninitialized(@"hash_d84b138e7aa2f2df", "<unknown string>");
        setdevdvarifuninitialized(@"hash_afbeda0efab5bd5e", "<unknown string>");
    #/
    if (var_91a1926479dd5e50) {
        fileprint_launcher("GAMEPRINTENDFILE:GAMEPRINTP4ENABLED:" + var_82996f577af7f7f3);
    } else {
        fileprint_launcher("GAMEPRINTENDFILE:" + var_82996f577af7f7f3);
    }
    timeout = gettime() + 4000;
    while (getdvarint(@"hash_afbeda0efab5bd5e") == 0 && getdvar(@"hash_d84b138e7aa2f2df") == "0" && gettime() < timeout) {
        wait(0.05);
    }
    if (!(gettime() < timeout)) {
        iprintlnbold("LAUNCHER_PRINT_FAIL:( TIMEOUT ): launcherconflict? restart launcher and try again? ");
        /#
            setdevdvar(@"hash_d84b138e7aa2f2df", "<unknown string>");
        #/
        level.fileprint_launcher = undefined;
        return 0;
    }
    var_bef98e08aea7e932 = getdvar(@"hash_d84b138e7aa2f2df");
    if (var_bef98e08aea7e932 != "0") {
        iprintlnbold("LAUNCHER_PRINT_FAIL:( " + var_bef98e08aea7e932 + " ): launcherconflict? restart launcher and try again? ");
        /#
            setdevdvar(@"hash_d84b138e7aa2f2df", "<unknown string>");
        #/
        level.fileprint_launcher = undefined;
        return 0;
    }
    /#
        setdevdvar(@"hash_d84b138e7aa2f2df", "<unknown string>");
        setdevdvar(@"hash_afbeda0efab5bd5e", "<unknown string>");
    #/
    iprintlnbold("Launcher write to file successful!");
    level.fileprint_launcher = undefined;
    return 1;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb572
// Size: 0x24
function launcher_write_clipboard(str) {
    level.fileprintlauncher_linecount = 0;
    fileprint_launcher("LAUNCHER_CLIP:" + str);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb59d
// Size: 0xa
function activate_individual_exploder() {
    namespace_ed6d37a42f9fd2e7::activate_individual_exploder_proc();
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5ae
// Size: 0xcd
function get_target_ent(target) {
    if (!isdefined(target)) {
        target = self.target;
    }
    /#
        assertex(isdefined(target), "Self had no target!");
    #/
    ent = getent(target, "targetname");
    if (isdefined(ent)) {
        return ent;
    }
    if (issp()) {
        ent = builtin [[ level.getnodefunction ]](target, "targetname");
        if (isdefined(ent)) {
            return ent;
        }
        ent = builtin [[ level.func["getspawner"] ]](target, "targetname");
        if (isdefined(ent)) {
            return ent;
        }
    }
    ent = getstruct(target, "targetname");
    if (isdefined(ent)) {
        return ent;
    }
    ent = getvehiclenode(target, "targetname");
    if (isdefined(ent)) {
        return ent;
    }
    /#
        assertmsg("Tried to get ent " + target + ", but there was no ent.");
    #/
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb682
// Size: 0x16
function get_links() {
    return strtok(self.script_linkto, " ");
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb6a0
// Size: 0x5b
function get_linked_ents() {
    array = [];
    if (isdefined(self.script_linkto)) {
        var_b11f91c17feeab8f = get_links();
        if (var_b11f91c17feeab8f.size == 1) {
            return getentarray(var_b11f91c17feeab8f[0], "script_linkname");
        } else if (var_b11f91c17feeab8f.size > 1) {
            return function_9f9ba8a4756db8c7(var_b11f91c17feeab8f, "script_linkname");
        }
    }
    return array;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb703
// Size: 0x32
function get_linked_ent() {
    array = get_linked_ents();
    /#
        assert(array.size == 1);
    #/
    /#
        assert(isdefined(array[0]));
    #/
    return array[0];
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb73d
// Size: 0x4f
function get_linked_nodes() {
    if (isdefined(self.script_linkto)) {
        var_b11f91c17feeab8f = get_links();
        if (var_b11f91c17feeab8f.size == 1) {
            return getnodearray(var_b11f91c17feeab8f[0], "script_linkname");
        } else if (var_b11f91c17feeab8f.size > 1) {
            return function_36ed24909dabb916(var_b11f91c17feeab8f, "script_linkname");
        }
    }
    return [];
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb794
// Size: 0x78
function do_earthquake(name, origin) {
    eq = level.earthquake[name];
    earthquake(eq["magnitude"], eq["duration"], origin, eq["radius"]);
    if (isdefined(level.var_bc7733fa2bdf5ad0)) {
        level thread [[ level.var_bc7733fa2bdf5ad0 ]](name, origin, eq["magnitude"], eq["duration"], eq["radius"]);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb813
// Size: 0x5c
function play_loopsound_in_space(alias, origin) {
    org = spawn("script_origin", (0, 0, 0));
    if (!isdefined(origin)) {
        origin = self.origin;
    }
    org.origin = origin;
    org playloopsound(alias);
    return org;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb877
// Size: 0xcb
function play_sound_in_space_with_angles(alias, origin, angles, parent) {
    org = spawn("script_origin", (0, 0, 1));
    if (!isdefined(origin)) {
        origin = self.origin;
    }
    org.origin = origin;
    org.angles = angles;
    if (isdefined(parent)) {
        org linkto(parent);
    }
    /#
        if (isdefined(self.v)) {
            org.createfx_ent = 1;
        }
    #/
    if (issp()) {
        org playsound(alias, "sounddone");
        org waittill("sounddone");
    } else {
        org playsound(alias);
    }
    org delete();
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb949
// Size: 0x33
function play_sound_in_space(alias, origin, parent) {
    play_sound_in_space_with_angles(alias, origin, (0, 0, 0), parent);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xb983
// Size: 0x133
function play_loop_sound_on_tag(alias, tag, bstopsoundondeath, var_627c155c7ac80247, var_81ade82be8caa4ce) {
    org = spawn("script_origin", (0, 0, 0));
    org endon("death");
    if (!isdefined(bstopsoundondeath)) {
        bstopsoundondeath = 1;
    }
    if (bstopsoundondeath) {
        thread delete_on_death(org);
    }
    if (!isdefined(var_627c155c7ac80247)) {
        var_627c155c7ac80247 = 0;
    }
    if (var_627c155c7ac80247) {
        thread delete_on_removed(org);
    }
    if (isdefined(tag)) {
        org linkto(self, tag, (0, 0, 0), (0, 0, 0));
    } else {
        org.origin = self.origin;
        org.angles = self.angles;
        org linkto(self);
    }
    org playloopsound(alias);
    self waittill("stop sound" + alias);
    if (isdefined(var_81ade82be8caa4ce)) {
        org playsound(var_81ade82be8caa4ce, "sounddone");
        org delaycall(0.15, &stoploopsound, alias);
        org waittill("sounddone");
        org delete();
    } else {
        org stoploopsound(alias);
        org delete();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbabd
// Size: 0x2d
function delete_on_removed(ent) {
    ent endon("death");
    while (isdefined(self)) {
        wait(0.05);
    }
    if (isdefined(ent)) {
        ent delete();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbaf1
// Size: 0x45
function loop_fx_sound(alias, origin, culled, ender, createfx_ent) {
    loop_fx_sound_with_angles(alias, origin, (0, 0, 0), culled, ender, createfx_ent);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb3d
// Size: 0x132
function loop_fx_sound_with_angles(alias, origin, angles, culled, ender, createfx_ent, shape) {
    if (istrue(culled)) {
        if (!isdefined(level.first_frame) || level.first_frame == 1) {
            spawnloopingsound(alias, origin, angles);
        }
    } else {
        if (level.createfx_enabled && isdefined(createfx_ent.loopsound_ent)) {
            org = createfx_ent.loopsound_ent;
        } else {
            org = spawn("script_origin", (0, 0, 0));
        }
        /#
            if (isdefined(self.v)) {
                org.createfx_ent = 1;
            }
        #/
        if (isdefined(ender)) {
            thread loop_sound_delete(ender, org);
            self endon(ender);
        }
        org.origin = origin;
        org.angles = angles;
        org playloopsound(alias);
        if (level.createfx_enabled) {
            createfx_ent.loopsound_ent = org;
        } else {
            org willneverchange();
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xbc76
// Size: 0x4e
function loop_fx_sound_interval(alias, origin, ender, timeout, delay_min, delay_max) {
    loop_fx_sound_interval_with_angles(alias, origin, (0, 0, 0), ender, timeout, delay_min, delay_max);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbccb
// Size: 0x10c
function loop_fx_sound_interval_with_angles(alias, origin, angles, ender, timeout, delay_min, delay_max) {
    self.origin = origin;
    self.angles = angles;
    if (isdefined(ender)) {
        self endon(ender);
    }
    if (delay_min >= delay_max) {
        while (1) {
            /#
                print3d(origin, "<unknown string>", (1, 0, 0), 1, 1);
            #/
            wait(0.05);
        }
    }
    if (!soundexists(alias)) {
        while (1) {
            /#
                print3d(origin, "<unknown string>" + alias, (1, 0, 0), 1, 1);
            #/
            wait(0.05);
        }
    }
    while (1) {
        wait(randomfloatrange(delay_min, delay_max));
        lock("createfx_looper");
        thread play_sound_in_space_with_angles(alias, self.origin, self.angles, undefined);
        unlock("createfx_looper");
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdde
// Size: 0x26
function loop_sound_delete(ender, ent) {
    ent endon("death");
    self waittill(ender);
    ent delete();
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe0b
// Size: 0x3c
function createloopeffect(fxid) {
    ent = namespace_321fdd8ad2993260::createeffect("loopfx", fxid);
    ent.v["delay"] = namespace_321fdd8ad2993260::getloopeffectdelaydefault();
    return ent;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe4f
// Size: 0x3c
function createoneshoteffect(fxid) {
    ent = namespace_321fdd8ad2993260::createeffect("oneshotfx", fxid);
    ent.v["delay"] = namespace_321fdd8ad2993260::getoneshoteffectdelaydefault();
    return ent;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe93
// Size: 0x5c
function createexploder(fxid, var_265e032b267abf38) {
    ent = namespace_321fdd8ad2993260::createeffect("exploder", fxid, var_265e032b267abf38);
    ent.v["delay"] = namespace_321fdd8ad2993260::getexploderdelaydefault();
    ent.v["exploder_type"] = "normal";
    return ent;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbef7
// Size: 0xd5
function play_loop_sound_on_entity(alias, offset) {
    org = spawn("script_origin", (0, 0, 0));
    org endon("death");
    thread delete_on_death(org);
    if (isdefined(offset)) {
        org.origin = self.origin + offset;
        org.angles = self.angles;
        org linkto(self);
    } else {
        org.origin = self.origin;
        org.angles = self.angles;
        org linkto(self);
    }
    org playloopsound(alias);
    self waittill("stop sound" + alias);
    org stoploopsound(alias);
    org delete();
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbfd3
// Size: 0x16
function stop_loop_sound_on_entity(alias) {
    self notify("stop sound" + alias);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbff0
// Size: 0x27
function delete_on_death(ent) {
    ent endon("death");
    self waittill("death");
    if (isdefined(ent)) {
        ent delete();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc01e
// Size: 0x12
function delete_on_sounddone() {
    self waittill("sounddone");
    self delete();
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc037
// Size: 0x17
function delete_on_notify(msg) {
    self waittill(msg);
    self delete();
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc055
// Size: 0x24
function function_5ee1730c2e122134(ent, msg) {
    self waittill(msg);
    if (isdefined(ent)) {
        ent delete();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc080
// Size: 0x1a
function function_b4b04de87729a6f3(delay) {
    wait(delay);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc0a1
// Size: 0x42
function error(msg) {
    /#
        println("<unknown string>", msg);
        if (getdvar(@"hash_ddfc4cbd9432119a") != "<unknown string>") {
            /#
                assertmsg("<unknown string>" + msg);
            #/
        }
    #/
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc0ea
// Size: 0x35
function exploder(num, players, starttime) {
    [[ level._fx.exploderfunction ]](num, players, starttime);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc126
// Size: 0x14
function delete_exploder(num) {
    namespace_ed6d37a42f9fd2e7::delete_exploder_proc(num);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc141
// Size: 0x14
function hide_exploder_models(num) {
    namespace_ed6d37a42f9fd2e7::hide_exploder_models_proc(num);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc15c
// Size: 0x14
function show_exploder_models(num) {
    namespace_ed6d37a42f9fd2e7::show_exploder_models_proc(num);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc177
// Size: 0x1e
function stop_exploder(num, players) {
    namespace_ed6d37a42f9fd2e7::stop_exploder_proc(num, players, 0);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc19c
// Size: 0x1f
function kill_exploder(num, players) {
    namespace_ed6d37a42f9fd2e7::stop_exploder_proc(num, players, 1);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc1c2
// Size: 0x13
function get_exploder_array(msg) {
    return namespace_ed6d37a42f9fd2e7::get_exploder_array_proc(msg);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1dd
// Size: 0x23
function ter_op(var_9cb951de1a571d32, var_f901ca059b18a27b, var_a4136d44ae0ef2de) {
    if (var_9cb951de1a571d32) {
        return var_f901ca059b18a27b;
    }
    return var_a4136d44ae0ef2de;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc208
// Size: 0x1c
function function_53c4c53197386572(value, default_value) {
    if (!isdefined(value)) {
        return default_value;
    }
    return value;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc22c
// Size: 0x33
function function_ce51e08dcc037220(value, default_value, var_4f58263b016248f2) {
    if (!isdefined(value)) {
        if (isdefined(var_4f58263b016248f2)) {
            /#
                assertmsg(var_4f58263b016248f2);
            #/
        }
        return default_value;
    }
    return value;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc267
// Size: 0x76
function create_lock(msg, count) {
    if (!isdefined(count)) {
        count = 1;
    }
    /#
        assert(isdefined(msg));
    #/
    if (!isdefined(level.lock)) {
        level.lock = [];
    }
    var_b6f7ddce8981f2da = spawnstruct();
    var_b6f7ddce8981f2da.max_count = count;
    var_b6f7ddce8981f2da.count = 0;
    level.lock[msg] = var_b6f7ddce8981f2da;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2e4
// Size: 0x7b
function lock(msg) {
    /#
        assert(isdefined(level.lock));
    #/
    /#
        assert(isdefined(level.lock[msg]));
    #/
    lock = level.lock[msg];
    while (lock.count >= lock.max_count) {
        lock waittill("unlocked");
    }
    lock.count++;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc366
// Size: 0x15
function unlock(msg) {
    thread unlock_thread(msg);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc382
// Size: 0x7a
function unlock_thread(msg) {
    wait(0.05);
    /#
        assert(isdefined(level.lock));
    #/
    /#
        assert(isdefined(level.lock[msg]));
    #/
    lock = level.lock[msg];
    lock.count--;
    /#
        assert(lock.count >= 0);
    #/
    lock notify("unlocked");
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc403
// Size: 0x1b
function unlock_wait(msg) {
    thread unlock_thread(msg);
    wait(0.05);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc425
// Size: 0x2f
function is_player_gamepad_enabled() {
    var_ce09c6f6a7628f6d = self usinggamepad();
    if (isdefined(var_ce09c6f6a7628f6d)) {
        return var_ce09c6f6a7628f6d;
    } else if (self ispcplayer()) {
        return 0;
    } else {
        return 1;
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc45b
// Size: 0x3d
function player_prestream_camera(position, duration, var_3094a4abe4672363) {
    if (!isdefined(duration)) {
        duration = 5;
    }
    if (!isdefined(var_3094a4abe4672363)) {
        var_3094a4abe4672363 = undefined;
    }
    thread function_d4192e0c7c79be61(position, duration, var_3094a4abe4672363);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc49f
// Size: 0x9f
function private function_d4192e0c7c79be61(position, duration, var_3094a4abe4672363) {
    if (!isdefined(duration)) {
        duration = 5;
    }
    if (!isdefined(var_3094a4abe4672363)) {
        var_3094a4abe4672363 = undefined;
    }
    /#
        assert(isplayer(self));
    #/
    player = self;
    player notify("player_prestream_camera");
    player endon("player_prestream_camera");
    player endon("death_or_disconnect");
    player clearadditionalstreampos();
    if (isdefined(var_3094a4abe4672363)) {
        player function_670863fc4008c3d8(var_3094a4abe4672363);
    }
    player function_bc667001f9dd3808(position);
    if (duration > 0) {
        wait(duration);
    } else if (duration < 0) {
        return;
    }
    player clearadditionalstreampos();
    player clearpredictedstreampos();
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc545
// Size: 0xad
function player_prestream_entities(entities, distances, duration) {
    if (!isdefined(duration)) {
        duration = 5;
    }
    if (!isarray(entities)) {
        entities = [0:entities];
    }
    if (!isdefined(distances)) {
        distances = [];
        foreach (entity in entities) {
            distances[distances.size] = 50;
        }
    } else if (!isarray(distances)) {
        distances = [0:distances];
    }
    thread function_28548c8e56c0b115(entities, distances, duration);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc5f9
// Size: 0xcc
function private function_28548c8e56c0b115(entities, distances, duration) {
    /#
        assert(isplayer(self));
    #/
    player = self;
    player notify("player_prestream_entities");
    player endon("player_prestream_entities");
    player endon("disconnect");
    player function_bab9acc2cf205a62();
    foreach (idx, entity in entities) {
        if (isdefined(entity)) {
            entity function_af96f7c8819ae854(player, distances[idx]);
        }
    }
    if (duration > 0) {
        wait(duration);
    } else if (duration < 0) {
        return;
    }
    if (isplayer(player)) {
        player function_bab9acc2cf205a62();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc6cc
// Size: 0x1c
function distance_2d_squared(a, b) {
    return length2dsquared(a - b);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc6f0
// Size: 0x56
function get_array_of_farthest(org, array, excluders, max, maxdist, mindist) {
    var_9e748fc0532c64d = get_array_of_closest(org, array, excluders, max, maxdist, mindist);
    var_9e748fc0532c64d = array_reverse(var_9e748fc0532c64d);
    return var_9e748fc0532c64d;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc74e
// Size: 0x1e3
function get_array_of_closest(org, array, excluders, max, maxdist, mindist) {
    if (!isdefined(max)) {
        max = array.size;
    }
    if (!isdefined(excluders)) {
        excluders = [];
    }
    var_c17ed6db14ebc007 = undefined;
    if (isdefined(maxdist)) {
        var_c17ed6db14ebc007 = maxdist * maxdist;
    }
    var_72ba88b06c1f883d = 0;
    if (isdefined(mindist)) {
        var_72ba88b06c1f883d = mindist * mindist;
    }
    if (excluders.size == 0 && max >= array.size && var_72ba88b06c1f883d == 0 && !isdefined(var_c17ed6db14ebc007)) {
        return sortbydistance(array, org);
    }
    newarray = [];
    foreach (ent in array) {
        excluded = 0;
        foreach (var_80bf5812193e7385 in excluders) {
            if (ent == var_80bf5812193e7385) {
                excluded = 1;
                break;
            }
        }
        if (excluded) {
            continue;
        }
        dist2rd = distancesquared(org, ent.origin);
        if (isdefined(var_c17ed6db14ebc007) && dist2rd > var_c17ed6db14ebc007) {
            continue;
        }
        if (dist2rd < var_72ba88b06c1f883d) {
            continue;
        }
        newarray[newarray.size] = ent;
    }
    newarray = sortbydistance(newarray, org);
    if (max >= newarray.size) {
        return newarray;
    }
    var_b6fd27fce7dc4298 = [];
    for (i = 0; i < max; i++) {
        var_b6fd27fce7dc4298[i] = newarray[i];
    }
    return var_b6fd27fce7dc4298;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc939
// Size: 0x9a
function function_f7a98d43838654af(org, array, maxdist) {
    maxdistsquared = maxdist * maxdist;
    var_b6fd27fce7dc4298 = [];
    foreach (ent in array) {
        if (distance2dsquared(org, ent.origin) < maxdistsquared) {
            var_b6fd27fce7dc4298[var_b6fd27fce7dc4298.size] = ent;
        }
    }
    return var_b6fd27fce7dc4298;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9db
// Size: 0x8b
function drop_to_ground(pos, var_84d0c3e36addfa4, var_191ebd2dd0d5f975, upvector, contents) {
    if (!isdefined(var_84d0c3e36addfa4)) {
        var_84d0c3e36addfa4 = 1500;
    }
    if (!isdefined(var_191ebd2dd0d5f975)) {
        var_191ebd2dd0d5f975 = -12000;
    }
    if (!isdefined(contents)) {
        contents = namespace_2a184fc4902783dc::create_solid_ai_contents(1);
    }
    if (isdefined(upvector)) {
        return namespace_2a184fc4902783dc::ray_trace(pos + var_84d0c3e36addfa4 * upvector, pos + var_191ebd2dd0d5f975 * upvector, undefined, contents)["position"];
    } else {
        return namespace_2a184fc4902783dc::ray_trace(pos + (0, 0, var_84d0c3e36addfa4), pos + (0, 0, var_191ebd2dd0d5f975), undefined, contents)["position"];
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca6d
// Size: 0x91
function player_drop_to_ground(pos, radius, var_84d0c3e36addfa4, var_191ebd2dd0d5f975, upvector) {
    if (!isdefined(var_84d0c3e36addfa4)) {
        var_84d0c3e36addfa4 = 1500;
    }
    if (!isdefined(var_191ebd2dd0d5f975)) {
        var_191ebd2dd0d5f975 = -12000;
    }
    contents = namespace_2a184fc4902783dc::create_solid_ai_contents(1);
    if (isdefined(upvector)) {
        return namespace_2a184fc4902783dc::sphere_trace(pos + var_84d0c3e36addfa4 * upvector, pos + var_191ebd2dd0d5f975 * upvector, radius, undefined, contents)["position"];
    } else {
        return namespace_2a184fc4902783dc::sphere_trace(pos + (0, 0, var_84d0c3e36addfa4), pos + (0, 0, var_191ebd2dd0d5f975), radius, undefined, contents)["position"];
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb05
// Size: 0xaf
function function_114e5c055b13dacf(pos, var_8ca71a06b9ecace5, var_efb3e4f87857cbce, var_4949a6d8bd698d95) {
    var_4949a6d8bd698d95 = function_53c4c53197386572(var_4949a6d8bd698d95, 32);
    ground_pos = drop_to_ground(pos, var_8ca71a06b9ecace5, var_efb3e4f87857cbce);
    var_256ac12c1df1f01a = getclosestpointonnavmesh(ground_pos, undefined, 0, 0, 0);
    if (isdefined(var_256ac12c1df1f01a)) {
        max_z = max(ground_pos[2], var_256ac12c1df1f01a[2]);
        min_z = min(ground_pos[2], var_256ac12c1df1f01a[2]);
        if (max_z - min_z <= var_4949a6d8bd698d95) {
            var_56dcf8813d0329e = (var_256ac12c1df1f01a[0], var_256ac12c1df1f01a[1], max_z);
            return var_56dcf8813d0329e;
        }
    }
    return undefined;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbbc
// Size: 0x5e
function within_fov(start_origin, start_angles, end_origin, fov) {
    normal = vectornormalize(end_origin - start_origin);
    forward = anglestoforward(start_angles);
    dot = vectordot(forward, normal);
    return dot >= fov;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcc22
// Size: 0x50
function ai_3d_sighting_model(var_f297583b09b3d29c) {
    /#
        assert(isai(self));
    #/
    if (isdefined(level.bot_funcs) && isdefined(level.bot_funcs["ai_3d_sighting_model"])) {
        return self [[ level.bot_funcs["ai_3d_sighting_model"] ]](var_f297583b09b3d29c);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc79
// Size: 0x5d
function getclosest(org, array, maxdist) {
    if (array.size == 0) {
        return undefined;
    }
    ent = sortbydistance(array, org)[0];
    if (isdefined(maxdist) && distancesquared(org, ent.origin) > squared(maxdist)) {
        return undefined;
    }
    return ent;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xccde
// Size: 0xc8
function function_4d046f33253e46e0(org, array, maxdist) {
    var_da9d76f5a9b4145 = undefined;
    closestdistance = ter_op(isdefined(maxdist), maxdist, undefined);
    foreach (ent in array) {
        if (!isdefined(ent.origin)) {
            continue;
        }
        distancesq = distancesquared(ent.origin, org);
        if (!isdefined(closestdistance) || distancesq < closestdistance) {
            var_da9d76f5a9b4145 = ent;
            closestdistance = distancesq;
        }
    }
    return var_da9d76f5a9b4145;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xcdae
// Size: 0x88
function missile_settargetandflightmode(target, mode, offset) {
    /#
        assert(isdefined(target));
    #/
    /#
        assert(isdefined(mode));
    #/
    offset = ter_op(isdefined(offset), offset, (0, 0, 0));
    self missile_settargetent(target, offset);
    switch (mode) {
    case #"hash_da8b50286ccc05fc":
        self missile_setflightmodedirect();
        break;
    case #"hash_6d308d6c437ce11c":
        self missile_setflightmodetop();
        break;
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce3d
// Size: 0x53
function add_fx(fx_id, var_bef6522a8ec5b12f) {
    if (!isdefined(level._effect)) {
        level._effect = [];
    }
    /#
        assert(isdefined(var_bef6522a8ec5b12f));
    #/
    /#
        assert(isdefined(fx_id));
    #/
    level._effect[fx_id] = loadfx(var_bef6522a8ec5b12f);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce97
// Size: 0x38
function create_func_ref(name, func) {
    if (!isdefined(level.func)) {
        level.func = [];
    }
    level.func[name] = func;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xced6
// Size: 0x3f
function create_empty_func_ref(name) {
    if (!isdefined(level.func)) {
        level.func = [];
    }
    if (!isdefined(level.func[name])) {
        create_func_ref(name, &empty_init_func);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf1c
// Size: 0x26
function func_ref_exist(name) {
    return isdefined(level.func) && isdefined(level.func[name]);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf4a
// Size: 0x4b
function add_init_script(name, var_11ad17280f2f60f8) {
    if (!isdefined(level.init_script)) {
        level.init_script = [];
    }
    if (isdefined(level.init_script[name])) {
        return 0;
    }
    level.init_script[name] = var_11ad17280f2f60f8;
    return 1;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcf9d
// Size: 0x49
function add_frame_event(event) {
    if (!isdefined(self.frame_events)) {
        self.frame_events = [0:event];
        thread process_frame_events();
    } else {
        self.frame_events[self.frame_events.size] = event;
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcfed
// Size: 0x67
function process_frame_events() {
    while (1) {
        if (!isdefined(self)) {
            break;
        }
        foreach (event in self.frame_events) {
            self thread [[ event ]]();
        }
        waitframe();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd05b
// Size: 0x61
function delaythread(timer, func, param1, param2, param3, param4, param5, param6, param7) {
    thread delaythread_proc(func, undefined, timer, param1, param2, param3, param4, param5, param6, param7);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd0c3
// Size: 0x6a
function function_f9a207358d70923c(timer, endonevent, func, param1, param2, param3, param4, param5, param6, param7) {
    thread delaythread_proc(func, endonevent, timer, param1, param2, param3, param4, param5, param6, param7);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params a, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd134
// Size: 0x191
function delaythread_proc(func, endonevent, timer, param1, param2, param3, param4, param5, param6, param7) {
    if (isdefined(self) && !isarray(self)) {
        self endon("stop_delay_thread");
        if (isent(self) && isplayer(self)) {
            self endon("death_or_disconnect");
        } else {
            self endon("death");
        }
        if (isdefined(endonevent)) {
            if (!isarray(endonevent)) {
                endonevent = [0:endonevent];
            }
            foreach (var_cb57658b734d4b0c in endonevent) {
                self endon(var_cb57658b734d4b0c);
            }
        }
    }
    wait(timer);
    if (isdefined(param7)) {
        thread [[ func ]](param1, param2, param3, param4, param5, param6, param7);
    } else if (isdefined(param6)) {
        thread [[ func ]](param1, param2, param3, param4, param5, param6);
    } else if (isdefined(param5)) {
        thread [[ func ]](param1, param2, param3, param4, param5);
    } else if (isdefined(param4)) {
        thread [[ func ]](param1, param2, param3, param4);
    } else if (isdefined(param3)) {
        thread [[ func ]](param1, param2, param3);
    } else if (isdefined(param2)) {
        thread [[ func ]](param1, param2);
    } else if (isdefined(param1)) {
        thread [[ func ]](param1);
    } else {
        thread [[ func ]]();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 12, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd2cc
// Size: 0x1a9
function damagelocationisany(a, b, c, d, e, f, g, h, i, j, k, ovr) {
    if (isdefined(self.damagelocation)) {
        if (!isdefined(a)) {
            return 0;
        }
        if (self.damagelocation == a) {
            return 1;
        }
        if (!isdefined(b)) {
            return 0;
        }
        if (self.damagelocation == b) {
            return 1;
        }
        if (!isdefined(c)) {
            return 0;
        }
        if (self.damagelocation == c) {
            return 1;
        }
        if (!isdefined(d)) {
            return 0;
        }
        if (self.damagelocation == d) {
            return 1;
        }
        if (!isdefined(e)) {
            return 0;
        }
        if (self.damagelocation == e) {
            return 1;
        }
        if (!isdefined(f)) {
            return 0;
        }
        if (self.damagelocation == f) {
            return 1;
        }
        if (!isdefined(g)) {
            return 0;
        }
        if (self.damagelocation == g) {
            return 1;
        }
        if (!isdefined(h)) {
            return 0;
        }
        if (self.damagelocation == h) {
            return 1;
        }
        if (!isdefined(i)) {
            return 0;
        }
        if (self.damagelocation == i) {
            return 1;
        }
        if (!isdefined(j)) {
            return 0;
        }
        if (self.damagelocation == j) {
            return 1;
        }
        if (!isdefined(k)) {
            return 0;
        }
        if (self.damagelocation == k) {
            return 1;
        }
        /#
            assert(!isdefined(ovr));
        #/
    }
    return damagesubpartlocationisany(a, b, c, d, e, f, g, h, i, j, k, ovr);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 12, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd47d
// Size: 0x194
function damagesubpartlocationisany(a, b, c, d, e, f, g, h, i, j, k, ovr) {
    if (!isdefined(self.damagedsubpart)) {
        return 0;
    }
    if (!isdefined(a)) {
        return 0;
    }
    if (self.damagedsubpart == a) {
        return 1;
    }
    if (!isdefined(b)) {
        return 0;
    }
    if (self.damagedsubpart == b) {
        return 1;
    }
    if (!isdefined(c)) {
        return 0;
    }
    if (self.damagedsubpart == c) {
        return 1;
    }
    if (!isdefined(d)) {
        return 0;
    }
    if (self.damagedsubpart == d) {
        return 1;
    }
    if (!isdefined(e)) {
        return 0;
    }
    if (self.damagedsubpart == e) {
        return 1;
    }
    if (!isdefined(f)) {
        return 0;
    }
    if (self.damagedsubpart == f) {
        return 1;
    }
    if (!isdefined(g)) {
        return 0;
    }
    if (self.damagedsubpart == g) {
        return 1;
    }
    if (!isdefined(h)) {
        return 0;
    }
    if (self.damagedsubpart == h) {
        return 1;
    }
    if (!isdefined(i)) {
        return 0;
    }
    if (self.damagedsubpart == i) {
        return 1;
    }
    if (!isdefined(j)) {
        return 0;
    }
    if (self.damagedsubpart == j) {
        return 1;
    }
    if (!isdefined(k)) {
        return 0;
    }
    if (self.damagedsubpart == k) {
        return 1;
    }
    /#
        assert(!isdefined(ovr));
    #/
    return 0;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd619
// Size: 0x62
function isbulletdamage(meansofdeath) {
    if (!isdefined(meansofdeath)) {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
        return 0;
    }
    switch (meansofdeath) {
    case #"hash_590bdb04e515167b":
    case #"hash_5f1054c48d66fd1c":
    case #"hash_966768b3f0c94767":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd682
// Size: 0x2b
function isfiredamage(meansofdeath) {
    if (!isdefined(meansofdeath)) {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
        return 0;
    }
    return meansofdeath == "MOD_FIRE";
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd6b5
// Size: 0x2b
function function_f1d312f6935bc2d2(meansofdeath) {
    if (!isdefined(meansofdeath)) {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
        return 0;
    }
    return meansofdeath == "MOD_IMPACT";
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd6e8
// Size: 0x2b
function ismeleedamage(meansofdeath) {
    if (!isdefined(meansofdeath)) {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
        return 0;
    }
    return meansofdeath == "MOD_MELEE";
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd71b
// Size: 0x33
function function_f86569fc5d5dc60f(inflictor, meansofdeath) {
    if (!isdefined(inflictor) || !isdefined(inflictor.vehiclename)) {
        return 0;
    }
    return meansofdeath == "MOD_CRUSH";
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd756
// Size: 0x78
function isvalidpeekoutdir(dir) {
    node = self;
    var_13c75db93110ad97 = node getvalidcoverpeekouts();
    foreach (var_5b54041ce862b7e in var_13c75db93110ad97) {
        if (var_5b54041ce862b7e == dir) {
            return 1;
        }
    }
    return 0;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd7d6
// Size: 0x1fd
function getbestcovermultinodetype(node) {
    /#
        assert(isai(self));
    #/
    var_a4d325774cc3387d = node getvalidcovermultinodetypes();
    if (var_a4d325774cc3387d.size <= 0) {
        return undefined;
    }
    yaw_diff = 0;
    if (isdefined(self.enemy)) {
        var_ed81367a7389038a = self.enemy.origin;
        if (issentient(self.enemy) && self lastknowntime(self.enemy) > 0) {
            var_ed81367a7389038a = self lastknownpos(self.enemy);
        }
        var_72c1ba1a734c19e6 = vectortoangles(var_ed81367a7389038a - node.origin);
        yaw_diff = angleclamp180(var_72c1ba1a734c19e6[1] - node.angles[1]);
    }
    foreach (var_af80a5e00a28ca34 in var_a4d325774cc3387d) {
        switch (var_af80a5e00a28ca34) {
        case #"hash_78b110033ccb68b0":
        case #"hash_c3b74422dec48736":
            if (abs(yaw_diff) < 30) {
                return var_af80a5e00a28ca34;
            }
            break;
        case #"hash_55ed607005f12d49":
        case #"hash_e1d8e1adebed5a61":
            if (yaw_diff > 30) {
                return "Cover Left";
            }
            break;
        case #"hash_667bc7e605903a6c":
        case #"hash_cd3ffe799551db82":
            if (yaw_diff < -30) {
                return "Cover Right";
            }
            break;
        default:
            /#
                assertmsg("GetBestCoverMultiNodeType() : Unrecognized node type.");
            #/
            break;
        }
    }
    nodetype = var_a4d325774cc3387d[0];
    switch (nodetype) {
    case #"hash_55ed607005f12d49":
        return "Cover Left";
    case #"hash_667bc7e605903a6c":
        return "Cover Right";
        break;
    }
    return nodetype;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9db
// Size: 0x38
function isnodecoverleft(node) {
    /#
        assert(isdefined(node) && isdefined(node.type));
    #/
    return node.type == "Cover Left";
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda1b
// Size: 0x38
function isnodecoverright(node) {
    /#
        assert(isdefined(node) && isdefined(node.type));
    #/
    return node.type == "Cover Right";
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xda5b
// Size: 0x62
function isnodecovercrouchtype(node, type) {
    /#
        assert(isdefined(node));
    #/
    if (node.type == "Cover Crouch" && isdefined(self._blackboard.croucharrivaltype)) {
        return (self._blackboard.croucharrivaltype == type);
    }
    return 0;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdac5
// Size: 0x1e
function isnode3d(node) {
    return isnodecover3d(node) || isnodeexposed3d(node);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdaeb
// Size: 0x4d
function isnodecover3d(node) {
    /#
        assert(isdefined(node) && isdefined(node.type));
    #/
    return node.type == "Cover Stand 3D" || node.type == "Cover 3D";
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb40
// Size: 0x4d
function isnodeexposed3d(node) {
    /#
        assert(isdefined(node) && isdefined(node.type));
    #/
    return node.type == "Exposed 3D" || node.type == "Path 3D";
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb95
// Size: 0x62
function isnodecovercrouch(node) {
    /#
        assert(isdefined(node) && isdefined(node.type));
    #/
    return node.type == "Cover Crouch" || node.type == "Cover Crouch Window" || node.type == "Conceal Crouch";
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdbff
// Size: 0x61
function getaimyawtopoint(point) {
    yaw = getyawtospot(point);
    dist = distance(self.origin, point);
    if (dist > 3) {
        var_e062b0dfb1625d77 = asin(-3 / dist);
        yaw = yaw - var_e062b0dfb1625d77;
    }
    yaw = angleclamp180(yaw);
    return yaw;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc68
// Size: 0x8e
function getyawtospot(spot) {
    if (actor_is3d()) {
        forward = anglestoforward(self.angles);
        var_818cda9bc6b4ea1c = rotatepointaroundvector(forward, spot - self.origin, self.angles[2] * -1);
        spot = var_818cda9bc6b4ea1c + self.origin;
    }
    yaw = getyaw(spot) - self.angles[1];
    yaw = angleclamp180(yaw);
    return yaw;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdcfe
// Size: 0x1c
function getyaw(org) {
    return vectortoyaw(org - self.origin);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd22
// Size: 0x61
function getaimyawtopoint3d(point) {
    yaw = getyawtospot3d(point);
    dist = distance(self.origin, point);
    if (dist > 3) {
        var_e062b0dfb1625d77 = asin(-3 / dist);
        yaw = yaw - var_e062b0dfb1625d77;
    }
    yaw = angleclamp180(yaw);
    return yaw;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd8b
// Size: 0x5f
function getyawtospot3d(spot) {
    var_2f2845d474ecddd0 = spot - self.origin;
    var_11f7d776431edc42 = rotatevectorinverted(var_2f2845d474ecddd0, self.angles);
    yaw = vectortoyaw(var_11f7d776431edc42);
    var_bfb998964a6ca671 = angleclamp180(yaw);
    return var_bfb998964a6ca671;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xddf2
// Size: 0x61
function getaimpitchtopoint3d(point) {
    pitch = getpitchtospot3d(point);
    dist = distance(self.origin, point);
    if (dist > 3) {
        var_e062b0dfb1625d77 = asin(-3 / dist);
        pitch = pitch - var_e062b0dfb1625d77;
    }
    pitch = angleclamp180(pitch);
    return pitch;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde5b
// Size: 0x5f
function getpitchtospot3d(spot) {
    var_2f2845d474ecddd0 = spot - self.origin;
    var_11f7d776431edc42 = rotatevectorinverted(var_2f2845d474ecddd0, self.angles);
    pitch = vectortopitch(var_11f7d776431edc42);
    var_b316fc9fc1fccc04 = angleclamp180(pitch);
    return var_b316fc9fc1fccc04;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdec2
// Size: 0x48
function getplayerpitch(player) {
    /#
        assert(isplayer(player));
    #/
    playerangles = player getplayerangles();
    /#
        assert(isnumber(playerangles[0]));
    #/
    return (playerangles[0] + 360) % 360;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf12
// Size: 0x4a
function getplayeryaw(player) {
    /#
        assert(isplayer(player));
    #/
    playerangles = player getplayerangles();
    /#
        assert(isnumber(playerangles[1]));
    #/
    return (playerangles[1] + 360) % 360;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf64
// Size: 0xd
function actor_isspace() {
    return istrue(self.space);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf79
// Size: 0x9
function actor_is3d() {
    return actor_isspace();
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf8a
// Size: 0x93
function getpredictedaimyawtoshootentorpos(time, shootent, shootpos) {
    if (!isdefined(shootent)) {
        if (!isdefined(shootpos)) {
            return 0;
        }
        return getaimyawtopoint(shootpos);
    }
    v = (0, 0, 0);
    if (isplayer(shootent)) {
        v = shootent getvelocity();
    } else if (isai(shootent)) {
        v = shootent.velocity;
    }
    predictedpos = shootent.origin + v * time;
    return getaimyawtopoint(predictedpos);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe025
// Size: 0x93
function getpredictedaimyawtoshootentorpos3d(time, shootent, shootpos) {
    if (!isdefined(shootent)) {
        if (!isdefined(shootpos)) {
            return 0;
        }
        return getaimyawtopoint3d(shootpos);
    }
    v = (0, 0, 0);
    if (isplayer(shootent)) {
        v = shootent getvelocity();
    } else if (isai(shootent)) {
        v = shootent.velocity;
    }
    predictedpos = shootent.origin + v * time;
    return getaimyawtopoint3d(predictedpos);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe0c0
// Size: 0x93
function getpredictedaimpitchtoshootentorpos3d(time, shootent, shootpos) {
    if (!isdefined(shootent)) {
        if (!isdefined(shootpos)) {
            return 0;
        }
        return getaimpitchtopoint3d(shootpos);
    }
    v = (0, 0, 0);
    if (isplayer(shootent)) {
        v = shootent getvelocity();
    } else if (isai(shootent)) {
        v = shootent.velocity;
    }
    predictedpos = shootent.origin + v * time;
    return getaimpitchtopoint3d(predictedpos);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe15b
// Size: 0x23
function is_equal(var_43481bfd34bae676, var_43481afd34bae443) {
    return isdefined(var_43481bfd34bae676) && isdefined(var_43481afd34bae443) && var_43481bfd34bae676 == var_43481afd34bae443;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe186
// Size: 0x84
function function_5b7e9a4c946f3a13(arg, var_b6989377114ac328) {
    /#
        assertex(isarray(var_b6989377114ac328), "argArray must be an array");
    #/
    if (!isdefined(arg)) {
        return 0;
    }
    foreach (value in var_b6989377114ac328) {
        if (isdefined(value) && arg == value) {
            return 1;
        }
    }
    return 0;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe212
// Size: 0x4
function player_is_in_jackal() {
    return 0;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe21e
// Size: 0x2d
function set_createfx_enabled() {
    if (!isdefined(level.createfx_enabled)) {
        level.createfx_enabled = getdvar(@"hash_284cbc4392371c00") != "";
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe252
// Size: 0x27
function flag_set_delayed(message, delay, var_ac9510cd03af7e12) {
    wait(delay);
    flag_set(message, var_ac9510cd03af7e12);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xe280
// Size: 0x16a
function noself_array_call(entities, process, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a) {
    if (isdefined(var_d2806d25e4c8134a)) {
        foreach (ent in entities) {
            builtin [[ process ]](ent, var_d2806725e4c80618, var_d2806825e4c8084b, var_d2806d25e4c8134a);
        }
        return;
    }
    if (isdefined(var_d2806825e4c8084b)) {
        foreach (ent in entities) {
            builtin [[ process ]](ent, var_d2806725e4c80618, var_d2806825e4c8084b);
        }
        return;
    }
    if (isdefined(var_d2806725e4c80618)) {
        foreach (ent in entities) {
            builtin [[ process ]](ent, var_d2806725e4c80618);
        }
        return;
    }
    foreach (ent in entities) {
        builtin [[ process ]](ent);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe3f1
// Size: 0x2a
function flag_assert(msg) {
    /#
        assertex(!flag(msg), "Flag " + msg + " set too soon!");
    #/
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe422
// Size: 0x37
function flag_wait_either(flag1, var_5228090a1cf6f05b) {
    for (;;) {
        for (;;) {
            if (flag(flag1)) {
                return;
            }
            if (flag(var_5228090a1cf6f05b)) {
                return;
            }
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe460
// Size: 0x41
function flag_wait_either_return(flag1, var_5228090a1cf6f05b) {
    if (flag(flag1)) {
        return flag1;
    }
    if (flag(var_5228090a1cf6f05b)) {
        return var_5228090a1cf6f05b;
    }
    msg = level waittill_any_return_2(flag1, var_5228090a1cf6f05b);
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe4ac
// Size: 0x5e
function function_665d474ff040b446(flags) {
    /#
        assertex(isarray(flags), "flag_wait_any_array needs an array of flag names passed in.");
    #/
    flags = array_removeundefined(flags);
    for (;;) {
        for (i = 0; i < flags.size; i++) {
            if (flag(flags[i])) {
                return flags[i];
            }
        }
        level function_5adca43f839a3cce(flags);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe511
// Size: 0x13
function function_51ffc85dd7ebde09(flags) {
    return function_665d474ff040b446(flags);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xe52c
// Size: 0x131
function flag_wait_any(flag1, var_5228090a1cf6f05b, var_5228080a1cf6ee28, var_52280f0a1cf6fd8d, var_52280e0a1cf6fb5a, var_52280d0a1cf6f927) {
    array = [];
    if (isdefined(var_52280d0a1cf6f927)) {
        array[array.size] = flag1;
        array[array.size] = var_5228090a1cf6f05b;
        array[array.size] = var_5228080a1cf6ee28;
        array[array.size] = var_52280f0a1cf6fd8d;
        array[array.size] = var_52280e0a1cf6fb5a;
        array[array.size] = var_52280d0a1cf6f927;
    } else if (isdefined(var_52280e0a1cf6fb5a)) {
        array[array.size] = flag1;
        array[array.size] = var_5228090a1cf6f05b;
        array[array.size] = var_5228080a1cf6ee28;
        array[array.size] = var_52280f0a1cf6fd8d;
        array[array.size] = var_52280e0a1cf6fb5a;
    } else if (isdefined(var_52280f0a1cf6fd8d)) {
        array[array.size] = flag1;
        array[array.size] = var_5228090a1cf6f05b;
        array[array.size] = var_5228080a1cf6ee28;
        array[array.size] = var_52280f0a1cf6fd8d;
    } else if (isdefined(var_5228080a1cf6ee28)) {
        array[array.size] = flag1;
        array[array.size] = var_5228090a1cf6f05b;
        array[array.size] = var_5228080a1cf6ee28;
    } else if (isdefined(var_5228090a1cf6f05b)) {
        flag_wait_either(flag1, var_5228090a1cf6f05b);
        return;
    } else {
        /#
            assertmsg("flag_wait_any() needs at least 2 flags passed to it");
        #/
        return;
    }
    for (;;) {
        for (i = 0; i < array.size; i++) {
            if (flag(array[i])) {
                return;
            }
        }
        level waittill_any(flag1, var_5228090a1cf6f05b, var_5228080a1cf6ee28, var_52280f0a1cf6fd8d, var_52280e0a1cf6fb5a, var_52280d0a1cf6f927);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xe664
// Size: 0x1fb
function flag_wait_any_timeout(timer, flag1, var_5228090a1cf6f05b, var_5228080a1cf6ee28, var_52280f0a1cf6fd8d, var_52280e0a1cf6fb5a, var_52280d0a1cf6f927) {
    /#
        assertex(isdefined(timer) && timer > 0, "flag_wait_any_timeout() requires a defined timer that is greater than zero");
    #/
    var_6fc321a0eb77771e = timer * 1000;
    start_time = gettime();
    array = [];
    if (isdefined(var_52280d0a1cf6f927)) {
        array[array.size] = flag1;
        array[array.size] = var_5228090a1cf6f05b;
        array[array.size] = var_5228080a1cf6ee28;
        array[array.size] = var_52280f0a1cf6fd8d;
        array[array.size] = var_52280e0a1cf6fb5a;
        array[array.size] = var_52280d0a1cf6f927;
    } else if (isdefined(var_52280e0a1cf6fb5a)) {
        array[array.size] = flag1;
        array[array.size] = var_5228090a1cf6f05b;
        array[array.size] = var_5228080a1cf6ee28;
        array[array.size] = var_52280f0a1cf6fd8d;
        array[array.size] = var_52280e0a1cf6fb5a;
    } else if (isdefined(var_52280f0a1cf6fd8d)) {
        array[array.size] = flag1;
        array[array.size] = var_5228090a1cf6f05b;
        array[array.size] = var_5228080a1cf6ee28;
        array[array.size] = var_52280f0a1cf6fd8d;
    } else if (isdefined(var_5228080a1cf6ee28)) {
        array[array.size] = flag1;
        array[array.size] = var_5228090a1cf6f05b;
        array[array.size] = var_5228080a1cf6ee28;
    } else if (isdefined(var_5228090a1cf6f05b)) {
        array[array.size] = flag1;
        array[array.size] = var_5228090a1cf6f05b;
    } else {
        /#
            assertmsg("flag_wait_any_timeout() needs at least 2 flags passed to it");
        #/
        return;
    }
    for (;;) {
        foreach (var_f4b4fe5611c0f995 in array) {
            if (flag(var_f4b4fe5611c0f995)) {
                return;
            }
        }
        curr_time = gettime();
        if (curr_time >= start_time + var_6fc321a0eb77771e) {
            break;
        }
        timeremaining = var_6fc321a0eb77771e - curr_time - start_time;
        var_5c0d5bb3cb09262e = timeremaining / 1000;
        internal_wait_for_any_flag_or_time_elapses(array, var_5c0d5bb3cb09262e);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe866
// Size: 0x5e
function internal_wait_for_any_flag_or_time_elapses(var_a3f0ef56929fc827, timer) {
    foreach (var_f4b4fe5611c0f995 in var_a3f0ef56929fc827) {
        level endon(var_f4b4fe5611c0f995);
    }
    wait(timer);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xe8cb
// Size: 0x107
function flag_wait_any_return(flag1, var_5228090a1cf6f05b, var_5228080a1cf6ee28, var_52280f0a1cf6fd8d, var_52280e0a1cf6fb5a) {
    array = [];
    if (isdefined(var_52280e0a1cf6fb5a)) {
        array[array.size] = flag1;
        array[array.size] = var_5228090a1cf6f05b;
        array[array.size] = var_5228080a1cf6ee28;
        array[array.size] = var_52280f0a1cf6fd8d;
        array[array.size] = var_52280e0a1cf6fb5a;
    } else if (isdefined(var_52280f0a1cf6fd8d)) {
        array[array.size] = flag1;
        array[array.size] = var_5228090a1cf6f05b;
        array[array.size] = var_5228080a1cf6ee28;
        array[array.size] = var_52280f0a1cf6fd8d;
    } else if (isdefined(var_5228080a1cf6ee28)) {
        array[array.size] = flag1;
        array[array.size] = var_5228090a1cf6f05b;
        array[array.size] = var_5228080a1cf6ee28;
    } else if (isdefined(var_5228090a1cf6f05b)) {
        msg = flag_wait_either_return(flag1, var_5228090a1cf6f05b);
        return msg;
    } else {
        /#
            assertmsg("flag_wait_any_return() needs at least 2 flags passed to it");
        #/
        return;
    }
    for (i = 0; i < array.size; i++) {
        if (flag(array[i])) {
            return array[i];
        }
    }
    msg = level waittill_any_return_5(flag1, var_5228090a1cf6f05b, var_5228080a1cf6ee28, var_52280f0a1cf6fd8d, var_52280e0a1cf6fb5a);
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xe9dd
// Size: 0x58
function flag_wait_all(flag1, var_5228090a1cf6f05b, var_5228080a1cf6ee28, var_52280f0a1cf6fd8d) {
    if (isdefined(flag1)) {
        flag_wait(flag1);
    }
    if (isdefined(var_5228090a1cf6f05b)) {
        flag_wait(var_5228090a1cf6f05b);
    }
    if (isdefined(var_5228080a1cf6ee28)) {
        flag_wait(var_5228080a1cf6ee28);
    }
    if (isdefined(var_52280f0a1cf6fd8d)) {
        flag_wait(var_52280f0a1cf6fd8d);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xea3c
// Size: 0xc8
function function_7a252abaaa15fcd7(flags) {
    flags = array_removeundefined(flags);
    for (;;) {
        foreach (flagname in flags) {
            flag_wait(flagname);
        }
        var_c8c20ad7b4271d20 = 0;
        foreach (flagname in flags) {
            if (flag(flagname)) {
                var_c8c20ad7b4271d20++;
            }
        }
        if (var_c8c20ad7b4271d20 == flags.size) {
            break;
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeb0b
// Size: 0xc8
function flag_waitopen_all_array(flags) {
    flags = array_removeundefined(flags);
    for (;;) {
        foreach (flagname in flags) {
            flag_waitopen(flagname);
        }
        var_df8bbda6a16dd1cb = 0;
        foreach (flagname in flags) {
            if (!flag(flagname)) {
                var_df8bbda6a16dd1cb++;
            }
        }
        if (var_df8bbda6a16dd1cb == flags.size) {
            break;
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xebda
// Size: 0x80
function flag_wait_or_timeout(flagname, timer) {
    var_6fc321a0eb77771e = timer * 1000;
    start_time = gettime();
    for (;;) {
        for (;;) {
            if (flag(flagname)) {
                break;
            }
            if (gettime() >= start_time + var_6fc321a0eb77771e) {
                break;
            }
            timeremaining = var_6fc321a0eb77771e - gettime() - start_time;
            var_5c0d5bb3cb09262e = timeremaining / 1000;
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec61
// Size: 0x50
function flag_waitopen_or_timeout(flagname, timer) {
    start_time = gettime();
    for (;;) {
        for (;;) {
            if (!flag(flagname)) {
                break;
            }
            if (gettime() >= start_time + timer * 1000) {
                break;
            }
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xecb8
// Size: 0x19
function wait_for_flag_or_time_elapses(flagname, timer) {
    level endon(flagname);
    wait(timer);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params a, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xecd8
// Size: 0x6a
function noself_delaycall(timer, func, param1, param2, param3, param4, param5, param6, param7, param8) {
    thread noself_delaycall_proc(func, timer, param1, param2, param3, param4, param5, param6, param7, param8);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params a, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed49
// Size: 0x102
function noself_delaycall_proc(func, timer, param1, param2, param3, param4, param5, param6, param7, param8) {
    wait(timer);
    if (isdefined(param8)) {
        builtin [[ func ]](param1, param2, param3, param4, param5, param6, param7, param8);
    } else if (isdefined(param7)) {
        builtin [[ func ]](param1, param2, param3, param4, param5, param6, param7);
    } else if (isdefined(param6)) {
        builtin [[ func ]](param1, param2, param3, param4, param5, param6);
    } else if (isdefined(param5)) {
        builtin [[ func ]](param1, param2, param3, param4, param5);
    } else if (isdefined(param4)) {
        builtin [[ func ]](param1, param2, param3, param4);
    } else if (isdefined(param3)) {
        builtin [[ func ]](param1, param2, param3);
    } else if (isdefined(param2)) {
        builtin [[ func ]](param1, param2);
    } else if (isdefined(param1)) {
        builtin [[ func ]](param1);
    } else {
        builtin [[ func ]]();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee52
// Size: 0xc1
function get_target_array(target) {
    if (!isdefined(target)) {
        target = self.target;
    }
    /#
        assertex(isdefined(target), "Self had no target!");
    #/
    ents = getentarray(target, "targetname");
    if (ents.size > 0) {
        return ents;
    }
    if (issp()) {
        ents = builtin [[ level.getnodearrayfunction ]](target, "targetname");
        if (ents.size > 0) {
            return ents;
        }
    }
    if (isdefined(level.struct_class_names)) {
        ents = getstructarray(target, "targetname");
        if (ents.size > 0) {
            return ents;
        }
    }
    ents = getvehiclenodearray(target, "targetname");
    if (ents.size > 0) {
        return ents;
    }
    /#
        assertmsg("Tried to get ent " + target + ", but there are no ents.");
    #/
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xef1a
// Size: 0xa
function pauseeffect() {
    namespace_321fdd8ad2993260::stop_fx_looper();
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef2b
// Size: 0x92
function spawn_script_origin(org, ang) {
    if (!isdefined(ang) && isdefined(self.angles)) {
        ang = self.angles;
    }
    if (!isdefined(org) && isdefined(self.origin)) {
        org = self.origin;
    } else if (!isdefined(org)) {
        org = (0, 0, 0);
    }
    script_origin = spawn("script_origin", org);
    if (isdefined(ang)) {
        script_origin.angles = ang;
    }
    return script_origin;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xefc5
// Size: 0xb1
function get_noteworthy_array(noteworthy) {
    /#
        assertex(isdefined(noteworthy), "No script_noteworthy provided!");
    #/
    ents = getentarray(noteworthy, "script_noteworthy");
    if (ents.size > 0) {
        return ents;
    }
    if (issp()) {
        ents = builtin [[ level.getnodearrayfunction ]](noteworthy, "script_noteworthy");
        if (ents.size > 0) {
            return ents;
        }
    }
    if (isdefined(level.struct_class_names)) {
        ents = getstructarray(noteworthy, "script_noteworthy");
        if (ents.size > 0) {
            return ents;
        }
    }
    ents = getvehiclenodearray(noteworthy, "script_noteworthy");
    if (ents.size > 0) {
        return ents;
    }
    /#
        assertex("Tried to get ents by noteworthy "" + noteworthy + "" but none were found.");
    #/
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf07d
// Size: 0x4a
function get_cumulative_weights(weights) {
    var_d3b5ea3e9016d6e4 = [];
    var_be66de030b25508c = 0;
    for (i = 0; i < weights.size; i++) {
        var_be66de030b25508c = var_be66de030b25508c + weights[i];
        var_d3b5ea3e9016d6e4[i] = var_be66de030b25508c;
    }
    return var_d3b5ea3e9016d6e4;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0cf
// Size: 0x3
function void() {
    
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0d9
// Size: 0x5d
function getanim(anime) {
    /#
        assertex(isdefined(self.animname), "Called getanim on a guy with no animname");
    #/
    /#
        assertex(isdefined(level.scr_anim[self.animname][anime]), "Called getanim on an inexistent anim");
    #/
    return level.scr_anim[self.animname][anime];
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf13e
// Size: 0x3a
function hasanim(anime) {
    /#
        assertex(isdefined(self.animname), "Called hasanim on a guy with no animname");
    #/
    return isdefined(level.scr_anim[self.animname][anime]);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf180
// Size: 0x4d
function getanim_from_animname(anime, animname) {
    /#
        assertex(isdefined(animname), "Must supply an animname");
    #/
    /#
        assertex(isdefined(level.scr_anim[animname][anime]), "Called getanim_from_animname on an inexistent anim");
    #/
    return level.scr_anim[animname][anime];
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf1d5
// Size: 0x3d
function getanim_generic(anime) {
    /#
        assertex(isdefined(level.scr_anim["generic"][anime]), "Called getanim_generic on an inexistent anim");
    #/
    return level.scr_anim["generic"][anime];
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf21a
// Size: 0x1e
function hasanim_generic(anime) {
    return isdefined(level.scr_anim["generic"][anime]);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf240
// Size: 0xdd
function function_6d41ac1c3d718a62(anime, ent) {
    var_22b4906afb0ed359 = [];
    if (namespace_bc4a4b9456315863::function_f1e7ee8ddeece062(anime)) {
        foreach (animation in level.scr_anim[ent.animname][anime]) {
            var_4f51ef0bd97a4707 = namespace_bc4a4b9456315863::function_56bd620e57a834af(anime, ent.animname, animation);
            namespace_bc4a4b9456315863::anim_first_frame_solo(ent, var_4f51ef0bd97a4707);
            var_22b4906afb0ed359[var_22b4906afb0ed359.size] = ent.origin;
        }
    } else {
        namespace_bc4a4b9456315863::anim_first_frame_solo(ent, anime);
        var_22b4906afb0ed359[var_22b4906afb0ed359.size] = ent.origin;
    }
    return var_22b4906afb0ed359;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf325
// Size: 0x4d
function waittill_match_or_timeout(msg, match, timer) {
    ent = spawnstruct();
    ent endon("complete");
    ent delaythread(timer, &send_notify, "complete");
    self waittillmatch(msg, match);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf379
// Size: 0x26
function function_ee012c2dd711a8ce(msg, match, endonmsg) {
    self endon(endonmsg);
    self waittillmatch(msg, match);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf3a6
// Size: 0x4d
function waittill_match_or_timeout_return(msg, match, timer) {
    ent = spawnstruct();
    ent endon("complete");
    ent delaythread(timer, &send_notify, "complete");
    match = self waittill(msg);
    return match;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf3fb
// Size: 0x25
function send_notify(msg, var_1ef9e61d95cbf8f7) {
    if (isdefined(var_1ef9e61d95cbf8f7)) {
        self notify(msg, var_1ef9e61d95cbf8f7);
    } else {
        self notify(msg);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf427
// Size: 0x3c
function get_notetrack_time(animation, notetrack) {
    var_95aca96ee2618fe = getnotetracktimes(animation, notetrack);
    animlength = getanimlength(animation);
    return var_95aca96ee2618fe[0] * animlength;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf46b
// Size: 0x13
function mph_to_ips(var_360e0b041df08cac) {
    return var_360e0b041df08cac * 17.6;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf486
// Size: 0x2c
function mph_travel_time(speed, dist) {
    speed = mph_to_ips(speed);
    time = dist / speed;
    return time;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4ba
// Size: 0x13
function ips_to_mph(var_fec47a03f66bca81) {
    return var_fec47a03f66bca81 * 0.056818;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf4d5
// Size: 0x13
function function_dd1c9564bbdda261(var_31778f4c079763e8) {
    return var_31778f4c079763e8 * 20.2537;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf4f0
// Size: 0x13
function function_de54c0137bbb0d7f(var_fec47a03f66bca81) {
    return var_fec47a03f66bca81 * 0.049374;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf50b
// Size: 0xec
function wrap_text(text, var_b7977de916377e7f) {
    var_4e401dfeba20836c = strtok(text, " ");
    var_bd3760da5da76918 = "";
    lines = [];
    i = 0;
    var_83083665867953da = 0;
    foreach (var_33a6b5144efb9971 in var_4e401dfeba20836c) {
        if (var_83083665867953da > var_b7977de916377e7f) {
            lines[lines.size] = var_bd3760da5da76918;
            var_bd3760da5da76918 = "";
            var_83083665867953da = 0;
        }
        var_83083665867953da = var_83083665867953da + var_33a6b5144efb9971.size;
        var_bd3760da5da76918 = var_bd3760da5da76918 + var_33a6b5144efb9971;
        if (i != var_4e401dfeba20836c.size - 1) {
            var_bd3760da5da76918 = var_bd3760da5da76918 + " ";
        } else {
            lines[lines.size] = var_bd3760da5da76918;
        }
        i++;
    }
    return lines;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf5ff
// Size: 0x22c
function closestdistancebetweenlines(p1, p2, p3, p4) {
    var_b07a03030126f1cf = p1 - p3;
    var_b0900303013f2502 = p4 - p3;
    if (abs(var_b0900303013f2502[0]) < 1e-06 && abs(var_b0900303013f2502[1]) < 1e-06 && abs(var_b0900303013f2502[2]) < 1e-06) {
        return undefined;
    }
    var_b0757d030121d546 = p2 - p1;
    if (abs(var_b0757d030121d546[0]) < 1e-06 && abs(var_b0757d030121d546[1]) < 1e-06 && abs(var_b0757d030121d546[2]) < 1e-06) {
        return undefined;
    }
    var_408571de858307ba = var_b07a03030126f1cf[0] * var_b0900303013f2502[0] + var_b07a03030126f1cf[1] * var_b0900303013f2502[1] + var_b07a03030126f1cf[2] * var_b0900303013f2502[2];
    var_8960df99c11f9067 = var_b0900303013f2502[0] * var_b0757d030121d546[0] + var_b0900303013f2502[1] * var_b0757d030121d546[1] + var_b0900303013f2502[2] * var_b0757d030121d546[2];
    var_406aebde8565b7fe = var_b07a03030126f1cf[0] * var_b0757d030121d546[0] + var_b07a03030126f1cf[1] * var_b0757d030121d546[1] + var_b07a03030126f1cf[2] * var_b0757d030121d546[2];
    var_8957d199c11552ef = var_b0900303013f2502[0] * var_b0900303013f2502[0] + var_b0900303013f2502[1] * var_b0900303013f2502[1] + var_b0900303013f2502[2] * var_b0900303013f2502[2];
    var_e42ae1c5cc95a473 = var_b0757d030121d546[0] * var_b0757d030121d546[0] + var_b0757d030121d546[1] * var_b0757d030121d546[1] + var_b0757d030121d546[2] * var_b0757d030121d546[2];
    denom = var_e42ae1c5cc95a473 * var_8957d199c11552ef - var_8960df99c11f9067 * var_8960df99c11f9067;
    if (abs(denom) < 1e-06) {
        return undefined;
    }
    var_91ee1cc8355a7954 = var_408571de858307ba * var_8960df99c11f9067 - var_406aebde8565b7fe * var_8957d199c11552ef;
    var_360120041de2a656 = var_91ee1cc8355a7954 / denom;
    var_36011f041de2a423 = (var_408571de858307ba + var_8960df99c11f9067 * var_360120041de2a656) / var_8957d199c11552ef;
    var_cdcd3c78f5177db6 = p1 + var_360120041de2a656 * var_b0757d030121d546;
    var_cdcd3b78f5177b83 = p3 + var_36011f041de2a423 * var_b0900303013f2502;
    var_770e3bedd2b80d9b = [0:var_cdcd3c78f5177db6, 1:var_cdcd3b78f5177b83, 2:distance(var_cdcd3c78f5177db6, var_cdcd3b78f5177b83)];
    return var_770e3bedd2b80d9b;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xf833
// Size: 0x273
function closestdistancebetweensegments(p1, p2, p3, p4) {
    pdir = p2 - p1;
    var_a551e37fb07571f7 = p4 - p3;
    var_373e28595f2bdbcc = p1 - p3;
    var_b1efc20302c1c93f = vectordot(pdir, pdir);
    var_b1efc10302c1c70c = vectordot(pdir, var_a551e37fb07571f7);
    var_a020a802f47dea27 = vectordot(var_a551e37fb07571f7, var_a551e37fb07571f7);
    var_b1efbf0302c1c2a6 = vectordot(pdir, var_373e28595f2bdbcc);
    var_a020a602f47de5c1 = vectordot(var_a551e37fb07571f7, var_373e28595f2bdbcc);
    var_70f12a6417224bc8 = var_b1efc20302c1c93f * var_a020a802f47dea27 - var_b1efc10302c1c70c * var_b1efc10302c1c70c;
    var_4a7435b0cf1a9805 = var_70f12a6417224bc8;
    var_4a7434b0cf1a95d2 = var_70f12a6417224bc8;
    var_6e7f8ed0bf7f4f3 = 0;
    var_c3b4364038f5528 = 0;
    var_6e7f7ed0bf7f2c0 = 0;
    var_c3b4464038f575b = 0;
    if (var_70f12a6417224bc8 < 1e-08) {
        var_c3b4364038f5528 = 0;
        var_4a7435b0cf1a9805 = 1;
        var_c3b4464038f575b = var_a020a602f47de5c1;
        var_4a7434b0cf1a95d2 = var_a020a802f47dea27;
    } else {
        var_c3b4364038f5528 = var_b1efc10302c1c70c * var_a020a602f47de5c1 - var_a020a802f47dea27 * var_b1efbf0302c1c2a6;
        var_c3b4464038f575b = var_b1efc20302c1c93f * var_a020a602f47de5c1 - var_b1efc10302c1c70c * var_b1efbf0302c1c2a6;
        if (var_c3b4364038f5528 < 0) {
            var_c3b4364038f5528 = 0;
            var_c3b4464038f575b = var_a020a602f47de5c1;
            var_4a7434b0cf1a95d2 = var_a020a802f47dea27;
        } else if (var_c3b4364038f5528 > var_4a7435b0cf1a9805) {
            var_c3b4364038f5528 = var_4a7435b0cf1a9805;
            var_c3b4464038f575b = var_a020a602f47de5c1 + var_b1efc10302c1c70c;
            var_4a7434b0cf1a95d2 = var_a020a802f47dea27;
        }
    }
    if (var_c3b4464038f575b < 0) {
        var_c3b4464038f575b = 0;
        if (var_b1efbf0302c1c2a6 * -1 < 0) {
            var_c3b4364038f5528 = 0;
        } else if (var_b1efbf0302c1c2a6 * -1 > var_b1efc20302c1c93f) {
            var_c3b4364038f5528 = var_4a7435b0cf1a9805;
        } else {
            var_c3b4364038f5528 = var_b1efbf0302c1c2a6 * -1;
            var_4a7435b0cf1a9805 = var_b1efc20302c1c93f;
        }
    } else if (var_c3b4464038f575b > var_4a7434b0cf1a95d2) {
        var_c3b4464038f575b = var_4a7434b0cf1a95d2;
        if (var_b1efc10302c1c70c - var_b1efbf0302c1c2a6 < 0) {
            var_c3b4364038f5528 = 0;
        } else if (var_b1efc10302c1c70c - var_b1efbf0302c1c2a6 > var_b1efc20302c1c93f) {
            var_c3b4364038f5528 = var_4a7435b0cf1a9805;
        } else {
            var_c3b4364038f5528 = var_b1efc10302c1c70c - var_b1efbf0302c1c2a6;
            var_4a7435b0cf1a9805 = var_b1efc20302c1c93f;
        }
    }
    if (abs(var_c3b4364038f5528) > 1e-08) {
        var_6e7f8ed0bf7f4f3 = var_c3b4364038f5528 / var_4a7435b0cf1a9805;
    }
    if (abs(var_c3b4464038f575b) > 1e-08) {
        var_6e7f7ed0bf7f2c0 = var_c3b4464038f575b / var_4a7434b0cf1a95d2;
    }
    var_cdcd3c78f5177db6 = p1 + var_6e7f8ed0bf7f4f3 * pdir;
    var_cdcd3b78f5177b83 = p3 + var_6e7f7ed0bf7f2c0 * var_a551e37fb07571f7;
    var_770e3bedd2b80d9b = [0:var_cdcd3c78f5177db6, 1:var_cdcd3b78f5177b83, 2:distance(var_cdcd3c78f5177db6, var_cdcd3b78f5177b83)];
    return var_770e3bedd2b80d9b;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfaae
// Size: 0x13
function is_dead_sentient() {
    return issentient(self) && !isalive(self);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfac9
// Size: 0xd8
function hastag(model, tag) {
    if (!isdefined(model) || model == "") {
        return 0;
    }
    if (!isdefined(level.has_tag)) {
        level.has_tag = [];
    }
    key = model + "_" + tag;
    if (isdefined(level.has_tag[key])) {
        return level.has_tag[key];
    }
    var_cd148482d2898be7 = getnumparts(model);
    if (var_cd148482d2898be7 > 0) {
        for (i = 0; i < var_cd148482d2898be7; i++) {
            partname = getpartname(model, i);
            if (partname == tolower(tag)) {
                level.has_tag[key] = 1;
                return 1;
            }
        }
        level.has_tag[key] = 0;
    }
    return 0;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfba9
// Size: 0x4a
function flashbanggettimeleftsec() {
    /#
        assert(isdefined(self));
    #/
    /#
        assert(isdefined(self.flashendtime));
    #/
    durationms = self.flashendtime - gettime();
    if (durationms < 0) {
        return 0;
    }
    return durationms * 0.001;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfbfb
// Size: 0xb
function flashbangisactive() {
    return flashbanggettimeleftsec() > 0;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc0e
// Size: 0x13
function string(num) {
    return "" + num;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xfc29
// Size: 0x50
function playsoundontag(alias, tag, ends_on_death, var_b426f32755673ba6, var_510af7464e264f89) {
    /#
        assert(isdefined(level.fnplaysoundontag));
    #/
    [[ level.fnplaysoundontag ]](alias, tag, ends_on_death, var_b426f32755673ba6, var_510af7464e264f89);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc80
// Size: 0x35
function playsoundonentity(alias, var_b426f32755673ba6) {
    /#
        assert(isdefined(level.fnplaysoundonentity));
    #/
    [[ level.fnplaysoundonentity ]](alias, var_b426f32755673ba6);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfcbc
// Size: 0x29
function set_movement_speed(desiredspeed) {
    self._blackboard.requestedspeed = desiredspeed;
    self aisetdesiredspeed(desiredspeed);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfcec
// Size: 0x16
function set_cautious_navigation(enabled) {
    self.cautiousnavigation = enabled;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd09
// Size: 0x1c
function doinglongdeath() {
    /#
        assert(isai(self));
    #/
    return istrue(self.doinglongdeath);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd2d
// Size: 0x45
function is_dead_or_dying(guy) {
    if (!isdefined(guy)) {
        return 1;
    }
    if (isai(guy)) {
        return (!isalive(guy) || guy doinglongdeath());
    } else if (issentient(guy)) {
        return !isalive(guy);
    }
    return 0;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd7a
// Size: 0xcb
function motionwarpwithnotetracks(anime, targetpos, targetangles, var_546e4411cfcd0d3c, var_90fee38b006be705, duration, var_46cd2ea5c5a1da17) {
    if (isdefined(var_546e4411cfcd0d3c)) {
        var_67b5a24409d655f0 = getnotetracktimes(anime, var_546e4411cfcd0d3c)[0];
        if (!isdefined(var_67b5a24409d655f0)) {
            /#
                assertmsg("Start note track, " + var_546e4411cfcd0d3c + ", does not exist in the animation");
            #/
            var_67b5a24409d655f0 = 0;
        }
    } else {
        var_67b5a24409d655f0 = 0;
    }
    if (isdefined(var_90fee38b006be705)) {
        var_47b4bdc915cff70d = getnotetracktimes(anime, var_90fee38b006be705)[0];
        if (!isdefined(var_47b4bdc915cff70d)) {
            /#
                assertmsg("End note track, " + var_90fee38b006be705 + ", does not exist in the animation");
            #/
            var_47b4bdc915cff70d = 1;
        }
    } else {
        var_47b4bdc915cff70d = 1;
    }
    motionwarpwithtimes(anime, targetpos, targetangles, var_67b5a24409d655f0, var_47b4bdc915cff70d, duration, var_46cd2ea5c5a1da17);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe4c
// Size: 0x162
function motionwarpwithtimes(anime, targetpos, targetangles, var_67b5a24409d655f0, var_47b4bdc915cff70d, duration, var_46cd2ea5c5a1da17) {
    if (!isdefined(var_46cd2ea5c5a1da17)) {
        var_46cd2ea5c5a1da17 = 1;
    }
    var_993a8f9635e274cf = getangledelta(anime, var_67b5a24409d655f0, var_47b4bdc915cff70d);
    var_292f5d5519d832bf = getmovedelta(anime, var_67b5a24409d655f0, var_47b4bdc915cff70d);
    var_292f5d5519d832bf = rotatevector(var_292f5d5519d832bf, (0, targetangles[1] - var_993a8f9635e274cf, 0));
    var_bcf9684c0529009a = targetpos - var_292f5d5519d832bf;
    var_417bd54c6700695b = targetangles[1] - var_993a8f9635e274cf;
    var_f20bc08c9fc211a0 = (targetangles[0], var_417bd54c6700695b, targetangles[2]);
    animrate = 1;
    var_94fbe2a18e7f59b3 = length(targetpos - self.origin);
    if (var_46cd2ea5c5a1da17 && var_94fbe2a18e7f59b3 > 0) {
        animrate = length(var_292f5d5519d832bf) / var_94fbe2a18e7f59b3;
        animrate = clamp(animrate, 0.5, 2);
        self aisetanimrate(anime, animrate);
    }
    if (!isdefined(duration)) {
        animlength = getanimlength(anime) / animrate;
        duration = int((var_47b4bdc915cff70d - var_67b5a24409d655f0) * animlength * 1000);
    }
    if (duration < 50) {
        duration = 50;
    }
    self motionwarpwithanim(var_bcf9684c0529009a, var_f20bc08c9fc211a0, targetpos, targetangles, duration);
    return animrate;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xffb6
// Size: 0x2bc
function function_df956d52bae0b61d(anime, parentent, tag, var_ae7383494ea7fef1, var_b6c5de4898b7f63b, var_67b5a24409d655f0, var_47b4bdc915cff70d, duration, var_46cd2ea5c5a1da17) {
    /#
        assert(isdefined(anime));
    #/
    /#
        assert(isdefined(var_67b5a24409d655f0) && var_67b5a24409d655f0 >= 0);
    #/
    /#
        assert(isdefined(var_47b4bdc915cff70d) && var_47b4bdc915cff70d <= 1);
    #/
    /#
        assert(isdefined(parentent));
    #/
    /#
        assert(isdefined(var_ae7383494ea7fef1));
    #/
    /#
        assert(isdefined(var_b6c5de4898b7f63b));
    #/
    if (!isdefined(var_46cd2ea5c5a1da17)) {
        var_46cd2ea5c5a1da17 = 1;
    }
    if (isdefined(tag)) {
        var_88ad5fe1080b1129 = parentent gettagorigin(tag);
        var_90ff9ae0521ac213 = parentent gettagangles(tag);
    } else {
        var_88ad5fe1080b1129 = parentent.origin;
        var_90ff9ae0521ac213 = parentent.angles;
        tag = "";
    }
    var_5b76633f106fd420 = var_88ad5fe1080b1129 + rotatevector(var_ae7383494ea7fef1, var_90ff9ae0521ac213);
    var_8248003e7165c71e = combineangles(var_b6c5de4898b7f63b, var_90ff9ae0521ac213);
    var_5201fba058886642 = getangledelta3d(anime, var_67b5a24409d655f0, var_47b4bdc915cff70d);
    var_d782b8f3a2e29390 = getmovedelta(anime, var_67b5a24409d655f0, var_47b4bdc915cff70d);
    var_f7bd065066febebf = invertangles(var_5201fba058886642);
    var_f03bd42b04ee3dca = combineangles(var_8248003e7165c71e, var_f7bd065066febebf);
    var_ca6be8926624acbf = rotatevector(-1 * var_d782b8f3a2e29390, var_f7bd065066febebf);
    var_ca86acbc27e4a31c = rotatevector(var_ca6be8926624acbf, var_8248003e7165c71e);
    var_c9f74f2ba493d174 = var_5b76633f106fd420 + var_ca86acbc27e4a31c;
    var_7b1c8fcebb9c392d = self.origin - var_88ad5fe1080b1129;
    var_ed38213b0a9af604 = invertangles(var_90ff9ae0521ac213);
    var_ae7383494ea7fef1 = rotatevector(var_7b1c8fcebb9c392d, var_ed38213b0a9af604);
    var_b6c5de4898b7f63b = combineangles(self.angles, var_ed38213b0a9af604);
    animrate = 1;
    var_94fbe2a18e7f59b3 = length(var_5b76633f106fd420 - self.origin);
    if (var_46cd2ea5c5a1da17 && var_94fbe2a18e7f59b3 > 0) {
        animrate = length(var_d782b8f3a2e29390) / var_94fbe2a18e7f59b3;
        animrate = clamp(animrate, 0.5, 2);
        self aisetanimrate(anime, animrate);
    }
    if (!isdefined(duration)) {
        animlength = getanimlength(anime) / animrate;
        duration = int((var_47b4bdc915cff70d - var_67b5a24409d655f0) * animlength * 1000);
    }
    if (duration < 50) {
        duration = 50;
    }
    self linktomoveoffset(parentent, tag, var_ae7383494ea7fef1, var_b6c5de4898b7f63b);
    self motionwarpwithanim(var_c9f74f2ba493d174, var_f03bd42b04ee3dca, var_5b76633f106fd420, var_8248003e7165c71e, duration);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 15, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10279
// Size: 0x17f
function waittill_any_ents_or_timeout_return(timeout, ent1, string1, ent2, string2, ent3, string3, ent4, string4, ent5, string5, ent6, string6, ent7, string7) {
    /#
        assert(isdefined(timeout));
    #/
    /#
        assert(isdefined(ent1));
    #/
    /#
        assert(isdefined(string1));
    #/
    self endon("death");
    ent = spawnstruct();
    ent1 childthread waittill_string(string1, ent);
    if (isdefined(ent2) && isdefined(string2)) {
        ent2 childthread waittill_string(string2, ent);
    }
    if (isdefined(ent3) && isdefined(string3)) {
        ent3 childthread waittill_string(string3, ent);
    }
    if (isdefined(ent4) && isdefined(string4)) {
        ent4 childthread waittill_string(string4, ent);
    }
    if (isdefined(ent5) && isdefined(string5)) {
        ent5 childthread waittill_string(string5, ent);
    }
    if (isdefined(ent6) && isdefined(string6)) {
        ent6 childthread waittill_string(string6, ent);
    }
    if (isdefined(ent7) && isdefined(string7)) {
        ent7 childthread waittill_string(string7, ent);
    }
    ent childthread function_2c91b6c857aa73cc(timeout);
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10400
// Size: 0x28
function time_has_passed(timestamp, seconds) {
    if (!isdefined(timestamp)) {
        return 0;
    }
    return gettime() - timestamp >= seconds * 1000;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10430
// Size: 0x24
function reacttolightifpossible(var_24cd9408147d26c5) {
    self.lightreaction_lightorigin = var_24cd9408147d26c5;
    self.lightreaction_requesttime = gettime();
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1045b
// Size: 0x75
function setcovercrouchtype(covertype) {
    switch (covertype) {
    case #"hash_96815ce4f2a3dbc5":
        self.covercrouchtype = "Cover Right Crouch";
        break;
    case #"hash_c9b3133a17a3b2d0":
        self.covercrouchtype = "Cover Left Crouch";
        break;
    case #"hash_3fed0cbd303639eb":
    default:
        self.covercrouchtype = "Cover Crouch";
        break;
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x104d7
// Size: 0x17
function setcornerstepoutsdisabled(disabled) {
    self.cornerstepoutsdisabled = istrue(disabled);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x104f5
// Size: 0xd
function getcornerstepoutsdisabled() {
    return istrue(self.cornerstepoutsdisabled);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1050a
// Size: 0x8a
function can_trace_to_ai(start, ai, var_e46614399b985851, contentoverride) {
    if (isent(self) || isai(self)) {
        var_b4af0f77eff08a06 = [0:self, 1:ai];
    } else {
        var_b4af0f77eff08a06 = [0:ai];
    }
    if (isdefined(var_e46614399b985851)) {
        var_b4af0f77eff08a06 = array_combine(var_b4af0f77eff08a06, var_e46614399b985851);
    }
    content = ter_op(isdefined(contentoverride), contentoverride, namespace_2a184fc4902783dc::create_default_contents());
    return function_d291656cea83ed81(ai, start, var_e46614399b985851, content);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1059c
// Size: 0x9d
function array_removedead_or_dying(array, var_5c3b6418c0ad64ae) {
    if (!isdefined(var_5c3b6418c0ad64ae)) {
        var_5c3b6418c0ad64ae = 1;
    }
    newarray = [];
    foreach (member in array) {
        if (!isalive(member)) {
            continue;
        }
        if (isai(member) && var_5c3b6418c0ad64ae && member doinglongdeath()) {
            continue;
        }
        newarray[newarray.size] = member;
    }
    return newarray;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10641
// Size: 0x37
function disable_pain() {
    /#
        assertex(isai(self), "Tried to disable pain on a non ai");
    #/
    self.a.disablepain = 1;
    self.allowpain = 0;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1067f
// Size: 0x37
function enable_pain() {
    /#
        assertex(isai(self), "Tried to enable pain on a non ai");
    #/
    self.a.disablepain = 0;
    self.allowpain = 1;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x106bd
// Size: 0x20
function get_ai_number() {
    if (!isdefined(self.unique_id)) {
        set_ai_number();
    }
    return self.unique_id;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x106e5
// Size: 0x3c
function set_ai_number() {
    if (!isdefined(level.ai_number)) {
        level.ai_number = 0;
    }
    self.unique_id = "ai" + level.ai_number;
    level.ai_number++;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10728
// Size: 0x1d
function function_82581894f5a1c71c() {
    self.var_8aa9efe6383c1d5a = "ai" + function_e777acc966fbd44d();
    function_67a97472e5a6c64c();
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1074c
// Size: 0x48
function ent_flag_wait(msg) {
    /#
        assertex(!issentient(self) && isdefined(self) || isalive(self), "Attempt to check a flag on entity that is not alive or removed");
    #/
    while (isdefined(self) && !ent_flag(msg)) {
        self waittill(msg);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1079b
// Size: 0xb2
function array_ent_flag_wait(entities, flag) {
    var_624f473fe3ee62f1 = spawnstruct();
    foreach (entity in entities) {
        if (entity ent_flag(flag)) {
            entities = array_remove(entities, entity);
        }
    }
    array_thread(entities, &array_ent_flag_wait_proc, var_624f473fe3ee62f1, flag);
    for (i = 0; i < entities.size; i++) {
        var_624f473fe3ee62f1 waittill("notify");
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10854
// Size: 0x24
function array_ent_flag_wait_proc(var_624f473fe3ee62f1, flag) {
    ent_flag_wait(flag);
    var_624f473fe3ee62f1 notify("notify");
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1087f
// Size: 0x33
function ent_flag_wait_vehicle_node(msg) {
    /#
        assertex(isdefined(self), "Attempt to check a flag on node that is is not defined");
    #/
    while (isdefined(self) && !ent_flag(msg)) {
        self waittill(msg);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x108b9
// Size: 0x60
function ent_flag_wait_either(flag1, var_5228090a1cf6f05b) {
    /#
        assertex(!issentient(self) && isdefined(self) || isalive(self), "Attempt to check a flag on entity that is not alive or removed");
    #/
    while (isdefined(self)) {
        if (ent_flag(flag1)) {
            return;
        }
        if (ent_flag(var_5228090a1cf6f05b)) {
            return;
        }
        waittill_either(flag1, var_5228090a1cf6f05b);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10920
// Size: 0xc8
function function_243c46ee6332c45d(flags) {
    flags = array_removeundefined(flags);
    for (;;) {
        foreach (flagname in flags) {
            ent_flag_wait(flagname);
        }
        var_c8c20ad7b4271d20 = 0;
        foreach (flagname in flags) {
            if (ent_flag(flagname)) {
                var_c8c20ad7b4271d20++;
            }
        }
        if (var_c8c20ad7b4271d20 == flags.size) {
            break;
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x109ef
// Size: 0xc8
function function_cba0984334ba3279(flags) {
    flags = array_removeundefined(flags);
    for (;;) {
        foreach (flagname in flags) {
            ent_flag_waitopen(flagname);
        }
        var_e9edcc859df58c2e = 0;
        foreach (flagname in flags) {
            if (!ent_flag(flagname)) {
                var_e9edcc859df58c2e++;
            }
        }
        if (var_e9edcc859df58c2e == flags.size) {
            break;
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10abe
// Size: 0x9a
function function_e205428b44d1a83c(flags) {
    flags = array_removeundefined(flags);
    /#
        assertex(!issentient(self) && isdefined(self) || isalive(self), "Attempt to check a flag on entity that is not alive or removed");
    #/
    while (isdefined(self)) {
        foreach (flagname in flags) {
            if (!ent_flag(flagname)) {
                return;
            }
        }
        waittill_any_in_array_return(flags);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b5f
// Size: 0x7a
function ent_flag_wait_or_timeout(flagname, timer) {
    /#
        assertex(!issentient(self) && isdefined(self) || isalive(self), "Attempt to check a flag on entity that is not alive or removed");
    #/
    start_time = gettime();
    while (isdefined(self)) {
        if (ent_flag(flagname)) {
            break;
        }
        if (gettime() >= start_time + timer * 1000) {
            break;
        }
        ent_wait_for_flag_or_time_elapses(flagname, timer);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10be0
// Size: 0x19
function ent_wait_for_flag_or_time_elapses(flagname, timer) {
    self endon(flagname);
    wait(timer);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c00
// Size: 0x48
function ent_flag_waitopen(msg) {
    /#
        assertex(!issentient(self) && isdefined(self) || isalive(self), "Attempt to check a flag on entity that is not alive or removed");
    #/
    while (isdefined(self) && ent_flag(msg)) {
        self waittill(msg);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10c4f
// Size: 0x2a
function ent_flag_assert(msg) {
    /#
        assertex(!ent_flag(msg), "Flag " + msg + " set too soon on entity");
    #/
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10c80
// Size: 0x60
function ent_flag_waitopen_either(flag1, var_5228090a1cf6f05b) {
    /#
        assertex(!issentient(self) && isdefined(self) || isalive(self), "Attempt to check a flag on entity that is not alive or removed");
    #/
    while (isdefined(self)) {
        if (!ent_flag(flag1)) {
            return;
        }
        if (!ent_flag(var_5228090a1cf6f05b)) {
            return;
        }
        waittill_either(flag1, var_5228090a1cf6f05b);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ce7
// Size: 0x88
function ent_flag_init(message) {
    if (!isdefined(self.ent_flag)) {
        self.ent_flag = [];
        self.ent_flags_lock = [];
    }
    /#
        if (isdefined(level.first_frame) && level.first_frame == -1) {
            /#
                assertex(!ent_flag_exist(message), "Tried to getstruct before the structs were init" + message + "<unknown string>");
            #/
        }
    #/
    self.ent_flag[message] = 0;
    /#
        self.ent_flags_lock[message] = 0;
    #/
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10d76
// Size: 0x2d
function ent_flag_exist(message) {
    if (isdefined(self.ent_flag) && isdefined(self.ent_flag[message])) {
        return 1;
    }
    return 0;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10dab
// Size: 0x25
function ent_flag_set_delayed(message, delay) {
    self endon("death");
    wait(delay);
    ent_flag_set(message);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10dd7
// Size: 0x81
function ent_flag_set(message) {
    /#
        assertex(isdefined(self), "Attempt to set a flag on entity that is not defined");
    #/
    /#
        assertex(isdefined(message), "Tried to check flag but the flag was not defined.");
    #/
    if (!ent_flag_exist(message)) {
        ent_flag_init(message);
    }
    /#
        /#
            assert(self.ent_flag[message] == self.ent_flags_lock[message]);
        #/
        self.ent_flags_lock[message] = 1;
    #/
    self.ent_flag[message] = 1;
    self notify(message);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e5f
// Size: 0xa2
function ent_flag_clear(message, remove) {
    /#
        /#
            assertex(isdefined(self), "<unknown string>");
        #/
        if (ent_flag_exist(message)) {
            /#
                assert(self.ent_flag[message] == self.ent_flags_lock[message]);
            #/
        }
        self.ent_flags_lock[message] = 0;
    #/
    if (ent_flag(message)) {
        self.ent_flag[message] = 0;
        self notify(message);
    }
    if (ent_flag_exist(message) && istrue(remove)) {
        self.ent_flag[message] = undefined;
        /#
            self.ent_flags_lock[message] = undefined;
        #/
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f08
// Size: 0x23
function ent_flag_clear_delayed(message, delay) {
    wait(delay);
    if (isdefined(self)) {
        ent_flag_clear(message);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f32
// Size: 0x32
function ent_flag(message) {
    /#
        assertex(isdefined(message), "Tried to check flag but the flag was not defined.");
    #/
    return ent_flag_exist(message) && self.ent_flag[message];
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f6c
// Size: 0x71
function get_linked_structs() {
    array = [];
    if (isdefined(self.script_linkto)) {
        var_b11f91c17feeab8f = get_links();
        for (i = 0; i < var_b11f91c17feeab8f.size; i++) {
            structs = getstructarray(var_b11f91c17feeab8f[i], "script_linkname");
            if (structs.size > 0) {
                array = array_combine(array, structs);
            }
        }
    }
    return array;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10fe5
// Size: 0x72
function ispointinsidecircle(point, circlecenter, circleradius) {
    /#
        assert(isvector(point));
    #/
    /#
        assert(isvector(circlecenter));
    #/
    /#
        assert(isnumber(circleradius));
    #/
    if (squared(point[0] - circlecenter[0]) + squared(point[1] - circlecenter[1]) <= squared(circleradius)) {
        return 1;
    }
    return 0;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1105f
// Size: 0x54
function requestgamerprofile(var_d40db77fec61d6a4) {
    level endon("game_ended");
    self endon("disconnect");
    self sendrequestgamerprofilecmd(var_d40db77fec61d6a4);
    while (1) {
        value = channel = self waittill("luinotifyserver");
        if (channel == "gamerprofile_request") {
            return value;
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x110ba
// Size: 0x45
function ismountconfigenabled() {
    var_6c9fe414d3f3d966 = 1;
    var_cba848f4746412e0 = 0;
    if (is_player_gamepad_enabled()) {
        var_cba848f4746412e0 = requestgamerprofile("mountButtonConfig");
    } else {
        var_cba848f4746412e0 = requestgamerprofile("mountButtonConfigKBM");
    }
    return var_cba848f4746412e0 != var_6c9fe414d3f3d966;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11107
// Size: 0x45
function function_4319aef954ddbee5() {
    var_f9ac1524e38018a2 = 1;
    toggletacticaladsconfig = 0;
    if (is_player_gamepad_enabled()) {
        toggletacticaladsconfig = requestgamerprofile("toggleTacticalADSConfig");
    } else {
        toggletacticaladsconfig = requestgamerprofile("toggleTacticalADSConfigKBM");
    }
    return toggletacticaladsconfig != var_f9ac1524e38018a2;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11154
// Size: 0x53
function function_9ec2f480552af944(player) {
    if (!isdefined(player)) {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
        return 0;
    }
    if (player usinggamepad()) {
        var_43c445e16f561dce = player getcurrentusereloadconfig();
        return (var_43c445e16f561dce == 0 || var_43c445e16f561dce == 3);
    }
    return player getuseholdkbmprofile() == 1;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x111af
// Size: 0x21
function getintorzero(value) {
    if (isnumber(value)) {
        return int(value);
    } else {
        return 0;
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x111d7
// Size: 0x60
function stringtovec3(input) {
    output = (0, 0, 0);
    values = strtok(input, " ");
    if (values.size == 3) {
        output = (float(values[0]), float(values[1]), float(values[2]));
    }
    return output;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1123f
// Size: 0x52
function function_79c374ab1ca30cc9(capacity) {
    queue = spawnstruct();
    queue.capacity = capacity;
    queue.array = [];
    queue.front = 0;
    queue.rear = -1;
    return queue;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11299
// Size: 0xaf
function function_6cf786a6cf335cb9(queue, object) {
    if (queue.array.size == queue.capacity) {
        /#
            assertex(0, "Trying to add to a queue that is at max capacity");
        #/
        return queue;
    }
    if (queue.array.size != queue.capacity && queue.rear + 1 >= queue.capacity) {
        queue.rear = 0;
    } else {
        queue.rear++;
    }
    queue.array[queue.rear] = object;
    return queue;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11350
// Size: 0xbd
function function_93def91a50927481(queue) {
    if (queue.array.size == 0) {
        /#
            assertex(0, "Trying to remove from a queue that has no objects");
        #/
        return queue;
    }
    queue.array[queue.front] = undefined;
    if (queue.array.size > 0 && queue.front + 1 >= queue.capacity) {
        queue.front = 0;
    } else {
        queue.front++;
    }
    if (queue.array.size == 0) {
        queue.front = 0;
        queue.rear = -1;
    }
    return queue;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11415
// Size: 0x45
function function_73d8a9394fc5eda2(queue) {
    if (queue.array.size == 0) {
        /#
            assertex(0, "Trying to peek at a queue that has no objects");
        #/
        return undefined;
    }
    return queue.array[queue.front];
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11462
// Size: 0x18
function function_cefb274da21a8368(queue) {
    return queue.array.size;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11482
// Size: 0x40
function function_40158914705d536e(queue) {
    queue.array = [];
    queue.front = 0;
    queue.rear = -1;
    return queue.array.size;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x114ca
// Size: 0x1a
function function_45fad871d0bee0f2(queue) {
    return queue.array.size == 0;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x114ec
// Size: 0xa1
function function_a6025442a4e1c649(queue, object) {
    if (!isdefined(queue) || !isdefined(object)) {
        return 0;
    }
    var_bfdc386f35fb8e5a = 0;
    i = queue.front;
    while (var_bfdc386f35fb8e5a < queue.array.size) {
        if (!isdefined(queue.array[i])) {
            goto LOC_00000098;
        }
        if (queue.array[i] == object) {
            return 1;
        }
        if (i + 1 >= queue.capacity) {
            i = 0;
        } else {
            i++;
        LOC_00000098:
        }
    LOC_00000098:
        var_bfdc386f35fb8e5a++;
    }
    return 0;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11595
// Size: 0x13
function function_c89ed1840c8d0f0f(milliseconds) {
    return milliseconds * 0.001;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x115b0
// Size: 0x13
function function_a5b14435e3229bed(seconds) {
    return seconds * 1000;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x115cb
// Size: 0x28
function single_thread_argarray(entity, func, a_vars) {
    single_thread(entity, func, undefined, undefined, a_vars);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x115fa
// Size: 0x30
function function_8a68123e2bbb5ba4(entity, func, arg1, a_vars) {
    single_thread(entity, func, arg1, undefined, a_vars);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x11631
// Size: 0x38
function function_8a68133e2bbb5dd7(entity, func, arg1, arg2, a_vars) {
    single_thread(entity, func, arg1, arg2, a_vars);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11670
// Size: 0x4b4
function private single_thread(entity, func, arg1, arg2, a_vars) {
    a_vars = function_d13634fdb31beeaf(a_vars);
    /#
        assert(isfunction(func));
    #/
    if (!isfunction(func)) {
        return;
    }
    if (isdefined(arg2)) {
        switch (a_vars.size) {
        case 8:
            entity thread [[ func ]](arg1, arg2, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6], a_vars[7]);
            break;
        case 7:
            entity thread [[ func ]](arg1, arg2, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6]);
            break;
        case 6:
            entity thread [[ func ]](arg1, arg2, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5]);
            break;
        case 5:
            entity thread [[ func ]](arg1, arg2, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4]);
            break;
        case 4:
            entity thread [[ func ]](arg1, arg2, a_vars[0], a_vars[1], a_vars[2], a_vars[3]);
            break;
        case 3:
            entity thread [[ func ]](arg1, arg2, a_vars[0], a_vars[1], a_vars[2]);
            break;
        case 2:
            entity thread [[ func ]](arg1, arg2, a_vars[0], a_vars[1]);
            break;
        case 1:
            entity thread [[ func ]](arg1, arg2, a_vars[0]);
            break;
        case 0:
            entity thread [[ func ]](arg1, arg2);
            break;
        default:
            /#
                assertmsg("Too many args.");
            #/
            break;
        }
    } else if (isdefined(arg1)) {
        switch (a_vars.size) {
        case 8:
            entity thread [[ func ]](arg1, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6], a_vars[7]);
            break;
        case 7:
            entity thread [[ func ]](arg1, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6]);
            break;
        case 6:
            entity thread [[ func ]](arg1, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5]);
            break;
        case 5:
            entity thread [[ func ]](arg1, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4]);
            break;
        case 4:
            entity thread [[ func ]](arg1, a_vars[0], a_vars[1], a_vars[2], a_vars[3]);
            break;
        case 3:
            entity thread [[ func ]](arg1, a_vars[0], a_vars[1], a_vars[2]);
            break;
        case 2:
            entity thread [[ func ]](arg1, a_vars[0], a_vars[1]);
            break;
        case 1:
            entity thread [[ func ]](arg1, a_vars[0]);
            break;
        case 0:
            entity thread [[ func ]](arg1);
            break;
        default:
            /#
                assertmsg("Too many args.");
            #/
            break;
        }
    } else {
        switch (a_vars.size) {
        case 8:
            entity thread [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6], a_vars[7]);
            break;
        case 7:
            entity thread [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6]);
            break;
        case 6:
            entity thread [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5]);
            break;
        case 5:
            entity thread [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4]);
            break;
        case 4:
            entity thread [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3]);
            break;
        case 3:
            entity thread [[ func ]](a_vars[0], a_vars[1], a_vars[2]);
            break;
        case 2:
            entity thread [[ func ]](a_vars[0], a_vars[1]);
            break;
        case 1:
            entity thread [[ func ]](a_vars[0]);
            break;
        case 0:
            entity thread [[ func ]]();
            break;
        default:
            /#
                assertmsg("Too many args.");
            #/
            break;
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b2b
// Size: 0x25
function single_func_argarray(entity, func, a_vars) {
    return function_a057e1f7cf74f00(entity, func, a_vars);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11b58
// Size: 0x279
function private function_a057e1f7cf74f00(entity, func, a_vars) {
    a_vars = function_d13634fdb31beeaf(a_vars);
    switch (a_vars.size) {
    case 8:
        if (isdefined(entity)) {
            return entity [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6], a_vars[7]);
        } else {
            return [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6], a_vars[7]);
        }
        break;
    case 7:
        if (isdefined(entity)) {
            return entity [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6]);
        } else {
            return [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6]);
        }
        break;
    case 6:
        if (isdefined(entity)) {
            return entity [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5]);
        } else {
            return [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5]);
        }
        break;
    case 5:
        if (isdefined(entity)) {
            return entity [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4]);
        } else {
            return [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4]);
        }
        break;
    case 4:
        if (isdefined(entity)) {
            return entity [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3]);
        } else {
            return [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3]);
        }
        break;
    case 3:
        if (isdefined(entity)) {
            return entity [[ func ]](a_vars[0], a_vars[1], a_vars[2]);
        } else {
            return [[ func ]](a_vars[0], a_vars[1], a_vars[2]);
        }
        break;
    case 2:
        if (isdefined(entity)) {
            return entity [[ func ]](a_vars[0], a_vars[1]);
        } else {
            return [[ func ]](a_vars[0], a_vars[1]);
        }
        break;
    case 1:
        if (isdefined(entity)) {
            return entity [[ func ]](a_vars[0]);
        } else {
            return [[ func ]](a_vars[0]);
        }
        break;
    case 0:
        if (isdefined(entity)) {
            return entity [[ func ]]();
        } else {
            return [[ func ]]();
        }
        break;
    default:
        /#
            assertmsg("Too many args.");
        #/
        break;
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11dd8
// Size: 0x71
function private function_d13634fdb31beeaf(a_vars) {
    var_d9d0128c23712f95 = -1;
    for (i = a_vars.size - 1; i >= 0; i--) {
        if (!isdefined(a_vars[i])) {
            var_d9d0128c23712f95 = i;
        } else {
            break;
        }
    }
    if (var_d9d0128c23712f95 == -1) {
        return a_vars;
    }
    var_4c1b085372d0c223 = [];
    for (i = 0; i < var_d9d0128c23712f95; i++) {
        var_4c1b085372d0c223[i] = a_vars[i];
    }
    return var_4c1b085372d0c223;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11e51
// Size: 0x40
function function_8ddfb5266dae13f5(vector) {
    return "(" + int(vector[0]) + " " + int(vector[1]) + " " + int(vector[2]) + ")";
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11e99
// Size: 0x1c
function function_1874cb875be9f1d1(var_7c649ec071ebcc7c) {
    if (var_7c649ec071ebcc7c >= 0) {
        return var_7c649ec071ebcc7c;
    } else {
        return (-1 * var_7c649ec071ebcc7c);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ebc
// Size: 0xfa
function function_21a6a1c613b50a28(array, var_80f993e06b4347cb) {
    /#
        assert(isdefined(array), "create_partition: Passed an undefined array");
    #/
    /#
        assert(isarray(array), "create_partition: Passed something defined that wasn't an array");
    #/
    /#
        assert(isdefined(var_80f993e06b4347cb), "create_partition: Passed an undefined cell_size");
    #/
    /#
        assert(isfloat(var_80f993e06b4347cb) || isint(var_80f993e06b4347cb), "create_partition: Passed a defined cell_size that wasn't an int or float");
    #/
    partition = spawnstruct();
    partition.array = [];
    partition.var_80f993e06b4347cb = var_80f993e06b4347cb;
    partition.var_8a659781684b3b1b = int(150000 / 2 * var_80f993e06b4347cb);
    foreach (object in array) {
        partition function_24bbefb4beda630d(object);
    }
    return partition;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11fbe
// Size: 0x2f
function function_a291b92e71292628() {
    return isdefined(self) && isdefined(self.array) && isdefined(self.var_80f993e06b4347cb) && isdefined(self.var_8a659781684b3b1b);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ff5
// Size: 0xf7
function function_24bbefb4beda630d(object) {
    /#
        assert(function_a291b92e71292628(), "add_to_partition: self wasn't a partition, is self a partition created by create_partition?");
    #/
    /#
        assert(isdefined(object), "add_to_partition: Passed an undefined object");
    #/
    /#
        assert(isdefined(object.origin), "add_to_partition: Passed an object with an undefined .origin");
    #/
    var_c00ae927b449527a = function_5b83b054e7f1c193(object.origin);
    y = var_c00ae927b449527a[1];
    x = var_c00ae927b449527a[0];
    var_56c8714742ff3c04 = self.array[x];
    if (!isdefined(var_56c8714742ff3c04)) {
        self.array[x] = [];
        var_56c8714742ff3c04 = [];
    }
    var_dd613b6808c13588 = var_56c8714742ff3c04[y];
    if (!isdefined(var_dd613b6808c13588)) {
        self.array[x][y] = [];
        var_f9ce76ad7118b7ec = 0;
    } else {
        var_f9ce76ad7118b7ec = var_dd613b6808c13588.size;
    }
    self.array[x][y][var_f9ce76ad7118b7ec] = object;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x120f3
// Size: 0xb8
function function_5b83b054e7f1c193(vector) {
    /#
        assert(function_a291b92e71292628(), "get_partition_cell_coordinates: self wasn't a partition, is self a partition created by create_partition?");
    #/
    /#
        assert(isdefined(vector), "get_partition_cell_coordinates: Passed an undefined vector");
    #/
    /#
        assert(isvector(vector), "get_partition_cell_coordinates: Passed something defined that wasn't a vector");
    #/
    var_80f993e06b4347cb = self.var_80f993e06b4347cb;
    var_8a659781684b3b1b = self.var_8a659781684b3b1b;
    x = int(vector[0] / var_80f993e06b4347cb) + var_8a659781684b3b1b;
    if (x < 0) {
        x = 0;
    }
    y = int(vector[1] / var_80f993e06b4347cb) + var_8a659781684b3b1b;
    if (y < 0) {
        y = 0;
    }
    return [0:x, 1:y];
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121b3
// Size: 0xfb
function function_9cd3f5f067afea37(object) {
    /#
        assert(function_a291b92e71292628(), "remove_from_partition: self wasn't a partition, is self a partition created by create_partition?");
    #/
    /#
        assert(isdefined(object), "remove_from_partition: Passed an undefined object");
    #/
    /#
        assert(isdefined(object.origin), "remove_from_partition: Passed an object with an undefined .origin");
    #/
    var_c00ae427b449477b = function_5b83b054e7f1c193(object.origin);
    y = var_c00ae427b449477b[1];
    x = var_c00ae427b449477b[0];
    var_56c8714742ff3c04 = self.array[x];
    if (isdefined(var_56c8714742ff3c04) && isdefined(var_56c8714742ff3c04[y])) {
        self.array[x][y] = array_remove(var_56c8714742ff3c04[y], object);
        if (self.array[x][y].size == 0) {
            self.array[x][y] = undefined;
            if (self.array[x].size == 0) {
                self.array[x] = undefined;
            }
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x122b5
// Size: 0xa5
function function_99b7cb4906b8cb4f(vector) {
    /#
        assert(function_a291b92e71292628(), "get_array_from_partition: self wasn't a partition, is self a partition created by create_partition?");
    #/
    /#
        assert(isdefined(vector), "get_array_from_partition: Passed an undefined vector.");
    #/
    /#
        assert(isvector(vector), "get_array_from_partition: Passed something defined that wasn't a vector");
    #/
    var_c00ae327b4494548 = function_5b83b054e7f1c193(vector);
    y = var_c00ae327b4494548[1];
    x = var_c00ae327b4494548[0];
    var_56c8714742ff3c04 = self.array[x];
    if (isdefined(var_56c8714742ff3c04)) {
        var_dd613b6808c13588 = var_56c8714742ff3c04[y];
        if (isdefined(var_dd613b6808c13588)) {
            return var_dd613b6808c13588;
        }
    }
    return [];
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12362
// Size: 0x124
function function_df633f460888a47(vector) {
    /#
        assert(function_a291b92e71292628(), "get_adjacent_arrays_from_partition: self wasn't a partition, is self a partition created by create_partition?");
    #/
    /#
        assert(isdefined(vector), "get_adjacent_arrays_from_partition: passed an undefined vector");
    #/
    /#
        assert(isvector(vector), "get_adjacent_arrays_from_partition: Passed something defined that wasn't a vector");
    #/
    var_c00ae627b4494be1 = function_5b83b054e7f1c193(vector);
    y = var_c00ae627b4494be1[1];
    x = var_c00ae627b4494be1[0];
    var_1ce68048507d396 = [];
    for (x_offset = -1; x_offset <= 1; x_offset++) {
        var_873ac0ebf49bfa38 = x + x_offset;
        if (var_873ac0ebf49bfa38 < 0) {
            continue;
        }
        var_56c8714742ff3c04 = self.array[var_873ac0ebf49bfa38];
        if (!isdefined(var_56c8714742ff3c04)) {
            continue;
        }
        for (y_offset = -1; y_offset <= 1; y_offset++) {
            var_476c8c292af62045 = y + y_offset;
            if (var_476c8c292af62045 < 0) {
                continue;
            }
            var_dd613b6808c13588 = var_56c8714742ff3c04[var_476c8c292af62045];
            if (!isdefined(var_dd613b6808c13588)) {
                continue;
            }
            var_1ce68048507d396[var_1ce68048507d396.size] = var_dd613b6808c13588;
        }
    }
    return var_1ce68048507d396;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1248e
// Size: 0x1c0
function function_60dbe20f8385f1b0(vector) {
    /#
        assert(function_a291b92e71292628(), "get_closest_object_in_adjacent_partitions: self wasn't a partition, is self a partition created by create_partition?");
    #/
    /#
        assert(isdefined(vector), "get_closest_object_in_adjacent_partitions: passed an undefined vector");
    #/
    /#
        assert(isvector(vector), "get_closest_object_in_adjacent_partitions: Passed something defined that wasn't a vector");
    #/
    var_c00ae527b44949ae = function_5b83b054e7f1c193(vector);
    y = var_c00ae527b44949ae[1];
    x = var_c00ae527b44949ae[0];
    var_81ee2ed4300c1692 = undefined;
    var_84d7de0b98e2e704 = undefined;
    for (x_offset = -1; x_offset <= 1; x_offset++) {
        var_873ac0ebf49bfa38 = x + x_offset;
        if (var_873ac0ebf49bfa38 < 0) {
            continue;
        }
        var_56c8714742ff3c04 = self.array[var_873ac0ebf49bfa38];
        if (!isdefined(var_56c8714742ff3c04)) {
            continue;
        }
        for (y_offset = -1; y_offset <= 1; y_offset++) {
            var_476c8c292af62045 = y + y_offset;
            if (var_476c8c292af62045 < 0) {
                continue;
            }
            var_dd613b6808c13588 = var_56c8714742ff3c04[var_476c8c292af62045];
            if (!isdefined(var_dd613b6808c13588)) {
                continue;
            }
            foreach (object in var_dd613b6808c13588) {
                if (!isdefined(object) || !isdefined(object.origin)) {
                    continue;
                }
                distance_squared = distancesquared(object.origin, vector);
                if (!isdefined(var_84d7de0b98e2e704) || distance_squared < var_84d7de0b98e2e704) {
                    var_84d7de0b98e2e704 = distance_squared;
                    var_81ee2ed4300c1692 = object;
                }
            }
        }
    }
    return var_81ee2ed4300c1692;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12656
// Size: 0x7e
function registersharedfunc(category, funcname, function, var_8cbe7b0cba7b8a26) {
    if (!isdefined(level.sharedfuncs)) {
        level.sharedfuncs = [];
    }
    if (!isdefined(level.sharedfuncs[category])) {
        level.sharedfuncs[category] = [];
    }
    if (isdefined(level.sharedfuncs[category][funcname]) && istrue(var_8cbe7b0cba7b8a26)) {
        return;
    }
    level.sharedfuncs[category][funcname] = function;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x126db
// Size: 0x3f
function function_7ae9075c73180af7(category) {
    if (!isdefined(level.sharedfuncs)) {
        level.sharedfuncs = [];
    }
    if (!isdefined(level.sharedfuncs[category])) {
        level.sharedfuncs[category] = [];
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12721
// Size: 0x75
function issharedfuncdefined(category, funcname, var_74e2cb47254bc22c) {
    if (!isdefined(level.sharedfuncs)) {
        return 0;
    }
    if (!isdefined(level.sharedfuncs[category])) {
        return 0;
    }
    func = getsharedfunc(category, funcname);
    if (!isdefined(func)) {
        if (istrue(var_74e2cb47254bc22c)) {
            /#
                assertmsg(category + ", " + funcname + " required function not defined.");
            #/
        }
        return 0;
    }
    return 1;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1279e
// Size: 0x32
function function_6a11999c562cf4ab(category, funcname) {
    if (!isdefined(level.sharedfuncs[category])) {
        return undefined;
    }
    return level.sharedfuncs[category][funcname];
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x127d8
// Size: 0x21
function getsharedfunc(category, funcname) {
    return level.sharedfuncs[category][funcname];
}

// Namespace utility/namespace_3c37cb17ade254d
// Params d, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12801
// Size: 0x87
function function_f3bb4f4911a1beb2(category, funcname, param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807, var_5a6a89fa118825d4) {
    return function_f6734d8246596c7f(category, funcname, 0, param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807, var_5a6a89fa118825d4);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 13, eflags: 0x0
// Checksum 0x0, Offset: 0x12890
// Size: 0x88
function function_6d1f056f62ed082a(category, funcname, param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807, var_5a6a89fa118825d4) {
    return function_f6734d8246596c7f(category, funcname, 1, param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807, var_5a6a89fa118825d4);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 14, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12920
// Size: 0xb7
function private function_f6734d8246596c7f(category, funcname, required, param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807, var_5a6a89fa118825d4) {
    if (issharedfuncdefined(category, funcname, required)) {
        func = level.sharedfuncs[category][funcname];
        return function_a97bcc1cab7d91ee(func, param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807, var_5a6a89fa118825d4);
    }
    return 0;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x129df
// Size: 0x43
function private function_38d3c10d2527cb3a(func) {
    if (isfunction(func)) {
        return self [[ func ]]();
    } else if (isbuiltinfunction(func)) {
        return builtin [[ func ]]();
    } else {
        /#
            assert(isbuiltinmethod(func));
        #/
        return self builtin [[ func ]]();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12a29
// Size: 0x4e
function private function_38d3c20d2527cd6d(func, param1) {
    if (isfunction(func)) {
        return self [[ func ]](param1);
    } else if (isbuiltinfunction(func)) {
        return builtin [[ func ]](param1);
    } else {
        /#
            assert(isbuiltinmethod(func));
        #/
        return self builtin [[ func ]](param1);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12a7e
// Size: 0x59
function private function_38d3bf0d2527c6d4(func, param1, param2) {
    if (isfunction(func)) {
        return self [[ func ]](param1, param2);
    } else if (isbuiltinfunction(func)) {
        return builtin [[ func ]](param1, param2);
    } else {
        /#
            assert(isbuiltinmethod(func));
        #/
        return self builtin [[ func ]](param1, param2);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12ade
// Size: 0x64
function private function_38d3c00d2527c907(func, param1, param2, param3) {
    if (isfunction(func)) {
        return self [[ func ]](param1, param2, param3);
    } else if (isbuiltinfunction(func)) {
        return builtin [[ func ]](param1, param2, param3);
    } else {
        /#
            assert(isbuiltinmethod(func));
        #/
        return self builtin [[ func ]](param1, param2, param3);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12b49
// Size: 0x6f
function private function_38d3bd0d2527c26e(func, param1, param2, param3, param4) {
    if (isfunction(func)) {
        return self [[ func ]](param1, param2, param3, param4);
    } else if (isbuiltinfunction(func)) {
        return builtin [[ func ]](param1, param2, param3, param4);
    } else {
        /#
            assert(isbuiltinmethod(func));
        #/
        return self builtin [[ func ]](param1, param2, param3, param4);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12bbf
// Size: 0x7a
function private function_38d3be0d2527c4a1(func, param1, param2, param3, param4, param5) {
    if (isfunction(func)) {
        return self [[ func ]](param1, param2, param3, param4, param5);
    } else if (isbuiltinfunction(func)) {
        return builtin [[ func ]](param1, param2, param3, param4, param5);
    } else {
        /#
            assert(isbuiltinmethod(func));
        #/
        return self builtin [[ func ]](param1, param2, param3, param4, param5);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 7, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12c40
// Size: 0x8b
function private function_38d3bb0d2527be08(func, param1, param2, param3, param4, param5, param6) {
    if (isfunction(func)) {
        return self [[ func ]](param1, param2, param3, param4, param5, param6);
    } else if (isbuiltinfunction(func)) {
        return builtin [[ func ]](param1, param2, param3, param4, param5, param6);
    } else {
        /#
            assert(isbuiltinmethod(func));
        #/
        return self builtin [[ func ]](param1, param2, param3, param4, param5, param6);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 8, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12cd2
// Size: 0x99
function private function_38d3bc0d2527c03b(func, param1, param2, param3, param4, param5, param6, param7) {
    if (isfunction(func)) {
        return self [[ func ]](param1, param2, param3, param4, param5, param6, param7);
    } else if (isbuiltinfunction(func)) {
        return builtin [[ func ]](param1, param2, param3, param4, param5, param6, param7);
    } else {
        /#
            assert(isbuiltinmethod(func));
        #/
        return self builtin [[ func ]](param1, param2, param3, param4, param5, param6, param7);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 9, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12d72
// Size: 0xa7
function private function_38d3b90d2527b9a2(func, param1, param2, param3, param4, param5, param6, param7, param8) {
    if (isfunction(func)) {
        return self [[ func ]](param1, param2, param3, param4, param5, param6, param7, param8);
    } else if (isbuiltinfunction(func)) {
        return builtin [[ func ]](param1, param2, param3, param4, param5, param6, param7, param8);
    } else {
        /#
            assert(isbuiltinmethod(func));
        #/
        return self builtin [[ func ]](param1, param2, param3, param4, param5, param6, param7, param8);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 10, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12e20
// Size: 0xb5
function private function_38d3ba0d2527bbd5(func, param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555) {
    if (isfunction(func)) {
        return self [[ func ]](param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555);
    } else if (isbuiltinfunction(func)) {
        return builtin [[ func ]](param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555);
    } else {
        /#
            assert(isbuiltinmethod(func));
        #/
        return self builtin [[ func ]](param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 11, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12edc
// Size: 0xc3
function private function_21811fe8b688a387(func, param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807) {
    if (isfunction(func)) {
        return self [[ func ]](param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807);
    } else if (isbuiltinfunction(func)) {
        return builtin [[ func ]](param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807);
    } else {
        /#
            assert(isbuiltinmethod(func));
        #/
        return self builtin [[ func ]](param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 12, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12fa6
// Size: 0xd1
function private function_21811ee8b688a154(func, param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807, var_5a6a89fa118825d4) {
    if (isfunction(func)) {
        return self [[ func ]](param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807, var_5a6a89fa118825d4);
    } else if (isbuiltinfunction(func)) {
        return builtin [[ func ]](param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807, var_5a6a89fa118825d4);
    } else {
        /#
            assert(isbuiltinmethod(func));
        #/
        return self builtin [[ func ]](param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807, var_5a6a89fa118825d4);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 12, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1307e
// Size: 0x19d
function private function_a97bcc1cab7d91ee(func, param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807, var_5a6a89fa118825d4) {
    if (isdefined(var_5a6a89fa118825d4)) {
        return function_21811ee8b688a154(func, param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807, var_5a6a89fa118825d4);
    } else if (isdefined(var_5a6a8afa11882807)) {
        return function_21811fe8b688a387(func, param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807);
    } else if (isdefined(var_f3cb1651d632a555)) {
        return function_38d3ba0d2527bbd5(func, param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555);
    } else if (isdefined(param8)) {
        return function_38d3b90d2527b9a2(func, param1, param2, param3, param4, param5, param6, param7, param8);
    } else if (isdefined(param7)) {
        return function_38d3bc0d2527c03b(func, param1, param2, param3, param4, param5, param6, param7);
    } else if (isdefined(param6)) {
        return function_38d3bb0d2527be08(func, param1, param2, param3, param4, param5, param6);
    } else if (isdefined(param5)) {
        return function_38d3be0d2527c4a1(func, param1, param2, param3, param4, param5);
    } else if (isdefined(param4)) {
        return function_38d3bd0d2527c26e(func, param1, param2, param3, param4);
    } else if (isdefined(param3)) {
        return function_38d3c00d2527c907(func, param1, param2, param3);
    } else if (isdefined(param2)) {
        return function_38d3bf0d2527c6d4(func, param1, param2);
    } else if (isdefined(param1)) {
        return function_38d3c20d2527cd6d(func, param1);
    } else {
        return function_38d3c10d2527cb3a(func);
    }
    return 0;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 14, eflags: 0x0
// Checksum 0x0, Offset: 0x13223
// Size: 0x91
function function_a655374a990831d8(ent1, string1, ent2, string2, ent3, string3, ent4, string4, ent5, string5, ent6, string6, ent7, string7) {
    return function_ac1863f0deb8a63e(undefined, ent1, string1, ent2, string2, ent3, string3, ent4, string4, ent5, string5, ent6, string6, ent7, string7);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 15, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x132bc
// Size: 0x24c
function function_ac1863f0deb8a63e(timeout, ent1, string1, ent2, string2, ent3, string3, ent4, string4, ent5, string5, ent6, string6, ent7, string7) {
    /#
        assert(!isdefined(timeout) || timeout > 0);
    #/
    /#
        assert(isdefined(ent1));
    #/
    /#
        assert(isdefined(string1));
    #/
    self endon("death");
    context = spawnstruct();
    context.var_a83666b52ab41e0d = 0;
    context.var_9166fb2e27ecb4b1 = isdefined(ent1) && isdefined(string1) && string1 == "death" || isdefined(ent2) && isdefined(string2) && string2 == "death" || isdefined(ent3) && isdefined(string3) && string3 == "death" || isdefined(ent4) && isdefined(string4) && string4 == "death" || isdefined(ent5) && isdefined(string5) && string5 == "death" || isdefined(ent6) && isdefined(string6) && string6 == "death" || isdefined(ent7) && isdefined(string7) && string7 == "death";
    function_24b0694682c6934a(ent1, string1, context);
    if (isdefined(ent2) && isdefined(string2)) {
        function_24b0694682c6934a(ent2, string2, context);
    }
    if (isdefined(ent3) && isdefined(string3)) {
        function_24b0694682c6934a(ent3, string3, context);
    }
    if (isdefined(ent4) && isdefined(string4)) {
        function_24b0694682c6934a(ent4, string4, context);
    }
    if (isdefined(ent5) && isdefined(string5)) {
        function_24b0694682c6934a(ent5, string5, context);
    }
    if (isdefined(ent6) && isdefined(string6)) {
        function_24b0694682c6934a(ent6, string6, context);
    }
    if (isdefined(ent7) && isdefined(string7)) {
        function_24b0694682c6934a(ent7, string7, context);
    }
    if (isdefined(timeout)) {
        context childthread function_2c91b6c857aa73cc(timeout);
    }
    msg = context waittill("returned");
    context notify("die");
    return msg;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13510
// Size: 0x4b
function function_24b0694682c6934a(entity, message, context) {
    entity childthread waittill_string(message, context);
    if (!context.var_9166fb2e27ecb4b1) {
        context.var_a83666b52ab41e0d++;
        childthread function_54258b3847b3bbca(entity, context);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13562
// Size: 0x48
function function_54258b3847b3bbca(entity, context) {
    context endon("die");
    entity waittill("death");
    context.var_a83666b52ab41e0d--;
    if (context.var_a83666b52ab41e0d == 0) {
        context notify("returned", undefined);
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x135b1
// Size: 0x18e
function function_28551e899093b138(string1, string2, string3, string4, string5, string6, string7, var_e785cae7be33f7c) {
    if ((!isdefined(string1) || string1 != "death") && (!isdefined(string2) || string2 != "death") && (!isdefined(string3) || string3 != "death") && (!isdefined(string4) || string4 != "death") && (!isdefined(string5) || string5 != "death") && (!isdefined(string6) || string6 != "death") && (!isdefined(string7) || string7 != "death") && (!isdefined(var_e785cae7be33f7c) || var_e785cae7be33f7c != "death")) {
        self endon("death");
    }
    struct = spawnstruct();
    if (isdefined(string1)) {
        childthread function_acb8d1f52b2223cb(string1, struct);
    }
    if (isdefined(string2)) {
        childthread function_acb8d1f52b2223cb(string2, struct);
    }
    if (isdefined(string3)) {
        childthread function_acb8d1f52b2223cb(string3, struct);
    }
    if (isdefined(string4)) {
        childthread function_acb8d1f52b2223cb(string4, struct);
    }
    if (isdefined(string5)) {
        childthread function_acb8d1f52b2223cb(string5, struct);
    }
    if (isdefined(string6)) {
        childthread function_acb8d1f52b2223cb(string6, struct);
    }
    if (isdefined(string7)) {
        childthread function_acb8d1f52b2223cb(string7, struct);
    }
    if (isdefined(var_e785cae7be33f7c)) {
        childthread function_acb8d1f52b2223cb(var_e785cae7be33f7c, struct);
    }
    var_6107f68e13e0fc23 = struct waittill("returned");
    struct notify("struct_delete");
    return var_6107f68e13e0fc23;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x13747
// Size: 0x1d0
function function_b90de82e759099dc(timeout, string1, string2, string3, string4, string5, string6, string7, var_e785cae7be33f7c) {
    /#
        if (!isdefined(timeout) || !isnumber(timeout)) {
            /#
                assertmsg("<unknown string>");
            #/
        }
    #/
    if ((!isdefined(string1) || string1 != "death") && (!isdefined(string2) || string2 != "death") && (!isdefined(string3) || string3 != "death") && (!isdefined(string4) || string4 != "death") && (!isdefined(string5) || string5 != "death") && (!isdefined(string6) || string6 != "death") && (!isdefined(string7) || string7 != "death") && (!isdefined(var_e785cae7be33f7c) || var_e785cae7be33f7c != "death")) {
        self endon("death");
    }
    struct = spawnstruct();
    if (isdefined(string1)) {
        childthread function_acb8d1f52b2223cb(string1, struct);
    }
    if (isdefined(string2)) {
        childthread function_acb8d1f52b2223cb(string2, struct);
    }
    if (isdefined(string3)) {
        childthread function_acb8d1f52b2223cb(string3, struct);
    }
    if (isdefined(string4)) {
        childthread function_acb8d1f52b2223cb(string4, struct);
    }
    if (isdefined(string5)) {
        childthread function_acb8d1f52b2223cb(string5, struct);
    }
    if (isdefined(string6)) {
        childthread function_acb8d1f52b2223cb(string6, struct);
    }
    if (isdefined(string7)) {
        childthread function_acb8d1f52b2223cb(string7, struct);
    }
    if (isdefined(var_e785cae7be33f7c)) {
        childthread function_acb8d1f52b2223cb(var_e785cae7be33f7c, struct);
    }
    if (timeout > 0) {
        childthread function_cb4bda23f2687c64(struct, "returned", timeout);
    }
    var_6107f68e13e0fc23 = struct waittill("returned");
    struct notify("struct_delete");
    return var_6107f68e13e0fc23;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 16, eflags: 0x0
// Checksum 0x0, Offset: 0x1391f
// Size: 0x2a3
function function_3c010dc06eabfe5f(ent1, string1, ent2, string2, ent3, string3, ent4, string4, ent5, string5, ent6, string6, ent7, string7, var_6848d7559ba217ba, var_e785cae7be33f7c) {
    /#
        params[0] = ent1;
        params[1] = string1;
        params[2] = ent2;
        params[3] = string2;
        params[4] = ent3;
        params[5] = string3;
        params[6] = ent4;
        params[7] = string4;
        params[8] = ent5;
        params[9] = string5;
        params[10] = ent6;
        params[11] = string6;
        params[12] = ent7;
        params[13] = string7;
        params[14] = var_6848d7559ba217ba;
        params[15] = var_e785cae7be33f7c;
        for (i = 0; i < params.size; i++) {
            if (i % 2 == 0 && isdefined(params[i]) && !isent(params[i]) && !isstruct(params[i])) {
                /#
                    assertmsg("<unknown string>" + i + 1 + "<unknown string>" + i / 2 + 1 + "<unknown string>");
                #/
            }
            if (i % 2 == 1 && isdefined(params[i]) && !isstring(params[i])) {
                /#
                    assertmsg("<unknown string>" + i + 1 + "<unknown string>" + (i + 1) / 2 + "<unknown string>");
                #/
            }
        }
    #/
    struct = spawnstruct();
    if (isdefined(ent1) && isdefined(string1)) {
        ent1 childthread function_acb8d1f52b2223cb(string1, struct);
    }
    if (isdefined(ent2) && isdefined(string2)) {
        ent2 childthread function_acb8d1f52b2223cb(string2, struct);
    }
    if (isdefined(ent3) && isdefined(string3)) {
        ent3 childthread function_acb8d1f52b2223cb(string3, struct);
    }
    if (isdefined(ent4) && isdefined(string4)) {
        ent4 childthread function_acb8d1f52b2223cb(string4, struct);
    }
    if (isdefined(ent5) && isdefined(string5)) {
        ent5 childthread function_acb8d1f52b2223cb(string5, struct);
    }
    if (isdefined(ent6) && isdefined(string6)) {
        ent6 childthread function_acb8d1f52b2223cb(string6, struct);
    }
    if (isdefined(ent7) && isdefined(string7)) {
        ent7 childthread function_acb8d1f52b2223cb(string7, struct);
    }
    if (isdefined(var_6848d7559ba217ba) && isdefined(var_e785cae7be33f7c)) {
        var_6848d7559ba217ba childthread function_acb8d1f52b2223cb(var_e785cae7be33f7c, struct);
    }
    var_6107f68e13e0fc23 = struct waittill("returned");
    struct notify("struct_delete");
    return var_6107f68e13e0fc23;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 17, eflags: 0x0
// Checksum 0x0, Offset: 0x13bca
// Size: 0x37a
function function_ebad8f70ed282931(timeout, ent1, string1, ent2, string2, ent3, string3, ent4, string4, ent5, string5, ent6, string6, ent7, string7, var_6848d7559ba217ba, var_e785cae7be33f7c) {
    /#
        params[1] = ent1;
        params[2] = string1;
        params[3] = ent2;
        params[4] = string2;
        params[5] = ent3;
        params[6] = string3;
        params[7] = ent4;
        params[8] = string4;
        params[9] = ent5;
        params[10] = string5;
        params[11] = ent6;
        params[12] = string6;
        params[13] = ent7;
        params[14] = string7;
        params[15] = var_6848d7559ba217ba;
        params[16] = var_e785cae7be33f7c;
        if (!isdefined(timeout) || !isnumber(timeout)) {
            /#
                assertmsg("<unknown string>");
            #/
        }
        for (i = 1; i < params.size; i++) {
            if (i % 2 == 1 && isdefined(params[i]) && !isent(params[i])) {
                /#
                    assertmsg("<unknown string>" + i + 1 + "<unknown string>" + (i + 1) / 2 + "<unknown string>");
                #/
            }
            if (i % 2 == 0 && isdefined(params[i]) && !isstring(params[i])) {
                /#
                    assertmsg("<unknown string>" + i + 1 + "<unknown string>" + i / 2 + "<unknown string>");
                #/
            }
        }
    #/
    struct = spawnstruct();
    if ((!isdefined(string1) || string1 != "death") && (!isdefined(string2) || string2 != "death") && (!isdefined(string3) || string3 != "death") && (!isdefined(string4) || string4 != "death") && (!isdefined(string5) || string5 != "death") && (!isdefined(string6) || string6 != "death") && (!isdefined(string7) || string7 != "death") && (!isdefined(var_e785cae7be33f7c) || var_e785cae7be33f7c != "death")) {
        self endon("death");
    }
    if (isdefined(ent1) && isdefined(string1)) {
        ent1 childthread function_acb8d1f52b2223cb(string1, struct);
    }
    if (isdefined(ent2) && isdefined(string2)) {
        ent2 childthread function_acb8d1f52b2223cb(string2, struct);
    }
    if (isdefined(ent3) && isdefined(string3)) {
        ent3 childthread function_acb8d1f52b2223cb(string3, struct);
    }
    if (isdefined(ent4) && isdefined(string4)) {
        ent4 childthread function_acb8d1f52b2223cb(string4, struct);
    }
    if (isdefined(ent5) && isdefined(string5)) {
        ent5 childthread function_acb8d1f52b2223cb(string5, struct);
    }
    if (isdefined(ent6) && isdefined(string6)) {
        ent6 childthread function_acb8d1f52b2223cb(string6, struct);
    }
    if (isdefined(ent7) && isdefined(string7)) {
        ent7 childthread function_acb8d1f52b2223cb(string7, struct);
    }
    if (isdefined(var_6848d7559ba217ba) && isdefined(var_e785cae7be33f7c)) {
        var_6848d7559ba217ba childthread function_acb8d1f52b2223cb(var_e785cae7be33f7c, struct);
    }
    if (timeout > 0) {
        level childthread function_cb4bda23f2687c64(struct, "returned", timeout);
    }
    var_6107f68e13e0fc23 = struct waittill("returned");
    struct notify("struct_delete");
    return var_6107f68e13e0fc23;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13f4c
// Size: 0x4b
function private function_cb4bda23f2687c64(ent, msg, timeout) {
    self endon(msg);
    wait(timeout);
    results = [];
    results["ent"] = undefined;
    results["message"] = "timeout";
    ent notify("returned", results);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13f9e
// Size: 0x141
function private function_acb8d1f52b2223cb(msg, struct) {
    if (msg != "death") {
        self endon("death");
    }
    struct endon("struct_delete");
    var_4555a151562eb442 = var_77895e5b8a625e1e = var_77895f5b8a626051 = var_7789585b8a6250ec = var_7789595b8a62531f = var_77895a5b8a625552 = parm4 = parm3 = parm2 = parm1 = self waittill(msg);
    result = [];
    if (isdefined(parm1)) {
        result[0] = parm1;
    }
    if (isdefined(parm2)) {
        result[1] = parm2;
    }
    if (isdefined(parm3)) {
        result[2] = parm3;
    }
    if (isdefined(parm4)) {
        result[3] = parm4;
    }
    if (isdefined(var_77895a5b8a625552)) {
        result[4] = var_77895a5b8a625552;
    }
    if (isdefined(var_7789595b8a62531f)) {
        result[5] = var_7789595b8a62531f;
    }
    if (isdefined(var_7789585b8a6250ec)) {
        result[6] = var_7789585b8a6250ec;
    }
    if (isdefined(var_77895f5b8a626051)) {
        result[7] = var_77895f5b8a626051;
    }
    if (isdefined(var_77895e5b8a625e1e)) {
        result[8] = var_77895e5b8a625e1e;
    }
    if (isdefined(var_4555a151562eb442)) {
        result[9] = var_4555a151562eb442;
    }
    result["ent"] = self;
    result["message"] = msg;
    struct notify("returned", result);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x140e6
// Size: 0x7c
function string_to_bool(var_65497a86277d7370) {
    retval = undefined;
    switch (var_65497a86277d7370) {
    case #"hash_31100fbc01bd387c":
    case #"hash_8328fb6e4f43ba45":
        retval = 1;
        break;
    case #"hash_311010bc01bd3a0f":
    case #"hash_a9152f56f0c74738":
        retval = 0;
        break;
    default:
        /#
            assertmsg("Invalid string to bool convert attempted.");
        #/
        break;
    }
    return retval;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1416a
// Size: 0x19
function get_int_or_0(value) {
    if (!isdefined(value)) {
        return 0;
    }
    return int(value);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1418b
// Size: 0x102
function function_5e9baece4185ee1e(bundlename) {
    if (!function_73e183e02834309d(bundlename)) {
        bundlename = function_40fd49171fad19d3(tolower(bundlename));
    }
    if (!isdefined(level.var_a1fa0d703a31ee73)) {
        level.var_a1fa0d703a31ee73 = [];
    }
    if (!isdefined(level.var_a1fa0d703a31ee73[bundlename])) {
        level.var_a1fa0d703a31ee73[bundlename] = [];
        level.var_a1fa0d703a31ee73[bundlename][0] = getscriptbundle(bundlename);
        if (isdefined(level.var_a1fa0d703a31ee73[bundlename][0])) {
            /#
                assert(!isdefined(level.var_a1fa0d703a31ee73[bundlename][0].var_ba90822709a29aa2));
            #/
            level.var_a1fa0d703a31ee73[bundlename][0].var_ba90822709a29aa2 = bundlename;
            level.var_a1fa0d703a31ee73[bundlename][1] = 0;
        } else {
            level.var_a1fa0d703a31ee73[bundlename] = undefined;
            return undefined;
        }
    }
    level.var_a1fa0d703a31ee73[bundlename][1] = level.var_a1fa0d703a31ee73[bundlename][1] + 1;
    return level.var_a1fa0d703a31ee73[bundlename][0];
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14295
// Size: 0x99
function function_680ff86fdba6e483(var_6e18d82b5d9e570c) {
    if (!isdefined(var_6e18d82b5d9e570c)) {
        return;
    }
    if (!isdefined(level.var_a1fa0d703a31ee73)) {
        return;
    }
    /#
        assert(isdefined(var_6e18d82b5d9e570c.var_ba90822709a29aa2));
    #/
    bundlename = var_6e18d82b5d9e570c.var_ba90822709a29aa2;
    if (!isdefined(level.var_a1fa0d703a31ee73[bundlename])) {
        return;
    }
    level.var_a1fa0d703a31ee73[bundlename][1] = level.var_a1fa0d703a31ee73[bundlename][1] - 1;
    if (level.var_a1fa0d703a31ee73[bundlename][1] <= 0) {
        level.var_a1fa0d703a31ee73[bundlename] = undefined;
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14335
// Size: 0x85
function function_eadd787ef68ba356(object) {
    queue = self;
    var_ea29b329f39a27d3 = spawnstruct();
    var_ea29b329f39a27d3.object = object;
    if (isdefined(queue.tail)) {
        queue.tail.next = var_ea29b329f39a27d3;
        queue.tail = var_ea29b329f39a27d3;
    } else {
        queue.head = var_ea29b329f39a27d3;
        queue.tail = var_ea29b329f39a27d3;
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x143c1
// Size: 0x84
function function_beed97b4da27070e() {
    queue = self;
    while (isdefined(queue.head)) {
        object = queue.head.object;
        queue.head = queue.head.next;
        if (!isdefined(queue.head)) {
            queue.tail = undefined;
        }
        if (isdefined(object)) {
            return object;
        }
    }
    return undefined;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1444d
// Size: 0x174
function function_4676b0931a17998a(array) {
    /#
        assert(isdefined(self.origin) && isdefined(self.angles));
    #/
    var_90451b63c9bd2818 = -1;
    var_81ee2ed4300c1692 = undefined;
    if (isplayer(self)) {
        forward = anglestoforward(self getplayerangles());
        foreach (object in array) {
            dir = vectornormalize(object.origin - self geteye());
            dot = vectordot(forward, dir);
            if (dot >= var_90451b63c9bd2818) {
                var_90451b63c9bd2818 = dot;
                var_81ee2ed4300c1692 = object;
            }
        }
    } else {
        forward = anglestoforward(self.angles);
        foreach (object in array) {
            dir = vectornormalize(object.origin - self.origin);
            dot = vectordot(forward, dir);
            if (dot >= var_90451b63c9bd2818) {
                var_90451b63c9bd2818 = dot;
                var_81ee2ed4300c1692 = object;
            }
        }
    }
    return var_81ee2ed4300c1692;
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x145c9
// Size: 0x24
function function_fe32d769b4bbd6a1(object, string) {
    object waittill(string);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x145f4
// Size: 0x4d
function function_2bf8ec790b5a10f8(dvar, func, args) {
    if (getdvarint(dvar)) {
        if (isdefined(args)) {
            if (!isarray(args)) {
                args = [0:args];
            }
            return single_func_argarray(self, func, args);
        } else {
            return self [[ func ]]();
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x14648
// Size: 0x58
function function_faefc2306b38a0b2(dvar, func, args) {
    if (!function_ec3aea190c440d29(dvar) || !getdvarint(dvar)) {
        if (isdefined(args)) {
            if (!isarray(args)) {
                args = [0:args];
            }
            return single_func_argarray(self, func, args);
        } else {
            return self [[ func ]]();
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x146a7
// Size: 0x90
function function_c306c2fab085ed0e(dvar, value, func, args) {
    if (isdefined(value)) {
        if (getdvarint(dvar) == value) {
            if (isdefined(args)) {
                if (!isarray(args)) {
                    args = [0:args];
                }
                return single_func_argarray(self, func, args);
            } else {
                return self [[ func ]]();
            }
        }
    } else if (!function_ec3aea190c440d29(dvar)) {
        if (isdefined(args)) {
            if (!isarray(args)) {
                args = [0:args];
            }
            return single_func_argarray(self, func, args);
        } else {
            return self [[ func ]]();
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1473e
// Size: 0x61
function function_c71faf21f94673a3(dvar, value, func, args) {
    if (function_ec3aea190c440d29(dvar) && getdvarint(dvar) < value) {
        if (isdefined(args)) {
            if (!isarray(args)) {
                args = [0:args];
            }
            return single_func_argarray(self, func, args);
        } else {
            return self [[ func ]]();
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x147a6
// Size: 0x61
function function_2bf5388598cc6836(dvar, value, func, args) {
    if (function_ec3aea190c440d29(dvar) && getdvarint(dvar) > value) {
        if (isdefined(args)) {
            if (!isarray(args)) {
                args = [0:args];
            }
            return single_func_argarray(self, func, args);
        } else {
            return self [[ func ]]();
        }
    }
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1480e
// Size: 0x2b
function function_ee26a62ef3d1372d(dvar_name, default_value, var_5e073b266eeb0520) {
    return function_2155c1bc405429a3(getdvarint(dvar_name, default_value), default_value, var_5e073b266eeb0520);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14841
// Size: 0x2b
function function_370c5539313daf66(dvar_name, default_value, var_5e073b266eeb0520) {
    return function_2155c1bc405429a3(getdvarfloat(dvar_name, default_value), default_value, var_5e073b266eeb0520);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x14874
// Size: 0x2b
function function_680811466c2e6053(dvar_name, default_value, var_5e073b266eeb0520) {
    return function_2155c1bc405429a3(getdvarvector(dvar_name, default_value), default_value, var_5e073b266eeb0520);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x148a7
// Size: 0x2b
function function_ba70ea4e80f22895(dvar_name, default_value, var_5e073b266eeb0520) {
    return function_2155c1bc405429a3(getdvar(dvar_name, default_value), default_value, var_5e073b266eeb0520);
}

// Namespace utility/namespace_3c37cb17ade254d
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x148da
// Size: 0x52
function private function_2155c1bc405429a3(var_ceedf73d8321005e, default_value, var_5e073b266eeb0520) {
    /#
        assert(isdefined(default_value));
    #/
    var_748a5b6e1eb008f5 = default_value;
    if (isdefined(var_ceedf73d8321005e) && var_ceedf73d8321005e != default_value) {
        var_748a5b6e1eb008f5 = var_ceedf73d8321005e;
    } else {
        var_748a5b6e1eb008f5 = ter_op(isdefined(var_5e073b266eeb0520), var_5e073b266eeb0520, default_value);
    }
    return var_748a5b6e1eb008f5;
}

