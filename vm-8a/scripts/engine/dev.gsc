#using scripts\engine\utility.gsc;

#namespace dev;

/#

    // Namespace dev / scripts\engine\dev
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x70
    // Size: 0xa5
    function function_4da869df964b68db(dvarname, var_d4bb121b87421c8) {
        setdevdvar(dvarname, "<dev string:x1c>");
        while (true) {
            waitframe();
            dvarvalue = getdvar(dvarname);
            if (dvarvalue == "<dev string:x1c>") {
                continue;
            }
            setdevdvar(dvarname, "<dev string:x1c>");
            tokens = strtok(dvarvalue, "<dev string:x1d>");
            if (!isdefined(tokens) || tokens.size < 1) {
                continue;
            }
            command = tokens[0];
            arglist = array_slice(tokens, 1);
            [[ var_d4bb121b87421c8 ]](command, arglist);
        }
    }

#/
