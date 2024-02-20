// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\emp_debuff_mp.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;

#namespace namespace_8791d3d5975975e4;

// Namespace namespace_8791d3d5975975e4/namespace_d9afd8e5495604c9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf3
// Size: 0x5b
function emp_debuff_init() {
    registersharedfunc("emp", "getPlayerEMPImmune", &getplayerempimmune);
    registersharedfunc("emp", "setPlayerEMPImmune", &setplayerempimmune);
    registersharedfunc("emp", "onPlayerEMPed", &onplayeremped);
    registersharedfunc("emp", "onVehicleEMPed", &onvehicleemped);
}

// Namespace namespace_8791d3d5975975e4/namespace_d9afd8e5495604c9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x155
// Size: 0xe
function getplayerempimmune() {
    return _hasperk("specialty_empimmune");
}

// Namespace namespace_8791d3d5975975e4/namespace_d9afd8e5495604c9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16b
// Size: 0x2b
function setplayerempimmune(var_780166328e815d00) {
    if (var_780166328e815d00) {
        giveperk("specialty_empimmune");
    } else {
        removeperk("specialty_empimmune");
    }
}

// Namespace namespace_8791d3d5975975e4/namespace_d9afd8e5495604c9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d
// Size: 0x37
function onplayeremped(data) {
    attacker = data.attacker;
    if (istrue(namespace_f8065cafc523dba5::playersareenemies(self, attacker))) {
        attacker thread namespace_58a74e7d54b56e8d::givescoreforempedplayer();
    }
}

// Namespace namespace_8791d3d5975975e4/namespace_d9afd8e5495604c9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1db
// Size: 0x77
function onvehicleemped(data) {
    attacker = data.attacker;
    if (isdefined(self.turrets) && self.turrets.size > 0) {
        namespace_d9afd8e5495604c9::function_a3a4d32a799e95d5(data);
    }
    if (istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        attacker namespace_58a74e7d54b56e8d::givescoreforempedvehicle();
    } else if (namespace_1f188a13f7e79610::function_62ccfb7ea15a4520()) {
        attacker namespace_58a74e7d54b56e8d::givescoreforempedvehicle();
    }
}

// Namespace namespace_8791d3d5975975e4/namespace_d9afd8e5495604c9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x259
// Size: 0x3e
function function_a3a4d32a799e95d5(data) {
    attacker = data.attacker;
    if (istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        attacker namespace_58a74e7d54b56e8d::function_7d84b8c1b826b7ea();
    }
}

