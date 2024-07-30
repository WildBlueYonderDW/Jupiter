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

// Namespace melee / scripts\asm\soldier\melee
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1f5
// Size: 0x39
function ischargetoreadycomplete(asmname, statename, tostatename, params) {
    return self.in_melee && self.var_f2383297dd7b5e7e;
}

// Namespace melee / scripts\asm\soldier\melee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x237
// Size: 0x8d
function playmeleeanim_chargetoready_distcheck(statename) {
    self endon(statename + "_finished");
    var_ea974c3c587825a6 = 4900;
    target = scripts\asm\asm_bb::bb_getmeleetarget();
    while (true) {
        if (!isdefined(target)) {
            break;
        }
        distsq = distancesquared(self.origin, target.origin);
        if (distsq <= var_ea974c3c587825a6) {
            if (self.in_melee) {
                self.var_f2383297dd7b5e7e = 1;
            }
            break;
        }
        wait 0.05;
    }
}

// Namespace melee / scripts\asm\soldier\melee
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cc
// Size: 0xb2
function donotetracks_vsplayer(asmname, statename, optionalhandler) {
    while (true) {
        notes = self waittill(statename);
        if (!isarray(notes)) {
            notes = [notes];
        }
        foreach (note in notes) {
            breturn = handlenotetrack_vsplayer(asmname, statename, note);
            if (istrue(breturn)) {
                return;
            }
            if (isdefined(optionalhandler)) {
                self [[ optionalhandler ]](note, statename);
            }
        }
    }
}

// Namespace melee / scripts\asm\soldier\melee
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x386
// Size: 0x136
function handlenotetrack_vsplayer(asmname, statename, note) {
    switch (note) {
    case #"hash_da2c994ab2c9478c": 
        target = scripts\asm\asm_bb::bb_getmeleetarget();
        if (isdefined(target)) {
            self function_f5fc845be4ca3be(target);
        }
        break;
    case #"hash_ed49946bfff8e78a": 
        return 1;
    case #"hash_23d3b48a2fabf145": 
        target = scripts\asm\asm_bb::bb_getmeleetarget();
        if (!isdefined(target)) {
            return 1;
        }
        if (!isalive(target)) {
            return 1;
        }
        if (!isdefined(self.enemy) || self.enemy != target) {
            return 1;
        }
        disttotargetsq = distancesquared(target.origin, self.origin);
        var_c41c22f541a64291 = 4096;
        if (isdefined(self.meleestopattackdistsq)) {
            var_c41c22f541a64291 = self.meleestopattackdistsq;
        }
        if (disttotargetsq > var_c41c22f541a64291) {
            return 1;
        }
        break;
    case #"hash_ceb098150f024a39": 
        target = scripts\asm\asm_bb::bb_getmeleetarget();
        function_e157c0ce32f71cbe(target, 1, undefined, 0);
        break;
    default: 
        scripts\anim\notetracks::handlenotetrack(note, statename);
        break;
    }
}

// Namespace melee / scripts\asm\soldier\melee
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c4
// Size: 0x42a
function function_e157c0ce32f71cbe(target, var_a7fa0e3c9034f2f4, meleedirection, ismeleeswipe) {
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
            if (istrue(ismeleeswipe) || distsq <= maxdistsq) {
                damageoverride = self.meleedamageoverride;
                width = undefined;
                height = undefined;
                meleepower = 30;
                earthquakepower = 0.45;
                earthquakeduration = 0.35;
                var_c747e3b33ad16ac6 = isdefined(target.offhandshield) && target.offhandshield.active;
                if (isnullweapon(self.weapon)) {
                    damageoverride = self.unarmedmeleedamageoverride;
                }
                if (var_c747e3b33ad16ac6) {
                    meleepower = 10;
                    earthquakepower = 0.7;
                    earthquakeduration = 0.5;
                    setsaveddvar(@"hash_26b8cd38ee81f166", 0.05);
                }
                if (isdefined(self.var_1a0d03789f333f98)) {
                    meleepower = self.var_1a0d03789f333f98;
                }
                overrideenemy = undefined;
                dist = sqrt(maxdistsq);
                if (istrue(ismeleeswipe)) {
                    overrideenemy = target;
                    dist = self.var_e6b3eb176dda8abc;
                }
                hitent = self melee(meleedirection, damageoverride, dist, width, height, istrue(ismeleeswipe), overrideenemy);
                if (isdefined(hitent)) {
                    if (var_c747e3b33ad16ac6 && (self.unittype == "soldier" || self.unittype == "juggernaut")) {
                        self playsound("ai_melee_vs_shield");
                    }
                    if (!istrue(self.var_70dd5ab41a229510)) {
                        target player_impulse_from_origin(self.origin, meleepower);
                    }
                    target earthquakeforplayer(0.45, 0.35, target.origin, 1000);
                    target playrumbleonentity("damage_heavy");
                    if (!var_c747e3b33ad16ac6) {
                        isonscreen = 0;
                        var_20c094516733ffb1 = [self.origin, self getapproxeyepos(), (self.origin + self getapproxeyepos()) / 2];
                        foreach (point in var_20c094516733ffb1) {
                            if (isdefined(target worldpointtoscreenpos(point, 55))) {
                                isonscreen = 1;
                                break;
                            }
                        }
                        kickpower = 127;
                        blurpower = 0.5;
                        blurduration = 0.25;
                        if (isonscreen && isdefined(self.var_689bf433cb5c5322)) {
                            kickpower = 30;
                            target shellshock(self.var_689bf433cb5c5322, 1.25);
                        }
                        target thread meleeblur(blurpower, blurduration);
                        target viewkick(kickpower, self.origin);
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
            return;
        }
        self melee();
    }
}

// Namespace melee / scripts\asm\soldier\melee
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f6
// Size: 0x3d
function meleeblur(blurpower, blurduration) {
    self endon("death_or_disconnect");
    self notify("stop_melee_blur");
    self endon("stop_melee_blur");
    self setblurforplayer(blurpower, blurduration);
    wait blurduration;
    self setblurforplayer(0, blurduration);
}

// Namespace melee / scripts\asm\soldier\melee
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93b
// Size: 0x67
function player_impulse_from_origin(origin, magnitude) {
    if (!self isonground()) {
        magnitude *= 0.1;
    }
    dir = vectornormalize(self.origin + (0, 0, 45) - origin);
    vel = dir * magnitude * 10;
    self setvelocity(vel);
}

// Namespace melee / scripts\asm\soldier\melee
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x9aa
// Size: 0x80
function melee_shouldabortcharge(asmname, statename, tostatename, params) {
    if (!self.in_melee) {
        return true;
    }
    if (self.var_4ecd594ae357f55b) {
        return true;
    }
    if (!isdefined(self.meleetarget)) {
        return true;
    }
    if (!isalive(self.meleetarget)) {
        return true;
    }
    if (istrue(self.meleetarget.dontmelee)) {
        return true;
    }
    return false;
}

// Namespace melee / scripts\asm\soldier\melee
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xa33
// Size: 0xba
function melee_shouldabort(asmname, statename, tostatename, params) {
    if (!self.in_melee) {
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

// Namespace melee / scripts\asm\soldier\melee
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xaf6
// Size: 0x23
function candocovermelee_anim(asmname, statename, tostatename, params) {
    
}

// Namespace melee / scripts\asm\soldier\melee
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb21
// Size: 0x23
function candomeleeflip_angles(asmname, statename, tostatename, params) {
    
}

// Namespace melee / scripts\asm\soldier\melee
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb4c
// Size: 0x23
function candomeleeflip_anim(asmname, statename, tostatename, params) {
    
}

// Namespace melee / scripts\asm\soldier\melee
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb77
// Size: 0x23
function candomeleewrestle_angles(asmname, statename, tostatename, params) {
    
}

// Namespace melee / scripts\asm\soldier\melee
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xba2
// Size: 0x23
function candomeleewrestle_anim(asmname, statename, tostatename, params) {
    
}

// Namespace melee / scripts\asm\soldier\melee
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xbcd
// Size: 0x23
function candomeleebehind_angles(asmname, statename, tostatename, params) {
    
}

// Namespace melee / scripts\asm\soldier\melee
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xbf8
// Size: 0x23
function candomeleebehind_anim(asmname, statename, tostatename, params) {
    
}

// Namespace melee / scripts\asm\soldier\melee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc23
// Size: 0x95
function candomeleeanim_internal(meleeanim) {
    target = self.meleetarget;
    targetpos = target.origin;
    var_79b0b08b6461b1ff = self.origin - targetpos;
    targetangles = vectortoangles(var_79b0b08b6461b1ff);
    startpos = getstartorigin(targetpos, targetangles, meleeanim);
    self.var_290be0985580a7a0 = getstartangles(targetpos, targetangles, meleeanim)[1];
    target.var_290be0985580a7a0 = targetangles[1];
    return true;
}

// Namespace melee / scripts\asm\soldier\melee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcc1
// Size: 0xb
function candomeleeanim(tostatename) {
    
}

// Namespace melee / scripts\asm\soldier\melee
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xcd4
// Size: 0x1b
function melee_validatepoints(startpos, targetpos, var_889f170fb7dc87c5) {
    
}

// Namespace melee / scripts\asm\soldier\melee
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xcf7
// Size: 0x2c
function melee_shouldlosersurvive(asmname, statename, tostatename, params) {
    return self.var_d8a098b0872bb2cb;
}

// Namespace melee / scripts\asm\soldier\melee
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd2c
// Size: 0x2c
function melee_shouldstop(asmname, statename, tostatename, params) {
    return self.var_4c96a3a056b956e4;
}

// Namespace melee / scripts\asm\soldier\melee
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd61
// Size: 0x6f
function playmeleeanim_chargetoready(asmname, statename, params) {
    self endon(statename + "_finished");
    var_e02c0fa1fae17f6d = asm_getanim(asmname, statename);
    readyxanim = asm_getxanim(statename, var_e02c0fa1fae17f6d);
    self aisetanim(statename, var_e02c0fa1fae17f6d);
    asm_playfacialanim(asmname, statename, readyxanim);
    thread playmeleeanim_chargetoready_distcheck(statename);
    asm_donotetracks(asmname, statename);
}

// Namespace melee / scripts\asm\soldier\melee
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd8
// Size: 0x12f
function playmeleeanim_vsplayer(asmname, statename, params) {
    playmeleeattacksound();
    target = scripts\asm\asm_bb::bb_getmeleetarget();
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

// Namespace melee / scripts\asm\soldier\melee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0f
// Size: 0x9f
function playmeleeattacksound() {
    if (!isdefined(self.a.nextmeleeattacksound)) {
        self.a.nextmeleeattacksound = 0;
    }
    if (isdefined(self.enemy) && isplayer(self.enemy) || randomint(3) == 0) {
        if (gettime() > self.a.nextmeleeattacksound) {
            scripts\anim\face::saygenericdialogue("meleeattack");
            self.a.nextmeleeattacksound = gettime() + 8000;
        }
    }
}

// Namespace melee / scripts\asm\soldier\melee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb6
// Size: 0x9f
function playmeleechargesound() {
    if (!isdefined(self.a.nextmeleechargesound)) {
        self.a.nextmeleechargesound = 0;
    }
    if (isdefined(self.enemy) && isplayer(self.enemy) || randomint(3) == 0) {
        if (gettime() > self.a.nextmeleechargesound) {
            scripts\anim\face::saygenericdialogue("meleecharge");
            self.a.nextmeleechargesound = gettime() + 8000;
        }
    }
}

// Namespace melee / scripts\asm\soldier\melee
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x105d
// Size: 0x4a
function playmeleechargeanim(asmname, statename, params) {
    playmeleechargesound();
    self.var_5185accfc2476d43 = 1;
    self.var_1f91d3da0786a2 = 1;
    function_fb56c9527636713f(asmname, statename, self.moveplaybackrate);
}

// Namespace melee / scripts\asm\soldier\melee
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10af
// Size: 0xdb
function on_execution_begin(asmname, statename, params) {
    if (!utility::issharedfuncdefined("player", "getExecutionPartner")) {
        assertmsg("Execution not supported");
        return;
    }
    if (istrue(self.bhasriotshieldattached)) {
        scripts\asm\soldier\death::detachriotshield(1);
    }
    distfromcenter = 40;
    halfheight = 40;
    self function_4cd0eaf5381f92db(0);
    otherguy = function_f3bb4f4911a1beb2("player", "getExecutionPartner");
    if (isdefined(otherguy)) {
        assertex(isplayer(otherguy), "currently assuming that there are no ai vs ai executions");
        pos = (self.origin + otherguy.origin) * 0.5;
        level thread execution_obstacle(pos, distfromcenter, halfheight);
    }
}

// Namespace melee / scripts\asm\soldier\melee
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1192
// Size: 0x53
function execution_obstacle(pos, distfromcenter, halfheight) {
    var_48e1c3e32a05c3bf = (0, 0, 0);
    obstacleid = createnavbadplacebyshape(pos, var_48e1c3e32a05c3bf, 6, distfromcenter, halfheight);
    wait 3;
    destroynavobstacle(obstacleid);
}

// Namespace melee / scripts\asm\soldier\melee
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ed
// Size: 0x117
function function_6cde2d3ae248271d(note, flagname) {
    if (!isdefined(self.var_e6b3eb176dda8abc)) {
        self.var_e6b3eb176dda8abc = 64;
    }
    if (!isdefined(self.var_f88c7e674f2b356e)) {
        self.var_f88c7e674f2b356e = 45;
    }
    players = scripts\common\utility::function_98a826b6b6d0d118(self.origin, self.var_e6b3eb176dda8abc, undefined, 100);
    fwd = anglestoforward(self.angles);
    foreach (player in players) {
        toplayer = player.origin - self.origin;
        if (abs(vectordot2(toplayer, fwd)) > cos(self.var_f88c7e674f2b356e)) {
            function_e157c0ce32f71cbe(player, 0, undefined, 1);
        }
    }
}

