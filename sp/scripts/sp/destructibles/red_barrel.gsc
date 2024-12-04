#using scripts\common\utility;
#using scripts\engine\sp\utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\sp\destructibles\barrel_common;
#using scripts\sp\equipment\molotov;
#using scripts\sp\loot;
#using scripts\sp\player\cursor_hint;
#using scripts\sp\utility;

#namespace red_barrel;

// Namespace red_barrel / scripts\sp\destructibles\red_barrel
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36f
// Size: 0xdb
function red_barrel_init() {
    level.g_effect["barrel_flame_top"] = loadfx("vfx/iw7/levels/moon/scripted/scriptables/oxygen_tank/vfx_oxygen_tank_spewing_flames.vfx");
    level.g_effect["barrel_flame_small"] = loadfx("vfx/iw8/prop/scriptables/vfx_dest_barrel_fire_sm.vfx");
    level.g_effect["barrel_explosion"] = loadfx("vfx/iw8/prop/scriptables/vfx_red_barrel_exp.vfx");
    level.g_effect["barrel_fire"] = loadfx("vfx/iw8/prop/scriptables/vfx_dest_barrel_fire.vfx");
    barrels = getallredbarrels();
    foreach (barrel in barrels) {
        if (barrel is_molotov_barrel()) {
            barrel thread moltovrefillthink();
            continue;
        }
        barrel thread red_barrel();
    }
}

// Namespace red_barrel / scripts\sp\destructibles\red_barrel
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x452
// Size: 0x3cb
function red_barrel() {
    self endon("barrel_death");
    self endon("barrel_delete");
    barrel_setup("red", 450, 250, 9100, 15000, 80, 28);
    thread red_barrel_death();
    var_db7ee9acb96d930d = 999999999;
    timer = 4;
    var_ee5bbd38e4289372 = 0;
    self.health = 9450;
    damageattacker = undefined;
    while (true) {
        self waittill("damage", amount, attacker, direction_vec, point, type, modelname, tagname, partname, dflags, objweapon);
        if (!isvalidbarreldamage(attacker, type)) {
            self.health += amount;
            continue;
        }
        damageattacker = attacker;
        self.barrel_health = self.health - 9000;
        if (barrelshouldexplode(attacker, point, type, objweapon)) {
            break;
        }
        if (self.barrel_health <= 449) {
            if (!var_ee5bbd38e4289372) {
                if (soundexists("o2_barrel_fire")) {
                    thread play_loop_sound_on_entity("o2_barrel_fire");
                }
                playfxontag(level.g_effect["barrel_fire"], self, "tag_origin");
                if (hastag(self.model, "tag_valve")) {
                    playfxontag(level.g_effect["barrel_flame_top"], self, "tag_valve");
                } else {
                    playfxontag(level.g_effect["barrel_flame_top"], self, "tag_origin");
                }
                badplace_cylinder("barrel_badplace_" + self getentitynumber(), 0, self.origin, 128, 128, "bad_guys");
                var_ee5bbd38e4289372 = 1;
                self.onfire = 1;
            }
            var_8e933dd18ca0781e = self.barrel_health / 449;
            timepassed = (gettime() - var_db7ee9acb96d930d) / 1000;
            if (4 * var_8e933dd18ca0781e < timer - timepassed) {
                timer = 4 * var_8e933dd18ca0781e;
                thread barrel_fusetimer(timer);
                var_db7ee9acb96d930d = gettime();
            }
        }
        if (isdefined(direction_vec)) {
            velocity = length(direction_vec);
            if (velocity > 20) {
                normalvec = vectornormalize(direction_vec);
                launchvelocity = 20;
                if (isdefined(type) && type == "MOD_IMPACT") {
                    launchvelocity = 3;
                }
                direction_vec = normalvec * launchvelocity;
            }
            self physicslaunchserver(point, direction_vec * 1000);
        }
        if (!isdefined(type)) {
            continue;
        }
        stringarray = strtok(type, "_");
        if (!array_contains(stringarray, "BULLET")) {
            continue;
        }
        tag = spawn_tag_origin(point);
        vec = vectornormalize(self.origin - point);
        tagangles = vectortoangles(vec * -1);
        tag.angles = flat_angle(tagangles);
        tag linkto(self);
        if (soundexists("o2_barrel_hiss_loop")) {
            tag thread play_loop_sound_on_entity("o2_barrel_hiss_loop");
        }
        playfxontag(level.g_effect["barrel_flame_small"], tag, "tag_origin");
        self.spewtags = array_add(self.spewtags, tag);
    }
    while (isdefined(self.dont_explode)) {
        waitframe();
    }
    self notify("barrel_death", damageattacker);
}

// Namespace red_barrel / scripts\sp\destructibles\red_barrel
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x825
// Size: 0x60
function barrelshouldexplode(attacker, point, type, objweapon) {
    if (self.barrel_health <= 0) {
        return true;
    }
    if (isgrenadeinrange(point, type, 80)) {
        return true;
    }
    if (isdirectunderbarrelhit(type)) {
        return true;
    }
    if (isplayersniperhit(attacker, objweapon)) {
        return true;
    }
    return false;
}

// Namespace red_barrel / scripts\sp\destructibles\red_barrel
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x88e
// Size: 0x70e
function red_barrel_death() {
    self endon("barrel_delete");
    self waittill("barrel_death", damageattacker);
    if (soundexists("o2_barrel_fire") && isdefined(self.onfire) && self.onfire) {
        self notify("stop sound" + "o2_barrel_fire");
    }
    physicsexplosionsphere(self.origin, self.phys_barrel_radius, 0, 2);
    earthquake(0.5, 0.8, self.origin, 400);
    thread barrel_block_gesture(200, self.origin);
    var_ce4b47e2a63b34d2 = 0.3;
    barrels = sortbydistance(level.phys_barrels, self.origin);
    foreach (barrel in barrels) {
        if (barrel == self) {
            continue;
        }
        var_d062fa74a20c4a2 = distance(self.origin, barrel.origin);
        if (var_d062fa74a20c4a2 > self.phys_barrel_radius) {
            continue;
        }
        distcheck = self.phys_barrel_radius - var_d062fa74a20c4a2;
        var_b8b40b55178cc735 = distcheck / self.phys_barrel_radius;
        timer = var_ce4b47e2a63b34d2 * var_b8b40b55178cc735;
        if (var_d062fa74a20c4a2 <= self.phys_barrel_radius) {
            barrel thread barrel_launch(self.origin, var_d062fa74a20c4a2, timer);
        }
        if (var_d062fa74a20c4a2 <= 200) {
            barrel thread red_barrel_hit(self.origin, var_d062fa74a20c4a2, timer);
        }
    }
    var_6e1c70af84b1ad5 = getvehiclearray();
    foreach (veh in var_6e1c70af84b1ad5) {
        damage = 400;
        var_f5d54f342fb4a774 = 370;
        if (isdefined(veh.script_team) && veh.script_team == "allies") {
            continue;
        }
        var_3a18862e89749191 = distance(self.origin, veh.origin);
        var_3a18862e89749191 = 0;
        if (var_3a18862e89749191 <= 19000) {
            var_b8b40b55178cc735 = var_3a18862e89749191 / 190 * 100;
            damage -= var_b8b40b55178cc735 * var_f5d54f342fb4a774;
            if (getdvarint(@"barrel_debug")) {
                iprintln("BARREL DID " + damage + " TO VEH");
            }
            veh do_damage(damage, self.origin, self, self, "MOD_EXPLOSIVE");
        }
    }
    var_e5cff7e645b201da = getaiarray();
    foreach (ai in var_e5cff7e645b201da) {
        if (!istrue(ai.magic_bullet_shield)) {
            var_e5cff7e645b201da = array_remove(var_e5cff7e645b201da, ai);
        }
    }
    var_8dc6959569591d12 = sphere_trace_get_all_results(self.origin, self.origin, 190, var_e5cff7e645b201da, create_character_contents(), 0);
    var_88e03175e378817 = 0;
    foreach (spheretrace in var_8dc6959569591d12) {
        var_45199aba739285ee = spheretrace["fraction"];
        if (isdefined(var_45199aba739285ee) && var_45199aba739285ee != 1) {
            var_88d60d21e004eadf = spheretrace["entity"];
            if (isai(var_88d60d21e004eadf)) {
                var_88e03175e378817++;
                var_c1e36d012dad1782 = is_equal(var_88d60d21e004eadf.subclass, "juggernaut");
                var_d535b42fe89413d7 = ter_op(var_c1e36d012dad1782 == 1, 1000, var_88d60d21e004eadf.health + 999999);
                if (!var_c1e36d012dad1782 && randomint(100) < 0) {
                    thread scripts\sp\equipment\molotov::molotovburnenemy(var_88d60d21e004eadf, 1, self.origin);
                    continue;
                }
                if (!var_c1e36d012dad1782 && isdefined(level.aigibfunction)) {
                    if (isdefined(damageattacker)) {
                        damageattacker delaythread(0.15, level.aigibfunction, var_88d60d21e004eadf, self.origin, "MOD_EXPLOSIVE");
                    } else {
                        delaythread(0.15, level.aigibfunction, var_88d60d21e004eadf, self.origin, "MOD_EXPLOSIVE");
                    }
                    continue;
                }
                var_88d60d21e004eadf do_damage(var_d535b42fe89413d7, self.origin, self, self, "MOD_EXPLOSIVE");
            }
        }
    }
    var_2d58e8aae155cc83 = distance(self.origin, level.player.origin);
    if (var_2d58e8aae155cc83 <= 200) {
        var_b8b40b55178cc735 = var_2d58e8aae155cc83 / 200;
        var_f5d54f342fb4a774 = 420;
        damage = 420 - var_b8b40b55178cc735 * var_f5d54f342fb4a774;
        if (getdvarint(@"barrel_debug")) {
            iprintln("BARREL DID " + damage + " TO PLAYER");
        }
        level.player do_damage(damage, self.origin, self, self, "MOD_EXPLOSIVE");
    }
    level notify("red_barrel_explosion", self, var_88e03175e378817);
    radiusdamage(self.origin, 2, 1, 0, self);
    badplace_delete("barrel_badplace_" + self getentitynumber());
    if (isdefined(self)) {
        self hide();
    }
    waitframe();
    if (soundexists("o2_barrel_explode")) {
        thread play_sound_in_space("o2_barrel_explode", self.origin);
    }
    playfx(level.g_effect["barrel_explosion"], self.origin);
    foreach (element in self.spewtags) {
        killfxontag(level.g_effect["barrel_flame_small"], element, "tag_origin");
        waitframe();
        if (isdefined(element)) {
            element delete();
        }
    }
    killfxontag(level.g_effect["barrel_fire"], self, "tag_origin");
    if (hastag(self.model, "tag_valve")) {
        killfxontag(level.g_effect["barrel_flame_top"], self, "tag_valve");
    } else {
        killfxontag(level.g_effect["barrel_flame_top"], self, "tag_origin");
    }
    waitframe();
    if (isdefined(self)) {
        thread delay_delete(5);
    }
}

// Namespace red_barrel / scripts\sp\destructibles\red_barrel
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfa4
// Size: 0x19
function delay_delete(time) {
    wait time;
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace red_barrel / scripts\sp\destructibles\red_barrel
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xfc5
// Size: 0xb8
function red_barrel_hit(var_f3b898b4c1762e04, var_d062fa74a20c4a2, timer) {
    self endon("barrel_death");
    self endon("barrel_delete");
    wait timer;
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(self.onfire)) {
        return;
    }
    maxdamage = 95;
    maxrange = 200;
    if (var_d062fa74a20c4a2 <= 90) {
        var_2b308f611603de0 = -878;
        damagemodifier = (90 - var_d062fa74a20c4a2) / maxrange;
        damage = 1 + damagemodifier * var_2b308f611603de0;
    } else {
        damagemodifier = (maxrange - var_d062fa74a20c4a2) / maxrange;
        damage = damagemodifier * maxdamage;
    }
    self notify("damage", damage, undefined, undefined, undefined, "MOD_EXPLOSIVE", undefined, undefined, undefined, undefined, undefined);
}

// Namespace red_barrel / scripts\sp\destructibles\red_barrel
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1085
// Size: 0x105
function moltovrefillthink() {
    self.molotovs = getentarray(self.target, "targetname");
    thread createmoltovinteractwhenavailable();
    while (true) {
        result = waittill_any_return_no_endon_death("trigger", "barrel_death", "death");
        if (result == "trigger") {
            self.interactable = 0;
            molotovrefilltriggerthink();
            if (level.player getammocount("molotov") == weaponmaxammo("molotov")) {
                removeallmolotovinteractsuntilavailable();
            }
        } else {
            removemoltovinteract();
            foreach (molotov in self.molotovs) {
                if (isdefined(molotov)) {
                    molotov delete();
                }
            }
            break;
        }
        if (self.molotovs.size == 0) {
            break;
        }
    }
}

// Namespace red_barrel / scripts\sp\destructibles\red_barrel
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1192
// Size: 0x78
function removeallmolotovinteractsuntilavailable() {
    barrels = getentarray("phys_barrel_destructible", "targetname");
    foreach (barrel in barrels) {
        if (barrel is_molotov_barrel()) {
            barrel removemoltovinteract();
            barrel thread createmoltovinteractwhenavailable();
        }
    }
}

// Namespace red_barrel / scripts\sp\destructibles\red_barrel
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1212
// Size: 0x5b
function createmoltovinteract() {
    if (isdefined(self.interactable) && self.interactable) {
        return;
    }
    if (self.molotovs.size == 0) {
        return;
    }
    scripts\sp\player\cursor_hint::create_cursor_hint(undefined, (0, 0, 50), %WEAPON/LABEL_MOLOTOV, 55, 400, 55, 1);
    self.interactable = 1;
}

// Namespace red_barrel / scripts\sp\destructibles\red_barrel
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1275
// Size: 0x2f
function removemoltovinteract() {
    if (!isdefined(self.interactable) || !self.interactable) {
        return;
    }
    scripts\sp\player\cursor_hint::remove_cursor_hint();
    self.interactable = 0;
}

// Namespace red_barrel / scripts\sp\destructibles\red_barrel
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12ac
// Size: 0x7b
function createmoltovinteractwhenavailable() {
    self notify("wait_for_interact_available");
    self endon("trigger");
    self endon("barrel_death");
    self endon("wait_for_interact_available");
    self endon("death");
    wait 0.05;
    maxammo = weaponmaxammo("molotov");
    while (true) {
        if (level.player getammocount("molotov") < maxammo && !ishidden()) {
            break;
        }
        wait 0.1;
    }
    createmoltovinteract();
}

// Namespace red_barrel / scripts\sp\destructibles\red_barrel
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x132f
// Size: 0x20
function ishidden() {
    if (isdefined(self.hidden) && self.hidden) {
        return true;
    }
    return false;
}

// Namespace red_barrel / scripts\sp\destructibles\red_barrel
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1358
// Size: 0x92
function molotov_refill_hide() {
    if (!is_molotov_barrel()) {
        return;
    }
    if (ishidden()) {
        return;
    }
    var_bf9aa2d910c15a49 = array_add(self.molotovs, self);
    foreach (part in var_bf9aa2d910c15a49) {
        part hide();
        part notsolid();
    }
    removemoltovinteract();
    self.hidden = 1;
}

// Namespace red_barrel / scripts\sp\destructibles\red_barrel
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13f2
// Size: 0x91
function molotov_refill_show() {
    if (!is_molotov_barrel()) {
        return;
    }
    if (!ishidden()) {
        return;
    }
    var_c84bbeea8480929a = array_add(self.molotovs, self);
    foreach (part in var_c84bbeea8480929a) {
        part show();
        part solid();
    }
    createmoltovinteractwhenavailable();
    self.hidden = 0;
}

// Namespace red_barrel / scripts\sp\destructibles\red_barrel
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x148b
// Size: 0x26
function is_molotov_barrel() {
    if (isdefined(self.script_parameters) && self.script_parameters == "molotov_refill") {
        return true;
    }
    return false;
}

// Namespace red_barrel / scripts\sp\destructibles\red_barrel
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14ba
// Size: 0x110
function molotovrefilltriggerthink() {
    offhands = level.player getweaponslistoffhands();
    if (!playerhasmolotovs(offhands)) {
        level.player give_offhand("molotov");
        level.player setweaponammoclip("molotov", 0);
    }
    maxammo = weaponmaxammo("molotov");
    var_5611c229f1727458 = maxammo - level.player getammocount("molotov");
    var_6f2acdb75545077a = min(self.molotovs.size, var_5611c229f1727458);
    for (i = 0; i < var_6f2acdb75545077a; i++) {
        lootoffhandhack();
        self.molotovs[self.molotovs.size - 1] delete();
        self.molotovs = array_remove(self.molotovs, self.molotovs[self.molotovs.size - 1]);
        wait 0.2;
    }
}

// Namespace red_barrel / scripts\sp\destructibles\red_barrel
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15d2
// Size: 0x64
function playerhasmolotovs(offhands) {
    foreach (offhand in offhands) {
        if (offhand.basename == "molotov") {
            return true;
        }
    }
    return false;
}

// Namespace red_barrel / scripts\sp\destructibles\red_barrel
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x163f
// Size: 0x11
function getallredbarrels() {
    return getentarray("phys_barrel_destructible", "targetname");
}

// Namespace red_barrel / scripts\sp\destructibles\red_barrel
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1659
// Size: 0x72
function lootoffhandhack() {
    lootname = "Molotov";
    level.player thread [[ level.loot.types[lootname].lootfunc ]](lootname);
    scripts\sp\loot::playlootsound(lootname);
    if (level.loot.types[lootname].createnotification) {
        thread scripts\sp\loot::createnotification(lootname);
    }
}

