// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_7edf952f8921aa6b;
#using scripts\common\devgui.gsc;
#using scripts\asm\shared\mp\utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using script_7b2517368c79e5bc;

#namespace ob_golden_ammo;

// Namespace ob_golden_ammo / namespace_354cab17d5512c3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160
// Size: 0x3b
function function_93c0f40d62257166() {
    /#
        level thread function_d1d70c73f09a1540();
    #/
    registersharedfunc("ob_golden_ammo", "set_goldenAmmo", &set_goldenAmmo);
    registersharedfunc("ob_golden_ammo", "unset_goldenAmmo", &unset_goldenAmmo);
}

// Namespace ob_golden_ammo / namespace_354cab17d5512c3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a2
// Size: 0x7f
function set_goldenAmmo() {
    if (istrue(self.hasgoldenammo)) {
        if (istrue(self.goldenammoset)) {
            /#
                iprintlnbold("<unknown string>");
            #/
            return;
        }
    } else {
        self.hasgoldenammo = 1;
        self notify("golden_ammo_set");
        self setclientomnvar("ui_ob_gold_ammo_counter", 1);
        thread function_5b5c4a75d3003a7f();
    }
    /#
        iprintlnbold("<unknown string>");
    #/
    self setperk("specialty_ammodrainsfromstockfirst", 1);
    self.goldenammoset = 1;
}

// Namespace ob_golden_ammo / namespace_354cab17d5512c3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x228
// Size: 0x58
function function_5b5c4a75d3003a7f() {
    self endon("disconnect");
    self endon("golden_ammo_unset");
    while (istrue(self.hasgoldenammo)) {
        newweapon = scripts/mp/gametypes/br_weapons::function_27ef2c36eb95d796();
        newweapon = self waittill("weapon_change");
        if (function_b3698dc11254f342(newweapon)) {
            function_ea51eda9b53c4482();
        } else {
            set_goldenAmmo();
        }
        waitframe();
    }
}

// Namespace ob_golden_ammo / namespace_354cab17d5512c3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x287
// Size: 0x48
function unset_goldenAmmo() {
    self.hasgoldenammo = 0;
    self notify("golden_ammo_unset");
    self unsetperk("specialty_ammodrainsfromstockfirst", 1);
    self.goldenammoset = 0;
    self setclientomnvar("ui_ob_gold_ammo_counter", 0);
    /#
        iprintlnbold("<unknown string>");
    #/
}

// Namespace ob_golden_ammo / namespace_354cab17d5512c3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d6
// Size: 0x44
function function_ea51eda9b53c4482() {
    if (!istrue(self.goldenammoset)) {
        return;
    }
    self unsetperk("specialty_ammodrainsfromstockfirst", 1);
    self.goldenammoset = 0;
    self setclientomnvar("ui_ob_gold_ammo_counter", 0);
    /#
        iprintlnbold("<unknown string>");
    #/
}

// Namespace ob_golden_ammo / namespace_354cab17d5512c3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x321
// Size: 0x53
function function_b3698dc11254f342(weapon) {
    switch (weapon.basename) {
    case #"hash_87262a67e163f7c9":
        return true;
    default:
        break;
    }
    return weapon::iswonderweapon(weapon) || weapon.ismelee;
}

// Namespace ob_golden_ammo / namespace_354cab17d5512c3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x37c
// Size: 0x64
function function_7c7d7717c1af82bf(params) {
    /#
        foreach (player in level.players) {
            player unset_goldenAmmo();
        }
    #/
}

// Namespace ob_golden_ammo / namespace_354cab17d5512c3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e7
// Size: 0x71
function function_d1d70c73f09a1540() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_2abc885019e1956::function_f8162124bbb6ece3);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_2abc885019e1956::function_f8162124bbb6ece3);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_2abc885019e1956::function_f8162124bbb6ece3);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_7c7d7717c1af82bf);
        function_fe953f000498048f();
    #/
}

