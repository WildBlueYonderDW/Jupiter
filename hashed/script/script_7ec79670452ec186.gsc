// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\engine\math.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\damage.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\mp\hostmigration.gsc;

#namespace namespace_f7f9f35af1405f62;

// Namespace namespace_f7f9f35af1405f62/namespace_2db0b5db4c5dfc98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26e
// Size: 0xb
function blindingturret_unset() {
    self notify("blindingTurret_unset");
}

// Namespace namespace_f7f9f35af1405f62/namespace_2db0b5db4c5dfc98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x280
// Size: 0x87
function function_f6f76571fbd09f18(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    if (istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
    }
    function_7d3a3fe4313463b4();
}

// Namespace namespace_f7f9f35af1405f62/namespace_2db0b5db4c5dfc98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30e
// Size: 0x70
function function_b02438cf4822a79e(grenade) {
    self endon("disconnect");
    level endon("game_ended");
    grenade waittill("missile_stuck");
    turret = function_2beaf4844e5a4d16(grenade);
    if (!isdefined(turret)) {
        return;
    }
    maxhealth = 100;
    turret thread namespace_3e725f3cc58bddd3::monitordamage(maxhealth, "hitequip", &function_f6f76571fbd09f18, undefined, 0, 0);
    turret thread function_cad43242ef6c86b5();
    turret thread function_b310f71f299cbc78();
}

// Namespace namespace_f7f9f35af1405f62/namespace_2db0b5db4c5dfc98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x385
// Size: 0x10e
function function_b310f71f299cbc78() {
    level endon("game_ended");
    self endon("death");
    while (1) {
        if (!istrue(self.stunned) && !istrue(self.isactive)) {
            function_74b09da5a1249ff7();
        }
        if (!istrue(self.stunned) && !istrue(self.var_d299274bfc2e5980)) {
            thread function_a100143a05b7b873();
        }
        if (!istrue(self.stunned) && !isdefined(self.var_716423dc232862c0) && !istrue(self.oncooldown)) {
            function_a8320570b3ed2b35();
        }
        if (!istrue(self.stunned) && isdefined(self.var_716423dc232862c0)) {
            function_3fe776cabee63724();
        }
        if (!istrue(self.stunned) && istrue(self.var_e9765f437a2de9c0) && isdefined(self.var_716423dc232862c0)) {
            function_83f4dd119acbf873();
        }
        if (istrue(self.stunned)) {
            function_c471c1f93412cb6c();
        }
        if (isdefined(self.var_716423dc232862c0)) {
            function_987732d93502e3f();
        }
        waitframe();
    }
}

// Namespace namespace_f7f9f35af1405f62/namespace_2db0b5db4c5dfc98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49a
// Size: 0x4a
function function_83f4dd119acbf873() {
    cansee = function_59b368c4c2bdc737(self.var_716423dc232862c0);
    if (cansee) {
        self.var_716423dc232862c0 _shellshock("flash_grenade_mp", "flash", 4, 1);
    }
    thread function_6584a53d3d4d1fa8();
}

// Namespace namespace_f7f9f35af1405f62/namespace_2db0b5db4c5dfc98
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4eb
// Size: 0x2f
function private function_6584a53d3d4d1fa8(time) {
    if (!isdefined(time)) {
        time = 1;
    }
    self.oncooldown = 1;
    wait(time);
    self.oncooldown = undefined;
}

// Namespace namespace_f7f9f35af1405f62/namespace_2db0b5db4c5dfc98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x521
// Size: 0x1b6
function function_59b368c4c2bdc737(target) {
    if (!isdefined(target)) {
        return 0;
    }
    var_27b697504d9397d = 0;
    var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 1, 1, 1, 0, 1);
    var_8a4ea3a3baa22e4 = self.origin;
    headpos = target gettagorigin("j_head");
    if (namespace_3c37cb17ade254d::issharedfuncdefined("player", "isReallyAlive")) {
        headpos = target [[ namespace_3c37cb17ade254d::getsharedfunc("player", "getStanceTop") ]]();
    }
    centerpos = "j_spineupper";
    if (namespace_3c37cb17ade254d::issharedfuncdefined("player", "isReallyAlive")) {
        centerpos = target [[ namespace_3c37cb17ade254d::getsharedfunc("player", "getStanceCenter") ]]();
    }
    tracepoints = [0:headpos, 1:centerpos, 2:var_8a4ea3a3baa22e4];
    ignorelist = [0:self, 1:target];
    vehicle = target namespace_f8065cafc523dba5::getvehicle();
    if (isdefined(vehicle)) {
        ignorelist[ignorelist.size] = vehicle;
        var_bb7ac665413117fc = vehicle getlinkedchildren(1);
        foreach (child in var_bb7ac665413117fc) {
            ignorelist[ignorelist.size] = vehicle;
        }
    }
    for (i = 0; i < tracepoints.size; i++) {
        if (!namespace_2a184fc4902783dc::ray_trace_passed(var_8a4ea3a3baa22e4, tracepoints[i], ignorelist, var_fbcabd62b8f66eb8)) {
            continue;
        }
        var_27b697504d9397d = 1;
        break;
    }
    return var_27b697504d9397d;
}

// Namespace namespace_f7f9f35af1405f62/namespace_2db0b5db4c5dfc98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6df
// Size: 0x3
function function_c471c1f93412cb6c() {
    
}

// Namespace namespace_f7f9f35af1405f62/namespace_2db0b5db4c5dfc98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e9
// Size: 0x5d
function function_987732d93502e3f() {
    if (!isdefined(self.var_894380476a44e139)) {
        self.var_894380476a44e139 = [];
    }
    self.var_894380476a44e139[self.var_894380476a44e139.size] = self.var_716423dc232862c0;
    self.var_716423dc232862c0 = undefined;
    self cleartargetentity();
    self.var_d299274bfc2e5980 = 0;
    self.var_e9765f437a2de9c0 = 0;
}

// Namespace namespace_f7f9f35af1405f62/namespace_2db0b5db4c5dfc98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74d
// Size: 0x152
function function_3fe776cabee63724() {
    if (!isdefined(self.var_716423dc232862c0)) {
        return;
    } else {
        self endon("death");
        self endon("stunned");
        self.var_716423dc232862c0 endon("death_or_disconnect");
        self notify("blindingTurret_stopIdleMovements");
        self.var_e9765f437a2de9c0 = 0;
        self cleartargetentity();
        waitframe();
        self setconvergencetime(0.75, "pitch");
        self setconvergencetime(0.75, "yaw");
        self.aimtarget linkto(self.var_716423dc232862c0, "tag_shield_back", (0, 0, 0), (0, 0, 0));
        self settargetentity(self.aimtarget);
        waitframe();
        var_8ffb4040b18f4e9e = flatten_vector(self.aimtarget.origin - self.origin);
        var_f02e4b8443c68e94 = flatten_vector(anglestoforward(self gettagangles("tag_flash")));
        var_c5f68cdf7b9421d9 = math::anglebetweenvectors(var_f02e4b8443c68e94, var_8ffb4040b18f4e9e);
        while (var_c5f68cdf7b9421d9 > 8) {
            var_c5f68cdf7b9421d9 = math::anglebetweenvectors(var_f02e4b8443c68e94, var_8ffb4040b18f4e9e);
            var_f02e4b8443c68e94 = flatten_vector(anglestoforward(self gettagangles("tag_flash")));
            waitframe();
        }
        self.var_e9765f437a2de9c0 = 1;
    }
}

// Namespace namespace_f7f9f35af1405f62/namespace_2db0b5db4c5dfc98
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a6
// Size: 0xd3
function function_126dd09da824d606(player, var_1feeba72ea1b50a7) {
    if (!isdefined(player)) {
        return 0;
    }
    if (player.team == self.owner.team) {
        return 0;
    }
    if (!isreallyalive(player)) {
        return 0;
    }
    if (!istrue(namespace_f8065cafc523dba5::playersareenemies(player, self.owner))) {
        return 0;
    }
    if (distancesquared(player.origin, self.origin) > 562500) {
        return 0;
    }
    if (isdefined(self.var_894380476a44e139) && array_contains(self.var_894380476a44e139, player)) {
        return 0;
    }
    var_9ad4f0e9a4d962fb = math::anglebetweenvectors(anglestoforward(self.angles), var_1feeba72ea1b50a7);
    if (var_9ad4f0e9a4d962fb >= 90) {
        return 0;
    }
    return 1;
}

// Namespace namespace_f7f9f35af1405f62/namespace_2db0b5db4c5dfc98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x981
// Size: 0x1dd
function function_a100143a05b7b873() {
    self endon("death");
    self endon("blindTurret_stopIdleMovements");
    self.var_d299274bfc2e5980 = 1;
    self.aimtarget unlink();
    direction = 1;
    startangles = self.angles;
    var_7277010a82352e32 = getdvarfloat(@"hash_8bf7c4a92a43762", 15);
    var_5d8c55d5b4f0643c = getdvarfloat(@"hash_476655d41cf371fa", 30);
    var_7531d94939d23350 = getdvarfloat(@"hash_59d07e54a840556c", 100);
    var_41ee18556b2486f = self gettagorigin("tag_aim_pivot") + anglestoforward(startangles) * var_5d8c55d5b4f0643c + anglestoup(startangles) * var_7277010a82352e32;
    self.aimtarget.origin = var_41ee18556b2486f;
    self setconvergencetime(2.5, "pitch");
    self setconvergencetime(2.5, "yaw");
    while (1) {
        self cleartargetentity();
        waitframe();
        self settargetentity(self.aimtarget);
        direction = direction * -1;
        self.aimtarget.origin = var_41ee18556b2486f + anglestoright(startangles) * var_7531d94939d23350 * direction;
        var_da3d9fe6b1ff496b = flatten_vector(self.aimtarget.origin - self.origin);
        turretangles = self gettagangles("tag_flash");
        var_77c133840a36c8a4 = math::anglebetweenvectors(anglestoforward(turretangles), var_da3d9fe6b1ff496b);
        while (var_77c133840a36c8a4 > 8) {
            turretangles = self gettagangles("tag_flash");
            var_77c133840a36c8a4 = math::anglebetweenvectors(flatten_vector(anglestoforward(turretangles)), var_da3d9fe6b1ff496b);
            waitframe();
        }
    }
}

// Namespace namespace_f7f9f35af1405f62/namespace_2db0b5db4c5dfc98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb65
// Size: 0x1f0
function function_a8320570b3ed2b35() {
    possibletargets = [];
    var_124a2a5957983db8 = [];
    foreach (player in level.characters) {
        var_1feeba72ea1b50a7 = player.origin - self.origin;
        if (!function_126dd09da824d606(player, var_1feeba72ea1b50a7)) {
            continue;
        }
        var_ae3412f7b9b48d44 = 1 - distancesquared(player.origin, self.origin) / 562500;
        var_ae3412f7b9b48d44 = clamp(var_ae3412f7b9b48d44, 0, 1);
        var_e64a4025ffe8eb2 = 1 - math::anglebetweenvectors(anglestoforward(self.angles), var_1feeba72ea1b50a7) / 90;
        var_e64a4025ffe8eb2 = clamp(var_e64a4025ffe8eb2, 0, 1);
        weight = var_ae3412f7b9b48d44 * 0.75 + var_e64a4025ffe8eb2 * 0.25;
        possibletargets[possibletargets.size] = player;
        var_124a2a5957983db8[var_124a2a5957983db8.size] = weight;
    }
    if (possibletargets.size == 0) {
        return;
    }
    for (i = 0; i < var_124a2a5957983db8.size - 1; i++) {
        swapped = 0;
        for (j = 0; j < var_124a2a5957983db8.size - 1; j++) {
            if (var_124a2a5957983db8[j] < var_124a2a5957983db8[j + 1]) {
                var_382d2566050de89a = possibletargets[j];
                var_a070967229ec3de7 = var_124a2a5957983db8[j];
                possibletargets[j] = possibletargets[j + 1];
                var_124a2a5957983db8[j] = var_124a2a5957983db8[j + 1];
                possibletargets[j + 1] = var_382d2566050de89a;
                var_124a2a5957983db8[j + 1] = var_a070967229ec3de7;
                swapped = 1;
            }
        }
        if (!swapped) {
            break;
        }
    }
    self.var_716423dc232862c0 = possibletargets[0];
}

// Namespace namespace_f7f9f35af1405f62/namespace_2db0b5db4c5dfc98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5c
// Size: 0x44
function function_74b09da5a1249ff7() {
    self.isactive = 1;
    self setdefaultdroppitch(-89);
    self setmode("manual_target");
    if (!issentient(self)) {
        namespace_6d9917c3dc05dbe9::registersentient("Killstreak_Ground", self.owner);
    }
}

// Namespace namespace_f7f9f35af1405f62/namespace_2db0b5db4c5dfc98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda7
// Size: 0x12
function function_7d3a3fe4313463b4() {
    self notify("death");
    self delete();
}

// Namespace namespace_f7f9f35af1405f62/namespace_2db0b5db4c5dfc98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc0
// Size: 0x19
function function_cad43242ef6c86b5() {
    self endon("death");
    function_b305f54dd4a77190();
    thread function_7d3a3fe4313463b4();
}

// Namespace namespace_f7f9f35af1405f62/namespace_2db0b5db4c5dfc98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde0
// Size: 0x4f
function function_b305f54dd4a77190() {
    level endon("game_ended");
    self.owner endon("disconnect");
    self.owner endon("joined_team");
    self.owner endon("joined_spectators");
    self.owner endon("blindingTurret_unset");
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(30);
}

// Namespace namespace_f7f9f35af1405f62/namespace_2db0b5db4c5dfc98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe36
// Size: 0x1a7
function function_2beaf4844e5a4d16(grenade) {
    var_f02e4b8443c68e94 = grenade.origin - self.origin;
    var_a9d52b91b0873e57 = vectortoangles(flatten_vector(var_f02e4b8443c68e94));
    turret = spawnturret("misc_turret", grenade.origin, "blinding_turret_mp", 0);
    turret setmodel("weapon_wm_mg_sentry_turret");
    turret makeunusable();
    turret setnodeploy(1);
    turret setdefaultdroppitch(0);
    turret maketurretinoperable();
    turret setleftarc(90);
    turret setrightarc(90);
    turret setbottomarc(50);
    turret settoparc(60);
    turret setconvergencetime(2.5, "pitch");
    turret setconvergencetime(2.5, "yaw");
    turret setconvergenceheightpercent(0.65);
    turret setdefaultdroppitch(-89);
    turret setturretmodechangewait(1);
    turret setmode("manual_target");
    turret.angles = var_a9d52b91b0873e57;
    turret.owner = self;
    turret setturretowner(self);
    turret setturretteam(self.team);
    turret.aimtarget = spawn_tag_origin(turret.origin, turret.angles);
    turret.aimtarget linkto(turret, "tag_flash", (0, 0, 0), (0, 0, 0));
    turret.var_d299274bfc2e5980 = 0;
    grenade delete();
    return turret;
}

