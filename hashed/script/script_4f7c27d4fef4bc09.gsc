// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\ai.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\anim\utility_common.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\mp\mp_agent.gsc;
#using script_23ead74859674f83;
#using scripts\mp\hud_util.gsc;
#using script_7ab5b649fa408138;
#using script_3433ee6b63c7e243;
#using script_4e0a3b3f9bedd99d;

#namespace namespace_29f11f3e79072232;

// Namespace namespace_29f11f3e79072232/namespace_c77c96f1aa8fcce1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x164
// Size: 0x3
function function_5171170ac608ca01() {
    
}

// Namespace namespace_29f11f3e79072232/namespace_c77c96f1aa8fcce1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16e
// Size: 0x1a1
function function_563c8928520a0086(taskid) {
    setupagent();
    self.var_d41ed96694c55d83 = 1;
    self.var_1858803ea66e73e0 = 1;
    var_1a8e8250c82242e2 = getdvarint(@"hash_4db8eab33e045701", 0);
    if (var_1a8e8250c82242e2 != 0) {
        self.health = self.health + var_1a8e8250c82242e2;
        self.maxhealth = self.health;
    }
    if (self isscriptable()) {
        thread initscriptable();
    }
    self.var_705e2628d263ee2c = loadfx("vfx/iw9/level/mp_sealion/vfx_ninja_smoke_bomb_iw9");
    self function_4924f775ed21316();
    groundpos = getgroundposition(self.origin, 32);
    if (getdvarint(@"hash_98874c4025ebe46d", 1) == 1 && distancesquared(self.origin, groundpos) < 400) {
        namespace_abe23f4a1f05240f::function_ca247899dbbcf9a4(self.origin);
        namespace_abe23f4a1f05240f::function_d93415244e99e763(self.origin, self.angles, getdvarint(@"hash_37448409e13a1af7", 1) == 1, 1);
        self setgoalpos(self.origin, 32);
    }
    self.pathenemyfightdist = 0;
    self.allowstrafe = 0;
    self setengagementmaxdist(0.1, 768);
    self enableavoidance(1);
    self.var_b29c3655b12e292d = 0;
    self.var_855f7991983b1210 = 1;
    self function_8bbcaeb23a1512ef("all", 0, "bt");
    self.var_4c2e21367dbf09d0 = &function_5213d881f2e26966;
    return anim.success;
}

// Namespace namespace_29f11f3e79072232/namespace_c77c96f1aa8fcce1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x317
// Size: 0x15
function initscriptable() {
    self setscriptablepartstate("notetrack_handler", "active", 0);
}

// Namespace namespace_29f11f3e79072232/namespace_c77c96f1aa8fcce1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x333
// Size: 0x28f
function setupagent() {
    self.var_896173c5036728f9 = 1;
    self.ignoreme = 0;
    self.aistate = "idle";
    self.var_6e8bc2a1f79b2398 = "walk";
    self.sharpturnnotifydist = 100;
    self.radius = 15;
    self.height = 40;
    self.var_6ee412d13bcf28d2 = 2250000;
    self.ignoreclosefoliage = 1;
    self.guid = self getentitynumber();
    self.var_8d31c7eacb516468 = 1;
    self.var_da951e8204605e7 = 1;
    self.var_d2d25942e3b908e9 = 1;
    self.var_5b1209ecd2c2de2 = 1;
    self.var_16734f091bfebaa1 = 0;
    self.var_a045430175c98788 = 0;
    self.allowcrouch = 1;
    self.var_7c0157ec8b265f6e = 40;
    self.var_fa4cf34a0c3681b8 = 70;
    self.var_4bba3a58f389e465 = self.var_fa4cf34a0c3681b8;
    self.var_a9bbce143412f034 = 80;
    self.var_f5bd7eeb8c658300 = squared(self.var_fa4cf34a0c3681b8);
    self.var_3835f6fbd6173dc9 = squared(self.var_4bba3a58f389e465);
    self.meleechargedistvsplayer = 125;
    self.meleechargedist = 125;
    self.meleebashmaxdistsq = 8100;
    self.var_8f438ea9e6ae83a2 = 12100;
    self.var_70dd5ab41a229510 = 1;
    self.defaultgoalradius = self.radius + 1;
    self.died_poorly = 0;
    self.damaged_by_player = 0;
    self.full_gib = 0;
    self.var_805f8a6da772965 = [];
    self.highlyawareradius = 200;
    self.var_dc7052bbfe5c799 = 1;
    self.var_d491cd53e778c48e = gettime();
    self.lasthittime = [];
    self function_9f82c74eb1b7caf9(0, "entity");
    self.teamflashbangimmunity = 1;
    rad = 15;
    if (isdefined(level.var_3dfcdea6efb8a124)) {
        rad = level.var_3dfcdea6efb8a124;
    }
    self setavoidanceradius(rad);
    if (!isdefined(self.a)) {
        self.a = spawnstruct();
    }
    self.a.disablepain = getdvarint(@"hash_38c150c4acc3342a", 0) == 1;
    self.lastweapon = self.weapon;
    self.deathfunction = &function_47d82ec9b6eee9e6;
    thread function_4222d0ecf1d363ba();
    thread function_3a6c3f63da7103bf();
}

// Namespace namespace_29f11f3e79072232/namespace_c77c96f1aa8fcce1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c9
// Size: 0x2e
function function_3a6c3f63da7103bf() {
    self endon("death");
    level waittill("game_ended");
    self clearpath();
    self asmsetstate(self.asmname, "exposed_idle");
}

// Namespace namespace_29f11f3e79072232/namespace_c77c96f1aa8fcce1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fe
// Size: 0xc0
function function_4222d0ecf1d363ba() {
    self endon("death");
    level endon("game_ended");
    var_206fd4337ea8ed6f = 0;
    while (1) {
        if (length(self getvelocity()) == 0 && self.aistate == "move") {
            var_206fd4337ea8ed6f = var_206fd4337ea8ed6f + 0.05;
        } else {
            var_206fd4337ea8ed6f = 0;
        }
        if (var_206fd4337ea8ed6f > 2) {
            var_30a6e70573ed723b = self getnegotiationstartnode();
            if (isdefined(var_30a6e70573ed723b)) {
                dist_sq = distancesquared(self.origin, var_30a6e70573ed723b.origin);
                if (dist_sq < squared(15)) {
                    self setorigin(var_30a6e70573ed723b.origin, 0);
                }
            }
        }
        wait(0.05);
    }
}

// Namespace namespace_29f11f3e79072232/namespace_c77c96f1aa8fcce1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6c5
// Size: 0x2c
function function_8225e9dbf1fd31a5(taskid) {
    if (!istrue(self.scripted_mode)) {
        return anim.failure;
    }
    return anim.running;
}

// Namespace namespace_29f11f3e79072232/namespace_c77c96f1aa8fcce1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6f9
// Size: 0x11f
function function_16cf274ffc86e1e2(var_3711cdf227ccd51b) {
    if (1 || !isplayer(self.enemy)) {
        return;
    }
    time = gettime();
    if (!isdefined(self.enemy.var_5a6732eff9bd04b7)) {
        self.enemy.var_5a6732eff9bd04b7 = time;
    } else if (time < self.enemy.var_5a6732eff9bd04b7) {
        return;
    }
    dirtoplayer = self.enemy.origin - self.origin;
    var_cbde868d773316b1 = anglestoforward(self.enemy.angles);
    dot = vectordot(dirtoplayer, var_cbde868d773316b1);
    if (dot > 0 && var_3711cdf227ccd51b < 250000) {
        self.enemy.var_5a6732eff9bd04b7 = time + randomintrange(3000, 5000);
        self.enemy playlocalsound("zmb_player_impact_hit");
    }
}

// Namespace namespace_29f11f3e79072232/namespace_c77c96f1aa8fcce1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81f
// Size: 0x6c
function function_5213d881f2e26966(var_4b091dca55a95a42, var_ed3e023b3e0009fe) {
    if (!isdefined(var_ed3e023b3e0009fe)) {
        var_ed3e023b3e0009fe = 1000;
    }
    var_4b091dca55a95a42 = getclosestpointonnavmesh(var_4b091dca55a95a42, self);
    if (!isdefined(var_4b091dca55a95a42)) {
        return;
    }
    self.var_cb36cb356b9d9ad3 = var_4b091dca55a95a42;
    self.var_aac0f7cd82056fd1 = var_ed3e023b3e0009fe;
    self.var_cd9d7559236c5c9f = 0.25 * var_ed3e023b3e0009fe;
    self.var_4114a481c65fd24c = 0.8 * var_ed3e023b3e0009fe;
    self.var_6b9ac762e5cbe2f8 = 1;
}

// Namespace namespace_29f11f3e79072232/namespace_c77c96f1aa8fcce1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x892
// Size: 0xd
function function_613f8ba3f0e080d3() {
    self.var_6b9ac762e5cbe2f8 = 0;
}

// Namespace namespace_29f11f3e79072232/namespace_c77c96f1aa8fcce1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a6
// Size: 0x21
function function_47d82ec9b6eee9e6() {
    var_ab1c9a379f19d469 = utility::wasdamagedbyexplosive();
    if (istrue(var_ab1c9a379f19d469)) {
        self function_36c9cc1aacacc4a8();
    }
    return 0;
}

// Namespace namespace_29f11f3e79072232/namespace_c77c96f1aa8fcce1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8cf
// Size: 0xe8
function droppostoground(position, var_463494a5f1200722) {
    radius = 15;
    height = 45;
    if (isdefined(self.radius)) {
        radius = self.radius;
    }
    if (isdefined(self.height)) {
        height = self.height;
    }
    if (!isdefined(var_463494a5f1200722)) {
        var_463494a5f1200722 = 18;
    }
    startpos = position + (0, 0, var_463494a5f1200722);
    endpos = position + (0, 0, var_463494a5f1200722 * -1);
    var_3627f3c8c6351d4d = self aiphysicstrace(startpos, endpos, self.radius, self.height, 1);
    if (abs(var_3627f3c8c6351d4d[2] - startpos[2]) < 0.1) {
        return undefined;
    }
    if (abs(var_3627f3c8c6351d4d[2] - endpos[2]) < 0.1) {
        return undefined;
    }
    return var_3627f3c8c6351d4d;
}

