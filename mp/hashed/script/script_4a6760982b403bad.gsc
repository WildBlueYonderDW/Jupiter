#namespace namespace_c45ac99c4997e722;

// Namespace namespace_c45ac99c4997e722 / namespace_de6e6777b0937bd7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10f
// Size: 0x60
function function_aacbbe63c26687ae(callback, func) {
    if (!isdefined(level.var_ec2c9117bd4b336b)) {
        level.var_ec2c9117bd4b336b = [];
    }
    if (!isdefined(level.var_ec2c9117bd4b336b[callback])) {
        level.var_ec2c9117bd4b336b[callback] = [];
    }
    level.var_ec2c9117bd4b336b[callback][level.var_ec2c9117bd4b336b[callback].size] = func;
}

// Namespace namespace_c45ac99c4997e722 / namespace_de6e6777b0937bd7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x177
// Size: 0x2d
function function_9ce94b15ee6758ee(callback) {
    if (!isdefined(level.var_ec2c9117bd4b336b)) {
        return false;
    }
    if (!isdefined(level.var_ec2c9117bd4b336b[callback])) {
        return false;
    }
    return true;
}

// Namespace namespace_c45ac99c4997e722 / namespace_de6e6777b0937bd7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ad
// Size: 0x87
function function_80820d6d364c1836(callback, data) {
    if (!function_9ce94b15ee6758ee(callback)) {
        return;
    }
    if (isdefined(data)) {
        for (i = 0; i < level.var_ec2c9117bd4b336b[callback].size; i++) {
            thread [[ level.var_ec2c9117bd4b336b[callback][i] ]](data);
        }
        return;
    }
    for (i = 0; i < level.var_ec2c9117bd4b336b[callback].size; i++) {
        thread [[ level.var_ec2c9117bd4b336b[callback][i] ]]();
    }
}

// Namespace namespace_c45ac99c4997e722 / namespace_de6e6777b0937bd7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23c
// Size: 0x42
function function_1b15450e092933cf(basetime) {
    timefrom = basetime;
    if (isdefined(level.starttimefrommatchstart)) {
        timefrom -= level.starttimefrommatchstart;
        if (timefrom < 0) {
            timefrom = 0;
        }
    } else {
        timefrom = 0;
    }
    return timefrom;
}

// Namespace namespace_c45ac99c4997e722 / namespace_de6e6777b0937bd7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x287
// Size: 0x5d
function function_50989a55805a440b() {
    mountstring = self playermounttype();
    if (isdefined(mountstring)) {
        switch (mountstring) {
        case #"hash_b882c19d3b9f4eb6":
            return "MOUNT_LEFT";
        case #"hash_c00b1399e3e96eeb":
            return "MOUNT_RIGHT";
        case #"hash_d45b94ed344be47e":
            return "MOUNT_TOP";
        }
    }
    return "MOUNT_NONE";
}

// Namespace namespace_c45ac99c4997e722 / namespace_de6e6777b0937bd7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ed
// Size: 0x3d
function function_892570944f6b6a2(client) {
    if (istrue(game["isLaunchChunk"])) {
        return false;
    }
    if (!isdefined(client)) {
        return false;
    } else if (isagent(client)) {
        return false;
    } else if (!isplayer(client)) {
        return false;
    }
    return true;
}

// Namespace namespace_c45ac99c4997e722 / namespace_de6e6777b0937bd7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x333
// Size: 0x85
function function_4b974d822d418a06(data) {
    if (!isdefined(data.player)) {
        return false;
    }
    if (!isdefined(data.player.pers)) {
        return false;
    }
    if (!isdefined(data.player.pers["telemetry"])) {
        return false;
    }
    if (!isdefined(data.player.pers["telemetry"].life)) {
        return false;
    }
    return true;
}

// Namespace namespace_c45ac99c4997e722 / namespace_de6e6777b0937bd7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c1
// Size: 0xa9
function get_objective_type() {
    objectivetype = "hub";
    if (isdefined(level.active_objectives_string)) {
        objectivetype = level.active_objectives_string;
    } else if (isdefined(level.contentmanager) && isdefined(level.contentmanager.activeobjective)) {
        instance = level.contentmanager.activeobjective;
        location = instance.targetname;
        if (isdefined(location)) {
            objectivetype = location;
        }
    } else if (isdefined(level.lastobjective)) {
        objectivetype = level.lastobjective;
    }
    return objectivetype;
}

// Namespace namespace_c45ac99c4997e722 / namespace_de6e6777b0937bd7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x473
// Size: 0x30
function function_ff48d255c865806(client) {
    if (function_892570944f6b6a2(client)) {
        return (client.clientid < level.maxlogclients);
    }
    return 0;
}

// Namespace namespace_c45ac99c4997e722 / namespace_de6e6777b0937bd7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ab
// Size: 0x31
function function_86d327084eebf87a(value) {
    if (!isdefined(value) || !isfloat(value)) {
        assert("<dev string:x1c>");
        value = -1e+06;
    }
    return value;
}

