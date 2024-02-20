// mwiii decomp prototype
#using scripts\smartobjects\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\stealth\group.gsc;
#using scripts\asm\gesture.gsc;
#using scripts\asm\asm.gsc;

#namespace hunt_checkin;

// Namespace hunt_checkin/namespace_c96ea713559d0559
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d
// Size: 0x19
function main() {
    add_smartobject_type("hunt_checkin", &getinfo, &canuse);
}

// Namespace hunt_checkin/namespace_c96ea713559d0559
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d
// Size: 0xe
function canuse(object) {
    return 1;
}

// Namespace hunt_checkin/namespace_c96ea713559d0559
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x163
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

// Namespace hunt_checkin/namespace_c96ea713559d0559
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c8
// Size: 0x16d
function onuse(object) {
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
        var_71f2a25a69f9c80f = randomintrange(1200, 3600);
        self.var_9a04c6cfe15e92a7 = self.origin;
        self.stealth.script_skiplookaroundanim = 1;
        self.stealth.script_huntlookaroundduration = var_71f2a25a69f9c80f;
        namespace_d3b312ec98e9299b::ai_request_gesture("talk", undefined, 1000, "first_hunt_gesture");
        self waittill("first_hunt_gesture");
        if (!isdefined(var_b45b78df70b9fd3a)) {
            namespace_d3b312ec98e9299b::ai_request_gesture("talk", undefined, 1000, "hunt_gesture");
        } else {
            self setlookat(var_b45b78df70b9fd3a, 1);
            namespace_d3b312ec98e9299b::ai_request_gesture("military_point", var_b45b78df70b9fd3a, 1000, "hunt_gesture");
        }
        thread function_ef5a2fd990a632b2("hunt_gesture");
    } else {
        namespace_d3b312ec98e9299b::ai_request_gesture("no", undefined, 1000, "hunt_gesture");
        thread function_ef5a2fd990a632b2("hunt_gesture");
    }
}

// Namespace hunt_checkin/namespace_c96ea713559d0559
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33c
// Size: 0x68
function function_ef5a2fd990a632b2(flag) {
    self endon("death");
    self endon("smartobject_logic_finished");
    childthread function_522562e28309afaa(10);
    while (1) {
        status = self waittill(flag);
        if (status == "gesture_finish" || status == "gesture_cancel") {
            break;
        }
    }
    namespace_bf5a1761a8d1bb07::asm_fireevent(self.asmname, "smartobject_finished");
}

// Namespace hunt_checkin/namespace_c96ea713559d0559
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ab
// Size: 0x23
function function_522562e28309afaa(t) {
    wait(t);
    namespace_bf5a1761a8d1bb07::asm_fireevent(self.asmname, "smartobject_finished");
}

