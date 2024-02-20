// mwiii decomp prototype
#using scripts\mp\utility\player.gsc;

#namespace namespace_39a53563bf72cee5;

// Namespace namespace_39a53563bf72cee5/namespace_ece84bc21c1cad6c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9b
// Size: 0x27
function function_1efd3ef097bc71ef(player, var_4fc3ebd0a2f2e41f, var_4b930e7c10433564) {
    thread function_52d6054e90ed0551(player, var_4fc3ebd0a2f2e41f, var_4b930e7c10433564);
}

// Namespace namespace_39a53563bf72cee5/namespace_ece84bc21c1cad6c
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc9
// Size: 0xda
function private function_52d6054e90ed0551(player, var_4fc3ebd0a2f2e41f, var_4b930e7c10433564) {
    self endon("entitydeleted");
    level endon("game_ended");
    player endon("disconnect");
    while (1) {
        weapon = idflags = partname = tagname = modelname = type = point = direction_vec = attacker = damage = self waittill("damage");
        if ((!var_4fc3ebd0a2f2e41f || player namespace_7e17181d03156026::isplayerads()) && attacker == player) {
            if (isdefined(var_4b930e7c10433564)) {
                self [[ var_4b930e7c10433564 ]](player);
            }
            return;
        }
    }
}

