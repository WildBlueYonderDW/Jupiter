// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\equipment\adrenaline.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\gametypes\br_public.gsc;

#namespace namespace_9813110ef9f69edd;

// Namespace namespace_9813110ef9f69edd/namespace_5a8d603f2e1c2a87
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x139
// Size: 0x8
function getbandagehealfractionbr() {
    return 0.2;
}

// Namespace namespace_9813110ef9f69edd/namespace_5a8d603f2e1c2a87
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x149
// Size: 0x5
function getbandagehealtimebr() {
    return 5;
}

// Namespace namespace_9813110ef9f69edd/namespace_5a8d603f2e1c2a87
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x156
// Size: 0x5
function getfirstaidhealtimebr() {
    return 5;
}

// Namespace namespace_9813110ef9f69edd/namespace_5a8d603f2e1c2a87
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x163
// Size: 0x5c
function getbandagetime(itemname) {
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        var_7607f8111cfe5ff7 = 1;
        if (isdefined(self.br_armorlevel) && self.br_armorlevel == 3) {
            var_7607f8111cfe5ff7 = 0.75;
        }
        if (itemname == "equip_bandages") {
            return (5 * var_7607f8111cfe5ff7);
        }
        return (5 * var_7607f8111cfe5ff7);
    }
    return 5;
}

// Namespace namespace_9813110ef9f69edd/namespace_5a8d603f2e1c2a87
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c7
// Size: 0xec
function usebandage(itemname, var_1156b7a3b9b6aa08) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (self.health == self.maxhealth) {
        self iprintlnbold("Your health is full!");
        return;
    }
    weaponobj = "bandage_mp";
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        weaponobj = "bandage_br_fake";
    }
    self disableweaponswitch();
    self allowfire(0);
    self giveandfireoffhand(weaponobj);
    wait(0.25);
    self.bandageactive = 1;
    self.healthregendisabled = 0;
    bandageheal(itemname);
    wait(0.25);
    if (self hasweapon(weaponobj)) {
        namespace_df5cfdbe6e2d3812::getridofweapon(weaponobj);
    }
    self allowfire(1);
    self enableweaponswitch();
    var_1156b7a3b9b6aa08--;
    namespace_1a507865f681850e::setequipmentslotammo("health", var_1156b7a3b9b6aa08);
    self.bandageactive = 0;
    self.healthregendisabled = 1;
}

// Namespace namespace_9813110ef9f69edd/namespace_5a8d603f2e1c2a87
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ba
// Size: 0x39
function bandageheal(itemname) {
    self endon("heal_end");
    self endon("death_or_disconnect");
    level endon("game_ended");
    thread namespace_d3d40f75bb4e4c32::watchhealend();
    self notify("force_regeneration");
    wait(getbandagetime(itemname));
}

