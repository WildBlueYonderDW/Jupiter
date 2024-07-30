#using scripts\mp\utility\teams.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_7b2517368c79e5bc;
#using script_7cfaa6fd841fb4dd;
#using script_57bdd8aff28a4717;
#using script_58be75c518bf0d40;
#using script_7c2886c7a12179f;
#using script_1f97a44d1761c919;

#namespace namespace_ce833ecc1b8e98dd;

// Namespace namespace_ce833ecc1b8e98dd / namespace_3d880430cde22149
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x163
// Size: 0x18
function init() {
    scripts\engine\utility::registersharedfunc("rift_gate_relics_s3", "track_merc_captain_kill", &function_98c754673084315b);
}

// Namespace namespace_ce833ecc1b8e98dd / namespace_3d880430cde22149
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x183
// Size: 0x1d
function private function_98c754673084315b(var_810260c05dd6359) {
    var_810260c05dd6359 callback::add("on_ai_killed", &function_2105b9dc72887b71);
}

// Namespace namespace_ce833ecc1b8e98dd / namespace_3d880430cde22149
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1a8
// Size: 0x109
function private function_2105b9dc72887b71(sparams) {
    if (isdefined(sparams.eattacker) && isplayer(sparams.eattacker)) {
        return;
    }
    var_fb7680c7bee58bb9 = namespace_64135de19550f047::function_a818575675b1f1c0(sparams);
    if (isdefined(var_fb7680c7bee58bb9) && isplayer(var_fb7680c7bee58bb9)) {
        var_57e9b8021f36d0d7 = 0;
        a_players = var_fb7680c7bee58bb9 namespace_ca7b90256548aa40::getsquadmembers();
        foreach (player in a_players) {
            if (namespace_362cfff5d79f8b9b::function_95ec56461198f3f9(player) && namespace_fc89f9b99b72df11::function_d737da36e4f0f6c2(var_fb7680c7bee58bb9, "ob_jup_hydro_obelisk_reward_laptop_s3") == 0) {
                var_57e9b8021f36d0d7 = 1;
                break;
            }
        }
        if (istrue(var_57e9b8021f36d0d7)) {
            namespace_fc89f9b99b72df11::function_65e52fad2bce952c(var_fb7680c7bee58bb9, "ob_jup_hydro_obelisk_reward_laptop_s3", self.origin, 1);
            a_players = var_fb7680c7bee58bb9 namespace_ca7b90256548aa40::getsquadmembers();
            thread namespace_446fc987a980892f::playevent("RFT_S3_5_RGUQ_Whispers_Laptop", a_players, 3);
        }
    }
}

