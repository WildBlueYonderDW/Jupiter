#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\sp\equipment\frag.gsc;
#using scripts\sp\equipment\flash.gsc;
#using scripts\sp\equipment\molotov.gsc;
#using scripts\sp\equipment\ied.gsc;
#using scripts\sp\equipment\noisemaker.gsc;
#using scripts\sp\equipment\semtex.gsc;
#using scripts\sp\equipment\c4.gsc;
#using scripts\sp\equipment\throwingknife.gsc;
#using scripts\sp\equipment\smoke.gsc;
#using script_2f729d292deb59e3;
#using scripts\sp\equipment\teargas.gsc;
#using scripts\sp\equipment\signal.gsc;
#using scripts\sp\equipment\pipebomb.gsc;
#using script_92e849e55f32d10;
#using script_e429028f9c1c965;
#using script_7616c0dce807052a;
#using script_692d49ec3459ce99;
#using script_272536687f66dc7;
#using script_5122bbc6a49b9100;
#using script_439bf3b4dec079cb;
#using script_342e089c0ec30948;
#using script_6492c24b29be0b38;
#using script_624b16e62718d18a;
#using script_77475f5ff211f11;
#using script_5ad0b736adc3b105;
#using scripts\sp\analytics.gsc;
#using scripts\sp\player\cursor_hint.gsc;
#using scripts\sp\loot.gsc;

#namespace offhands;

// Namespace offhands / scripts\sp\equipment\offhands
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d5
// Size: 0x90
function init() {
    if (isdefined(level.offhands)) {
        return;
    }
    level.offhands = spawnstruct();
    level.offhands.firefuncs = [];
    level.offhands.precached = [];
    level.offhands.var_b57472ecae671752 = [];
    level.player = getentarray("player", "classname")[0];
    level.player.offhands = spawnstruct();
}

// Namespace offhands / scripts\sp\equipment\offhands
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x56d
// Size: 0x82
function function_9ed6302fa8a1e967(offhand, var_ddaba368f540fab6) {
    /#
        if (getdvarint(@"hash_e6afce2cf5cf7515", 0) != 0) {
            return;
        }
    #/
    init();
    if (!array_contains(level.offhands.precached, offhand)) {
        [[ var_ddaba368f540fab6 ]](offhand);
        level.offhands.precached = array_add(level.offhands.precached, offhand);
    }
}

// Namespace offhands / scripts\sp\equipment\offhands
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5f7
// Size: 0x2a
function registeroffhandfirefunc(offhand, var_10bb6982b83e5957) {
    level.offhands.firefuncs[offhand] = var_10bb6982b83e5957;
}

// Namespace offhands / scripts\sp\equipment\offhands
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x629
// Size: 0x2a
function function_bfcdcf412c5db0f1(offhand, var_10bb6982b83e5957) {
    level.offhands.var_2446fd7a8e2816ad[offhand] = var_10bb6982b83e5957;
}

// Namespace offhands / scripts\sp\equipment\offhands
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x65b
// Size: 0x30
function offhandisprecached(offhand) {
    if (array_contains(level.offhands.precached, offhand)) {
        return 1;
    }
    return 0;
}

// Namespace offhands / scripts\sp\equipment\offhands
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x693
// Size: 0x1fd
function offhandprecachefuncs() {
    offhandprecachefuncs = [];
    offhandprecachefuncs["frag"] = &scripts\sp\equipment\frag::precache;
    offhandprecachefuncs["flash"] = &scripts\sp\equipment\flash::precache;
    offhandprecachefuncs["molotov"] = &scripts\sp\equipment\molotov::precache;
    offhandprecachefuncs["molotov_light"] = &scripts\sp\equipment\molotov::precache;
    offhandprecachefuncs["ied"] = &scripts\sp\equipment\ied::precache;
    offhandprecachefuncs["noisemaker"] = &scripts\sp\equipment\noisemaker::precache;
    offhandprecachefuncs["semtex"] = &scripts\sp\equipment\semtex::precache;
    offhandprecachefuncs["c4_sp"] = &scripts\sp\equipment\c4::precache;
    offhandprecachefuncs["c4_sp_short_throw"] = &scripts\sp\equipment\c4::precache;
    offhandprecachefuncs["throwingknife"] = &scripts\sp\equipment\throwingknife::precache;
    offhandprecachefuncs["throwingknife_marina"] = &scripts\sp\equipment\throwingknife::precache;
    offhandprecachefuncs["throwingknife_kitchen"] = &scripts\sp\equipment\throwingknife::precache;
    offhandprecachefuncs["smoke"] = &scripts\sp\equipment\smoke::precache;
    offhandprecachefuncs["smoke_sp_slow"] = &scripts\sp\equipment\smoke::precache;
    offhandprecachefuncs["smoke_tall"] = &scripts\sp\equipment\smoke::precache;
    offhandprecachefuncs["smoke_righthand"] = &scripts\sp\equipment\smoke::precache;
    offhandprecachefuncs["smoke_bomb"] = &namespace_1a352b34d2d4362f::precache;
    offhandprecachefuncs["smoke_empty"] = &scripts\sp\equipment\smoke::precache;
    offhandprecachefuncs["smoke_tundra"] = &scripts\sp\equipment\smoke::precache;
    offhandprecachefuncs["gas_grenade_sp"] = &scripts\sp\equipment\teargas::precache;
    offhandprecachefuncs["signal"] = &scripts\sp\equipment\signal::precache;
    offhandprecachefuncs["pipebomb"] = &scripts\sp\equipment\pipebomb::precache;
    offhandprecachefuncs["hb_sensor"] = &namespace_5c033c097ea4bf82::precache;
    offhandprecachefuncs["hb_sensor_toggle"] = &namespace_5c033c097ea4bf82::precache;
    offhandprecachefuncs["bottle"] = &namespace_6bf921a46b995f4d::precache;
    offhandprecachefuncs["thermal_phone"] = &namespace_5c033c097ea4bf82::precache;
    offhandprecachefuncs["handheld_map"] = &namespace_6afec1a8c28da6ca::precache;
    offhandprecachefuncs["green_beam_offhand"] = &namespace_3df132ced70cd2b5::precache;
    offhandprecachefuncs["improvised_mine"] = &namespace_7a9d05cd551e40e9::precache;
    offhandprecachefuncs["at_mine_sp"] = &namespace_fcb25c7f5ae9ffb2::precache;
    offhandprecachefuncs["thermite_sp"] = &namespace_6683aa43ef635803::precache;
    offhandprecachefuncs["jammer"] = &namespace_5c033c097ea4bf82::precache;
    offhandprecachefuncs["decoy_canals"] = &namespace_3049e458639813e8::precache;
    offhandprecachefuncs["gas_trap"] = &namespace_67ede21d42cae784::precache;
    offhandprecachefuncs["offhand_spotter_scope"] = &namespace_26b24c57bb990cf8::precache;
    offhandprecachefuncs["acid_grenade"] = &namespace_5d55aa1b984ebca1::precache;
    offhandprecachefuncs["concussion_grenade_sp"] = &namespace_55dd0d9a60f600d9::precache;
    offhandprecachefuncs["t10_at_mine_sp"] = &namespace_fcb25c7f5ae9ffb2::precache;
    return offhandprecachefuncs;
}

// Namespace offhands / scripts\sp\equipment\offhands
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x899
// Size: 0x106
function offhandfiremanager() {
    self endon("death");
    if (!isdefined(self.offhands)) {
        self.offhands = spawnstruct();
    }
    self.offhands.lastusedoffhandweapon = undefined;
    self.offhands.lastusedoffhandtime = 0;
    childthread function_4736c9a927e50c6e();
    while (true) {
        self waittill("offhand_fired", weapon);
        if (isdefined(level.offhands.var_2446fd7a8e2816ad) && isdefined(level.offhands.var_2446fd7a8e2816ad[weapon.basename])) {
            self thread [[ level.offhands.var_2446fd7a8e2816ad[weapon.basename] ]](weapon);
        }
        self.offhands.lastusedoffhandweapon = weapon;
        self.offhands.lastusedoffhandtime = gettime();
        thread scripts\sp\analytics::function_5cf6c6af86fd4710(weapon);
    }
}

// Namespace offhands / scripts\sp\equipment\offhands
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9a7
// Size: 0x71
function private function_4736c9a927e50c6e() {
    while (true) {
        self waittill("grenade_fire", grenade, weapon);
        if (isdefined(level.offhands.firefuncs[weapon.basename])) {
            self thread [[ level.offhands.firefuncs[weapon.basename] ]](grenade, weapon);
        }
    }
}

// Namespace offhands / scripts\sp\equipment\offhands
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa20
// Size: 0x28
function playeroffhandthread(var_adb899c5ad0ec0ae) {
    level.player endon("death");
    level.player childthread [[ var_adb899c5ad0ec0ae ]]();
}

// Namespace offhands / scripts\sp\equipment\offhands
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa50
// Size: 0x36
function getweaponoffhandclass(weapon) {
    if (isstring(weapon)) {
        weaponname = weapon;
    } else {
        weaponname = weapon.basename;
    }
    return weaponoffhandclass(weaponname);
}

// Namespace offhands / scripts\sp\equipment\offhands
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa8f
// Size: 0xa5
function function_c7e46ad834e413f(weaponname, var_79581b4a6e2719ad) {
    assert(isdefined(weaponname));
    assert(isdefined(var_79581b4a6e2719ad));
    assert(isdefined(level.offhands));
    if (!isdefined(level.offhands.weapontypeoverrides)) {
        level.offhands.weapontypeoverrides = [];
    }
    if (var_79581b4a6e2719ad) {
        level.offhands.weapontypeoverrides[weaponname] = "primaryoffhand";
        return;
    }
    level.offhands.weapontypeoverrides[weaponname] = "secondaryoffhand";
}

// Namespace offhands / scripts\sp\equipment\offhands
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb3c
// Size: 0x2ca
function getweaponoffhandtype(weapon) {
    var_dcb0666762013d1d = "primaryoffhand";
    var_1573e5df1a233a5d = "secondaryoffhand";
    null = "none";
    if (isstring(weapon)) {
        weaponname = weapon;
    } else {
        weaponname = weapon.basename;
    }
    if (isdefined(level.offhands.weapontypeoverrides) && isdefined(level.offhands.weapontypeoverrides[weaponname])) {
        return level.offhands.weapontypeoverrides[weaponname];
    }
    switch (weaponname) {
    case #"hash_2fad920d46a59f3":
    case #"hash_ab4a2e8160d2c3d":
    case #"hash_8a7d07a61346be5d":
    case #"hash_8dd4b873b8187565":
    case #"hash_e61f1a05dec2770":
    case #"hash_2ab98cab4066a74e":
    case #"hash_90e263f11d18d5e2":
    case #"hash_a8e4a914fb03a4d5":
    case #"hash_afe4588d5e9df045":
    case #"hash_277e8d97019ffd26":
    case #"hash_c55ebb7b6c0186fe":
    case #"hash_2e469d7f52babdb6":
    case #"hash_c9a436974fe60919":
    case #"hash_dffe1aacd8d2e25a":
    case #"hash_ef06862cbbed3430":
    case #"hash_45590ebc34b41f67":
    case #"hash_470ad93da37b87a1":
    case #"hash_4c2be9619244406b":
    case #"hash_56a97e9cc12c06d4":
    case #"hash_5d11ac1131cddab1":
    case #"hash_5e638d3145315dd8":
    case #"hash_666f637e6186afad":
    case #"hash_7f2cd28352d895f5":
        return var_dcb0666762013d1d;
    case #"hash_d675a16354a5298":
    case #"hash_d8f795eb14c75e6":
    case #"hash_213721b87acc4369":
    case #"hash_22041fc502090af7":
    case #"hash_25dca7ca4ee5f49c":
    case #"hash_10953bbdc9373206":
    case #"hash_34faa8cd11bde792":
    case #"hash_38d37e558866952c":
    case #"hash_3d494c645e6bff73":
    case #"hash_7983828e72e83a3e":
    case #"hash_b6cf09a3066147fb":
    case #"hash_7a02bd1c02266286":
    case #"hash_6aa85507339110d8":
    case #"hash_cb07f47b8ea9ee83":
    case #"hash_d2065c94cfc8be93":
    case #"hash_dcbfe1b308421be9":
    case #"hash_a68c414683465b09":
    case #"hash_86f6d637949b9611":
    case #"hash_f219d5163a73c117":
        return var_1573e5df1a233a5d;
    case #"hash_db653a4972b3c13b":
        return null;
    }
    assertmsg(weapon + " needs to be added to scripts\sp\equipment\offhands::getWeaponOffhandType");
}

// Namespace offhands / scripts\sp\equipment\offhands
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xe0e
// Size: 0x10b
function function_14dd7fe1d23f9dc3(gesture, grenadeorigin, visionset, radius) {
    if (!isalive(level.player)) {
        return;
    }
    traceoffset = (0, 0, 18);
    if (!ray_trace_passed(level.player.origin + traceoffset, grenadeorigin + traceoffset, level.player)) {
        return;
    }
    level.player shellshock("default_nosound", 2);
    thread function_16bdc6c2e41c72d1(grenadeorigin, visionset, radius);
    if (level.player isweaponsenabled() && isdefined(level.player.currentweapon) && !is_equal(level.player.currentweapon.basename, "none")) {
        level.player forceplaygestureviewmodel(gesture, undefined, 0.5, 0, 1, 0);
    }
}

// Namespace offhands / scripts\sp\equipment\offhands
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf21
// Size: 0xff
function function_16bdc6c2e41c72d1(grenadeorigin, visionset, radius) {
    starttime = gettime();
    playerinradius = 0;
    duration = 10;
    fadeintime = 0.5;
    fadeouttime = 0.2;
    radiussquared = radius * radius;
    while (!time_has_passed(starttime, duration)) {
        transitiontime = 0.05;
        var_e679443f18f52622 = playerinradius;
        playerinradius = distancesquared(level.player.origin, grenadeorigin) <= radiussquared;
        if (playerinradius) {
            if (!var_e679443f18f52622) {
                transitiontime = fadeintime;
                visionsetnaked(visionset, transitiontime);
            }
        } else if (var_e679443f18f52622) {
            transitiontime = fadeouttime;
            visionsetnaked("", transitiontime);
        }
        wait transitiontime;
    }
    if (playerinradius) {
        visionsetnaked("", fadeouttime);
    }
}

// Namespace offhands / scripts\sp\equipment\offhands
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1028
// Size: 0x71
function function_dd141ce8c0127f62() {
    player = self;
    player endon("death");
    var_47bff18bfea9789c = 500;
    var_aa5861dbe5fdaf83 = -1;
    while (true) {
        player waittill("use_pressed");
        currenttime = gettime();
        var_5e6a90eb17cc5b55 = var_aa5861dbe5fdaf83 > 0 && currenttime - var_aa5861dbe5fdaf83 < var_47bff18bfea9789c;
        var_aa5861dbe5fdaf83 = currenttime;
        if (var_5e6a90eb17cc5b55) {
            return 1;
        }
    }
}

// Namespace offhands / scripts\sp\equipment\offhands
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10a1
// Size: 0x103
function function_6e5ce23490c6fea6(throwngrenade, var_750c0edec8558bf1, pickupstring) {
    self endon("death");
    while (true) {
        throwngrenade scripts\sp\player\cursor_hint::create_cursor_hint(undefined, function_8e54bbb4c4af2b69(var_750c0edec8558bf1.basename), pickupstring, 55, 100, 70, 0);
        cursorhintent = throwngrenade.cursor_hint_ent;
        throwngrenade childthread function_bb7d0fd0262d852d(pickupstring, var_750c0edec8558bf1);
        outcome = throwngrenade waittill_any_return_2("trigger", "death");
        if (outcome == "death") {
            if (isdefined(cursorhintent)) {
                cursorhintent scripts\sp\player\cursor_hint::remove_cursor_hint();
                cursorhintent delete();
            }
            return;
        }
        pickedup = function_e2c7f0ed80637008(var_750c0edec8558bf1);
        if (!pickedup) {
            continue;
        }
        if (isdefined(throwngrenade)) {
            if (isdefined(throwngrenade.trigger)) {
                throwngrenade.trigger delete();
            }
            scripts\sp\loot::createnotification(var_750c0edec8558bf1.basename);
            throwngrenade delete();
        }
        return;
    }
}

// Namespace offhands / scripts\sp\equipment\offhands
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11ac
// Size: 0x3d
function function_8e54bbb4c4af2b69(weaponname) {
    offset = (0, 0, 5);
    if (weaponname == "at_mine_sp") {
        offset = (0, 0, 8);
    }
    return offset;
}

// Namespace offhands / scripts\sp\equipment\offhands
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11f2
// Size: 0x142
function function_e2c7f0ed80637008(objweapon) {
    assertex(isweapon(objweapon), "Weapon Object needed for this function.");
    var_f961454259a7e6f5 = 0;
    foreach (offhand in level.player.offhandinventory) {
        if (issameweapon(offhand, objweapon, 1)) {
            var_f961454259a7e6f5 = 1;
            break;
        }
    }
    if (var_f961454259a7e6f5) {
        currentammo = level.player getweaponammoclip(objweapon);
        maxammo = weaponmaxammo(objweapon);
        if (currentammo < maxammo) {
            playsoundatpos(level.player.origin, "weap_pickup");
            level.player setweaponammoclip(objweapon, currentammo + 1);
            return true;
        }
    } else {
        playsoundatpos(level.player.origin, "weap_pickup");
        level.player give_offhand(objweapon.basename, 1);
        return true;
    }
    return false;
}

// Namespace offhands / scripts\sp\equipment\offhands
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x133d
// Size: 0x123
function function_bb7d0fd0262d852d(pickupstring, weaponobj) {
    self endon("entitydeleted");
    self endon("trigger");
    self endon("death");
    currentammo = level.player getweaponammoclip(weaponobj);
    maxammo = weaponmaxammo(weaponobj);
    var_d5f6f287ac22711a = currentammo;
    if (currentammo >= maxammo) {
        self.cursor_hint_ent sethintinoperable(1);
        self.cursor_hint_ent sethintstring(%EQUIPMENT/FULL);
    } else {
        self.cursor_hint_ent sethintinoperable(0);
        self.cursor_hint_ent sethintstring(pickupstring);
    }
    while (true) {
        currentammo = level.player getweaponammoclip(weaponobj);
        if (currentammo != var_d5f6f287ac22711a) {
            if (currentammo >= maxammo) {
                self.cursor_hint_ent sethintinoperable(1);
                self.cursor_hint_ent sethintstring(%EQUIPMENT/FULL);
            } else {
                self.cursor_hint_ent sethintinoperable(0);
                self.cursor_hint_ent sethintstring(pickupstring);
            }
        }
        var_d5f6f287ac22711a = currentammo;
        wait 0.1;
    }
}

// Namespace offhands / scripts\sp\equipment\offhands
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1468
// Size: 0x16
function function_b9101b9d6599093f() {
    return !level.player getlocalplayerprofiledata("grenadeHoldKBM");
}

// Namespace offhands / scripts\sp\equipment\offhands
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1487
// Size: 0x15
function function_1555de7f70e21fa() {
    return level.player getlocalplayerprofiledata("grenadeHoldKBM");
}

// Namespace offhands / scripts\sp\equipment\offhands
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14a5
// Size: 0x38
function function_f9bae891decd126a(weapon_basename) {
    return isdefined(level.player getheldoffhand()) && level.player getheldoffhand().basename == weapon_basename;
}

