// mwiii decomp prototype
#using scripts\engine\trace.gsc;
#using scripts\engine\math.gsc;
#using script_1311c5c284dd1537;
#using script_51f5154861435b1e;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_58be75c518bf0d40;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\supers.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using script_15cba36f180ab171;
#using script_5def7af2a9f04234;
#using scripts\mp\outline.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\mp\utility\player.gsc;
#using script_6a8ec730b2bfa844;
#using scripts\mp\utility\outline.gsc;

#namespace namespace_da3c8f2cdcad316c;

// Namespace namespace_da3c8f2cdcad316c/namespace_5fa40aef0a0c4a61
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a0
// Size: 0x26
function function_7142c6e9236c9683() {
    level.var_bb0266f422d9afa3["agentTacCam"] = spawnstruct();
    namespace_5fa40aef0a0c4a61::function_55ddd213c3e34c53();
    function_3d6a680d27d4b77();
}

// Namespace namespace_da3c8f2cdcad316c/namespace_5fa40aef0a0c4a61
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cd
// Size: 0x83
function function_3d6a680d27d4b77() {
    var_195d2e0ed33c2a87 = level.struct_class_names["script_noteworthy"]["trapper_taccam"];
    if (!isdefined(var_195d2e0ed33c2a87)) {
        return;
    }
    foreach (node in var_195d2e0ed33c2a87) {
        function_70e28195e1f4871e(node, node.origin, 1);
    }
}

// Namespace namespace_da3c8f2cdcad316c/namespace_5fa40aef0a0c4a61
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x357
// Size: 0x15b
function function_55ddd213c3e34c53() {
    leveldata = function_f0698aee89c18210("agentTacCam");
    leveldata.var_5237a188ccda4d7b = "super_tac_camera";
    leveldata.lifetime = getdvarint(@"hash_13717e6e87cb530f", 120);
    leveldata.destroyfunc = &function_f44b37d060d14eb5;
    leveldata.var_d6fdc3b56b33f4e3 = &function_7acc5aa2b73fe93b;
    leveldata.var_273f2a99f4833f00 = &function_daf83774b715c487;
    leveldata.var_547e8b267c03d017 = &function_1ee10c87668846d9;
    leveldata.var_1eb35a5a7992e498 = &function_7acc5aa2b73fe93b;
    leveldata.var_6e5f6320607eb69 = &function_a60052d904a2d492;
    leveldata.var_4fbadc7102d30912 = 250000;
    leveldata.var_16187e4d354c3c97 = 250000;
    leveldata.var_57b8f3bcfca33a4b = 3;
    leveldata.var_91389dd68a70be33 = "equip_tactical_cam_marking";
    leveldata.maxhealth = 100;
    leveldata.var_604c545b594e97ec = &function_6a2036b8607b2fa6;
    leveldata.var_4f1335fce3765da0 = &function_7b5cbf35f63ba5d2;
    leveldata.var_58906cc2ded735db = namespace_2a184fc4902783dc::create_contents(1, 0, 0, 1, 0, 1, 0, 1, 1);
    leveldata.var_106bf36856a998f = getentarray("tacCameraInvalid", "targetname");
}

// Namespace namespace_da3c8f2cdcad316c/namespace_5fa40aef0a0c4a61
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b9
// Size: 0x14f
function function_4f7fc48f506a21f3() {
    var_c9e94f33fd62d9cf = self getvieworigin();
    var_655f4170c63b668c = self getplayerangles();
    var_738a7094c7bfde17 = anglestoforward(var_655f4170c63b668c);
    var_3eb394d231fb9c74 = var_c9e94f33fd62d9cf + var_738a7094c7bfde17 * 256;
    var_2fc7b90001702e5c = self;
    var_e76c084d206cfb7f = function_f0698aee89c18210("agentTacCam").var_58906cc2ded735db;
    var_f17a61afb63dfd27 = ray_trace(var_c9e94f33fd62d9cf, var_3eb394d231fb9c74, var_2fc7b90001702e5c, var_e76c084d206cfb7f, 0, 0, 1);
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
    function_70e28195e1f4871e(var_282b1925c4af6f1f, var_a0377a1daf3300d0);
}

// Namespace namespace_da3c8f2cdcad316c/namespace_5fa40aef0a0c4a61
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60f
// Size: 0x9a
function function_70e28195e1f4871e(var_282b1925c4af6f1f, var_a0377a1daf3300d0, var_27c432c46e32be45) {
    camera = function_ee24b83d39692536(var_282b1925c4af6f1f, undefined, var_a0377a1daf3300d0, "tactical_camera_turret_mp", "turret_tactical_camera_v0", "agentTacCam", 1);
    camera setmode("manual");
    camera.var_d20dfbbbcd940269 = 1;
    camera.poi = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(camera.origin);
    if (!istrue(var_27c432c46e32be45)) {
        camera thread function_b3b59c099f93a503(1);
    }
    camera thread function_7cd9c9609b1d3fe2();
    camera thread namespace_5633828963c62e57::function_23cf186c8b512748();
}

// Namespace namespace_da3c8f2cdcad316c/namespace_5fa40aef0a0c4a61
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b0
// Size: 0x3d
function function_f44b37d060d14eb5() {
    self notify("death");
    self.isdestroyed = 1;
    self setscriptablepartstate("destroyed", "on", 0);
    namespace_b903a23a81915f18::outlinedisableinternalall(self);
    wait(0.1);
    self delete();
}

// Namespace namespace_da3c8f2cdcad316c/namespace_5fa40aef0a0c4a61
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f4
// Size: 0x105
function function_7b5cbf35f63ba5d2(data) {
    if (!isdefined(self) || istrue(self.isdestroyed)) {
        return 0;
    }
    if (data.meansofdeath == "MOD_IMPACT") {
        return 0;
    }
    var_415af0ea29077ad9 = data.damage;
    hits = undefined;
    if (isexplosivedamagemod(data.meansofdeath)) {
        hits = function_35fe12b0d93b4bee(data);
    } else if (isbulletdamage(data.meansofdeath)) {
        hits = function_a6bd73d933b524e3(data);
    }
    if (isdefined(hits)) {
        var_415af0ea29077ad9 = int(ceil(min(1, hits / 5) * self.maxhealth));
    }
    if (self.damagetaken + var_415af0ea29077ad9 / self.maxhealth > 0.5) {
        if (!istrue(self.isdamaged)) {
            self.isdamaged = 1;
            self setscriptablepartstate("damaged", "on", 0);
        }
    }
    return var_415af0ea29077ad9;
}

// Namespace namespace_da3c8f2cdcad316c/namespace_5fa40aef0a0c4a61
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x801
// Size: 0x82
function function_6a2036b8607b2fa6(data) {
    attacker = data.attacker;
    if (!isdefined(data.attacker)) {
        return;
    }
    if (namespace_54d20dd0dd79277f::function_44a6f98cc3c0f5f4(attacker.team)) {
    }
    if (isplayer(attacker)) {
        attacker notify("destroyed_equipment");
        attacker thread namespace_48a08c5037514e04::doscoreevent(#"hash_1ee8d6bcaf4366be");
        attacker thread namespace_25c5a6f43bb97b43::onfieldupgradedestroy(#"hash_511ac9e9a1a18d8");
    }
    function_f44b37d060d14eb5();
}

// Namespace namespace_da3c8f2cdcad316c/namespace_5fa40aef0a0c4a61
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x88a
// Size: 0x59
function private function_35fe12b0d93b4bee(data, var_10d243b75ec6d6ae) {
    if (data.damage > 200) {
        return 20;
    }
    if (data.damage > 70) {
        return 10;
    } else if (data.damage > 30) {
        return 7;
    } else {
        return 2;
    }
}

// Namespace namespace_da3c8f2cdcad316c/namespace_5fa40aef0a0c4a61
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8ea
// Size: 0xaf
function private function_a6bd73d933b524e3(data, var_10d243b75ec6d6ae) {
    var_2ddcaf824ac5d676 = ter_op(namespace_a12dc1d0c8a64946::isfmjdamage(data.objweapon, data.meansofdeath) && var_10d243b75ec6d6ae, 2, 0);
    if (data.damage > 150) {
        return (var_2ddcaf824ac5d676 + 10);
    }
    if (data.damage >= 50) {
        return (var_2ddcaf824ac5d676 + 5);
    } else if (data.damage >= 30) {
        return (var_2ddcaf824ac5d676 + 3);
    } else if (data.damage >= 20) {
        return (var_2ddcaf824ac5d676 + 2);
    } else {
        return (var_2ddcaf824ac5d676 + 1);
    }
}

// Namespace namespace_da3c8f2cdcad316c/namespace_5fa40aef0a0c4a61
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a0
// Size: 0x14e
function function_7cd9c9609b1d3fe2() {
    level endon("game_ended");
    self endon("death");
    var_4f35a480b277acb6 = function_869ccb4e3451b8c6([0:"etype_player", 1:"etype_ai"]);
    while (1) {
        targetarray = function_b1eef70090b5b7b5(self.origin, 1575, var_4f35a480b277acb6);
        foreach (ent in targetarray) {
            if (!isdefined(ent)) {
                continue;
            }
            if (isplayer(ent) || isbot(ent)) {
                jumpiffalse(issharedfuncdefined("player", "isReallyAlive")) LOC_000000d7;
                jumpiftrue([[ getsharedfunc("player", "isReallyAlive") ]](ent)) LOC_000000d7;
            } else {
            LOC_000000d7:
                if (isagent(ent)) {
                    continue;
                }
                if (namespace_5a51aa78ea0b1b9f::is_empd()) {
                    continue;
                }
                var_368ae33cb19f91f8 = function_9d2bec87e0754872(ent);
                if (!var_368ae33cb19f91f8.isvisible || !var_368ae33cb19f91f8.isindetectrange) {
                    continue;
                }
                if (istrue(self.markingtarget)) {
                    continue;
                }
                function_97d222273f4855e1(ent);
            }
        }
        wait(0.25);
    }
}

// Namespace namespace_da3c8f2cdcad316c/namespace_5fa40aef0a0c4a61
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf5
// Size: 0x12e
function function_97d222273f4855e1(var_a154d4eee7c22634) {
    self settargetentity(var_a154d4eee7c22634);
    var_82f58d57625e59ee = 0;
    var_cd79a3c4966f6169 = getdvarfloat(@"hash_6cb0cf97f8ae3387", 3);
    while (var_82f58d57625e59ee < var_cd79a3c4966f6169) {
        var_368ae33cb19f91f8 = function_9d2bec87e0754872(var_a154d4eee7c22634);
        if (!var_368ae33cb19f91f8.isvisible || !var_368ae33cb19f91f8.isindetectrange) {
            self cleartargetentity();
            return;
        }
        var_82f58d57625e59ee = var_82f58d57625e59ee + level.framedurationseconds;
        waitframe();
    }
    /#
        level thread draw_line_for_time(var_a154d4eee7c22634 namespace_7e17181d03156026::getstancetop(), self.origin, 1, 0, 0, 100);
        level thread draw_line_for_time(var_a154d4eee7c22634 namespace_7e17181d03156026::getstancecenter(), self.origin, 1, 0, 0, 100);
        level thread draw_line_for_time(var_a154d4eee7c22634.origin, self.origin, 1, 0, 0, 100);
    #/
    namespace_8361bad7391de074::function_800f75fe5e5c7462(var_a154d4eee7c22634, self);
    namespace_5fa40aef0a0c4a61::function_312239156654c258(var_a154d4eee7c22634);
    if (isdefined(level.var_e7c5eb1e41445c13)) {
        self [[ level.var_e7c5eb1e41445c13 ]](var_a154d4eee7c22634);
    }
    function_86f2d395b5545b01(var_a154d4eee7c22634);
}

// Namespace namespace_da3c8f2cdcad316c/namespace_5fa40aef0a0c4a61
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2a
// Size: 0x94
function function_312239156654c258(var_a154d4eee7c22634) {
    if (!isdefined(self)) {
        return;
    }
    if (!isdefined(self.var_f489aabfe37a8afa)) {
        self.var_f489aabfe37a8afa = [];
    }
    if (array_contains_key(self.var_f489aabfe37a8afa, var_a154d4eee7c22634.team)) {
        return;
    }
    self.var_f489aabfe37a8afa[var_a154d4eee7c22634.team] = [0:var_a154d4eee7c22634.team];
    id = namespace_cbd3754a0c69cc63::outlineenableforteam(self, var_a154d4eee7c22634.team, "spotter_notarget_equipment", "perk_superior");
}

// Namespace namespace_da3c8f2cdcad316c/namespace_5fa40aef0a0c4a61
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc5
// Size: 0x1aa
function function_86f2d395b5545b01(var_a154d4eee7c22634) {
    timer = 0;
    while (1) {
        var_a154d4eee7c22634 thread function_7d61d7b52c318d47();
        var_a154d4eee7c22634 function_748f3520a7e525a9();
        var_a154d4eee7c22634 playlocalsound("recon_drone_spotted_plr");
        var_5756e405d4393132 = undefined;
        if (isdefined(self.poi) && getdvarint(@"hash_e242c057ecb7ee6b", 1) == 1) {
            var_5756e405d4393132 = function_7e3f22e620f3f71e(self.poi, "everybody");
        } else {
            var_5756e405d4393132 = utility::function_2d7fd59d039fa69b(var_a154d4eee7c22634.origin, 800, 0);
        }
        foreach (agent in var_5756e405d4393132) {
            if (!isdefined(agent) || isint(agent)) {
                continue;
            }
            if (!isagent(agent)) {
                continue;
            }
            if (!isdefined(agent.team)) {
                continue;
            }
            agent getenemyinfo(var_a154d4eee7c22634);
        }
        var_74a27e60692b4559 = getdvarfloat(@"hash_476ba3b2fd5d8fea", 5);
        while (timer < var_74a27e60692b4559) {
            var_368ae33cb19f91f8 = function_9d2bec87e0754872(var_a154d4eee7c22634);
            if (!var_368ae33cb19f91f8.isvisible || !var_368ae33cb19f91f8.isindetectrange || !var_368ae33cb19f91f8.var_9ae205c4c40af967) {
                self cleartargetentity();
                return;
            }
            wait(0.25);
            timer = timer + 0.25;
        }
        timer = 0;
        waitframe();
    }
}

