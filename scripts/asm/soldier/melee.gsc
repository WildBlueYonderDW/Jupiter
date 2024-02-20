// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\common\ai.gsc;
#using script_4449008f177af837;
#using scripts\anim\notetracks.gsc;
#using scripts\anim\face.gsc;
#using scripts\asm\soldier\death.gsc;
#using scripts\common\utility.gsc;

#namespace melee;

// Namespace melee/namespace_98502514a7e5f809
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1f5
// Size: 0x3a
function ischargetoreadycomplete(asmname, statename, var_f2b19b25d457c2a6, params) {
    return self.var_a97ac004f00c5df9 && self.var_f2383297dd7b5e7e;
}

// Namespace melee/namespace_98502514a7e5f809
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x237
// Size: 0x8e
function playmeleeanim_chargetoready_distcheck(statename) {
    self endon(statename + "_finished");
    var_ea974c3c587825a6 = 4900;
    target = namespace_28edc79fcf2fe234::bb_getmeleetarget();
    while (1) {
        if (!isdefined(target)) {
            break;
        }
        distsq = distancesquared(self.origin, target.origin);
        if (distsq <= var_ea974c3c587825a6) {
            if (self.var_a97ac004f00c5df9) {
                self.var_f2383297dd7b5e7e = 1;
            }
            break;
        }
        wait(0.05);
    }
}

// Namespace melee/namespace_98502514a7e5f809
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cc
// Size: 0xb3
function donotetracks_vsplayer(asmname, statename, var_7ed79ad4fec35dfb) {
    while (1) {
        notes = self waittill(statename);
        if (!isarray(notes)) {
            notes = [0:notes];
        }
        foreach (note in notes) {
            var_194b5b05a592f2d3 = handlenotetrack_vsplayer(asmname, statename, note);
            if (istrue(var_194b5b05a592f2d3)) {
                return;
            }
            if (isdefined(var_7ed79ad4fec35dfb)) {
                self [[ var_7ed79ad4fec35dfb ]](note, statename);
            }
        }
    }
}

// Namespace melee/namespace_98502514a7e5f809
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x386
// Size: 0x137
function handlenotetrack_vsplayer(asmname, statename, note) {
    switch (note) {
    case #"hash_da2c994ab2c9478c":
        target = namespace_28edc79fcf2fe234::bb_getmeleetarget();
        if (isdefined(target)) {
            self function_f5fc845be4ca3be(target);
        }
        break;
    case #"hash_ed49946bfff8e78a":
        return 1;
    case #"hash_23d3b48a2fabf145":
        target = namespace_28edc79fcf2fe234::bb_getmeleetarget();
        if (!isdefined(target)) {
            return 1;
        }
        if (!isalive(target)) {
            return 1;
        }
        if (!isdefined(self.enemy) || self.enemy != target) {
            return 1;
        }
        var_9ee0ddd0a3a34811 = distancesquared(target.origin, self.origin);
        var_c41c22f541a64291 = 4096;
        if (isdefined(self.meleestopattackdistsq)) {
            var_c41c22f541a64291 = self.meleestopattackdistsq;
        }
        if (var_9ee0ddd0a3a34811 > var_c41c22f541a64291) {
            return 1;
        }
        break;
    case #"hash_ceb098150f024a39":
        target = namespace_28edc79fcf2fe234::bb_getmeleetarget();
        function_e157c0ce32f71cbe(target, 1, undefined, 0);
        break;
    default:
        namespace_a4081f3d58d76916::handlenotetrack(note, statename);
        break;
    }
}

// Namespace melee/namespace_98502514a7e5f809
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c4
// Size: 0x42b
function function_e157c0ce32f71cbe(target, var_a7fa0e3c9034f2f4, var_34aa97bbce2bde0, var_cc0a7f51eb8b72d7) {
    if (!isdefined(target)) {
        return 1;
    }
    if (isalive(target)) {
        if (isplayer(target)) {
            if (self.meleeignorefinalzdiff) {
                distsq = distance2dsquared(target.origin, self.origin);
            } else {
                distsq = distancesquared(target.origin, self.origin);
            }
            maxdistsq = 4096;
            if (isdefined(self.meleebashmaxdistsq)) {
                maxdistsq = self.meleebashmaxdistsq;
            }
            if (istrue(var_cc0a7f51eb8b72d7) || distsq <= maxdistsq) {
                damageoverride = self.meleedamageoverride;
                width = undefined;
                height = undefined;
                var_75cd327859cfba08 = 30;
                var_6b12b757693ae605 = 0.45;
                var_bda0b1d6cce0914 = 0.35;
                var_c747e3b33ad16ac6 = isdefined(target.offhandshield) && target.offhandshield.active;
                if (isnullweapon(self.weapon)) {
                    damageoverride = self.unarmedmeleedamageoverride;
                }
                if (var_c747e3b33ad16ac6) {
                    var_75cd327859cfba08 = 10;
                    var_6b12b757693ae605 = 0.7;
                    var_bda0b1d6cce0914 = 0.5;
                    setsaveddvar(@"hash_26b8cd38ee81f166", 0.05);
                }
                if (isdefined(self.var_1a0d03789f333f98)) {
                    var_75cd327859cfba08 = self.var_1a0d03789f333f98;
                }
                var_2103fe12fea102df = undefined;
                dist = sqrt(maxdistsq);
                if (istrue(var_cc0a7f51eb8b72d7)) {
                    var_2103fe12fea102df = target;
                    dist = self.var_e6b3eb176dda8abc;
                }
                hitent = self melee(var_34aa97bbce2bde0, damageoverride, dist, width, height, istrue(var_cc0a7f51eb8b72d7), var_2103fe12fea102df);
                if (isdefined(hitent)) {
                    if (var_c747e3b33ad16ac6 && (self.unittype == "soldier" || self.unittype == "juggernaut")) {
                        self playsound("ai_melee_vs_shield");
                    }
                    if (!istrue(self.var_70dd5ab41a229510)) {
                        target player_impulse_from_origin(self.origin, var_75cd327859cfba08);
                    }
                    target earthquakeforplayer(0.45, 0.35, target.origin, 1000);
                    target playrumbleonentity("damage_heavy");
                    if (!var_c747e3b33ad16ac6) {
                        var_5ec195666eb7ec08 = 0;
                        var_20c094516733ffb1 = [0:self.origin, 1:self getapproxeyepos(), 2:(self.origin + self getapproxeyepos()) / 2];
                        foreach (point in var_20c094516733ffb1) {
                            if (isdefined(target worldpointtoscreenpos(point, 55))) {
                                var_5ec195666eb7ec08 = 1;
                                break;
                            }
                        }
                        var_e03584e4ba4276ac = 127;
                        var_7563028ecdc1eb0d = 0.5;
                        var_f97bc003a4789c2c = 0.25;
                        if (var_5ec195666eb7ec08 && isdefined(self.var_689bf433cb5c5322)) {
                            var_e03584e4ba4276ac = 30;
                            target shellshock(self.var_689bf433cb5c5322, 1.25);
                        }
                        target thread function_36e75efe1d415cc2(var_7563028ecdc1eb0d, var_f97bc003a4789c2c);
                        target viewkick(var_e03584e4ba4276ac, self.origin);
                    }
                } else if (istrue(var_a7fa0e3c9034f2f4)) {
                    self.nextmeleechecktime = gettime() + randomintrange(1500, 2500);
                    self.lastfailedmeleechargetarget = target;
                }
                if (var_c747e3b33ad16ac6) {
                    setsaveddvar(@"hash_26b8cd38ee81f166", level.playermeleedamagemultiplier_dvar);
                }
            } else if (istrue(var_a7fa0e3c9034f2f4)) {
                self.nextmeleechecktime = gettime() + randomintrange(1500, 2500);
                self.lastfailedmeleechargetarget = target;
            }
        } else {
            self melee();
        }
    }
}

// Namespace melee/namespace_98502514a7e5f809
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f6
// Size: 0x3e
function function_36e75efe1d415cc2(var_7563028ecdc1eb0d, var_f97bc003a4789c2c) {
    self endon("death_or_disconnect");
    self notify("stop_melee_blur");
    self endon("stop_melee_blur");
    self setblurforplayer(var_7563028ecdc1eb0d, var_f97bc003a4789c2c);
    wait(var_f97bc003a4789c2c);
    self setblurforplayer(0, var_f97bc003a4789c2c);
}

// Namespace melee/namespace_98502514a7e5f809
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93b
// Size: 0x68
function player_impulse_from_origin(origin, magnitude) {
    if (!self isonground()) {
        magnitude = magnitude * 0.1;
    }
    dir = vectornormalize(self.origin + (0, 0, 45) - origin);
    vel = dir * magnitude * 10;
    self setvelocity(vel);
}

// Namespace melee/namespace_98502514a7e5f809
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x9aa
// Size: 0x81
function melee_shouldabortcharge(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!self.var_a97ac004f00c5df9) {
        return 1;
    }
    if (self.var_4ecd594ae357f55b) {
        return 1;
    }
    if (!isdefined(self.var_9bfc452192b23c7a)) {
        return 1;
    }
    if (!isalive(self.var_9bfc452192b23c7a)) {
        return 1;
    }
    if (istrue(self.var_9bfc452192b23c7a.dontmelee)) {
        return 1;
    }
    return 0;
}

// Namespace melee/namespace_98502514a7e5f809
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xa33
// Size: 0xbb
function melee_shouldabort(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!self.var_a97ac004f00c5df9) {
        return 1;
    }
    if (self.var_4ecd594ae357f55b) {
        if (isdefined(self.var_9ea242cb88e6301e)) {
            if (self.var_9ea242cb88e6301e) {
                bstop = asm_eventfired(asmname, "melee_stop");
                if (bstop) {
                    self.var_4c96a3a056b956e4 = 1;
                }
                return bstop;
            }
        } else if (self.var_6a4a5c698277c54d) {
            var_602e5b5e7dc6f071 = asm_eventfired(asmname, "melee_stop");
            if (!var_602e5b5e7dc6f071) {
                self.var_9ea242cb88e6301e = 1;
                return 0;
            }
        }
        return 1;
    }
    return 0;
}

// Namespace melee/namespace_98502514a7e5f809
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xaf6
// Size: 0x24
function candocovermelee_anim(asmname, statename, var_f2b19b25d457c2a6, params) {
    
}

// Namespace melee/namespace_98502514a7e5f809
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb21
// Size: 0x24
function candomeleeflip_angles(asmname, statename, var_f2b19b25d457c2a6, params) {
    
}

// Namespace melee/namespace_98502514a7e5f809
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb4c
// Size: 0x24
function candomeleeflip_anim(asmname, statename, var_f2b19b25d457c2a6, params) {
    
}

// Namespace melee/namespace_98502514a7e5f809
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb77
// Size: 0x24
function candomeleewrestle_angles(asmname, statename, var_f2b19b25d457c2a6, params) {
    
}

// Namespace melee/namespace_98502514a7e5f809
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xba2
// Size: 0x24
function candomeleewrestle_anim(asmname, statename, var_f2b19b25d457c2a6, params) {
    
}

// Namespace melee/namespace_98502514a7e5f809
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xbcd
// Size: 0x24
function candomeleebehind_angles(asmname, statename, var_f2b19b25d457c2a6, params) {
    
}

// Namespace melee/namespace_98502514a7e5f809
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xbf8
// Size: 0x24
function candomeleebehind_anim(asmname, statename, var_f2b19b25d457c2a6, params) {
    
}

// Namespace melee/namespace_98502514a7e5f809
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc23
// Size: 0x96
function candomeleeanim_internal(meleeanim) {
    target = self.var_9bfc452192b23c7a;
    targetpos = target.origin;
    var_79b0b08b6461b1ff = self.origin - targetpos;
    targetangles = vectortoangles(var_79b0b08b6461b1ff);
    startpos = getstartorigin(targetpos, targetangles, meleeanim);
    self.var_290be0985580a7a0 = getstartangles(targetpos, targetangles, meleeanim)[1];
    target.var_290be0985580a7a0 = targetangles[1];
    return 1;
}

// Namespace melee/namespace_98502514a7e5f809
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcc1
// Size: 0xc
function candomeleeanim(var_f2b19b25d457c2a6) {
    
}

// Namespace melee/namespace_98502514a7e5f809
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xcd4
// Size: 0x1c
function melee_validatepoints(startpos, targetpos, var_889f170fb7dc87c5) {
    
}

// Namespace melee/namespace_98502514a7e5f809
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xcf7
// Size: 0x2d
function melee_shouldlosersurvive(asmname, statename, var_f2b19b25d457c2a6, params) {
    return self.var_d8a098b0872bb2cb;
}

// Namespace melee/namespace_98502514a7e5f809
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd2c
// Size: 0x2d
function melee_shouldstop(asmname, statename, var_f2b19b25d457c2a6, params) {
    return self.var_4c96a3a056b956e4;
}

// Namespace melee/namespace_98502514a7e5f809
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd61
// Size: 0x70
function playmeleeanim_chargetoready(asmname, statename, params) {
    self endon(statename + "_finished");
    var_e02c0fa1fae17f6d = asm_getanim(asmname, statename);
    var_b57783eee95dc145 = asm_getxanim(statename, var_e02c0fa1fae17f6d);
    self aisetanim(statename, var_e02c0fa1fae17f6d);
    asm_playfacialanim(asmname, statename, var_b57783eee95dc145);
    thread playmeleeanim_chargetoready_distcheck(statename);
    asm_donotetracks(asmname, statename);
}

// Namespace melee/namespace_98502514a7e5f809
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd8
// Size: 0x130
function playmeleeanim_vsplayer(asmname, statename, params) {
    playmeleeattacksound();
    target = namespace_28edc79fcf2fe234::bb_getmeleetarget();
    if (!isdefined(target)) {
        self orientmode("face current");
    } else if (target == self.enemy) {
        self orientmode("face enemy");
    } else {
        self orientmode("face point", target.origin);
    }
    meleeanim = asm_getanim(asmname, statename);
    asm_fireephemeralevent("melee_attack", "begin");
    if (isdefined(params)) {
        self playsound(params);
    }
    rate = 1;
    if (isdefined(self.var_2536e610f6ea9c94)) {
        rate = self.var_2536e610f6ea9c94;
    } else if (isdefined(self.unittype) && self.unittype == "juggernaut") {
        rate = 1.5;
    }
    self aisetanim(statename, meleeanim, rate);
    self endon(statename + "_finished");
    donotetracks_vsplayer(asmname, statename, asm_getnotehandler(asmname, statename));
    asm_fireevent(asmname, "end");
}

// Namespace melee/namespace_98502514a7e5f809
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0f
// Size: 0xa0
function playmeleeattacksound() {
    if (!isdefined(self.a.nextmeleeattacksound)) {
        self.a.nextmeleeattacksound = 0;
    }
    if (isdefined(self.enemy) && isplayer(self.enemy) || randomint(3) == 0) {
        if (gettime() > self.a.nextmeleeattacksound) {
            namespace_166dc34a2c7481df::saygenericdialogue("meleeattack");
            self.a.nextmeleeattacksound = gettime() + 8000;
        }
    }
}

// Namespace melee/namespace_98502514a7e5f809
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb6
// Size: 0xa0
function playmeleechargesound() {
    if (!isdefined(self.a.nextmeleechargesound)) {
        self.a.nextmeleechargesound = 0;
    }
    if (isdefined(self.enemy) && isplayer(self.enemy) || randomint(3) == 0) {
        if (gettime() > self.a.nextmeleechargesound) {
            namespace_166dc34a2c7481df::saygenericdialogue("meleecharge");
            self.a.nextmeleechargesound = gettime() + 8000;
        }
    }
}

// Namespace melee/namespace_98502514a7e5f809
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x105d
// Size: 0x4b
function playmeleechargeanim(asmname, statename, params) {
    playmeleechargesound();
    self.var_5185accfc2476d43 = 1;
    self.var_1f91d3da0786a2 = 1;
    function_fb56c9527636713f(asmname, statename, self.moveplaybackrate);
}

// Namespace melee/namespace_98502514a7e5f809
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10af
// Size: 0xdc
function on_execution_begin(asmname, statename, params) {
    if (!utility::issharedfuncdefined("player", "getExecutionPartner")) {
        /#
            assertmsg("Execution not supported");
        #/
        return;
    }
    if (istrue(self.bhasriotshieldattached)) {
        namespace_f0a0c13f724da4b::detachriotshield(1);
    }
    distfromcenter = 40;
    halfheight = 40;
    self function_4cd0eaf5381f92db(0);
    var_cc2828da32453f24 = function_f3bb4f4911a1beb2("player", "getExecutionPartner");
    if (isdefined(var_cc2828da32453f24)) {
        /#
            assertex(isplayer(var_cc2828da32453f24), "currently assuming that there are no ai vs ai executions");
        #/
        pos = (self.origin + var_cc2828da32453f24.origin) * 0.5;
        level thread execution_obstacle(pos, distfromcenter, halfheight);
    }
}

// Namespace melee/namespace_98502514a7e5f809
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1192
// Size: 0x54
function execution_obstacle(pos, distfromcenter, halfheight) {
    var_48e1c3e32a05c3bf = (0, 0, 0);
    var_9794cf618646a8bd = createnavbadplacebyshape(pos, var_48e1c3e32a05c3bf, 6, distfromcenter, halfheight);
    wait(3);
    destroynavobstacle(var_9794cf618646a8bd);
}

// Namespace melee/namespace_98502514a7e5f809
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ed
// Size: 0x118
function function_6cde2d3ae248271d(note, flagname) {
    if (!isdefined(self.var_e6b3eb176dda8abc)) {
        self.var_e6b3eb176dda8abc = 64;
    }
    if (!isdefined(self.var_f88c7e674f2b356e)) {
        self.var_f88c7e674f2b356e = 45;
    }
    players = namespace_448ccf1ca136fbbe::function_98a826b6b6d0d118(self.origin, self.var_e6b3eb176dda8abc, undefined, 100);
    fwd = anglestoforward(self.angles);
    foreach (player in players) {
        toplayer = player.origin - self.origin;
        if (abs(function_c1aa7c066ec92ca5(toplayer, fwd)) > cos(self.var_f88c7e674f2b356e)) {
            function_e157c0ce32f71cbe(player, 0, undefined, 1);
        }
    }
}

