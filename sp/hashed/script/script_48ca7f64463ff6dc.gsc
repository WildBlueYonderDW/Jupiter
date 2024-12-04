#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\engine\utility;

#namespace ai_formation;

// Namespace ai_formation / namespace_21337af87513582c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13d
// Size: 0x19
function init_formations() {
    if (!isdefined(level.formationlist)) {
        level.formationlist = [];
    }
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15e
// Size: 0x7a
function function_a18d80bcfacb9e00(formationname, formationtype) {
    if (!isdefined(level.formationlist)) {
        init_formations();
    }
    if (isdefined(level.formationlist[formationname])) {
        return level.formationlist[formationname];
    }
    assertex(formationtype >= 0 && formationtype < 4, "Invalid formation type of " + formationtype);
    level.formationlist[formationname] = newaiformation(formationtype);
    return level.formationlist[formationname];
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e1
// Size: 0x37
function delete_formation(formationname) {
    if (!isdefined(level.formationlist[formationname])) {
        return;
    }
    function_795225119619e713(level.formationlist[formationname]);
    level.formationlist[formationname] = undefined;
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x220
// Size: 0xc4
function function_73d6d4ee28a18071(formationname, var_129f5d1ec2e3fec5, formationtype) {
    if (!isdefined(formationtype)) {
        formationtype = 3;
    }
    if (!isdefined(level.formationlist)) {
        init_formations();
    }
    if (!isdefined(level.formationlist[formationname])) {
        function_a18d80bcfacb9e00(formationname, formationtype);
    }
    if (isarray(var_129f5d1ec2e3fec5)) {
        foreach (ai in var_129f5d1ec2e3fec5) {
            ai enter_formation(level.formationlist[formationname]);
        }
        return;
    }
    var_129f5d1ec2e3fec5 enter_formation(level.formationlist[formationname]);
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2ec
// Size: 0x118
function function_98e62e94c2b167e0(formationname, horizontalcount, verticalcount, var_b4060a330731f1bd, var_1b9a7d48f06da667, var_9af84e76946ada66) {
    if (!isdefined(var_9af84e76946ada66)) {
        var_9af84e76946ada66 = 0;
    }
    if (!isdefined(level.formationlist[formationname])) {
        return;
    }
    mid = floor(horizontalcount / 2);
    offsetcount = 1;
    for (verticalindex = 0; verticalindex < verticalcount; verticalindex++) {
        for (horizontalindex = 0; horizontalindex < horizontalcount; horizontalindex++) {
            if (!var_9af84e76946ada66 && verticalindex == 0 && horizontalindex == mid) {
                continue;
            }
            yoffset = var_b4060a330731f1bd * -1 * (horizontalindex - mid);
            xoffset = var_1b9a7d48f06da667 * -1 * verticalindex;
            if (var_9af84e76946ada66) {
                yoffset -= 0.5 * (horizontalcount - 1) % 2 * var_b4060a330731f1bd;
                xoffset -= var_1b9a7d48f06da667;
            }
            function_c412284514efc768(level.formationlist[formationname], offsetcount, (xoffset, yoffset, 0));
            offsetcount++;
        }
    }
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x40c
// Size: 0x27e
function function_cf3f27c3c5266ee2(formationname, var_3f4d3640a452a225, numai, var_b4060a330731f1bd, var_1b9a7d48f06da667, var_9af84e76946ada66) {
    if (!isdefined(var_9af84e76946ada66)) {
        var_9af84e76946ada66 = 0;
    }
    if (!isdefined(level.formationlist[formationname])) {
        return 1;
    }
    if (numai <= 1) {
        return 1;
    }
    if (var_9af84e76946ada66 && var_3f4d3640a452a225 != 1) {
        numai--;
    }
    switch (var_3f4d3640a452a225) {
    case 1:
        dimension = ceil((sqrt(8 * numai + 1) - 1) / 2);
        offsetcount = 1;
        for (verticalindex = 0; verticalindex < dimension; verticalindex++) {
            for (horizontalindex = 0; horizontalindex < verticalindex + 1; horizontalindex++) {
                if (verticalindex == 0 && horizontalindex == 0) {
                    continue;
                }
                yoffset = var_b4060a330731f1bd * (horizontalindex - verticalindex / 2);
                xoffset = var_1b9a7d48f06da667 * -1 * verticalindex;
                function_c412284514efc768(level.formationlist[formationname], offsetcount, (xoffset, yoffset, 0));
                offsetcount++;
            }
        }
        return ((dimension - 1) * var_b4060a330731f1bd);
    case 2:
        mid = 0;
        horizontalcount = 1;
        verticalcount = numai;
        break;
    case 3:
        mid = 1;
        horizontalcount = 2;
        verticalcount = ceil(numai / horizontalcount);
        break;
    case 4:
        mid = 1;
        horizontalcount = 3;
        verticalcount = ceil(numai / horizontalcount);
        break;
    default:
        horizontalcount = ceil(sqrt(numai));
        verticalcount = ceil(numai / horizontalcount);
        mid = floor(horizontalcount / 2);
        break;
    }
    offsetcount = 1;
    for (verticalindex = 0; verticalindex < verticalcount; verticalindex++) {
        for (horizontalindex = 0; horizontalindex < horizontalcount; horizontalindex++) {
            if (!var_9af84e76946ada66 && verticalindex == 0 && horizontalindex == mid) {
                continue;
            }
            yoffset = var_b4060a330731f1bd * -1 * (horizontalindex - mid);
            xoffset = var_1b9a7d48f06da667 * -1 * verticalindex;
            if (var_9af84e76946ada66) {
                yoffset -= 0.5 * (horizontalcount - 1) % 2 * var_b4060a330731f1bd;
                xoffset -= var_1b9a7d48f06da667;
            }
            function_c412284514efc768(level.formationlist[formationname], offsetcount, (xoffset, yoffset, 0));
            offsetcount++;
        }
    }
    return (horizontalcount - 1) * var_b4060a330731f1bd;
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x693
// Size: 0xb2
function function_e780688c49cc9549(formationname, var_93e0bc97a6d45499) {
    if (!isdefined(level.formationlist[formationname])) {
        return;
    }
    assertex(var_93e0bc97a6d45499.size < 31, "Exceeding max number of formation offsets of " + 32 - 1 + " . Formation name of " + level.formationlist[formationname]);
    count = 1;
    foreach (offset in var_93e0bc97a6d45499) {
        function_c412284514efc768(level.formationlist[formationname], count, offset);
        count++;
    }
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x74d
// Size: 0x77
function function_bc785df299663d60(formationname, formationslot, customoffset) {
    if (!isdefined(level.formationlist[formationname])) {
        return;
    }
    maxcount = 31;
    assertex(formationslot < maxcount && formationslot > 0, "Setting invalid formation slot custom offset, must be below " + maxcount + " and above 0. Formation name of " + level.formationlist[formationname]);
    function_c412284514efc768(level.formationlist[formationname], formationslot, customoffset);
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7cc
// Size: 0x35
function set_goal(formationname, goalposition) {
    if (!isdefined(level.formationlist[formationname])) {
        return;
    }
    function_e29a9a1d854faa6a(level.formationlist[formationname], goalposition);
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x809
// Size: 0x68
function leave_formation(var_cc408e19cc4792d2) {
    if (isarray(var_cc408e19cc4792d2)) {
        foreach (ai in var_cc408e19cc4792d2) {
            ai exit_formation();
        }
        return;
    }
    var_cc408e19cc4792d2 exit_formation();
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x879
// Size: 0x7a
function follow_entity(formationname, ent, followdistance, timestep) {
    if (!isdefined(followdistance)) {
        followdistance = 100;
    }
    if (!isdefined(ent)) {
        return false;
    }
    if (!isdefined(level.formationlist[formationname])) {
        return false;
    }
    leader = get_leader(formationname);
    if (isdefined(leader)) {
        leader setgoalentity(ent);
        function_34c06b9933952e67(level.formationlist[formationname], followdistance);
        return true;
    }
    return false;
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8fc
// Size: 0x3e
function function_5e8d7d93ecffa23f(formationname) {
    if (!isdefined(level.formationlist[formationname])) {
        return false;
    }
    leader = get_leader(formationname);
    if (isdefined(leader)) {
        leader cleargoalentity();
        return true;
    }
    return false;
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x943
// Size: 0x2c
function get_leader(formationname) {
    if (!isdefined(level.formationlist[formationname])) {
        return undefined;
    }
    return function_37a4bf80ea1cae75(level.formationlist[formationname]);
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x978
// Size: 0x2f
function function_679b2830741a1384(formationname) {
    formationid = level.formationlist[formationname];
    if (!isdefined(formationid)) {
        return;
    }
    self function_5ba70c95e357a4f9(formationid);
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9af
// Size: 0x20
function private exit_formation() {
    if (istrue(self.information)) {
        self.information = 0;
        self function_fd663014f7eae161();
    }
}

// Namespace ai_formation / namespace_21337af87513582c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x9d7
// Size: 0x25
function private enter_formation(formationid) {
    exit_formation();
    self.information = 1;
    self function_19ef30914f93393e(formationid);
}

