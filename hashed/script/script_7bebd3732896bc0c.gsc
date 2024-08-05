#namespace namespace_f5515af0b7f1014c;

// Namespace namespace_f5515af0b7f1014c / namespace_50a702165bfe9b04
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x120
// Size: 0x2
function main() {
    
}

// Namespace namespace_f5515af0b7f1014c / namespace_50a702165bfe9b04
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12a
// Size: 0xb7
function function_f7ee9448704d5a66() {
    allies = getaiarray("allies");
    allies = sortbydistance(allies, self.origin);
    close_dist = 2000;
    med_dist = 8000;
    if (allies.size > 0) {
        dist = distance(self.origin, allies[0].origin);
        sound = "weap_tank_cannon_fire_radio_distant";
        if (dist <= close_dist) {
            sound = "weap_tank_cannon_fire_radio_close";
        } else if (dist <= med_dist) {
            sound = "weap_tank_cannon_fire_radio_med";
        }
        if (soundexists(sound)) {
            level.player playsound(sound);
        }
    }
}

// Namespace namespace_f5515af0b7f1014c / namespace_50a702165bfe9b04
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e9
// Size: 0xb0
function function_62f93285d84dded3(var_83f2e7c3cd68feae) {
    allies = getaiarray("allies");
    allies = sortbydistance(allies, var_83f2e7c3cd68feae);
    close_dist = 2000;
    med_dist = 8000;
    if (allies.size > 0) {
        dist = distance(var_83f2e7c3cd68feae, allies[0].origin);
        var_616b91a35e18f1fb = "weap_rpg_exp_radio_distant";
        if (dist <= close_dist) {
            var_616b91a35e18f1fb = "weap_rpg_exp_radio_close";
        } else if (dist <= med_dist) {
            var_616b91a35e18f1fb = "weap_rpg_exp_radio_med";
        }
        if (soundexists(var_616b91a35e18f1fb)) {
            level.player playsound(var_616b91a35e18f1fb);
        }
    }
}

// Namespace namespace_f5515af0b7f1014c / namespace_50a702165bfe9b04
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a1
// Size: 0xb0
function function_f4edab1c90569f7c(var_83f2e7c3cd68feae) {
    allies = getaiarray("allies");
    allies = sortbydistance(allies, var_83f2e7c3cd68feae);
    close_dist = 2000;
    med_dist = 8000;
    if (allies.size > 0) {
        dist = distance(var_83f2e7c3cd68feae, allies[0].origin);
        var_616b91a35e18f1fb = "weap_rpg_exp_radio_distant";
        if (dist <= close_dist) {
            var_616b91a35e18f1fb = "weap_rpg_exp_radio_close";
        } else if (dist <= med_dist) {
            var_616b91a35e18f1fb = "weap_rpg_exp_radio_med";
        }
        if (soundexists(var_616b91a35e18f1fb)) {
            level.player playsound(var_616b91a35e18f1fb);
        }
    }
}

