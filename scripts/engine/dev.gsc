// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace dev;

// Namespace dev/namespace_f013313a9982546e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x70
// Size: 0xa6
function function_4da869df964b68db(dvarname, var_d4bb121b87421c8) {
    /#
        setdevdvar(dvarname, "<unknown string>");
        while (1) {
            waitframe();
            dvarvalue = getdvar(dvarname);
            if (dvarvalue == "<unknown string>") {
                continue;
            }
            setdevdvar(dvarname, "<unknown string>");
            tokens = strtok(dvarvalue, "<unknown string>");
            if (!isdefined(tokens) || tokens.size < 1) {
                continue;
            }
            command = tokens[0];
            arglist = array_slice(tokens, 1);
            [[ var_d4bb121b87421c8 ]](command, arglist);
        }
    #/
}

