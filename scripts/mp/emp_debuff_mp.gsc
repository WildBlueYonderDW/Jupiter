// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\emp_debuff_mp.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;

#namespace emp_debuff_mp;

// Namespace emp_debuff_mp / scripts/mp/emp_debuff_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf3
// Size: 0x5b
function emp_debuff_init() {
    registersharedfunc("emp", "getPlayerEMPImmune", &getplayerempimmune);
    registersharedfunc("emp", "setPlayerEMPImmune", &setplayerempimmune);
    registersharedfunc("emp", "onPlayerEMPed", &onplayeremped);
    registersharedfunc("emp", "onVehicleEMPed", &onvehicleemped);
}

// Namespace emp_debuff_mp / scripts/mp/emp_debuff_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x155
// Size: 0xe
function getplayerempimmune() {
    return _hasperk("specialty_empimmune");
}

// Namespace emp_debuff_mp / scripts/mp/emp_debuff_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16b
// Size: 0x2b
function setplayerempimmune(isimmune) {
    if (isimmune) {
        giveperk("specialty_empimmune");
        return;
    }
    removeperk("specialty_empimmune");
}

// Namespace emp_debuff_mp / scripts/mp/emp_debuff_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d
// Size: 0x37
function onplayeremped(data) {
    attacker = data.attacker;
    if (istrue(scripts/cp_mp/utility/player_utility::playersareenemies(self, attacker))) {
        attacker thread scripts/mp/killstreaks/killstreaks::givescoreforempedplayer();
    }
}

// Namespace emp_debuff_mp / scripts/mp/emp_debuff_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1db
// Size: 0x77
function onvehicleemped(data) {
    attacker = data.attacker;
    if (isdefined(self.turrets) && self.turrets.size > 0) {
        scripts/mp/emp_debuff_mp::function_a3a4d32a799e95d5(data);
    }
    if (istrue(scripts/cp_mp/utility/player_utility::playersareenemies(self.owner, attacker))) {
        attacker scripts/mp/killstreaks/killstreaks::givescoreforempedvehicle();
        return;
    }
    if (scripts/cp_mp/vehicles/vehicle::function_62ccfb7ea15a4520()) {
        attacker scripts/mp/killstreaks/killstreaks::givescoreforempedvehicle();
    }
}

// Namespace emp_debuff_mp / scripts/mp/emp_debuff_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x259
// Size: 0x3e
function function_a3a4d32a799e95d5(data) {
    attacker = data.attacker;
    if (istrue(scripts/cp_mp/utility/player_utility::playersareenemies(self.owner, attacker))) {
        attacker scripts/mp/killstreaks/killstreaks::function_7d84b8c1b826b7ea();
    }
}

