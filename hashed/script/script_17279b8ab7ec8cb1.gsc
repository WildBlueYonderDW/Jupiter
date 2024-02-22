// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;

#namespace namespace_1b0f1390bc5ade38;

// Namespace namespace_1b0f1390bc5ade38/namespace_699ce0e36026e1bb
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x19a
// Size: 0x14
function autoexec main() {
    function_c0b3ddc9a6bdcc46("veh_jup_ob_tank_escort", &function_666e94a4d2565651);
}

// Namespace namespace_1b0f1390bc5ade38/namespace_699ce0e36026e1bb
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b5
// Size: 0x4a
function private function_666e94a4d2565651() {
    if (!function_9697379150687859("veh_jup_ob_tank_escort")) {
        return;
    }
    callbacks = [];
    callbacks["spawnPostAirdrop"] = &function_2219f2ce2638836f;
    level callback::add("on_zombie_ai_damaged", &function_c78cc3de6029da95);
    function_8497e7e46b5e397("veh_jup_ob_tank_escort", callbacks);
}

// Namespace namespace_1b0f1390bc5ade38/namespace_699ce0e36026e1bb
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x206
// Size: 0x194
function private function_2219f2ce2638836f(spawndata, var_ee8da5624236dc89) {
    vehicle = function_bba34cf920370ff4("veh_jup_ob_tank_escort", spawndata, var_ee8da5624236dc89);
    spawndata thread function_9ab88fc150ee805b();
    var_ae7ca531f6c86ee4 = vehicle gettagorigin("tag_attach_rocket");
    vehicle.payload = spawn("script_model", var_ae7ca531f6c86ee4);
    var_b99b5e14d8587599 = (0, 0, 0);
    if (isdefined(spawndata.var_5bc025767c07fb9)) {
        switch (spawndata.var_5bc025767c07fb9) {
        case #"hash_8b48887639da2db5":
            vehicle.payload setmodel("veh_jup_zm_tank_escort_rocket_scriptable");
            break;
        case #"hash_748800eb74151258":
            vehicle.payload setmodel("veh_jup_zm_tank_escort_act_2_neutralizer_scriptable");
            var_b99b5e14d8587599 = (0, 0, 32);
            break;
        default:
            vehicle.payload delete();
            break;
        }
    } else {
        vehicle.payload delete();
    }
    if (isdefined(vehicle.payload)) {
        vehicle.payload linkto(vehicle, "tag_attach_rocket", var_b99b5e14d8587599, (0, 0, 0));
    }
    vehicle thread function_c805554fd02a8515(spawndata.var_2f5d509d7b71ce9a);
    if (istrue(spawndata.var_641d67d5ea1186ce)) {
        namespace_141c4634b6ea7b27::vehicle_interact_makeusable(vehicle);
    } else {
        namespace_141c4634b6ea7b27::vehicle_interact_makeunusable(vehicle);
    }
    return vehicle;
}

// Namespace namespace_1b0f1390bc5ade38/namespace_699ce0e36026e1bb
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3a2
// Size: 0x88
function private function_c78cc3de6029da95(params) {
    if (params.objweapon.basename == "ob_tank_escort_mp" && params.idamage >= self.health && params.smeansofdeath == "MOD_CRUSH") {
        vehspeed = params.eattacker vehicle_getspeed();
        if (vehspeed >= 3) {
            self.var_f33496b914378bbd = 1;
        }
    }
}

// Namespace namespace_1b0f1390bc5ade38/namespace_699ce0e36026e1bb
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x431
// Size: 0x76
function private function_c805554fd02a8515(var_2f5d509d7b71ce9a) {
    self endon("death");
    self waittill("freefall");
    wait(2);
    if (isdefined(var_2f5d509d7b71ce9a) && istrue(var_2f5d509d7b71ce9a.var_56235f5709b42a2a)) {
        if (isdefined(self.payload)) {
            self.payload delete();
        }
        if (isdefined(self)) {
            self dodamage(self.health + 99999, self.origin);
        }
    }
}

// Namespace namespace_1b0f1390bc5ade38/namespace_699ce0e36026e1bb
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4ae
// Size: 0x34
function private function_9ab88fc150ee805b() {
    vehicle_husk = self waittill("husk_spawn");
    wait(30);
    if (isdefined(vehicle_husk) && vehicle_husk function_b7148a3bfc4defb2()) {
        vehicle_husk function_e3ff0a92ad2bf58d();
    }
}

