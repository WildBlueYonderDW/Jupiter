// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\vehicle_aianim.gsc;
#using scripts\common\vehicle_code.gsc;

#namespace vehicle_common;

// Namespace vehicle_common / scripts/vehicle/vehicle_common
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2
// Size: 0x227
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
    self._blackboard.var_ffbe5b175387642c = istrue(chosenvehicleanimpos.var_8af43e63a663dbd6);
    self._blackboard.var_feaa963beeb05107 = istrue(chosenvehicleanimpos.onleft);
    if (isdefined(chosenvehicleanimpos.vehicle_getoutanim)) {
        self._blackboard.var_a43d8e6e8a225cd2 = getanimname(chosenvehicleanimpos.vehicle_getoutanim);
    } else {
        self._blackboard.var_a43d8e6e8a225cd2 = undefined;
    }
    self._blackboard.var_80912ec8ade08716 = istrue(chosenvehicleanimpos.deathragdoll);
    self._blackboard.var_41c9f8c7891f19da = istrue(chosenvehicleanimpos.deathimpulse);
    self._blackboard.vehiclerequested = 1;
}

// Namespace vehicle_common / scripts/vehicle/vehicle_common
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f0
// Size: 0x5e
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

// Namespace vehicle_common / scripts/vehicle/vehicle_common
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x356
// Size: 0x8b
function waitforarrivedatvehicle() {
    self endon("death");
    self endon("long_death");
    while (istrue(self._blackboard.vehiclerequested) || isdefined(self._blackboard.currentvehicle) && !istrue(self._blackboard.startedenteringvehicle) && !istrue(self._blackboard.enteredvehicle) && !self._blackboard.invehicle) {
        waitframe();
    }
}

// Namespace vehicle_common / scripts/vehicle/vehicle_common
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e8
// Size: 0x35
function entervehicle(vehicle, spawninvehicle, chosenvehicleposition, chosenvehicleanimpos) {
    requestentervehicle(vehicle, spawninvehicle, chosenvehicleposition, chosenvehicleanimpos);
    return waitforentervehicle();
}

// Namespace vehicle_common / scripts/vehicle/vehicle_common
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x425
// Size: 0x2e
function requestexitvehicle() {
    self._blackboard.exitvehiclerequested = 1;
    self._blackboard.vehiclerequested = 0;
}

// Namespace vehicle_common / scripts/vehicle/vehicle_common
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45a
// Size: 0x4a
function waitforexitvehicle() {
    self endon("death");
    self endon("long_death");
    while (!istrue(self._blackboard.hasexitedvehicle)) {
        waitframe();
    }
    self function_5847240c0f9900f2(1);
    self._blackboard.hasexitedvehicle = 0;
}

// Namespace vehicle_common / scripts/vehicle/vehicle_common
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ab
// Size: 0x11
function exitvehicle() {
    requestexitvehicle();
    waitforexitvehicle();
}

// Namespace vehicle_common / scripts/vehicle/vehicle_common
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c3
// Size: 0x3d
function hasvehicle() {
    return istrue(self._blackboard.vehiclerequested) || isdefined(self._blackboard) && isdefined(self._blackboard.currentvehicle);
}

// Namespace vehicle_common / scripts/vehicle/vehicle_common
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x508
// Size: 0x19
function setuprope() {
    self._blackboard.vehiclesetuprope = 1;
}

// Namespace vehicle_common / scripts/vehicle/vehicle_common
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x528
// Size: 0x7f
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

// Namespace vehicle_common / scripts/vehicle/vehicle_common
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5af
// Size: 0x20
function cancelentervehicle() {
    self notify("stop_loading");
    self._blackboard.isrunningtovehicle = 0;
}

// Namespace vehicle_common / scripts/vehicle/vehicle_common
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d6
// Size: 0xa9
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
    self._blackboard.var_bb19bd9078f99962 = 1;
    thread function_b2841b0708f2b5d4();
    return true;
}

// Namespace vehicle_common / scripts/vehicle/vehicle_common
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x687
// Size: 0x1eb
function function_b2841b0708f2b5d4() {
    self endon("death");
    self endon("long_death");
    self._blackboard.var_3769628964ac89c1 = 0;
    while (!self._blackboard.var_3769628964ac89c1) {
        waitframe();
    }
    self._blackboard.var_9176cae5619d7fba = self._blackboard.var_e38c46be257216d3;
    self._blackboard.var_bb19bd9078f99962 = 0;
    vehicleanims = scripts/common/vehicle_aianim::anim_pos(self._blackboard.currentvehicle, self._blackboard.var_9176cae5619d7fba);
    self._blackboard.var_1745d2b69c72c627 = vehicleanims.sittag;
    self._blackboard.var_f6d06d1e68f4f4e5 = istrue(vehicleanims.linktoblend);
    self._blackboard.var_e5ec3a6afd92645d = vehicleanims.fastroperig;
    self._blackboard.var_ffbe5b175387642c = vehicleanims.var_8af43e63a663dbd6;
    self._blackboard.var_feaa963beeb05107 = vehicleanims.onleft;
    if (isdefined(vehicleanims.vehicle_getoutanim)) {
        self._blackboard.var_a43d8e6e8a225cd2 = getanimname(vehicleanims.vehicle_getoutanim);
    } else {
        self._blackboard.var_a43d8e6e8a225cd2 = undefined;
    }
    self._blackboard.var_80912ec8ade08716 = istrue(vehicleanims.deathragdoll);
    self._blackboard.var_41c9f8c7891f19da = istrue(vehicleanims.deathimpulse);
    self._blackboard.var_e38c46be257216d3 = undefined;
}

// Namespace vehicle_common / scripts/vehicle/vehicle_common
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x879
// Size: 0x55
function function_745ac044fcee731b(value) {
    /#
        if (getdvarint(@"hash_932e9550632df2cb") == -1 || getdvarint(@"hash_932e9550632df2cb") == self getentitynumber()) {
            if (getdvarint(@"hash_3a76c9f686d280fc", 0) == value) {
                return 1;
            }
        }
        return 0;
    #/
}

// Namespace vehicle_common / scripts/vehicle/vehicle_common
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8d5
// Size: 0x60a
function function_9ec907df2fa3ceb7() {
    /#
        self endon("<unknown string>");
        debugtextsize = 0.3;
        while (isdefined(self._blackboard.currentvehicle)) {
            vehicle = self._blackboard.currentvehicle;
            if (function_745ac044fcee731b(1)) {
                var_4931d79784405058 = "<unknown string>" + string(vehicle scripts/common/vehicle_code::get_vehicle_classname());
                var_93f33954046fbb10 = "<unknown string>";
                if (isdefined(self._blackboard.var_9176cae5619d7fba)) {
                    var_93f33954046fbb10 = var_93f33954046fbb10 + string(self._blackboard.var_9176cae5619d7fba);
                }
                var_16614ab5a07da138 = "<unknown string>";
                if (isdefined(self._blackboard.currentvehicleanimalias)) {
                    var_16614ab5a07da138 = var_16614ab5a07da138 + string(self._blackboard.currentvehicleanimalias);
                }
                var_e1f23551d8e893e8 = "<unknown string>";
                if (isdefined(self._blackboard.var_1745d2b69c72c627)) {
                    var_e1f23551d8e893e8 = var_e1f23551d8e893e8 + string(self._blackboard.var_1745d2b69c72c627);
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
                var_da07d0498e5b65c7 = scripts/common/vehicle_aianim::anim_pos(vehicle, self._blackboard.var_9176cae5619d7fba);
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
                var_da07d0498e5b65c7 = scripts/common/vehicle_aianim::anim_pos(vehicle, self._blackboard.var_9176cae5619d7fba);
                var_adbf2061fb4e443d = "<unknown string>";
                if (istrue(var_da07d0498e5b65c7.canshootinvehicle)) {
                    var_adbf2061fb4e443d = "<unknown string>";
                }
                var_7e03637d68944c16 = "<unknown string>";
                if (istrue(var_da07d0498e5b65c7.var_a06d61eb83f02f4)) {
                    var_7e03637d68944c16 = "<unknown string>";
                }
                var_461e599857a1a70f = "<unknown string>";
                if (istrue(var_da07d0498e5b65c7.deathragdoll)) {
                    var_461e599857a1a70f = "<unknown string>";
                }
                var_1165ae8c3a544686 = "<unknown string>";
                if (istrue(var_da07d0498e5b65c7.bhasgunwhileriding)) {
                    var_1165ae8c3a544686 = "<unknown string>";
                }
                print3d(self.origin + (0, 0, 69), var_adbf2061fb4e443d, (1, 1, 1), 1, debugtextsize);
                print3d(self.origin + (0, 0, 66), var_7e03637d68944c16, (1, 1, 1), 1, debugtextsize);
                print3d(self.origin + (0, 0, 63), var_461e599857a1a70f, (1, 1, 1), 1, debugtextsize);
                print3d(self.origin + (0, 0, 60), var_1165ae8c3a544686, (1, 1, 1), 1, debugtextsize);
            } else if (function_745ac044fcee731b(3)) {
                var_10effa490054d61e = isdefined(self.var_d9134148f9bb887) && isdefined(self.var_f39c6b01b1d95542) && gettime() >= self.var_f39c6b01b1d95542 && gettime() < self.var_d9134148f9bb887;
                var_a755a62b691f10e3 = "<unknown string>";
                if (var_10effa490054d61e) {
                    var_a755a62b691f10e3 = var_a755a62b691f10e3 + "<unknown string>";
                }
                print3d(self.origin + (0, 0, 69), var_a755a62b691f10e3, (1, 1, 1), 1, debugtextsize);
            }
            waitframe();
        }
    #/
}

