// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\juggernaut.gsc;

#namespace inventory;

// Namespace inventory/namespace_92e4af149e72dc29
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf
// Size: 0x1f
function getlastweapon() {
    /#
        assert(isdefined(self.lastnormalweaponobj));
    #/
    return self.lastnormalweaponobj;
}

// Namespace inventory/namespace_92e4af149e72dc29
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd6
// Size: 0x5f
function switchtolastweapon() {
    if (!isai(self)) {
        lastweaponobj = getlastweapon();
        if (namespace_a2f809133c566621::isjuggernaut()) {
            lastweaponobj = namespace_68f1873625691c6::jugg_getminigunweapon();
        } else if (!self hasweapon(lastweaponobj)) {
            lastweaponobj = getfirstprimaryweapon();
        }
        if (isdefined(lastweaponobj)) {
            _switchtoweapon(lastweaponobj);
        }
    } else {
        _switchtoweapon("none");
    }
}

// Namespace inventory/namespace_92e4af149e72dc29
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c
// Size: 0x63
function getfirstprimaryweapon() {
    weaponslist = self getweaponslistprimaries();
    if (isdefined(self.pers["altStates"]) && weaponslist.size > 0) {
        var_366b0ecc2f28aead = getcompleteweaponname(weaponslist[0]);
        if (istrue(self.pers["altStates"][var_366b0ecc2f28aead])) {
            return weaponslist[0] getaltweapon();
        }
    }
    return weaponslist[0];
}

// Namespace inventory/namespace_92e4af149e72dc29
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1a7
// Size: 0x1d5
function registerweaponchangecallback(callbackfunc, var_342b4a7404fd91ab, var_83d988341d1d6755) {
    data = self.weaponchangecallbacks;
    if (!isdefined(data)) {
        data = spawnstruct();
        self.weaponchangecallbacks = data;
        data.nextid = 1;
        data.nextoneshotid = -1;
        data.callbacks = [];
        data.oneshotcallbacks = [];
        data.persistentcallbacks = [];
    }
    id = undefined;
    if (istrue(var_342b4a7404fd91ab)) {
        /#
            foreach (var_b14642b7e8747d44 in data.oneshotcallbacks) {
                /#
                    assertex(var_b14642b7e8747d44 != callbackfunc, "<unknown string>");
                #/
            }
        #/
        id = data.nextoneshotid;
        data.nextoneshotid--;
        data.oneshotcallbacks[id] = callbackfunc;
    } else {
        /#
            foreach (var_ca6eebb03b2bb512 in data.callbacks) {
                /#
                    assertex(var_ca6eebb03b2bb512 != callbackfunc, "<unknown string>");
                #/
            }
        #/
        id = data.nextid;
        data.nextid++;
        data.callbacks[id] = callbackfunc;
    }
    if (istrue(var_83d988341d1d6755)) {
        data.persistentcallbacks[id] = id;
    }
    return id;
}

// Namespace inventory/namespace_92e4af149e72dc29
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x384
// Size: 0x4e
function unregisterweaponchangecallback(id) {
    data = self.weaponchangecallbacks;
    /#
        assert(isdefined(data));
    #/
    if (id < 0) {
        data.oneshotcallbacks[id] = undefined;
    } else {
        data.callbacks[id] = undefined;
    }
}

// Namespace inventory/namespace_92e4af149e72dc29
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d9
// Size: 0xe5
function handleweaponchangecallbacksondeath() {
    data = self.weaponchangecallbacks;
    if (!isdefined(data)) {
        return;
    }
    foreach (id, callback in data.callbacks) {
        if (!isdefined(data.persistentcallbacks[id])) {
            data.callbacks[id] = undefined;
        }
    }
    foreach (id, callback in data.oneshotcallbacks) {
        if (!isdefined(data.persistentcallbacks[id])) {
            data.oneshotcallbacks[id] = undefined;
        }
    }
}

