// mwiii decomp prototype
#namespace namespace_c45ac99c4997e722;

// Namespace namespace_c45ac99c4997e722/namespace_de6e6777b0937bd7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d
// Size: 0x61
function function_aacbbe63c26687ae(callback, func) {
    if (!isdefined(level.var_ec2c9117bd4b336b)) {
        level.var_ec2c9117bd4b336b = [];
    }
    if (!isdefined(level.var_ec2c9117bd4b336b[callback])) {
        level.var_ec2c9117bd4b336b[callback] = [];
    }
    level.var_ec2c9117bd4b336b[callback][level.var_ec2c9117bd4b336b[callback].size] = func;
}

// Namespace namespace_c45ac99c4997e722/namespace_de6e6777b0937bd7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a5
// Size: 0x2e
function function_9ce94b15ee6758ee(callback) {
    if (!isdefined(level.var_ec2c9117bd4b336b)) {
        return 0;
    }
    if (!isdefined(level.var_ec2c9117bd4b336b[callback])) {
        return 0;
    }
    return 1;
}

// Namespace namespace_c45ac99c4997e722/namespace_de6e6777b0937bd7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1db
// Size: 0x87
function function_80820d6d364c1836(callback, data) {
    if (!function_9ce94b15ee6758ee(callback)) {
        return;
    }
    if (isdefined(data)) {
        for (i = 0; i < level.var_ec2c9117bd4b336b[callback].size; i++) {
            thread [[ level.var_ec2c9117bd4b336b[callback][i] ]](data);
        }
    } else {
        for (i = 0; i < level.var_ec2c9117bd4b336b[callback].size; i++) {
            thread [[ level.var_ec2c9117bd4b336b[callback][i] ]]();
        }
    }
}

// Namespace namespace_c45ac99c4997e722/namespace_de6e6777b0937bd7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x269
// Size: 0x42
function function_1b15450e092933cf(basetime) {
    var_fbdcfbd6233e2398 = basetime;
    if (isdefined(level.starttimefrommatchstart)) {
        var_fbdcfbd6233e2398 = var_fbdcfbd6233e2398 - level.starttimefrommatchstart;
        if (var_fbdcfbd6233e2398 < 0) {
            var_fbdcfbd6233e2398 = 0;
        }
    } else {
        var_fbdcfbd6233e2398 = 0;
    }
    return var_fbdcfbd6233e2398;
}

// Namespace namespace_c45ac99c4997e722/namespace_de6e6777b0937bd7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b3
// Size: 0x5d
function function_50989a55805a440b() {
    var_d3513add1f8263d7 = self playermounttype();
    if (isdefined(var_d3513add1f8263d7)) {
        switch (var_d3513add1f8263d7) {
        case #"hash_b882c19d3b9f4eb6":
            return "MOUNT_LEFT";
        case #"hash_c00b1399e3e96eeb":
            return "MOUNT_RIGHT";
        case #"hash_d45b94ed344be47e":
            return "MOUNT_TOP";
            break;
        }
    }
    return "MOUNT_NONE";
}

// Namespace namespace_c45ac99c4997e722/namespace_de6e6777b0937bd7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x318
// Size: 0x3e
function function_892570944f6b6a2(client) {
    if (istrue(game["isLaunchChunk"])) {
        return 0;
    }
    if (!isdefined(client)) {
        return 0;
    } else if (isagent(client)) {
        return 0;
    } else if (!isplayer(client)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_c45ac99c4997e722/namespace_de6e6777b0937bd7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35e
// Size: 0x86
function function_4b974d822d418a06(data) {
    if (!isdefined(data.player)) {
        return 0;
    }
    if (!isdefined(data.player.pers)) {
        return 0;
    }
    if (!isdefined(data.player.pers["telemetry"])) {
        return 0;
    }
    if (!isdefined(data.player.pers["telemetry"].life)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_c45ac99c4997e722/namespace_de6e6777b0937bd7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ec
// Size: 0xab
function get_objective_type() {
    objectivetype = "hub";
    if (isdefined(level.active_objectives_string)) {
        objectivetype = level.active_objectives_string;
    } else if (isdefined(level.var_a1c29f4029327195) && isdefined(level.var_a1c29f4029327195.activeobjective)) {
        instance = level.var_a1c29f4029327195.activeobjective;
        location = instance.targetname;
        if (isdefined(location)) {
            objectivetype = location;
        }
    } else if (isdefined(level.var_9ff590ca18f468b8)) {
        objectivetype = level.var_9ff590ca18f468b8;
    }
    return objectivetype;
}

// Namespace namespace_c45ac99c4997e722/namespace_de6e6777b0937bd7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x49f
// Size: 0x31
function function_ff48d255c865806(client) {
    if (function_892570944f6b6a2(client)) {
        return (client.clientid < level.maxlogclients);
    } else {
        return 0;
    }
}

// Namespace namespace_c45ac99c4997e722/namespace_de6e6777b0937bd7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4d7
// Size: 0x32
function function_86d327084eebf87a(value) {
    if (!isdefined(value) || !isfloat(value)) {
        /#
            assert("value is not a "Float". Defaulting to -1000000.0, since it is currently outside the scope of tuning values.");
        #/
        value = -1e+06;
    }
    return value;
}

