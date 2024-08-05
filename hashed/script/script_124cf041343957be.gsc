#using script_53f4e6352b0b2425;
#using script_1db908936531314b;
#using script_6bf6c8e2e1fdccaa;
#using script_19163c4e4e504a5e;
#using scripts\sp\anim.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\common\anim.gsc;

#namespace namespace_903e62fdf3033337;

// Namespace namespace_903e62fdf3033337 / namespace_c8b8bddad47ea676
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d7
// Size: 0x1b
function main() {
    while (!isdefined(level.player)) {
        waitframe();
    }
    thread function_e6926f1db06eb503();
}

// Namespace namespace_903e62fdf3033337 / namespace_c8b8bddad47ea676
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4fa
// Size: 0x1a
function function_e6926f1db06eb503() {
    waitframe();
    level.player setsoundsubmix("sp_jup_milbase_global_mix", 0, 1);
}

// Namespace namespace_903e62fdf3033337 / namespace_c8b8bddad47ea676
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51c
// Size: 0x54
function function_66a0d36521eddcc4() {
    if (isdefined(level.var_d4ce7a272ba5d4b0)) {
        level.var_d4ce7a272ba5d4b0 vehicle_turnengineoff();
        wait 0.5;
        snd_play("jup_milbase_jltv1_engine_in", level.var_d4ce7a272ba5d4b0);
        wait 3;
        snd_play("jup_milbase_jltv1_engine_seek", level.var_d4ce7a272ba5d4b0);
    }
}

// Namespace namespace_903e62fdf3033337 / namespace_c8b8bddad47ea676
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x578
// Size: 0x1e
function function_66a0d66521ede35d() {
    if (isdefined(level.var_a7eb2624fdb259e6)) {
        level.var_a7eb2624fdb259e6 vehicle_turnengineoff();
    }
}

// Namespace namespace_903e62fdf3033337 / namespace_c8b8bddad47ea676
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x59e
// Size: 0x33
function function_f14533e453bdebd3() {
    if (isdefined(level.var_a7eb2824fdb25e4c)) {
        level.var_a7eb2824fdb25e4c vehicle_turnengineoff();
        snd_play("jup_milbase_jltv4_pt1_engine", level.var_a7eb2824fdb25e4c);
    }
}

// Namespace namespace_903e62fdf3033337 / namespace_c8b8bddad47ea676
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d9
// Size: 0x24
function function_f14534e453bdee06() {
    if (isdefined(level.var_a7eb2824fdb25e4c)) {
        snd_play("jup_milbase_jltv4_pt2_engine", level.var_a7eb2824fdb25e4c);
    }
}

// Namespace namespace_903e62fdf3033337 / namespace_c8b8bddad47ea676
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x605
// Size: 0x24
function function_f14535e453bdf039() {
    if (isdefined(level.var_a7eb2824fdb25e4c)) {
        snd_play("jup_milbase_jltv4_pt3_engine", level.var_a7eb2824fdb25e4c);
    }
}

// Namespace namespace_903e62fdf3033337 / namespace_c8b8bddad47ea676
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x631
// Size: 0x24
function function_f14536e453bdf26c() {
    if (isdefined(level.var_a7eb2824fdb25e4c)) {
        snd_play("jup_milbase_jltv4_pt4_engine", level.var_a7eb2824fdb25e4c);
    }
}

// Namespace namespace_903e62fdf3033337 / namespace_c8b8bddad47ea676
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x65d
// Size: 0x4e
function cargo_truck() {
    if (isdefined(level.var_da38302e01d23b97)) {
        level.var_da38302e01d23b97 vehicle_turnengineoff();
        snd_play("jup_milbase_cargo_truck_engine", level.var_da38302e01d23b97);
        wait 15;
        snd_play("jup_milbase_cargo_truck_stop", level.var_da38302e01d23b97);
    }
}

// Namespace namespace_903e62fdf3033337 / namespace_c8b8bddad47ea676
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b3
// Size: 0x1e
function function_1efb979d1f23012f() {
    if (isdefined(level.var_bbcd9a2e01592bdf)) {
        level.var_bbcd9a2e01592bdf vehicle_turnengineoff();
    }
}

// Namespace namespace_903e62fdf3033337 / namespace_c8b8bddad47ea676
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6d9
// Size: 0x1c
function function_9c57b7b223b3a9e0() {
    wait 3.5;
    level.var_890c3bde4b1b2f97 playsoundonmovingent("jup_milbase_heli1_seek");
}

// Namespace namespace_903e62fdf3033337 / namespace_c8b8bddad47ea676
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6fd
// Size: 0x2
function function_9c57bab223b3b079() {
    
}

// Namespace namespace_903e62fdf3033337 / namespace_c8b8bddad47ea676
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x707
// Size: 0x16
function function_8d5f368f1a68af0b() {
    level.player setsoundsubmix("sp_jup_milbase_keycard_pickup");
}

// Namespace namespace_903e62fdf3033337 / namespace_c8b8bddad47ea676
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x725
// Size: 0x2a
function function_8868b1102543bfc3() {
    level.player setsoundsubmix("sp_jup_milbase_yuri_blink");
    level.player clearsoundsubmix("sp_jup_milbase_keycard_pickup");
}

// Namespace namespace_903e62fdf3033337 / namespace_c8b8bddad47ea676
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x757
// Size: 0x16
function function_e7d14c9764d93d0f() {
    level.player clearsoundsubmix("sp_jup_milbase_yuri_blink");
}

// Namespace namespace_903e62fdf3033337 / namespace_c8b8bddad47ea676
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x775
// Size: 0x1dc
function function_2a601799e4831973() {
    level.player setsoundsubmix("sp_jup_milbase_escape_sequence");
    var_2dec36d542b42af7 = (6243, 48243, 1094);
    playsoundatpos(var_2dec36d542b42af7, "sp_jup_milbase_panic_walla_front_entrance");
    var_c47a52768ebdf37 = (6221, 47768, 1096);
    playsoundatpos(var_c47a52768ebdf37, "sp_jup_milbase_panic_walla_lobby");
    var_43d1a8d4c3da5f73 = (6097, 48107, 1095);
    var_87725b8e1d649248 = snd_play([0, "sp_jup_milbase_gas_cloud_front_entrance", 0.5], var_43d1a8d4c3da5f73);
    level waittill("move_civ_1");
    var_62158da64c9460d5 = (6381, 47680, 1036);
    playsoundatpos(var_62158da64c9460d5, "sp_jup_milbase_panic_walla_first_hall_01");
    level waittill("move_civ_2");
    var_62158aa64c945a3c = (6683, 47171, 1036);
    playsoundatpos(var_62158aa64c945a3c, "sp_jup_milbase_panic_walla_first_hall_02");
    level waittill("vo_gas_4");
    var_641ef37d60b5fb8b = (6950, 47057, 1096);
    playsoundatpos(var_641ef37d60b5fb8b, "sp_jup_milbase_panic_walla_stairwell");
    level waittill("gas_5");
    var_314eee26e0736199 = (6266, 47192, 1204);
    playsoundatpos(var_314eee26e0736199, "sp_jup_milbase_panic_walla_second_hall_01");
    level waittill("gas_flee_spawn");
    var_314eeb26e0735b00 = (6320, 46870, 1216);
    playsoundatpos(var_314eeb26e0735b00, "sp_jup_milbase_panic_walla_second_hall_02");
    level waittill("gas_7");
    var_dbe6e7a5dcf8928e = (6426, 46979, 1552);
    playsoundatpos(var_dbe6e7a5dcf8928e, "sp_jup_milbase_panic_walla_third_hall_01");
    level waittill("vo_gas_8");
    var_dbe6e6a5dcf8905b = (6536, 46972, 1508);
    playsoundatpos(var_dbe6e6a5dcf8905b, "sp_jup_milbase_panic_walla_third_hall_02");
}

// Namespace namespace_903e62fdf3033337 / namespace_c8b8bddad47ea676
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x959
// Size: 0x6b
function function_19813e462cbab96c() {
    level.player playsound("sp_jup_milbase_pre_exfil_heli_incoming");
    var_8e3b83bdc37ff852 = (6959, 47003, 1694);
    var_9fad48ba63c620b3 = snd_play("sp_jup_milbase_pre_exfil_heli_lp", var_8e3b83bdc37ff852);
    function_74726126b3d8b0aa(var_9fad48ba63c620b3, "start_heli_exfil", 1);
    level.player clearsoundsubmix("sp_jup_milbase_escape_sequence");
}

// Namespace namespace_903e62fdf3033337 / namespace_c8b8bddad47ea676
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9cc
// Size: 0x57
function function_d832a8c5ebdf4139() {
    level.player playsound("sp_jup_milbase_exfil_heli_incoming");
    var_41c97e6bfd9c695e = (6959, 47003, 1694);
    var_36818edcdb71a10d = snd_play("sp_jup_milbase_exfil_heli_idle", var_41c97e6bfd9c695e);
    function_74726126b3d8b0aa(var_36818edcdb71a10d, "chopper_reached", 2);
}

// Namespace namespace_903e62fdf3033337 / namespace_c8b8bddad47ea676
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa2b
// Size: 0x3e
function function_a8ee3f549e9967e3() {
    level.player clearsoundsubmix("sp_jup_milbase_escape_sequence");
    level.player setsoundsubmix("sp_jup_milbase_exfil");
    level.player playsound("sp_jup_milbase_exfil_heli_takeoff");
}

