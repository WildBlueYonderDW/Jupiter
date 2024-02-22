// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\asm\soldier\script_funcs.gsc;
#using scripts\aitypes\bt_util.gsc;
#using script_3433ee6b63c7e243;

#namespace riotshield;

// Namespace riotshield/namespace_b27bacafe5f5ff6f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c1
// Size: 0x13a
function riotshield_init_cp(taskid) {
    if (istrue(self.briotshieldinitialized)) {
        return anim.success;
    }
    attachments = function_6527364c1ecca6c6("iw9_me_riotshield_mp");
    self.secondaryweapon = makeweapon("iw9_me_riotshield_mp", attachments);
    /#
        assertex(self.secondaryweapon.basename != "none", "Unable to make weapon iw9_me_riotshield_mp. Check csv");
    #/
    if (self.secondaryweapon.basename != "none") {
        utility::initweapon(self.secondaryweapon);
        self.riotshieldmodel = getweaponmodel(self.secondaryweapon);
        self.riotshieldmodeltag = "tag_weapon_left";
        self attachshieldmodel(self.riotshieldmodel, self.riotshieldmodeltag);
        self.bhasriotshieldattached = 1;
        self.briotshieldinitialized = 1;
        self.deathfunction = &function_d4b82c6f5cae75ee;
        self.var_334ab06981bc61aa = 1;
        riotshield_common();
        self aisetriotshieldweapon(self.secondaryweapon);
        return anim.success;
    } else {
        return anim.failure;
    }
}

// Namespace riotshield/namespace_b27bacafe5f5ff6f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x302
// Size: 0x148
function function_8cddb6d105408617(taskid) {
    if (istrue(self.briotshieldinitialized)) {
        return anim.success;
    }
    attachments = function_6527364c1ecca6c6("iw9_me_riotshield_mp");
    self.secondaryweapon = makeweapon("iw9_me_riotshield_mp", attachments);
    /#
        assertex(self.secondaryweapon.basename != "none", "Unable to make weapon iw9_me_riotshield_mp. Check csv");
    #/
    if (self.secondaryweapon.basename != "none") {
        utility::initweapon(self.secondaryweapon);
        self.riotshieldmodel = getweaponmodel(self.secondaryweapon);
        self.riotshieldmodeltag = "tag_weapon_left";
        self attachshieldmodel(self.riotshieldmodel, self.riotshieldmodeltag);
        self.bhasriotshieldattached = 1;
        self.briotshieldinitialized = 1;
        self.deathfunction = &function_d4b82c6f5cae75ee;
        self.var_334ab06981bc61aa = 1;
        self.var_52ab8a7c95757f64 = "soldier_jup_ob";
        riotshield_common();
        self aisetriotshieldweapon(self.secondaryweapon);
        return anim.success;
    } else {
        return anim.failure;
    }
}

// Namespace riotshield/namespace_b27bacafe5f5ff6f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x451
// Size: 0x131
function riotshield_init_sp(taskid) {
    if (istrue(self.briotshieldinitialized)) {
        return anim.success;
    }
    /#
        assertex(self.secondaryweapon.basename != "none", "Unable to make weapon iw9_me_riotshield_sp. Check if the aitype GDT has a secondaryweapon");
    #/
    self function_9f82c74eb1b7caf9(0, "entity");
    self.script_goalheight = 80;
    if (self.secondaryweapon.basename != "none") {
        utility::initweapon(self.secondaryweapon);
        self.riotshieldmodel = getweaponmodel(self.secondaryweapon);
        self.riotshieldmodeltag = "tag_weapon_left";
        self attach(self.riotshieldmodel, self.riotshieldmodeltag);
        self.bhasriotshieldattached = 1;
        self.briotshieldinitialized = 1;
        self.deathfunction = &function_d4b82c6f5cae75ee;
        self.var_334ab06981bc61aa = 1;
        riotshield_common();
        delaycall(0.05, &aisetriotshieldweapon, self.secondaryweapon);
        return anim.success;
    } else {
        return anim.failure;
    }
}

// Namespace riotshield/namespace_b27bacafe5f5ff6f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x589
// Size: 0xcb
function function_d4b82c6f5cae75ee() {
    if (!istrue(self.dropweapon) || istrue(self.bdroppingshield) || istrue(self.script_noloot) || istrue(self.script_nodrop)) {
        return 0;
    }
    var_232d7ef9f0f8baa8 = self.secondaryweapon;
    if (isnullweapon(var_232d7ef9f0f8baa8)) {
        var_232d7ef9f0f8baa8 = self.primaryweapon;
    }
    droppedweapon = spawn("weapon_" + getcompleteweaponname(var_232d7ef9f0f8baa8), self gettagorigin(self.riotshieldmodeltag));
    droppedweapon.angles = self gettagangles(self.riotshieldmodeltag);
    droppedweapon physicslaunchserveritem(droppedweapon.origin, (0, 0, 15));
    return 0;
}

// Namespace riotshield/namespace_b27bacafe5f5ff6f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65c
// Size: 0x201
function riotshield_common() {
    self allowedstances("stand");
    self.minpaindamage = 0;
    self.var_9aa77ab756fdca82 = 0;
    self.aggressivemode = 1;
    self.disablereload = 1;
    self.meleechargedistvsplayer = 120;
    self.meleechargedist = 120;
    self.meleestopattackdistsq = 14400;
    self.meleemaxzdiff = 500;
    self.meleetargetallowedoffmeshdistsq = 2500;
    self.meleetryhard = 0;
    self.meleeignorefinalzdiff = 0;
    self.meleeignoreplayerstance = 1;
    self.dontsyncmelee = 1;
    self.dontmeleeme = 1;
    self.disablebulletwhizbyreaction = 1;
    self function_9f82c74eb1b7caf9(0, "entity");
    self.disablerunngun = 1;
    self.disabledodge = 1;
    self.pathenemyfightdist = 0;
    self.maxfaceenemydist = 1200;
    self.var_54294e8bb0d07cda = 0;
    self.var_98add129a7ecb962 = 0;
    self function_ae41fbf799ba43f(1, "entity");
    self.ignoresuppression = 0;
    self.var_c49f0583b7c9f401 = 0.03;
    self.suppressiondecrement = 0.005;
    self.suppressionthreshold = 0.5;
    self.var_9440dc8a2aa90aed = 3000;
    self.var_7d606bec79308eb5 = 512;
    self.var_85a0f6383a5dd784 = 360;
    self.var_a67833fea11a521c = 360;
    self.var_427cbd3288a2f59 = 128;
    self.var_5e7d402b7b6e5c12 = 25;
    self.var_20833644cc82839f = 200;
    self.goalheight = 80;
    self.usechokepoints = 0;
    self.cautiousnavigation = 0;
    self.var_717eb05b8fb85cff = 40;
    self.var_e2b553399f5ff8a3 = 1000;
    self.var_e2d849399f862a5d = 2000;
    self.var_7878ef8b36bc3525 = 1000;
    self.var_789bf98b36e292db = 2000;
    self.combat_func_active = 1;
    self enabletraversals(1);
}

// Namespace riotshield/namespace_b27bacafe5f5ff6f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x864
// Size: 0xb3
function terminateriotshield() {
    self allowedstances("stand", "crouch", "prone");
    self.minpaindamage = 0;
    self.aggressivemode = 0;
    self.ignoresuppression = 0;
    self.disablereload = 0;
    self.meleedamageoverride = undefined;
    self.meleemaxzdiff = 36;
    self.meleeignoreplayerstance = 0;
    self.dontsyncmelee = undefined;
    self.dontmeleeme = 0;
    self.disablebulletwhizbyreaction = 0;
    self.combatmode = "cover";
    self.disablerunngun = 0;
    self.disabledodge = 0;
    self.pathenemyfightdist = 0;
    self enabletraversals(1);
}

// Namespace riotshield/namespace_b27bacafe5f5ff6f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91e
// Size: 0x21
function resetstuckthermite() {
    self.bhasthermitestucktoshield = 0;
    self.thermitestucktoshield = undefined;
    self.thermitestuckpains = undefined;
}

// Namespace riotshield/namespace_b27bacafe5f5ff6f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x946
// Size: 0x6c
function removeriotshield() {
    if (istrue(self.bhasriotshieldattached)) {
        if (utility::issp()) {
            self detach(self.riotshieldmodel, self.riotshieldmodeltag);
        } else {
            self detachshieldmodel(self.riotshieldmodel, self.riotshieldmodeltag);
        }
        self.riotshieldmodel = undefined;
        self.riotshieldmodeltag = undefined;
        self.bhasriotshieldattached = undefined;
    }
}

// Namespace riotshield/namespace_b27bacafe5f5ff6f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9b9
// Size: 0x20
function function_a43626a85e6614f0(taskid) {
    if (!self.bdroppingshield) {
        thread dropshield();
    }
}

// Namespace riotshield/namespace_b27bacafe5f5ff6f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9e0
// Size: 0x81
function function_97dbc630c790bfb3(taskid) {
    if (self.bdroppingshield) {
        /#
            assert(isdefined(self.weapon) && weaponclass(self.weapon) != "mg");
        #/
        self._blackboard.weaponrequest = "mg";
        self setbtgoalpos(4, self.origin);
        return anim.running;
    }
    return anim.failure;
}

// Namespace riotshield/namespace_b27bacafe5f5ff6f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa69
// Size: 0x2e8
function dropshield() {
    self endon("death");
    self.bdroppingshield = 1;
    var_18d67196c117e2c1 = 10000;
    var_47a17cb6c73a2a = gettime();
    while (!self asmeventfired(self.asmname, "drop_shield") && var_47a17cb6c73a2a + var_18d67196c117e2c1 > gettime()) {
        waitframe();
    }
    var_dcd0a521994e1c50 = var_47a17cb6c73a2a + var_18d67196c117e2c1 <= gettime();
    if (var_dcd0a521994e1c50) {
        resetstuckthermite();
        self._blackboard.weaponrequest = "none";
        self.bdroppingshield = 0;
        self clearbtgoal(4);
        return;
    }
    self setbasearchetype("soldier");
    self setoverridearchetype("default", "soldier");
    namespace_1a7cea57c200f504::initanimspeedthresholds_soldier("soldier");
    var_9ccc24389a9eddee = self gettagorigin(self.riotshieldmodeltag);
    var_3e3f178f45c14044 = self gettagangles(self.riotshieldmodeltag);
    if (!istrue(level.var_e97d3de5b99775a6)) {
        droppedweapon = spawn("weapon_" + getcompleteweaponname(self.secondaryweapon), self gettagorigin(self.riotshieldmodeltag));
        droppedweapon.angles = self gettagangles(self.riotshieldmodeltag);
        droppedweapon physicslaunchserveritem(droppedweapon.origin, (0, 0, 15));
        droppedweapon thread deleteaftertime(10);
    } else {
        var_f7761d0f4cce4b51 = spawn("script_model", var_9ccc24389a9eddee);
        var_f7761d0f4cce4b51.angles = var_3e3f178f45c14044;
        var_f7761d0f4cce4b51 setmodel(self.riotshieldmodel);
        var_f7761d0f4cce4b51 physicslaunchserver(var_9ccc24389a9eddee, anglestoforward(self.angles) * 5);
        var_f7761d0f4cce4b51 thread deleteaftertime(3);
    }
    if (isdefined(self.thermitestucktoshield)) {
        foreach (thermite in self.thermitestucktoshield) {
            if (isdefined(thermite)) {
                thermite delete();
            }
        }
    }
    self.var_98add129a7ecb962 = 1;
    removeriotshield();
    resetstuckthermite();
    self.bdroppingshield = 0;
    self clearbtgoal(4);
    terminateriotshield();
    self._blackboard.weaponrequest = "none";
    var_2e64de9eda85ee11 = function_53c4c53197386572(self.var_52ab8a7c95757f64, "soldier_agent");
    namespace_f08e04b63067d27f::bt_terminateandreplace(var_2e64de9eda85ee11);
    weapclass = weaponclass(self.weapon);
    namespace_223959d3e5206cfb::updateweaponarchetype(weapclass);
}

// Namespace riotshield/namespace_b27bacafe5f5ff6f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd58
// Size: 0x1c
function deleteaftertime(t) {
    self endon("death");
    wait(t);
    self delete();
}

