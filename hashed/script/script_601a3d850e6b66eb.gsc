// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\objidpoolmanager.gsc;

#namespace namespace_d9beee85529e850b;

// Namespace namespace_d9beee85529e850b/namespace_a958914ab5b08b6d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x169
// Size: 0x52
function function_99877ccd9f1a6857() {
    namespace_44abc05161e2e2cb::showerrormessage("T10_SPLASHES/HONEYPOT_ACTIVATED");
    thread function_b26e128f86f6c616();
    function_48b5e3c65db5d684();
    self setclientomnvar("ui_player_using_honeypot", 1);
    callback::add("player_disconnect", &onplayerdisconnect);
    level thread namespace_25c5a6f43bb97b43::trysaylocalsound(self, #"hash_8dfbdbe5f0c429a1");
    return 1;
}

// Namespace namespace_d9beee85529e850b/namespace_a958914ab5b08b6d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c3
// Size: 0x63
function function_c91188ff5b13a34b(attacker) {
    callback::remove("player_disconnect", &onplayerdisconnect);
    if (isdefined(attacker)) {
        attacker thread doscoreevent(#"hash_31f908e35922e19d");
    }
    function_68972bb1dc676870();
    self setclientomnvar("ui_player_using_honeypot", 0);
    if (istrue(self.ishvt)) {
        namespace_cbd3754a0c69cc63::_hudoutlineviewmodelenable("outlinefill_friendly_hvt", 0);
    }
    return 0;
}

// Namespace namespace_d9beee85529e850b/namespace_a958914ab5b08b6d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22e
// Size: 0x13
function onplayerdisconnect(params) {
    function_68972bb1dc676870();
}

// Namespace namespace_d9beee85529e850b/namespace_a958914ab5b08b6d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x248
// Size: 0x42
function private function_b26e128f86f6c616() {
    self endon("death");
    var_661d5ce8e9d7fe6f = getcurrentsuper();
    wait(var_661d5ce8e9d7fe6f.staticdata.usetime);
    thread doscoreevent(#"hash_75aa6e3148836dbe");
}

// Namespace namespace_d9beee85529e850b/namespace_a958914ab5b08b6d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x291
// Size: 0x13
function function_9bc4debdef524e6a() {
    function_e3e3e81453fd788b(#"hash_a4813385211b092c");
}

// Namespace namespace_d9beee85529e850b/namespace_a958914ab5b08b6d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ab
// Size: 0x14b
function private function_48b5e3c65db5d684() {
    self.var_d8939daf9b3e461b = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    objid = self.var_d8939daf9b3e461b;
    objective_icon(objid, "hud_icon_death_spawn");
    objective_setplayintro(objid, 1);
    objective_setrotateonminimap(objid, 1);
    objective_setbackground(objid, 0);
    objective_state(objid, "active");
    objective_setpings(objid, 1);
    foreach (team in getotherteam(self.team)) {
        objective_addteamtomask(objid, team);
    }
    objective_showtoplayersinmask(objid);
    objective_setownerteam(objid, self.team);
    self.var_2696eb402c159e5d = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    objid = self.var_2696eb402c159e5d;
    objective_icon(objid, "hud_icon_death_spawn");
    objective_setplayintro(objid, 1);
    objective_onentity(objid, self);
    objective_setrotateonminimap(objid, 1);
    objective_setbackground(objid, 0);
    objective_state(objid, "active");
    objective_setpings(objid, 1);
    objective_addclienttomask(objid, self);
    objective_showtoplayersinmask(objid);
    thread function_b1eb5099343d01d7();
}

// Namespace namespace_d9beee85529e850b/namespace_a958914ab5b08b6d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3fd
// Size: 0x4c
function private function_68972bb1dc676870() {
    if (isdefined(self.var_d8939daf9b3e461b)) {
        self notify("remove_waypoint");
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.var_d8939daf9b3e461b);
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.var_2696eb402c159e5d);
        self.var_d8939daf9b3e461b = undefined;
        self.var_2696eb402c159e5d = undefined;
    }
}

// Namespace namespace_d9beee85529e850b/namespace_a958914ab5b08b6d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x450
// Size: 0x1d
function private function_475810e912b4db94() {
    namespace_cbd3754a0c69cc63::_hudoutlineviewmodelenable("outlinefill_nodepth_orange", 0);
    wait(0.5);
    namespace_cbd3754a0c69cc63::_hudoutlineviewmodeldisable();
}

// Namespace namespace_d9beee85529e850b/namespace_a958914ab5b08b6d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x474
// Size: 0xca
function private function_b1eb5099343d01d7() {
    self endon("death");
    self endon("remove_waypoint");
    var_661d5ce8e9d7fe6f = getcurrentsuper();
    bundle = var_661d5ce8e9d7fe6f.staticdata.bundle;
    var_afb1c43006fd891d = function_53c4c53197386572(bundle.var_aeb19026bc6a09fc, 0);
    var_75ffb2278bb6bbae = istrue(bundle.var_61c5cd28d7011c61);
    if (var_afb1c43006fd891d == 0) {
        return;
    }
    while (1) {
        namespace_5a22b6f3a56f7e9b::update_objective_position(self.var_d8939daf9b3e461b, self.origin);
        objective_ping(self.var_d8939daf9b3e461b);
        objective_ping(self.var_2696eb402c159e5d);
        if (var_75ffb2278bb6bbae) {
            thread function_475810e912b4db94();
        }
        wait(var_afb1c43006fd891d);
    }
}

