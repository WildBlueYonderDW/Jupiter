// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\common\anim.gsc;

#namespace namespace_66c684fea143fbfd;

// Namespace namespace_66c684fea143fbfd/namespace_801fa17f47560d76
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c
// Size: 0x30
function function_ccdcf48542c8a5b7(vehicleref) {
    vehicledata = function_29b4292c92443328(vehicleref);
    return isdefined(vehicledata) && isdefined(vehicledata.airdrop);
}

// Namespace namespace_66c684fea143fbfd/namespace_801fa17f47560d76
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x184
// Size: 0x483
function function_66c684fea143fbfd(vehicleref, spawndata, var_ee8da5624236dc89) {
    vehicledata = function_29b4292c92443328(vehicleref);
    var_e99460bc50772002 = vehicledata.airdrop;
    if (!isdefined(spawndata.spawnmethod)) {
        spawndata.spawnmethod = "airdrop_at_position";
    }
    if (!isdefined(spawndata.angles)) {
        spawndata.angles = (0, 0, 0);
    }
    if (!isdefined(var_e99460bc50772002)) {
        /#
            assertmsg("Tried to airdrop a vehicle which doesn't support it");
        #/
        if (namespace_3c37cb17ade254d::issharedfuncdefined(vehicleref, "spawnPostAirdrop")) {
            return [[ namespace_3c37cb17ade254d::getsharedfunc(vehicleref, "spawnPostAirdrop") ]](spawndata, var_ee8da5624236dc89);
        }
        return vehicle_spawn(vehicleref, spawndata, var_ee8da5624236dc89);
    }
    var_c374a91971cb3bfa = drop_to_ground(spawndata.origin);
    if (var_c374a91971cb3bfa[2] > spawndata.origin[2]) {
        spawndata.origin = var_c374a91971cb3bfa;
    }
    scenenode = spawn("script_model", spawndata.origin);
    scenenode.angles = spawndata.angles;
    scenenode setmodel("tag_origin");
    parachute = spawn("script_model", spawndata.origin);
    parachute.angles = spawndata.angles;
    parachute.animname = "parachute";
    parachute setmodel(var_e99460bc50772002.var_d87440189700e505);
    parachute namespace_bc4a4b9456315863::setanimtree();
    parachute forcenetfieldhighlod(1);
    parachute hide();
    carrier = spawn("script_model", spawndata.origin);
    carrier.angles = spawndata.angles;
    carrier.animname = "ac130";
    carrier setmodel(var_e99460bc50772002.planemodel);
    carrier namespace_bc4a4b9456315863::setanimtree();
    carrier hide();
    var_d41b7d5f40f6a360 = spawn("script_model", spawndata.origin);
    var_d41b7d5f40f6a360.angles = spawndata.angles;
    var_d41b7d5f40f6a360.animname = vehicleref;
    model = vehicledata.model;
    if (isdefined(spawndata.var_14cde247ac3313a4)) {
        model = spawndata.var_14cde247ac3313a4 + "::" + model;
    }
    var_d41b7d5f40f6a360 setmodel(model);
    var_d41b7d5f40f6a360 namespace_bc4a4b9456315863::setanimtree();
    var_d41b7d5f40f6a360 hide();
    scenenode.vehicle = var_d41b7d5f40f6a360;
    scenenode.parachute = parachute;
    scenenode.carrier = carrier;
    scenenode.starttime = gettime() + level.frameduration;
    scenenode.endtime = gettime();
    scenenode.vehicleendtime = scenenode.starttime + getanimlength(level.scr_anim[vehicleref][var_e99460bc50772002.var_e25d1d189177a7c]) * 1000;
    if (scenenode.vehicleendtime > scenenode.endtime) {
        scenenode.endtime = scenenode.vehicleendtime;
    }
    scenenode.parachuteendtime = scenenode.starttime + getanimlength(level.scr_anim["parachute"][var_e99460bc50772002.var_e25d1d189177a7c]) * 1000;
    if (scenenode.parachuteendtime > scenenode.endtime) {
        scenenode.endtime = scenenode.parachuteendtime;
    }
    scenenode.carrierendtime = scenenode.starttime + getanimlength(level.scr_anim["ac130"][var_e99460bc50772002.var_e25d1d189177a7c]) * 1000;
    if (scenenode.carrierendtime > scenenode.endtime) {
        scenenode.endtime = scenenode.carrierendtime;
    }
    scenenode thread function_c4f85850fb179639(vehicleref, spawndata, var_ee8da5624236dc89, var_e99460bc50772002);
    vehicle = spawndata waittill("spawn");
    return vehicle;
}

// Namespace namespace_66c684fea143fbfd/namespace_801fa17f47560d76
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x60f
// Size: 0x2a6
function private function_c4f85850fb179639(vehicleref, spawndata, var_ee8da5624236dc89, var_e99460bc50772002) {
    namespace_bc4a4b9456315863::anim_first_frame_solo(self.vehicle, var_e99460bc50772002.var_e25d1d189177a7c);
    namespace_bc4a4b9456315863::anim_first_frame_solo(self.parachute, var_e99460bc50772002.var_e25d1d189177a7c);
    namespace_bc4a4b9456315863::anim_first_frame_solo(self.carrier, var_e99460bc50772002.var_e25d1d189177a7c);
    waitframe();
    if (isdefined(self.vehicle)) {
        self.vehicle show();
        thread namespace_bc4a4b9456315863::anim_single_solo(self.vehicle, var_e99460bc50772002.var_e25d1d189177a7c);
    }
    if (isdefined(self.parachute)) {
        self.parachute show();
        thread namespace_bc4a4b9456315863::anim_single_solo(self.parachute, var_e99460bc50772002.var_e25d1d189177a7c);
    }
    if (isdefined(self.carrier)) {
        self.carrier show();
        self.carrier playloopsound(var_e99460bc50772002.var_79c326e53691e2d8);
        foreach (part in var_e99460bc50772002.var_3b720ff2a50ca7b1) {
            self.carrier setscriptablepartstate(part.var_8a46c62f0a756dd3, "on", 0);
        }
        thread namespace_bc4a4b9456315863::anim_single_solo(self.carrier, var_e99460bc50772002.var_e25d1d189177a7c);
    }
    while (gettime() <= self.endtime) {
        if (!isdefined(self.vehicle) || gettime() >= self.vehicleendtime) {
            thread function_b708213b1c5dc2a8(vehicleref, self.vehicle, spawndata, var_ee8da5624236dc89, var_e99460bc50772002);
        }
        if (isdefined(self.parachute) && gettime() >= self.parachuteendtime) {
            self.parachute delete();
        }
        if (isdefined(self.carrier) && gettime() >= self.carrierendtime) {
            self.carrier delete();
        }
        waitframe();
    }
    function_b708213b1c5dc2a8(vehicleref, self.vehicle, spawndata, var_ee8da5624236dc89, var_e99460bc50772002);
    if (isdefined(self.parachute)) {
        self.parachute delete();
    }
    if (isdefined(self.carrier)) {
        self.carrier delete();
    }
    self delete();
}

// Namespace namespace_66c684fea143fbfd/namespace_801fa17f47560d76
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8bc
// Size: 0x1af
function private function_b708213b1c5dc2a8(vehicleref, var_d41b7d5f40f6a360, spawndata, var_ee8da5624236dc89, var_e99460bc50772002) {
    self.vehicle = undefined;
    if (!isdefined(var_d41b7d5f40f6a360)) {
        return;
    }
    originalorigin = spawndata.origin;
    originalangles = spawndata.angles;
    spawndata.origin = var_d41b7d5f40f6a360.origin;
    spawndata.angles = var_d41b7d5f40f6a360.angles;
    var_d41b7d5f40f6a360 delete();
    if (namespace_3c37cb17ade254d::issharedfuncdefined(vehicleref, "spawnPostAirdrop")) {
        vehicle = [[ namespace_3c37cb17ade254d::getsharedfunc(vehicleref, "spawnPostAirdrop") ]](spawndata, var_ee8da5624236dc89);
    } else {
        vehicle = vehicle_spawn(vehicleref, spawndata, var_ee8da5624236dc89);
    }
    spawndata.origin = originalorigin;
    spawndata.angles = originalangles;
    spawndata notify("spawn", vehicle);
    if (isdefined(var_e99460bc50772002.var_150b11a4da8461bc)) {
        endtime = gettime() + getanimlength(level.scr_anim[vehicleref][var_e99460bc50772002.var_150b11a4da8461bc]) * 1000;
        if (endtime > self.endtime) {
            self.endtime = endtime;
        }
        vehicle.var_9882cd795c6bfaa = 1;
        vehicle.animname = vehicleref;
        vehicle vehphys_forcekeyframedmotion();
        thread namespace_bc4a4b9456315863::anim_single_solo(vehicle, var_e99460bc50772002.var_150b11a4da8461bc);
        while (gettime() <= endtime) {
            waitframe();
        }
        vehicle vehphys_setdefaultmotion();
    }
    vehicle thread function_f694f53c094603a(var_e99460bc50772002);
}

// Namespace namespace_66c684fea143fbfd/namespace_801fa17f47560d76
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa72
// Size: 0xb8
function private function_f694f53c094603a(var_e99460bc50772002) {
    self endon("death");
    self notify("freefall");
    self.var_9882cd795c6bfaa = 1;
    playsoundatpos(self.origin, var_e99460bc50772002.var_98cf00a549d2c206);
    waitframe();
    endtime = gettime() + 3000;
    while (gettime() < endtime && !self vehicle_isonground()) {
        waitframe();
    }
    origin = self.origin;
    if (self tagexists("tag_origin_static")) {
        origin = self gettagorigin("tag_origin_static");
    }
    function_1fd2dce85778a06a(var_e99460bc50772002, origin, self.angles);
    self.var_9882cd795c6bfaa = undefined;
}

// Namespace namespace_66c684fea143fbfd/namespace_801fa17f47560d76
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb31
// Size: 0xbe
function private function_1fd2dce85778a06a(var_e99460bc50772002, position, angles) {
    playfx(var_e99460bc50772002.effect, position, anglestoforward(angles));
    playsoundatpos(position, var_e99460bc50772002.var_5c73f15ed471884d);
    earthquake(var_e99460bc50772002.earthquakescale, var_e99460bc50772002.var_bda0b1d6cce0914, position, var_e99460bc50772002.earthquakeradius);
    playrumbleonposition("grenade_rumble", position);
    physicsexplosionsphere(position, var_e99460bc50772002.var_a1939e49d568612b, var_e99460bc50772002.var_9ed85c24dbcf8da4, var_e99460bc50772002.var_fddf5fe707f47e54);
    self function_65aa053c077c003a(1);
    self.landed = 1;
    self notify("landed");
}

