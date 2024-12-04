#using script_72ef6b9f0cf1f55a;
#using scripts\common\utility;
#using scripts\engine\math;
#using scripts\engine\sp\utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\sp\analytics;
#using scripts\sp\equipment\offhands;
#using scripts\sp\player;
#using scripts\sp\player\cursor_hint;
#using scripts\sp\script_items;
#using scripts\sp\utility;

#namespace loot;

// Namespace loot / scripts\sp\loot
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x431
// Size: 0x2ef
function init() {
    setdvarifuninitialized(@"hash_7dfe19d75d304409", 0);
    level.loot = spawnstruct();
    level.loot.types = [];
    level.loot.notifications = [];
    level.loot.var_abb7ac9930101675 = [];
    level.loot.var_8da39343ac7feaf3 = [];
    level.loot.var_d0d7b34e9765980a = [];
    level.loot.var_ed20cdd56dfeb988 = [];
    level.loot.lastloottime = 0;
    level.loot.spawntags = ["j_spinelower"];
    level.loot.sfx = spawn_script_origin(level.player.origin);
    level.loot.sfx linkto(level.player);
    level.loot.offhands = [];
    level.loot.primaryweapons = [];
    level.loot.ammo_types = [];
    level.loot.var_73dd4fee363c8438 = undefined;
    level.loot.var_2aa4852ad9e76ff5 = undefined;
    level.loot.probability = [];
    level.loot.probability["Default"] = undefined;
    level.loot.probability["Offhand"] = &probabilityoffhand;
    level.loot.probability["OffhandWheel"] = &function_6bc788ba92068527;
    level.loot.probability["Never"] = &probabilityzero;
    if (isdefined(level.gamemodebundle)) {
        function_af421e4ae48662c7(level.gamemodebundle.var_fb1f49d1ec80148d);
    }
    if (utility::playerarmorenabled()) {
        thread updatearmordroptimer();
    }
    thread setworldloot();
    if (istrue(level.loot.var_307d8c71918f2204)) {
        level thread function_62cab66e6e85f19a();
    }
    level thread function_2099b5b188b3a60c();
    level.loot.droppedweapons = [];
    level.loot.droppeditems = [];
    registersharedfunc("loot", "dropWeapon", &function_863b0816a82a8a75);
    registersharedfunc("loot", "dropItem", &function_fc99f2e66b255d12);
    registersharedfunc("game", "spawnNewItem", &spawnlootitem);
    /#
        function_3c821aac4af727f3();
    #/
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x728
// Size: 0x4b1
function function_af421e4ae48662c7(var_47ccbb601b4468ce) {
    if (!isdefined(var_47ccbb601b4468ce)) {
        return;
    }
    level.loot.types = [];
    level.loot.var_abb7ac9930101675 = [];
    level.loot.var_73dd4fee363c8438 = undefined;
    level.loot.var_2aa4852ad9e76ff5 = undefined;
    bundlelist = getscriptbundle("campaignlootlist:" + var_47ccbb601b4468ce);
    if (isdefined(bundlelist)) {
        level.player.armor.var_a81adeb0e1f89320 = default_to(bundlelist.var_a81adeb0e1f89320, 3);
        level.loot.var_73dd4fee363c8438 = bundlelist.var_73dd4fee363c8438;
        level.loot.var_4152cb04c4c34a6 = bundlelist.var_2685faaf733ff3b1;
        if (isdefined(bundlelist.exceptions)) {
            foreach (exception in bundlelist.exceptions) {
                if (isdefined(exception.classname)) {
                    level.loot.var_abb7ac9930101675[exception.classname] = 1;
                }
            }
        }
        if (isdefined(bundlelist.lootlist)) {
            level.loot.maxloot = default_to(bundlelist.maxloot, 25);
            level.loot.var_2180aa8aec9aae66 = default_to(bundlelist.var_2180aa8aec9aae66, 25);
            level.loot.var_307d8c71918f2204 = default_to(bundlelist.var_307d8c71918f2204, 0);
            foreach (var_1e9517e712c2c45c in bundlelist.lootlist) {
                loot = getscriptbundle("campaignloot:" + var_1e9517e712c2c45c.loot);
                if (!isdefined(loot)) {
                    continue;
                }
                probabilityfunc = level.loot.probability[default_to(loot.probability, "Default")];
                switch (default_to(loot.type, "General")) {
                case #"hash_f759d725729848ab":
                    registerloot(loot, &donothing, &inactive, probabilityfunc);
                    break;
                case #"hash_b55d42dfb1c5f4ef":
                    registerammoloot(loot, probabilityfunc);
                    break;
                case #"hash_fd03b70a505586af":
                    registeroffhandloot(loot, probabilityfunc);
                    break;
                case #"hash_a5b4e93bed724400":
                    registerloot(loot, &lootarmor, &playermaxarmor, &probabilityarmor, undefined, 1);
                    break;
                case #"hash_8c5cf2a57bd46bbe":
                    registerloot(loot, &function_c59ef2aeb9431494, &function_a57539eb7fbc0627, &probabilityarmor, undefined, 1);
                    break;
                case #"hash_76f2aca395298035":
                    function_1693de8f478a2d4a(loot, &function_987da1270586a39f, undefined, probabilityfunc);
                    break;
                case #"hash_9dfd4437e7e29775":
                    function_e1bd0ad03241540a(loot, probabilityfunc);
                    break;
                }
            }
        }
        if (isdefined(bundlelist.var_933c1afba457906a)) {
            var_3d94a6a56ca629d4 = getscriptbundle("equipmentradialmenuitemlist:" + bundlelist.var_933c1afba457906a);
            if (isdefined(var_3d94a6a56ca629d4)) {
                level.loot.var_2aa4852ad9e76ff5 = [];
                foreach (item in var_3d94a6a56ca629d4.var_95e760736e295b10) {
                    itembundle = getscriptbundle("equipmentradialmenuitem:" + item.bundle);
                    if (isdefined(itembundle) && isdefined(itembundle.var_34a9fd7a1aaf80e1) && itembundle.var_34a9fd7a1aaf80e1 != "none") {
                        level.loot.var_2aa4852ad9e76ff5[itembundle.var_34a9fd7a1aaf80e1] = itembundle.var_34a9fd7a1aaf80e1;
                    }
                }
            }
        }
    }
}

// Namespace loot / scripts\sp\loot
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbe1
// Size: 0x31
function corpselootthink() {
    if (!cancarryloot()) {
        return;
    }
    self waittill("death", attacker);
    if (!shoulddroploot(attacker)) {
        return;
    }
    spawncorpseloot();
}

// Namespace loot / scripts\sp\loot
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc1a
// Size: 0x51
function cancarryloot() {
    if (!isdefined(self)) {
        return false;
    }
    if (!isdefined(level.loot)) {
        return false;
    }
    if (self.team != "axis") {
        return false;
    }
    if (istrue(level.loot.var_abb7ac9930101675[self.classname])) {
        return false;
    }
    return true;
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc74
// Size: 0x79
function shoulddroploot(attacker) {
    if (!isdefined(self)) {
        return false;
    }
    if (!isdefined(level.loot)) {
        return false;
    }
    if (!playerlootenabled()) {
        return false;
    }
    if (force_armor_drop()) {
        return true;
    }
    if (indonotspawnlootvolume(self)) {
        return false;
    }
    if (istrue(self.noloot)) {
        return false;
    }
    if (!is_equal(attacker, level.player)) {
        return false;
    }
    if (isdefined(self.nodrop)) {
        return false;
    }
    return true;
}

// Namespace loot / scripts\sp\loot
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcf6
// Size: 0x106
function onspawnloot() {
    self.loot = [];
    foreach (name, type in level.loot.types) {
        if (isdefined(level.loot.types[name].onspawnfunc) && isdefined(level.loot.types[name].probabilityfunc)) {
            if ([[ level.loot.types[name].probabilityfunc ]](name, self.origin)) {
                self thread [[ level.loot.types[name].onspawnfunc ]]();
                self.loot[name] = 1;
            }
        }
    }
}

// Namespace loot / scripts\sp\loot
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xe04
// Size: 0x552
function registerloot(loot, lootfunc, inactivefunc, probabilityfunc, onspawnfunc, isarmor) {
    name = loot.name_id;
    if (!isstring(name) || name == "") {
        name = "loot" + level.loot.types.size + 1;
    }
    createnotification = default_to(loot.var_4a9ab842f6d92af7, 1);
    var_4eea72a373570008 = (default_to(loot.var_e49a8d76a855f650, 0), default_to(loot.var_e49a8e76a855f883, 0), default_to(loot.var_e49a8f76a855fab6, 0));
    if (isdefined(level.loot.types[name])) {
        assertmsg("Duplicate loot name id: " + name);
    }
    level.loot.types[name] = spawnstruct();
    level.loot.types[name].type = default_to(loot.type, "General");
    level.loot.types[name].image = loot.image;
    level.loot.types[name].shader = loot.shader;
    level.loot.types[name].loc = loot.name;
    level.loot.types[name].model = loot.model;
    level.loot.types[name].sound = loot.var_2cd2b9f1e533253a;
    level.loot.types[name].weapon = loot.var_38822c6b743bb385;
    level.loot.types[name].var_3266c061a1fb4041 = loot.var_3266c061a1fb4041;
    level.loot.types[name].ammoname = loot.ammoname;
    level.loot.types[name].var_900d6f1e847c0657 = loot.var_900d6f1e847c0657;
    level.loot.types[name].var_3204fabacb4e47bf = loot.var_3204fabacb4e47bf;
    level.loot.types[name].chance = float(default_to(loot.var_5382c46bd4b74734, 40));
    level.loot.types[name].var_4607332cf8361a3 = istrue(loot.var_4607332cf8361a3);
    level.loot.types[name].createnotification = createnotification;
    level.loot.types[name].lootfunc = lootfunc;
    level.loot.types[name].inactivefunc = inactivefunc;
    level.loot.types[name].probabilityfunc = probabilityfunc;
    level.loot.types[name].onspawnfunc = onspawnfunc;
    level.loot.types[name].var_4eea72a373570008 = var_4eea72a373570008;
    level.loot.types[name].isarmor = isarmor;
    level.loot.types[name].index = level.loot.types.size;
    level.loot.types[name].var_d9441f71914be05d = loot.var_d9441f71914be05d;
    if (isdefined(loot.name)) {
        precachestring(loot.name);
    }
    if (isdefined(loot.var_900d6f1e847c0657)) {
        precachestring(loot.var_900d6f1e847c0657);
    }
    if (isdefined(loot.var_3204fabacb4e47bf)) {
        precachestring(loot.var_3204fabacb4e47bf);
    }
    if (isdefined(loot.model)) {
        precachemodel(loot.model);
    }
    if (isdefined(loot.shader)) {
        precacheshader(loot.shader);
    }
    return name;
}

// Namespace loot / scripts\sp\loot
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x135f
// Size: 0x108
function function_e68059282f8637c3(name, sound, lootfunc, inactivefunc, probabilityfunc, weaponname) {
    if (!isdefined(level.loot.types[name])) {
        assertmsg("Loot name not registered '" + name + "'");
        return;
    }
    level.loot.types[name].sound = sound;
    level.loot.types[name].lootfunc = lootfunc;
    level.loot.types[name].inactivefunc = inactivefunc;
    level.loot.types[name].probabilityfunc = probabilityfunc;
    level.loot.types[name].weapon = weaponname;
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x146f
// Size: 0x4e
function deregisterloot(name) {
    level.loot.types[name] = undefined;
    level.loot.types = array_remove_key(level.loot.types, name);
}

// Namespace loot / scripts\sp\loot
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14c5
// Size: 0x5a
function registerammoloot(loot, probabilityfunc) {
    name = registerloot(loot, &lootammo, &playermaxammo, probabilityfunc);
    level.loot.ammo_types[level.loot.ammo_types.size] = name;
}

// Namespace loot / scripts\sp\loot
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1527
// Size: 0x26
function registeroffhandloot(loot, probabilityfunc) {
    registerloot(loot, &lootoffhand, &inactiveoffhand, probabilityfunc);
}

// Namespace loot / scripts\sp\loot
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1555
// Size: 0x26
function function_e1bd0ad03241540a(loot, probabilityfunc) {
    registerloot(loot, &function_46d8e80e44e75a63, &inactive, probabilityfunc);
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1583
// Size: 0xb1
function removeoffhandloot(offhand) {
    assertex(isdefined(level.loot), "removeOffhandLoot() must be called after load::main(). ");
    if (isstring(offhand)) {
        weaponname = offhand;
    } else {
        weaponname = offhand.basename;
    }
    key = scripts\sp\equipment\offhands::getweaponoffhandtype(weaponname);
    if (isdefined(level.loot.offhands[key])) {
        level.loot.offhands = array_remove_key(level.loot.offhands, key);
    }
    level.player notify("offhand_loot_change");
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x163c
// Size: 0xc8
function setoffhandloot(offhand) {
    assertex(isdefined(level.loot), "setOffhandLoot() must be called after load::main(). ");
    if (isstring(offhand)) {
        weaponname = offhand;
    } else {
        weaponname = offhand.basename;
    }
    key = scripts\sp\equipment\offhands::getweaponoffhandtype(weaponname);
    if (isdefined(level.loot.offhands[key])) {
        level.loot.offhands = array_remove_key(level.loot.offhands, key);
    }
    level.loot.offhands[key] = weaponname;
    level.player notify("offhand_loot_change");
}

// Namespace loot / scripts\sp\loot
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x170c
// Size: 0x98
function updatearmordroptimer() {
    level.player endon("death");
    level.loot.lastdroppedarmortime = -60000;
    level.loot.armordroptimer = 0;
    while (true) {
        if (level.player enemynearplayer() && !level.player scripts\sp\player::hasarmor()) {
            level.loot.armordroptimer += 0.05;
        }
        waitframe();
    }
}

// Namespace loot / scripts\sp\loot
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17ac
// Size: 0x72
function enemynearplayer() {
    foreach (enemy in getaiarray("axis")) {
        if (distancesquared(self.origin, enemy.origin) <= 1048576) {
            return true;
        }
    }
    return false;
}

// Namespace loot / scripts\sp\loot
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1827
// Size: 0x12e
function private function_197355327a7bd01a(var_a679c918818fa808, droppedent, limit) {
    entid = droppedent getentitynumber();
    var_a679c918818fa808[entid] = droppedent;
    if (var_a679c918818fa808.size <= limit) {
        return var_a679c918818fa808;
    }
    var_a679c918818fa808 = array_removeundefined(var_a679c918818fa808, 1);
    if (var_a679c918818fa808.size <= limit) {
        return var_a679c918818fa808;
    }
    sortedarray = sortbydistance(var_a679c918818fa808, level.player.origin);
    var_5de55322f4cb2e58 = undefined;
    for (i = sortedarray.size - 1; i >= 0; i--) {
        item = sortedarray[i];
        if (level.player math::point_in_fov(item.origin)) {
            if (!isdefined(var_5de55322f4cb2e58)) {
                var_5de55322f4cb2e58 = item;
            }
            continue;
        }
        var_cf5ad7339ad946ef = item;
        var_de1d0d58aac7d656 = item getentitynumber();
        var_cf5ad7339ad946ef function_2e32efd3d30633c3();
        var_a679c918818fa808[var_de1d0d58aac7d656] = undefined;
        var_5de55322f4cb2e58 = undefined;
        if (var_a679c918818fa808.size <= limit) {
            break;
        }
    }
    if (isdefined(var_5de55322f4cb2e58)) {
        var_de1d0d58aac7d656 = var_5de55322f4cb2e58 getentitynumber();
        var_5de55322f4cb2e58 function_2e32efd3d30633c3();
        var_a679c918818fa808[var_de1d0d58aac7d656] = undefined;
    }
    return var_a679c918818fa808;
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x195e
// Size: 0x4c
function private function_863b0816a82a8a75(weaponent) {
    level.loot.droppedweapons = function_197355327a7bd01a(level.loot.droppedweapons, weaponent, level.loot.var_2180aa8aec9aae66);
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x19b2
// Size: 0x4c
function private function_fc99f2e66b255d12(itement) {
    level.loot.droppeditems = function_197355327a7bd01a(level.loot.droppeditems, itement, level.loot.maxloot);
}

// Namespace loot / scripts\sp\loot
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a06
// Size: 0xdc
function spawncorpseloot() {
    if (!isdefined(self)) {
        return;
    }
    if (!isdefined(self.loot)) {
        self.loot = [];
    }
    spawnpool = function_bea35dd59e0df4ac();
    for (itemcount = self.loot.size; itemcount < 2 && spawnpool.size > 0; itemcount++) {
        name = spawnpool[randomintrange(0, spawnpool.size)];
        spawnpool = array_remove(spawnpool, name);
        tag = level.loot.spawntags[randomint(level.loot.spawntags.size)];
        origin = self gettagorigin(tag);
        origin = getgroundposition(origin, 1);
        spawnlootitem(name, origin, undefined, 685, 0, 0);
    }
}

// Namespace loot / scripts\sp\loot
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1aea
// Size: 0x15c
function function_bea35dd59e0df4ac(var_fbbbe13e30496acb, var_d559b3e89af73e22) {
    if (isdefined(var_fbbbe13e30496acb) && !isarray(var_fbbbe13e30496acb)) {
        var_fbbbe13e30496acb = [var_fbbbe13e30496acb];
    }
    spawnpool = [];
    foreach (name, loottype in level.loot.types) {
        if (isdefined(var_fbbbe13e30496acb) && !array_contains(var_fbbbe13e30496acb, loottype.type)) {
            continue;
        }
        if (isdefined(level.loot.types[name].onspawnfunc)) {
            continue;
        }
        if (isdefined(self.loot) && istrue(self.loot[name])) {
            continue;
        }
        probabilityfunc = level.loot.types[name].probabilityfunc;
        if (isdefined(probabilityfunc)) {
            var_e0902db164af1b76 = self [[ probabilityfunc ]](name, self.origin);
            if (var_e0902db164af1b76) {
                spawnpool[spawnpool.size] = name;
            }
        }
    }
    if (isdefined(var_d559b3e89af73e22) && spawnpool.size == 0) {
        spawnpool = [var_d559b3e89af73e22];
    }
    return spawnpool;
}

// Namespace loot / scripts\sp\loot
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x1c4f
// Size: 0x198
function spawnlootitem(name, origin, angles, force, worldplaced, var_8fe6922025e77bea, usephysics) {
    if ((function_a6e152b655faae22(name) || function_468e6aa1f3ddb5c4(name)) && !playerarmorenabled()) {
        return;
    }
    if (!isdefined(angles)) {
        angles = randomvectorrange(0, 360);
        if (function_a6e152b655faae22(name)) {
            angles = (-90, angles[1], 0);
        }
    }
    if (!isdefined(force)) {
        force = 1;
    }
    if (isdefined(var_8fe6922025e77bea) && !isdefined(usephysics)) {
        usephysics = !var_8fe6922025e77bea;
    }
    spawnflags = scripts\sp\script_items::scriptitem_buildspawnflags(var_8fe6922025e77bea, usephysics, 1, 0, 1);
    model = level.loot.types[name].model;
    impulse = (randomfloat(0.5), randomfloat(0.5), 1) * force;
    item = spawnscriptitem("script_item_" + name, origin, angles, spawnflags, model, "", impulse, origin);
    item.script_count = self.script_count;
    item.script_count_min = self.script_count_min;
    item.script_count_max = self.script_count_max;
    if (!istrue(worldplaced)) {
        function_f3bb4f4911a1beb2("loot", "dropItem", item);
    }
    if (isdefined(item)) {
        setitemasloot(item, name, worldplaced);
        return item;
    }
}

// Namespace loot / scripts\sp\loot
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1def
// Size: 0x48
function setitemasloot(item, name, worldplaced) {
    item.name = name;
    item.worldplaced = worldplaced;
    item thread cleanuplootitemondelete();
    item thread checkforlootitemtrigger(name);
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e3f
// Size: 0x16
function itemworldplaced(item) {
    return item.worldplaced;
}

// Namespace loot / scripts\sp\loot
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e5e
// Size: 0x11
function cleanuplootitemondelete() {
    self waittill("death");
    function_2e32efd3d30633c3();
}

// Namespace loot / scripts\sp\loot
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e77
// Size: 0x2a
function function_2e32efd3d30633c3() {
    if (isdefined(self.cursor_hint_ent)) {
        self.cursor_hint_ent delete();
    }
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ea9
// Size: 0x118
function checkforlootitemtrigger(name) {
    self endon("death");
    while (true) {
        if (istrue(self.worldplaced) || level.loot.types[name].var_4607332cf8361a3) {
            function_d6a22d94bbd3c5c(name);
        } else {
            self waittill("trigger", who);
            if (who != level.player) {
                continue;
            }
        }
        waittillplayercanloot();
        waittillnextloottime();
        inactivefunc = level.loot.types[name].inactivefunc;
        if (isdefined(inactivefunc) && [[ inactivefunc ]](name)) {
            continue;
        }
        if (istrue(self.worldplaced) && isdefined(level.loot.var_73dd4fee363c8438)) {
            level.player playgestureviewmodel(level.loot.var_73dd4fee363c8438, self);
        }
        lootfuncandnotification(name);
        self delete();
    }
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1fc9
// Size: 0xc1
function function_d6a22d94bbd3c5c(name) {
    displayname = level.loot.types[name].loc;
    offset = level.loot.types[name].var_4eea72a373570008;
    self.var_2962af1b05702467 = 1;
    scripts\sp\player\cursor_hint::function_31a9edf082d398f5("cursorhint_lootpickup", displayname, undefined, offset);
    thread function_8b9cc449b9f5159d(name, displayname);
    while (true) {
        self.cursor_hint_ent waittill("trigger", who);
        if (who != level.player) {
            continue;
        }
        break;
    }
    scripts\sp\player\cursor_hint::remove_cursor_hint();
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2092
// Size: 0x9a
function function_512014a40727de4(name) {
    if (!isdefined(level.loot.types[name].weaponobj)) {
        weap = getoffhandweaponname(name);
        if (isdefined(weap)) {
            attachments = function_6527364c1ecca6c6(weap);
            if (istrue(attachments.size)) {
                weaponobj = makeweapon(weap, attachments);
            } else {
                weaponobj = makeweaponfromstring(weap);
            }
            level.loot.types[name].weaponobj = weaponobj;
        }
    }
}

// Namespace loot / scripts\sp\loot
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2134
// Size: 0x213
function function_8b9cc449b9f5159d(name, displayname) {
    self endon("hint_destroyed");
    self endon("death");
    self.cursor_hint_ent endon("death");
    if (level.loot.types[name].type == "Resource") {
        return;
    }
    currentammo = -1;
    while (true) {
        var_d5f6f287ac22711a = currentammo;
        if (function_66d13e39b09c4901(name)) {
            currentammo = level.player scripts\sp\player::getammonameamount(name);
        } else if (function_a6e152b655faae22(name) && !level.player scripts\sp\player::function_34895a6255f4587a()) {
            currentammo = level.player scripts\sp\player::getarmoramount();
        } else if (function_a6e152b655faae22(name)) {
            currentammo = level.player scripts\sp\player::function_85e373bb15921966();
        } else if (function_468e6aa1f3ddb5c4(name)) {
            currentammo = level.player scripts\sp\player::getarmoramount();
        } else if (function_f87039ba7ec40273(name)) {
            currentammo = -1;
        } else {
            currentammo = function_edf54aa6c57adb98(name);
        }
        if (currentammo != var_d5f6f287ac22711a) {
            if (function_66d13e39b09c4901(name)) {
                maxammo = level.player scripts\sp\player::getammonamemaxamount(name);
            } else if (function_a6e152b655faae22(name) && !level.player scripts\sp\player::function_34895a6255f4587a()) {
                maxammo = level.player scripts\sp\player::getarmormaxamount();
            } else if (function_a6e152b655faae22(name)) {
                maxammo = level.player scripts\sp\player::function_c241aeec324282f0();
            } else if (function_468e6aa1f3ddb5c4(name)) {
                maxammo = level.player scripts\sp\player::getarmormaxamount();
            } else {
                maxammo = function_57888d406854dc7f(name);
            }
            if (currentammo >= maxammo) {
                self.cursor_hint_ent sethintinoperable(1);
                self.cursor_hint_ent sethintstring(%EQUIPMENT/FULL);
            } else {
                self.cursor_hint_ent sethintinoperable(0);
                self.cursor_hint_ent sethintstring(displayname);
            }
        }
        waitframe();
    }
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x234f
// Size: 0x5e
function lootfuncandnotification(name) {
    self thread [[ level.loot.types[name].lootfunc ]](name);
    scripts\sp\analytics::analytics_event_upload("loot_pickup", name);
    level.player notify("item_loot");
    playlootsound(name);
    thread createnotification(name);
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23b5
// Size: 0x50
function playermaxarmor(name) {
    if (level.player scripts\sp\player::function_34895a6255f4587a()) {
        return level.player scripts\sp\player::function_83151236cdb3ce27();
    }
    return level.player scripts\sp\player::getarmoramount() >= level.player scripts\sp\player::getarmormaxamount();
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x240d
// Size: 0x1a
function function_a57539eb7fbc0627(name) {
    return level.player scripts\sp\player::hasmaxarmor();
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2430
// Size: 0x2c
function playermaxammo(name) {
    return level.player scripts\sp\player::getammonameamount(name) >= level.player scripts\sp\player::getammonamemaxamount(name);
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2465
// Size: 0xba
function inactiveoffhand(name) {
    weaponname = getoffhandweaponname(name);
    if (!isdefined(weaponname)) {
        assertmsg("offhand " + name + " does not have weapon associated.");
    }
    if (issharedfuncdefined("loot", "_isInactiveOffhand", 0)) {
        return level.player [[ getsharedfunc("loot", "_isInactiveOffhand") ]](name, weaponname);
    }
    if (!player_has_equipment(weaponname)) {
        var_99f4520333e40283 = scripts\sp\equipment\offhands::getweaponoffhandtype(weaponname);
        if (!player_offhand_empty(var_99f4520333e40283)) {
            return 1;
        }
    }
    currentammo = function_edf54aa6c57adb98(name);
    maxammo = function_57888d406854dc7f(name);
    return currentammo >= maxammo;
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2528
// Size: 0xc
function inactive(name) {
    return false;
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x253d
// Size: 0x48
function player_offhand_empty(var_99f4520333e40283) {
    offhand = level.player getcurrentoffhand(var_99f4520333e40283);
    if (!isdefined(offhand) || offhand.basename == "none") {
        return 1;
    }
    return 0;
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x258d
// Size: 0x76
function function_3fd5749f637651b7(weapon) {
    foreach (loot in level.loot.types) {
        if (is_equal(loot.weapon, weapon)) {
            return name;
        }
    }
    return undefined;
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x260c
// Size: 0x2a
function getoffhandprobabilityfromname(name) {
    return level.loot.types[name].chance;
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x263f
// Size: 0x2a
function getoffhandweaponname(name) {
    return level.loot.types[name].weapon;
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2672
// Size: 0x2a
function function_173c699830122e92(name) {
    return level.loot.types[name].weaponobj;
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x26a5
// Size: 0xd9
function function_edf54aa6c57adb98(name) {
    weaponname = getoffhandweaponname(name);
    if (issharedfuncdefined("loot", "_getOffhandCurrentAmmo", 0)) {
        return level.player [[ getsharedfunc("loot", "_getOffhandCurrentAmmo") ]](name, weaponname);
    }
    if (player_has_equipment(weaponname)) {
        var_70148ff25532a07f = level.player.offhandinventory;
        foreach (weapon in var_70148ff25532a07f) {
            if (weapon.basename == weaponname) {
                return level.player getweaponammostock(weapon);
            }
        }
    }
    return 0;
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2787
// Size: 0x66
function function_57888d406854dc7f(name) {
    if (isdefined(level.loot.types[name].maxammo)) {
        return level.loot.types[name].maxammo;
    }
    weaponname = getoffhandweaponname(name);
    return weaponmaxammo(weaponname);
}

// Namespace loot / scripts\sp\loot
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x27f6
// Size: 0x34
function function_138ce2f6a3e08e1b(name, maxammo) {
    level.loot.types[name].maxammo = maxammo;
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2832
// Size: 0x98
function lootammo(name) {
    itement = self;
    var_ea34e536b58878dd = scripts\sp\player::getammonameamount(name);
    maxammo = scripts\sp\player::getammonamemaxamount(name);
    var_fab97c83933f6b68 = getammolootamount(var_ea34e536b58878dd, maxammo);
    var_402cbd10005539a1 = int(min(maxammo, var_ea34e536b58878dd + var_fab97c83933f6b68));
    if (var_402cbd10005539a1 != var_ea34e536b58878dd) {
        level.player scripts\sp\player::setammonameamount(name, var_402cbd10005539a1);
        /#
            function_3a93ae15cef29091("<dev string:x1c>" + var_fab97c83933f6b68 + "<dev string:x26>" + name);
        #/
    }
}

// Namespace loot / scripts\sp\loot
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x28d2
// Size: 0x52
function getammolootamount(var_ea34e536b58878dd, maxammo) {
    var_d2fdb42a90d365d3 = math::normalize_value(0, maxammo, var_ea34e536b58878dd);
    var_4c92f7b0aac1631b = math::factor_value(0.5, 0.1, var_d2fdb42a90d365d3);
    return max(1, int(var_4c92f7b0aac1631b * maxammo));
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x292d
// Size: 0x77
function lootarmor(name) {
    itement = self;
    if (level.player scripts\sp\player::function_34895a6255f4587a()) {
        var_2239cff6841032dc = level.player scripts\sp\player::function_85e373bb15921966();
        level.player scripts\sp\player::function_e9e42cffedaa98d5(var_2239cff6841032dc + 1);
    } else {
        level.player notify("armor_pressed");
    }
    thread createnotification("armorplate");
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x29ac
// Size: 0x34
function function_c59ef2aeb9431494(name) {
    itement = self;
    level.player scripts\sp\player::give_player_max_armor();
    thread createnotification("armorvest");
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x29e8
// Size: 0x237
function lootoffhand(name) {
    itement = self;
    weaponname = getoffhandweaponname(name);
    if (!isdefined(weaponname)) {
        assertmsg("offhand " + name + " does not have weapon associated.");
    }
    if (issharedfuncdefined("loot", "_lootOffhand", 0)) {
        level.player [[ getsharedfunc("loot", "_lootOffhand") ]](name, weaponname);
        return;
    }
    if (player_has_equipment(weaponname, 1)) {
        var_70148ff25532a07f = level.player.offhandinventory;
        foreach (weapon in var_70148ff25532a07f) {
            if (isweapon(weapon)) {
                if (weapon.basename == weaponname) {
                    var_ea34e536b58878dd = level.player getweaponammostock(weapon);
                    maxammo = function_57888d406854dc7f(name);
                    var_402cbd10005539a1 = int(min(var_ea34e536b58878dd + 1, maxammo));
                    level.player setweaponammoclip(weapon, var_402cbd10005539a1);
                }
                continue;
            }
            if (isstring(weapon)) {
                if (weapon == weaponname) {
                    attachments = function_6527364c1ecca6c6(weapon);
                    if (istrue(attachments.size)) {
                        objweapon = makeweapon(weapon, attachments);
                        foreach (attachment in attachments) {
                            var_ea34e536b58878dd = level.player getweaponammostock(objweapon);
                            maxammo = function_57888d406854dc7f(name);
                            var_402cbd10005539a1 = int(min(var_ea34e536b58878dd + 1, maxammo));
                            level.player setweaponammoclip(objweapon, var_402cbd10005539a1);
                        }
                    }
                }
            }
        }
        return;
    }
    level.player give_offhand(weaponname, 1);
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c27
// Size: 0x67
function function_46d8e80e44e75a63(name) {
    level.player giveweapon(level.loot.types[name].var_3266c061a1fb4041);
    level.player switchtoweapon(level.loot.types[name].var_3266c061a1fb4041);
}

// Namespace loot / scripts\sp\loot
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2c96
// Size: 0xdd
function function_1693de8f478a2d4a(loot, lootfunc, inactivefunc, probabilityfunc, onspawnfunc, isarmor) {
    registerloot(loot, lootfunc, inactivefunc, probabilityfunc, onspawnfunc, isarmor);
    resourcetype = level.loot.types[loot.name_id].ammoname;
    level.loot.var_d0d7b34e9765980a[resourcetype] = level.player getplayerprogression("resource", resourcetype);
    /#
        if (getdvarint(@"hash_7dfe19d75d304409", 0)) {
            iprintlnbold("<dev string:x2a>" + resourcetype + "<dev string:x30>" + level.loot.var_d0d7b34e9765980a[resourcetype]);
        }
    #/
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d7b
// Size: 0x1ff
function function_987da1270586a39f(name) {
    itement = self;
    if (isdefined(level.var_f6e4c42c27f2040f)) {
        itement [[ level.var_f6e4c42c27f2040f ]](name);
        return;
    }
    resourcetype = level.loot.types[name].ammoname;
    if (!isstring(resourcetype)) {
        return;
    }
    var_e7ad591e8456a62 = 0;
    if (isdefined(itement.script_count) && int(itement.script_count) != 0) {
        var_e7ad591e8456a62 = int(itement.script_count);
    } else if (isdefined(itement.script_count_min) && isdefined(itement.script_count_max)) {
        var_e7ad591e8456a62 = int(math::lerp(int(itement.script_count_min), int(itement.script_count_max), randomfloat(1)));
    }
    var_d9441f71914be05d = 0;
    if (var_e7ad591e8456a62 != 0) {
        var_d9441f71914be05d = var_e7ad591e8456a62;
    } else {
        var_d9441f71914be05d = int(default_to(level.loot.types[name].var_d9441f71914be05d, 0));
    }
    if (var_d9441f71914be05d != 0) {
        if (!isdefined(level.loot.var_ed20cdd56dfeb988[resourcetype])) {
            level.loot.var_ed20cdd56dfeb988[resourcetype] = 0;
        }
        level.loot.var_ed20cdd56dfeb988[resourcetype] = level.loot.var_ed20cdd56dfeb988[resourcetype] + var_d9441f71914be05d;
        /#
            if (getdvarint(@"hash_7dfe19d75d304409", 0)) {
                iprintlnbold("<dev string:x2a>" + resourcetype + "<dev string:x30>" + level.loot.var_d0d7b34e9765980a[resourcetype] + level.loot.var_ed20cdd56dfeb988[resourcetype]);
            }
        #/
    }
}

// Namespace loot / scripts\sp\loot
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2f82
// Size: 0x113
function private function_2099b5b188b3a60c() {
    while (true) {
        level waittill("save_saved");
        foreach (resourcetype, var_6b4440c1be287114 in level.loot.var_ed20cdd56dfeb988) {
            banked = level.loot.var_d0d7b34e9765980a[resourcetype];
            var_6fcc2676d1564bd4 = banked + var_6b4440c1be287114;
            level.player setplayerprogression("resource", resourcetype, var_6fcc2676d1564bd4);
            level.loot.var_d0d7b34e9765980a[resourcetype] = var_6fcc2676d1564bd4;
            /#
                if (getdvarint(@"hash_7dfe19d75d304409", 0)) {
                    iprintlnbold("<dev string:x2a>" + resourcetype + "<dev string:x30>" + level.loot.var_d0d7b34e9765980a[resourcetype]);
                }
            #/
        }
        level.loot.var_ed20cdd56dfeb988 = [];
    }
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x309d
// Size: 0xb
function donothing(name) {
    
}

// Namespace loot / scripts\sp\loot
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x30b0
// Size: 0x144
function probabilityarmor(name, origin) {
    if (istrue(self.noarmor)) {
        /#
            function_3a93ae15cef29091("<dev string:x34>");
        #/
        return false;
    }
    if (force_armor_drop()) {
        /#
            function_3a93ae15cef29091("<dev string:x55>");
        #/
        return true;
    }
    if (isdefined(level.player.var_123f331e1ab4995a)) {
        if (!isdefined(level.player.var_8add256b2e4988e5)) {
            level.player.var_8add256b2e4988e5 = 0;
        }
        droparmor = randomfloat(1) < level.player.var_123f331e1ab4995a;
        if (!droparmor) {
            level.player.var_8add256b2e4988e5++;
            if (level.player.var_8add256b2e4988e5 >= 1 / level.player.var_123f331e1ab4995a) {
                droparmor = 1;
            }
        }
        if (droparmor) {
            /#
                function_3a93ae15cef29091("<dev string:x72>" + level.player.var_123f331e1ab4995a);
            #/
            level.player.var_8add256b2e4988e5 = 0;
            return true;
        }
    }
    return false;
}

// Namespace loot / scripts\sp\loot
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31fd
// Size: 0x36
function armorinventoryratio() {
    ratio = 1 - level.player scripts\sp\player::function_85e373bb15921966() / level.player scripts\sp\player::function_c241aeec324282f0();
    return 0.15 * ratio;
}

// Namespace loot / scripts\sp\loot
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x323c
// Size: 0x36
function armorhealthratio() {
    ratio = 1 - level.player scripts\sp\player::getarmoramount() / level.player scripts\sp\player::getarmormaxamount();
    return 0.1 * ratio;
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x327b
// Size: 0x33
function armordistanceratio(distancesq) {
    constant = 1 / 2250000;
    ratio = constant * distancesq;
    return 0.75 * ratio;
}

// Namespace loot / scripts\sp\loot
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32b7
// Size: 0x3d
function armormaxprobability() {
    ratio = min(level.loot.armordroptimer / 120, 1);
    var_fd98ff1546f7c620 = 82 * ratio;
    return 3 + var_fd98ff1546f7c620;
}

// Namespace loot / scripts\sp\loot
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x32fd
// Size: 0x14
function probabilityzero(name, origin) {
    return false;
}

// Namespace loot / scripts\sp\loot
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x331a
// Size: 0x66
function get_stowed_primary_weapon() {
    foreach (weapon in self.primaryinventory) {
        if (!issameweapon(weapon, self.currentprimaryweapon, 1)) {
            return weapon;
        }
    }
    return nullweapon();
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3389
// Size: 0x95
function function_f9020ea5cfe8cde6(name) {
    var_59e7b247980174be = 0;
    foreach (item in level.loot.items) {
        if ((!isdefined(name) || is_equal(item.name, name)) && !itemworldplaced(item)) {
            var_59e7b247980174be++;
        }
    }
    return var_59e7b247980174be;
}

// Namespace loot / scripts\sp\loot
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3427
// Size: 0x13b
function probabilityoffhand(name, origin) {
    weaponname = getoffhandweaponname(name);
    if (!isdefined(weaponname)) {
        assertmsg("offhand " + name + " does not have weapon associated.");
    }
    if (!array_contains(level.loot.offhands, weaponname)) {
        return false;
    }
    if (!scripts\sp\equipment\offhands::offhandisprecached(name)) {
        return false;
    }
    distancesq = distancesquared(origin, level.player.origin);
    if (distancesq > 2250000) {
        return false;
    }
    var_71d884e0e60ac631 = getoffhandprobabilityfromname(name);
    if (var_71d884e0e60ac631 == 0) {
        return false;
    }
    currentammo = function_edf54aa6c57adb98(name);
    maxammo = function_57888d406854dc7f(name);
    if (currentammo >= maxammo) {
        chance = 0;
    } else {
        chance = var_71d884e0e60ac631 * (1 - currentammo / maxammo);
    }
    if (randomint(100) > chance) {
        return false;
    }
    var_59e7b247980174be = function_f9020ea5cfe8cde6(name);
    var_27372c85ed16c136 = var_59e7b247980174be + currentammo >= maxammo;
    if (!var_27372c85ed16c136) {
        return true;
    }
    return false;
}

// Namespace loot / scripts\sp\loot
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x356b
// Size: 0x143
function function_6bc788ba92068527(name, origin) {
    weaponname = getoffhandweaponname(name);
    if (!isdefined(weaponname)) {
        assertmsg("offhand " + name + " does not have weapon associated.");
    }
    if (!isdefined(level.loot.var_2aa4852ad9e76ff5) || !isdefined(level.loot.var_2aa4852ad9e76ff5[weaponname])) {
        return false;
    }
    if (!scripts\sp\equipment\offhands::offhandisprecached(weaponname)) {
        return false;
    }
    distancesq = distancesquared(origin, level.player.origin);
    if (distancesq > 2250000) {
        return false;
    }
    var_71d884e0e60ac631 = getoffhandprobabilityfromname(name);
    if (var_71d884e0e60ac631 <= 0) {
        return false;
    }
    if (!isdefined(level.var_b3db93fc6e8c7f63)) {
        return false;
    }
    if (!isdefined(level.var_b3db93fc6e8c7f63[weaponname])) {
        return false;
    }
    currentammo = function_edf54aa6c57adb98(name);
    maxammo = function_57888d406854dc7f(name);
    if (currentammo >= maxammo) {
        return false;
    }
    chance = var_71d884e0e60ac631 * (1 - currentammo / maxammo);
    if (randomint(100) > chance) {
        return false;
    }
    return true;
}

// Namespace loot / scripts\sp\loot
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36b7
// Size: 0x17
function waittillplayercanloot() {
    while (level.player ismeleeing()) {
        waitframe();
    }
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x36d6
// Size: 0x97
function playlootsound(name) {
    if (isdefined(level.loot.types[name].sound) && soundexists(level.loot.types[name].sound)) {
        level.loot.sfx delaycall(0.2, &playsound, level.loot.types[name].sound);
    }
}

// Namespace loot / scripts\sp\loot
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3775
// Size: 0x24f
function createnotification(name, var_1f0318ca2d6c648e) {
    var_5aa9371cace38e = isdefined(name);
    if (!var_5aa9371cace38e) {
        return;
    }
    var_4bc0473b682cddc5 = isdefined(level.loot.types[name]);
    if (!var_4bc0473b682cddc5) {
        foreach (loottype in level.loot.types) {
            if (isdefined(loottype.weapon) && getweaponbasename(loottype.weapon) == name) {
                name = lootname;
                var_5aa9371cace38e = 1;
                var_4bc0473b682cddc5 = 1;
                break;
            }
        }
    }
    if (!var_4bc0473b682cddc5) {
        return;
    }
    var_123e4d1200db4491 = istrue(level.loot.types[name].createnotification);
    if (!var_123e4d1200db4491) {
        return;
    }
    var_3e30fdc227f6e37c = !in_realism_mode() || istrue(var_1f0318ca2d6c648e);
    if (var_3e30fdc227f6e37c) {
        if (isdefined(level.loot.var_4152cb04c4c34a6)) {
            if (!level.player namespace_373fee410d5055ba::function_ada0825249682644("loot_splash_display")) {
                level.player namespace_373fee410d5055ba::function_90de31b2cbef19f9("loot_splash_display", level.loot.var_4152cb04c4c34a6);
                level.player namespace_373fee410d5055ba::function_f4c37324750dc183("loot_splash_display", 0, -225, 2, 2);
            }
            level.player namespace_373fee410d5055ba::function_6e45b720d0914f42("loot_splash_display", "ui_loot_splash_index", level.loot.types[name].index);
        } else {
            shader = level.loot.types[name].shader;
            locname = level.loot.types[name].loc;
            setomnvar("ui_loot_splash_name", locname);
            setomnvar("ui_loot_splash_icon", shader);
        }
        waitframe();
        destroylootnotification();
    }
}

// Namespace loot / scripts\sp\loot
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39cc
// Size: 0x74
function waittillnextloottime() {
    currenttime = gettime();
    goaltime = level.loot.lastloottime + 250;
    if (currenttime > goaltime) {
        level.loot.lastloottime = currenttime;
        return;
    }
    level.loot.lastloottime = goaltime;
    while (gettime() < goaltime) {
        waitframe();
    }
}

// Namespace loot / scripts\sp\loot
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a48
// Size: 0x57
function destroylootnotification() {
    if (isdefined(level.loot.var_4152cb04c4c34a6)) {
        level.player namespace_373fee410d5055ba::function_6e45b720d0914f42("loot_splash_display", "ui_loot_splash_index", 0);
        return;
    }
    setomnvar("ui_loot_splash_name", "none");
    setomnvar("ui_loot_splash_icon", "none");
}

// Namespace loot / scripts\sp\loot
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3aa7
// Size: 0x118
function setworldloot() {
    waittillframeend();
    foreach (struct in getstructarray("lootSpawn", "targetname")) {
        isrefloot = struct isrefloot();
        if (!isdefined(struct.script_noteworthy)) {
            if (!isrefloot) {
                struct thread worldLootWaitProximity();
            }
            continue;
        }
        /#
            if (!isdefined(level.loot.types[struct.script_noteworthy])) {
                iprintlnbold("<dev string:x9b>" + struct.script_noteworthy + "<dev string:xc1>" + struct.origin + "<dev string:xc8>");
                continue;
            }
        #/
        if (!isrefloot) {
            struct spawnlootitem(struct.script_noteworthy, struct.origin, struct.angles, 0, 1, istrue(struct.script_suspend));
        }
    }
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3bc7
// Size: 0x1a5
function private worldLootWaitProximity(radius) {
    self notify("worldLootWaitProximity");
    self endon("worldLootWaitProximity");
    radius = default_to(radius, 1000);
    radiussq = squared(radius);
    while (isdefined(self)) {
        wait randomfloatrange(0.5, 1);
        if (!isdefined(self)) {
            return;
        }
        foreach (player in level.players) {
            if (distancesquared(player.origin, self.origin) < radiussq) {
                spawnpool = function_bea35dd59e0df4ac("Offhand", "frag");
                if (spawnpool.size > 0) {
                    self.script_noteworthy = spawnpool[randomintrange(0, spawnpool.size)];
                }
                if (!isdefined(self.script_noteworthy)) {
                    return;
                }
                itement = spawnlootitem(self.script_noteworthy, self.origin, self.angles, 0, 1, istrue(self.script_suspend));
                if (istrue(level.loot.var_307d8c71918f2204)) {
                    if (!isdefined(self.spawned_items)) {
                        self.spawned_items = [];
                    }
                    self.spawned_items[itement getentitynumber()] = itement;
                    level.loot.var_8da39343ac7feaf3[level.loot.var_8da39343ac7feaf3.size] = self;
                }
                return;
            }
        }
    }
}

// Namespace loot / scripts\sp\loot
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3d74
// Size: 0xdd
function private function_cdd633dcd334b643() {
    foreach (lootstruct in level.loot.var_8da39343ac7feaf3) {
        if (isdefined(lootstruct.spawned_items) && lootstruct.spawned_items.size > 0) {
            foreach (itement in lootstruct.spawned_items) {
                itement function_2e32efd3d30633c3();
            }
            lootstruct.spawned_items = undefined;
            lootstruct thread worldLootWaitProximity();
        }
    }
}

// Namespace loot / scripts\sp\loot
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3e59
// Size: 0x19
function private function_62cab66e6e85f19a() {
    while (true) {
        level waittill("save_loaded");
        function_cdd633dcd334b643();
    }
}

// Namespace loot / scripts\sp\loot
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e7a
// Size: 0x27
function isrefloot() {
    if (isdefined(self.spawnflags) && self.spawnflags & 1) {
        return 1;
    }
    return 0;
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ea9
// Size: 0x25
function function_66d13e39b09c4901(name) {
    return array_contains(level.loot.ammo_types, name);
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ed7
// Size: 0x21
function function_a6e152b655faae22(name) {
    return is_equal(tolower("armorplate"), tolower(name));
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f01
// Size: 0x21
function function_468e6aa1f3ddb5c4(name) {
    return is_equal(tolower("armorvest"), tolower(name));
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f2b
// Size: 0x30
function function_f87039ba7ec40273(name) {
    return level.loot.types[name].type == "PrimaryWeapon";
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f64
// Size: 0xad
function createpickupicon(shader) {
    self endon("death");
    self endon("entitydeleted");
    while (distancesquared(level.player.origin, self.origin) > 2250000) {
        waitframe();
    }
    target_alloc(self, (0, 0, 10));
    target_drawsquare(self);
    target_drawsingle(self);
    target_setcolor(self, (1, 1, 1), 0);
    target_setscaledrendermode(self, 0);
    target_showtoplayer(self, level.player);
    target_setshader(self, shader);
    target_flush(self);
    childthread updatepickupicon();
}

// Namespace loot / scripts\sp\loot
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4019
// Size: 0x1c1
function updatepickupicon() {
    self.alpha = 0;
    self.iconsize = 0;
    spawntime = gettime();
    while (true) {
        distance = distance(level.player.origin, self.origin);
        var_955695d3f4bc112 = gettime() < spawntime + 2150;
        var_8161c1bf99ddcfc4 = isalive(level.player) && level.player scripts\engine\trace::can_see_origin(self.origin + (0, 0, 10), 0);
        if (var_955695d3f4bc112 || var_8161c1bf99ddcfc4) {
            var_1adee2fdd285aaf8 = 1 - math::normalize_value(0, 1000, distance);
            var_889a9abd01db332 = var_1adee2fdd285aaf8 * 1.25;
        } else {
            var_889a9abd01db332 = 0;
        }
        if (var_889a9abd01db332 != self.alpha) {
            var_dc159c0cf90e1f51 = clamp((var_889a9abd01db332 - self.alpha) * 0.45, -0.125, 0.125);
            var_e1fa213d78fa2a9b = self.alpha + var_dc159c0cf90e1f51;
            target_setcolor(self, (1, 1, 1), var_e1fa213d78fa2a9b);
            self.alpha = var_e1fa213d78fa2a9b;
        }
        var_edbdb7b149a0b4bd = math::normalize_value(100, 1000, distance);
        iconsize = int(math::factor_value(32, 8, var_edbdb7b149a0b4bd) * 1);
        if (iconsize != self.iconsize) {
            target_setminsize(self, iconsize, 0);
            target_setmaxsize(self, iconsize, 0);
            self.iconsize = iconsize;
        }
        waitframe();
    }
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x41e2
// Size: 0x74
function indonotspawnlootvolume(entity) {
    var_788dc5c5a040cc11 = getentarray("doNotSpawnLoot", "targetname");
    foreach (volume in var_788dc5c5a040cc11) {
        if (entity istouching(volume)) {
            return true;
        }
    }
    return false;
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x425f
// Size: 0x11e
function has_weapon(weapon) {
    primaryoffhand = self getoffhandprimaryclass();
    secondaryoffhand = self getoffhandsecondaryclass();
    if (isstring(weapon)) {
        all_weapons = self getweaponslistall();
        foreach (item in all_weapons) {
            if (isnullweapon(item)) {
                continue;
            }
            if (weapontype(item) == "grenade" && !is_equal(item.basename, primaryoffhand) && !is_equal(item.basename, secondaryoffhand)) {
                if (item.basename != "smoke_empty") {
                    continue;
                }
            }
            if (is_equal(item.basename, weapon)) {
                return 1;
            }
        }
        return 0;
    }
    assert(isweapon(weapon));
    return self hasweapon(weapon);
}

// Namespace loot / scripts\sp\loot
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4385
// Size: 0x15
function set_force_armor_drop(boolean) {
    self.lootforcearmordrop = boolean;
}

// Namespace loot / scripts\sp\loot
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x43a2
// Size: 0xc
function force_armor_drop() {
    return istrue(self.lootforcearmordrop);
}

/#

    // Namespace loot / scripts\sp\loot
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x43b7
    // Size: 0x1e
    function function_3a93ae15cef29091(string) {
        if (function_a7b3dd243b231737()) {
            iprintln(string);
        }
    }

    // Namespace loot / scripts\sp\loot
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x43dd
    // Size: 0xd
    function function_3c821aac4af727f3() {
        thread function_cd2e7283c864308a();
    }

    // Namespace loot / scripts\sp\loot
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x43f2
    // Size: 0x15a
    function function_cd2e7283c864308a() {
        while (true) {
            if (!function_a7b3dd243b231737()) {
                waitframe();
                continue;
            }
            if (isdefined(level.loot.items)) {
                foreach (item in level.loot.items) {
                    line(item.origin, item.origin + (0, 0, 120), (0, 0, 1), 1, 0, 1);
                    print3d(item.origin, item.name, (0, 0, 1), 1, 0.5, 1);
                    if (function_a6e152b655faae22(item.name)) {
                        if (itemworldplaced(item)) {
                            sphere(item.origin, 15, (0, 0, 1), 0, 1);
                            continue;
                        }
                        sphere(item.origin, 15, (0, 1, 0), 0, 1);
                    }
                }
            }
            waitframe();
        }
    }

    // Namespace loot / scripts\sp\loot
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x4554
    // Size: 0x14
    function function_a7b3dd243b231737() {
        return getdvarint(@"hash_7dfe19d75d304409");
    }

#/
