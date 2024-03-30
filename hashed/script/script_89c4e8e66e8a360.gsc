// mwiii decomp prototype
#using scripts\mp\utility\player.gsc;

#namespace namespace_39a53563bf72cee5;

// Namespace namespace_39a53563bf72cee5 / namespace_ece84bc21c1cad6c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9b
// Size: 0x27
function function_1efd3ef097bc71ef(player, checkads, ondamagedcallback) {
    thread function_52d6054e90ed0551(player, checkads, ondamagedcallback);
}

// Namespace namespace_39a53563bf72cee5 / namespace_ece84bc21c1cad6c
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc9
// Size: 0xda
function private function_52d6054e90ed0551(player, checkads, ondamagedcallback) {
    self endon("entitydeleted");
    level endon("game_ended");
    player endon("disconnect");
    while (true) {
        damage, attacker, direction_vec, point, type, modelname, tagname, partname, idflags, weapon = self waittill("damage");
        if ((!checkads || player scripts/mp/utility/player::isplayerads()) && attacker == player) {
            if (isdefined(ondamagedcallback)) {
                self [[ ondamagedcallback ]](player);
            }
            return;
        }
    }
}

