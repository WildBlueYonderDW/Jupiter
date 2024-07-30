#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\common\callbacks.gsc;
#using script_f5e8d3188ab65d2;
#using script_2e5be98fac81b94a;
#using script_6e6087f1babc63e0;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;

#namespace namespace_98c9f2d788d5422d;

// Namespace namespace_98c9f2d788d5422d / namespace_316c42771a5173ad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x363
// Size: 0xab
function main() {
    namespace_5a1671403e2bb5ae::main();
    namespace_d50d77fc6d718d18::main();
    namespace_4cb48f99a9836826::main();
    scripts\mp\load::main();
    scripts\mp\compass::setupminimap("compass_map_mp_jup_bait");
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    level.ttlos_suppressasserts = 1;
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    level thread function_1682cf22619a5e55();
    level thread function_4b72f18862c4fa5c();
}

// Namespace namespace_98c9f2d788d5422d / namespace_316c42771a5173ad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x416
// Size: 0x40
function function_1682cf22619a5e55() {
    level waittill("infil_setup_complete");
    var_6120df12544987e8 = getent("static_infil_van", "targetname");
    if (gameflag("infil_will_run") && isdefined(var_6120df12544987e8)) {
        var_6120df12544987e8 hide();
    }
}

// Namespace namespace_98c9f2d788d5422d / namespace_316c42771a5173ad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x45e
// Size: 0x9d
function function_4b72f18862c4fa5c() {
    level.var_79a320246e97482a = [];
    level callback::add("player_spawned", &function_5ac1de45b686a20d);
    waitframe();
    var_b5e3b703c0df3c61 = getent("big_boi", "targetname");
    if (isdefined(var_b5e3b703c0df3c61)) {
        var_b5e3b703c0df3c61 hide();
    }
    for (i = 1; i <= 20; i++) {
        var_531ba5580fd8e7b7 = getent("small_duck" + string(i), "targetname");
        if (isdefined(var_531ba5580fd8e7b7)) {
            var_531ba5580fd8e7b7 hide();
            var_531ba5580fd8e7b7.health = 10000000;
        }
    }
}

// Namespace namespace_98c9f2d788d5422d / namespace_316c42771a5173ad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x503
// Size: 0x150
function function_5ac1de45b686a20d(params) {
    self endon("death");
    self endon("disconnect");
    var_18d03af699c79722 = getstruct("mountPoint_A", "targetname");
    if (isdefined(var_18d03af699c79722)) {
        origina = var_18d03af699c79722.origin;
    } else {
        origina = (-694, 1010, 48);
    }
    var_4130644a92f0a2b5 = getstruct("mountPoint_B", "targetname");
    if (isdefined(var_4130644a92f0a2b5)) {
        originb = var_4130644a92f0a2b5.origin;
    } else {
        originb = (-734, 974, 48);
    }
    while (true) {
        if (self playermounttype() == "mount_top") {
            if (!arraycontains(level.var_79a320246e97482a, self)) {
                if (distance2d(self.origin, origina) < 20) {
                    level function_18c9c22299cc517f(self, 0);
                } else if (distance2d(self.origin, originb) < 20) {
                    level function_18c9c22299cc517f(self, 1);
                }
            }
        } else if (isdefined(self.var_f207986133b632e4) && self.var_f207986133b632e4 >= 0) {
            level.var_79a320246e97482a[self.var_f207986133b632e4] = undefined;
            self.var_f207986133b632e4 = -1;
        }
        waitframe();
    }
}

// Namespace namespace_98c9f2d788d5422d / namespace_316c42771a5173ad
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x65b
// Size: 0x1b8
function function_18c9c22299cc517f(player, index) {
    player.var_f207986133b632e4 = index;
    level.var_79a320246e97482a[index] = player;
    if (istrue(level.var_7dbb0e2c5863a769) || istrue(level.var_85b7b0aa2ccd670b)) {
        return;
    }
    if (isdefined(level.var_79a320246e97482a[0]) && isdefined(level.var_79a320246e97482a[1]) || false) {
        if (level.var_79a320246e97482a.size >= 2 && !is_equal(level.var_79a320246e97482a[0].team, level.var_79a320246e97482a[1].team) || false) {
            if (!istrue(level.var_6973ff45d04ac633)) {
                level.var_f29f62be2292a8af = [];
                var_a1a05daa21d9018a = [];
                for (i = 0; i < 15; i++) {
                    for (spawnernum = undefined; !isdefined(spawnernum) || array_contains(var_a1a05daa21d9018a, spawnernum); spawnernum = randomint(20) + 1) {
                    }
                    var_a1a05daa21d9018a = array_add(var_a1a05daa21d9018a, spawnernum);
                    var_531ba5580fd8e7b7 = getent("small_duck" + string(spawnernum), "targetname");
                    var_531ba5580fd8e7b7 show();
                    var_531ba5580fd8e7b7.visible = 1;
                    playfxontag(getfx("small_duck_spawn"), var_531ba5580fd8e7b7, "tag_origin");
                    var_531ba5580fd8e7b7 thread damage_watcher();
                    level.var_f29f62be2292a8af = array_add(level.var_f29f62be2292a8af, var_531ba5580fd8e7b7);
                }
                level.var_6973ff45d04ac633 = 1;
                thread function_19608f86dac72ab();
                player playsound("mp_jup_bait_duck_game_start");
            }
        }
    }
}

// Namespace namespace_98c9f2d788d5422d / namespace_316c42771a5173ad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x81b
// Size: 0x102
function function_19608f86dac72ab() {
    level endon("all_ducks_destroyed");
    level.var_7dbb0e2c5863a769 = 1;
    wait 60;
    level notify("ducks_failed");
    level.var_7dbb0e2c5863a769 = 0;
    foreach (var_531ba5580fd8e7b7 in level.var_f29f62be2292a8af) {
        if (istrue(var_531ba5580fd8e7b7.visible)) {
            var_e990edb1d4c51682 = (-200, 1182, 344);
            playsoundatpos(var_e990edb1d4c51682, "mp_jup_bait_duck_game_fail");
            stopfxontag(getfx("small_duck_spawn"), var_531ba5580fd8e7b7, "tag_origin");
            playfx(getfx("small_duck_timeout"), var_531ba5580fd8e7b7.origin);
            var_531ba5580fd8e7b7 hide();
            var_531ba5580fd8e7b7.visible = 0;
        }
    }
    level.var_d26b2d8842f0ab1 = 0;
    level.var_6973ff45d04ac633 = 0;
}

// Namespace namespace_98c9f2d788d5422d / namespace_316c42771a5173ad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x925
// Size: 0x9e
function damage_watcher() {
    level endon("ducks_failed");
    self setcandamage(1);
    self waittill("damage");
    stopfxontag(getfx("small_duck_spawn"), self, "tag_origin");
    playfx(getfx("small_duck_explode"), self.origin);
    self hide();
    self.visible = 0;
    if (!isdefined(level.var_d26b2d8842f0ab1)) {
        level.var_d26b2d8842f0ab1 = 0;
    }
    level.var_d26b2d8842f0ab1 += 1;
    if (level.var_d26b2d8842f0ab1 >= 15) {
        function_461c8de9d8189070();
    }
}

// Namespace namespace_98c9f2d788d5422d / namespace_316c42771a5173ad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9cb
// Size: 0xc2
function function_461c8de9d8189070() {
    var_15dd65174c9676e6 = (6551, 10, 58);
    var_b5e3b703c0df3c61 = getent("big_boi", "targetname");
    var_b5e3b703c0df3c61 show();
    if (false) {
        playfxontag(getfx("big_duck_spawn"), self, "tag_origin");
    } else {
        playfx(getfx("big_duck_spawn"), var_b5e3b703c0df3c61.origin);
    }
    level.var_85b7b0aa2ccd670b = 1;
    level.var_7dbb0e2c5863a769 = 0;
    level notify("all_ducks_destroyed");
    var_bd56ae0c02b97e81 = (-1330, 1665, 400);
    playsoundatpos(var_bd56ae0c02b97e81, "mp_jup_bait_big_duck_appear");
    if (false) {
        var_b5e3b703c0df3c61 thread function_6ba4aa0274475b37();
    }
}

// Namespace namespace_98c9f2d788d5422d / namespace_316c42771a5173ad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa95
// Size: 0xb1
function function_6ba4aa0274475b37() {
    self setcandamage(1);
    for (health = 200; health > 0; health -= amount) {
        amount = self waittill("damage");
    }
    earthquake(0.35, 1, self.origin, 300);
    playfx(getfx("big_duck_explode"), self.origin);
    stopfxontag(getfx("big_duck_spawn"), self, "tag_origin");
    waitframe();
    self hide();
    self notify("big_boi_destroyed");
    level.var_85b7b0aa2ccd670b = 0;
    level.var_d26b2d8842f0ab1 = 0;
    level.var_6973ff45d04ac633 = 0;
}

