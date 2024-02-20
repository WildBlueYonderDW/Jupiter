// mwiii decomp prototype
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_58be75c518bf0d40;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\supers.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\math.gsc;
#using script_1fa444cdc9dbf364;
#using scripts\mp\equipment.gsc;
#using script_48814951e916af89;
#using script_371b4c2ab5861e62;

#namespace namespace_9ecdad0555cc7d31;

// Namespace namespace_9ecdad0555cc7d31/namespace_437d750db8e68984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b5
// Size: 0x185
function function_f04c619138baafd8() {
    if (getdvarint(@"hash_e1fca8f6ab32aacc", 1) == 0) {
        return;
    }
    var_2a5b2bee2f55466a = level.struct_class_names["script_noteworthy"]["boss_trapper_claymore"];
    var_e2176a2d7c0e42a4 = level.struct_class_names["script_noteworthy"]["boss_trapper_at_mine"];
    var_535166b783f2c94d = level.struct_class_names["script_noteworthy"]["boss_trapper_cluster"];
    var_ccd66fb268ce4ca7 = [0:var_2a5b2bee2f55466a, 1:var_e2176a2d7c0e42a4, 2:var_535166b783f2c94d];
    var_b028768e8ee7243 = [0:"claymore", 1:"at_mine", 2:"sound_veil"];
    for (i = 0; i < var_ccd66fb268ce4ca7.size; i++) {
        if (!isdefined(var_ccd66fb268ce4ca7[i])) {
            continue;
        }
        foreach (node in var_ccd66fb268ce4ca7[i]) {
            var_282b1925c4af6f1f = spawnstruct();
            var_282b1925c4af6f1f.origin = node.origin;
            var_282b1925c4af6f1f.angles = node.angles;
            var_282b1925c4af6f1f.ref = "equip_" + var_b028768e8ee7243[i];
            thread namespace_437d750db8e68984::function_fd5966a3a1fdf6b8(var_282b1925c4af6f1f);
        }
    }
}

// Namespace namespace_9ecdad0555cc7d31/namespace_437d750db8e68984
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x341
// Size: 0x164
function function_ac625f4c2bf0906b(equipmentref) {
    var_28fd9ff71d008a9 = self getvieworigin();
    var_655f4170c63b668c = self getplayerangles();
    var_738a7094c7bfde17 = anglestoforward(var_655f4170c63b668c);
    var_3eb394d231fb9c74 = var_28fd9ff71d008a9 + var_738a7094c7bfde17 * 256;
    var_2fc7b90001702e5c = self;
    var_e76c084d206cfb7f = namespace_2a184fc4902783dc::create_contents(1, 0, 0, 1, 0, 1, 0, 1, 1);
    var_f17a61afb63dfd27 = ray_trace(var_28fd9ff71d008a9, var_3eb394d231fb9c74, var_2fc7b90001702e5c, var_e76c084d206cfb7f, 0, 0, 1);
    if (var_f17a61afb63dfd27["hittype"] == "hittype_none") {
        return;
    }
    var_a0377a1daf3300d0 = var_f17a61afb63dfd27["position"];
    var_a4387f1e6d5eaba7 = math::vector_project_onto_plane(vectornormalize(self.origin - var_f17a61afb63dfd27["position"]), var_f17a61afb63dfd27["normal"]);
    var_d924f30f835c73b7 = var_f17a61afb63dfd27["normal"];
    var_df8625ce05b92b48 = vectorcross(var_a4387f1e6d5eaba7, var_d924f30f835c73b7);
    var_3a43d29b943aaf0c = axistoangles(var_a4387f1e6d5eaba7, var_df8625ce05b92b48, var_d924f30f835c73b7);
    var_282b1925c4af6f1f = spawnstruct();
    var_282b1925c4af6f1f.origin = var_a0377a1daf3300d0;
    var_282b1925c4af6f1f.angles = var_3a43d29b943aaf0c;
    var_282b1925c4af6f1f.ref = equipmentref;
    namespace_437d750db8e68984::function_fd5966a3a1fdf6b8(var_282b1925c4af6f1f);
}

// Namespace namespace_9ecdad0555cc7d31/namespace_437d750db8e68984
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ac
// Size: 0x19f
function function_fd5966a3a1fdf6b8(var_282b1925c4af6f1f, agentteam) {
    /#
        assertex(isdefined(var_282b1925c4af6f1f.origin), "Tried to spawn agent equipment without specifying a location.");
    #/
    /#
        assertex(isdefined(var_282b1925c4af6f1f.angles), "Tried to spawn agent equipment without specifying a location.");
    #/
    /#
        assertex(isdefined(var_282b1925c4af6f1f.origin), "Tried to spawn agent equipment without specifying a location.");
    #/
    weaponref = var_282b1925c4af6f1f.ref;
    var_187ac8c12b417727 = issubstr(var_282b1925c4af6f1f.ref, "equip_");
    weaponobj = undefined;
    if (var_187ac8c12b417727) {
        var_8bf83d28be4c2d4f = namespace_1a507865f681850e::getequipmenttableinfo(var_282b1925c4af6f1f.ref);
        if (isdefined(var_8bf83d28be4c2d4f.objweapon)) {
            weaponref = var_8bf83d28be4c2d4f.objweapon.basename;
            weaponobj = var_8bf83d28be4c2d4f.objweapon;
        }
    } else {
        weaponobj = makeweapon(weaponref);
    }
    var_2884adc8d320f897 = namespace_bfef6903bca5845d::function_af3034a7c69d7edb(namespace_14d36171baccf528::function_30a0d7ca3fae40cc("merc"));
    grenade = var_2884adc8d320f897 _launchgrenade(weaponref, var_282b1925c4af6f1f.origin, (0, 0, 0), undefined, 0, undefined, 0);
    grenade.angles = var_282b1925c4af6f1f.angles;
    /#
        level thread draw_angles(grenade.angles, grenade.origin, (1, 0, 0), 5000, 100);
    #/
}

