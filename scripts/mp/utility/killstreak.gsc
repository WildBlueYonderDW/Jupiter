// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_5762ac2f22202ba2;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\damage.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\engine\trace.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\points.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\mp\vehicles\damage.gsc;

#namespace killstreak;

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf43
// Size: 0x1e
function hasplayerdiedwhileusingkillstreak(streakinfo) {
    return streakinfo.lifeid != getcurrentplayerlifeidforkillstreak();
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf69
// Size: 0x43d
function addtoactivekillstreaklist(streakname, threatbiasgroup, owner, outline, teamheadicon, var_81dbfc1d134bf264, endnotifyoverride) {
    /#
        assertex(isdefined(streakname), "streakName must be defined when using addToActiveKillstreakList()");
    #/
    entnumber = self getentitynumber();
    self.activeid = owner getactivekillstreakid();
    if (isdefined(streakname)) {
        if (isremotekillstreak(streakname)) {
            addtoremotekillstreaklist(entnumber);
            thread removefromremotekillstreaklistondeath(entnumber);
        }
        if (isuavkillstreak(streakname)) {
            addtouavlist(entnumber);
            thread removefromuavlistondeath(entnumber);
        } else if (isairstrikekillstreak(streakname)) {
            addtoairstrikelist(entnumber);
            thread removefromairstrikelistondeath(entnumber);
        } else if (islittlebirdkillstreak(streakname)) {
            addtolittlebirdlist(entnumber);
            thread removefromlittlebirdlistondeath(entnumber);
        } else if (ishelikillstreak(streakname)) {
            addtohelilist(entnumber);
            thread removefromhelilistondeath(entnumber);
        } else if (isturretkillstreak(streakname)) {
            addtoturretlist(entnumber);
            thread removefromturretlistondeathorcarry(entnumber);
        } else if (function_26ab4629dc655c14(streakname)) {
            function_f0edb803c309d596(entnumber);
            thread function_d3d9181348d12d5b(entnumber);
        } else if (isprojectilekillstreak(streakname)) {
            addtoprojectilelist(entnumber);
            thread removefromprojectilelistondeath(entnumber);
        } else if (issupportdronekillstreak(streakname)) {
            addtosupportdronelist(entnumber);
            thread removefromsupportdronelistondeath(entnumber);
        } else if (isassaultdronekillstreak(streakname)) {
            addtoassaultdronelist(entnumber);
            thread removefromassaultdronelistondeath(entnumber);
        } else {
            addtoplayerkillstreaklist(entnumber);
            thread removefromplayerkillstreaklistondeath(entnumber);
        }
        if (iskillstreaklockonable(streakname)) {
            self.affectedbylockon = 1;
        }
    }
    level.activekillstreaks[entnumber] = self;
    level.activekillstreaks[entnumber].streakname = streakname;
    if (threatbiasgroup == "Killstreak_Air") {
        self.isairkillstreak = 1;
        if (!isdefined(streakname) || streakname != "directional_uav") {
            self enableplayermarks("air_killstreak");
        }
    } else {
        self.isairkillstreak = 0;
        self enableplayermarks("killstreak");
    }
    if (level.teambased) {
        self filteroutplayermarks(owner.team);
    } else {
        self filteroutplayermarks(owner);
    }
    if (istrue(outline)) {
        outlineid = undefined;
        var_4e96765e8fd41c3d = undefined;
        if (level.teambased) {
            if (isridekillstreak(streakname)) {
                foreach (player in level.players) {
                    if (player.team == self.team && player != self.owner) {
                        outlineid = outlineenableforplayer(self, player, "outline_nodepth_cyan", "lowest");
                    }
                    if (isdefined(outlineid)) {
                        thread removeoutlineonnotify(outlineid, endnotifyoverride);
                    }
                }
                var_4e96765e8fd41c3d = 1;
            } else {
                outlineid = outlineenableforteam(self, owner.team, "outline_nodepth_cyan", "lowest");
            }
        } else {
            outlineid = outlineenableforplayer(self, owner, "outline_nodepth_cyan", "lowest");
        }
        if (!istrue(var_4e96765e8fd41c3d)) {
            thread removeoutlineonnotify(outlineid, endnotifyoverride);
        }
    }
    if (istrue(teamheadicon)) {
        /#
            assertex(isdefined(var_81dbfc1d134bf264), "Icon offset is required when using a teamHeadIcon");
        #/
        ownerinvisible = 0;
        if (owner isusingremote()) {
            ownerinvisible = 1;
        }
        icon = undefined;
        if (level.teambased) {
            icon = thread scripts/cp_mp/entityheadicons::setheadicon_factionimage(0, var_81dbfc1d134bf264, 1, 10000, undefined, undefined, 1, ownerinvisible);
        } else {
            if (istrue(ownerinvisible)) {
                return;
            }
            icon = thread scripts/cp_mp/entityheadicons::setheadicon_singleimage(owner, "hud_icon_head_equipment_friendly", var_81dbfc1d134bf264, 1, 10000, undefined, undefined, 1);
        }
        thread removeteamheadicononnotify(icon, endnotifyoverride);
    }
    /#
        thread function_dab24dca3ba6294a(streakname);
    #/
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ad
// Size: 0x52
function getactivekillstreakid() {
    if (!isdefined(self.pers["nextActiveID"])) {
        self.pers["nextActiveID"] = 0;
    }
    killstreakid = self.pers["nextActiveID"];
    self.pers["nextActiveID"]++;
    return killstreakid;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1407
// Size: 0x45
function removeoutlineonnotify(outlineid, endnotifyoverride) {
    wait_array = ["death"];
    if (isdefined(endnotifyoverride)) {
        wait_array[wait_array.size] = endnotifyoverride;
    }
    waittill_any_in_array_return_no_endon_death(wait_array);
    outlinedisable(outlineid, self);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1453
// Size: 0x44
function removeteamheadicononnotify(icon, endnotifyoverride) {
    wait_array = ["death"];
    if (isdefined(endnotifyoverride)) {
        wait_array[wait_array.size] = endnotifyoverride;
    }
    waittill_any_in_array_return_no_endon_death(wait_array);
    scripts/cp_mp/entityheadicons::setheadicon_deleteicon(icon);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x149e
// Size: 0x17
function removefromactivekillstreaklist(entnumber) {
    level.activekillstreaks[entnumber] = undefined;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14bc
// Size: 0x27
function activekillstreaklistcontains(entnumber) {
    if (!isdefined(level.activekillstreaks)) {
        return 0;
    }
    return isdefined(level.activekillstreaks[entnumber]);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14eb
// Size: 0x30
function addtoremotekillstreaklist(entnumber) {
    if (!isdefined(level.remotekillstreaks)) {
        level.remotekillstreaks = [];
    }
    level.remotekillstreaks[entnumber] = self;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1522
// Size: 0x1f
function removefromremotekillstreaklistondeath(entnumber) {
    self waittill("death");
    level.remotekillstreaks[entnumber] = undefined;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1548
// Size: 0xb3
function addtouavlist(entnumber) {
    if (!isdefined(level.uavmodels)) {
        level.uavmodels = [];
    }
    if (level.teambased) {
        if (!isdefined(level.uavmodels[self.team])) {
            level.uavmodels[self.team] = [];
        }
        level.uavmodels[self.team][level.uavmodels[self.team].size] = self;
        return;
    }
    level.uavmodels[self.owner.guid + "_" + gettime()] = self;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1602
// Size: 0x9c
function removefromuavlistondeath(entnumber) {
    self waittill("death");
    if (isdefined(self.uavrig)) {
        self.uavrig delete();
    }
    if (level.teambased) {
        team = self.team;
        level.uavmodels[team] = array_removeundefined(level.uavmodels[team]);
    } else {
        level.uavmodels = array_removeundefined(level.uavmodels);
    }
    if (isdefined(self)) {
        self delete();
    }
    removefromactivekillstreaklist(entnumber);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a5
// Size: 0x30
function addtoairstrikelist(entnumber) {
    if (!isdefined(level.airstrikemodels)) {
        level.airstrikemodels = [];
    }
    level.airstrikemodels[entnumber] = self;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16dc
// Size: 0x27
function removefromairstrikelistondeath(entnumber) {
    self waittill("death");
    level.airstrikemodels[entnumber] = undefined;
    removefromactivekillstreaklist(entnumber);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x170a
// Size: 0x30
function addtolittlebirdlist(entnumber) {
    if (!isdefined(level.littlebirds)) {
        level.littlebirds = [];
    }
    level.littlebirds[entnumber] = self;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1741
// Size: 0x27
function removefromlittlebirdlistondeath(entnumber) {
    self waittill("death");
    level.littlebirds[entnumber] = undefined;
    removefromactivekillstreaklist(entnumber);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x176f
// Size: 0x30
function addtohelilist(entnumber) {
    if (!isdefined(level.helis)) {
        level.helis = [];
    }
    level.helis[entnumber] = self;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17a6
// Size: 0x1f
function removefromhelilist(entnumber) {
    level.helis[entnumber] = undefined;
    removefromactivekillstreaklist(entnumber);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17cc
// Size: 0x27
function removefromhelilistondeath(entnumber) {
    self waittill("death");
    level.helis[entnumber] = undefined;
    removefromactivekillstreaklist(entnumber);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17fa
// Size: 0x30
function addtoturretlist(entnumber) {
    if (!isdefined(level.turrets)) {
        level.turrets = [];
    }
    level.turrets[entnumber] = self;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1831
// Size: 0x30
function removefromturretlistondeathorcarry(entnumber) {
    waittill_any_2("death", "carried");
    level.turrets[entnumber] = undefined;
    removefromactivekillstreaklist(entnumber);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1868
// Size: 0x30
function function_f0edb803c309d596(entnumber) {
    if (!isdefined(level.mines)) {
        level.mines = [];
    }
    level.mines[entnumber] = self;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x189f
// Size: 0x27
function function_d3d9181348d12d5b(entnumber) {
    self waittill("death");
    level.mines[entnumber] = undefined;
    removefromactivekillstreaklist(entnumber);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18cd
// Size: 0x30
function addtosupportdronelist(entnumber) {
    if (!isdefined(level.supportdrones)) {
        level.supportdrones = [];
    }
    level.supportdrones[entnumber] = self;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1904
// Size: 0x27
function removefromsupportdronelistondeath(entnumber) {
    self waittill("death");
    level.supportdrones[entnumber] = undefined;
    removefromactivekillstreaklist(entnumber);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1932
// Size: 0x30
function addtoassaultdronelist(entnumber) {
    if (!isdefined(level.assaultdrones)) {
        level.assaultdrones = [];
    }
    level.assaultdrones[entnumber] = self;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1969
// Size: 0x27
function removefromassaultdronelistondeath(entnumber) {
    self waittill("death");
    level.assaultdrones[entnumber] = undefined;
    removefromactivekillstreaklist(entnumber);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1997
// Size: 0x3b
function addtoprojectilelist(entnumber) {
    if (!isdefined(level.projectilekillstreaks)) {
        level.projectilekillstreaks = [];
    }
    self.isprojectilekillstreak = 1;
    level.projectilekillstreaks[entnumber] = self;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d9
// Size: 0x27
function removefromprojectilelistondeath(entnumber) {
    self waittill("death");
    level.projectilekillstreaks[entnumber] = undefined;
    removefromactivekillstreaklist(entnumber);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a07
// Size: 0x30
function addtoplayerkillstreaklist(entnumber) {
    if (!isdefined(level.playerkillstreaks)) {
        level.playerkillstreaks = [];
    }
    level.playerkillstreaks[entnumber] = self;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a3e
// Size: 0x27
function removefromplayerkillstreaklistondeath(entnumber) {
    self waittill("death");
    level.playerkillstreaks[entnumber] = undefined;
    removefromactivekillstreaklist(entnumber);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a6c
// Size: 0x148
function setkillstreakcontrolpriority(owner, hintstring, var_daf100468d8a5e15, var_a68f5a8aed5a3de, hintrange, userange, usepriority, var_a4c898ca05df4d4c, hinticon) {
    self makeusable();
    if (isdefined(hinticon)) {
        self setcursorhint("HINT_BUTTON");
        self sethinticon(hinticon);
    } else {
        self setcursorhint("HINT_NOICON");
    }
    self sethintonobstruction("show");
    self sethintstring(hintstring);
    self sethintdisplayfov(var_daf100468d8a5e15);
    self setusefov(var_a68f5a8aed5a3de);
    self sethintdisplayrange(hintrange);
    self setuserange(userange);
    self setuseholdduration("duration_short");
    if (!isdefined(usepriority)) {
        usepriority = -1;
    }
    self setusepriority(usepriority);
    level thread applyplayercontrolonconnect(self);
    foreach (player in level.players) {
        if (player == owner && !istrue(var_a4c898ca05df4d4c)) {
            self enableplayeruse(player);
            continue;
        }
        self disableplayeruse(player);
    }
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bbb
// Size: 0x3d
function applyplayercontrolonconnect(killstreakuseent) {
    killstreakuseent endon("death");
    level endon("game_ended");
    while (true) {
        player = level waittill("connected");
        killstreakuseent disableplayeruse(player);
    }
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1bff
// Size: 0x161
function applykillstreakplayeroutline(player, streakendnotify) {
    /#
        assertex(isdefined(self.owner), "Killstreak has no defined owner.  This should not happen!");
    #/
    /#
        assertex(isdefined(self.team), "Killstreak has no defined team.  This should not happen!");
    #/
    killstreakteam = self.team;
    killstreakowner = self.owner;
    hudoutlineasset = undefined;
    perkcheck = undefined;
    if (!player scripts/cp_mp/utility/player_utility::_isalive() || player.team == "spectator" || player.team == "codcaster") {
        return;
    }
    if (player == killstreakowner) {
        hudoutlineasset = "outlinefill_depth_cyan";
    } else if (player != killstreakowner) {
        if (level.teambased && player.team != killstreakteam || !level.teambased) {
            hudoutlineasset = "outlinefill_depth_orange";
            perkcheck = 1;
        } else {
            return;
        }
    }
    if (isdefined(hudoutlineasset)) {
        if (istrue(perkcheck)) {
            if (player _hasperk("specialty_noplayertarget")) {
                return;
            }
        }
        id = outlineenableforplayer(player, self.owner, hudoutlineasset, "killstreak");
        thread watchoutlineremoveonkillstreakend(id, player, streakendnotify);
        thread watchoutlineremoveonplayerend(id, player, streakendnotify);
    }
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d67
// Size: 0x37
function watchoutlineremoveonkillstreakend(id, player, streakendnotify) {
    player endon("death_or_disconnect");
    level endon("game_ended");
    self waittill(streakendnotify);
    outlinedisable(id, player);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1da5
// Size: 0x37
function watchoutlineremoveonplayerend(id, player, streakendnotify) {
    self endon(streakendnotify);
    level endon("game_ended");
    player waittill("death_or_disconnect");
    outlinedisable(id, player);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1de3
// Size: 0x8f
function function_394de31762a977eb(weaponname, damagesize) {
    /#
        assert(damagesize == #"oneshot" || damagesize == #"large" || damagesize == #"medium" || damagesize == #"low" || damagesize == #"tick" || damagesize == #"hash_b76b2215370d2700");
    #/
    if (damagesize == #"hash_b76b2215370d2700") {
        return;
    }
    level.var_c6411e8929fa12b3[weaponname] = damagesize;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params b, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e79
// Size: 0x8c9
function getmodifiedantikillstreakdamage(attacker, objweapon, meansofdeath, amount, maxhealth, var_cb15fa5174e71840, var_be7c04516c5d9ccd, var_ca960a517459fe15, var_8aceb016baaf67af, var_64103c6b531d18f0, explodeoverride) {
    var_f20bc25347c9baaf = 0;
    var_4d8dc8aa1757e7a9 = 0;
    if (isdefined(meansofdeath)) {
        switch (meansofdeath) {
        case #"hash_4fb186ef47273ade":
        case #"hash_5f1054c48d66fd1c":
        case #"hash_966768b3f0c94767":
            break;
        case #"hash_3c20f39c73a1422b":
        case #"hash_571e46e17a3cf2e3":
        case #"hash_66cb246f3e55fbe2":
        case #"hash_a5123f4d02745600":
        case #"hash_a86d8c43482948a4":
        case #"hash_a911a1880d996edb":
        case #"hash_c22b13f81bed11f0":
        case #"hash_d8646db4e6ee3658":
            var_4d8dc8aa1757e7a9 = 1;
            break;
        default:
            break;
        }
    }
    if (var_4d8dc8aa1757e7a9) {
        var_f1563935aeeb5199 = undefined;
        if (meansofdeath != "MOD_MELEE") {
            damagesize = undefined;
            if (isdefined(level.var_c6411e8929fa12b3) && isdefined(objweapon)) {
                damagesize = level.var_c6411e8929fa12b3[objweapon.basename];
            }
            if (!isdefined(damagesize) && isdefined(objweapon)) {
                switch (objweapon.basename) {
                case #"hash_85ea99fcbe4116a4":
                case #"hash_aae52fc2913829d0":
                    damagesize = #"oneshot";
                    break;
                case #"hash_a9e31b8ffd42a67b":
                case #"hash_e704ecf8710c6f57":
                case #"hash_6b9700922cc910a9":
                case #"hash_fe08358bc8f9a34a":
                case #"hash_cb6c35c79573eb64":
                case #"hash_13a265ac820ea0df":
                case #"hash_a54e19ae2e8d865c":
                case #"hash_1a8f43f197f508a0":
                case #"hash_4f9064f9a7a4b7d1":
                case #"hash_7917bb9ef2886e20":
                case #"hash_1d6b88bde28b109a":
                case #"hash_f55c20924061bd15":
                case #"hash_c5c19fe9ae40cd0c":
                case #"hash_1fa9e128f4c7b140":
                case #"hash_24936ab5bf8a0e20":
                case #"hash_5c272c0617caebf0":
                case #"hash_5cbb3a1a84d47f1d":
                case #"hash_c124ad09158500e9":
                case #"hash_5e8f81314553dd36":
                case #"hash_2f1a9d8e2f127205":
                case #"hash_7a687f6a4d685110":
                case #"hash_3532a220183691a5":
                case #"hash_7de9687a97e62d93":
                case #"hash_3e782fd775b72022":
                    damagesize = #"large";
                    break;
                case #"hash_78ee9dd491b3907":
                case #"hash_79ee9dd492804fa":
                case #"hash_996455d7b14b362":
                case #"hash_fc4c0a8ee31549bb":
                case #"hash_12a2863ecf2eeecd":
                case #"hash_fd76dc693da26245":
                case #"hash_fd79e0693da4a728":
                case #"hash_1ba6982534c8d1d6":
                case #"hash_1cb3f2dbe85b8540":
                case #"hash_1ee2bbd1bc80ea9a":
                case #"hash_254b6e155434f84d":
                case #"hash_259ae6e25d936c3e":
                case #"hash_25fc06d658620968":
                case #"hash_2654d1bcc59b62b6":
                case #"hash_3226ebed78234b14":
                case #"hash_33aef56fb95396fd":
                case #"hash_359ac460bda5f9b8":
                case #"hash_3f2944fd91792508":
                case #"hash_471c36daeb2a655a":
                case #"hash_4e213f6d3f76b400":
                case #"hash_4fd5d83c1a7f06a7":
                case #"hash_51f4f5345b01f136":
                case #"hash_62a9688b69906271":
                case #"hash_acaf314732f4c8e4":
                case #"hash_6ac8f418ee829465":
                case #"hash_708fb6e22f87a3a4":
                case #"hash_73b4956c8f4b5217":
                case #"hash_82a5b9368f3f35ae":
                case #"hash_892911bfe6164871":
                case #"hash_e7af9caef1aa7899":
                case #"hash_91a48ebfd2d03a40":
                case #"hash_9386cafe3d8d6d59":
                case #"hash_9f73f49d822d9acc":
                case #"hash_a0bfc30978e56904":
                case #"hash_a622e958420b92a0":
                case #"hash_a9e5050965551dca":
                case #"hash_aef479d2af969a2d":
                case #"hash_af540b603005b109":
                case #"hash_af7c176030248498":
                case #"hash_b1d4d0d68c2b0c0f":
                case #"hash_b4fb660fd7773831":
                case #"hash_bac656916e53b91c":
                case #"hash_badacfdae124cc01":
                case #"hash_cd6b1f03c24c25ff":
                case #"hash_cf8515f17748a7d2":
                case #"hash_d1ffad9819388638":
                case #"hash_d30fa952a74e1642":
                case #"hash_d4532f8e0fa86548":
                case #"hash_d7f368cf53337cfd":
                case #"hash_e9ee40174ddfa406":
                case #"hash_ec580a77ee20c7bd":
                case #"hash_edf51f8e5118b630":
                case #"hash_ee243b8e513db31d":
                case #"hash_f003a3dc14dbdf3f":
                case #"hash_f5f81c45da642380":
                case #"hash_f816d2efb1dcbed0":
                case #"hash_fbca161190fca27d":
                    damagesize = #"medium";
                    break;
                case #"hash_17c70dc48424ba92":
                case #"hash_1a9da8a4fac9fde4":
                case #"hash_a009d256608f52ce":
                case #"hash_d30bcd7e470500f3":
                case #"hash_81d0787e9a579f3c":
                case #"hash_996849dc6e47c18f":
                case #"hash_d6565ec12efca627":
                case #"hash_dd4d572af14a12c2":
                case #"hash_e36b3928a0e518fa":
                case #"hash_435258fc47768fa7":
                case #"hash_6a2e4f9c54756dc7":
                case #"hash_6547ec525f1340da":
                case #"hash_5e4ccaa178cac19c":
                case #"hash_c3639c6f29cf149a":
                case #"hash_c4b9b21ecac2ced4":
                case #"hash_1e6ad4ef0904a0f1":
                case #"hash_56ee829cc162271a":
                case #"hash_ca48d454faafb042":
                case #"hash_4b87af60037f526f":
                case #"hash_8c12df11df01f306":
                case #"hash_cce14c95e4764532":
                    damagesize = #"low";
                    break;
                case #"hash_104394c101679f9e":
                case #"hash_d78eda24c2fd8252":
                case #"hash_b8c7008e1d8543df":
                case #"hash_8fd6158eb96a1f15":
                case #"hash_4c7de5619284e175":
                case #"hash_a49fac234083ff01":
                    damagesize = #"tick";
                    break;
                }
            }
        } else {
            damagesize = #"melee";
        }
        if (isdefined(damagesize)) {
            if (damagesize == #"oneshot") {
                self.largeprojectiledamage = 1;
                self.killoneshot = 1;
                var_f1563935aeeb5199 = 1;
            } else if (damagesize == #"large") {
                self.largeprojectiledamage = 1;
                var_f1563935aeeb5199 = var_cb15fa5174e71840;
            } else if (damagesize == #"medium") {
                self.largeprojectiledamage = 1;
                var_f1563935aeeb5199 = var_be7c04516c5d9ccd;
            } else if (damagesize == #"low") {
                self.largeprojectiledamage = 0;
                var_f1563935aeeb5199 = var_ca960a517459fe15;
            } else if (damagesize == #"tick") {
                self.largeprojectiledamage = 0;
                var_f1563935aeeb5199 = var_64103c6b531d18f0;
            } else if (damagesize == #"melee") {
                self.largeprojectiledamage = 0;
                var_f1563935aeeb5199 = var_8aceb016baaf67af;
            }
        }
        if (isdefined(var_f1563935aeeb5199)) {
            amount = ceil(maxhealth / var_f1563935aeeb5199);
            var_f20bc25347c9baaf = 1;
        }
    }
    if (isdefined(explodeoverride)) {
        self.largeprojectiledamage = explodeoverride;
    }
    var_e688b198aa9a4b3f = 0;
    /#
        var_e688b198aa9a4b3f = getdvarint(@"hash_10368af4dee3ba2c", 0);
    #/
    if (!var_f20bc25347c9baaf && isdefined(objweapon)) {
        amount = scripts/mp/damage::handleshotgundamage(objweapon, meansofdeath, amount);
        amount = scripts/mp/damage::handleapdamage(objweapon, meansofdeath, amount, attacker);
        amount = scripts/mp/damage::function_5e4aa8d548cc604e(amount, objweapon, attacker, meansofdeath);
        amount = scripts/mp/damage::function_10268164ab1bcc31(amount, objweapon, attacker);
    }
    if (isdefined(attacker) && isdefined(self.owner) && !var_e688b198aa9a4b3f) {
        if (isdefined(attacker.owner)) {
            attacker = attacker.owner;
        }
        if (attacker == self.owner && !istrue(self.killoneshot)) {
            amount = ceil(amount / 2);
        }
    }
    return int(amount);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x274a
// Size: 0x1d
function nulldamagecheck(attacker) {
    return isdefined(attacker) && attacker == self.owner;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x276f
// Size: 0x179
function dodamagetokillstreak(damage, attacker, inflictor, victimteam, sourceorigin, meansofdeath, weaponname) {
    direction_vec = (0, 0, 0);
    point = (0, 0, 0);
    angles = (0, 0, 0);
    normal = (0, 0, 0);
    modelname = "";
    tagname = "";
    partname = "";
    idflags = undefined;
    if (isdefined(victimteam)) {
        if (level.teambased) {
            if (!isvalidteamtarget(attacker, victimteam, self)) {
                return;
            }
        } else if (!isvalidffatarget(attacker, victimteam, self)) {
            return;
        }
    }
    if (isagent(self)) {
        self dodamage(damage, sourceorigin, attacker, inflictor, meansofdeath, weaponname);
        return;
    }
    if (scripts/cp_mp/vehicles/vehicle::isvehicle()) {
        self dodamage(damage, sourceorigin, attacker, inflictor, meansofdeath, weaponname);
        return;
    }
    weapon = makeweaponfromstring(weaponname);
    self notify("damage", damage);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x28ef
// Size: 0xe7
function playdlightfx(posoffset, angleoffset) {
    self endon("death");
    if (!isdefined(posoffset)) {
        posoffset = (0, 0, 0);
    }
    if (!isdefined(angleoffset)) {
        angleoffset = (0, 0, 0);
    }
    dlightfx = getfx("dlight_large");
    if (istrue(self.isairdrop)) {
        dlightfx = getfx("dlight_small");
    }
    self.fxdlightent = spawn("script_model", self.origin);
    self.fxdlightent setmodel("tag_origin");
    self.fxdlightent linkto(self, "tag_origin", posoffset, angleoffset);
    self.fxdlightent thread deleteonparentdeath(self);
    wait(0.1);
    playfxontag(dlightfx, self.fxdlightent, "tag_origin");
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29dd
// Size: 0x27
function deleteonparentdeath(parent) {
    self endon("death");
    parent waittill("death");
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a0b
// Size: 0x31
function isaffectedbyblindeye(killstreakname) {
    switch (killstreakname) {
    case #"hash_576b868dbf9eab17":
    case #"hash_8b0d967838e55b97":
        return true;
    }
    return false;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a44
// Size: 0x82
function watchsupertrophynotify(owner) {
    owner endon("disconnect");
    self endon("explode");
    while (true) {
        trophyowner, trophyweaponname, targetweaponname, targetorigin, targetangles = owner waittill("destroyed_by_trophy");
        if (targetweaponname != self.weapon_name) {
            continue;
        }
        owner updatedamagefeedback("");
        break;
    }
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2acd
// Size: 0xeb
function watchhostmigrationlifetime(var_5303201f58dbbafe, lifetime, lifetimefunc) {
    if (var_5303201f58dbbafe != "death") {
        self endon("death");
    }
    self endon(var_5303201f58dbbafe);
    level endon("game_ended");
    startinglifetime = gettime() + int(lifetime * 1000);
    level waittill("host_migration_begin");
    self notify("host_migration_lifetime_update");
    hoststarttime = gettime();
    remaininglifetime = startinglifetime - hoststarttime;
    level waittill("host_migration_end");
    hostendtime = gettime();
    newtime = hostendtime + remaininglifetime;
    remaininglifetime = remaininglifetime / 1000;
    if (isdefined(self.streakname) && isridekillstreak(self.streakname)) {
        self.owner setclientomnvar("ui_killstreak_countdown", newtime);
    }
    self [[ lifetimefunc ]](remaininglifetime);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2bbf
// Size: 0x77
function getenemytargets(owner) {
    enemytargets = [];
    foreach (player in level.players) {
        if (owner scripts/cp_mp/utility/player_utility::isenemy(player)) {
            enemytargets[enemytargets.size] = player;
        }
    }
    return enemytargets;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2c3e
// Size: 0x15e
function _beginlocationselection(streakname, selectortype, var_8e536aa74b9c997d, size) {
    self beginlocationselection(selectortype, var_8e536aa74b9c997d, "circle_marker", size);
    self.selectinglocation = 1;
    self setblurforplayer(10.3, 0.3);
    thread endselectiononaction("cancel_location");
    thread endselectiononaction("death");
    thread endselectiononaction("disconnect");
    thread endselectiononaction("used");
    thread endselectiononaction("weapon_change");
    self endon("stop_location_selection");
    thread endselectiononendgame();
    if (isdefined(streakname) && self.team != "spectator" && self.team != "codcaster") {
        if (isdefined(self.streakmsg)) {
            self.streakmsg destroy();
        }
        if (self issplitscreenplayer()) {
            self.streakmsg = scripts/mp/hud_util::createfontstring("default", 1.3);
            self.streakmsg scripts/mp/hud_util::setpoint("CENTER", "CENTER", 0, -98);
            return;
        }
        self.streakmsg = scripts/mp/hud_util::createfontstring("default", 1.6);
        self.streakmsg scripts/mp/hud_util::setpoint("CENTER", "CENTER", 0, -190);
    }
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2da3
// Size: 0x67
function stoplocationselection(disconnected, reason) {
    if (!isdefined(reason)) {
        reason = "generic";
    }
    if (!disconnected) {
        self setblurforplayer(0, 0.3);
        self endlocationselection();
        self.selectinglocation = undefined;
        if (isdefined(self.streakmsg)) {
            self.streakmsg destroy();
        }
    }
    self notify("stop_location_selection", reason);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e11
// Size: 0x27
function endselectiononaction(waitfor) {
    self endon("stop_location_selection");
    self waittill(waitfor);
    thread stoplocationselection(waitfor == "disconnect", waitfor);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e3f
// Size: 0x20
function endselectiononendgame() {
    self endon("stop_location_selection");
    level waittill("game_ended");
    thread stoplocationselection(0, "end_game");
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e66
// Size: 0x44
function streakshouldchain(streakname) {
    var_c45c5e5081953209 = scripts/mp/killstreaks/killstreaks::calcstreakcost(streakname);
    nextstreakname = scripts/mp/killstreaks/killstreaks::getnextstreakname();
    nextstreakcost = scripts/mp/killstreaks/killstreaks::calcstreakcost(nextstreakname);
    return var_c45c5e5081953209 < nextstreakcost;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2eb2
// Size: 0x5a
function streakcheckistargetindoors(targetpos, ignorelist) {
    isindoors = 0;
    contents = scripts/engine/trace::create_contents(0, 1, 0, 1, 1, 0);
    if (!scripts/engine/trace::ray_trace_passed(targetpos, targetpos + (0, 0, 10000), ignorelist, contents)) {
        isindoors = 1;
    }
    return isindoors;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f14
// Size: 0x41
function function_26ab4629dc655c14(streakname) {
    var_26ab4629dc655c14 = 0;
    switch (streakname) {
    case #"hash_472d8b6c2f51a9c8":
    case #"hash_4d35eb58f9d545f0":
        var_26ab4629dc655c14 = 1;
        break;
    }
    return var_26ab4629dc655c14;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f5d
// Size: 0x65
function isremotekillstreak(streakname) {
    remotekillstreak = 0;
    switch (streakname) {
    case #"hash_28d0236400e33fd0":
    case #"hash_349713b5ad494dda":
    case #"hash_413c38e72fe8b5bf":
    case #"hash_9e36e3bd3a9dd00d":
    case #"hash_cf0ef5bef19a311b":
        remotekillstreak = 1;
        break;
    }
    return remotekillstreak;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fca
// Size: 0x59
function isuavkillstreak(streakname) {
    isuav = 0;
    switch (streakname) {
    case #"hash_10e585c25e7e9f60":
    case #"hash_634b246c3da5c56f":
    case #"hash_e171e5b86ef0a4cc":
    case #"hash_e51f2e3d5cdd8ed8":
        isuav = 1;
        break;
    }
    return isuav;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x302b
// Size: 0x89
function isairstrikekillstreak(streakname) {
    var_cc5e6f089d31a891 = 0;
    switch (streakname) {
    case #"hash_195360490caa3220":
    case #"hash_413c38e72fe8b5bf":
    case #"hash_4220be38a5f150b8":
    case #"hash_62810d05099e0103":
    case #"hash_7a687f6a4d685110":
    case #"hash_8c766d6477287bb6":
    case #"hash_a1031216158c7882":
    case #"hash_b161e185f1b8e117":
        var_cc5e6f089d31a891 = 1;
        break;
    }
    return var_cc5e6f089d31a891;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30bc
// Size: 0x41
function islittlebirdkillstreak(streakname) {
    islittlebird = 0;
    switch (streakname) {
    case #"hash_2289ec11d77bce8f":
    case #"hash_56979e0566996b2e":
        islittlebird = 1;
        break;
    }
    return islittlebird;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3105
// Size: 0x4d
function ishelikillstreak(streakname) {
    isheli = 0;
    switch (streakname) {
    case #"hash_bf2f9adbd2b41d5":
    case #"hash_349713b5ad494dda":
    case #"hash_887ad77192b9c4fb":
        isheli = 1;
        break;
    }
    return isheli;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x315a
// Size: 0x4d
function isturretkillstreak(streakname) {
    isturret = 0;
    switch (streakname) {
    case #"hash_19dd9a3a4147e09e":
    case #"hash_4d5aa76e8707f47b":
    case #"hash_52d9b7ed584bec3e":
        isturret = 1;
        break;
    }
    return isturret;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31af
// Size: 0x59
function isprojectilekillstreak(streakname) {
    isprojectile = 0;
    switch (streakname) {
    case #"hash_28d0236400e33fd0":
    case #"hash_6362d6aae3e5a62e":
    case #"hash_7a687f6a4d685110":
    case #"hash_b4ac3581c343a029":
        isprojectile = 1;
        break;
    }
    return isprojectile;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3210
// Size: 0x41
function issupportdronekillstreak(streakname) {
    var_1cda07ab27d6768e = 0;
    switch (streakname) {
    case #"hash_27002778019fb447":
    case #"hash_e40585107590f016":
        var_1cda07ab27d6768e = 1;
        break;
    }
    return var_1cda07ab27d6768e;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3259
// Size: 0x41
function isassaultdronekillstreak(streakname) {
    isassaultdrone = 0;
    switch (streakname) {
    case #"hash_9e36e3bd3a9dd00d":
    case #"hash_cf0ef5bef19a311b":
        isassaultdrone = 1;
        break;
    }
    return isassaultdrone;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32a2
// Size: 0x33
function iscarepackage(ent) {
    return isdefined(ent) && isdefined(ent.id) && ent.id == "care_package";
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32dd
// Size: 0x13
function isjuggernaut() {
    return isdefined(self) && istrue(self.isjuggernaut);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32f8
// Size: 0x89
function isremotekillstreakweapon(weapon) {
    remoteweapon = 0;
    switch (weapon) {
    case #"hash_32eb6c9e8b2bae4a":
    case #"hash_33c7f389fa9d6dd5":
    case #"hash_42f1955f763af384":
    case #"hash_45e409945333f912":
    case #"hash_5f2ad7140f378ee1":
    case #"hash_70c33644073da94f":
    case #"hash_b43c2e4c05fafc4b":
    case #"hash_f194befae42e3476":
        remoteweapon = 1;
        break;
    }
    return remoteweapon;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3389
// Size: 0x4a
function iskillstreaklockonable(streakname) {
    switch (streakname) {
    case #"hash_28d0236400e33fd0":
    case #"hash_56979e0566996b2e":
    case #"hash_e171e5b86ef0a4cc":
        return 0;
    default:
        return 1;
    }
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x33da
// Size: 0x86
function isflyingkillstreak(streakname) {
    switch (streakname) {
    case #"hash_13353c75b92b3fcc":
    case #"hash_26a12ee6db5cd83c":
    case #"hash_2916b409ed596650":
    case #"hash_413c38e72fe8b5bf":
    case #"hash_56979e0566996b2e":
    case #"hash_8c766d6477287bb6":
    case #"hash_d5cb9b4efa4e54b6":
    case #"hash_ea61c6ba128ead64":
        return 1;
    default:
        return 0;
    }
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3467
// Size: 0xa1
function getkillstreakkills(streakname) {
    bundle = level.streakglobals.streakbundles[streakname];
    if (!isdefined(bundle)) {
        return 0;
    }
    cost = bundle.kills;
    if (_hasperk("specialty_killstreak_to_scorestreak") && streakname != "nuke") {
        cost = bundle.scorecost;
    } else if (_hasperk("specialty_support_killstreaks")) {
        cost = bundle.supportcost;
    }
    cost = function_545766e9ea1f655d(streakname, cost);
    return ter_op(isdefined(cost), cost, 0);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3510
// Size: 0x94
function function_545766e9ea1f655d(streakname, cost) {
    if (isdefined(self.var_f3c2f1677bc581d7) && isdefined(self.var_f3c2f1677bc581d7[streakname])) {
        foreach (value in self.var_f3c2f1677bc581d7[streakname].values) {
            if (value < cost) {
                cost = value;
            }
        }
    }
    return cost;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35ac
// Size: 0x59
function getkillstreakoverheadicon(streakname) {
    bundle = level.streakglobals.streakbundles[streakname];
    if (!isdefined(bundle)) {
        return "";
    }
    return ter_op(isdefined(bundle.overheadicon), bundle.overheadicon, "");
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x360d
// Size: 0x3f
function function_8728f7cf8c005a0(streakname) {
    bundle = level.streakglobals.streakbundles[streakname];
    if (!isdefined(bundle)) {
        return 0;
    }
    return istrue(bundle.var_70bf491b5574dfcc);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3654
// Size: 0xdb
function currentactivevehiclecount(extra) {
    if (!isdefined(extra)) {
        extra = 0;
    }
    count = extra;
    if (isdefined(level.helis)) {
        count = count + level.helis.size;
    }
    if (isdefined(level.littlebirds)) {
        count = count + level.littlebirds.size;
    }
    if (isdefined(level.ugvs)) {
        count = count + level.ugvs.size;
    }
    if (isdefined(level.bradley) && isdefined(level.bradley.vehicles)) {
        count = count + level.bradley.size;
    }
    if (isdefined(level.supportdrones)) {
        count = count + level.supportdrones.size;
    }
    if (isdefined(level.assaultdrones)) {
        count = count + level.assaultdrones.size;
    }
    return count;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3737
// Size: 0x5
function maxvehiclesallowed() {
    return 8;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3744
// Size: 0xc
function fauxvehiclecount() {
    return level.fauxvehiclecount;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3758
// Size: 0x32
function incrementfauxvehiclecount(value) {
    if (!isdefined(value)) {
        level.fauxvehiclecount++;
        return;
    }
    level.fauxvehiclecount = level.fauxvehiclecount + value;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3791
// Size: 0x4a
function decrementfauxvehiclecount(value) {
    if (!isdefined(value)) {
        level.fauxvehiclecount--;
    } else {
        level.fauxvehiclecount = level.fauxvehiclecount - value;
    }
    if (level.fauxvehiclecount < 0) {
        level.fauxvehiclecount = 0;
    }
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37e2
// Size: 0x4a
function isassaultkillstreak(refstring) {
    switch (refstring) {
    case #"hash_26a12ee6db5cd83c":
    case #"hash_634b246c3da5c56f":
    case #"hash_e171e5b86ef0a4cc":
        return 1;
    default:
        return 0;
    }
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3833
// Size: 0x6e
function isresourcekillstreak(refstring) {
    switch (refstring) {
    case #"hash_155f01fe111e3395":
    case #"hash_283643e4f79541f8":
    case #"hash_36653f7e35d0878d":
    case #"hash_6969314db2c192ea":
    case #"hash_c244f66a067b8deb":
    case #"hash_c72f9e2dc5fac20b":
        return 1;
    default:
        return 0;
    }
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38a8
// Size: 0xd
function issupportkillstreak(refstring) {
    return false;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38bd
// Size: 0xd
function isspecialistkillstreak(refstring) {
    return false;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38d2
// Size: 0x10
function gethelipilotmeshoffset() {
    return (0, 0, 5000);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38ea
// Size: 0x10
function gethelipilottraceoffset() {
    return (0, 0, 2500);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3902
// Size: 0x19
function isnavmeshkillstreak(streakname) {
    requiresnavmesh = 0;
    return requiresnavmesh;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3923
// Size: 0x26
function iscontrollingproxyagent() {
    if (isdefined(self.playerproxyagent) && isalive(self.playerproxyagent)) {
        return true;
    }
    return false;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3951
// Size: 0x39
function killshouldaddtokillstreak(objweapon) {
    if (_hasperk("specialty_explosivebullets")) {
        return false;
    }
    return !namespace_e0ee43ef2dddadaa::iskillstreakweapon(objweapon.basename) && scripts/mp/utility/points::function_caddf81c02734fa0(objweapon);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3992
// Size: 0x25
function getairdropcrates() {
    if (isdefined(level.cratedata)) {
        return level.cratedata.crates;
    }
    return [];
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39bf
// Size: 0x26
function getnumairdropcrates() {
    if (isdefined(level.cratedata)) {
        return level.cratedata.crates.size;
    }
    return 0;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39ed
// Size: 0x88
function attackerinremotekillstreak() {
    if (!isdefined(self)) {
        return false;
    }
    if (isdefined(level.gunshipplayer) && self == level.gunshipplayer) {
        return true;
    }
    if (isdefined(level.chopper) && isdefined(level.chopper.gunner) && self == level.chopper.gunner) {
        return true;
    }
    if (isdefined(self.using_remote_tank) && self.using_remote_tank) {
        return true;
    }
    return false;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a7d
// Size: 0x99
function killstreak_make_vehicle(streakname, scorepopup, vodestroyed, destroyedsplash) {
    self.vehiclename = streakname;
    self.scorepopup = scorepopup;
    self.vodestroyed = vodestroyed;
    self.destroyedsplash = destroyedsplash;
    self enableplayermarks("killstreak");
    if (level.teambased) {
        self filteroutplayermarks(self.team);
    } else {
        self filteroutplayermarks(self.owner);
    }
    scripts/cp_mp/vehicles/vehicle_damage::vehicle_damage_enableownerdamage(self);
    scripts/mp/vehicles/damage::get_vehicle_mod_damage_data(streakname, 1);
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b1d
// Size: 0x45
function killstreak_vehicle_callback_init() {
    if (!istrue(level.kscallbackinitcomplete)) {
        level.kscallbackinitcomplete = 1;
        level.kspremoddamagecallback = &killstreak_pre_mod_damage_callback;
        level.kspostmoddamagecallback = &killstreak_post_mod_damage_callback;
        level.ksdeathcallback = &killstreak_death_callback;
    }
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b69
// Size: 0xc4
function killstreak_pre_mod_damage_callback(data) {
    damage = data.damage;
    attacker = data.attacker;
    if (!istrue(self.killoneshot) && !istrue(self.debugdamage)) {
        if (isdefined(attacker) && isdefined(self.owner) && attacker == self.owner) {
            damage = int(ceil(damage * 0.5));
        }
        data.damage = damage;
    }
    shouldcontinue = 1;
    var_bacc6dd14316758c = self.kspremoddamagecallback;
    if (isdefined(var_bacc6dd14316758c)) {
        shouldcontinue = self [[ var_bacc6dd14316758c ]](data);
    }
    return shouldcontinue;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c35
// Size: 0x6e
function killstreak_post_mod_damage_callback(data) {
    scripts/mp/killstreaks/killstreaks::killstreakhit(data.attacker, data.objweapon, self, data.meansofdeath, data.damage);
    shouldcontinue = 1;
    var_7da88d9c69433487 = self.kspostmoddamagecallback;
    if (isdefined(var_7da88d9c69433487)) {
        shouldcontinue = self [[ var_7da88d9c69433487 ]](data);
    }
    return shouldcontinue;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cab
// Size: 0x91
function killstreak_death_callback(data) {
    scripts/mp/damage::onkillstreakkilled(self.streakname, data.attacker, data.objweapon, data.meansofdeath, data.damage, self.scorepopup, self.vodestroyed, self.destroyedsplash);
    shouldcontinue = 1;
    deathcallback = self.ksdeathcallback;
    if (isdefined(deathcallback)) {
        shouldcontinue = self [[ deathcallback ]](data);
    }
    return shouldcontinue;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d44
// Size: 0x36
function killstreak_set_pre_mod_damage_callback(streakname, var_bacc6dd14316758c) {
    killstreak_vehicle_callback_init();
    scripts/mp/vehicles/damage::set_pre_mod_damage_callback(streakname, level.kspremoddamagecallback);
    self.kspremoddamagecallback = var_bacc6dd14316758c;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d81
// Size: 0x36
function killstreak_set_post_mod_damage_callback(streakname, var_7da88d9c69433487) {
    killstreak_vehicle_callback_init();
    scripts/mp/vehicles/damage::set_post_mod_damage_callback(streakname, level.kspostmoddamagecallback);
    self.kspostmoddamagecallback = var_7da88d9c69433487;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dbe
// Size: 0x36
function killstreak_set_death_callback(streakname, deathcallback) {
    killstreak_vehicle_callback_init();
    scripts/mp/vehicles/damage::set_death_callback(streakname, level.ksdeathcallback);
    self.ksdeathcallback = deathcallback;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dfb
// Size: 0x3e
function getkillstreaknamefromweapon(objweapon) {
    basename = objweapon.basename;
    if (isdefined(level.killstreakweaponmap[basename])) {
        return level.killstreakweaponmap[basename];
    }
    return undefined;
}

// Namespace killstreak / scripts/mp/utility/killstreak
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e41
// Size: 0x18f
function function_dab24dca3ba6294a(streakname) {
    /#
        level endon("");
        devdvar = @"hash_b4fe29a00bfde823";
        setdevdvarifuninitialized(devdvar, 0);
        while (isdefined(self)) {
            debugdamage = getdvarint(devdvar, 0);
            if (!debugdamage) {
                if (istrue(self.debugdamage)) {
                    self.debugdamage = undefined;
                }
                waitframe();
                continue;
            }
            self.debugdamage = 1;
            damageamount = 0;
            damagemod = "host_migration_end";
            debugweapon = "specialty_support_killstreaks";
            switch (debugdamage) {
            case 1:
                damageamount = int(self.maxhealth * 0.25);
                break;
            case 2:
                damageamount = int(self.maxhealth * 0.5);
                break;
            case 3:
                damageamount = int(self.maxhealth * 0.75);
                break;
            case 4:
                damageamount = self.maxhealth;
                damagemod = "<unknown string>";
                debugweapon = "<unknown string>";
                break;
            case 5:
                damageamount = self.maxhealth;
                break;
            }
            self dodamage(damageamount, self.origin, self.owner, self.owner, damagemod, makeweapon(debugweapon));
            waitframe();
            setdvar(devdvar, 0);
        }
    #/
}

