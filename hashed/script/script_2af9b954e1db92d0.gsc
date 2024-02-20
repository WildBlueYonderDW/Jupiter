// mwiii decomp prototype
#using scripts\smartobjects\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\stealth\group.gsc;
#using scripts\asm\gesture.gsc;
#using script_35de402efc5acfb3;
#using scripts\asm\asm.gsc;

#namespace hunt_point;

// Namespace hunt_point/namespace_3019a92c149eb488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13f
// Size: 0x19
function main() {
    add_smartobject_type("hunt_point", &getinfo, &canuse);
}

// Namespace hunt_point/namespace_3019a92c149eb488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f
// Size: 0xe
function canuse(object) {
    return 1;
}

// Namespace hunt_point/namespace_3019a92c149eb488
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x175
// Size: 0x5d
function getinfo() {
    info = createsmartobjectinfo();
    info.fnonuse = &onuse;
    info.var_d0fc6475ed819558 = 1;
    info.radiussqrd = 3600;
    info.nextusetime = 0;
    info addsmartobjectanim("loop");
    return info;
}

// Namespace hunt_point/namespace_3019a92c149eb488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1da
// Size: 0x180
function onuse(object) {
    var_e8003c5231baea93 = self._blackboard.var_3dbe624a18d61f13;
    pod = function_bc5df124338cefea(self);
    /#
        assert(isdefined(pod));
    #/
    var_2924e404150ff758 = pod namespace_e5c9a7258a3d79cb::function_75087b386454d072(self);
    var_cc2828da32453f24 = var_2924e404150ff758.guys[0];
    if (self == var_cc2828da32453f24) {
        var_cc2828da32453f24 = var_2924e404150ff758.guys[1];
    }
    var_b45b78df70b9fd3a = var_cc2828da32453f24.var_7b492275ef047be2;
    if (self == var_2924e404150ff758.leader) {
        var_71f2a25a69f9c80f = randomintrange(1200, 2800);
        self.var_9a04c6cfe15e92a7 = self.origin;
        self.var_587d8840dea10869 = 1;
        self.var_4b1fa39975a3fd58 = var_71f2a25a69f9c80f;
        namespace_d3b312ec98e9299b::ai_request_gesture("military_point", var_e8003c5231baea93, 1000, "first_hunt_gesture");
        self waittill("first_hunt_gesture");
        if (!isdefined(var_b45b78df70b9fd3a)) {
            namespace_d3b312ec98e9299b::ai_request_gesture("talk", undefined, 1000, "hunt_gesture");
        } else {
            var_cc2828da32453f24 delaycall(0.5, &glanceatpos, var_b45b78df70b9fd3a, 300);
            namespace_d3b312ec98e9299b::ai_request_gesture("military_point", var_b45b78df70b9fd3a, 1000, "hunt_gesture");
        }
    } else {
        namespace_d3b312ec98e9299b::ai_request_gesture("yes", undefined, 1000, "hunt_gesture");
    }
    thread function_ef5a2fd990a632b2("hunt_gesture");
    namespace_378f8281e2d12ced::function_e23b0906b02cd179("coordinate", 20);
}

// Namespace hunt_point/namespace_3019a92c149eb488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x361
// Size: 0x6f
function function_ef5a2fd990a632b2(flag) {
    self endon("death");
    self endon("smartobject_logic_finished");
    self setlookatentity();
    childthread function_522562e28309afaa(10);
    while (1) {
        status = self waittill(flag);
        if (status == "gesture_finish" || status == "gesture_cancel") {
            break;
        }
    }
    namespace_bf5a1761a8d1bb07::asm_fireevent(self.asmname, "smartobject_finished");
}

// Namespace hunt_point/namespace_3019a92c149eb488
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d7
// Size: 0x23
function function_522562e28309afaa(t) {
    wait(t);
    namespace_bf5a1761a8d1bb07::asm_fireevent(self.asmname, "smartobject_finished");
}

