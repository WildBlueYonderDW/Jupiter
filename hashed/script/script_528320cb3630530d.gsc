// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using script_9880b9dc28bc25e;
#using script_4ef01fe6151dde4d;
#using script_79deab1955343d5d;
#using script_41387eecc35b88bf;
#using script_5753ba9c28794a65;
#using script_185660037b9236c1;
#using script_220d0eb95a8fab7d;
#using script_7956d56c4922bd1;
#using script_4fdefae8b7bcdf73;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using script_3ac7886f9e4eceef;
#using scripts\asm\shared\mp\utility.gsc;
#using script_3e31016b9c11a616;
#using script_64351208cb856df9;
#using script_46c7c73b1a7e4773;
#using script_3b78d23dad7ec5be;
#using script_3ab210ea917601e7;
#using script_4e6e58ab5d96c2b0;
#using script_721ee99d7a8f9168;
#using script_2583ee5680cf4736;
#using scripts\common\vehicle.gsc;
#using scripts\common\vehicle_paths.gsc;
#using script_4fa7e9e11630166c;
#using scripts\engine\trace.gsc;
#using script_5d8202968463a21d;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using script_638d701d263ee1ed;

#namespace namespace_d197b40cdbf4a1ea;

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc28
// Size: 0xbd
function function_de62bc27675c1bfc() {
    function_89384091f7a2dbd("REV_OB_ESCORT_ZOMBIES", 0, &function_e078c8db095a82b4);
    function_89384091f7a2dbd("REV_OB_ESCORT_ZOMBIES", 1, &escort_init);
    function_89384091f7a2dbd("REV_OB_ESCORT_ZOMBIES", 2, &function_65d47a407d91bf8f);
    function_89384091f7a2dbd("REV_OB_ESCORT_ZOMBIES", 3, &function_6c78c7079abcb33a);
    function_89384091f7a2dbd("REV_OB_ESCORT_ZOMBIES", 4, &function_1cc9926013901dc5);
    function_89384091f7a2dbd("REV_OB_ESCORT_ZOMBIES", 5, &function_937d984d2d97046);
    function_8b5b2a3392fc7e2a("PlayerJoin", &function_1531bbf5cff97dc0, "REV_OB_ESCORT_ZOMBIES");
    function_8b5b2a3392fc7e2a("PlayerLeave", &function_5c651df8cfad0810, "REV_OB_ESCORT_ZOMBIES");
    function_8b5b2a3392fc7e2a("PlayerAbandon", &function_540f9b357f3b5419, "REV_OB_ESCORT_ZOMBIES");
    function_48e697a59457ec45();
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcec
// Size: 0x102
function function_e078c8db095a82b4() {
    var_45c17c8bd7095cc4 = function_b9c4aa88ad97ee68(self);
    self.var_7fef38b419e7c59a = var_45c17c8bd7095cc4;
    self.var_1be7d142b0b72909 = getstruct(self.var_626b45032e1892da, "targetname");
    self.script_noteworthy = self.var_1be7d142b0b72909.script_noteworthy;
    self.var_d9a91303aea799de = function_a833053c48e37c08();
    self.var_71ad773e63984917 = function_dac4378812650312(self.var_d9a91303aea799de.origin);
    var_82d086ceee92acc3 = getstructarray(self.var_626b45032e1892da, "script_noteworthy");
    self.var_bd16f0d97883fd8d = var_82d086ceee92acc3[0];
    self.var_e44867ea28eabb63 = 0;
    thread function_97e82918ce08c384();
    if (!namespace_cfae3bfa0fa8d1dd::canspawnvehicle()) {
        namespace_a1fa5fb7614c23b6::function_c662924b60a37407("Reached max vehicle budget before Escort vehicle could spawn. Destroying contract.", @"hash_4a93c7546965668", self);
        namespace_4fda5d7358015a06::function_4bc22996edea81f1(self);
        return;
    } else {
        namespace_cfae3bfa0fa8d1dd::reservevehicle(1);
    }
    function_b6fc2c96b463c007(self);
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf5
// Size: 0x1e5
function escort_init() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    function_84610473025b148();
    thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_escort_air_drop_broadcast");
    namespace_cfae3bfa0fa8d1dd::clearvehiclereservation(1);
    self.var_1ff927c3faaf9638 = function_eb84ce326bfd8c06();
    if (!isdefined(self.var_1ff927c3faaf9638)) {
        namespace_a1fa5fb7614c23b6::function_c662924b60a37407("Attempted to Spawn Escort Vehicle but it returned undefined. Ending Contract.", @"hash_4a93c7546965668", self);
        namespace_41957062447a88fe::function_ad54e18b503363a0(self, self.var_6c29f2fdb0054bbe);
        return;
    }
    self.var_7a90b0904259aa6b = self.var_7fef38b419e7c59a.var_7a90b0904259aa6b;
    self.var_ace3d2f99e264fe5 = self.var_7fef38b419e7c59a.var_ace3d2f99e264fe5;
    self.var_70166afdd6c1c84 = self.var_7fef38b419e7c59a.var_70166afdd6c1c84;
    thread function_6ce4a40939aa527b();
    self notify("escort_mission_vo");
    function_2674a21020618651();
    self.var_1ff927c3faaf9638.var_364b797a8b03169b waittill("escort_started");
    self.var_1ff927c3faaf9638.var_364b797a8b03169b delete();
    wait_time = function_c619613f382927df("dx_ob_oesc_esca_acve_escbootup") + 1;
    self.var_1ff927c3faaf9638.var_4bf9260eb4f665f0 playsoundonmovingent("dx_ob_oesc_esca_acve_escbootup");
    self.var_1ff927c3faaf9638 setscriptablepartstate("engine", "start");
    self.var_1ff927c3faaf9638 setscriptablepartstate("panel", "activate");
    wait(wait_time);
    self.var_1ff927c3faaf9638.var_4bf9260eb4f665f0 playsoundonmovingent("dx_ob_oesc_esca_acve_escmovingout");
    self.var_1ff927c3faaf9638 setscriptablepartstate("beacon_light", "active");
    self.var_1ff927c3faaf9638 setscriptablepartstate("side_lights", "on");
    function_da11a8810b7c3bc8();
    thread function_230154c54b0b938();
    thread function_f2dfc1507d2deaae();
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe1
// Size: 0x104
function function_230154c54b0b938() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self.var_1ff927c3faaf9638 endon("death");
    var_f84c03de33d71429 = [0:"cleansed_02", 1:"cleansed_03", 2:"cleansed_04"];
    wait_time = self.var_1ff927c3faaf9638.var_c2c1024b2058e949 / var_f84c03de33d71429.size;
    while (1) {
        self.var_1ff927c3faaf9638 waittill("cleansing");
        for (i = 0; i < var_f84c03de33d71429.size; i++) {
            wait(wait_time);
            self.var_1ff927c3faaf9638 function_ab34d26620cac9d8(var_f84c03de33d71429[i]);
        }
        wait(1);
        self.var_1ff927c3faaf9638 notify("cleansed");
        self.var_1ff927c3faaf9638 function_444329a225699862();
        waitframe();
        self.var_1ff927c3faaf9638.var_c0a5dbb4a85fd7ff delete();
        self.var_1ff927c3faaf9638.var_562fe683021ca6f5 delete();
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10ec
// Size: 0x85
function private function_444329a225699862() {
    if (isdefined(self.var_42e7c4e8d9aface2)) {
        self.var_42e7c4e8d9aface2 delete();
    }
    if (isdefined(self.var_c667a493a31e90db)) {
        foreach (beam in self.var_c667a493a31e90db) {
            if (isdefined(beam)) {
                beam delete();
            }
        }
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1178
// Size: 0xf7
function function_dfa7a2237d6910d2() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self.var_1ff927c3faaf9638 endon("death");
    current_time = 0;
    while (istrue(self.var_1ff927c3faaf9638.var_5cd270934176a923)) {
        wait(1);
        current_time++;
        self.var_1ff927c3faaf9638.payload setscriptablepartstate("rocket", "countdown");
        self.var_1ff927c3faaf9638 setscriptablepartstate("rear_light", "countdown");
        self.var_1ff927c3faaf9638 childthread function_cd87cff6a50ddde(0.5);
        if (current_time >= self.var_1ff927c3faaf9638.launchtime) {
            self.var_1ff927c3faaf9638.var_5cd270934176a923 = 0;
        }
    }
    wait(1);
    self.var_1ff927c3faaf9638 notify("launch_complete");
    self.var_1ff927c3faaf9638 setscriptablepartstate("rear_light", "launch");
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1276
// Size: 0x30
function private function_cd87cff6a50ddde(n_delay) {
    self endon("death");
    if (isdefined(n_delay)) {
        wait(n_delay);
    }
    if (isdefined(self)) {
        self setscriptablepartstate("rear_light", "off");
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ad
// Size: 0x38
function function_1531bbf5cff97dc0(var_b381b0883bcd4847) {
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
    var_a83ac3549acc2da2 = var_b381b0883bcd4847.var_b494ea8c4b70490;
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ec
// Size: 0x22
function function_5c651df8cfad0810(var_b381b0883bcd4847) {
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1315
// Size: 0x69
function function_540f9b357f3b5419(var_b381b0883bcd4847) {
    wait(0.2);
    foreach (player in var_b381b0883bcd4847.playerlist) {
        function_4a508fcbbea05afd(player);
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1385
// Size: 0x26
function private function_4a508fcbbea05afd(player) {
    if (function_5acc35fc66331385(player, 17060)) {
        player ent_flag_clear("quest_s0a1t5_chaperone_start");
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b2
// Size: 0x1c
function function_83b117c976f47007() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    thread namespace_b3f32c8cb80b8124::function_e73a92bbeb2ae323();
    /#
    #/
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d5
// Size: 0x13a
function function_eb84ce326bfd8c06() {
    wait(1);
    spawndata = spawnstruct();
    spawndata.angles = self.var_d9a91303aea799de.angles;
    spawndata.team = self.var_6c29f2fdb0054bbe[0].team;
    spawndata.var_f16652e1462a3739 = 0;
    spawndata.origin = self.var_d9a91303aea799de.origin;
    spawndata.var_22aa4aa0cf0aa6bb = 1;
    spawndata.var_5bc025767c07fb9 = "rocket";
    spawndata.var_2f5d509d7b71ce9a = self;
    spawndata.nohitmarkers = 1;
    if (isdefined(self.script_noteworthy) && self.var_1be7d142b0b72909.script_noteworthy == self.script_noteworthy) {
        var_1ff927c3faaf9638 = namespace_801fa17f47560d76::function_66c684fea143fbfd("veh_jup_ob_tank_escort", spawndata);
        var_1ff927c3faaf9638.script_noteworthy = self.script_noteworthy;
        var_1ff927c3faaf9638 function_65aa053c077c003a(1);
        var_1ff927c3faaf9638 vehicleshowonminimap(0);
        var_1ff927c3faaf9638 function_1cd1ee312fd03bb4(1);
        self notify("vehicle_spawned");
        return var_1ff927c3faaf9638;
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1516
// Size: 0x82
function private function_43f53f0a182c23e6(str_state) {
    var_3e022eb1f587afda = getentitylessscriptablearray(self.var_626b45032e1892da + "_CRYSTAL", "script_noteworthy");
    foreach (crystal in var_3e022eb1f587afda) {
        crystal setscriptablepartstate("escort_crystal", str_state);
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x159f
// Size: 0x11a
function private function_6ce4a40939aa527b() {
    self.damageent = spawn_tag_origin();
    self.damageent.team = "team_two_hundred";
    var_3e022eb1f587afda = getentitylessscriptablearray(self.var_626b45032e1892da + "_CRYSTAL", "script_noteworthy");
    self.var_3e022eb1f587afda = var_3e022eb1f587afda;
    foreach (crystal in var_3e022eb1f587afda) {
        crystal setscriptablepartstate("escort_crystal", "open");
    }
    wait(1);
    foreach (crystal in var_3e022eb1f587afda) {
        crystal setscriptablepartstate("escort_crystal", "active");
        crystal thread function_8ae28f8ad7c0b4e(self);
    }
    /#
        iprintlnbold("cleansed");
    #/
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16c0
// Size: 0x59
function private function_8ae28f8ad7c0b4e(var_e6013eac45290cab) {
    self endon("destroyed");
    var_e6013eac45290cab endon("activity_ended");
    var_e6013eac45290cab endon("instance_destroyed");
    while (isdefined(var_e6013eac45290cab.damageent)) {
        radiusdamage(self.origin, 100, 2, 1, var_e6013eac45290cab.damageent);
        wait(1);
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1720
// Size: 0x4b
function function_a833053c48e37c08() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    var_a4e760bd72a35a21 = getvehiclenode(self.script_noteworthy, "targetname");
    if (!isdefined(var_a4e760bd72a35a21)) {
        var_a4e760bd72a35a21 = getstructarray(self.script_noteworthy, "targetname");
    }
    return var_a4e760bd72a35a21;
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1773
// Size: 0x1f8
function function_2674a21020618651() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self.var_1ff927c3faaf9638 vehicle_turnengineoff();
    self.var_1ff927c3faaf9638 setcandamage(0);
    self.var_1ff927c3faaf9638 function_c3682430b317ca26();
    self.var_1ff927c3faaf9638 thread function_9f2cf2de7d6032a2();
    self.var_1ff927c3faaf9638.var_4bf9260eb4f665f0 = spawn("script_model", self.var_1ff927c3faaf9638.origin);
    self.var_1ff927c3faaf9638.var_4bf9260eb4f665f0 linkto(self.var_1ff927c3faaf9638, "tag_origin", (0, 0, 78), (0, 0, 0));
    self.var_1ff927c3faaf9638.var_364b797a8b03169b = namespace_5775ad2badedbcaa::function_90472496b91b94b3(self.var_1ff927c3faaf9638.origin, 48, &function_8ea9cc3a882e6814, "JUP_OB_OBJECTIVES/ESCORT_ZOMBIES_START_ACV");
    self.var_1ff927c3faaf9638.var_364b797a8b03169b disableplayeruseforallplayers();
    self.var_1ff927c3faaf9638.var_364b797a8b03169b linkto(self.var_1ff927c3faaf9638, "tag_control_activate", (0, 0, 0), (0, 90, 0));
    self.var_1ff927c3faaf9638.nd_start = getvehiclenode(self.var_1ff927c3faaf9638.script_noteworthy, "targetname");
    self.var_1ff927c3faaf9638 waittill("freefall");
    thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_escort_arrive_convo_broadcast");
    wait(0.75);
    self.var_1ff927c3faaf9638 namespace_dbbb37eb352edf96::attach_vehicle(self.var_1ff927c3faaf9638.nd_start);
    self.var_1ff927c3faaf9638 setscriptablepartstate("panel", "open");
    self.var_1ff927c3faaf9638 thread function_5a233915821c0ea6(self);
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1972
// Size: 0x10d
function function_da11a8810b7c3bc8() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self.var_1ff927c3faaf9638.var_aa4804cc1bc59e93 = 1;
    self.var_1ff927c3faaf9638.var_1cb92917037d8996 = 0;
    self.var_1ff927c3faaf9638 function_315198e9ce4cd18c();
    self.var_1ff927c3faaf9638 function_eebf049c985aa4af(self);
    thread function_83b117c976f47007();
    self.var_1ff927c3faaf9638 thread namespace_dbbb37eb352edf96::vehicle_paths(self.var_1ff927c3faaf9638.nd_start);
    namespace_3bb9da687f15383d::gopath(self.var_1ff927c3faaf9638);
    thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_escort_briefing_broadcast");
    self.var_1ff927c3faaf9638 thread function_b3aa7145e80e6f9e(self);
    self.var_1ff927c3faaf9638 thread function_4e3e489bd31d3b7(self);
    self.var_1ff927c3faaf9638 thread function_9c9e518280bea222(self);
    self.var_1ff927c3faaf9638 thread function_1db9d507d5dd43da();
    thread function_baab7cceb29552a5();
    thread function_603daeacb4ffe869();
    thread function_8543cb813eebd318();
    thread function_a46548c342e333f7();
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a86
// Size: 0x17
function private function_84610473025b148() {
    namespace_262d6474998a2356::function_f0361294db9d74a7(100, 20);
    namespace_262d6474998a2356::function_c661dba3e304266b(100);
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aa4
// Size: 0x21a
function function_8543cb813eebd318() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self.var_1ff927c3faaf9638 endon("death");
    n_start_health = self.var_1ff927c3faaf9638.health;
    var_d3f9d2fc8ac619b1 = 0;
    var_a905d9404522f094 = 0;
    var_eb40bbae0dbac309 = 0;
    while (1) {
        eventid = einflictor = normal = angles = origin = objweapon = idflags = var_920ff4456ce9a2fc = var_1d3f20a69ced2dd5 = var_9e834fe6754a9c98 = smeansofdeath = vpoint = vdir = eattacker = idamage = self.var_1ff927c3faaf9638 waittill("damage");
        if (isdefined(eattacker) && isplayer(eattacker) && isdefined(idamage)) {
            self.var_1ff927c3faaf9638.health = self.var_1ff927c3faaf9638.health + idamage;
        } else {
            /#
                iprintlnbold(self.var_1ff927c3faaf9638.health);
            #/
            function_32df7454369064fb(self.var_1ff927c3faaf9638.health, n_start_health);
            if (isdefined(vpoint)) {
                playsoundatpos(vpoint, "evt_ob_obj_acv_damage");
            }
            if (!var_a905d9404522f094 && self.var_1ff927c3faaf9638.health <= n_start_health * 0.75) {
                var_a905d9404522f094 = 1;
                thread function_88cf521697f00f27(1);
            } else if (!var_eb40bbae0dbac309 && self.var_1ff927c3faaf9638.health <= n_start_health * 0.25) {
                var_eb40bbae0dbac309 = 1;
                thread function_88cf521697f00f27(2);
            }
        }
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1cc5
// Size: 0x66
function private function_32df7454369064fb(currentvalue, var_6e2c8ae84f3a9fae) {
    n_percent = 0;
    if (isdefined(currentvalue) && isdefined(var_6e2c8ae84f3a9fae) && var_6e2c8ae84f3a9fae > 0) {
        var_e6bcd0fd977eddde = currentvalue / var_6e2c8ae84f3a9fae * 100;
        n_percent = clamp(var_e6bcd0fd977eddde, 0, 100);
        n_percent = int(n_percent);
    }
    namespace_262d6474998a2356::function_f0361294db9d74a7(n_percent);
    namespace_262d6474998a2356::function_c661dba3e304266b(n_percent);
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d32
// Size: 0x2d
function private function_c619613f382927df(str_alias) {
    var_c5fd8d562611e0e4 = lookupsoundlength(str_alias);
    var_c5fd8d562611e0e4 = float(var_c5fd8d562611e0e4);
    var_c5fd8d562611e0e4 = var_c5fd8d562611e0e4 / 1000;
    return var_c5fd8d562611e0e4;
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d67
// Size: 0xd8
function function_a46548c342e333f7() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self.var_1ff927c3faaf9638 endon("rocket_launched");
    self.var_1ff927c3faaf9638 waittill("death");
    self.var_1ff927c3faaf9638.var_62d3e41a9d24b2e2 = 1;
    thread function_cb078cbf493f2b94();
    if (isdefined(self.var_1ff927c3faaf9638.payload)) {
        self.payload = self.var_1ff927c3faaf9638.payload;
        var_ae7ca531f6c86ee4 = self.var_1ff927c3faaf9638 gettagorigin("tag_attach_rocket");
        thread function_7122f1d1f05e191c(var_ae7ca531f6c86ee4, self.var_1ff927c3faaf9638.angles);
    }
    self.var_1ff927c3faaf9638.var_1cb92917037d8996 = 0;
    function_a1bfca674edbfb4d(0);
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e46
// Size: 0x6e
function function_a1bfca674edbfb4d(success) {
    if (!success) {
        foreach (player in self.var_6c29f2fdb0054bbe) {
            function_4a508fcbbea05afd(player);
        }
    }
    function_612d18fdbc979c0b(self, success);
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ebb
// Size: 0x23b
function function_baab7cceb29552a5() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self.var_1ff927c3faaf9638 endon("death");
    self.var_1ff927c3faaf9638.progress = 0;
    while (1) {
        self.var_1ff927c3faaf9638 waittill("neutralize");
        self.var_1ff927c3faaf9638 function_fdda881efcfe245e();
        self.var_1ff927c3faaf9638.var_1cb92917037d8996 = 1;
        thread function_e4d01e8e0a294fc8(self.var_7fef38b419e7c59a.var_a4a4466b853d97d);
        self.var_1ff927c3faaf9638 function_c3682430b317ca26();
        self.var_1ff927c3faaf9638 function_65aa053c077c003a(1);
        self.var_1ff927c3faaf9638 vehicle_setspeedimmediate(0, self.var_1ff927c3faaf9638.accel, self.var_1ff927c3faaf9638.decel);
        self.var_1ff927c3faaf9638 pausepath(0);
        self.var_1ff927c3faaf9638 function_251b4856d66f56eb();
        self.var_1ff927c3faaf9638 thread function_33acb64174d30e83();
        wait(0.2);
        self.var_1ff927c3faaf9638 function_ab34d26620cac9d8("cleansed_01");
        self.var_1ff927c3faaf9638 notify("cleansing");
        self.var_1ff927c3faaf9638 thread function_fa1dfe49dc65f703(self);
        self.var_1ff927c3faaf9638 thread function_6e1c45b2ef2eea51(self);
        self.var_1ff927c3faaf9638 waittill("cleansed");
        thread function_ec872f85aad96184();
        self.var_1ff927c3faaf9638.progress++;
        self.var_1ff927c3faaf9638 thread function_9df197808742ed1c();
        self.var_1ff927c3faaf9638 function_ee05e3fc9e78dffd(self);
        self.var_1ff927c3faaf9638.var_1cb92917037d8996 = 0;
        if (self.var_1ff927c3faaf9638.final_stop == 1) {
            break;
        } else if (self.var_1ff927c3faaf9638.progress == 1) {
            thread function_46c5c5dc4eb70411();
        } else if (!istrue(self.var_ab38de8a32717302) && self.var_1ff927c3faaf9638.progress == 2) {
            thread function_aae497883f04b1c6();
        }
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x20fd
// Size: 0x5b
function private function_9df197808742ed1c() {
    var_22b5bcbc290e0d3c = [0:"fill_onethird", 1:"fill_twothirds", 2:"fill_full"];
    if (self.progress <= var_22b5bcbc290e0d3c.size) {
        self.payload setscriptablepartstate("vials", var_22b5bcbc290e0d3c[self.progress - 1]);
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x215f
// Size: 0x1c
function private function_9f2cf2de7d6032a2() {
    self.payload setscriptablepartstate("vials", "empty");
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2182
// Size: 0x83
function private function_6e1c45b2ef2eea51(var_2f5d509d7b71ce9a) {
    switch (self.progress) {
    case 0:
        function_3df5cdf48ba6eca(1, var_2f5d509d7b71ce9a, self.var_c2c1024b2058e949);
        break;
    case 1:
        function_3df5cdf48ba6eca(2, var_2f5d509d7b71ce9a, self.var_c2c1024b2058e949);
        break;
    default:
        function_3df5cdf48ba6eca(3, var_2f5d509d7b71ce9a, self.var_c2c1024b2058e949);
        break;
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x220c
// Size: 0x134
function private function_3df5cdf48ba6eca(spawncount, var_2f5d509d7b71ce9a, f_time) {
    self endon("death");
    spawns = 0;
    var_e10a98520809d260 = random(self.var_2f1c4d610c6efd62);
    a_s_pts = function_a9c50e82fb0f743a();
    /#
        assertex(isdefined(a_s_pts), "Escort Error: No structs were setup to spawn a neutralize ambush!");
    #/
    var_b404ee101124e2f0 = "ai_encounter:" + var_e10a98520809d260.encounter;
    var_9e3cc96b3a2c2e2c = self.var_7a90b0904259aa6b;
    timer = f_time / spawncount;
    var_bd11f8c1740eafcd = clamp(timer, 5, 15);
    while (1) {
        if (isdefined(a_s_pts)) {
            a_s_pts = array_randomize(a_s_pts);
            v_ground = a_s_pts[0].origin;
            var_be8ebaf932e93656 = var_2f5d509d7b71ce9a function_f8ccadcd850da124(var_b404ee101124e2f0, v_ground, var_9e3cc96b3a2c2e2c, 1, 0, 1, 2);
            /#
                function_d37068aac7785c04(var_be8ebaf932e93656, var_2f5d509d7b71ce9a.var_71ad773e63984917, 1);
            #/
            spawns++;
            if (spawns >= spawncount) {
                break;
            }
        }
        wait(var_bd11f8c1740eafcd);
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2347
// Size: 0x139
function private function_fa1dfe49dc65f703(var_2f5d509d7b71ce9a) {
    /#
        assertex(isdefined(self.crystal.target), "Escort Error: Crystal Scriptable did not have a valid target KVP!");
    #/
    if (isdefined(self.crystal.target)) {
        var_7a6ea3d91b32f0eb = getstruct(self.crystal.target, "targetname");
        /#
            assertex(isdefined(var_7a6ea3d91b32f0eb), "Escort Error: No valid struct found for horde spawn location!");
        #/
        v_ground = var_7a6ea3d91b32f0eb.origin;
        playsoundatpos(v_ground + (0, 0, 50), "evt_ob_obj_acv_zm_incoming_stinger");
        earthquake(0.4, 1, v_ground, 1500);
        var_e10a98520809d260 = random(var_2f5d509d7b71ce9a.var_7fef38b419e7c59a.var_5fcaf114c800213);
        var_b404ee101124e2f0 = "ai_encounter:" + var_e10a98520809d260.encounter;
        var_be8ebaf932e93656 = var_2f5d509d7b71ce9a function_f8ccadcd850da124(var_b404ee101124e2f0, v_ground, 500, 1, 0, 1, 2);
        /#
            function_d37068aac7785c04(var_be8ebaf932e93656, var_2f5d509d7b71ce9a.var_71ad773e63984917, 1);
        #/
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2487
// Size: 0x35
function private function_251b4856d66f56eb() {
    self endon("death");
    self.var_4bf9260eb4f665f0 playsoundonmovingent("dx_ob_oesc_esca_acve_escneutralizestart");
    self setscriptablepartstate("maw", "maw_open");
    wait(2.5);
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x24c3
// Size: 0x57
function private function_ee05e3fc9e78dffd(var_2f5d509d7b71ce9a) {
    self endon("death");
    if (self.progress < var_2f5d509d7b71ce9a.var_3e022eb1f587afda.size) {
        self.var_4bf9260eb4f665f0 playsoundonmovingent("dx_ob_oesc_esca_acve_esccontaincomplete");
    }
    self setscriptablepartstate("maw", "maw_close");
    wait(2.5);
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2521
// Size: 0x347
function private function_33acb64174d30e83() {
    self endon("cleansed");
    self endon("death");
    v_start = self gettagorigin("tag_fx_beam");
    v_angles = self gettagangles("tag_fx_beam");
    self setscriptablepartstate("maw", "beam_begin");
    self.var_4bf9260eb4f665f0 playsoundonmovingent("dx_ob_oesc_esca_acve_esccontainstart");
    if (isdefined(self.crystal)) {
        crystal = self.crystal;
        v_end = crystal.origin;
        self.var_c0a5dbb4a85fd7ff = spawn("script_model", crystal.origin);
        self.var_c0a5dbb4a85fd7ff setmodel("tag_origin");
        var_547f2dfac34847b1 = vectortoangles(v_start - self.var_c0a5dbb4a85fd7ff.origin);
        self.var_c0a5dbb4a85fd7ff rotateto(var_547f2dfac34847b1, 0.1);
        var_f87034d226e76eb3 = v_start + vectornormalize(v_end - v_start) * 80;
        self.var_562fe683021ca6f5 = spawn("script_model", var_f87034d226e76eb3);
        self.var_562fe683021ca6f5 setmodel("tag_origin");
        self.var_562fe683021ca6f5 linkto(self);
        waitframe();
        function_afed347bad41b68a();
        playfxontag(getfx("escort_laser_glow_energy_point"), self.var_562fe683021ca6f5, "tag_origin");
        wait(0.2);
        self.var_42e7c4e8d9aface2 = playfxontagsbetweenclients(getfx("escort_laser_ch"), self, "tag_fx_beam", self.var_c0a5dbb4a85fd7ff, "tag_origin");
        if (isdefined(self.var_42e7c4e8d9aface2)) {
            self.var_42e7c4e8d9aface2 forcenetfieldhighlod(1);
        }
        playfxontag(getfx("escort_laser_absorb"), self.var_c0a5dbb4a85fd7ff, "tag_origin");
        while (1) {
            contents = namespace_2a184fc4902783dc::create_character_contents();
            ignorelist = [];
            results = physics_spherecast(v_start, v_end, 20, contents, ignorelist, "physicsquery_all");
            foreach (cast in results) {
                ent = cast["entity"];
                if (isdefined(ent.team) && ent.team == "team_two_hundred") {
                    if (9999 >= ent.health) {
                        ent ent_flag_set("plasma_death");
                    }
                    ent dodamage(9999, self.origin, self, undefined, "MOD_ELEMENTAL_ELEC");
                }
                if (isplayer(ent)) {
                    ent dodamage(1, self.origin, self.var_cc6cbe86a87c577e, undefined, "MOD_ELEMENTAL_ELEC");
                }
            }
            /#
                sphere(self.var_562fe683021ca6f5.origin, 20, (1, 0, 0), undefined, 1);
            #/
            wait(0.5);
        }
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x286f
// Size: 0xd6
function private function_afed347bad41b68a() {
    fx_tags = [0:"tag_fx_maw_laser_top", 1:"tag_fx_maw_laser_bottom", 2:"tag_fx_maw_laser_right", 3:"tag_fx_maw_laser_left"];
    self.var_c667a493a31e90db = [];
    foreach (fx_tag in fx_tags) {
        self.var_c667a493a31e90db[self.var_c667a493a31e90db.size] = playfxontagsbetweenclients(getfx("escort_laser_sm"), self, fx_tag, self.var_562fe683021ca6f5, "tag_origin");
        self.var_c667a493a31e90db[self.var_c667a493a31e90db.size - 1] forcenetfieldhighlod(1);
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x294c
// Size: 0x5e
function private function_fdda881efcfe245e() {
    nd_current = self.currentnode;
    if (isdefined(nd_current.script_label)) {
        var_3e022eb1f587afda = getentitylessscriptablearray(nd_current.script_label, "targetname");
        crystal = var_3e022eb1f587afda[0];
        self.crystal = crystal;
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x29b1
// Size: 0x2e
function private function_ab34d26620cac9d8(str_state) {
    if (isdefined(self.crystal)) {
        self.crystal setscriptablepartstate("escort_crystal", str_state);
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x29e6
// Size: 0x103
function private function_ec872f85aad96184() {
    self.var_1ff927c3faaf9638 setscriptablepartstate("maw", "beam_end");
    self.var_1ff927c3faaf9638 function_ab34d26620cac9d8("destroyed");
    wait(0.25);
    var_8b5d67506db76ec = 500;
    v_origin = self.var_1ff927c3faaf9638.crystal.origin;
    radiusdamage(v_origin, var_8b5d67506db76ec, 200, 100, self.var_1ff927c3faaf9638);
    a_ai = getaiarrayinradius(v_origin, var_8b5d67506db76ec, "team_two_hundred");
    foreach (ai in a_ai) {
        ai namespace_db1ce2c035564e2c::function_e96aac065abbec4e(v_origin);
    }
    self.var_1ff927c3faaf9638.crystal notify("destroyed");
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2af0
// Size: 0x18a
function private function_9ead1dc90952b037(var_2f5d509d7b71ce9a) {
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    self endon("death");
    var_eb33024041d39010 = var_2f5d509d7b71ce9a.var_7fef38b419e7c59a.launchtime;
    total_time = var_eb33024041d39010 + 4;
    var_2f5d509d7b71ce9a thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_escort_vortex_03_complete_conv_broadcast");
    self.var_5cd270934176a923 = 1;
    self setscriptablepartstate("beacon_light", "off");
    self setscriptablepartstate("headlight_left", "off");
    self setscriptablepartstate("headlight_right", "off");
    thread function_3df5cdf48ba6eca(2, var_2f5d509d7b71ce9a, total_time);
    var_2f5d509d7b71ce9a thread function_e4d01e8e0a294fc8(var_2f5d509d7b71ce9a.var_7fef38b419e7c59a.var_a4a4466b853d97d);
    wait(4);
    if (isdefined(self.payload)) {
        self.payload setscriptablepartstate("rocket", "init");
        self.payload setscriptablepartstate("body", "init");
    }
    self setscriptablepartstate("rear_light", "countdown_begin");
    thread function_cd87cff6a50ddde(0.75);
    wait(3);
    if (isdefined(self)) {
        self.var_4bf9260eb4f665f0 playsoundonmovingent("dx_ob_oesc_esca_acve_esclaunchseqstart");
        if (isdefined(self)) {
            var_2f5d509d7b71ce9a thread function_dfa7a2237d6910d2();
        }
    }
    self waittill("launch_complete");
    namespace_dbbb37eb352edf96::godon();
    var_2f5d509d7b71ce9a thread function_c1de7c2624911246(self);
    thread function_372d5a3adb0626d0();
    var_2f5d509d7b71ce9a.var_e44867ea28eabb63 = 1;
    self notify("rocket_launched");
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2c81
// Size: 0xb3
function private function_372d5a3adb0626d0() {
    earthquake(0.8, 1.6, self.origin, 750);
    if (isdefined(self.payload)) {
        self.payload unlink();
        self.payload setscriptablepartstate("body", "idle");
        self.payload setscriptablepartstate("rocket", "movement");
        self.payload connectpaths();
        self.payload movez(5000, 10, 10);
    }
    wait(10);
    if (isdefined(self.payload)) {
        self.payload delete();
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d3b
// Size: 0x11e
function private function_c1de7c2624911246(var_45942ecbb52f3404) {
    radius = 250;
    magnitude = 120;
    radiusdamage(var_45942ecbb52f3404.origin, 250, 400, 300, self.var_1ff927c3faaf9638);
    foreach (ent in function_143526130b12b2b6(var_45942ecbb52f3404.origin, radius)) {
        if (isplayer(ent)) {
            ent knockback(ent.origin - var_45942ecbb52f3404.origin, radius * magnitude / length(ent.origin - var_45942ecbb52f3404.origin));
        } else if (isdefined(ent.team) && ent.team == "team_two_hundred") {
            ent namespace_db1ce2c035564e2c::function_e96aac065abbec4e(var_45942ecbb52f3404.origin);
        }
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e60
// Size: 0x75
function function_f2dfc1507d2deaae() {
    self.var_1ff927c3faaf9638.final_stop = 0;
    self.var_1ff927c3faaf9638 waittill("final_stop");
    self.var_1ff927c3faaf9638.final_stop = 1;
    self.var_1ff927c3faaf9638 notify("neutralize");
    self.var_1ff927c3faaf9638 waittill("cleansed");
    wait(0.1);
    self.var_1ff927c3faaf9638 function_9ead1dc90952b037(self);
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2edc
// Size: 0xef
function function_e4d01e8e0a294fc8(var_890c2a3be167e8d1) {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self.var_1ff927c3faaf9638 endon("death");
    self.var_1ff927c3faaf9638 endon("cleansed");
    self.var_1ff927c3faaf9638 endon("rocket_launched");
    var_9e3cc96b3a2c2e2c = self.var_ace3d2f99e264fe5;
    var_e10a98520809d260 = random(var_890c2a3be167e8d1);
    var_b404ee101124e2f0 = "ai_flood_fill_encounter:" + var_e10a98520809d260.var_a7b3c9c1e339e5fc;
    var_be8ebaf932e93656 = function_f8ccadcd850da124(var_b404ee101124e2f0, self.var_1ff927c3faaf9638.origin, var_9e3cc96b3a2c2e2c, 1, 0, 1, 2);
    /#
        function_d37068aac7785c04(var_be8ebaf932e93656, self.var_71ad773e63984917, 1);
    #/
    function_c67c7b9e7cbf3821(var_be8ebaf932e93656, &function_2e62ea3d9cf903c8, undefined);
    function_c6942df117004b8(var_be8ebaf932e93656, &function_81c821849ca00d25, self.var_1ff927c3faaf9638);
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fd2
// Size: 0x16
function function_2e62ea3d9cf903c8(requestid, userdata) {
    return 1;
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ff0
// Size: 0x51
function function_81c821849ca00d25(requestid, userdata) {
    if (isdefined(userdata.var_5cd270934176a923)) {
        return !userdata.var_5cd270934176a923;
    } else if (isdefined(userdata.var_1cb92917037d8996)) {
        return !userdata.var_1cb92917037d8996;
    }
    return 1;
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3049
// Size: 0x254
function function_eebf049c985aa4af(var_2f5d509d7b71ce9a) {
    self.team = level.players[0].team;
    self.health = var_2f5d509d7b71ce9a.var_7fef38b419e7c59a.var_c200b42fc349b0cb;
    self.var_c2c1024b2058e949 = var_2f5d509d7b71ce9a.var_7fef38b419e7c59a.var_2cfefd04e3fce3df;
    self.launchtime = var_2f5d509d7b71ce9a.var_7fef38b419e7c59a.launchtime;
    self.var_6201fb806ad1b5d7 = var_2f5d509d7b71ce9a.var_7fef38b419e7c59a.var_de0c6b19da7810df;
    self.var_9efb3de7b9d1acdc = var_2f5d509d7b71ce9a.var_7fef38b419e7c59a.var_9efb3de7b9d1acdc;
    self.accel = var_2f5d509d7b71ce9a.var_7fef38b419e7c59a.var_bfc1f64b3dc5794f;
    self.decel = var_2f5d509d7b71ce9a.var_7fef38b419e7c59a.var_247535d1723e67f6;
    self.proximity = var_2f5d509d7b71ce9a.var_7fef38b419e7c59a.var_aab5a7e2da4b4756;
    self.var_32bfc08679c004bc = var_2f5d509d7b71ce9a.var_7fef38b419e7c59a.var_31c07988f05debcf;
    self.var_7a90b0904259aa6b = var_2f5d509d7b71ce9a.var_7fef38b419e7c59a.var_7a90b0904259aa6b;
    self.var_ca98ebe9bd5a43e1 = var_2f5d509d7b71ce9a.var_7fef38b419e7c59a.var_263f2ec1d2d230aa;
    self.var_2f1c4d610c6efd62 = var_2f5d509d7b71ce9a.var_7fef38b419e7c59a.var_95befe60b7ccfec6;
    self.var_c70842e4e81f2852 = 1;
    self.var_fa004eae3663dc6c = 2;
    if (getdvar(@"hash_a3cd7baf4609ce24", "-1") != "-1") {
        self.health = getdvarint(@"hash_a3cd7baf4609ce24");
    }
    if (getdvar(@"hash_1138e73c40e1324a", "-1") != "-1") {
        self.var_6201fb806ad1b5d7 = getdvarfloat(@"hash_1138e73c40e1324a");
    }
    self setcandamage(1);
    self function_65aa053c077c003a(0);
    self.attractor = function_c7a50ec2829c70b3(self, 1, self.var_32bfc08679c004bc, 1, undefined, &function_1282eec91da30219);
    function_24879cc9b7867fa9(self.attractor, 90);
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32a4
// Size: 0x2f5
function function_b3aa7145e80e6f9e(var_2f5d509d7b71ce9a) {
    self endon("death");
    self endon("reached_end_node");
    var_733dcf6c70fe2413 = squared(self.proximity);
    self.var_58bc745bb9d47fb = 0;
    while (1) {
        self.var_4d5a87edd3847f2f = 0;
        self.n_players = 0;
        a_players = var_2f5d509d7b71ce9a.var_6c29f2fdb0054bbe;
        foreach (player in a_players) {
            if (isdefined(player) && isdefined(self) && distancesquared(self.origin, player.origin) <= var_733dcf6c70fe2413) {
                self.var_4d5a87edd3847f2f = 1;
                self.n_players++;
            }
        }
        n_players = self.n_players - 1;
        n_players = clamp(n_players, 0, 3);
        var_578e9d1584d07d25 = n_players * self.var_9efb3de7b9d1acdc + 1;
        self.n_speed = self.var_6201fb806ad1b5d7 * var_578e9d1584d07d25;
        self.n_speed = clamp(self.n_speed, 1, 12);
        wait(0.5);
        if (!self.var_4d5a87edd3847f2f || istrue(self.var_1cb92917037d8996) || istrue(self.final_stop)) {
            self vehicle_setspeedimmediate(0, self.accel, self.decel);
            self function_65aa053c077c003a(1);
            waitframe();
            self pausepath(0);
            function_c3682430b317ca26();
            if (!self.var_4d5a87edd3847f2f && !self.var_1cb92917037d8996 && !self.final_stop) {
                self setscriptablepartstate("chassis", "alert");
                self setscriptablepartstate("beacon_light", "alert");
                self setscriptablepartstate("headlight_left", "alert");
                self setscriptablepartstate("headlight_right", "alert");
                self setscriptablepartstate("brakes", "on");
                self notify("no_escorts");
            }
        } else {
            self function_65aa053c077c003a(0);
            self resumepath();
            waitframe();
            function_315198e9ce4cd18c();
            self vehicle_setspeedimmediate(self.n_speed, self.accel, self.decel);
            self setscriptablepartstate("beacon_light", "active");
            self setscriptablepartstate("headlight_left", "active");
            self setscriptablepartstate("headlight_right", "active");
            self setscriptablepartstate("brakes", "off");
        }
        vehspeed = self vehicle_getspeed();
        if (vehspeed <= self.var_fa004eae3663dc6c) {
            function_a52670a99736f59d();
        } else {
            function_6e427a8504ec078c();
        }
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x35a0
// Size: 0xd4
function private function_1db9d507d5dd43da() {
    self endon("death");
    var_42fa32d918d93e7d = [0:"sentry_turret", 1:"remote_turret"];
    self vehphys_enablecollisioncallback(1);
    while (1) {
        partenum = ent = normalspeed = normal = position = flag1 = flag0 = body1 = body0 = self waittill("collision");
        if (isdefined(ent.turrettype) && array_contains(var_42fa32d918d93e7d, ent.turrettype)) {
            ent notify("kill_turret", 1);
        }
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x367b
// Size: 0x10b
function function_a52670a99736f59d() {
    self endon("death");
    if (self.var_58bc745bb9d47fb == 0) {
        return;
    }
    var_c38db2e51d5f66a2 = anglestoforward(self.angles);
    var_e560aa662258c25d = anglestoright(self.angles);
    var_40fc788beae80d60 = [];
    var_1f46821b0fd03c67 = function_fc784a7d07e0449a(36, -90, var_c38db2e51d5f66a2, var_e560aa662258c25d);
    var_40fc788beae80d60 = function_6d6af8144a5131f1(var_40fc788beae80d60, var_1f46821b0fd03c67);
    var_1f46821b0fd03c67 = function_fc784a7d07e0449a(36, 90, var_c38db2e51d5f66a2, var_e560aa662258c25d);
    var_40fc788beae80d60 = function_6d6af8144a5131f1(var_40fc788beae80d60, var_1f46821b0fd03c67);
    var_1f46821b0fd03c67 = function_fc784a7d07e0449a(-24, -90, var_c38db2e51d5f66a2, var_e560aa662258c25d);
    var_40fc788beae80d60 = function_6d6af8144a5131f1(var_40fc788beae80d60, var_1f46821b0fd03c67);
    var_1f46821b0fd03c67 = function_fc784a7d07e0449a(-24, 90, var_c38db2e51d5f66a2, var_e560aa662258c25d);
    var_40fc788beae80d60 = function_6d6af8144a5131f1(var_40fc788beae80d60, var_1f46821b0fd03c67);
    var_1f46821b0fd03c67 = function_fc784a7d07e0449a(-72, -90, var_c38db2e51d5f66a2, var_e560aa662258c25d);
    var_40fc788beae80d60 = function_6d6af8144a5131f1(var_40fc788beae80d60, var_1f46821b0fd03c67);
    var_1f46821b0fd03c67 = function_fc784a7d07e0449a(-72, 90, var_c38db2e51d5f66a2, var_e560aa662258c25d);
    var_40fc788beae80d60 = function_6d6af8144a5131f1(var_40fc788beae80d60, var_1f46821b0fd03c67);
    function_357609ca7ca5486e(self.attractor, var_40fc788beae80d60);
    self.var_58bc745bb9d47fb = 0;
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x378d
// Size: 0x42
function function_6e427a8504ec078c() {
    self endon("death");
    if (self.var_58bc745bb9d47fb == 1) {
        return;
    }
    var_acaf8ee60aa06516 = [];
    function_357609ca7ca5486e(self.attractor, var_acaf8ee60aa06516);
    self.var_58bc745bb9d47fb = 1;
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37d6
// Size: 0x52
function function_fc784a7d07e0449a(xoffset, yoffset, var_379097055795a272, var_a46e92474e3e644d) {
    var_1e0625e95bbc715c = spawnstruct();
    var_1e0625e95bbc715c.origin = self.origin + var_379097055795a272 * xoffset + var_a46e92474e3e644d * yoffset;
    return var_1e0625e95bbc715c;
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3830
// Size: 0x41
function function_4e3e489bd31d3b7(var_2f5d509d7b71ce9a) {
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    self endon("reached_end_node");
    self endon("death");
    while (1) {
        self waittill("ambush");
        thread function_908ef63da5570348(var_2f5d509d7b71ce9a);
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3878
// Size: 0xb8
function function_1282eec91da30219(attractor, zombie) {
    if (isdefined(zombie.var_941802a0997e0c42)) {
        return 0;
    }
    if (isdefined(level.players)) {
        player = getclosest(zombie.origin, level.players, 3500);
        if (isdefined(player) && distance2dsquared(zombie.origin, player.origin) < distance2dsquared(zombie.origin, attractor.source.origin)) {
            return 0;
        }
    }
    if (isalive(zombie) && isdefined(attractor)) {
        return 1;
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3937
// Size: 0x149
function private function_5a233915821c0ea6(var_2f5d509d7b71ce9a) {
    self.var_364b797a8b03169b endon("escort_started");
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    while (isdefined(self.var_364b797a8b03169b)) {
        var_1e5c3e3065486ea9 = anglestoforward(self.angles);
        foreach (player in var_2f5d509d7b71ce9a.var_6c29f2fdb0054bbe) {
            dot = vectordot(var_1e5c3e3065486ea9, anglestoforward(player.angles));
            if (dot >= 0.6) {
                fov = cos(20);
                if (player GetCameraThirdPerson()) {
                    fov = cos(75);
                }
                if (within_fov(player geteye(), player.angles, self.var_364b797a8b03169b.origin, fov)) {
                    self.var_364b797a8b03169b enableplayeruse(player);
                }
            } else {
                self.var_364b797a8b03169b disableplayeruse(player);
            }
        }
        wait(0.2);
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a87
// Size: 0x4e
function function_8ea9cc3a882e6814(player) {
    if (!isplayer(player)) {
        return;
    }
    if (istrue(player.inlaststand) || !isalive(player)) {
        return;
    }
    if (player isreloading() || player isgestureplaying()) {
        return;
    }
    player thread function_86953a5b59ac4e80(self);
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3adc
// Size: 0xb6
function function_86953a5b59ac4e80(interact) {
    self setstance("stand");
    self freezecontrols(1);
    time = self getgestureanimlength("jup_ges_button_press_01");
    self forceplaygestureviewmodel("jup_ges_button_press_01");
    vehicle = interact getlinkedparent();
    wait(time * 0.275);
    if (istrue(self.inlaststand) || !isalive(self)) {
        self freezecontrols(0);
        return;
    }
    vehicle setscriptablepartstate("screen", "on");
    vehicle setscriptablepartstate("button", "pressed");
    wait(time * 0.25);
    self freezecontrols(0);
    interact notify("escort_started");
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b99
// Size: 0x59
function function_603daeacb4ffe869() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self.var_1ff927c3faaf9638 endon("death");
    self.var_1ff927c3faaf9638 waittill("rocket_launched");
    function_349b67890a05c376(self.var_1ff927c3faaf9638.attractor);
    wait(5);
    function_a1bfca674edbfb4d(1);
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bf9
// Size: 0x12e
function function_908ef63da5570348(var_2f5d509d7b71ce9a) {
    self endon("death");
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    var_e10a98520809d260 = random(var_2f5d509d7b71ce9a.var_7fef38b419e7c59a.var_912c7830c87610c3);
    a_s_pts = function_a9c50e82fb0f743a();
    /#
        assertex(isdefined(a_s_pts), "Escort Error: No structs were found to spawn an ambush!");
    #/
    var_b404ee101124e2f0 = "ai_encounter:" + var_e10a98520809d260.encounter;
    var_9e3cc96b3a2c2e2c = self.var_7a90b0904259aa6b;
    if (isdefined(a_s_pts)) {
        a_s_pts = array_randomize(a_s_pts);
        v_ground = a_s_pts[0].origin;
        var_be8ebaf932e93656 = var_2f5d509d7b71ce9a function_f8ccadcd850da124(var_b404ee101124e2f0, v_ground, var_9e3cc96b3a2c2e2c, 1, 0, 1, 2);
        /#
            function_d37068aac7785c04(var_be8ebaf932e93656, var_2f5d509d7b71ce9a.var_71ad773e63984917, 1);
        #/
        return;
    }
    v_ground = function_a6441613846cbe1b();
    if (!isdefined(v_ground)) {
        return;
    }
    var_be8ebaf932e93656 = var_2f5d509d7b71ce9a function_f8ccadcd850da124(var_b404ee101124e2f0, v_ground, var_9e3cc96b3a2c2e2c, 1, 0, 1, 2);
    /#
        function_d37068aac7785c04(var_be8ebaf932e93656, var_2f5d509d7b71ce9a.var_71ad773e63984917, 1);
    #/
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d2e
// Size: 0x7f
function function_a9c50e82fb0f743a() {
    self endon("death");
    nd_current = self.currentnode;
    s_pt = undefined;
    /#
        assertex(isdefined(nd_current.target2), "Escort Error: Vehicle node did not have a valid target2 KVP!");
    #/
    if (isdefined(nd_current.target2)) {
        a_s_pts = getstructarray(nd_current.target2, "targetname");
    } else {
        return;
    }
    if (isdefined(a_s_pts)) {
        return a_s_pts;
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3db4
// Size: 0x40
function function_1cc9926013901dc5() {
    centerpoint = undefined;
    if (isdefined(self.var_1ff927c3faaf9638)) {
        centerpoint = self.var_1ff927c3faaf9638.origin + (0, 0, 48);
    }
    return centerpoint;
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dfc
// Size: 0x36
function function_6c78c7079abcb33a() {
    self.var_56235f5709b42a2a = 1;
    function_cb078cbf493f2b94();
    function_43f53f0a182c23e6("hidden");
    if (isdefined(self.var_1ff927c3faaf9638)) {
        thread function_dde0f987d9eb62a6();
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3e39
// Size: 0xaa
function private function_dde0f987d9eb62a6() {
    vehicle = self.var_1ff927c3faaf9638;
    while (isdefined(vehicle) && !vehicle vehicle_isonground()) {
        /#
            iprintln("contract_escort_arrive_convo_broadcast");
        #/
        wait(0.1);
    }
    if (isdefined(vehicle.payload)) {
        self.payload = vehicle.payload;
        var_ae7ca531f6c86ee4 = vehicle gettagorigin("tag_attach_rocket");
        thread function_7122f1d1f05e191c(var_ae7ca531f6c86ee4, self.var_1ff927c3faaf9638.angles);
    }
    if (!istrue(vehicle.var_62d3e41a9d24b2e2)) {
        thread function_5969f20c2a27e510(vehicle);
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3eea
// Size: 0x12d
function private function_cb078cbf493f2b94() {
    if (isdefined(self.damageent)) {
        self.damageent delete();
    }
    if (isdefined(self.var_1ff927c3faaf9638)) {
        if (isdefined(self.var_1ff927c3faaf9638.var_364b797a8b03169b)) {
            self.var_1ff927c3faaf9638.var_364b797a8b03169b delete();
        }
        if (isdefined(self.var_1ff927c3faaf9638.var_4bf9260eb4f665f0)) {
            self.var_1ff927c3faaf9638.var_4bf9260eb4f665f0 delete();
        }
        self.var_1ff927c3faaf9638 function_444329a225699862();
        if (isdefined(self.var_1ff927c3faaf9638.var_c0a5dbb4a85fd7ff)) {
            self.var_1ff927c3faaf9638.var_c0a5dbb4a85fd7ff delete();
        }
        if (isdefined(self.var_1ff927c3faaf9638.var_562fe683021ca6f5)) {
            self.var_1ff927c3faaf9638.var_562fe683021ca6f5 delete();
        }
        if (isdefined(self.var_1ff927c3faaf9638.attractor)) {
            function_349b67890a05c376(self.var_1ff927c3faaf9638.attractor);
        }
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x401e
// Size: 0x3
function function_65d47a407d91bf8f() {
    
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4028
// Size: 0x8a
function private function_5969f20c2a27e510(vehicle) {
    if (vehicle.health > 0) {
        vehicle namespace_dbbb37eb352edf96::godoff();
        vehicle setcandamage(1);
        var_40fa750de4638a24 = namespace_8480efeffcd6e233::function_5bbdc39a533d9d57(self, "Awareness_Zone");
        if (var_40fa750de4638a24.size > 0) {
            firstradius = var_40fa750de4638a24[0].radius;
            earthquake(0.8, 1.3, vehicle.origin, firstradius * 2);
        }
        vehicle namespace_1f188a13f7e79610::function_9672da471530b44a();
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x40b9
// Size: 0x12c
function private function_7122f1d1f05e191c(var_ae7ca531f6c86ee4, var_dbf0bb72d60f10c4) {
    if (istrue(self.var_7a63c349e8cf430f)) {
        return;
    }
    self.var_7a63c349e8cf430f = 1;
    if (!istrue(self.var_e44867ea28eabb63)) {
        if (isdefined(self.payload)) {
            self.payload delete();
        }
        if (cointoss()) {
            var_d77ac412ddd6e83d = (0, 100, 10);
            var_c3d9facf3fac2a77 = (0, -100, 10);
        } else {
            var_d77ac412ddd6e83d = (0, -100, 10);
            var_c3d9facf3fac2a77 = (0, 100, 10);
        }
        var_f04e4b9c85234d0f = function_3ef2924f5cc4e9af("veh_jup_zm_tank_escort_rocket_dst_debris", var_ae7ca531f6c86ee4, var_d77ac412ddd6e83d, var_dbf0bb72d60f10c4);
        var_5175af3befee188f = function_3ef2924f5cc4e9af("veh_jup_zm_tank_escort_rocket_dst", var_ae7ca531f6c86ee4, var_c3d9facf3fac2a77, var_dbf0bb72d60f10c4);
        f_time = 30;
        wait(f_time);
        var_f04e4b9c85234d0f delete();
        var_5175af3befee188f delete();
    } else {
        f_time = 11;
        wait(f_time);
        if (isdefined(self.payload)) {
            self.payload delete();
        }
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x41ec
// Size: 0x13e
function private function_3ef2924f5cc4e9af(xmodel, var_ae7ca531f6c86ee4, v_offset, var_dbf0bb72d60f10c4, v_force) {
    if (!isdefined(v_offset)) {
        v_offset = (0, 0, 0);
    }
    if (!isdefined(v_force)) {
        var_d0b9e5a2586d209f = randomintrange(-6, 6);
        var_d0b9e4a2586d1e6c = randomintrange(-6, 6);
        var_d0b9e7a2586d2505 = randomintrange(8, 12);
        v_force = (var_d0b9e5a2586d209f, var_d0b9e4a2586d1e6c, var_d0b9e7a2586d2505);
    }
    v_forward = anglestoforward(var_dbf0bb72d60f10c4);
    v_right = anglestoright(var_dbf0bb72d60f10c4);
    v_up = anglestoup(var_dbf0bb72d60f10c4);
    var_7cfe5c57d5ac67e1 = var_ae7ca531f6c86ee4 + v_forward * v_offset[0] + v_right * v_offset[1] + v_up * v_offset[2];
    var_7d1202bf8ca7396 = spawn("script_model", var_7cfe5c57d5ac67e1);
    var_7d1202bf8ca7396 setmodel(xmodel);
    var_7d1202bf8ca7396.angles = (randomfloatrange(0, 360), randomfloatrange(0, 360), randomfloatrange(0, 360));
    var_7d1202bf8ca7396 physicslaunchserver(var_7d1202bf8ca7396.origin, v_force);
    return var_7d1202bf8ca7396;
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4332
// Size: 0x6b
function function_48e697a59457ec45() {
    level._effect["escort_laser_ch"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_escort_laser_ch.vfx");
    level._effect["escort_laser_absorb"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_escort_laser_absorb.vfx");
    level._effect["escort_laser_sm"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_escort_laser_sm.vfx");
    level._effect["escort_laser_glow_energy_point"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_escort_laser_glow_energy_point.vfx");
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43a4
// Size: 0xd5
function function_a6441613846cbe1b() {
    self endon("death");
    nd_current = self.currentnode;
    v_ground = undefined;
    if (isdefined(nd_current)) {
        v_forward = vectornormalize(anglestoforward(nd_current.angles)) * self.var_ca98ebe9bd5a43e1 + nd_current.origin;
    } else {
        v_forward = vectornormalize(anglestoforward(self.angles)) * self.var_ca98ebe9bd5a43e1 + self.origin;
    }
    if (isdefined(v_forward)) {
        v_ground = utility::groundpos(v_forward);
    }
    if (!isdefined(v_ground)) {
        if (isdefined(self.nextnode)) {
            v_ground = self.nextnode.origin;
        } else {
            v_ground = self.origin;
        }
    }
    return v_ground;
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4481
// Size: 0x22a
function function_97e82918ce08c384() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self waittill("vehicle_spawned");
    waitframe();
    self.var_1ff927c3faaf9638.var_cc6cbe86a87c577e = spawn("script_model", self.var_1ff927c3faaf9638.origin);
    self.var_1ff927c3faaf9638.var_cc6cbe86a87c577e.team = "neutral";
    self.var_1ff927c3faaf9638.var_cc6cbe86a87c577e linkto(self.var_1ff927c3faaf9638.var_364b797a8b03169b, "tag_origin", (0, 0, 0), (0, 0, 0));
    if (isdefined(level.var_7f1d1c7c6153a9bf) && [[ level.var_7f1d1c7c6153a9bf ]]()) {
        self.var_e59541d364064648 = function_36a95c9de2ace25a("ob_escort_marker_rift_run", 0, 1);
    } else {
        self.var_e59541d364064648 = function_36a95c9de2ace25a("ob_escort_marker", 0, 1);
    }
    namespace_5a22b6f3a56f7e9b::update_objective_onentity(self.var_e59541d364064648, self.var_1ff927c3faaf9638.var_cc6cbe86a87c577e);
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.var_e59541d364064648, 0);
    self.var_40112e1aa5936dd2 = self.var_6c29f2fdb0054bbe[0] namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(11, self.var_1ff927c3faaf9638.var_cc6cbe86a87c577e.origin, self.var_e59541d364064648);
    self.var_1ff927c3faaf9638.var_364b797a8b03169b thread namespace_ede58c1e66c2c280::function_9a7200f5142066ba(self.var_6c29f2fdb0054bbe[0], self.var_40112e1aa5936dd2, undefined, [0:"escort_started"]);
    self.var_1ff927c3faaf9638.var_364b797a8b03169b waittill("escort_started");
    self.var_1ff927c3faaf9638.var_cc6cbe86a87c577e unlink();
    self.var_1ff927c3faaf9638.var_cc6cbe86a87c577e linkto(self.var_1ff927c3faaf9638, "tag_attach_rocket", (0, 0, 110), (0, 0, 0));
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46b2
// Size: 0xc8
function function_84129aa0676cd1ce() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    while (1) {
        a_players = function_3a322911903bddb5(1.25);
        foreach (player in level.players) {
            if (isalive(player) && isdefined(a_players) && a_players.size && array_contains(a_players, player)) {
                namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(self.var_2ed04f1a09291250, player);
            } else {
                namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(self.var_2ed04f1a09291250, player);
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4781
// Size: 0x2b
function function_c3682430b317ca26() {
    if (istrue(self.var_d91d989332dd1866)) {
        self.var_d91d989332dd1866 = 0;
        self setscriptablepartstate("engine", "idle");
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47b3
// Size: 0x33
function function_315198e9ce4cd18c() {
    if (!istrue(self.var_d91d989332dd1866) && isdefined(self)) {
        self.var_d91d989332dd1866 = 1;
        self setscriptablepartstate("engine", "active");
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47ed
// Size: 0x2c
function function_937d984d2d97046() {
    s_reward = undefined;
    s_reward = getstruct(self.var_626b45032e1892da + "_REWARD", "targetname");
    return s_reward;
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4821
// Size: 0x3e
function private function_dac4378812650312(location) {
    var_99d9866d8df7f737 = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(location);
    if (var_99d9866d8df7f737 == "difficulty_undefined") {
        var_99d9866d8df7f737 = getdvar(@"hash_b1c2f60cf246f369", "difficulty_easy");
    }
    return var_99d9866d8df7f737;
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4867
// Size: 0x51
function private function_9c9e518280bea222(var_2f5d509d7b71ce9a) {
    self endon("death");
    self endon("reached_end_node");
    while (1) {
        wait(30);
        self waittill("no_escorts");
        if (isdefined(self.var_4bf9260eb4f665f0)) {
            self.var_4bf9260eb4f665f0 playsoundonmovingent("dx_ob_oesc_esca_acve_escnoescortsinrange");
        }
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x48bf
// Size: 0x44
function private function_d0278222727e2658(var_2f5d509d7b71ce9a) {
    self endon("death");
    self endon("reached_end_node");
    while (1) {
        wait(30);
        self waittill("start_moving");
        self.var_4bf9260eb4f665f0 playsoundonmovingent("dx_ob_oesc_esca_acve_escmovingout");
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x490a
// Size: 0x31
function private function_46c5c5dc4eb70411() {
    if (cointoss()) {
        thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_escort_vortex_02_broadcast");
        self.var_ab38de8a32717302 = 1;
    } else {
        self.var_ab38de8a32717302 = 0;
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4942
// Size: 0x19
function private function_aae497883f04b1c6() {
    if (cointoss()) {
        thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_escort_vortex_03_conv_broadcast");
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4962
// Size: 0x31
function function_3a322911903bddb5(n_multi) {
    a_players = namespace_8480efeffcd6e233::function_7ec62d1550b9897e(self, "Awareness_Zone", n_multi);
    if (isdefined(a_players) && a_players.size) {
        return a_players;
    }
}

// Namespace namespace_d197b40cdbf4a1ea/namespace_d38a1af3e02dea2f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x499a
// Size: 0x6d
function function_88cf521697f00f27(n_index) {
    switch (n_index) {
    case 1:
        self.var_1ff927c3faaf9638.var_4bf9260eb4f665f0 playsoundonmovingent("dx_ob_oesc_esca_acve_escacvhealth75");
        break;
    case 2:
        thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_escort_acv_health_25_broadcast");
        break;
    default:
        break;
    }
}

