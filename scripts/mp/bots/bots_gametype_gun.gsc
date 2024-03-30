// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\bots\bots_util.gsc;

#namespace bots_gametype_gun;

// Namespace bots_gametype_gun / scripts/mp/bots/bots_gametype_gun
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11b
// Size: 0x11
function main() {
    setup_callbacks();
    setup_bot_gun();
}

// Namespace bots_gametype_gun / scripts/mp/bots/bots_gametype_gun
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x133
// Size: 0x6
function function_e45e46b7c35deadb() {
    /#
    #/
}

// Namespace bots_gametype_gun / scripts/mp/bots/bots_gametype_gun
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x140
// Size: 0x18
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_gun_think;
}

// Namespace bots_gametype_gun / scripts/mp/bots/bots_gametype_gun
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15f
// Size: 0xe
function setup_bot_gun() {
    level.bots_gametype_handles_class_choice = 1;
}

// Namespace bots_gametype_gun / scripts/mp/bots/bots_gametype_gun
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x174
// Size: 0x7f
function bot_gun_pick_personality_from_weapon(weaponname, preferred_personality) {
    if (isdefined(weaponname) && weaponname != "none") {
        var_6f94db6d48b3fd6d = namespace_e0ee43ef2dddadaa::function_309bcc0c19de2d18(weaponname);
        if (isdefined(var_6f94db6d48b3fd6d) && var_6f94db6d48b3fd6d.size > 0) {
            choice = undefined;
            if (array_contains(var_6f94db6d48b3fd6d, preferred_personality)) {
                choice = preferred_personality;
            } else {
                choice = random(var_6f94db6d48b3fd6d);
            }
            if (self.personality != choice) {
                scripts/mp/bots/bots_util::bot_set_personality(choice);
            }
        }
    }
}

// Namespace bots_gametype_gun / scripts/mp/bots/bots_gametype_gun
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fa
// Size: 0x14c
function bot_gun_think() {
    self notify("bot_gun_think");
    self endon("bot_gun_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    throwKnifeChance = self botgetdifficultysetting("throwKnifeChance");
    if (throwKnifeChance < 0.25) {
        self botsetdifficultysetting("throwKnifeChance", 0.25);
    }
    self botsetdifficultysetting("allowGrenades", 1);
    last_weapon_name = "";
    original_personality = self.personality;
    wait(0.1);
    while (true) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait(0.05);
                continue;
            }
        #/
        current_weapon = self getcurrentweapon();
        if (current_weapon.basename != "none" && !iskillstreakweapon(current_weapon) && current_weapon.basename != last_weapon_name && !ismeleeoverrideweapon(current_weapon)) {
            last_weapon_name = current_weapon.basename;
            if (self botgetdifficultysetting("advancedPersonality") && self botgetdifficultysetting("strategyLevel") > 0) {
                bot_gun_pick_personality_from_weapon(current_weapon.basename, original_personality);
            }
        }
        self [[ self.personality_update_function ]]();
        wait(0.05);
    }
}

