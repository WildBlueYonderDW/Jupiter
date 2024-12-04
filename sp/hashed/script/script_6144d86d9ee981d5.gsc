#using scripts\common\ai;
#using scripts\common\anim;
#using scripts\engine\sp\utility;
#using scripts\engine\utility;
#using scripts\sp\hud_util;
#using scripts\sp\player\cursor_hint;
#using scripts\sp\player_death;
#using scripts\sp\utility;

#namespace secure;

// Namespace secure / namespace_86dbfbdd50c3e14f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x229
// Size: 0x65
function function_88fddb3f49798cf8() {
    level.scr_anim["generic"]["secured_stand"][0] = generic_human%estate_prisoner_tied_idle04;
    level.scr_anim["generic"]["secured_crouch"][0] = generic_human%hostage_knees_idle;
    level.scr_anim["generic"]["secured_prone"][0] = generic_human%zip_tie_floor_idle_civ01;
}

// Namespace secure / namespace_86dbfbdd50c3e14f
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x296
// Size: 0x260
function function_ec647f66fd4eaebe(secured_stance, var_2445e1148769275b, var_1df99c5de05de391, var_d1cd6c3d70240a2f, var_e17b3a55625272eb) {
    self endon("death");
    ent_flag_init("secured");
    if (isdefined(self.var_50e27baf1cb17e06)) {
        self [[ self.var_50e27baf1cb17e06 ]]();
    } else {
        temp = spawn_tag_origin();
        temp.origin = self gettagorigin("J_Wrist_RI") + (0, 0, 6);
        temp scripts\sp\player\cursor_hint::create_cursor_hint("tag_origin", (0, 0, 0), %SCRIPT/HINT_SECURE, 45, 80, 70, 1);
        thread delete_on_death(temp);
        temp waittill("trigger");
    }
    ent_flag_set("secured");
    if (isai(self) && isdefined(self.weapon)) {
        scripts\common\ai::gun_remove();
    }
    do_intro = isdefined(var_2445e1148769275b);
    if (do_intro) {
        has_anim = isdefined(level.scr_anim[self.animname][var_2445e1148769275b]);
        assertex(istrue(has_anim), "No secure-intro anim exists for animname " + self.animname);
    }
    context_melee_allow(0);
    function_82a45e8aef44ce3f(&function_115c540730651118);
    self.allowdeath = 1;
    self.skipdeathanim = 1;
    if (istrue(self._animactive)) {
        if (isdefined(var_d1cd6c3d70240a2f)) {
            ender = ter_op(isdefined(var_e17b3a55625272eb), var_e17b3a55625272eb, "stop_loop");
            var_d1cd6c3d70240a2f notify(ender);
        } else if (isdefined(anim.callbacks["StopAnimscripted"])) {
            self [[ anim.callbacks["StopAnimscripted"] ]]();
        } else {
            anim_stopanimscripted();
        }
    }
    var_dca6bd8cd35f9e77 = undefined;
    if (isdefined(var_1df99c5de05de391)) {
        var_dca6bd8cd35f9e77 = var_1df99c5de05de391;
    } else {
        function_88fddb3f49798cf8();
        if (!isdefined(secured_stance)) {
            secured_stance = "crouch";
        } else {
            assertex(secured_stance == "stand" || secured_stance == "crouch" || secured_stance == "prone", "Invalid secure stance! Valid choices: crouch stand prone");
        }
        var_dca6bd8cd35f9e77 = "secured_" + secured_stance;
    }
    if (do_intro) {
        anim_single_solo(self, var_2445e1148769275b);
    }
    level.player thread function_ccc820d1294511ad();
    thread anim_generic_loop(self, var_dca6bd8cd35f9e77);
}

// Namespace secure / namespace_86dbfbdd50c3e14f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4fe
// Size: 0x95
function function_ccc820d1294511ad() {
    if (isdefined(self.is_securing)) {
        return;
    }
    self.is_securing = 1;
    self endon("death");
    wait 0.25;
    self playrumbleonentity("damage_light");
    self enablequickweaponswitch(1);
    self disableweapons();
    wait 0.2;
    if (soundexists("loot_pickup_armor")) {
        self playsound("loot_pickup_armor");
    }
    self viewkick(1, self.origin, 0);
    wait 0.2;
    self enableweapons();
    self enablequickweaponswitch(0);
    self.is_securing = undefined;
}

// Namespace secure / namespace_86dbfbdd50c3e14f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x59b
// Size: 0x38
function function_115c540730651118() {
    if (is_equal(self.lastattacker, level.player)) {
        level thread scripts\sp\hud_util::fade_out(0);
        scripts\sp\player_death::set_custom_death_quote(50);
        missionfailedwrapper();
    }
    return false;
}

