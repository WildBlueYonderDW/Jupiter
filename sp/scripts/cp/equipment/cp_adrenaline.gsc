#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp\utility\player.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_ae43bf999f3c2a0c;

// Namespace namespace_ae43bf999f3c2a0c / scripts\cp\equipment\cp_adrenaline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11e
// Size: 0x2
function init() {
    
}

// Namespace namespace_ae43bf999f3c2a0c / scripts\cp\equipment\cp_adrenaline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x128
// Size: 0x30
function listen_for_adrenaline_use() {
    while (true) {
        self waittill("power_used equip_adrenaline");
        if (istrue(self.being_revived)) {
            continue;
        }
        thread useadrenaline();
        wait 0.1;
    }
}

// Namespace namespace_ae43bf999f3c2a0c / scripts\cp\equipment\cp_adrenaline
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x160
// Size: 0x1a
function onequipmenttaken(equipmentref, slot) {
    removeadrenaline();
}

// Namespace namespace_ae43bf999f3c2a0c / scripts\cp\equipment\cp_adrenaline
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x182
// Size: 0x23
function onequipmentfired(equipmentref, slot, objweapon) {
    thread useadrenaline();
}

// Namespace namespace_ae43bf999f3c2a0c / scripts\cp\equipment\cp_adrenaline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ad
// Size: 0x56
function useadrenaline() {
    self endon("disconnect");
    self endon("removeAdrenaline");
    self.adrenalinepoweractive = 1;
    self notify("force_regeneration");
    self refreshsprinttime();
    childthread adrenaline_removeonplayernotifies();
    childthread adrenaline_removeondamage();
    childthread adrenaline_removeongameend();
    self setscriptablepartstate("healing", "active", 0);
    return true;
}

// Namespace namespace_ae43bf999f3c2a0c / scripts\cp\equipment\cp_adrenaline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20c
// Size: 0x21
function removeadrenaline() {
    if (istrue(self.adrenalinepoweractive)) {
        self notify("removeAdrenaline");
        self.adrenalinepoweractive = undefined;
    }
}

// Namespace namespace_ae43bf999f3c2a0c / scripts\cp\equipment\cp_adrenaline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x235
// Size: 0x4
function gethealthperframe() {
    return 8;
}

// Namespace namespace_ae43bf999f3c2a0c / scripts\cp\equipment\cp_adrenaline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x242
// Size: 0x1b
function adrenaline_removeonplayernotifies() {
    waittill_any_2("death", "healed");
    thread removeadrenaline();
}

// Namespace namespace_ae43bf999f3c2a0c / scripts\cp\equipment\cp_adrenaline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x265
// Size: 0xab
function adrenaline_removeondamage() {
    while (true) {
        self waittill("damage", idamage, eattacker, vdir, vpoint, smeansofdeath, smodelname, stagname, spartname, idflags, objweapon);
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && (smeansofdeath == "MOD_TRIGGER_HURT" || smeansofdeath == "MOD_UNKNOWN")) {
            continue;
        }
        thread removeadrenaline();
        return;
    }
}

// Namespace namespace_ae43bf999f3c2a0c / scripts\cp\equipment\cp_adrenaline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x318
// Size: 0x12
function adrenaline_removeongameend() {
    level waittill("game_ended");
    thread removeadrenaline();
}

