#using scripts\common\vehicle_aianim;
#using scripts\common\vehicle_code;
#using scripts\engine\utility;

#namespace vehicle_common;

// Namespace vehicle_common / scripts\vehicle\vehicle_common
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xc2
// Size: 0x1e6
function requestentervehicle(vehicle, spawninvehicle, chosenvehicleposition, chosenvehicleanimpos) {
    self._blackboard.var_b5096603d1631c0b = vehicle;
    self._blackboard.var_83aebffe3c7883c9 = spawninvehicle;
    self._blackboard.var_d59400d26aee998e = chosenvehicleposition.origin;
    self._blackboard.var_a3111c437379d9e9 = chosenvehicleposition.angles;
    self._blackboard.var_9176cae5619d7fba = chosenvehicleposition.vehicle_position;
    self._blackboard.var_6a69fa6b0b354c93 = istrue(chosenvehicleposition.canshootinvehicle);
    self._blackboard.currentvehicleanimalias = vehicle.vehicleanimalias;
    self._blackboard.var_1745d2b69c72c627 = chosenvehicleanimpos.sittag;
    self._blackboard.var_f6d06d1e68f4f4e5 = istrue(chosenvehicleanimpos.linktoblend);
    self._blackboard.var_e5ec3a6afd92645d = chosenvehicleanimpos.fastroperig;
    if (isdefined(chosenvehicleanimpos.vehicle_getoutanim)) {
        self._blackboard.var_a43d8e6e8a225cd2 = getanimname(chosenvehicleanimpos.vehicle_getoutanim);
    } else {
        self._blackboard.var_a43d8e6e8a225cd2 = undefined;
    }
    self._blackboard.var_80912ec8ade08716 = istrue(chosenvehicleanimpos.deathragdoll);
    self._blackboard.var_41c9f8c7891f19da = istrue(chosenvehicleanimpos.deathimpulse);
    self._blackboard.vehiclerequested = 1;
}

// Namespace vehicle_common / scripts\vehicle\vehicle_common
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b0
// Size: 0x5d
function waitforentervehicle() {
    msg = waittill_any_return_4("entervehicle", "death", "long_death", "failedentervehicle");
    if (msg != "entervehicle") {
        return false;
    }
    self function_5847240c0f9900f2(0);
    self._blackboard.vehiclerequested = 0;
    /#
        thread function_9ec907df2fa3ceb7();
    #/
    return true;
}

// Namespace vehicle_common / scripts\vehicle\vehicle_common
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x316
// Size: 0x8a
function waitforarrivedatvehicle() {
    self endon("death");
    self endon("long_death");
    while (istrue(self._blackboard.vehiclerequested) || isdefined(self._blackboard.currentvehicle) && !istrue(self._blackboard.startedenteringvehicle) && !istrue(self._blackboard.enteredvehicle) && !self._blackboard.invehicle) {
        waitframe();
    }
}

// Namespace vehicle_common / scripts\vehicle\vehicle_common
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3a8
// Size: 0x34
function entervehicle(vehicle, spawninvehicle, chosenvehicleposition, chosenvehicleanimpos) {
    requestentervehicle(vehicle, spawninvehicle, chosenvehicleposition, chosenvehicleanimpos);
    return waitforentervehicle();
}

// Namespace vehicle_common / scripts\vehicle\vehicle_common
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e5
// Size: 0x2d
function requestexitvehicle() {
    self._blackboard.exitvehiclerequested = 1;
    self._blackboard.vehiclerequested = 0;
}

// Namespace vehicle_common / scripts\vehicle\vehicle_common
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x41a
// Size: 0x49
function waitforexitvehicle() {
    self endon("death");
    self endon("long_death");
    while (!istrue(self._blackboard.hasexitedvehicle)) {
        waitframe();
    }
    self function_5847240c0f9900f2(1);
    self._blackboard.hasexitedvehicle = 0;
}

// Namespace vehicle_common / scripts\vehicle\vehicle_common
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46b
// Size: 0x10
function exitvehicle() {
    requestexitvehicle();
    waitforexitvehicle();
}

// Namespace vehicle_common / scripts\vehicle\vehicle_common
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x483
// Size: 0x3c
function hasvehicle() {
    return istrue(self._blackboard.vehiclerequested) || isdefined(self._blackboard) && isdefined(self._blackboard.currentvehicle);
}

// Namespace vehicle_common / scripts\vehicle\vehicle_common
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c8
// Size: 0x18
function setuprope() {
    self._blackboard.vehiclesetuprope = 1;
}

// Namespace vehicle_common / scripts\vehicle\vehicle_common
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e8
// Size: 0x7e
function function_b795d4c865a7bc7e() {
    model = self.vehiclemodel;
    if (model == "") {
        model = self.model;
    }
    if (issubstr(model, "::")) {
        model = strtok(model, "::")[1];
    }
    if (isdefined(level.vehicle.templates.husk[model]) && !istrue(self.var_b3f762a51e1ed52a)) {
        return true;
    }
    return false;
}

// Namespace vehicle_common / scripts\vehicle\vehicle_common
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x56f
// Size: 0x1f
function cancelentervehicle() {
    self notify("stop_loading");
    self._blackboard.isrunningtovehicle = 0;
}

// Namespace vehicle_common / scripts\vehicle\vehicle_common
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x596
// Size: 0x92
function function_ffd4bd7b834e69eb(var_1f37a785bba731e3) {
    vehicle = self._blackboard.currentvehicle;
    if (!isdefined(vehicle)) {
        return false;
    }
    if (self._blackboard.var_9176cae5619d7fba == var_1f37a785bba731e3) {
        return true;
    }
    if (var_1f37a785bba731e3 >= vehicle.usedpositions.size) {
        return false;
    }
    if (vehicle.usedpositions[var_1f37a785bba731e3] == 1) {
        return false;
    }
    self._blackboard.var_e38c46be257216d3 = var_1f37a785bba731e3;
    thread function_b2841b0708f2b5d4();
    return true;
}

// Namespace vehicle_common / scripts\vehicle\vehicle_common
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x631
// Size: 0x197
function function_b2841b0708f2b5d4() {
    self endon("death");
    self endon("long_death");
    self._blackboard.var_3769628964ac89c1 = 0;
    while (!self._blackboard.var_3769628964ac89c1) {
        waitframe();
    }
    self._blackboard.var_9176cae5619d7fba = self._blackboard.var_e38c46be257216d3;
    vehicleanims = scripts\common\vehicle_aianim::anim_pos(self._blackboard.currentvehicle, self._blackboard.var_9176cae5619d7fba);
    self._blackboard.var_1745d2b69c72c627 = vehicleanims.sittag;
    self._blackboard.var_f6d06d1e68f4f4e5 = istrue(vehicleanims.linktoblend);
    self._blackboard.var_e5ec3a6afd92645d = vehicleanims.fastroperig;
    if (isdefined(vehicleanims.vehicle_getoutanim)) {
        self._blackboard.var_a43d8e6e8a225cd2 = getanimname(vehicleanims.vehicle_getoutanim);
    } else {
        self._blackboard.var_a43d8e6e8a225cd2 = undefined;
    }
    self._blackboard.var_80912ec8ade08716 = istrue(vehicleanims.deathragdoll);
    self._blackboard.var_41c9f8c7891f19da = istrue(vehicleanims.deathimpulse);
    self._blackboard.var_e38c46be257216d3 = undefined;
}

/#

    // Namespace vehicle_common / scripts\vehicle\vehicle_common
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x7d0
    // Size: 0x54
    function function_745ac044fcee731b(value) {
        if (getdvarint(@"ai_debugentindex") == -1 || getdvarint(@"ai_debugentindex") == self getentitynumber()) {
            if (getdvarint(@"hash_3a76c9f686d280fc", 0) == value) {
                return 1;
            }
        }
        return 0;
    }

    // Namespace vehicle_common / scripts\vehicle\vehicle_common
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x82c
    // Size: 0x609
    function function_9ec907df2fa3ceb7() {
        self endon("<dev string:x1c>");
        debugtextsize = 0.3;
        while (isdefined(self._blackboard.currentvehicle)) {
            vehicle = self._blackboard.currentvehicle;
            if (function_745ac044fcee731b(1)) {
                var_4931d79784405058 = "<dev string:x22>" + string(vehicle scripts\common\vehicle_code::get_vehicle_classname());
                var_93f33954046fbb10 = "<dev string:x2c>";
                if (isdefined(self._blackboard.var_9176cae5619d7fba)) {
                    var_93f33954046fbb10 += string(self._blackboard.var_9176cae5619d7fba);
                }
                var_16614ab5a07da138 = "<dev string:x35>";
                if (isdefined(self._blackboard.currentvehicleanimalias)) {
                    var_16614ab5a07da138 += string(self._blackboard.currentvehicleanimalias);
                }
                var_e1f23551d8e893e8 = "<dev string:x3b>";
                if (isdefined(self._blackboard.var_1745d2b69c72c627)) {
                    var_e1f23551d8e893e8 += string(self._blackboard.var_1745d2b69c72c627);
                }
                print3d(self.origin + (0, 0, 69), var_4931d79784405058, (1, 1, 1), 1, debugtextsize);
                print3d(self.origin + (0, 0, 66), var_93f33954046fbb10, (1, 1, 1), 1, debugtextsize);
                print3d(self.origin + (0, 0, 63), var_16614ab5a07da138, (1, 1, 1), 1, debugtextsize);
                print3d(self.origin + (0, 0, 60), var_e1f23551d8e893e8, (1, 1, 1), 1, debugtextsize);
                selffwd = anglestoforward(self.angles);
                draw_arrow(self.origin, self.origin + selffwd * 20, (1, 1, 1));
                seattagorigin = vehicle gettagorigin(self._blackboard.var_1745d2b69c72c627);
                var_4924aef698f4949c = vehicle gettagangles(self._blackboard.var_1745d2b69c72c627);
                var_51bdc0c94c45a24d = anglestoforward(var_4924aef698f4949c);
                var_965bea2644cdb628 = (0, 0, 1);
                draw_arrow(seattagorigin + var_965bea2644cdb628, seattagorigin + var_51bdc0c94c45a24d * 15 + var_965bea2644cdb628, (0.6, 0, 0.6));
                var_da07d0498e5b65c7 = scripts\common\vehicle_aianim::anim_pos(vehicle, self._blackboard.var_9176cae5619d7fba);
                linkangle = (0, 0, 0);
                linkoffset = (0, 0, 0);
                if (isdefined(var_da07d0498e5b65c7.linkangle)) {
                    linkangle = var_da07d0498e5b65c7.linkangle;
                }
                if (isdefined(var_da07d0498e5b65c7.linkoffset)) {
                    linkoffset = var_da07d0498e5b65c7.linkoffset;
                }
                if (linkangle != (0, 0, 0) || linkoffset != (0, 0, 0)) {
                    var_4b54cdde50ba9ce9 = rotatevector(var_51bdc0c94c45a24d, linkangle);
                    draw_arrow(seattagorigin + linkoffset + var_965bea2644cdb628, seattagorigin + linkoffset + var_965bea2644cdb628 + var_4b54cdde50ba9ce9 * 15, (1, 0.2, 0.2));
                }
            } else if (function_745ac044fcee731b(2)) {
                var_da07d0498e5b65c7 = scripts\common\vehicle_aianim::anim_pos(vehicle, self._blackboard.var_9176cae5619d7fba);
                var_adbf2061fb4e443d = "<dev string:x46>";
                if (istrue(var_da07d0498e5b65c7.canshootinvehicle)) {
                    var_adbf2061fb4e443d = "<dev string:x5f>";
                }
                var_7e03637d68944c16 = "<dev string:x77>";
                if (istrue(var_da07d0498e5b65c7.var_a06d61eb83f02f4)) {
                    var_7e03637d68944c16 = "<dev string:x90>";
                }
                var_461e599857a1a70f = "<dev string:xa8>";
                if (istrue(var_da07d0498e5b65c7.deathragdoll)) {
                    var_461e599857a1a70f = "<dev string:xbc>";
                }
                var_1165ae8c3a544686 = "<dev string:xcf>";
                if (istrue(var_da07d0498e5b65c7.bhasgunwhileriding)) {
                    var_1165ae8c3a544686 = "<dev string:xe8>";
                }
                print3d(self.origin + (0, 0, 69), var_adbf2061fb4e443d, (1, 1, 1), 1, debugtextsize);
                print3d(self.origin + (0, 0, 66), var_7e03637d68944c16, (1, 1, 1), 1, debugtextsize);
                print3d(self.origin + (0, 0, 63), var_461e599857a1a70f, (1, 1, 1), 1, debugtextsize);
                print3d(self.origin + (0, 0, 60), var_1165ae8c3a544686, (1, 1, 1), 1, debugtextsize);
            } else if (function_745ac044fcee731b(3)) {
                var_10effa490054d61e = isdefined(self.var_d9134148f9bb887) && isdefined(self.var_f39c6b01b1d95542) && gettime() >= self.var_f39c6b01b1d95542 && gettime() < self.var_d9134148f9bb887;
                var_a755a62b691f10e3 = "<dev string:x100>";
                if (var_10effa490054d61e) {
                    var_a755a62b691f10e3 += "<dev string:x101>";
                }
                print3d(self.origin + (0, 0, 69), var_a755a62b691f10e3, (1, 1, 1), 1, debugtextsize);
            }
            waitframe();
        }
    }

#/
