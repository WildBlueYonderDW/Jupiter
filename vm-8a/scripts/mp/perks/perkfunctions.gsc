#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\values.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\perks\perks.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\inventory.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\usability.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using script_5762ac2f22202ba2;
#using script_7c40fa80892a721;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\door.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\weapons.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\tweakables.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\lightarmor.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\archetypes\archassault.gsc;
#using scripts\mp\perks\perk_mark_targets.gsc;
#using scripts\mp\flags.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_compass.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\spawncamera.gsc;
#using scripts\mp\destructible.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\teamrevive.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\equipment\gas_grenade.gsc;
#using script_372301af73968cb;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\equipment\snapshot_grenade.gsc;
#using scripts\mp\events.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_1f97a44d1761c919;
#using scripts\mp\utility\print.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using script_189b67b2735b981d;
#using scripts\cp_mp\execution.gsc;
#using script_669760f0500e4358;
#using scripts\mp\gametypes\br_quest_util.gsc;

#namespace perkfunctions;

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x279f
// Size: 0xa
function sethealer() {
    thread radialhealer();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27b1
// Size: 0x17e
function radialhealer() {
    self endon("unset_healer");
    self endon("disconnect");
    level endon("game_ended");
    if (!level.teambased) {
        return;
    }
    self.teammateswithhealperk = [];
    while (true) {
        if (player_utility::_isalive()) {
            players = player::getplayersinradius(self.origin, 350, self.team, self);
            foreach (player in players) {
                if (player perk::_hasperk("specialty_healer")) {
                    continue;
                }
                if (self.team == player.team && player player_utility::_isalive() && !isdefined(player.healer)) {
                    playerentitynum = player getentitynumber();
                    if (self.teammateswithhealperk.size == 0) {
                        hud_message::showmiscmessage("healing_players");
                    }
                    player.healer = self;
                    self.teammateswithhealperk[playerentitynum] = 1;
                    player perk::giveperk("specialty_regenfaster");
                    player perk::giveperk("specialty_regen_delay_reduced");
                    player hud_message::showmiscmessage("in_healing_range");
                    givehealedoverlay(player);
                    thread healerperkteammatewatcher(player);
                    thread healerperkteammatedestructor(player);
                }
            }
        }
        wait 0.3;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2937
// Size: 0x150
function healerperkteammatewatcher(player) {
    level endon("game_ended");
    self endon("unset_healer");
    self endon("death_or_disconnect");
    player endon("death_or_disconnect");
    while (true) {
        lim = 400;
        if (distancesquared(self.origin, player.origin) > lim * lim || player.team != self.team) {
            player notify("out_of_healing_range");
            return;
        }
        playerentitynum = player getentitynumber();
        if (player.health < player.maxhealth && player.healedoverlay.alpha == player.healedoverlay.lowalpha) {
            player thread healedoverlayfade(player.healedoverlay, self, player.healedoverlay.highalpha);
        } else if (player.health == player.maxhealth) {
            player thread healedoverlayfade(player.healedoverlay, self, player.healedoverlay.lowalpha);
        }
        wait 0.1;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a8f
// Size: 0xa4
function healerperkteammatedestructor(player) {
    level endon("game_ended");
    playerentitynum = player getentitynumber();
    waittill_any_ents(self, "unset_healer", self, "death_or_disconnect", player, "death_or_disconnect", player, "out_of_healing_range");
    if (isdefined(player)) {
        player perk::removeperk("specialty_regenfaster");
        player perk::removeperk("specialty_regen_delay_reduced");
        player.healer = undefined;
        player hud_message::showmiscmessage("out_of_healing_range");
    }
    if (isdefined(self)) {
        self.teammateswithhealperk[playerentitynum] = undefined;
        if (self.teammateswithhealperk.size == 0) {
            hud_message::showmiscmessage("no_healing_players");
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b3b
// Size: 0xa
function unsethealer() {
    self notify("unset_healer");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b4d
// Size: 0xe5
function givehealedoverlay(player) {
    healedoverlay = newclienthudelem(player);
    healedoverlay.x = 0;
    healedoverlay.y = 0;
    healedoverlay setshader("overlay_healer", 640, 480);
    healedoverlay.alignx = "left";
    healedoverlay.aligny = "top";
    healedoverlay.horzalign = "fullscreen";
    healedoverlay.vertalign = "fullscreen";
    healedoverlay.alpha = 0;
    healedoverlay.lowalpha = 0;
    healedoverlay.highalpha = 0.75;
    player.healedoverlay = healedoverlay;
    player thread healedoverlayfade(healedoverlay, self, healedoverlay.lowalpha);
    player thread healedoverlaydestructor(healedoverlay, self);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c3a
// Size: 0x57
function healedoverlayfade(healedoverlay, healer, final) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("out_of_healing_range");
    healer endon("death_or_disconnect");
    healer endon("unset_healer");
    healedoverlay fadeovertime(0.5);
    healedoverlay.alpha = final;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c99
// Size: 0x5d
function healedoverlaydestructor(healedoverlay, healer) {
    waittill_any_ents(level, "game_ended", healer, "unset_healer", healer, "death_or_disconnect", self, "death_or_disconnect", self, "out_of_healing_range");
    if (isdefined(healedoverlay)) {
        healedoverlay fadeovertime(1);
        healedoverlay.alpha = 0;
        wait 1;
        healedoverlay destroy();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cfe
// Size: 0xc
function setbreacher() {
    door::updatealldoorslockvisibilityforplayer(self, 1);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d12
// Size: 0xb
function unsetbreacher() {
    door::updatealldoorslockvisibilityforplayer(self, 0);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d25
// Size: 0xa
function setoffhandprovider() {
    thread offhandproviderthread();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d37
// Size: 0x1a0
function offhandproviderthread() {
    level endon("game_ended");
    self endon("unset_offhand_provider");
    self endon("death_or_disconnect");
    while (true) {
        players = player::getplayersinradius(self.origin, 144, self.team, self);
        foreach (player in players) {
            if (!isdefined(player.ohpequipmentrefills)) {
                player.ohpequipmentrefills = [];
            }
            if (player equipmentusedbyslot("primary") == 0 && player equipmentusedbyslot("secondary") == 0) {
                continue;
            }
            if (!isdefined(player.ohpequipmentrefills[self getentitynumber()]) && player player_utility::_isalive()) {
                player.ohpequipmentrefills[self getentitynumber()] = 1;
                equipmentfilled = player refillequipment();
                for (i = 0; i < equipmentfilled["primary"]; i++) {
                    player thread ohpequipmentfillednotification(self.name, player equipment::getcurrentequipment("primary"));
                }
                for (i = 0; i < equipmentfilled["secondary"]; i++) {
                    player thread ohpequipmentfillednotification(self.name, player equipment::getcurrentequipment("secondary"));
                }
                thread ohpallowuseonplayerdeath(player);
                player playsoundtoplayer("scavenger_pack_pickup", player);
            }
        }
        wait 0.1;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2edf
// Size: 0x4a
function ohpallowuseonplayerdeath(player) {
    level endon("game_ended");
    player endon("disconnect");
    entnum = self getentitynumber();
    utility::waittill_any_ents_return(self, "disconnect", player, "death");
    player.ohpequipmentrefills[entnum] = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f31
// Size: 0xa
function unsetoffhandprovider() {
    self notify("unset_offhand_provider");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f43
// Size: 0x39
function refillequipment() {
    var_7bad5d0b3ab39f16 = [];
    var_7bad5d0b3ab39f16["primary"] = equipmentusedbyslot("primary", 1);
    var_7bad5d0b3ab39f16["secondary"] = equipmentusedbyslot("secondary", 1);
    return var_7bad5d0b3ab39f16;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f85
// Size: 0x8c
function equipmentusedbyslot(slot, refill) {
    assertex(slot == "primary" || slot == "secondary", "parameter must be either 'primary' or 'secondary'");
    if (!isdefined(refill)) {
        refill = 0;
    }
    eq = equipment::getcurrentequipment(slot);
    eqcap = getequipmentstartammo(slot);
    var_bd0ead7ae63d86d = equipment::getequipmentammo(eq);
    if (refill && eqcap - var_bd0ead7ae63d86d > 0) {
        equipment::incrementequipmentammo(eq, eqcap - var_bd0ead7ae63d86d);
    }
    return eqcap - var_bd0ead7ae63d86d;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x301a
// Size: 0x94
function getequipmentstartammo(slot) {
    assertex(slot == "primary" || slot == "secondary", "parameter must be either 'primary' or 'secondary'");
    eq = equipment::getcurrentequipment(slot);
    eqcap = equipment::getequipmentstartammo(eq);
    if (slot == "primary" && perk::_hasperk("specialty_extra_deadly")) {
        eqcap = equipment::getequipmentmaxammo(eq);
    }
    if (slot == "secondary" && perk::_hasperk("specialty_extra_tactical")) {
        eqcap = equipment::getequipmentmaxammo(eq);
    }
    return eqcap;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30b7
// Size: 0x239
function ohpequipmentfillednotification(ohpname, equip) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    if (!isdefined(self.munitionsnotifications)) {
        self.munitionsnotifications = [];
    }
    size = self.munitionsnotifications.size;
    for (i = 0; i < size; i++) {
        if (i < 2) {
            thread movenotificationup(self.munitionsnotifications[i]);
            continue;
        }
        notif = self.munitionsnotifications[i];
        self.munitionsnotifications[i] = undefined;
        notif notify("delete_icon_elem");
    }
    finalx = 620;
    finaly = 360;
    x = 352;
    y = 264;
    iconelem = newclienthudelem(self);
    iconelem.x = x;
    iconelem.y = y;
    iconelem.alignx = "right";
    iconelem.aligny = "top";
    iconelem.sort = 2;
    iconelem.alpha = 0;
    equipinfo = equipment::getequipmenttableinfo(equip);
    if (isdefined(equipinfo)) {
        iconelem setshader(equipinfo.image, 25, 25);
    }
    iconelem fadeovertime(0.15);
    iconelem moveovertime(0.35);
    iconelem.alpha = 1;
    iconelem.x = finalx;
    iconelem.y = finaly;
    self.munitionsnotifications = utility::array_insert(self.munitionsnotifications, iconelem, 0);
    iconelem endon("delete_icon_elem");
    thread ohpcleanupnotificationondeath(iconelem);
    iconelem.isanimating = 1;
    wait 0.35;
    iconelem.isanimating = 0;
    wait 3;
    iconelem fadeovertime(0.5);
    iconelem.alpha = 0;
    wait 0.5;
    iconelem notify("delete_icon_elem");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32f8
// Size: 0x4a
function ohpcleanupnotificationondeath(iconelem) {
    level endon("game_ended");
    utility::waittill_any_ents(self, "death_or_disconnect", iconelem, "delete_icon_elem");
    if (isdefined(self)) {
        self.munitionsnotifications = utility::array_remove(self.munitionsnotifications, iconelem);
    }
    iconelem destroy();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x334a
// Size: 0x5b
function movenotificationup(iconelem) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    iconelem endon("delete_icon_elem");
    if (!istrue(iconelem.isanimating)) {
        iconelem moveovertime(0.35);
    }
    iconelem.y -= 25;
    wait 0.35;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33ad
// Size: 0x2
function setoverkillpro() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33b7
// Size: 0x2
function unsetoverkillpro() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33c1
// Size: 0x2
function setempimmune() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33cb
// Size: 0x2
function unsetempimmune() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33d5
// Size: 0x1a
function setautospot() {
    if (!isplayer(self)) {
        return;
    }
    autospotadswatcher();
    autospotdeathwatcher();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33f7
// Size: 0x26
function autospotdeathwatcher() {
    self waittill("death");
    self endon("disconnect");
    self endon("endAutoSpotAdsWatcher");
    level endon("game_ended");
    self autospotoverlayoff();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3425
// Size: 0x1b
function unsetautospot() {
    if (!isplayer(self)) {
        return;
    }
    self notify("endAutoSpotAdsWatcher");
    self autospotoverlayoff();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3448
// Size: 0x87
function autospotadswatcher() {
    self endon("death_or_disconnect");
    self endon("endAutoSpotAdsWatcher");
    level endon("game_ended");
    spotter = 0;
    for (;;) {
        waitframe();
        if (self isusingturret()) {
            self autospotoverlayoff();
            continue;
        }
        adslevel = self playerads();
        if (adslevel < 1 && spotter) {
            spotter = 0;
            self autospotoverlayoff();
        }
        if (adslevel < 1 && !spotter) {
            continue;
        }
        if (adslevel == 1 && !spotter) {
            spotter = 1;
            self autospotoverlayon();
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34d7
// Size: 0x2
function setregenfaster() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34e1
// Size: 0x2
function unsetregenfaster() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34eb
// Size: 0x31
function timeoutregenfaster() {
    self.hasregenfaster = undefined;
    perk::removeperk("specialty_regenfaster");
    self setclientdvar(@"hash_c0673d13f0144bfb", 0);
    self notify("timeOutRegenFaster");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3524
// Size: 0x10
function sethardshell() {
    self.shellshockreduction = 0.25;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x353c
// Size: 0xc
function unsethardshell() {
    self.shellshockreduction = 0;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3550
// Size: 0xa
function setsharpfocus() {
    thread monitorsharpfocus();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3562
// Size: 0x29
function monitorsharpfocus() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    self endon("stop_monitorSharpFocus");
    for (;;) {
        updatesharpfocus();
        self waittill("weapon_change");
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3593
// Size: 0x6a
function updatesharpfocus() {
    newweapon = self.currentweapon;
    scale = undefined;
    var_6651def69449c4a3 = weapon::weapongetflinchtype(newweapon);
    if (var_6651def69449c4a3 == 4) {
        scale = 1;
    } else if (var_6651def69449c4a3 == 3) {
        scale = 1;
    } else if (var_6651def69449c4a3 == 1) {
        scale = 1;
    } else {
        scale = 1;
    }
    weapons::updateviewkickscale(scale);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3605
// Size: 0x16
function unsetsharpfocus() {
    self notify("stop_monitorSharpFocus");
    weapons::updateviewkickscale(1);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3623
// Size: 0x68
function updatedefaultflinchreduction() {
    if (isagent(self)) {
        return;
    }
    scale = undefined;
    var_6651def69449c4a3 = weapon::weapongetflinchtype(self.currentweapon);
    if (var_6651def69449c4a3 == 4) {
        scale = 1;
    } else if (var_6651def69449c4a3 == 3) {
        scale = 1;
    } else if (var_6651def69449c4a3 == 1) {
        scale = 1;
    } else {
        scale = 1;
    }
    weapons::updateviewkickscale(scale);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3693
// Size: 0x169
function ammodisabling_run(victim, isThrowStar) {
    victim notify("disablingRun");
    victim endon("disablingRun");
    victim endon("disconnect");
    level endon("game_ended");
    if (!isdefined(victim.disabledspeedmod)) {
        victim.disabledspeedmod = -0.05;
        victim weapons::updatemovespeedscale();
        victim ammodisabling_impair();
    }
    if (isThrowStar) {
        timer = 0.4;
    } else {
        timer = 0.2;
    }
    if (!istrue(isThrowStar) && victim _hasperk("specialty_frangible_resist")) {
        timer *= 1 + getdvarfloat(@"hash_47984606bec7ddf7", -0.5);
    }
    currtime = gettime();
    if (!isdefined(victim.disabledshocktime) || currtime - victim.disabledshocktime > 200 || isThrowStar) {
        if (isThrowStar) {
            duration = 0.4;
        } else {
            duration = 0.2;
        }
        victim shellshock("chargemode_mp", duration);
        victim.disabledshocktime = currtime;
    }
    while (isalive(victim) && timer > 0) {
        timer -= level.framedurationseconds;
        waitframe();
    }
    victim ammodisabling_impairend();
    victim.disabledspeedmod = undefined;
    victim.disabledshocktime = undefined;
    victim weapons::updatemovespeedscale();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3804
// Size: 0x4a
function ammodisabling_impair() {
    val::set("ammoDisabling", "jog", 0);
    val::set("ammoDisabling", "sprint", 0);
    val::set("ammoDisabling", "slide", 0);
    val::set("ammoDisabling", "allow_jump", 0);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3856
// Size: 0xe
function ammodisabling_impairend() {
    val::reset_all("ammoDisabling");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x386c
// Size: 0x79
function setviewkickoverride() {
    self.overrideviewkickscale = getdvarfloat(@"hash_31381fbc6af88e90", 0.7);
    self.overrideviewkickscaledmr = getdvarfloat(@"hash_d92f9fdbd9218170", 0.7);
    self.overrideviewkickscalesniper = getdvarfloat(@"hash_7c78c2f583a1c0e", 0.7);
    self.overrideviewkickscalepistol = getdvarfloat(@"hash_904eb284a2b8107e", 0.7);
    weapons::updateviewkickscale();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38ed
// Size: 0x31
function unsetviewkickoverride() {
    self.overrideviewkickscale = undefined;
    self.overrideviewkickscaledmr = undefined;
    self.overrideviewkickscalesniper = undefined;
    self.overrideviewkickscalepistol = undefined;
    weapons::updateviewkickscale();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3926
// Size: 0x17
function setaffinityspeedboost() {
    self.weaponaffinityspeedboost = 0.08;
    weapons::updatemovespeedscale();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3945
// Size: 0x13
function unsetaffinityspeedboost() {
    self.weaponaffinityspeedboost = undefined;
    weapons::updatemovespeedscale();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3960
// Size: 0x14c
function setaffinityextralauncher() {
    self.weaponaffinityextralauncher = 1;
    primary = weapon::buildweapon(self.loadoutprimary, self.loadoutprimaryattachments, self.loadoutprimarycamo, self.loadoutprimaryreticle, self.loadoutprimaryvariantid);
    secondary = weapon::buildweapon(self.loadoutsecondary, self.loadoutsecondaryattachments, self.loadoutsecondarycamo, self.loadoutsecondaryreticle, self.loadoutsecondaryvariantid);
    if (weapon::getweapongroup(primary.basename) == "weapon_projectile") {
        self setweaponammoclip(primary, weaponclipsize(primary));
    }
    if (weapon::getweapongroup(secondary.basename) == "weapon_projectile") {
        self setweaponammoclip(secondary, weaponclipsize(secondary));
    }
    if (istrue(level.var_9e090a159cb48220)) {
        tertiary = weapon::buildweapon(self.loadoutTertiary, self.var_494870a5978b5a09, self.loadouttertiarycamo, self.loadouttertiaryreticle, self.loadouttertiaryvariantid);
        if (weapon::getweapongroup(tertiary.basename) == "weapon_projectile") {
            self setweaponammoclip(tertiary, weaponclipsize(tertiary));
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ab4
// Size: 0xc
function unsetaffinityextralauncher() {
    self.weaponaffinityextralauncher = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ac8
// Size: 0x11f
function setdoubleload() {
    self endon("death_or_disconnect");
    self endon("endDoubleLoad");
    level endon("game_ended");
    for (;;) {
        self waittill("reload");
        weapons = self getweaponslist("primary");
        foreach (weapon in weapons) {
            ammoinclip = self getweaponammoclip(weapon);
            clipsize = weaponclipsize(weapon);
            difference = clipsize - ammoinclip;
            var_70d8543518ee27d2 = self getweaponammostock(weapon);
            if (ammoinclip != clipsize && var_70d8543518ee27d2 > 0) {
                if (ammoinclip + var_70d8543518ee27d2 >= clipsize) {
                    self setweaponammoclip(weapon, clipsize);
                    self setweaponammostock(weapon, var_70d8543518ee27d2 - difference);
                    continue;
                }
                self setweaponammoclip(weapon, ammoinclip + var_70d8543518ee27d2);
                if (var_70d8543518ee27d2 - difference > 0) {
                    self setweaponammostock(weapon, var_70d8543518ee27d2 - difference);
                    continue;
                }
                self setweaponammostock(weapon, 0);
            }
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bef
// Size: 0xa
function unsetdoubleload() {
    self notify("endDoubleLoad");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c01
// Size: 0xb
function setmarksman(power) {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c3e
// Size: 0x2
function unsetmarksman() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c5b
// Size: 0xa
function setfastcrouch() {
    thread watchfastcrouch();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c6d
// Size: 0x88
function watchfastcrouch() {
    self endon("death_or_disconnect");
    self endon("fastcrouch_unset");
    while (true) {
        iscrouched = (self getstance() == "crouch" || self getstance() == "prone") && !self issprintsliding();
        if (!isdefined(self.fastcrouchspeedmod)) {
            if (iscrouched) {
                self.fastcrouchspeedmod = 0.2;
                weapons::updatemovespeedscale();
            }
        } else if (!iscrouched) {
            self.fastcrouchspeedmod = undefined;
            weapons::updatemovespeedscale();
        }
        waitframe();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cfd
// Size: 0x28
function unsetfastcrouch() {
    self notify("fastcrouch_unset");
    if (isdefined(self.fastcrouchspeedmod)) {
        self.fastcrouchspeedmod = undefined;
        weapons::updatemovespeedscale();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d2d
// Size: 0x1e
function setrshieldradar() {
    self endon("unsetRShieldRadar");
    wait 0.75;
    self makeportableradar();
    thread setrshieldradar_cleanup();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d53
// Size: 0x1d
function setrshieldradar_cleanup() {
    self endon("unsetRShieldRadar");
    self waittill("death_or_disconnect");
    if (isdefined(self)) {
        unsetrshieldradar();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d78
// Size: 0x11
function unsetrshieldradar() {
    self clearportableradar();
    self notify("unsetRShieldRadar");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d91
// Size: 0x11
function setrshieldscrambler() {
    self makescrambler();
    thread setrshieldscrambler_cleanup();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3daa
// Size: 0x1d
function setrshieldscrambler_cleanup() {
    self endon("unsetRShieldScrambler");
    self waittill("death_or_disconnect");
    if (isdefined(self)) {
        unsetrshieldscrambler();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dcf
// Size: 0x11
function unsetrshieldscrambler() {
    self clearscrambler();
    self notify("unsetRShieldScrambler");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3de8
// Size: 0x3d
function setstunresistance(power) {
    if (!isdefined(power)) {
        power = 4;
    }
    power = int(power);
    if (power == 10) {
        self.stunscalar = 0;
        return;
    }
    self.stunscalar = power / 10;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e2d
// Size: 0xd
function unsetstunresistance() {
    self.stunscalar = 1;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e42
// Size: 0x12f
function applystunresistence(attacker, victim, time) {
    if (isdefined(attacker)) {
        var_8907f741f3a7b3f7 = attacker == victim;
    } else {
        var_8907f741f3a7b3f7 = 0;
    }
    if (victim perk::_hasperk("specialty_stun_resistance") && !var_8907f741f3a7b3f7) {
        if (isdefined(victim.stunscalar) && isdefined(time)) {
            time *= victim.stunscalar;
        }
        attackerowner = utility::ter_op(isdefined(attacker.owner), attacker.owner, attacker);
        victimowner = utility::ter_op(isdefined(victim.owner), victim.owner, victim);
        if (isplayer(attackerowner) && attackerowner != victim) {
            attacker damagefeedback::updatedamagefeedback("hittacresist", undefined, undefined, undefined, 1);
        }
        if (istrue(player_utility::playersareenemies(attackerowner, victimowner))) {
            victim challenges::resistedstun(attackerowner);
            perks::activatePerk("specialty_tac_resist");
        }
    } else if (!istrue(victim val::get("stunned"))) {
        time = 0;
    }
    if (victim game_utility::ismatchstartprotected()) {
        time *= 0.1;
    }
    return time;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f7a
// Size: 0x21
function setweaponlaser() {
    if (isagent(self)) {
        return;
    }
    self endon("unsetWeaponLaser");
    wait 0.5;
    thread setweaponlaser_internal();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fa3
// Size: 0x3f
function unsetweaponlaser() {
    self notify("unsetWeaponLaser");
    if (isdefined(self.perkweaponlaseron) && self.perkweaponlaseron) {
        weapon::disableweaponlaser();
    }
    self.perkweaponlaseron = undefined;
    self.perkweaponlaseroffforswitchstart = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fea
// Size: 0x59
function setweaponlaser_waitforlaserweapon(weapon) {
    for (weapon = getweaponbasename(weapon); true; weapon = objweapon.basename) {
        if (isdefined(weapon) && (weapon == "iw6_kac_mp" || weapon == "iw6_arx160_mp")) {
            break;
        }
        objweapon = self waittill("weapon_change");
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x404b
// Size: 0xa2
function setweaponlaser_internal() {
    self endon("death_or_disconnect");
    self endon("unsetWeaponLaser");
    self.perkweaponlaseron = 0;
    weapon = self getcurrentweapon();
    while (true) {
        setweaponlaser_waitforlaserweapon(weapon);
        if (self.perkweaponlaseron == 0) {
            self.perkweaponlaseron = 1;
            weapon::enableweaponlaser();
        }
        childthread setweaponlaser_monitorads();
        childthread setweaponlaser_monitorweaponswitchstart(1);
        self.perkweaponlaseroffforswitchstart = undefined;
        self waittill("weapon_change");
        if (self.perkweaponlaseron == 1) {
            self.perkweaponlaseron = 0;
            weapon::disableweaponlaser();
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40f5
// Size: 0x2b
function setweaponlaser_monitorweaponswitchstart(offtime) {
    self endon("weapon_change");
    while (true) {
        self waittill("weapon_switch_started");
        childthread setweaponlaser_onweaponswitchstart(offtime);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4128
// Size: 0x81
function setweaponlaser_onweaponswitchstart(offtime) {
    self notify("setWeaponLaser_onWeaponSwitchStart");
    self endon("setWeaponLaser_onWeaponSwitchStart");
    if (self.perkweaponlaseron == 1) {
        self.perkweaponlaseroffforswitchstart = 1;
        self.perkweaponlaseron = 0;
        weapon::disableweaponlaser();
    }
    wait offtime;
    self.perkweaponlaseroffforswitchstart = undefined;
    if (self.perkweaponlaseron == 0 && self playerads() <= 0.6) {
        self.perkweaponlaseron = 1;
        weapon::enableweaponlaser();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41b1
// Size: 0x81
function setweaponlaser_monitorads() {
    self endon("weapon_change");
    while (true) {
        if (!isdefined(self.perkweaponlaseroffforswitchstart) || self.perkweaponlaseroffforswitchstart == 0) {
            if (self playerads() > 0.6) {
                if (self.perkweaponlaseron == 1) {
                    self.perkweaponlaseron = 0;
                    weapon::disableweaponlaser();
                }
            } else if (self.perkweaponlaseron == 0) {
                self.perkweaponlaseron = 1;
                weapon::enableweaponlaser();
            }
        }
        waitframe();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x423a
// Size: 0xe
function setsteadyaimpro() {
    self setaimspreadmovementscale(0.5);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4250
// Size: 0x16
function unsetsteadyaimpro() {
    self notify("end_SteadyAimPro");
    self setaimspreadmovementscale(1);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x426e
// Size: 0x1b
function perkusedeathtracker() {
    self endon("disconnect");
    self waittill("death");
    self._useperkenabled = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4291
// Size: 0x7c
function setendgame() {
    if (isdefined(self.endgame)) {
        return;
    }
    self.maxhealth = tweakables::gettweakablevalue("player", "maxhealth") * 4;
    self.health = self.maxhealth;
    self.endgame = 1;
    self.attackertable[0] = "";
    self visionsetnakedforplayer("end_game", 5);
    thread endgamedeath(7);
    gamelogic::sethasdonecombat(self, 1);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4315
// Size: 0x4b
function unsetendgame() {
    self notify("stopEndGame");
    self.endgame = undefined;
    player::restorebasevisionset(1);
    if (!isdefined(self.endgametimer)) {
        return;
    }
    self.endgametimer hud_util::destroyelem();
    self.endgameicon hud_util::destroyelem();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4368
// Size: 0x33
function endgamedeath(duration) {
    self endon("death_or_disconnect");
    self endon("joined_team");
    level endon("game_ended");
    self endon("stopEndGame");
    wait duration + 1;
    damage::_suicide();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43a3
// Size: 0x10
function setsaboteur() {
    self.objectivescaler = 1.2;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43bb
// Size: 0xd
function unsetsaboteur() {
    self.objectivescaler = 1;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43d0
// Size: 0xa5
function setcombatspeed() {
    self endon("death_or_disconnect");
    self endon("unsetCombatSpeed");
    self.incombatspeed = 0;
    unsetcombatspeedscalar();
    for (;;) {
        dmg, attacker = self waittill("damage");
        if (!isdefined(attacker.team)) {
            continue;
        }
        if (level.teambased && attacker.team == self.team) {
            continue;
        }
        if (self.incombatspeed) {
            continue;
        }
        setcombatspeedscalar();
        self.incombatspeed = 1;
        thread endofspeedwatcher();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x447d
// Size: 0x31
function endofspeedwatcher() {
    self notify("endOfSpeedWatcher");
    self endon("endOfSpeedWatcher");
    self endon("death_or_disconnect");
    self waittill("healed");
    unsetcombatspeedscalar();
    self.incombatspeed = 0;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44b6
// Size: 0x5d
function setcombatspeedscalar() {
    if (self.weaponspeed <= 0.8) {
        self.combatspeedscalar = 1.4;
    } else if (self.weaponspeed <= 0.9) {
        self.combatspeedscalar = 1.3;
    } else {
        self.combatspeedscalar = 1.2;
    }
    weapons::updatemovespeedscale();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x451b
// Size: 0x14
function unsetcombatspeedscalar() {
    self.combatspeedscalar = 1;
    weapons::updatemovespeedscale();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4537
// Size: 0x11
function unsetcombatspeed() {
    unsetcombatspeedscalar();
    self notify("unsetCombatSpeed");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4550
// Size: 0x2
function setblackbox() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x455a
// Size: 0x2
function unsetblackbox() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4564
// Size: 0x1a
function setsteelnerves() {
    perk::giveperk("specialty_bulletaccuracy");
    perk::giveperk("specialty_holdbreath");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4586
// Size: 0x1a
function unsetsteelnerves() {
    perk::removeperk("specialty_bulletaccuracy");
    perk::removeperk("specialty_holdbreath");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45a8
// Size: 0x33
function setdelaymine() {
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        self.var_f19a8bf0b538aaf8 = 1;
        self.var_8eaa5f2e840b1665 = 1;
        self.minedelayseconds = level.delayminetime;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45e3
// Size: 0x29
function unsetdelaymine() {
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        self.var_f19a8bf0b538aaf8 = undefined;
        self.var_8eaa5f2e840b1665 = undefined;
        self.minedelayseconds = undefined;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4614
// Size: 0x12
function setlocaljammer() {
    if (emp_debuff::is_empd()) {
        self makescrambler();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x462e
// Size: 0x9
function unsetlocaljammer() {
    self clearscrambler();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x463f
// Size: 0x9
function setthermal() {
    self thermalvisionon();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4650
// Size: 0x9
function unsetthermal() {
    self thermalvisionoff();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4661
// Size: 0xa
function setonemanarmy() {
    thread onemanarmyweaponchangetracker();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4673
// Size: 0xa
function unsetonemanarmy() {
    self notify("stop_oneManArmyTracker");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4685
// Size: 0x4c
function onemanarmyweaponchangetracker() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    self endon("stop_oneManArmyTracker");
    for (;;) {
        objweapon = self waittill("weapon_change");
        if (objweapon.basename != "onemanarmy_mp") {
            continue;
        }
        thread selectonemanarmyclass();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46d9
// Size: 0x51
function isonemanarmymenu(menu) {
    if (menu == game["menu_onemanarmy"]) {
        return true;
    }
    if (isdefined(game["menu_onemanarmy_defaults_splitscreen"]) && menu == game["menu_onemanarmy_defaults_splitscreen"]) {
        return true;
    }
    if (isdefined(game["menu_onemanarmy_custom_splitscreen"]) && menu == game["menu_onemanarmy_custom_splitscreen"]) {
        return true;
    }
    return false;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4733
// Size: 0x11d
function selectonemanarmyclass() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    val::set("one_man_army", "weapon_switch", 0);
    val::set("one_man_army", "offhand_weapons", 0);
    val::set("one_man_army", "usability", 0);
    thread closeomamenuondeath();
    menu, classname = self waittill("menuresponse");
    val::reset_all("one_man_army");
    if (classname == "back" || !isonemanarmymenu(menu) || utility::isusingremote()) {
        currentweapon = self getcurrentweapon();
        if (currentweapon.basename == "onemanarmy_mp") {
            val::set("one_man_army", "weapon_switch", 0);
            val::set("one_man_army", "offhand_weapons", 0);
            val::set("one_man_army", "usability", 0);
            inventory_utility::_switchtoweapon(inventory::getlastweapon());
            self waittill("weapon_change");
            val::reset_all("one_man_army");
        }
        return;
    }
    thread giveonemanarmyclass(classname);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4858
// Size: 0x2b
function closeomamenuondeath() {
    self endon("menuresponse");
    self endon("disconnect");
    level endon("game_ended");
    self waittill("death");
    val::reset_all("one_man_army");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x488b
// Size: 0x104
function giveonemanarmyclass(classname) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (perk::_hasperk("specialty_omaquickchange")) {
        changeduration = 3;
        player_utility::playplayerandnpcsounds(self, "foly_onemanarmy_bag3_plr", "foly_onemanarmy_bag3_npc");
    } else {
        changeduration = 6;
        player_utility::playplayerandnpcsounds(self, "foly_onemanarmy_bag6_plr", "foly_onemanarmy_bag6_npc");
    }
    thread omausebar(changeduration);
    val::set("one_man_army", "weapon_switch", 0);
    val::set("one_man_army", "offhand_weapons", 0);
    val::set("one_man_army", "usability", 0);
    wait changeduration;
    val::reset_all("one_man_army");
    class::giveloadout(self.pers["team"], classname);
    if (isdefined(self.carryflag)) {
        self attach(self.carryflag, "J_spine4", 1);
    }
    self notify("changed_kit");
    level notify("changed_kit");
    rank::tryresetrankxp();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4997
// Size: 0x98
function omausebar(duration) {
    self endon("disconnect");
    usebar = hud_util::createprimaryprogressbar();
    var_721e3650de671da6 = hud_util::createprimaryprogressbartext();
    var_721e3650de671da6 settext(%MPUI_CHANGING_KIT);
    usebar hud_util::updatebar(0, 1 / duration);
    for (waitedtime = 0; waitedtime < duration && isalive(self) && !level.gameended; waitedtime += 0.05) {
        wait 0.05;
    }
    usebar hud_util::destroyelem();
    var_721e3650de671da6 hud_util::destroyelem();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a37
// Size: 0x36
function setafterburner() {
    self energy_setrestorerate(0, utility::ter_op(game_utility::isanymlgmatch(), 600, 1000));
    self energy_setresttimems(0, utility::ter_op(game_utility::isanymlgmatch(), 750, 750));
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a75
// Size: 0x18
function unsetafterburner() {
    self energy_setrestorerate(0, 400);
    self energy_setresttimems(0, 900);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a95
// Size: 0x2
function setfreefall() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a9f
// Size: 0x2
function unsetfreefall() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4aa9
// Size: 0x13
function settacticalinsertion() {
    equipment::giveequipment("equip_tac_insert", "secondary");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ac4
// Size: 0x2
function unsettacticalinsertion() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ace
// Size: 0x7d
function setpainted(attacker) {
    if (isplayer(self)) {
        outlinetime = 0.5;
        if (!perk::_hasperk("specialty_engineer") && !perk::_hasperk("specialty_noscopeoutline")) {
            self.painted = 1;
            id = outline::outlineenableforplayer(self, attacker, "outline_nodepth_orange", "perk");
            thread watchpainted(id, outlinetime);
            thread watchpaintedagain(id);
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b53
// Size: 0x58
function watchpainted(id, timeout) {
    self notify("painted_again");
    self endon("painted_again");
    self endon("disconnect");
    level endon("game_ended");
    utility::waittill_any_timeout_1(timeout, "death");
    self.painted = 0;
    outline::outlinedisable(id, self);
    self notify("painted_end");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bb3
// Size: 0x33
function watchpaintedagain(id) {
    self endon("disconnect");
    level endon("game_ended");
    utility::waittill_any_2("painted_again", "painted_end");
    outline::outlinedisable(id, self);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4bee
// Size: 0x19
function ispainted() {
    return isdefined(self.painted) && self.painted;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c10
// Size: 0x2
function setassists() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c1a
// Size: 0x2
function unsetassists() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c24
// Size: 0x3c
function setrefillgrenades() {
    if (isdefined(self.primarygrenade)) {
        self givemaxammo(self.primarygrenade);
    }
    if (isdefined(self.secondarygrenade)) {
        self givemaxammo(self.secondarygrenade);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c68
// Size: 0x2
function unsetrefillgrenades() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c72
// Size: 0x3c
function setrefillammo() {
    if (isdefined(self.primaryweapon)) {
        self givemaxammo(self.primaryweapon);
    }
    if (isdefined(self.secondaryweapon)) {
        self givemaxammo(self.secondaryweapon);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cb6
// Size: 0x2
function unsetrefillammo() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cc0
// Size: 0x2
function setcomexp() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cca
// Size: 0x2
function unsetcomexp() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cd4
// Size: 0xa
function settagger() {
    thread settaggerinternal();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ce6
// Size: 0x105
function settaggerinternal() {
    self endon("death_or_disconnect");
    self endon("unsetTagger");
    level endon("game_ended");
    while (true) {
        self waittill("eyesOn");
        var_804646ef19a59c8c = self getplayerssightingme();
        foreach (otherplayer in var_804646ef19a59c8c) {
            if (level.teambased && otherplayer.team == self.team) {
                continue;
            }
            if (isalive(otherplayer) && otherplayer.sessionstate == "playing") {
                if (!isdefined(otherplayer.perkoutlined)) {
                    otherplayer.perkoutlined = 0;
                }
                if (!otherplayer.perkoutlined) {
                    otherplayer.perkoutlined = 1;
                }
                otherplayer thread outlinewatcher(self);
            }
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4df3
// Size: 0xae
function outlinewatcher(victim) {
    self endon("death_or_disconnect");
    self endon("eyesOff");
    level endon("game_ended");
    for (;;) {
        notwatching = 1;
        var_804646ef19a59c8c = victim getplayerssightingme();
        foreach (otherplayer in var_804646ef19a59c8c) {
            if (otherplayer == self) {
                notwatching = 0;
                break;
            }
        }
        if (notwatching) {
            self.perkoutlined = 0;
            self notify("eyesOff");
        }
        wait 0.5;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ea9
// Size: 0xa
function unsettagger() {
    self notify("unsetTagger");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ebb
// Size: 0xa
function setpitcher() {
    thread setpitcherinternal();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ecd
// Size: 0x8d
function setpitcherinternal() {
    self endon("death_or_disconnect");
    self endon("unsetPitcher");
    level endon("game_ended");
    for (;;) {
        self setgrenadethrowscale(1.25);
        objweapon = self waittill("grenade_pullback");
        grenadename = objweapon.basename;
        if (grenadename == "airdrop_marker_mp" || grenadename == "deployable_vest_marker_mp" || grenadename == "deployable_weapon_crate_marker_mp") {
            self setgrenadethrowscale(1);
        }
        grenade, objweapon = self waittill("grenade_fire");
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f62
// Size: 0x1c
function unsetpitcher() {
    self setgrenadecookscale(1);
    self setgrenadethrowscale(1);
    self notify("unsetPitcher");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f86
// Size: 0x2
function setboom() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f90
// Size: 0x50
function setboominternal(attacker) {
    self endon("death_or_disconnect");
    self endon("unsetBoom");
    level endon("game_ended");
    attacker endon("death_or_disconnect");
    waitframe();
    triggerportableradarping(self.origin, attacker, 800, 1500);
    attacker boomtrackplayers(self.origin, self);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fe8
// Size: 0x9a
function boomtrackplayers(targetpos, victim) {
    boomplayers = utility::playersinsphere(targetpos, 700);
    foreach (player in boomplayers) {
        if (victim == player) {
            continue;
        }
        if (player_utility::isenemy(player) && isalive(player) && !player perk::_hasperk("specialty_gpsjammer")) {
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x508a
// Size: 0x79
function boomtrackplayerdeath(attacker, id) {
    self endon("disconnect");
    attacker endon("removearchetype");
    msg = utility::waittill_any_timeout_1(2 + 5, "death");
    if (msg == "timeout" && isdefined(self.markedbyboomperk[id])) {
        self.markedbyboomperk[id] = undefined;
        return;
    }
    self waittill("spawned_player");
    self.markedbyboomperk = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x510b
// Size: 0xa
function unsetboom() {
    self notify("unsetBoom");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x511d
// Size: 0xcf
function customjuiced(waittime) {
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    self endon("unset_custom_juiced");
    level endon("game_ended");
    self.isjuiced = 1;
    self.movespeedscaler = 1.1;
    weapons::updatemovespeedscale();
    perk::giveperk("specialty_fastreload");
    perk::giveperk("specialty_quickdraw");
    perk::giveperk("specialty_stalker");
    perk::giveperk("specialty_fastoffhand");
    perk::giveperk("specialty_fastsprintrecovery");
    perk::giveperk("specialty_quickswap");
    thread unsetcustomjuicedondeath();
    thread unsetcustomjuicedonride();
    thread unsetcustomjuicedonmatchend();
    endtime = waittime * 1000 + gettime();
    if (isai(self)) {
    }
    wait waittime;
    unsetcustomjuiced();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51f4
// Size: 0xb5
function unsetcustomjuiced(death) {
    if (!isdefined(death)) {
        self.movespeedscaler = 1;
        if (perk::_hasperk("specialty_lightweight")) {
            self.movespeedscaler = perk::lightweightscalar();
        }
        assert(isdefined(self.movespeedscaler));
        weapons::updatemovespeedscale();
    }
    perk::removeperk("specialty_fastreload");
    perk::removeperk("specialty_quickdraw");
    perk::removeperk("specialty_stalker");
    perk::removeperk("specialty_fastoffhand");
    perk::removeperk("specialty_fastsprintrecovery");
    perk::removeperk("specialty_quickswap");
    self.isjuiced = undefined;
    if (isai(self)) {
    }
    self notify("unset_custom_juiced");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52b1
// Size: 0x2d
function unsetcustomjuicedonride() {
    self endon("disconnect");
    self endon("unset_custom_juiced");
    while (true) {
        waitframe();
        if (utility::isusingremote()) {
            thread unsetcustomjuiced();
            break;
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52e6
// Size: 0x2b
function unsetcustomjuicedondeath() {
    self endon("disconnect");
    self endon("unset_custom_juiced");
    utility::waittill_any_2("death", "faux_spawn");
    thread unsetcustomjuiced(1);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5319
// Size: 0x2a
function unsetcustomjuicedonmatchend() {
    self endon("disconnect");
    self endon("unset_custom_juiced");
    level utility::waittill_any_2("round_end_finished", "game_ended");
    thread unsetcustomjuiced();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x534b
// Size: 0x2
function settriggerhappy() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5355
// Size: 0xcf
function settriggerhappyinternal() {
    self endon("death_or_disconnect");
    self endon("unsetTriggerHappy");
    level endon("game_ended");
    objweapon = self.lastdroppableweaponobj;
    var_4fe33ef2e789f809 = self getweaponammostock(objweapon);
    var_b94f757213c141bf = self getweaponammoclip(objweapon);
    self givestartammo(objweapon);
    var_f34e7874e06f27ef = self getweaponammoclip(objweapon);
    clipdifference = var_f34e7874e06f27ef - var_b94f757213c141bf;
    var_91aaeeca66e5f1dc = var_4fe33ef2e789f809 - clipdifference;
    if (clipdifference > var_4fe33ef2e789f809) {
        self setweaponammoclip(objweapon, var_b94f757213c141bf + var_4fe33ef2e789f809);
        var_91aaeeca66e5f1dc = 0;
    }
    self setweaponammostock(objweapon, var_91aaeeca66e5f1dc);
    self playlocalsound("ammo_crate_use");
    self setclientomnvar("ui_trigger_happy", 1);
    wait 0.2;
    self setclientomnvar("ui_trigger_happy", 0);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x542c
// Size: 0x17
function unsettriggerhappy() {
    self setclientomnvar("ui_trigger_happy", 0);
    self notify("unsetTriggerHappy");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x544b
// Size: 0x2
function setincog() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5455
// Size: 0x2
function unsetincog() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x545f
// Size: 0x2
function setblindeye() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5469
// Size: 0x2
function unsetblindeye() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5473
// Size: 0x2
function setquickswap() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x547d
// Size: 0x2
function unsetquickswap() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5487
// Size: 0x98
function setextraammo() {
    self endon("death_or_disconnect");
    self endon("unset_extraammo");
    level endon("game_ended");
    if (self.gettingloadout) {
        self waittill("giveLoadout");
    }
    playerprimaries = weapon::getvalidextraammoweapons();
    foreach (primary in playerprimaries) {
        if (isdefined(primary) && !isnullweapon(primary)) {
            self givemaxammo(primary);
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5527
// Size: 0xa
function unsetextraammo() {
    self notify("unset_extraammo");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5539
// Size: 0xbf
function setextradeadly() {
    self endon("death_or_disconnect");
    self endon("unset_extradeadly");
    level endon("game_ended");
    giveammo = 1;
    if (self.gettingloadout) {
        self waittill("giveLoadout");
    } else {
        giveammo = istrue(level.var_eeccf9e10242815);
    }
    ref = equipment::getcurrentequipment("primary");
    if (_hasperk("specialty_ninja_vest")) {
        if (issubstr(ref, "throwing_knife") || issubstr(ref, "shuriken") || issubstr(ref, "throwstar")) {
            equipment::incrementequipmentammo(ref);
        }
        return;
    }
    if (isdefined(ref) && ref != "none" && giveammo) {
        equipment::incrementequipmentammo(ref);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5600
// Size: 0xa
function unsetextradeadly() {
    self notify("unset_extradeadly");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5612
// Size: 0x2
function setbattleslide() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x561c
// Size: 0x2
function unsetbattleslide() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5626
// Size: 0x2
function setoverkill() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5630
// Size: 0x2
function unsetoverkill() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x563a
// Size: 0x2
function setactivereload() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5644
// Size: 0x2
function unsetactivereload() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x564e
// Size: 0x2c
function setlifepack() {
    if (!isdefined(level._effect["life_pack_pickup"])) {
        level._effect["life_pack_pickup"] = undefined;
    }
    thread watchlifepackkills();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5682
// Size: 0x199
function watchlifepackkills() {
    self endon("death_or_disconnect");
    self notify("unset_lifepack");
    self endon("unset_lifepack");
    while (true) {
        victim, weapon, meansofdeath = self waittill("got_a_kill");
        spawnloc = self.origin;
        triggerradius = 20;
        triggerheight = 20;
        lifepack = spawn("script_model", self.origin + (0, 0, 10));
        lifepack setmodel("weapon_life_pack");
        lifepack.owner = self;
        lifepack.team = self.team;
        lifepack hidefromplayer(self);
        var_4529d94a150d03f6 = spawn("trigger_radius", self.origin, 0, triggerradius, triggerheight);
        var_4529d94a150d03f6 thread watchlifepackuse(lifepack);
        var_4529d94a150d03f6 thread watchlifepackdeath(lifepack);
        lifepack thread hoverlifepack();
        lifepack rotateyaw(1000, 30, 0.2, 0.2);
        lifepack thread watchlifepacklifetime(10, var_4529d94a150d03f6);
        lifepack thread watchlifepackowner();
        foreach (player in level.players) {
            lifepack setlifepackvisualforplayer(player);
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5823
// Size: 0x87
function activatelifepackboost(owner, duration, disableondeath) {
    self.lifeboostactive = 1;
    if (isdefined(duration) && duration > 0) {
        thread watchlifepackboostlifetime(duration);
    }
    if (isdefined(disableondeath) && disableondeath) {
        thread watchlifepackuserdeath();
    }
    perk::giveperk("specialty_regenfaster");
    self setclientomnvar("ui_life_link", 1);
    self notify("enabled_life_pack_boost");
    self.lifepackowner = owner;
    gamescore::trackbuffassist(owner, self, "medic_lifepack");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58b2
// Size: 0x28
function watchlifepackboostlifetime(duration) {
    self endon("death_or_disconnect");
    wait duration;
    if (isdefined(self.lifeboostactive)) {
        disablelifepackboost();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58e2
// Size: 0x60
function disablelifepackboost() {
    if (isdefined(self) && isdefined(self.lifeboostactive)) {
        self.lifeboostactive = undefined;
        self setclientomnvar("ui_life_link", 0);
        self notify("disabled_life_pack_boost");
        perk::removeperk("specialty_regenfaster");
        gamescore::untrackbuffassist(self.lifepackowner, self, "medic_lifepack");
        self.lifepackowner = undefined;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x594a
// Size: 0x63
function setlifepackvisualforplayer(player) {
    if (level.teambased && player.team == self.team && player != self.owner) {
        setlifepackoutlinestate(player);
        self showtoplayer(player);
        thread watchlifepackoutlinestate(player);
        return;
    }
    self hidefromplayer(player);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59b5
// Size: 0x150
function setlifepackoutlinestate(player) {
    if (isdefined(player.lifeboostactive)) {
        if (isdefined(player.lifepackoutlines) && player.lifepackoutlines.size > 0) {
            foreach (outline in player.lifepackoutlines) {
                if (self == outline.pack) {
                    outline::outlinedisable(outline.id, outline.pack);
                    player.lifepackoutlines = utility::array_remove(player.lifepackoutlines, outline);
                    outline = undefined;
                }
            }
        }
        return;
    }
    if (!isdefined(player.lifepackoutlines)) {
        player.lifepackoutlines = [];
    }
    var_fe215d90a7b55680 = spawnstruct();
    var_fe215d90a7b55680.id = outline::outlineenableforplayer(self, player, "outline_depth_cyan", "equipment");
    var_fe215d90a7b55680.pack = self;
    player.lifepackoutlines = utility::array_add_safe(player.lifepackoutlines, var_fe215d90a7b55680);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b0d
// Size: 0x34
function watchlifepackoutlinestate(player) {
    self endon("death");
    while (true) {
        player utility::waittill_any_2("enabled_life_pack_boost", "disabled_life_pack_boost");
        setlifepackoutlinestate(player);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b49
// Size: 0x68
function hoverlifepack() {
    self endon("death");
    self endon("phase_resource_pickup");
    originalposition = self.origin;
    while (true) {
        self moveto(originalposition + (0, 0, 15), 1, 0.2, 0.2);
        wait 1;
        self moveto(originalposition, 1, 0.2, 0.2);
        wait 1;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bb9
// Size: 0x14d
function watchlifepackuse(lifepack) {
    self endon("death");
    while (true) {
        player = self waittill("trigger");
        if (!isplayer(player)) {
            continue;
        }
        if (player.team != lifepack.team) {
            continue;
        }
        if (isdefined(player.lifeboostactive)) {
            continue;
        }
        if (player == lifepack.owner) {
            continue;
        }
        player activatelifepackboost(lifepack.owner, 5, 1);
        player playlocalsound("scavenger_pack_pickup");
        pickupfxent = spawnfx(utility::getfx("life_pack_pickup"), self.origin);
        triggerfx(pickupfxent);
        pickupfxent thread script::delayentdelete(2);
        foreach (otherplayer in level.players) {
            if (otherplayer.team == player.team) {
                continue;
            }
            pickupfxent hidefromplayer(otherplayer);
        }
        lifepack delete();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d0e
// Size: 0x26
function watchlifepackdeath(lifepack) {
    self endon("death");
    lifepack waittill("death");
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d3c
// Size: 0x2a
function watchlifepacklifetime(lifetime, var_4529d94a150d03f6) {
    self endon("death");
    wait lifetime;
    var_4529d94a150d03f6 delete();
    self delete();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d6e
// Size: 0x25
function watchlifepackowner() {
    self endon("death");
    self.owner waittill("disconnect");
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d9b
// Size: 0x18
function watchlifepackuserdeath() {
    self endon("disconnect");
    self waittill("death");
    disablelifepackboost();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5dbb
// Size: 0x11
function unsetlifepack() {
    disablelifepackboost();
    self notify("unset_lifepack");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5dd4
// Size: 0x4b
function settoughenup() {
    if (!isdefined(level._effect["toughen_up_screen"])) {
        level._effect["toughen_up_screen"] = loadfx("vfx/iw7/_requests/mp/vfx_toughen_up_scrn");
    }
    /#
        setdvarifuninitialized(@"hash_ca00b7e167d0d57", 1);
    #/
    thread watchtoughenup();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e27
// Size: 0x2a4
function watchtoughenup() {
    self endon("death_or_disconnect");
    self endon("unsetToughenUp");
    level endon("game_ended");
    shieldnumber = 0;
    var_ff2e69feff3a395b = 15;
    var_6a48c4a0c488c4c3 = 7.5;
    var_74874432bf895240 = 4;
    effectlifetime = 5;
    effecttype = 2;
    var_d601ff4572d88d47 = [];
    var_d601ff4572d88d47 = utility::array_add_safe(var_d601ff4572d88d47, (35, 0, 10));
    var_d601ff4572d88d47 = utility::array_add_safe(var_d601ff4572d88d47, (0, 35, 10));
    var_d601ff4572d88d47 = utility::array_add_safe(var_d601ff4572d88d47, (-35, 0, 10));
    var_d601ff4572d88d47 = utility::array_add_safe(var_d601ff4572d88d47, (0, -35, 10));
    self waittill("spawned_player");
    while (true) {
        victim, weapon, meansofdeath = self waittill("got_a_kill");
        if (!isdefined(self.toughenedup)) {
            self.toughenedup = 1;
            screenfx = spawnfxforclient(utility::getfx("toughen_up_screen"), self geteye(), self);
            triggerfx(screenfx);
            thread attachtoughenuparmor("j_forehead", level.bulletstormshield["section"].friendlymodel);
            thread attachtoughenuparmor("tag_reflector_arm_le", level.bulletstormshield["section"].friendlymodel);
            thread attachtoughenuparmor("tag_reflector_arm_ri", level.bulletstormshield["section"].friendlymodel);
            thread attachtoughenuparmor("j_spineupper", level.bulletstormshield["section"].friendlymodel);
            thread attachtoughenuparmor("tag_shield_back", level.bulletstormshield["section"].friendlymodel);
            thread attachtoughenuparmor("j_hip_le", level.bulletstormshield["section"].friendlymodel);
            thread attachtoughenuparmor("j_hip_ri", level.bulletstormshield["section"].friendlymodel);
            if (effecttype == 1) {
                damage::sethealthshield(var_ff2e69feff3a395b);
                thread watchtoughenuplifetime(effectlifetime);
            } else {
                lightarmor::setlightarmorvalue(self, 100);
                thread watchtoughenuplightarmorend();
            }
            screenfx thread watchtoughenupplayerend(self);
            continue;
        }
        if (effecttype == 1) {
            self notify("toughen_up_reset");
            thread watchtoughenuplifetime(effectlifetime);
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60d3
// Size: 0xd4
function attachtoughenuparmor(tag, model, originoverride, angleoverride, teamversion) {
    shieldorigin = self gettagorigin(tag);
    shieldmodel = spawn("script_model", shieldorigin);
    shieldmodel setmodel(model);
    originoffset = (0, 0, 0);
    anglesoffset = (0, 0, 0);
    if (isdefined(originoverride)) {
        originoffset = originoverride;
    }
    if (isdefined(angleoverride)) {
        anglesoffset = angleoverride;
    }
    shieldmodel.angles = self.angles;
    shieldmodel linkto(self, tag, originoffset, anglesoffset);
    shieldmodel thread watchtoughenupplayerend(self);
    shieldmodel thread watchtoughenupgameend();
    return shieldmodel;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x61b0
// Size: 0x108
function settoughenupmodel(var_28476f7cd7b8999, shieldoffset, shieldnumber, teamversion) {
    shieldmodel = spawn("script_model", self.origin + (0, 0, 50));
    shieldmodel.team = self.owner.team;
    if (teamversion == "friendly") {
        shieldmodel setmodel(level.bulletstormshield["section"].friendlymodel);
    } else {
        shieldmodel setmodel(level.bulletstormshield["section"].enemymodel);
    }
    shieldmodel linkto(self, "tag_origin", shieldoffset, (0, 90 * (shieldnumber + 1), 0));
    shieldmodel hide();
    shieldmodel thread watchtoughenupplayerend(self.owner);
    shieldmodel thread watchtoughenupgameend();
    shieldmodel thread settoughenupvisiblestate(teamversion, self.owner);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62c0
// Size: 0x11
function watchtoughenuplightarmorend() {
    self endon("disconnect");
    self waittill("remove_light_armor");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62d9
// Size: 0x4e
function watchtoughenupplayerend(owner) {
    self endon("death");
    owner utility::waittill_any_2("death_or_disconnect", "toughen_up_end");
    owner.toughenedup = undefined;
    if (owner lightarmor::haslightarmor(owner)) {
        owner unsetlightarmor();
    }
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x632f
// Size: 0x1d
function watchtoughenupgameend() {
    self endon("death");
    level waittill("game_ended");
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6354
// Size: 0x33
function watchtoughenuplifetime(lifetime) {
    self endon("death");
    self endon("toughen_up_reset");
    while (lifetime > 0) {
        lifetime -= 1;
        wait 1;
    }
    self notify("toughen_up_end");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x638f
// Size: 0x8e
function settoughenupvisiblestate(teamversion, owner) {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (player == owner) {
            continue;
        }
        if (canshowtoughenupshield(player, teamversion)) {
            self showtoplayer(player);
        }
        thread watchtoughenupplayerbegin(player, teamversion);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6425
// Size: 0x53
function watchtoughenupplayerbegin(player, teamversion) {
    player endon("disconnect");
    level endon("game_ended");
    self endon("death");
    while (true) {
        player waittill("spawned_player");
        self hidefromplayer(player);
        if (canshowtoughenupshield(player, teamversion)) {
            self showtoplayer(player);
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6480
// Size: 0x6b
function canshowtoughenupshield(player, teamversion) {
    var_b10a7206cd00b51 = 0;
    if (teamversion == "friendly" && player.team == self.team || teamversion == "enemy" && player.team != self.team) {
        var_b10a7206cd00b51 = 1;
    }
    return var_b10a7206cd00b51;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64f4
// Size: 0x18
function unsettoughenup() {
    damage::clearhealthshield();
    unsetlightarmor();
    self notify("unsetToughenUp");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6514
// Size: 0xa
function setscoutping() {
    thread updatescoutping();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6526
// Size: 0xb1
function updatescoutping() {
    self endon("death_or_disconnect");
    self endon("unsetScoutPing");
    baseradius = 50;
    var_b45893c03493d1f5 = 1200;
    while (true) {
        pingradius = baseradius;
        var_ff9d6502d5d4dc7a = var_b45893c03493d1f5;
        if (isdefined(self.scoutpingradius)) {
            pingradius = self.scoutpingradius;
        }
        if (isdefined(self.scoutsweeptime)) {
            var_ff9d6502d5d4dc7a = self.scoutsweeptime;
        }
        pingradius = int(pingradius);
        var_ff9d6502d5d4dc7a = int(var_ff9d6502d5d4dc7a);
        if (pingradius != baseradius) {
            triggerportableradarpingteam(self.origin, self.team, pingradius, var_ff9d6502d5d4dc7a);
        }
        wait var_b45893c03493d1f5 / 1200;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x65df
// Size: 0x12f
function updatescoutpingvalues(momentumstage) {
    modvalue = 0;
    pingradius = 150;
    sweeptime = 3000;
    if (isdefined(self.scoutpingmod)) {
        modvalue = self.scoutpingmod;
    }
    if (isdefined(self.scoutpingpreviousstage)) {
        if (momentumstage > self.scoutpingpreviousstage) {
            change = momentumstage - self.scoutpingpreviousstage;
            modvalue += change / 10;
        } else if (momentumstage < self.scoutpingpreviousstage) {
            change = self.scoutpingpreviousstage - momentumstage;
            modvalue -= change / 10;
        }
    }
    if (isdefined(self.scoutpingmod)) {
        if (modvalue > self.scoutpingmod || modvalue < self.scoutpingmod) {
            pingradius += pingradius * modvalue * 1.5;
            sweeptime -= sweeptime * modvalue / 1.5;
            self.scoutpingradius = pingradius;
            self.scoutsweeptime = sweeptime;
        }
    }
    if (momentumstage == 0) {
        self.scoutpingradius = undefined;
        self.scoutsweeptime = undefined;
    }
    self.scoutpingmod = modvalue;
    self.scoutpingpreviousstage = momentumstage;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6716
// Size: 0x32
function unsetscoutping() {
    self.scoutpingradius = undefined;
    self.scoutsweeptime = undefined;
    self.scoutpingmod = undefined;
    self.scoutpingpreviousstage = undefined;
    self notify("unsetScoutPing");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6750
// Size: 0x12
function setphasespeed() {
    thread watchphasespeedshift();
    thread watchphasespeedendshift();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x676a
// Size: 0x2e
function watchphasespeedshift() {
    self endon("death_or_disconnect");
    while (true) {
        self waittill("phase_shift_start");
        self.phasespeedmod = 0.2;
        weapons::updatemovespeedscale();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67a0
// Size: 0x2a
function watchphasespeedendshift() {
    self endon("death_or_disconnect");
    while (true) {
        self waittill("phase_shift_completed");
        self.phasespeedmod = undefined;
        weapons::updatemovespeedscale();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67d2
// Size: 0xc
function unsetphasespeed() {
    self.phasespeedmod = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67e6
// Size: 0xb
function setdodge() {
    self allowdodge(1);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67f9
// Size: 0xa
function unsetdodge() {
    self allowdodge(0);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x680b
// Size: 0x18
function setextradodge() {
    self energy_setmax(1, 100);
    self energy_setenergy(1, 100);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x682b
// Size: 0x18
function unsetextradodge() {
    self energy_setmax(1, 50);
    self energy_setenergy(1, 50);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x684b
// Size: 0x15f
function sixthsense_shouldwarnaboutotherplayer(otherplayer) {
    if (!perk::_hasperk("specialty_sixth_sense")) {
        return false;
    }
    if (!player_utility::_isalive()) {
        return false;
    }
    if (!isdefined(otherplayer)) {
        return false;
    }
    if (!otherplayer player_utility::_isalive()) {
        return false;
    }
    if (otherplayer.team == self.team) {
        return false;
    }
    if (distancesquared(otherplayer.origin, self.origin) > 16000000) {
        return false;
    }
    if (otherplayer perk::_hasperk("specialty_sixth_sense_immune")) {
        return false;
    }
    vehicle = otherplayer player_utility::getvehicle();
    if (isdefined(vehicle) && isdefined(vehicle.vehiclename)) {
        isdriver = vehicle_occupancy::vehicle_occupancy_occupantisvehicledriver(otherplayer);
        if (isdriver) {
            if (vehicle.vehiclename != "light_tank" && vehicle.vehiclename != "apc_russian") {
                return false;
            }
        } else if (vehicle.vehiclename == "apc_russian") {
            return false;
        }
    }
    if (otherplayer utility::isusingremote()) {
        remotename = otherplayer player::getremotename();
        if (remotename == "gunship" || remotename == "radar_drone_recon" || remotename == "chopper_gunner" || remotename == "cruise_predator" || remotename == "assault_drone") {
            return false;
        }
    }
    return true;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69b3
// Size: 0xb1
function sixthsense_inotherplayertargetcone(otherplayer, playerpos, otherplayerpos, var_ed6e173aa5e562a5) {
    fromotherplayer = playerpos - otherplayerpos;
    dot = vectordot(fromotherplayer, var_ed6e173aa5e562a5);
    if (dot <= 0) {
        return false;
    }
    var_33e2af87c7b68ce8 = length(fromotherplayer);
    var_a4b3b596dcf9790c = 12;
    var_a4b3b596dcf9790c += -0.15 * sqrt(var_33e2af87c7b68ce8);
    var_b6b1cd24e33b485f = math::degrees_to_radians(var_a4b3b596dcf9790c);
    var_29f5e95c42138166 = 1 - 0.5 * var_b6b1cd24e33b485f * var_b6b1cd24e33b485f;
    if (dot < var_29f5e95c42138166 * var_33e2af87c7b68ce8) {
        return false;
    }
    return true;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a6d
// Size: 0x4e
function sixthsense_playerseesotherplayer(playeraim, playerpos, otherplayerpos) {
    tootherplayer = otherplayerpos - playerpos;
    dot = vectordot(playeraim, vectornormalize(tootherplayer));
    if (dot < 0.382683) {
        return true;
    }
    return false;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ac4
// Size: 0x523
function sixthsense_think_internal() {
    tracecontents = trace::create_default_contents(1);
    sixthsensedebug = 0;
    /#
        sixthsensedebug = getdvarint(@"hash_3a87475a75de0350") == 1;
    #/
    var_139c4666448ffeac = getdvarint(@"hash_423b0fbeb5f130c5") == 1;
    process = 0;
    tootherplayer = undefined;
    var_746071ab06f38fd = undefined;
    time = getsystemtimeinmicroseconds();
    foreach (num, player in level.sixth_sense_players) {
        if (!isdefined(player)) {
            level.sixth_sense_players[num] = undefined;
            break;
        }
        sightmask = 0;
        if (var_139c4666448ffeac && !isbot(player)) {
            if (!player perk::_hasperk("specialty_sixth_sense")) {
                continue;
            }
            if (!player player_utility::_isalive()) {
                continue;
            }
            var_24f9b94a171cca52 = player player::getstancecenter();
            var_cbff770c2e560a93 = player getplayerssightingme();
            foreach (otherplayer in var_cbff770c2e560a93) {
                if (process >= 25) {
                    process = 0;
                    waitframe();
                }
                if (!isdefined(player)) {
                    level.sixth_sense_players[num] = undefined;
                    break;
                }
                if (!player sixthsense_shouldwarnaboutotherplayer(otherplayer)) {
                    continue;
                }
                process++;
                otherplayerpos = otherplayer getvieworigin();
                var_ed6e173aa5e562a5 = anglestoforward(otherplayer getplayerangles());
                if (!player sixthsense_inotherplayertargetcone(otherplayer, var_24f9b94a171cca52, otherplayerpos, var_ed6e173aa5e562a5)) {
                    continue;
                }
                sightmask |= player getsixthsensedirection(otherplayer);
            }
        } else {
            var_24f9b94a171cca52 = player gettagorigin("j_spinelower");
            var_64a457a19d7daa44 = player geteye();
            playeraim = anglestoforward(player getplayerangles());
            foreach (otherplayer in level.players) {
                if (process >= 25) {
                    process = 0;
                    waitframe();
                }
                if (!isdefined(player)) {
                    level.sixth_sense_players[num] = undefined;
                    break;
                }
                if (!player sixthsense_shouldwarnaboutotherplayer(otherplayer)) {
                    continue;
                }
                process++;
                otherplayerpos = otherplayer getvieworigin();
                var_ed6e173aa5e562a5 = anglestoforward(otherplayer getplayerangles());
                if (!player sixthsense_inotherplayertargetcone(otherplayer, var_24f9b94a171cca52, otherplayerpos, var_ed6e173aa5e562a5)) {
                    continue;
                }
                if (sixthsense_playerseesotherplayer(playeraim, var_24f9b94a171cca52, otherplayerpos)) {
                    process += 2;
                    ignoreents = [player];
                    vehicle = otherplayer player_utility::getvehicle();
                    if (isdefined(vehicle)) {
                        outlineents = getchildoutlineents(vehicle);
                        foreach (ent in outlineents) {
                            ignoreents[ignoreents.size] = ent;
                        }
                    }
                    turret = otherplayer.currentturret;
                    if (isdefined(turret)) {
                        ignoreents[ignoreents.size] = turret;
                    }
                    if (trace::ray_trace_detail_passed(otherplayerpos, var_64a457a19d7daa44, ignoreents, tracecontents)) {
                        /#
                            if (sixthsensedebug) {
                                thread utility::draw_line_for_time(otherplayerpos, var_64a457a19d7daa44, 0, 0, 1, 0.2);
                            }
                        #/
                        sightmask = 255;
                        break;
                    }
                }
                /#
                    if (sixthsensedebug) {
                        thread utility::draw_line_for_time(otherplayerpos, var_64a457a19d7daa44, 1, 0, 0, 0.2);
                    }
                #/
            }
        }
        player updatesixthsensevfx(sightmask);
        if (sightmask != 0) {
            baseevent = "highalert_spotted";
            if (sightmask == 4 || sightmask == 128 || sightmask == 32) {
                baseevent += "_left";
            } else if (sightmask == 1 || sightmask == 64 || sightmask == 8) {
                baseevent += "_right";
            }
            namespace_27c74152ccb91331::function_55b08d6d71b41402(player, baseevent);
            if (getdvarint(@"hash_9d4361be8e1b02ee", 1)) {
                if ((!isdefined(player.var_57efb5bf50dc35ea) || gettime() > player.var_57efb5bf50dc35ea) && scripts\cp_mp\execution::function_700277400dcb7857(player.executionref)) {
                    player.var_57efb5bf50dc35ea = gettime() + getdvarint(@"hash_505f54e32e56d815", 3000) + randomint(1000);
                    if (getdvarint(@"hash_87e6b1e56b17932a", 0)) {
                        player playlocalsound("perk_iw9_high_alert_dog_growl");
                        continue;
                    }
                    player playsoundonmovingent("perk_iw9_high_alert_dog_growl");
                }
            }
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fef
// Size: 0x1c
function sixthsense_think() {
    level.sixth_sense_players = [];
    while (true) {
        waitframe();
        sixthsense_think_internal();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7013
// Size: 0x52
function setsixthsense() {
    if (getdvarint(@"hash_a013b18d3ee5cc85", 0) == 1) {
        return;
    }
    self.sixthsenselastactivetime = 0;
    self.sixthsensestate = 0;
    updatesixthsensevfx(0);
    playernum = self getentitynumber();
    level.sixth_sense_players[playernum] = self;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x706d
// Size: 0xa
function unsetsixthsense() {
    thread clearsixthsense();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x707f
// Size: 0x54
function clearsixthsense() {
    self endon("disconnect");
    self.sixthsenselastactivetime = undefined;
    self.sixthsensestate = undefined;
    self.sixthsensesource = undefined;
    self notify("removeSixthSense");
    playernum = self getentitynumber();
    level.sixth_sense_players[playernum] = undefined;
    waitframe();
    updatesixthsensevfx(0);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70db
// Size: 0x2
function setenhancedsixthsense() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70e5
// Size: 0x2
function unsetenhancedsixthsense() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70ef
// Size: 0x18
function updatesixthsensevfx(sightmask) {
    self setclientomnvar("ui_edge_glow", sightmask);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x710f
// Size: 0x13d
function getsixthsensedirection(enemy) {
    forward = anglestoforward(self getplayerangles());
    forward2d = (forward[0], forward[1], forward[2]);
    forward2d = vectornormalize(forward2d);
    toenemy = enemy.origin - self.origin;
    var_4720fae3929bbdba = (toenemy[0], toenemy[1], toenemy[2]);
    var_4720fae3929bbdba = vectornormalize(var_4720fae3929bbdba);
    dot = vectordot(forward2d, var_4720fae3929bbdba);
    if (dot >= 0.92388) {
        return 2;
    }
    if (dot >= 0.5) {
        return utility::ter_op(utility::isleft2d(self.origin, forward2d, enemy.origin), 4, 1);
    }
    if (dot >= 0.5) {
        return utility::ter_op(utility::isleft2d(self.origin, forward2d, enemy.origin), 128, 64);
    }
    if (dot >= -0.707107) {
        return utility::ter_op(utility::isleft2d(self.origin, forward2d, enemy.origin), 32, 8);
    }
    return 16;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7254
// Size: 0x68
function markassixthsensesource(otherplayer) {
    level endon("game_ended");
    self endon("disconnect");
    self notify("markAsSixthSenseSource");
    self endon("markAsSixthSenseSource");
    idx = otherplayer getentitynumber();
    self.sixthsensesource[idx] = 1;
    otherplayer utility::waittill_any_in_array_or_timeout(["death"], 10);
    self.sixthsensesource[idx] = 0;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72c4
// Size: 0x1ae
function setcamoelite() {
    self endon("death_or_disconnect");
    self endon("removeArchetype");
    while (true) {
        traces = 0;
        players = level.players;
        var_fd9f8011e476976c = 0;
        foreach (otherplayer in players) {
            if (!isdefined(otherplayer) || !otherplayer player_utility::_isalive()) {
                continue;
            }
            if (otherplayer.team == self.team) {
                continue;
            }
            if (otherplayer perk::_hasperk("specialty_empimmune")) {
                continue;
            }
            fromotherplayer = self.origin - otherplayer.origin;
            var_ed6e173aa5e562a5 = anglestoforward(otherplayer getplayerangles());
            dot = vectordot(fromotherplayer, var_ed6e173aa5e562a5);
            if (dot <= 0) {
                continue;
            }
            var_2a2e8de350c69ca = vectornormalize(fromotherplayer);
            var_7e1a1e00d916674f = vectornormalize(var_ed6e173aa5e562a5);
            dot = vectordot(var_2a2e8de350c69ca, var_7e1a1e00d916674f);
            if (dot < 12) {
                continue;
            }
            traces++;
            tracestart = otherplayer geteye();
            traceend = self geteye();
            if (trace::ray_trace_passed(tracestart, traceend, self, trace::create_default_contents(1))) {
                var_fd9f8011e476976c = 1;
                break;
            }
            if (traces >= 10) {
                waitframe();
                traces = 0;
            }
        }
        updatecamoeliteoverlay(var_fd9f8011e476976c);
        waitframe();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x747a
// Size: 0xb
function updatecamoeliteoverlay(visible) {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x748d
// Size: 0x2
function unsetcamoelite() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7497
// Size: 0x11
function setcarepackage() {
    thread killstreaks::givekillstreak("airdrop_assault", 0, 0);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74b0
// Size: 0x2
function unsetcarepackage() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74ba
// Size: 0x11
function setuav() {
    thread killstreaks::givekillstreak("uav", 0, 0);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74d3
// Size: 0x2
function unsetuav() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74dd
// Size: 0xd8
function setjuiced(waittime) {
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    self endon("unset_juiced");
    level endon("game_ended");
    self.isjuiced = 1;
    self.movespeedscaler = 1.25;
    weapons::updatemovespeedscale();
    perk::giveperk("specialty_fastreload");
    perk::giveperk("specialty_quickdraw");
    perk::giveperk("specialty_stalker");
    perk::giveperk("specialty_fastoffhand");
    perk::giveperk("specialty_fastsprintrecovery");
    perk::giveperk("specialty_quickswap");
    thread unsetjuicedondeath();
    thread unsetjuicedonride();
    thread unsetjuicedonmatchend();
    if (!isdefined(waittime)) {
        waittime = 10;
    }
    endtime = waittime * 1000 + gettime();
    if (isai(self)) {
    }
    wait waittime;
    unsetjuiced();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75bd
// Size: 0xc4
function unsetjuiced(death) {
    if (!isdefined(death)) {
        assert(isalive(self));
        self.movespeedscaler = 1;
        if (perk::_hasperk("specialty_lightweight")) {
            self.movespeedscaler = perk::lightweightscalar();
        }
        assert(isdefined(self.movespeedscaler));
        weapons::updatemovespeedscale();
    }
    perk::removeperk("specialty_fastreload");
    perk::removeperk("specialty_quickdraw");
    perk::removeperk("specialty_stalker");
    perk::removeperk("specialty_fastoffhand");
    perk::removeperk("specialty_fastsprintrecovery");
    perk::removeperk("specialty_quickswap");
    self.isjuiced = undefined;
    if (isai(self)) {
    }
    self notify("unset_juiced");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7689
// Size: 0x2d
function unsetjuicedonride() {
    self endon("disconnect");
    self endon("unset_juiced");
    while (true) {
        waitframe();
        if (utility::isusingremote()) {
            thread unsetjuiced();
            break;
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76be
// Size: 0x2b
function unsetjuicedondeath() {
    self endon("disconnect");
    self endon("unset_juiced");
    utility::waittill_any_2("death", "faux_spawn");
    thread unsetjuiced(1);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76f1
// Size: 0x2a
function unsetjuicedonmatchend() {
    self endon("disconnect");
    self endon("unset_juiced");
    level utility::waittill_any_2("round_end_finished", "game_ended");
    thread unsetjuiced();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7723
// Size: 0xc
function hasjuiced() {
    return isdefined(self.isjuiced);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7738
// Size: 0x3c8
function setcombathigh() {
    self endon("death_or_disconnect");
    self endon("unset_combathigh");
    level endon("end_game");
    self.damageblockedtotal = 0;
    if (level.splitscreen) {
        yoffset = 56;
        iconsize = 21;
    } else {
        yoffset = 112;
        iconsize = 32;
    }
    if (isdefined(self.juicedtimer)) {
        self.juicedtimer destroy();
    }
    if (isdefined(self.juicedicon)) {
        self.juicedicon destroy();
    }
    self.combathighoverlay = newclienthudelem(self);
    self.combathighoverlay.x = 0;
    self.combathighoverlay.y = 0;
    self.combathighoverlay.alignx = "left";
    self.combathighoverlay.aligny = "top";
    self.combathighoverlay.horzalign = "fullscreen";
    self.combathighoverlay.vertalign = "fullscreen";
    self.combathighoverlay setshader("combathigh_overlay", 640, 480);
    self.combathighoverlay.sort = -10;
    self.combathighoverlay.archived = 1;
    self.combathightimer = hud_util::createtimer("hudsmall", 1);
    self.combathightimer hud_util::setpoint("CENTER", "CENTER", 0, yoffset);
    self.combathightimer settimer(10);
    self.combathightimer.color = (0.8, 0.8, 0);
    self.combathightimer.archived = 0;
    self.combathightimer.foreground = 1;
    self.combathighicon = hud_util::createicon("specialty_painkiller", iconsize, iconsize);
    self.combathighicon.alpha = 0;
    self.combathighicon hud_util::setparent(self.combathightimer);
    self.combathighicon hud_util::setpoint("BOTTOM", "TOP");
    self.combathighicon.archived = 1;
    self.combathighicon.sort = 1;
    self.combathighicon.foreground = 1;
    self.combathighoverlay.alpha = 0;
    self.combathighoverlay fadeovertime(1);
    self.combathighicon fadeovertime(1);
    self.combathighoverlay.alpha = 1;
    self.combathighicon.alpha = 0.85;
    thread unsetcombathighondeath();
    thread unsetcombathighonride();
    wait 8;
    self.combathighicon fadeovertime(2);
    self.combathighicon.alpha = 0;
    self.combathighoverlay fadeovertime(2);
    self.combathighoverlay.alpha = 0;
    self.combathightimer fadeovertime(2);
    self.combathightimer.alpha = 0;
    wait 2;
    self.damageblockedtotal = undefined;
    perk::removeperk("specialty_combathigh");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b08
// Size: 0x25
function unsetcombathighondeath() {
    self endon("disconnect");
    self endon("unset_combathigh");
    self waittill("death");
    thread perk::removeperk("specialty_combathigh");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b35
// Size: 0x2d
function unsetcombathighonride() {
    self endon("disconnect");
    self endon("unset_combathigh");
    for (;;) {
        waitframe();
        if (utility::isusingremote()) {
            thread perk::removeperk("specialty_combathigh");
            break;
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b6a
// Size: 0x37
function unsetcombathigh() {
    self notify("unset_combathigh");
    self.combathighoverlay destroy();
    self.combathighicon destroy();
    self.combathightimer destroy();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ba9
// Size: 0xc
function setlightarmor() {
    lightarmor::setlightarmorvalue(self, 150);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bbd
// Size: 0xa
function unsetlightarmor() {
    lightarmor::lightarmor_unset(self);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bcf
// Size: 0x16f
function setrevenge() {
    self notify("stopRevenge");
    waitframe();
    if (!isdefined(self.lastkilledby)) {
        return;
    }
    if (level.teambased && self.team == self.lastkilledby.team) {
        return;
    }
    revengeparams = spawnstruct();
    revengeparams.showto = self;
    revengeparams.icon = "compassping_revenge";
    revengeparams.offset = (0, 0, 64);
    revengeparams.width = 10;
    revengeparams.height = 10;
    revengeparams.archived = 0;
    revengeparams.delay = 1.5;
    revengeparams.constantsize = 0;
    revengeparams.pintoscreenedge = 1;
    revengeparams.fadeoutpinnedicon = 0;
    revengeparams.is3d = 0;
    self.revengeparams = revengeparams;
    self.lastkilledby thread entityheadicons::setheadicon_singleimage(revengeparams.showto, revengeparams.icon, revengeparams.offset, undefined, undefined, undefined, revengeparams.delay);
    thread watchrevengedeath();
    thread watchrevengekill();
    thread watchrevengedisconnected();
    thread watchrevengevictimdisconnected();
    thread watchstoprevenge();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d46
// Size: 0x8c
function watchrevengedeath() {
    self endon("stopRevenge");
    self endon("disconnect");
    lastkilledby = self.lastkilledby;
    while (true) {
        lastkilledby waittill("spawned_player");
        lastkilledby thread entityheadicons::setheadicon_singleimage(self.revengeparams.showto, self.revengeparams.icon, self.revengeparams.offset, undefined, undefined, undefined, self.revengeparams.delay);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7dda
// Size: 0x19
function watchrevengekill() {
    self endon("stopRevenge");
    self waittill("killed_enemy");
    self notify("stopRevenge");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7dfb
// Size: 0x21
function watchrevengedisconnected() {
    self endon("stopRevenge");
    self.lastkilledby waittill("disconnect");
    self notify("stopRevenge");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e24
// Size: 0x82
function watchstoprevenge() {
    lastkilledby = self.lastkilledby;
    self waittill("stopRevenge");
    if (!isdefined(lastkilledby)) {
        return;
    }
    foreach (headicon in lastkilledby.entityheadicons) {
        if (!isdefined(headicon)) {
            continue;
        }
        headicon destroy();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7eae
// Size: 0xab
function watchrevengevictimdisconnected() {
    objid = self.objidfriendly;
    lastkilledby = self.lastkilledby;
    lastkilledby endon("disconnect");
    level endon("game_ended");
    self endon("stopRevenge");
    self waittill("disconnect");
    if (!isdefined(lastkilledby)) {
        return;
    }
    foreach (headicon in lastkilledby.entityheadicons) {
        if (!isdefined(headicon)) {
            continue;
        }
        headicon destroy();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f61
// Size: 0xa
function unsetrevenge() {
    self notify("stopRevenge");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f73
// Size: 0xd
function setphaseslide() {
    self.canphaseslide = 1;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f88
// Size: 0xc
function unsetphaseslide() {
    self.canphaseslide = 0;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f9c
// Size: 0xd
function setteleslide() {
    self.canteleslide = 1;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fb1
// Size: 0xc
function unsetteleslide() {
    self.canteleslide = 0;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fc5
// Size: 0xd
function setphaseslashrephase() {
    self.hasrephase = 1;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fda
// Size: 0xc
function unsetphaseslashrephase() {
    self.hasrephase = 0;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fee
// Size: 0x2
function setphasefall() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ff8
// Size: 0x2
function unsetphasefall() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8002
// Size: 0x2
function setextenddodge() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x800c
// Size: 0x2
function unsetextenddodge() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8016
// Size: 0x9
function setauraquickswap() {
    archassault::auraquickswap_run();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8027
// Size: 0x2
function unsetauraquickswap() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8031
// Size: 0x2
function setauraspeed() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x803b
// Size: 0x2
function unsetauraspeed() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8045
// Size: 0x9
function setmarktargets() {
    namespace_70e675ecd54f03da::marktarget_init();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8056
// Size: 0x2
function unsetmarktargets() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8060
// Size: 0x2
function setbatterypack() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x806a
// Size: 0x2
function unsetbatterypack() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8074
// Size: 0x2
function setcamoclone() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x807e
// Size: 0x2
function unsetcamoclone() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8088
// Size: 0x15
function setblockhealthregen() {
    self.healthregendisabled = 1;
    self notify("force_regeneration");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80a5
// Size: 0x14
function unsetblockhealthregen() {
    self.healthregendisabled = undefined;
    self notify("force_regeneration");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80c1
// Size: 0x2
function setscorestreakpack() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80cb
// Size: 0x2
function unsetscorestreakpack() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80d5
// Size: 0x2
function setsuperpack() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80df
// Size: 0x2
function unsetsuperpack() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80e9
// Size: 0x2
function setspawncloak() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80f3
// Size: 0x2
function unsetspawncloak() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80fd
// Size: 0x19
function setdodgedefense() {
    damage_utility::adddamagemodifier("dodgeDefense", 0.5, 0, &dodgedefenseignorefunc);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x811e
// Size: 0xf
function unsetdodgedefense() {
    damage_utility::removedamagemodifier("dodgeDefense", 0);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8135
// Size: 0x6d
function dodgedefenseignorefunc(inflictor, attacker, victim, damage, meansofdeath, objweapon, hitloc) {
    if (!(isdefined(victim.dodging) && victim.dodging && victim perk::_hasperk("specialty_dodge_defense"))) {
        return true;
    }
    return false;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x81ab
// Size: 0x2
function setdodgewave() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x81b5
// Size: 0x2
function unsetdodgewave() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81bf
// Size: 0x2
function setgroundpound() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81c9
// Size: 0x2
function unsetgroundpound() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81d3
// Size: 0xd9
function setmeleekill() {
    self giveweapon("iw7_fistsperk_mp");
    self assignweaponmeleeslot("iw7_fistsperk_mp");
    if (self hasweapon("iw9_me_fists_mp")) {
        currweap = self getcurrentweapon();
        inventory_utility::_takeweapon("iw9_me_fists_mp");
        self giveweapon("iw7_fistslethal_mp");
        if (currweap.basename == "iw9_me_fists_mp") {
            inventory_utility::_switchtoweapon("iw7_fistslethal_mp");
            if (isdefined(self.gettingloadout) && self.gettingloadout && isdefined(self.spawnweaponobj) && self.spawnweaponobj.basename == "iw9_me_fists_mp") {
                self.spawnweaponobj = makeweapon("iw7_fistslethal_mp");
                self setspawnweapon(self.spawnweaponobj);
            }
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82b4
// Size: 0x68
function unsetmeleekill() {
    inventory_utility::_takeweapon("iw7_fistsperk_mp");
    if (self hasweapon("iw7_fistslethal_mp")) {
        currweap = self.currentweapon;
        inventory_utility::_takeweapon("iw7_fistslethal_mp");
        self giveweapon("iw9_me_fists_mp");
        if (currweap.basename == "iw7_fistslethal_mp") {
            inventory_utility::_switchtoweapon("iw9_me_fists_mp");
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8324
// Size: 0x2
function setpowercell() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x832e
// Size: 0x2
function unsetpowercell() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8338
// Size: 0x3f
function sethardline() {
    self endon("death_or_disconnect");
    self endon("perk_end_hardline");
    killstreaks::updatestreakcosts();
    killstreaks::checkstreakreward(self.streakpoints);
    killstreaks::updatestreakmeterui();
    self.hardlineactive["assists"] = 0;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x837f
// Size: 0x10
function watchhardlineassists() {
    self endon("death_or_disconnect");
    self endon("perk_end_hardline");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8397
// Size: 0x14
function unsethardline() {
    self.hardlineactive = undefined;
    self notify("perk_end_hardline");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83b3
// Size: 0x2
function setoverclock() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83bd
// Size: 0x2
function unsetoverclock() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83c7
// Size: 0x10
function setovercharge() {
    self setclientomnvar("ui_overcharge", 1);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83df
// Size: 0xf
function unsetovercharge() {
    self setclientomnvar("ui_overcharge", 0);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83f6
// Size: 0xa
function setsupersprintenhanced() {
    thread watchforsupersprintenhancedused();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8408
// Size: 0xa
function unsetsupersprintenhanced() {
    self notify("unsetSuperSprintEnhanced");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x841a
// Size: 0x5b
function watchforsupersprintenhancedused() {
    self endon("unsetSuperSprintEnhanced");
    self endon("disconnect");
    for (var_928acaeced291d4 = 0; 2000 > var_928acaeced291d4; var_928acaeced291d4 += deltatime) {
        waitframe();
        if (isdefined(self) && istrue(self issupersprinting())) {
            deltatime = level.frameduration;
        }
    }
    gamelogic::sethasdonecombat(self, 1);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x847d
// Size: 0x2
function settracker() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8487
// Size: 0x2
function unsettracker() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8491
// Size: 0x2
function setpersonaltrophy() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x849b
// Size: 0x2
function unsetpersonaltrophy() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84a5
// Size: 0x2
function setdisruptorpunch() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84af
// Size: 0x2
function unsetdisruptorpunch() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84b9
// Size: 0x16
function setequipmentping() {
    if (!game_utility::lpcfeaturegated()) {
        level.equipmentpingactive = 1;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84d7
// Size: 0x2
function unsetequipmentping() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84e1
// Size: 0x2
function setmanatarms() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84eb
// Size: 0x2
function unsetmanatarms() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84f5
// Size: 0xa
function setoutlinekillstreaks() {
    thread outlinekillstreaks_enablemarksafterprematch();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8507
// Size: 0xa8
function outlinekillstreaks_enablemarksafterprematch() {
    self endon("unsetOutlineKillstreak");
    self endon("disconnect");
    flags::gameflagwait("prematch_done");
    dist = 1000000;
    if (game_utility::isbrstylegametype()) {
        dist = 1000;
    }
    if (perk::_hasperk("specialty_tactician")) {
        bundle = level.perkbundles["specialty_tactician"];
        dist = utility::default_to(bundle.var_3649c0ffe7799945, dist);
    }
    if (isdefined(self)) {
        self enableentitymarks("killstreak", dist);
        self enableentitymarks("air_killstreak", dist);
        self.perkoutlinekillstreaksset = 1;
        vehicle_compass::vehicle_compass_updateallvisibilityforplayer(self);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85b7
// Size: 0x41
function unsetoutlinekillstreaks() {
    if (istrue(self.perkoutlinekillstreaksset)) {
        self disableentitymarks("killstreak");
        self disableentitymarks("air_killstreak");
        self.perkoutlinekillstreaksset = undefined;
    }
    vehicle_compass::vehicle_compass_updateallvisibilityforplayer(self);
    self notify("unsetOutlineKillstreak");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8600
// Size: 0xa
function setengineer() {
    thread engineer_enablemarksafterprematch();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8612
// Size: 0x57
function engineer_enablemarksafterprematch() {
    self endon("unsetEngineer");
    self endon("disconnect");
    flags::gameflagwait("prematch_done");
    dist = 1000000;
    if (game_utility::isbrstylegametype()) {
        dist = 1000;
    }
    if (isdefined(self)) {
        self enableentitymarks("equipment", dist);
        self.perkengineerset = 1;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8671
// Size: 0x2d
function unsetengineer() {
    if (istrue(self.perkengineerset)) {
        self disableentitymarks("equipment");
        self.perkengineerset = undefined;
    }
    self notify("unsetEngineer");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86a6
// Size: 0xca
function function_a20970a318808f61() {
    if (!isdefined(level.var_1a439e77dde46982)) {
        level.var_1a439e77dde46982 = [];
    }
    if (isdefined(level.var_2a83795d29778aea)) {
        return;
    }
    bundle = level.perkbundles["specialty_engineer"];
    if (!isdefined(bundle)) {
        return;
    }
    level.var_2a83795d29778aea = utility::ter_op(isdefined(bundle.var_ba12045354dd234f), [], undefined);
    foreach (killstreakref in bundle.var_ba12045354dd234f) {
        level.var_2a83795d29778aea[killstreakref.streakref] = killstreakref;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8778
// Size: 0xb
function function_71fce3d1d414f5f9() {
    level function_e381f9fcd740f0bd(self);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x878b
// Size: 0xb
function function_96fb684092d79102() {
    level function_349ab9d8e2296ef6(self);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x879e
// Size: 0xd8
function function_e381f9fcd740f0bd(player) {
    if (level.var_1a439e77dde46982[player.name] == undefined) {
        level.var_1a439e77dde46982[player.name] = player;
    }
    if (!isdefined(level.var_44007c283e07f7c2)) {
        return;
    }
    foreach (killstreakobjid in level.var_44007c283e07f7c2) {
        killstreak = level.var_932b68e7ca895a9f[killstreakobjid];
        killstreakowner = level.killstreakowners[killstreak];
        if (istrue(player_utility::playersareenemies(player, killstreakowner))) {
            namespace_6c8a837ec98fe0b8::objective_playermask_addshowplayer(killstreakobjid, player);
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x887e
// Size: 0x84
function function_349ab9d8e2296ef6(player) {
    level.var_1a439e77dde46982[player.name] = undefined;
    if (!isdefined(level.var_44007c283e07f7c2)) {
        return;
    }
    foreach (killstreakobjid in level.var_44007c283e07f7c2) {
        namespace_6c8a837ec98fe0b8::objective_playermask_hidefrom(killstreakobjid, player);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x890a
// Size: 0x4b
function setnoscopeoutline() {
    if (!isdefined(level.noscopeoutlinesetnotifs)) {
        level.noscopeoutlinesetnotifs = [];
        level.noscopeoutlineunsetnotifs = [];
        level thread processnoscopeoutlinesetnotifs();
        level thread processnoscopeoutlineunsetnotifs();
    }
    level.noscopeoutlinesetnotifs[level.noscopeoutlinesetnotifs.size] = self;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x895d
// Size: 0x18
function unsetnoscopeoutline() {
    level.noscopeoutlineunsetnotifs[level.noscopeoutlineunsetnotifs.size] = self;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x897d
// Size: 0x75
function processnoscopeoutlinesetnotifs() {
    level endon("game_ended");
    while (true) {
        if (level.noscopeoutlinesetnotifs.size > 0) {
            i = 0;
            while (isdefined(level.noscopeoutlinesetnotifs[i])) {
                level notify("set_noscopeoutline", level.noscopeoutlinesetnotifs[i]);
                level.noscopeoutlinesetnotifs[i] notify("set_noscopeoutline");
                i++;
                waitframe();
            }
            level.noscopeoutlinesetnotifs = [];
            continue;
        }
        waitframe();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89fa
// Size: 0x75
function processnoscopeoutlineunsetnotifs() {
    level endon("game_ended");
    while (true) {
        if (level.noscopeoutlineunsetnotifs.size > 0) {
            i = 0;
            while (isdefined(level.noscopeoutlineunsetnotifs[i])) {
                level notify("unset_noscopeoutline", level.noscopeoutlineunsetnotifs[i]);
                level.noscopeoutlineunsetnotifs[i] notify("unset_noscopeoutline");
                i++;
                waitframe();
            }
            level.noscopeoutlineunsetnotifs = [];
            continue;
        }
        waitframe();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a77
// Size: 0x2
function setcloak() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a81
// Size: 0x2
function unsetcloak() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a8b
// Size: 0x2
function setwalllock() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a95
// Size: 0x2
function unsetwalllock() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a9f
// Size: 0x2
function setrush() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8aa9
// Size: 0x14
function unsetrush() {
    self notify("removeCombatHigh");
    self.speedonkillmod = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ac5
// Size: 0xa
function sethover() {
    thread runhover();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ad7
// Size: 0x2
function unsethover() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ae1
// Size: 0x17
function setmomentum() {
    self.momentumspeedincrease = 0.05;
    weapons::updatemovespeedscale();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b00
// Size: 0x13
function unsetmomentum() {
    self.momentumspeedincrease = undefined;
    weapons::updatemovespeedscale();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b1b
// Size: 0x2
function setscavengereqp() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b25
// Size: 0x2
function unsetscavengereqp() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b2f
// Size: 0x2
function setspawnview() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b39
// Size: 0x57
function unsetspawnview() {
    foreach (player in level.players) {
        player notify("end_spawnview");
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b98
// Size: 0xb
function setheadgear(power) {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bab
// Size: 0x2
function unsetheadgear() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bb5
// Size: 0x2
function setftlslide() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bbf
// Size: 0x2
function unsetftlslide() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bc9
// Size: 0x2
function setimprovedprone() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bd3
// Size: 0x2
function unsetimprovedprone() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bdd
// Size: 0x14
function setghost() {
    thread startgpsjammer();
    self.canghost = 0;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bf9
// Size: 0x14
function unsetghost() {
    thread removegpsjammer();
    self.canghost = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c15
// Size: 0x15
function function_46a8a30fa0be5b5c() {
    self.canghost = 1;
    thread function_799abf543f79895a();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c32
// Size: 0x14
function function_3dddddc711e8ab99() {
    thread removegpsjammer();
    self.canghost = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c4e
// Size: 0x95
function setsupportkillstreaks() {
    self endon("disconnect");
    self waittill("equipKillstreaksFinished");
    if (!isdefined(self.streakdata.streaks[1])) {
        foreach (streak in self.streakdata.streaks["killstreaks"]) {
            streak.earned = 0;
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ceb
// Size: 0xa
function unsetsupportkillstreaks() {
    self notify("end_support_killstreaks");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cfd
// Size: 0x17
function setoverrideweaponspeed() {
    self.overrideweaponspeed_speedscale = 0.98;
    weapons::updatemovespeedscale();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d1c
// Size: 0xc
function unsetoverrideweaponspeed() {
    self.overrideweaponspeed_speedscale = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d30
// Size: 0x2
function setcloakaerial() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d3a
// Size: 0x2
function unsetcloakaerial() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d44
// Size: 0xd
function setspawnradar() {
    self.hasspawnradar = 1;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d59
// Size: 0xd
function unsetspawnradar() {
    self.hasspawnradar = 1;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d6e
// Size: 0x2
function setimprovedmelee() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d78
// Size: 0x2
function unsetimprovedmelee() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d82
// Size: 0x2
function setthief() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d8c
// Size: 0x2
function unsetthief() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d96
// Size: 0x1b
function setadsawareness() {
    thread runadsawareness();
    self setscriptablepartstate("heightened_senses", "default");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8db9
// Size: 0x144
function runadsawareness() {
    self endon("death_or_disconnect");
    self endon("unsetADSAwareness");
    self.awarenessradius = 256;
    self.awarenessqueryrate = 2;
    thread awarenessmonitorstance();
    while (true) {
        wait self.awarenessqueryrate;
        awarenessplayers = utility::playersinsphere(self.origin, self.awarenessradius);
        foreach (player in level.players) {
            if (player.team == self.team) {
                continue;
            }
            if (player perk::_hasperk("specialty_coldblooded")) {
                bundle = level.perkbundles["specialty_coldblooded"];
                if (!isdefined(bundle) || !istrue(bundle.var_66e227164a07489c)) {
                    continue;
                }
            }
            if (player isonground() && !player issprinting() && !player iswallrunning() && !player issprintsliding()) {
                continue;
            }
            thread playincomingwarning(player);
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f05
// Size: 0x83
function playincomingwarning(target) {
    self setscriptablepartstate("heightened_senses", "scrn_pulse");
    self playrumbleonentity("damage_heavy");
    target playsoundtoplayer("ghost_senses_ping", self);
    wait 0.2;
    if (isdefined(self)) {
        self setscriptablepartstate("heightened_senses", "default");
        if (player_utility::_isalive()) {
            self playrumbleonentity("damage_heavy");
            if (isdefined(target) && target player_utility::_isalive()) {
                target playsoundtoplayer("ghost_senses_ping", self);
            }
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f90
// Size: 0xbd
function awarenessmonitorstance() {
    self endon("death_or_disconnect");
    while (true) {
        stance = self getstance();
        velocity = self getvelocity();
        switch (stance) {
        case #"hash_c6775c88e38f7803": 
            self.awarenessradius = 400;
            self.awarenessqueryrate = 2;
            break;
        case #"hash_3fed0cbd303639eb": 
            self.awarenessradius = 650;
            self.awarenessqueryrate = 1;
            break;
        case #"hash_d91940431ed7c605": 
            self.awarenessradius = 700;
            self.awarenessqueryrate = 0.5;
            break;
        }
        wait 0.01;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9055
// Size: 0x40
function awarenessaudiopulse() {
    self endon("death_or_disconnect");
    self endon("stop_awareness");
    while (true) {
        playsoundatpos(self.origin + (0, 0, 5), "ghost_senses_ping");
        wait 2;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x909d
// Size: 0x1b
function unsetadsawareness() {
    self notify("unsetADSAwareness");
    self setscriptablepartstate("heightened_senses", "default");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90c0
// Size: 0x2
function setrearguard() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90ca
// Size: 0xc
function unsetrearguard() {
    self.hasrearguardshield = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90de
// Size: 0xd
function setsolobuddyboost() {
    self.hassolobuddyboost = 1;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90f3
// Size: 0xc
function unsetsolobuddyboost() {
    self.hassolobuddyboost = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9107
// Size: 0x46
function setthrowingknifemelee() {
    if (!isdefined(self.throwingknifemelee)) {
        /#
            iprintln("<dev string:x1c>");
        #/
        return;
    }
    self giveweapon(self.throwingknifemelee);
    self assignweaponmeleeslot(self.throwingknifemelee);
    thread watchthrowingknifescavenge();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9155
// Size: 0x3a
function unsetthrowingknifemelee() {
    if (isdefined(self.throwingknifemelee) && self hasweapon(self.throwingknifemelee)) {
        self takeweapon(self.throwingknifemelee);
    }
    self notify("specialty_equip_throwingKnife_end");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9197
// Size: 0x69
function watchthrowingkifefireswipe() {
    self endon("death_or_disconnect");
    self endon("specialty_equip_throwingKnife_end");
    while (true) {
        weapon = self waittill("weapon_change");
        if (weapon.basename == "iw8_throwingknife_fire_melee_mp") {
            self setscriptablepartstate("equipFlamingKnife", "active");
            self waittill("weapon_change");
            self setscriptablepartstate("equipFlamingKnife", "neutral");
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9208
// Size: 0x13
function killthrowingknifefire() {
    self setscriptablepartstate("equipFlamingKnife", "neutral");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9223
// Size: 0x69
function function_a722bb83c625e6c0() {
    self endon("death_or_disconnect");
    self endon("specialty_equip_throwingKnife_end");
    while (true) {
        weapon = self waittill("weapon_change");
        if (weapon.basename == "iw8_throwingknife_electric_melee_mp") {
            self setscriptablepartstate("equipFlamingKnife", "active");
            self waittill("weapon_change");
            self setscriptablepartstate("equipFlamingKnife", "neutral");
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9294
// Size: 0x13
function function_6b1e598a80ac49() {
    self setscriptablepartstate("equipFlamingKnife", "neutral");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92af
// Size: 0xb2
function watchthrowingknifescavenge() {
    self endon("death_or_disconnect");
    self endon("specialty_equip_throwingKnife_end");
    while (true) {
        weapon = self waittill("offhand_fired");
        if (weapon::isthrowingknife(weapon)) {
            ammo = self getammocount(weapon);
            if (ammo == 0) {
                if (isdefined(self.throwingknifemelee) && self hasweapon(self.throwingknifemelee)) {
                    self takeweapon(self.throwingknifemelee);
                }
            }
            while (self getammocount(weapon) == 0) {
                wait 0.05;
            }
            self giveweapon(self.throwingknifemelee);
            self assignweaponmeleeslot(self.throwingknifemelee);
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9369
// Size: 0x86
function setbulletoutline() {
    self.bulletoutline = spawnstruct();
    self.bulletoutline.player = self;
    self.bulletoutline.enemies = [];
    self.bulletoutline.enemyids = [];
    self.bulletoutline.enemyendtimes = [];
    self.bulletoutline thread watchbulletoutline();
    self.bulletoutline thread watchbulletoutlinecleanup();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93f7
// Size: 0x14
function unsetbulletoutline() {
    self notify("unsetBulletOutline");
    self.bulletoutline = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9413
// Size: 0xd3
function watchbulletoutline() {
    self.player endon("death_or_disconnect");
    self.player endon("unsetBulletOutline");
    while (isdefined(self.player)) {
        time = gettime();
        foreach (index, enemy in self.enemies) {
            if (!isdefined(enemy)) {
                bulletoutlineremoveenemy(undefined, index);
                continue;
            }
            if (enemy perk::_hasperk("specialty_noscopeoutline")) {
                bulletoutlineremoveenemy(enemy, index);
                continue;
            }
            if (time >= self.enemyendtimes[index]) {
                bulletoutlineremoveenemy(enemy, index);
            }
        }
        waitframe();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94ee
// Size: 0x77
function watchbulletoutlinecleanup() {
    self.player utility::waittill_any_2("disconnect", "unsetBulletOutline");
    foreach (index, enemy in self.enemies) {
        if (isdefined(enemy)) {
            bulletoutlineremoveenemy(enemy, index);
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x956d
// Size: 0xac
function bulletoutlineaddenemy(enemy, duration, offensive) {
    entnum = enemy getentitynumber();
    endtime = gettime() + duration * 1000;
    self.enemies[entnum] = enemy;
    if (!isdefined(self.enemyids[entnum])) {
        self.enemyids[entnum] = outline::outlineenableforplayer(enemy, self.player, "outline_depth_red", "perk");
    }
    if (!isdefined(self.enemyendtimes[entnum]) || !isdefined(offensive) || offensive) {
        self.enemyendtimes[entnum] = endtime;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9621
// Size: 0x6a
function bulletoutlineremoveenemy(enemy, index) {
    assert(isdefined(enemy) || isdefined(index));
    if (!isdefined(index)) {
        index = enemy getentitynumber();
    }
    self.enemies[index] = undefined;
    self.enemyendtimes[index] = undefined;
    if (isdefined(enemy)) {
        outline::outlinedisable(self.enemyids[index], enemy);
    }
    self.enemyids[index] = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9693
// Size: 0x164
function bulletoutlinecheck(attacker, victim, weapon, meansofdeath) {
    if (!(meansofdeath == "MOD_HEAD_SHOT" || meansofdeath == "MOD_RIFLE_BULLET" || meansofdeath == "MOD_PISTOL_BULLET" || meansofdeath == "MOD_EXPLOSIVE_BULLET")) {
        return;
    }
    if (!isdefined(attacker) || !isdefined(victim)) {
        return;
    }
    if (!isplayer(attacker) || !isplayer(victim)) {
        return;
    }
    attackerowner = attacker;
    if (isdefined(attacker.owner)) {
        attackerowner = attacker.owner;
    }
    victimowner = victim;
    if (isdefined(victim.owner)) {
        victimowner = victim.owner;
    }
    if (!istrue(player_utility::playersareenemies(attackerowner, victimowner))) {
        return;
    }
    if (isplayer(attacker) && isplayer(victim) && outline::outlineoccluded(attacker geteye(), victim geteye())) {
        return;
    }
    if (isdefined(attacker.bulletoutline) && !victim perk::_hasperk("specialty_noscopeoutline")) {
        attacker.bulletoutline bulletoutlineaddenemy(victim, 1);
    }
    if (isdefined(victim.bulletoutline) && !attacker perk::_hasperk("specialty_noscopeoutline")) {
        victim.bulletoutline bulletoutlineaddenemy(attacker, 2, 0);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x97ff
// Size: 0x94
function markempsignatures(target, id) {
    if (!isdefined(target.empmarked)) {
        target.empmarked = [];
    }
    if (isdefined(target.empmarked[id]) && target.empmarked[id] == "active") {
        return;
    }
    target.empmarked[id] = "active";
    thread empvfx(target, id);
    target utility::waittill_any_2("death", "cloak_end");
    target.empmarked[id] = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x989b
// Size: 0x6b
function empvfx(target, id) {
    locationtags = ["j_shoulder_ri", "j_shoulder_le", "j_hip_ri", "j_hip_le", "j_spine4", "j_wrist_ri", "j_wrist_le"];
    target.empmarked[id] = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x990e
// Size: 0x14e
function startgpsjammer() {
    self endon("remove_gpsjammer");
    self endon("death_or_disconnect");
    if (isai(self) && !isbot(self)) {
        function_a587d6e4331b6211(self.avoidkillstreakonspawntimer);
        self.avoidkillstreakonspawntimer = undefined;
    }
    if (level.minspeedsq == 0) {
        return;
    }
    assert(level.timeperiod >= 0.05);
    if (level.timeperiod < 0.05) {
        return;
    }
    self.timesincelastweaponfire = 0;
    thread ghostadvanceduavwatcher();
    bundle = level.perkbundles["specialty_ghost"];
    if (istrue(game_utility::isbrstylegametype())) {
        minspeed = getdvarint(@"hash_884bab3a224ed6f0", 65);
        thread function_d32c8e85d6e01e4b(minspeed);
    } else if (isdefined(bundle) && istrue(bundle.var_33c678397e625e15)) {
        thread function_d32c8e85d6e01e4b(bundle.var_35bc9bc901c56258);
    }
    self.timesincelastweaponfire = 0;
    self setplayerghost(istrue(self.canghost));
    while (true) {
        objweapon = self waittill("weapon_fired");
        if (class::isweaponsilenced(objweapon)) {
            continue;
        }
        doghostweaponfired();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a64
// Size: 0xdb
function function_799abf543f79895a() {
    self endon("remove_gpsjammer");
    self endon("death_or_disconnect");
    if (isai(self) && !isbot(self)) {
        function_a587d6e4331b6211(self.avoidkillstreakonspawntimer);
        self.avoidkillstreakonspawntimer = undefined;
    }
    if (level.minspeedsq == 0) {
        return;
    }
    assert(level.timeperiod >= 0.05);
    if (level.timeperiod < 0.05) {
        return;
    }
    self.timesincelastweaponfire = 0;
    thread ghostadvanceduavwatcher();
    self.timesincelastweaponfire = 0;
    self setplayerghost(istrue(self.canghost));
    while (true) {
        objweapon = self waittill("weapon_fired");
        if (class::isweaponsilenced(objweapon)) {
            continue;
        }
        doghostweaponfired();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b47
// Size: 0x3d
function function_a587d6e4331b6211(killstreaktimer) {
    delay = utility::default_to(killstreaktimer, 0);
    if (delay > 0) {
        if (istrue(self.inspawncamera)) {
            delay += spawncamera::getspawncamerablendtime();
        }
        wait delay;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b8c
// Size: 0x81
function doghostweaponfired() {
    self endon("remove_gpsjammer");
    self endon("death_or_disconnect");
    self setplayerghost(0);
    thread checkforghostweaponfire();
    while (self.timesincelastweaponfire < 3) {
        wait level.timeperiod;
        self.timesincelastweaponfire += level.timeperiod;
    }
    self notify("ghost_restored");
    self.timesincelastweaponfire = 0;
    self setplayerghost(self.canghost);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c15
// Size: 0x35
function checkforghostweaponfire() {
    self endon("death_or_disconnect");
    self endon("remove_gpsjammer");
    self endon("ghost_restored");
    while (true) {
        self waittill("weapon_fired");
        self.timesincelastweaponfire = 0;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c52
// Size: 0x20d
function ghostadvanceduavwatcher() {
    self endon("death_or_disconnect");
    self endon("remove_gpsjammer");
    var_498a2226e5aa47ee = game_utility::isbrstylegametype();
    if (var_498a2226e5aa47ee) {
        self setplayeradvanceduavdot(1);
        return;
    }
    bundle = level.streakglobals.streakbundles["directional_uav"];
    var_f12970142a5c902b = isdefined(bundle) && istrue(bundle.var_4e4c0a55c6b62c82);
    while (true) {
        if (level.teambased) {
            enemyhasauav = level.activeadvanceduavcount - level.activeadvanceduavs[self.team] > 0;
            if (enemyhasauav) {
                self setplayeradvanceduavdot(!var_f12970142a5c902b);
                self setplayerghost(0);
                while (enemyhasauav) {
                    waitframe();
                    enemyhasauav = level.activeadvanceduavcount - level.activeadvanceduavs[self.team] > 0;
                }
                self setplayerghost(self.canghost);
                self setplayeradvanceduavdot(!self.canghost);
            }
        } else {
            foreach (player in level.players) {
                if (player == self) {
                    continue;
                }
                if (istrue(level.activeadvanceduavs[player.guid]) && level.activeadvanceduavs[player.guid] > 0) {
                    self setplayeradvanceduavdot(1);
                    self setplayerghost(0);
                    while (istrue(level.activeadvanceduavs[player.guid]) && level.activeadvanceduavs[player.guid] > 0) {
                        level waittill("uav_update");
                    }
                    self setplayerghost(self.canghost);
                    self setplayeradvanceduavdot(!self.canghost);
                }
            }
        }
        waitframe();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e67
// Size: 0x99
function function_d32c8e85d6e01e4b(minspeed) {
    self endon("death_or_disconnect");
    self endon("remove_gpsjammer");
    self.canghost = istrue(self.canghost);
    while (true) {
        laststatus = self.canghost;
        self.canghost = function_c1e6eda48a5eca42(minspeed);
        if (istrue(self.var_8d9c40fe23269431)) {
            self.canghost = 1;
        }
        if (laststatus != self.canghost) {
            self setplayerghost(self.canghost && !function_a13d64596c10eeca());
        }
        waitframe();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f08
// Size: 0x58
function function_a13d64596c10eeca() {
    key = utility::ter_op(level.teambased, self.team, self.guid);
    var_10f26e662f7fa622 = utility::default_to(level.activeadvanceduavs[key], 0);
    return level.activeadvanceduavcount - var_10f26e662f7fa622 > 0;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f69
// Size: 0xe3
function function_c1e6eda48a5eca42(minspeed) {
    var_3bad2e994099c990 = lengthsquared(self getvelocity()) >= squared(minspeed);
    if (var_3bad2e994099c990) {
        if (isdefined(self.var_a99ec1c2df05eefd)) {
            self.var_a99ec1c2df05eefd = undefined;
        }
        return true;
    }
    if (istrue(self.isdefusing)) {
        return true;
    }
    if (istrue(self.isplanting)) {
        return true;
    }
    if (isdefined(self.vehicle_controlling) && isdefined(self.vehicle_controlling.streakinfo)) {
        return true;
    }
    if (!isdefined(self.var_a99ec1c2df05eefd)) {
        gracetime = getdvarfloat(@"hash_5cf78be1abae9320", 2);
        self.var_a99ec1c2df05eefd = gettime() + gracetime * 1000;
        return true;
    }
    if (gettime() < self.var_a99ec1c2df05eefd) {
        return true;
    }
    return false;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa055
// Size: 0x1a
function removegpsjammer() {
    self notify("remove_gpsjammer");
    self setplayerghost(0);
    self setplayeradvanceduavdot(0);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa077
// Size: 0x1c
function setgroundpoundshield() {
    level._effect["groundPoundShield_impact"] = loadfx("vfx/iw7/_requests/mp/vfx_debug_warning.vfx");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa09b
// Size: 0xa
function unsetgroundpoundshield() {
    self notify("groundPoundShield_unset");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa0ad
// Size: 0x13
function groundpoundshield_onimpact(var_af29b63bc110dcf1) {
    thread groundpoundshield_raiseondelay();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0c8
// Size: 0x24
function groundpoundshield_raiseondelay() {
    self endon("death_or_disconnect");
    self endon("groundPound_unset");
    self endon("groundPoundLand");
    wait 0.25;
    groundpoundshield_raise();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0f4
// Size: 0x273
function groundpoundshield_raise() {
    if (isdefined(self.groundpoundshield)) {
        thread groundpoundshield_lower(self.groundpoundshield);
    }
    origin = self.origin + anglestoforward(self.angles) * 5;
    angles = self.angles + (0, 90, 0);
    xmodel = spawn("script_model", origin);
    xmodel.angles = angles;
    xmodel setmodel("weapon_shinguard_col_wm");
    var_d96e6ddab67fb9be = spawn("script_model", origin);
    var_d96e6ddab67fb9be.angles = angles;
    var_d96e6ddab67fb9be setmodel("weapon_shinguard_fr_wm");
    var_d96e6ddab67fb9be.outlineid = outline::outlineenableforall(var_d96e6ddab67fb9be, "outline_nodepth_cyan", "equipment");
    var_d97b7bdab68ded0d = spawn("script_model", origin);
    var_d97b7bdab68ded0d.angles = angles;
    var_d97b7bdab68ded0d setmodel("weapon_shinguard_en_wm");
    var_d97b7bdab68ded0d.outlineid = outline::outlineenableforall(var_d97b7bdab68ded0d, "outline_nodepth_orange", "equipment");
    xmodel.visfr = var_d96e6ddab67fb9be;
    xmodel.visen = var_d97b7bdab68ded0d;
    xmodel.owner = self;
    xmodel setcandamage(1);
    xmodel.health = 9999;
    xmodel.shieldhealth = 210;
    self.groundpoundshield = xmodel;
    players = level.characters;
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        if (level.teambased && player.team == self.team) {
            var_d97b7bdab68ded0d hidefromplayer(player);
            continue;
        }
        var_d96e6ddab67fb9be hidefromplayer(player);
    }
    thread groundpoundshield_monitorjoinedteam(xmodel);
    thread groundpoundshield_loweronleavearea(xmodel);
    thread groundpoundshield_lowerontime(xmodel, 3.25);
    thread groundpoundshield_loweronjump(xmodel);
    thread groundpoundshield_deleteondisconnect(xmodel);
    thread groundpoundshield_monitorhealth(xmodel);
    thread groundpound_raisefx();
    return xmodel;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa370
// Size: 0x2a
function groundpoundshield_lower(xmodel) {
    self notify("groundPoundShield_end");
    if (!isdefined(xmodel)) {
        return;
    }
    thread groundpoundshield_lowerfx();
    thread groundpoundshield_deleteshield(xmodel);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa3a2
// Size: 0x2a
function groundpoundshield_break(xmodel) {
    self notify("groundPoundShield_end");
    if (!isdefined(xmodel)) {
        return;
    }
    thread groundpoundshield_breakfx();
    thread groundpoundshield_deleteshield(xmodel);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa3d4
// Size: 0x1c1
function groundpoundshield_monitorhealth(xmodel) {
    self endon("death_or_disconnect");
    self endon("groundPound_unset");
    self endon("groundPoundShield_end");
    self endon("groundPoundShield_deleteShield");
    while (true) {
        damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, weapon = xmodel waittill("damage");
        if (isdefined(attacker)) {
            if (attacker == self || attacker.team != self.team) {
                xmodel.shieldhealth -= damage;
            }
        }
        xmodel.health = 9999;
        thread groundpoundshield_damagedfx(attacker, point, direction_vec);
        if (xmodel.shieldhealth <= 0) {
            thread groundpoundshield_break(xmodel);
            return;
        }
        if (xmodel.shieldhealth <= 105) {
            if (xmodel.visfr.model != "weapon_shinguard_dam_wm") {
                xmodel.visfr setmodel("weapon_shinguard_dam_wm");
                outline::outlinerefresh(xmodel.visfr);
            }
            if (xmodel.visen.model != "weapon_shinguard_dam_wm") {
                xmodel.visen setmodel("weapon_shinguard_dam_wm");
                outline::outlinerefresh(xmodel.visen);
            }
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa59d
// Size: 0x6c
function groundpoundshield_loweronjump(xmodel) {
    self endon("death_or_disconnect");
    self endon("groundPound_unset");
    self endon("groundPoundShield_end");
    self endon("groundPoundShield_deleteShield");
    jumpcur = self isjumping();
    jumpprev = undefined;
    while (true) {
        jumpprev = jumpcur;
        jumpcur = self isjumping();
        if (!jumpprev && jumpcur) {
            thread groundpoundshield_lower(xmodel);
            return;
        }
        waitframe();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa611
// Size: 0x3a
function groundpoundshield_lowerontime(xmodel, time) {
    self endon("death_or_disconnect");
    self endon("groundPound_unset");
    self endon("groundPoundShield_end");
    self endon("groundPoundShield_deleteShield");
    wait time;
    thread groundpoundshield_lower(xmodel);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa653
// Size: 0x5b
function groundpoundshield_loweronleavearea(xmodel) {
    self endon("death_or_disconnect");
    self endon("groundPound_unset");
    self endon("groundPoundShield_end");
    self endon("groundPoundShield_deleteShield");
    while (isdefined(xmodel)) {
        if (lengthsquared(xmodel.origin - self.origin) > 11664) {
            thread groundpoundshield_lower(xmodel);
            return;
        }
        waitframe();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6b6
// Size: 0x2c
function groundpoundshield_deleteondisconnect(xmodel) {
    self endon("groundPoundShield_deleteShield");
    utility::waittill_any_2("death_or_disconnect", "groundPound_unset");
    thread groundpoundshield_deleteshield(xmodel);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6ea
// Size: 0xb
function groundpoundshield_monitorjoinedteam(xmodel) {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6fd
// Size: 0x8a
function groundpoundshield_deleteshield(xmodel) {
    self notify("groundPoundShield_deleteShield");
    outline::outlinedisable(xmodel.visen.outlineid, xmodel.visen);
    outline::outlinedisable(xmodel.visfr.outlineid, xmodel.visfr);
    xmodel.visfr delete();
    xmodel.visen delete();
    xmodel delete();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa78f
// Size: 0x1e
function groundpound_raisefx() {
    self endon("disconnect");
    self endon("groundPound_unset");
    self endon("groundPoundShield_end");
    self endon("groundPoundShield_deleteShield");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7b5
// Size: 0x1e
function groundpoundshield_lowerfx() {
    self endon("disconnect");
    self endon("groundPound_unset");
    self endon("groundPoundShield_end");
    self endon("groundPoundShield_deleteShield");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7db
// Size: 0x66
function groundpoundshield_damagedfx(attacker, point, direction_vec) {
    self endon("disconnect");
    self endon("groundPound_unset");
    self endon("groundPoundShield_end");
    self endon("groundPoundShield_deleteShield");
    playfx(utility::getfx("groundPoundShield_impact"), point, -1 * direction_vec);
    playsoundatpos(point, "ds_shield_impact");
    attacker damagefeedback::updatedamagefeedback("hitbulletstorm");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa849
// Size: 0x1e
function groundpoundshield_breakfx() {
    self endon("disconnect");
    self endon("groundPound_unset");
    self endon("groundPoundShield_end");
    self endon("groundPoundShield_deleteShield");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa86f
// Size: 0x36
function setgroundpoundshock() {
    level._effect["groundPoundShock_impact_sm"] = loadfx("vfx/iw7/_requests/mp/vfx_debug_warning.vfx");
    level._effect["groundPoundShock_impact_lrg"] = loadfx("vfx/iw7/_requests/mp/vfx_debug_warning.vfx");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8ad
// Size: 0xa
function unsetgroundpoundshock() {
    self notify("groundPoundShock_unset");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa8bf
// Size: 0x1ae
function groundpoundshock_onimpact(var_af29b63bc110dcf1) {
    self endon("death_or_disconnect");
    self endon("groundPound_unset");
    self endon("groundPoundShock_unset");
    radius = undefined;
    effectid = undefined;
    switch (var_af29b63bc110dcf1) {
    case #"hash_845a1f955e7fce37": 
        effectid = utility::getfx("groundPoundShock_impact_sm");
        radius = 144;
        break;
    case #"hash_845a1e955e7fcca4": 
        effectid = utility::getfx("groundPoundShock_impact_sm");
        radius = 180;
        break;
    case #"hash_845a21955e7fd15d": 
        effectid = utility::getfx("groundPoundShock_impact_lrg");
        radius = 216;
        break;
    }
    thread groundpoundshock_onimpactfx(radius, effectid);
    enemies = undefined;
    if (level.teambased) {
        enemies = teams::getenemyplayers(self.team, 1);
    } else {
        enemies = level.characters;
    }
    radiussqr = radius * radius;
    contents = trace::create_contents(0, 1, 0, 0, 1, 0, 0);
    foreach (enemy in enemies) {
        if (lengthsquared(enemy geteye() - self geteye()) > radiussqr) {
            continue;
        }
        castresult = physics_raycast(self geteye(), enemy geteye(), contents, undefined, 0, "physicsquery_closest");
        if (isdefined(castresult) && castresult.size > 0) {
            continue;
        }
        thread groundpoundshock_empplayer(enemy);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa75
// Size: 0x36
function groundpoundshock_empplayer(victim) {
    victim endon("death_or_disconnect");
    gamescore::trackdebuffassist(self, victim, "groundpound_mp");
    wait 3;
    if (isdefined(self)) {
        gamescore::untrackdebuffassist(self, victim, "groundpound_mp");
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaab3
// Size: 0x3e
function groundpoundshock_onimpactfx(radius, effectid) {
    playfx(effectid, self.origin + (0, 0, 20), (0, 0, 1));
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaaf9
// Size: 0x2
function setgroundpoundboost() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xab03
// Size: 0xa
function unsetgroundpoundboost() {
    self notify("groundPoundBoost_unset");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xab15
// Size: 0x19
function groundpoundboost_onimpact(var_af29b63bc110dcf1) {
    utility::set_doublejumpenergy(self energy_getmax(0));
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab36
// Size: 0x24
function setbattleslideshield() {
    level._effect["battleSlideShield_damage"] = loadfx("vfx/iw7/_requests/mp/vfx_debug_warning.vfx");
    thread battleslideshield_monitor();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab62
// Size: 0xa
function unsetbattleslideshield() {
    self notify("battleSlideShield_unset");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab74
// Size: 0x37
function battleslideshield_monitor() {
    self endon("death_or_disconnect");
    self endon("battleSlide_unset");
    self notify("battleSlideShield_monitor");
    self endon("battleSlideShield_monitor");
    while (true) {
        self waittill("sprint_slide_begin");
        thread battleslideshield_raise();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabb3
// Size: 0x127
function battleslideshield_monitorhealth(xmodel) {
    self endon("disconnect");
    self endon("battleSlide_unset");
    while (isdefined(xmodel)) {
        damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, weapon = xmodel waittill("damage");
        thread battleslideshield_damagedfx(xmodel, attacker, point, direction_vec);
        if (xmodel.health <= 0) {
            thread battleslideshield_break(xmodel);
            xmodel delete();
            continue;
        }
        if (xmodel.health <= 125) {
            if (xmodel.model != "weapon_shinguard_dam_wm") {
                xmodel setmodel("weapon_shinguard_dam_wm");
            }
            continue;
        }
        if (xmodel.model != "weapon_shinguard_wm") {
            xmodel setmodel("weapon_shinguard_wm");
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xace2
// Size: 0xcc
function battleslideshield_raise() {
    if (isdefined(self.battleslideshield)) {
        thread battleslideshield_lower(self.battleslideshield);
    }
    xmodel = utility::spawn_tag_origin();
    xmodel setmodel("weapon_shinguard_wm");
    xmodel setcandamage(1);
    xmodel.health = 250;
    xmodel linkto(self, "tag_origin", (30, 0, 0), (0, 90, 0));
    xmodel show();
    self.battleslideshield = xmodel;
    thread battleslideshield_killonjumpfall(xmodel);
    thread battleslideshield_killonsprint(xmodel);
    thread battleslideshield_killontime(xmodel);
    thread battleslideshield_unlinkonstop(xmodel);
    thread battleslideshield_monitorhealth(xmodel);
    thread battleslideshield_killondeathdisconnectunset(xmodel);
    thread battleslideshield_raisefx(xmodel);
    return xmodel;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xadb7
// Size: 0x29
function battleslideshield_lower(xmodel) {
    self notify("battleSlideShield_end");
    if (!isdefined(xmodel)) {
        return;
    }
    thread battleslideshield_lowerfx(xmodel);
    xmodel delete();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xade8
// Size: 0x2a
function battleslideshield_killondeathdisconnectunset(xmodel) {
    xmodel endon("death");
    utility::waittill_any_2("death_or_disconnect", "battleSlide_unset");
    xmodel delete();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae1a
// Size: 0x50
function battleslideshield_killonjumpfall(xmodel) {
    self endon("death_or_disconnect");
    self endon("battleSlide_unset");
    self endon("battleSlideShield_unlink");
    self endon("battleSlideShield_end");
    xmodel endon("death");
    while (true) {
        if (!self isonground()) {
            xmodel delete();
            self notify("battleSlideShield_end");
            return;
        }
        waitframe();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae72
// Size: 0x45
function battleslideshield_killonsprint(xmodel) {
    self endon("death_or_disconnect");
    self endon("battleSlide_unset");
    self endon("battleSlideShield_unlink");
    self endon("battleSlideShield_end");
    xmodel endon("death");
    self waittill("sprint_begin");
    xmodel delete();
    self notify("battleSlideShield_end");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaebf
// Size: 0x5b
function battleslideshield_loweronleavearea(xmodel) {
    self endon("death_or_disconnect");
    self endon("battleSlide_unset");
    self endon("battleSlideShield_end");
    xmodel endon("death");
    while (true) {
        if (lengthsquared(xmodel.origin - self.origin) > 11664) {
            thread battleslideshield_lower(xmodel);
            return;
        }
        waitframe();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf22
// Size: 0x36
function battleslideshield_lowerontime(xmodel) {
    self endon("death_or_disconnect");
    self endon("battleSlide_unset");
    self endon("battleSlideShield_end");
    xmodel endon("death");
    wait 3.5;
    thread battleslideshield_lower(xmodel);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf60
// Size: 0x3a
function battleslideshield_unlink(xmodel) {
    if (!isdefined(xmodel)) {
        return;
    }
    xmodel unlink();
    self notify("battleSlideShield_unlink");
    thread battleslideshield_lowerontime(xmodel);
    thread battleslideshield_loweronleavearea(xmodel);
    self notify("battleSlideShield_unlink");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafa2
// Size: 0x4b
function battleslideshield_killontime(xmodel) {
    self endon("death_or_disconnect");
    self endon("battleSlide_unset");
    self endon("battleSlideShield_unlink");
    self endon("battleSlideShield_end");
    xmodel endon("death");
    self waittill("sprint_slide_end");
    wait 0.75;
    xmodel delete();
    self notify("battleSlideShield_end");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaff5
// Size: 0x5a
function battleslideshield_unlinkonstop(xmodel) {
    self endon("death_or_disconnect");
    self endon("battleSlide_unset");
    self endon("battleSlideShield_unlink");
    self endon("battleSlideShield_end");
    xmodel endon("death");
    self waittill("sprint_slide_end");
    while (true) {
        if (lengthsquared(self getvelocity()) < 100) {
            thread battleslideshield_unlink(xmodel);
            return;
        }
        waitframe();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb057
// Size: 0x22
function battleslideshield_break(xmodel) {
    if (!isdefined(xmodel)) {
        return;
    }
    thread battleslideshield_breakfx(xmodel);
    self notify("battleSlideShield_end");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb081
// Size: 0x20
function battleslideshield_raisefx(xmodel) {
    self endon("disconnect");
    self endon("battleSlide_unset");
    xmodel endon("death");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0a9
// Size: 0x20
function battleslideshield_lowerfx(xmodel) {
    self endon("disconnect");
    self endon("battleSlide_unset");
    xmodel endon("death");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0d1
// Size: 0x67
function battleslideshield_damagedfx(xmodel, attacker, point, direction_vec) {
    self endon("disconnect");
    self endon("battleSlide_unset");
    xmodel endon("death");
    playfx(utility::getfx("battleSlideShield_damage"), point, -1 * direction_vec);
    playsoundatpos(point, "ds_shield_impact");
    attacker damagefeedback::updatedamagefeedback("hitbulletstorm");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb140
// Size: 0xb
function battleslideshield_breakfx(xmodel) {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb153
// Size: 0x2
function setbattleslideoffense() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb15d
// Size: 0x2
function unsetbattleslideoffense() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb167
// Size: 0x4
function getbattleslideoffensedamage() {
    return 100;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb174
// Size: 0x3d
function setthruster() {
    level._effect["thrusterRadFr"] = loadfx("vfx/iw7/core/mp/powers/thrust_blast/vfx_thrust_blast_radius_fr");
    level._effect["thrusterRadEn"] = loadfx("vfx/iw7/core/mp/powers/thrust_blast/vfx_thrust_blast_radius_en");
    thrusterwatchdoublejump();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1b9
// Size: 0x26
function unsetthruster() {
    if (isdefined(self.thrustfxent)) {
        self.thrustfxent delete();
    }
    self notify("thruster_unset");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1e7
// Size: 0x37
function thrusterwatchdoublejump() {
    self endon("death_or_disconnect");
    self endon("thruster_unset");
    level endon("game_ended");
    while (true) {
        self waittill("doubleJumpBoostBegin");
        thread thrusterloop();
        thread thrusterdamageloop();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb226
// Size: 0x137
function thrusterloop() {
    self endon("death_or_disconnect");
    self endon("thruster_unset");
    level endon("game_ended");
    self endon("doubleJumpBoostEnd");
    thread thrusterstopfx();
    if (!isdefined(self.thrustfxent)) {
        self.thrustfxent = spawn("script_model", self.origin);
        self.thrustfxent setmodel("tag_origin");
    } else {
        self.thrustfxent.origin = self.origin;
    }
    waitframe();
    for (;;) {
        self playrumbleonentity("damage_light");
        earthquake(0.1, 0.3, self.origin, 120);
        groundposition = playerphysicstrace(self.origin + (0, 0, 10), self.origin - (0, 0, 600)) + (0, 0, 1);
        self.thrustfxent.origin = groundposition;
        self.thrustfxent.angles = (90, 0, 0);
        waitframe();
        wait 0.33;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb365
// Size: 0x52
function thrusterdamageloop() {
    self endon("death_or_disconnect");
    self endon("thruster_unset");
    level endon("game_ended");
    self endon("doubleJumpBoostEnd");
    while (true) {
        damage::radiusplayerdamage(self.origin, 12, 64, 5, 12, self, undefined, "MOD_IMPACT", "thruster_mp", 1);
        wait 0.05;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb3bf
// Size: 0x22
function thrusterstopfx() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    utility::waittill_any_2("doubleJumpBoostEnd", "thruster_unset");
    waitframe();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb3e9
// Size: 0x69
function runhover() {
    self endon("death_or_disconnect");
    self endon("removeArchetype");
    level endon("game_ended");
    while (true) {
        if (self ishighjumping() && self playerads() > 0.3 && self energy_getenergy(0) > 0) {
            executehover();
            thread watchhoverend();
            self waittill("hover_ended");
            endhover();
        }
        wait 0.1;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb45a
// Size: 0x39
function watchhoverend() {
    self endon("death_or_disconnect");
    self endon("removeArchetype");
    level endon("game_ended");
    self endon("walllock_ended");
    while (self playerads() > 0.3) {
        waitframe();
    }
    self notify("hover_ended");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb49b
// Size: 0x60
function executehover() {
    self endon("death_or_disconnect");
    self endon("removeArchetype");
    level endon("game_ended");
    self.ishovering = 1;
    self allowmovement(0);
    self allowjump(0);
    self playlocalsound("ghost_wall_attach");
    org = utility::spawn_tag_origin();
    self playerlinkto(org);
    thread managetimeout(org);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb503
// Size: 0x5c
function managetimeout(org) {
    self endon("death_or_disconnect");
    self endon("removeArchetype");
    level endon("game_ended");
    oldrate = self energy_getrestorerate(0);
    self energy_setrestorerate(0, 1);
    wait 2;
    self notify("hover_ended");
    self energy_setrestorerate(0, oldrate);
    self energy_setenergy(0, 0);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb567
// Size: 0x46
function endhover() {
    self endon("death_or_disconnect");
    self endon("removeArchetype");
    level endon("game_ended");
    self.ishovering = undefined;
    self allowmovement(1);
    self allowjump(1);
    self playlocalsound("ghost_wall_detach");
    self unlink();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5b5
// Size: 0x2
function setadsmarktarget() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb5bf
// Size: 0x116
function perk_adsmarktarget_think() {
    self endon("death_or_disconnect");
    self endon("ADSTargetMarkUnset");
    level endon("game_ended");
    while (true) {
        if (self playerads() > 0.5) {
            foreach (potentialtarget in level.players) {
                if (potentialtarget perk::_hasperk("specialty_noscopeoutline")) {
                    continue;
                }
                if (potentialtarget.team == self.team) {
                    continue;
                }
                if (istrue(potentialtarget.isperk_adsmarked)) {
                    continue;
                }
                if (istrue(potentialtarget.ischeckingadsmarking)) {
                    continue;
                }
                potentialtarget.ischeckingadsmarking = 1;
                thread perk_adstargetmark_disconnectcleanupthink(potentialtarget);
                potentialtarget thread perk_adstargetmark_disconnectcleanupthink(potentialtarget);
                if (perk_adsmarktarget_check(potentialtarget)) {
                    thread perk_adsmarktarget_confirmtargetandmark(potentialtarget);
                    continue;
                }
                potentialtarget.ischeckingadsmarking = 0;
            }
        }
        wait 0.2;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb6dd
// Size: 0x192
function perk_adsmarktarget_check(target) {
    self endon("death_or_disconnect");
    self endon("ADSTargetMarkUnset");
    level endon("game_ended");
    contents = physics_createcontents(["physicscontents_playernosight", "physicscontents_glass", "physicscontents_water", "physicscontents_item", "physicscontents_vehicle"]);
    dist = distance(target.origin, self.origin);
    var_f34da3f94b82b632 = 0;
    if (dist != 0) {
        var_f34da3f94b82b632 = 1000 * 10 / dist;
    }
    targeteye = target geteye();
    if (target.team != self.team && (self worldpointinreticle_circle(target.origin + (0, 0, 24), 90, var_f34da3f94b82b632) || self worldpointinreticle_circle(targeteye, 90, var_f34da3f94b82b632))) {
        caststart = self geteye();
        castend = targeteye;
        var_615161fa74c174f5 = physics_raycast(caststart, castend, contents, undefined, 0, "physicsquery_closest", 1);
        if (isdefined(var_615161fa74c174f5) && var_615161fa74c174f5.size == 0) {
            return true;
        }
        waitframe();
        castend = target.origin + (0, 0, 24);
        var_4b6158e7ccc8b787 = physics_raycast(caststart, castend, contents, undefined, 0, "physicsquery_closest", 1);
        if (isdefined(var_4b6158e7ccc8b787) && var_4b6158e7ccc8b787.size == 0) {
            return true;
        }
    }
    return false;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb878
// Size: 0x13b
function perk_adsmarktarget_confirmtargetandmark(target) {
    target endon("death_or_disconnect");
    level endon("game_ended");
    self endon("ADSTargetMarkUnset");
    outlineid = undefined;
    waittime = getdvarfloat(@"hash_3e533d050b224320");
    if (perk::_hasperk("specialty_improved_target_mark")) {
        waittime *= getdvarfloat(@"hash_9bcdf0887b3696ad");
    }
    wait waittime;
    markheadicon = "hud_icon_new_marked";
    if (entityheadicons::function_6ede573723f08c0f()) {
        markheadicon = "hud_icon_head_marked";
    }
    if (self playerads() > 0.5 && perk_adsmarktarget_check(target)) {
        markedent = spawn("script_model", target.origin);
        markicon = markedent thread entityheadicons::setheadicon_singleimage(getlivingplayers_team(self.team), markheadicon, 35, 1, 5000, 0, undefined, 1);
        outlineid = outline::outlineenableforplayer(target, self, "outlinefill_nodepth_orange", "equipment");
        target outline::_hudoutlineviewmodelenable("outline_nodepth_orange", 0);
        target.isperk_adsmarked = 1;
        thread perk_trackadsmarktargetoutline(markicon, markedent, outlineid, target);
        return;
    }
    target.ischeckingadsmarking = 0;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9bb
// Size: 0xbd
function perk_trackadsmarktargetoutline(markicon, markedent, outlineid, markedplayer) {
    level endon("game_ended");
    wait 0.6;
    outline::outlinedisable(outlineid, markedplayer);
    if (isdefined(markedplayer)) {
        markedplayer outline::_hudoutlineviewmodeldisable();
    }
    markedtimeremaining = getdvarfloat(@"hash_54bdba56629eb6d4");
    if (perk::_hasperk("specialty_improved_target_mark")) {
        markedtimeremaining *= getdvarfloat(@"hash_db82bf037e180634");
    }
    wait markedtimeremaining - 0.6;
    entityheadicons::setheadicon_deleteicon(markicon);
    markedent delete();
    if (isdefined(markedplayer)) {
        markedplayer.isperk_adsmarked = 0;
        markedplayer.ischeckingadsmarking = 0;
    }
    self notify("adsmark_ended");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba80
// Size: 0x98
function getlivingplayers_team(team) {
    players = [];
    foreach (player in level.players) {
        if (!isdefined(player.team)) {
            continue;
        }
        if (player player_utility::_isalive() && player.team == team) {
            players[players.size] = player;
        }
    }
    return players;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb21
// Size: 0x2e
function perk_adstargetmark_disconnectcleanupthink(target) {
    utility::waittill_any_2("ADSTargetMarkUnset", "death_or_disconnect");
    if (isdefined(target)) {
        target.ischeckingadsmarking = 0;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb57
// Size: 0xa
function unsetadsmarktarget() {
    self notify("ADSTargetMarkUnset");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb69
// Size: 0x2
function sethelmet() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb73
// Size: 0x2
function unsethelmet() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb7d
// Size: 0xc
function setarmorvest() {
    self.tookvesthit = 0;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb91
// Size: 0x2
function unsetarmorvest() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb9b
// Size: 0x14
function setdoorbreach() {
    destructible::allowplayertobreach(self);
    door::updatealldoorslockvisibilityforplayer(self, 1);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbbb7
// Size: 0xa
function unsetdoorbreach() {
    destructible::allowplayertobreach(self);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbbc9
// Size: 0x32
function setdoorsense() {
    if (!isdefined(level.playerswithdoorsense)) {
        level.playerswithdoorsense = 1;
        return;
    }
    level.playerswithdoorsense += 1;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc03
// Size: 0x17
function unsetdoorsense() {
    level.playerswithdoorsense -= 1;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc22
// Size: 0x9
function setworsenedgunkick() {
    updateweaponkick();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc33
// Size: 0xb
function unsetworsenedgunkick() {
    updateweaponkick(1);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc46
// Size: 0xca
function updateweaponkick(var_d32e25e546898f0f) {
    if (!isdefined(self.weaponkickrecoil)) {
        self.weaponkickrecoil = 0;
    }
    recoil = -25;
    if (perk::_hasperk("specialty_worsenedgunkick") && !istrue(var_d32e25e546898f0f)) {
        if (isdefined(self.currentweapon)) {
            switch (self.currentweapon.classname) {
            case #"hash_8cdaf2e4ecfe5b51": 
                recoil = -20;
                break;
            case #"hash_fa24dff6bd60a12d": 
                recoil = -20;
                break;
            }
        }
    } else {
        recoil = 0;
    }
    if (recoil != self.weaponkickrecoil) {
        weapon::setrecoilscale(-1 * self.weaponkickrecoil);
        weapon::setrecoilscale(recoil);
        self.weaponkickrecoil = recoil;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd18
// Size: 0xb1
function setkillstreaktoscorestreak() {
    if (killstreak_utility::function_9f1dc821e9a8506()) {
        return;
    }
    newpoints = undefined;
    if (isdefined(self.pers["killstreakToScorestreak_lifeId"]) && self.pers["killstreakToScorestreak_lifeId"] == self.lifeid) {
        newpoints = self.pers["killstreakToScorestreak"];
        self.pers["killstreakToScorestreak"] = undefined;
        self.pers["killstreakToScorestreak_lifeId"] = undefined;
    } else {
        newpoints = killstreaktoscorestreak_killtoscore(self.streakpoints);
    }
    killstreaks::updatestreakcosts();
    killstreaks::setstreakpoints(newpoints);
    killstreaks::checkstreakreward(self.streakpoints);
    killstreaks::updatestreakmeterui();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdd1
// Size: 0x7e
function unsetkillstreaktoscorestreak() {
    if (killstreak_utility::function_9f1dc821e9a8506()) {
        return;
    }
    self.pers["killstreakToScorestreak"] = self.streakpoints;
    self.pers["killstreakToScorestreak_lifeId"] = self.lifeid;
    newpoints = killstreaktoscorestreak_scoretokill(self.streakpoints);
    killstreaks::updatestreakcosts();
    killstreaks::setstreakpoints(newpoints);
    killstreaks::checkstreakreward(self.streakpoints);
    killstreaks::updatestreakmeterui();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe57
// Size: 0xf
function killstreaktoscorestreak_killtoscore(streakpoints) {
    return streakpoints * 125;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe6f
// Size: 0x14
function killstreaktoscorestreak_scoretokill(streakpoints) {
    return int(streakpoints / 125);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe8c
// Size: 0x22
function setchainkillstreaks() {
    if (self.streakpoints <= 0) {
        self.pers["canKillChain"] = 1;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbeb6
// Size: 0x1e
function unsetchainkillstreaks() {
    if (!istrue(level.gameended)) {
        self.pers["canKillChain"] = undefined;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbedc
// Size: 0x24
function setscrapweapons() {
    if (getdvarint(@"hash_eb1e94069d5150f2") == 1) {
        self setclientomnvar("ui_graverobber", 1);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf08
// Size: 0xf
function unsetscrapweapons() {
    self setclientomnvar("ui_graverobber", 0);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf1f
// Size: 0x16
function setdooralarm() {
    self.alarmeddoors = [];
    door::updatealldoorsalarmvisibilityforplayer(self, 1);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf3d
// Size: 0x6b
function unsetdooralarm() {
    foreach (alarmeddoor in self.alarmeddoors) {
        alarmeddoor door::removealarmdoor(0);
    }
    self.alarmeddoors = undefined;
    door::updatealldoorsalarmvisibilityforplayer(self, 0);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbfb0
// Size: 0xa
function setreviveuseweapon() {
    thread proximityrevivethink();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbfc2
// Size: 0x39a
function proximityrevivethink() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("unset_revive_use_weapon");
    if (!isdefined(self.proximityrevivefauxtrigger)) {
        var_d72d6d8c00a1b78f = spawnstruct();
        var_d72d6d8c00a1b78f.usetime = getdvarfloat(@"hash_6f08a22fd52e004c") * dvars::getwatcheddvar("lastStandReviveTimer");
        var_d72d6d8c00a1b78f.curprogress = 0;
        var_d72d6d8c00a1b78f.owner = undefined;
        var_d72d6d8c00a1b78f.id = "laststand_reviver";
        var_d72d6d8c00a1b78f.trigger = spawnstruct();
        var_d72d6d8c00a1b78f.trigger.id = "laststand_reviver";
        self.proximityrevivefauxtrigger = var_d72d6d8c00a1b78f;
    }
    var_d72d6d8c00a1b78f = self.proximityrevivefauxtrigger;
    if (!isdefined(self.hiddenreviveents)) {
        self.hiddenreviveents = [];
    }
    self.canrevivewithweapon = 1;
    if (isdefined(level.revivetriggers)) {
        foreach (entnum, ent in level.revivetriggers) {
            if (!isdefined(self.hiddenreviveents[entnum])) {
                ent.trigger disableplayeruse(self);
                self.hiddenreviveents[entnum] = ent.trigger;
            }
        }
    }
    foreach (entnum, ent in level.laststandreviveents) {
        if (!isdefined(self.hiddenreviveents[entnum])) {
            ent disableplayeruse(self);
            self.hiddenreviveents[entnum] = ent;
        }
    }
    while (true) {
        players = player::getplayersinradius(self.origin, 150, self.team, self);
        foreach (player in players) {
            if (istrue(player.inlaststand) && !istrue(player.stuckinlaststand) && !istrue(player.laststandhealisactive) && !istrue(player player::getbeingrevivedinternal()) && !isdefined(var_d72d6d8c00a1b78f.owner)) {
                thread proximityrevive(player, var_d72d6d8c00a1b78f);
            }
        }
        if (isdefined(level.revivetriggers)) {
            foreach (useent in level.revivetriggers) {
                if (useent.ownerteam == self.team) {
                    if (!istrue(useent.trigger.owner player::getbeingrevivedinternal()) && !isdefined(var_d72d6d8c00a1b78f.owner)) {
                        if (distancesquared(useent.trigger.origin, self.origin) <= 22500) {
                            thread proximityrevive(useent.trigger.owner, var_d72d6d8c00a1b78f, useent);
                        }
                    }
                }
            }
        }
        wait 0.1;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc364
// Size: 0x1f1
function proximityrevive(player, var_d72d6d8c00a1b78f, reviveent) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("unset_revive_use_weapon");
    player endon("death_or_disconnect");
    player endon("last_stand_finished");
    player player::setbeingrevivedinternal(1);
    var_d72d6d8c00a1b78f.owner = player;
    var_d72d6d8c00a1b78f.trigger.owner = player;
    thread watchproximityrevivefail(player, var_d72d6d8c00a1b78f, reviveent);
    if (isdefined(reviveent)) {
        reviveent.trigger hide();
        reviveent.trigger makeunusable();
        reviveent teamrevive::revivetriggerholdonusebegin(self, 1);
    } else if (isdefined(player.laststandreviveent)) {
        player.laststandreviveent hide();
        player.laststandreviveent makeunusable();
    }
    player notify("handle_revive_message");
    player player::_freezecontrols(1, undefined, "proximityRevive");
    while (var_d72d6d8c00a1b78f.curprogress < var_d72d6d8c00a1b78f.usetime) {
        if (distancesquared(self.origin, player.origin) > 90000) {
            self notify("prox_revive_fail");
            return;
        }
        gameobjects::updateuiprogress(var_d72d6d8c00a1b78f, 1);
        var_d72d6d8c00a1b78f.curprogress += level.framedurationseconds;
        waitframe();
    }
    gameobjects::updateuiprogress(var_d72d6d8c00a1b78f, 0);
    player gameobjects::updateuiprogress(var_d72d6d8c00a1b78f, 0);
    player player::_freezecontrols(0, undefined, "proximityRevive");
    var_d72d6d8c00a1b78f.curprogress = 0;
    var_d72d6d8c00a1b78f.owner = undefined;
    var_d72d6d8c00a1b78f.trigger.owner = undefined;
    if (istrue(player.inlaststand)) {
        player notify("last_stand_revived");
        return;
    }
    reviveent teamrevive::revivetriggerholdonuseend(self.team, self, 1, 1);
    reviveent teamrevive::revivetriggerholdonuse(self);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc55d
// Size: 0x13a
function watchproximityrevivefail(player, var_d72d6d8c00a1b78f, reviveent) {
    level endon("game_ended");
    player endon("last_stand_revived");
    player endon("spawned_player");
    team = player.team;
    waittill_any_ents_return(self, "death_or_disconnect", self, "unset_revive_use_weapon", self, "prox_revive_fail", player, "death_or_disconnect", player, "last_stand_finished");
    if (isdefined(reviveent)) {
        reviveent.trigger show();
        reviveent.trigger makeusable();
        reviveent teamrevive::revivetriggerholdonuseend(team, self, 0, 1);
    }
    if (isdefined(player)) {
        player player::setbeingrevivedinternal(0);
        player gameobjects::updateuiprogress(var_d72d6d8c00a1b78f, 0);
        player player::_freezecontrols(0, undefined, "proximityRevive");
        if (isdefined(player.laststandreviveent)) {
            player.laststandreviveent show();
            player.laststandreviveent makeusable();
        }
        player notify("handle_revive_message");
    }
    if (isdefined(self)) {
        var_d72d6d8c00a1b78f.owner = undefined;
        var_d72d6d8c00a1b78f.trigger.owner = undefined;
        var_d72d6d8c00a1b78f.curprogress = 0;
        gameobjects::updateuiprogress(var_d72d6d8c00a1b78f, 0);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc69f
// Size: 0x87
function unsetreviveuseweapon() {
    self notify("unset_revive_use_weapon");
    self.canrevivewithweapon = undefined;
    foreach (ent in self.hiddenreviveents) {
        if (isdefined(ent) && ent.owner != self) {
            ent showtoplayer(self);
            ent enableplayeruse(self);
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc72e
// Size: 0x2
function setlocationmarking() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc738
// Size: 0x2
function unsetlocationmarking() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc742
// Size: 0x2
function setremotedefuse() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc74c
// Size: 0x2
function unsetremotedefuse() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc756
// Size: 0x9
function setalwaysminimap() {
    player::showminimap();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc767
// Size: 0x9
function unsetalwaysminimap() {
    player::hideminimap();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc778
// Size: 0x36
function supersprintkillrefresh_init() {
    level._effect["super_sprint_refresh"] = loadfx("vfx/iw8_mp/perk/vfx_hustle.vfx");
    level._effect["super_sprint_refresh_night"] = loadfx("vfx/iw8_mp/perk/vfx_hustle_night.vfx");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc7b6
// Size: 0x9
function supersprintkillrefresh_onkill() {
    self refreshsprinttime();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc7c7
// Size: 0x13
function setgasgrenaderesist() {
    if (player_utility::_isalive()) {
        return;
    }
    gas_grenade::gas_updateplayereffects();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc7e2
// Size: 0x13
function unsetgasgrenaderesist() {
    if (player_utility::_isalive()) {
        return;
    }
    gas_grenade::gas_updateplayereffects();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc7fd
// Size: 0x2
function setfastreloadlaunchers() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc807
// Size: 0x25
function unsetfastreloadlaunchers() {
    if (istrue(self.fastreloadlaunchers)) {
        perk::removeperk("specialty_fastreload");
        self.fastreloadlaunchers = undefined;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc834
// Size: 0x13
function setreduceregendelay() {
    playerhealth::function_5457f0107a845374("setReduceRegenDelay_perks", 1);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc84f
// Size: 0xe
function unsetreduceregendelay() {
    playerhealth::function_4f8b5efd1816f6c3("setReduceRegenDelay_perks");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc865
// Size: 0xab
function regendelayreduce_onkill() {
    var_39e91d553a7e0c6c = game_utility::function_d2d2b803a7b741a4();
    var_35592968b84e0d = self isnightvisionon();
    var_efcad1fd61529517 = var_39e91d553a7e0c6c && var_35592968b84e0d;
    fx = utility::ter_op(var_efcad1fd61529517, utility::getfx("super_sprint_refresh_night"), utility::getfx("super_sprint_refresh"));
    playfxontagforclients(fx, self, "tag_eye", self);
    if (self.health < 100) {
        if (_hasperk("specialty_compression_carrier")) {
            perks::activatePerk("specialty_compression_carrier");
        } else {
            perks::activatePerk("specialty_quick_fix");
        }
    }
    thread regendelayreduce_delayedregen();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc918
// Size: 0xa
function regenonkill() {
    self notify("force_regeneration");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc92a
// Size: 0x32
function regendelayreduce_delayedregen() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self notify("regenDelayReduce_delayedRegen");
    self endon("regenDelayReduce_delayedRegen");
    playerhealth::function_5457f0107a845374("regenDelayReduce_delayedRegen", 1, 140);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc964
// Size: 0x29
function setreduceregendelayonkill() {
    if (isdefined(self.lastgunkilltime) && self.lastgunkilltime == gettime()) {
        regendelayreduce_onkill();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc995
// Size: 0x2
function unsetreduceregendelayonkill() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc99f
// Size: 0x11
function setreduceregendelayonobjective() {
    updatereduceregendelayonobjective();
    thread monitorreduceregendelayonobjective();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9b8
// Size: 0x13
function unsetreduceregendelayonobjective() {
    self notify("unsetReduceRegenDelayOnObjective");
    updatereduceregendelayonobjective(1);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9d3
// Size: 0x2c
function monitorreduceregendelayonobjective() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("unsetReduceRegenDelayOnObjective");
    while (true) {
        wait 0.5;
        updatereduceregendelayonobjective();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca07
// Size: 0x176
function updatereduceregendelayonobjective(forceoff) {
    var_d8688e5e358c46e8 = isdefined(self.carryobject);
    touchinggameobject = isdefined(self.touchinggameobjects) && self.touchinggameobjects.size > 0;
    usinggameobject = isdefined(self.usinggameobjects) && self.usinggameobjects.size > 0;
    var_a3833434882e5f = var_d8688e5e358c46e8 || touchinggameobject || usinggameobject;
    atfullhealth = self.health / self.maxhealth >= 1;
    if (var_a3833434882e5f && !atfullhealth && !istrue(forceoff)) {
        if (!istrue(self.isonobjective)) {
            var_39e91d553a7e0c6c = scripts\cp_mp\utility\game_utility::function_d2d2b803a7b741a4();
            var_35592968b84e0d = self isnightvisionon();
            var_efcad1fd61529517 = var_39e91d553a7e0c6c && var_35592968b84e0d;
            fx = ter_op(var_efcad1fd61529517, getfx("super_sprint_refresh_night"), getfx("super_sprint_refresh"));
            playfxontagforclients(fx, self, "tag_eye", self);
            self.isonobjective = 1;
            perk::giveperk("specialty_regen_delay_reduced");
            activatePerk("specialty_quick_fix");
        }
        return;
    }
    if (istrue(self.isonobjective)) {
        self.isonobjective = 0;
        perk::removeperk("specialty_regen_delay_reduced");
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb85
// Size: 0x31
function setrechargeequipment() {
    if (!isdefined(level.perkrechargeequipmentplayers)) {
        return;
    }
    self notify("setRechargeEquipment");
    level.perkrechargeequipmentplayers = utility::array_add(level.perkrechargeequipmentplayers, self);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbbe
// Size: 0x32
function unsetrechargeequipment() {
    if (!isdefined(level.perkrechargeequipmentplayers)) {
        return;
    }
    level.perkrechargeequipmentplayers = utility::array_remove(level.perkrechargeequipmentplayers, self);
    thread rechargeequipment_clearplayer(self);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbf8
// Size: 0xfc
function rechargeequipmentthink_init() {
    level.perkrechargeequipmentplayers = [];
    var_bb293d0be6d94bb = int(ceil(0.5 / level.framedurationseconds));
    while (true) {
        var_b8009f31b1522792 = level.perkrechargeequipmentplayers;
        var_e9a4c83bb773349 = int(ceil(var_b8009f31b1522792.size / var_bb293d0be6d94bb));
        for (frameindex = 0; frameindex < var_bb293d0be6d94bb; frameindex++) {
            for (playerindex = 0; playerindex < var_e9a4c83bb773349; playerindex++) {
                globalplayerindex = frameindex * var_e9a4c83bb773349 + playerindex;
                if (globalplayerindex > var_b8009f31b1522792.size) {
                    break;
                }
                player = var_b8009f31b1522792[globalplayerindex];
                if (!isdefined(player)) {
                    continue;
                }
                if (!player player_utility::_isalive() || istrue(player.inlaststand) || istrue(self.stuckinlaststand)) {
                    continue;
                }
                rechargeequipment_updatestate(player);
            }
            waitframe();
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xccfc
// Size: 0x7b
function rechargeequipment_updatestate(player) {
    if (!isdefined(player.rechargeequipmentstate)) {
        player.rechargeequipmentstate = spawnstruct();
        player.rechargeequipmentstate.progress = [];
        player.rechargeequipmentstate.recharged = [];
    }
    rechargeequipment_updateslot(player, "primary");
    rechargeequipment_updateslot(player, "secondary");
    rechargeequipment_updateui(player);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd7f
// Size: 0x222
function rechargeequipment_updateslot(player, slot) {
    state = player.rechargeequipmentstate;
    if (!isdefined(state.progress[slot])) {
        state.progress[slot] = 0;
    }
    state.recharged[slot] = undefined;
    equipment = player equipment::getcurrentequipment(slot);
    if (!isdefined(equipment)) {
        return;
    }
    if (player _hasperk("specialty_ninja_vest")) {
        validequipment = 0;
        if (slot == "secondary") {
            return;
        }
        if (issubstr(equipment, "throwing_knife") || issubstr(equipment, "throwstar") || issubstr(equipment, "shuriken")) {
            validequipment = 1;
        }
        if (!validequipment) {
            return;
        }
    }
    ammo = player equipment::getequipmentammo(equipment);
    ammomax = player equipment::getequipmentmaxammo(equipment);
    startammo = player equipment::getequipmentstartammo(equipment);
    if (isdefined(level.gamemodeoverriderestockrechargeperupdate)) {
        var_f4f42766799eae36 = level.gamemodeoverriderestockrechargeperupdate;
    } else {
        var_f4f42766799eae36 = utility::ter_op(game_utility::isbrstylegametype(), 0.01, 0.02);
    }
    if (slot == "secondary" && ammo < ammomax && startammo > 1) {
        state.progress[slot] = state.progress[slot] + var_f4f42766799eae36 * 2;
    } else if (ammo < ammomax) {
        state.progress[slot] = state.progress[slot] + var_f4f42766799eae36;
    } else {
        state.progress[slot] = 0;
    }
    if (state.progress[slot] > 1 || abs(state.progress[slot] - 1) < 0.001) {
        player equipment::incrementequipmentslotammo(slot, 1);
        state.progress[slot] = 0;
        state.recharged[slot] = 1;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcfa9
// Size: 0x2d
function rechargeequipment_clearplayer(player) {
    player endon("setRechargeEquipment");
    player endon("disconnect");
    player.rechargeequipmentstate = undefined;
    waitframe();
    rechargeequipment_updateui(player);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcfde
// Size: 0x1ab
function rechargeequipment_updateui(player) {
    lethalprogress = 0;
    tacticalprogress = 0;
    var_7732b71eb53c0af1 = -1;
    if (isdefined(player) && isdefined(player.rechargeequipmentstate)) {
        player stats::initpersstat("restockCount");
        state = player.rechargeequipmentstate;
        if (isdefined(state.progress["primary"])) {
            lethalprogress = state.progress["primary"];
        }
        if (isdefined(state.progress["secondary"])) {
            tacticalprogress = state.progress["secondary"];
        }
        foreach (slot, _ in state.recharged) {
            if (slot == "primary") {
                var_7732b71eb53c0af1 += 1;
                player playlocalsound("ui_restock_lethals");
                player stats::incpersstat("restockCount", 1);
            }
            if (slot == "secondary") {
                var_7732b71eb53c0af1 += 2;
                player playlocalsound("ui_restock_tactical");
                player stats::incpersstat("restockCount", 1);
            }
        }
    }
    player setclientomnvar("ui_lethal_recharge_progress", lethalprogress);
    player setclientomnvar("ui_tactical_recharge_progress", tacticalprogress);
    player setclientomnvar("ui_recharge_notify", var_7732b71eb53c0af1);
    player setpowerprogress("primary", lethalprogress);
    player setpowerprogress("secondary", tacticalprogress);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd191
// Size: 0x130
function markequipment_monitorlook() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("mark_equip_ended");
    flags::gameflagwait("prematch_done");
    if (!isdefined(self.markequipmentstate)) {
        self.markequipmentstate = spawnstruct();
        self.markequipmentstate.markingtime = 0;
        self.markequipmentstate.markingent = undefined;
        self.markequipmentstate.markedents = [];
        self.markequipmentstate.markedentindex = 0;
        self.markequipmentstate.pastmarkedents = [];
        self.markequipmentstate.pastmarkedentindex = 0;
    }
    while (true) {
        ent = self waittill("marks_target_changed");
        startmarking = isdefined(ent) && !isdefined(self.markequipmentstate.markingent);
        self.markequipmentstate.markingent = ent;
        self.markequipmentstate.markingtime = 0;
        if (startmarking) {
            thread markequipment_updatestate();
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd2c9
// Size: 0x523
function markequipment_updatestate() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("mark_equip_ended");
    lasttime = gettime();
    maxdist = 0;
    if (self entityhasmark("air_killstreak", self.markequipmentstate.markingent)) {
        maxdist = getdvarint(@"hash_1641bba59e207f8e");
    } else if (self entityhasmark("killstreak", self.markequipmentstate.markingent)) {
        maxdist = getdvarint(@"hash_26ab663a769726a9");
    } else if (self entityhasmark("equipment", self.markequipmentstate.markingent)) {
        maxdist = getdvarint(@"hash_6a6e4f9ae2a2a1");
    } else {
        assert(0, "Marking Ent did not belong to one of these mark groups. Are we not taking one into account?");
    }
    maxdistsqrd = maxdist * maxdist;
    while (isdefined(self.markequipmentstate.markingent) && !istrue(self.ishacking)) {
        if (self entitymarkfilteredin(self.markequipmentstate.markingent)) {
            break;
        }
        if (isdefined(self.vehicle) && self.vehicle == self.markequipmentstate.markingent) {
            break;
        }
        if (scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_occupantisvehicledriver(self) && !self function_a7de57196f4b5d16()) {
            break;
        }
        if (distancesquared(self.origin, self.markequipmentstate.markingent.origin) > maxdistsqrd) {
            break;
        }
        currenttime = gettime();
        deltatime = currenttime - lasttime;
        self.markequipmentstate.markingtime += deltatime;
        if (!utility::array_contains(self.markequipmentstate.markedents, self.markequipmentstate.markingent)) {
            if (player::isplayerads()) {
                markindex = self.markequipmentstate.markedentindex;
                ent = self.markequipmentstate.markedents[markindex];
                if (isdefined(ent)) {
                    ent filterinplayermarks(undefined);
                    outlinehelper_updateentityoutline(ent);
                }
                if (level.teambased) {
                    self.markequipmentstate.markingent filterinplayermarks(self.team);
                } else {
                    self.markequipmentstate.markingent filterinplayermarks(self);
                }
                outlinehelper_updateentityoutline(self.markequipmentstate.markingent);
                self playlocalsound("iw8_mp_perk_tactical_recon_marked");
                if (level.teambased && vehicle_compass::vehicle_compass_instanceisregistered(self.markequipmentstate.markingent)) {
                    self.markequipmentstate.markingent.teammarkedfor = self.team;
                    players = teams::getteamdata(self.markequipmentstate.markingent.teammarkedfor, "players");
                    foreach (player in players) {
                        vehicle_compass::vehicle_compass_updatevisibilityforplayer(self.markequipmentstate.markingent, player);
                    }
                }
                self.markequipmentstate.markedents[markindex] = self.markequipmentstate.markingent;
                self.markequipmentstate.markedentindex = (markindex + 1) % 999;
                if (!utility::array_contains(self.markequipmentstate.pastmarkedents, self.markequipmentstate.markingent)) {
                    killstreaks::givescoreformarktarget(1);
                    self.markequipmentstate.pastmarkedents[self.markequipmentstate.pastmarkedentindex] = self.markequipmentstate.markingent;
                    self.markequipmentstate.pastmarkedentindex++;
                } else {
                    killstreaks::givescoreformarktarget(0);
                }
                thread unmarkafterduration(self.markequipmentstate.markingent);
                break;
            }
        }
        lasttime = currenttime;
        waitframe();
    }
    if (!istrue(self.ishacking)) {
        self setclientomnvar("ui_securing", 0);
        self setclientomnvar("ui_securing_progress", 0);
    }
    self.markequipmentstate.markingent = undefined;
    self.markequipmentstate.markingtime = 0;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd7f4
// Size: 0x5c
function unmarkafterduration(markedent) {
    level endon("game_ended");
    self endon("mark_equip_ended");
    self endon("unmarkEnt_" + self getentitynumber());
    markedent endon("death");
    timeoutduration = getdvarint(@"hash_6a381b8385734e4e");
    utility::waittill_any_timeout_no_endon_death_1(timeoutduration, "disconnect");
    unmarkent(markedent);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd858
// Size: 0xf5
function unmarkent(markedent) {
    markedent filterinplayermarks(undefined);
    if (isdefined(markedent.teammarkedfor)) {
        if (level.teambased && vehicle_compass::vehicle_compass_instanceisregistered(markedent)) {
            players = teams::getteamdata(markedent.teammarkedfor, "players");
            foreach (player in players) {
                vehicle_compass::vehicle_compass_updatevisibilityforplayer(markedent, player);
            }
        }
        markedent.teammarkedfor = undefined;
    }
    if (isdefined(self)) {
        self.markequipmentstate.markedents = utility::array_remove(self.markequipmentstate.markedents, markedent);
        markedent notify("unmarkEnt_" + self getentitynumber());
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd955
// Size: 0x1e
function setmarkequipment() {
    if (!level.teambased) {
        return;
    }
    self enabletargetmarks();
    thread markequipment_monitorlook();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd97b
// Size: 0x99
function unsetmarkequipment() {
    if (!level.teambased) {
        return;
    }
    if (isdefined(self.markequipmentstate)) {
        foreach (ent in self.markequipmentstate.markedents) {
            if (isdefined(ent)) {
                unmarkent(ent);
            }
        }
    }
    self.markequipmentstate = undefined;
    self disabletargetmarks();
    self notify("mark_equip_ended");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda1c
// Size: 0x33
function getchildoutlineents(ent) {
    if (!isdefined(ent)) {
        return [];
    }
    if (!isdefined(ent.childoutlineents)) {
        return [ent];
    }
    return ent.childoutlineents;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda58
// Size: 0x1c
function outlinehelper_getallplayers(ent, outlinedata) {
    return level.players;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda7d
// Size: 0xd
function outlinehelper_validplayer(player) {
    return true;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda93
// Size: 0xb6
function outlinehelper_verifydata(outlinedata) {
    assert(isdefined(outlinedata));
    if (!isdefined(outlinedata.getplayers)) {
        outlinedata.getplayers = &outlinehelper_getallplayers;
    }
    if (!isdefined(outlinedata.validplayer)) {
        outlinedata.validplayer = &outlinehelper_validplayer;
    }
    if (!isdefined(outlinedata.hudoutlineassetname)) {
        outlinedata.hudoutlineassetname = "spotter_notarget";
    }
    if (!isdefined(outlinedata.prioritygroup)) {
        outlinedata.prioritygroup = "perk";
    }
    if (!isdefined(outlinedata.waittime)) {
        outlinedata.waittime = 0.1;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb51
// Size: 0x31
function outlinehelper_updateentityoutline(ent) {
    if (isdefined(ent)) {
        entitynum = ent getentitynumber();
        outlinehelper_disableentityoutline(entitynum);
        outlinehelper_enableentityoutline(ent);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb8a
// Size: 0x30b
function outlinehelper_enableentityoutline(ent) {
    if (!isdefined(ent)) {
        return;
    }
    entitynum = ent getentitynumber();
    entitydata = self.entityoutlines[entitynum];
    if (isdefined(entitydata)) {
        return;
    }
    outlinedata = undefined;
    if (self entitymarkfilteredin(ent)) {
        outlinedata = spawnstruct();
        outlinedata.prioritygroup = "perk_superior";
        outlinedata.hudoutlineassetname = "spotter_target";
        outlinehelper_verifydata(outlinedata);
    }
    ismarked = self entitymarkfilteredin(ent);
    if (self entityhasmark("air_killstreak", ent)) {
        if (!isdefined(ent.model)) {
            return;
        }
        outlinedata = spawnstruct();
        if (ismarked) {
            outlinedata.prioritygroup = "perk_superior";
            outlinedata.hudoutlineassetname = "spotter_target_killstreak_air";
        } else {
            outlinedata.prioritygroup = "perk";
            outlinedata.hudoutlineassetname = "spotter_notarget_killstreak_air";
        }
        outlinehelper_verifydata(outlinedata);
    } else if (self entityhasmark("killstreak", ent)) {
        if (!isdefined(ent.model)) {
            return;
        }
        outlinedata = spawnstruct();
        if (ismarked) {
            outlinedata.prioritygroup = "perk_superior";
            outlinedata.hudoutlineassetname = "spotter_target_killstreak";
        } else {
            outlinedata.prioritygroup = "perk";
            outlinedata.hudoutlineassetname = "spotter_notarget_killstreak";
        }
        outlinehelper_verifydata(outlinedata);
    } else if (self entityhasmark("equipment", ent)) {
        outlinedata = spawnstruct();
        if (ismarked) {
            outlinedata.prioritygroup = "perk_superior";
            outlinedata.hudoutlineassetname = "spotter_target_equipment";
        } else {
            outlinedata.prioritygroup = "perk";
            outlinedata.hudoutlineassetname = "spotter_notarget_equipment";
        }
        outlinehelper_verifydata(outlinedata);
    }
    if (isdefined(outlinedata)) {
        entitydata = spawnstruct();
        self.entityoutlines[entitynum] = entitydata;
        entitydata.list = [];
        entitydata.ent = ent;
        childents = getchildoutlineents(ent);
        foreach (child in childents) {
            entoutlineid = outlineenableforplayer(child, self, outlinedata.hudoutlineassetname, outlinedata.prioritygroup);
            outline = spawnstruct();
            outline.ent = child;
            outline.id = entoutlineid;
            childnum = child getentitynumber();
            entitydata.list[childnum] = outline;
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde9d
// Size: 0xa2
function outlinehelper_disableentityoutline(entnum) {
    if (isdefined(entnum)) {
        entitydata = self.entityoutlines[entnum];
        if (isdefined(entitydata)) {
            foreach (outline in entitydata.list) {
                outline::outlinedisable(outline.id, outline.ent);
            }
            self.entityoutlines[entnum] = undefined;
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf47
// Size: 0x90
function markedentities_removeentsbyindex(entarray, var_223829bbefc81935) {
    var_5877436cc451fa7d = [];
    foreach (ent in entarray) {
        if (!isdefined(ent)) {
            continue;
        }
        entnum = ent getentitynumber();
        if (!utility::array_contains(var_223829bbefc81935, entnum)) {
            var_5877436cc451fa7d[var_5877436cc451fa7d.size] = ent;
        }
    }
    return var_5877436cc451fa7d;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdfe0
// Size: 0x1d7
function markedentities_think() {
    self endon("disconnect");
    level endon("game_ended");
    self.entityoutlines = [];
    while (true) {
        var_b56ac8b012f37095, var_7b50cc9c94be9505, var_c5dda6b7a37d4129 = self waittill("marks_changed");
        if (isdefined(var_b56ac8b012f37095)) {
            foreach (var_e0abeaa6ef08e178 in var_b56ac8b012f37095) {
                outlinehelper_disableentityoutline(var_e0abeaa6ef08e178);
            }
            if (isdefined(self.markequipmentstate)) {
                self.markequipmentstate.markedents = markedentities_removeentsbyindex(self.markequipmentstate.markedents, var_b56ac8b012f37095);
                if (self.markequipmentstate.markedentindex > self.markequipmentstate.markedents.size) {
                    self.markequipmentstate.markedentindex = self.markequipmentstate.markedents.size;
                }
            }
        }
        if (isdefined(var_7b50cc9c94be9505)) {
            foreach (var_4905d157180507c8 in var_7b50cc9c94be9505) {
                outlinehelper_disableentityoutline(var_4905d157180507c8);
            }
        }
        if (isdefined(var_c5dda6b7a37d4129)) {
            foreach (addedent in var_c5dda6b7a37d4129) {
                outlinehelper_enableentityoutline(addedent);
            }
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe1bf
// Size: 0x2
function setbettermissionrewards() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe1c9
// Size: 0x2
function unsetbettermissionrewards() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe1d3
// Size: 0x19
function setspecialistbonus() {
    if (!game_utility::isbrstylegametype()) {
        self setclientomnvar("ui_specialist_bonus_active", 1);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe1f4
// Size: 0x18
function unsetspecialistbonus() {
    if (!game_utility::isbrstylegametype()) {
        self setclientomnvar("ui_specialist_bonus_active", 0);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe214
// Size: 0x14
function setthirdpersonmode() {
    self.perkthirdperson = 1;
    class::setthirdpersonview();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe230
// Size: 0x20
function function_fbd953549be66251() {
    self.perkthirdperson = undefined;
    if (!istrue(level.gameended)) {
        class::setthirdpersonview();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe258
// Size: 0x15
function function_d31614685fb778e1() {
    self notify("undying");
    self.undying = 1;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe275
// Size: 0x14
function function_62e54942c53b9bda() {
    self notify("undyingEnd");
    self.undying = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe291
// Size: 0x10
function function_7cfa6000210cbd68() {
    self setclientomnvar("ui_overcharge", 2);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2a9
// Size: 0xf
function function_f1a813fe1b8a2275() {
    self setclientomnvar("ui_overcharge", 0);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2c0
// Size: 0xa
function function_6faff35e3a38ba5f() {
    thread function_28c65ef144ef09ed();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2d2
// Size: 0x2
function function_d02ed6d205e7eb64() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2dc
// Size: 0x2
function setsurvivor() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2e6
// Size: 0x2
function unsetsurvivor() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2f0
// Size: 0xe0
function function_17f9b8d5579b7e98() {
    if (game_utility::isbrstylegametype()) {
        if (getdvarint(@"hash_8c032d1b63113ba0", 0) != 0) {
            return;
        }
        self.var_678855513f5076ca = 1;
        self.var_514192f8282796c = getdvarint(@"hash_5873a982b260e538", 1);
        self.overclockcharge = 0;
        superammo = equipment::getequipmentslotammo("super");
        if (isdefined(supers::getcurrentsuper()) && isdefined(superammo) && superammo > 0) {
            if (function_66f0cbd5ff8458fe()) {
                equipment::setequipmentslotammo("super", 0);
                supers::givesuperpoints(supers::getsuperpointsneeded(), undefined, undefined, undefined, 1);
            }
        } else if (isdefined(supers::getcurrentsuper())) {
            self setclientomnvar("ui_perk_package_state", 3);
        }
    } else if (!isdefined(self.overclockcharge)) {
        self.overclockcharge = 0;
    }
    thread function_e382d4a17c2fd280();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3d8
// Size: 0x73
function function_66f0cbd5ff8458fe() {
    assert(isplayer(self));
    currentsuper = supers::getcurrentsuper();
    if (!isdefined(currentsuper)) {
        return false;
    }
    if (level.allowsupers && !game_utility::isbrstylegametype()) {
        return true;
    }
    if (!istrue(self.var_678855513f5076ca)) {
        return false;
    }
    if (supers::function_f95bcca44e8cba53(currentsuper.staticdata.ref)) {
        return false;
    }
    return true;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe454
// Size: 0xd2
function function_448448ac4206d715() {
    if (isdefined(self.var_2c0bf62a8db71fd0)) {
        self.var_2c0bf62a8db71fd0 = undefined;
    }
    if (isdefined(self.var_491f93d0219d8d44) && self.var_491f93d0219d8d44 > 1) {
        self.var_491f93d0219d8d44 -= 1;
    }
    if (game_utility::isbrstylegametype()) {
        if (isdefined(supers::getcurrentsuper())) {
            supers::function_8c7b1312cf5986b(0);
            if (supers::getcurrentsuperpoints() < supers::getsuperpointsneeded()) {
                if (!supers::issuperinuse()) {
                    supers::setsuperbasepoints(0);
                    thread supers::function_e648b6fc93bbc0e0();
                    self setclientomnvar("ui_perk_package_state", 0);
                }
            }
        }
    }
    if (isdefined(self.var_678855513f5076ca)) {
        self.var_678855513f5076ca = undefined;
    }
    if (isdefined(self.var_514192f8282796c)) {
        self.var_514192f8282796c = undefined;
    }
    self notify("end_overcharge_field_upgrade");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe52e
// Size: 0x92
function function_e382d4a17c2fd280() {
    self endon("death_or_disconnect");
    self endon("end_overcharge_field_upgrade");
    while (!isdefined(self.var_678855513f5076ca)) {
        self waittill("super_use_charging");
        waitframe();
        if (self.super.isinuse) {
            continue;
        }
        if (!function_66f0cbd5ff8458fe()) {
            continue;
        }
        if (self.overclockcharge > 0 && supers::issupercharging()) {
            supers::givesuperpoints(self.overclockcharge, undefined, undefined, undefined, 1);
            self.overclockcharge = 0;
            self setclientomnvar("ui_super_second_progress", 0);
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe5c8
// Size: 0x15
function function_28c65ef144ef09ed() {
    self endon("death_or_disconnect");
    waitframe();
    armor::givestartingarmor(50, 1);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe5e5
// Size: 0x4e
function function_6964a0e0e8d00b09(perk) {
    if (!istrue(level.var_606eb45e074ff204)) {
        return;
    }
    switch (perk) {
    case #"hash_53b0051b1bb90222": 
        function_c0480a308e322f5e();
        break;
    case #"hash_f3b391e08ecec3c1": 
        function_deaae24be7f66b43();
        break;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe63b
// Size: 0x59
function function_f1aded34ad0d8d15() {
    super = supers::getcurrentsuper();
    if (!isdefined(super)) {
        return false;
    }
    if (!isdefined(super.basepoints)) {
        return false;
    }
    if (!isdefined(super.extrapoints)) {
        return false;
    }
    if (!isdefined(super.staticdata.pointsneeded)) {
        return false;
    }
    return true;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe69d
// Size: 0xa9
function function_c0480a308e322f5e() {
    if (!function_f1aded34ad0d8d15()) {
        return;
    }
    currentpoints = ter_op(supers::issuperready() || supers::issuperinuse(), supers::getsuperpointsneeded(), supers::getcurrentsuperpoints());
    maxpoints = supers::getsuperpointsneeded();
    overchargepoints = max(0, maxpoints - currentpoints);
    supers::givesuperpoints(supers::getsuperpointsneeded());
    self.overclockcharge = clamp(currentpoints, 0, maxpoints);
    if (!isdefined(self.var_491f93d0219d8d44)) {
        self.var_491f93d0219d8d44 = 1;
    }
    self.var_491f93d0219d8d44 += 1;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe74e
// Size: 0x18
function function_deaae24be7f66b43() {
    triggerportableradarping(self.origin, self, 3000, 3000);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe76e
// Size: 0x26
function function_5574429fa21b6a4b() {
    self.pers["hasEarnedHardlineStreak"] = 0;
    killstreaks::givestreakpoints(#"hash_faa043c8926419e6", 3, 0);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe79c
// Size: 0x60
function function_de2e2e90e60ab20b() {
    equipment = self getweaponslistoffhands();
    foreach (item in equipment) {
        self givemaxammo(item);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe804
// Size: 0x13
function function_649944f83a9270f1() {
    killstreaks::awardkillstreak("scrambler_drone_guard", "other");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe81f
// Size: 0xa9
function function_9569d64cd3471640() {
    playertargets = utility::function_2d7fd59d039fa69b(self.origin, 3000);
    outlinedata = snapshot_grenade::snapshot_grenade_createoutlinedata(self, self.origin);
    foreach (player in playertargets) {
        if (!player::isreallyalive(player)) {
            continue;
        }
        if (!player_utility::playersareenemies(self, player)) {
            continue;
        }
        snapshot_grenade::snapshot_grenade_applysnapshot(player, self, outlinedata, 2500, 1);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe8d0
// Size: 0x2b
function function_2afcfd10baa613f4() {
    if (perk::_hasperk("specialty_armored") && self getammocount("bandage_br") < 1) {
        armor::function_9c6e9a6643b6c9a6(1);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe903
// Size: 0xae
function setanteup() {
    self notify("setAnteUp_singleton");
    self endon("setAnteUp_singleton");
    self endon("death_or_disconnect");
    if (istrue(self.gettingloadout)) {
        self waittill("giveLoadout");
    }
    bundle = level.perkbundles["specialty_ante_up"];
    points = utility::default_to(bundle.var_6ad84838e108705a, 0);
    if (!istrue(self.var_606b2fb83bfcb7d1) && isdefined(self.streakpoints)) {
        events::killeventtextpopup(#"ante_up", 0);
        killstreaks::setstreakpoints(self.streakpoints + points);
        self.var_606b2fb83bfcb7d1 = 1;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9b9
// Size: 0x70
function function_22483f0bf514320b() {
    bundle = level.perkbundles["specialty_ante_up"];
    points = utility::default_to(bundle.var_6ad84838e108705a, 0);
    if (istrue(self.var_606b2fb83bfcb7d1) && isdefined(self.streakpoints)) {
        killstreaks::setstreakpoints(self.streakpoints - points);
        self.var_606b2fb83bfcb7d1 = 0;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea31
// Size: 0xa
function function_f20745ab641c4bb7() {
    thread function_72c65d09b47dfda1();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea43
// Size: 0x84
function function_6df29935c2b4318c() {
    self notify("unset_high_gain_antenna");
    if (self.var_78ede70519cfb53b.size > 0) {
        var_17f63f0b03e2f03d = self.var_78ede70519cfb53b;
        self.var_78ede70519cfb53b = [];
        foreach (player in var_17f63f0b03e2f03d) {
            player notify("disable_high_gain_effect");
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeacf
// Size: 0x1f4
function function_72c65d09b47dfda1() {
    self endon("disconnect");
    self endon("unset_high_gain_antenna");
    level endon("game_ended");
    if (!isdefined(self.var_78ede70519cfb53b)) {
        self.var_78ede70519cfb53b = [];
    }
    while (true) {
        if (!player::isreallyalive(self)) {
            if (self.var_78ede70519cfb53b.size > 0) {
                var_17f63f0b03e2f03d = self.var_78ede70519cfb53b;
                self.var_78ede70519cfb53b = [];
                foreach (player in var_17f63f0b03e2f03d) {
                    player notify("disable_high_gain_effect");
                }
            }
            wait 0.2;
            continue;
        }
        var_17f63f0b03e2f03d = self.var_78ede70519cfb53b;
        var_7bc1965cd73d3522 = player::getplayersinradius(self.origin, 700, self.team, self);
        self.var_78ede70519cfb53b = var_7bc1965cd73d3522;
        foreach (player in var_17f63f0b03e2f03d) {
            if (!isdefined(player)) {
                continue;
            }
            if (utility::array_contains(var_7bc1965cd73d3522, player)) {
                continue;
            }
            player notify("disable_high_gain_effect");
        }
        foreach (player in var_7bc1965cd73d3522) {
            if (!isdefined(player)) {
                continue;
            }
            if (utility::array_contains(var_17f63f0b03e2f03d, player)) {
                continue;
            }
            if (!player perk::_hasperk("specialty_high_gain_antenna")) {
                player perk::giveperk("specialty_expanded_minimap");
                player perk::giveperk("specialty_acousticSensor");
                player thread function_771a3235fe378b71(self);
            }
        }
        wait 0.2;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeccb
// Size: 0xc4
function function_f0acc19bc9f58105(equipment) {
    if (!isdefined(self.var_e9414cc5514761a7)) {
        self.var_e9414cc5514761a7 = [];
    }
    self.var_e9414cc5514761a7 = utility::function_6d6af8144a5131f1(self.var_e9414cc5514761a7, equipment);
    if (!isdefined(self.var_4c0c7df045f13ed0) || !isdefined(self.var_4c0c7df045f13ed0["specialty_signal_jammer"])) {
        return;
    }
    foreach (player in self.var_4c0c7df045f13ed0["specialty_signal_jammer"]) {
        namespace_6c8a837ec98fe0b8::objective_playermask_addshowplayer(equipment.var_50d8a278fa3d1ddd, player);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed97
// Size: 0xd5
function function_6cf221eaa466443b(equipment) {
    if (isdefined(self.var_e9414cc5514761a7) && isdefined(equipment)) {
        self.var_e9414cc5514761a7 = utility::array_remove(self.var_e9414cc5514761a7, equipment);
    }
    if (!isdefined(self.var_4c0c7df045f13ed0) || !isdefined(self.var_4c0c7df045f13ed0["specialty_signal_jammer"])) {
        return;
    }
    foreach (player in self.var_4c0c7df045f13ed0["specialty_signal_jammer"]) {
        if (isdefined(equipment) && isdefined(equipment.var_50d8a278fa3d1ddd)) {
            namespace_6c8a837ec98fe0b8::objective_playermask_hidefrom(equipment.var_50d8a278fa3d1ddd, player);
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xee74
// Size: 0x8e
function function_d3a88fbbd1592a94(var_d1a37ff59732b305) {
    if (!isdefined(self.var_e9414cc5514761a7)) {
        return;
    }
    foreach (equipment in self.var_e9414cc5514761a7) {
        if (isdefined(equipment) && isdefined(equipment.var_50d8a278fa3d1ddd)) {
            namespace_6c8a837ec98fe0b8::objective_playermask_addshowplayer(equipment.var_50d8a278fa3d1ddd, var_d1a37ff59732b305);
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xef0a
// Size: 0x7e
function function_14887aa48f755651(equipmentlist) {
    if (!isdefined(equipmentlist)) {
        return;
    }
    foreach (equipment in equipmentlist) {
        if (isdefined(equipment) && isdefined(equipment.var_50d8a278fa3d1ddd)) {
            namespace_6c8a837ec98fe0b8::objective_playermask_hidefrom(equipment.var_50d8a278fa3d1ddd, self);
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef90
// Size: 0x1aa
function function_771a3235fe378b71(player) {
    self notify("monitoring_expanded_minimap");
    self endon("monitoring_expanded_minimap");
    if (!isdefined(self.var_27d9a2d112e4a5b2)) {
        self.var_27d9a2d112e4a5b2 = [];
    }
    self.var_27d9a2d112e4a5b2[self.var_27d9a2d112e4a5b2.size] = player;
    while (true) {
        result = utility::waittill_any_return_2("death_or_disconnect", "disable_high_gain_effect");
        if (!isdefined(result) || result == "death_or_disconnect") {
            perk::removeperk("specialty_expanded_minimap");
            perk::removeperk("specialty_acousticSensor");
            self.var_27d9a2d112e4a5b2 = [];
            return;
        }
        if (result == "disable_high_gain_effect") {
            if (self.var_27d9a2d112e4a5b2.size == 1) {
                perk::removeperk("specialty_expanded_minimap");
                perk::removeperk("specialty_acousticSensor");
                self.var_27d9a2d112e4a5b2 = [];
                return;
            }
            if (isdefined(self) && isdefined(self.var_78ede70519cfb53b)) {
                foreach (player in self.var_27d9a2d112e4a5b2) {
                    if (!(isdefined(player) && isdefined(player.var_78ede70519cfb53b))) {
                        continue;
                    }
                    if (utility::array_contains(player.var_78ede70519cfb53b, self)) {
                        continue;
                    }
                    self.var_27d9a2d112e4a5b2 = utility::array_remove(self.var_27d9a2d112e4a5b2, player);
                }
                if (self.var_27d9a2d112e4a5b2.size == 0) {
                    perk::removeperk("specialty_expanded_minimap");
                    perk::removeperk("specialty_acousticSensor");
                    return;
                }
            }
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf142
// Size: 0x64
function function_eed479acba7fe853() {
    if (getdvarint(@"hash_a93a2419d7580413", 0) == 1) {
        return;
    }
    self.var_9d84a996d9e90c2 = 0;
    self.var_1df3276704659646 = 0;
    function_1d114ca0c1f73008(0);
    function_b287c9114a845cee(0);
    playernum = self getentitynumber();
    level.var_52ec346520cb321c[playernum] = self;
    self.var_5dcd6d4ac51be6d5 = [];
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf1ae
// Size: 0xa
function function_98c1ad957058c942() {
    thread function_e41537546ebf302a();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf1c0
// Size: 0x70
function function_e41537546ebf302a() {
    self endon("disconnect");
    self.var_9d84a996d9e90c2 = undefined;
    self.var_1df3276704659646 = undefined;
    self.var_caeaabdc03ba4508 = undefined;
    self.var_5dcd6d4ac51be6d5 = undefined;
    self.var_df81db1ae87349f2 = undefined;
    self notify("removeLRDetector");
    playernum = self getentitynumber();
    level.var_52ec346520cb321c[playernum] = undefined;
    waitframe();
    function_1d114ca0c1f73008(0);
    function_b287c9114a845cee(0);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf238
// Size: 0x36
function function_83091d5e2028334f() {
    playernum = self getentitynumber();
    level.var_ff7ad25f9727ddc4[playernum] = self;
    level.delayminetime = 1.5;
    function_3f33157318043ac2(0);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf276
// Size: 0x26
function function_1e8369c15351446a() {
    playernum = self getentitynumber();
    level.var_ff7ad25f9727ddc4[playernum] = undefined;
    function_3f33157318043ac2(0);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2a4
// Size: 0x32
function function_76e4f570efdfa175() {
    if (!isdefined(self.var_d0205933322679a9)) {
        self.var_d0205933322679a9 = 1;
        return;
    }
    self.var_d0205933322679a9 += 1;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2de
// Size: 0x41
function function_9a193d97b9a9b860() {
    if (!isdefined(self.var_d0205933322679a9)) {
        return;
    }
    if (self.var_d0205933322679a9 > 1) {
        self.var_d0205933322679a9 -= 1;
        return;
    }
    self.var_d0205933322679a9 = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf327
// Size: 0xa
function function_7051260539f7f5cf() {
    thread armor::function_c49eb6797b9eec64();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf339
// Size: 0xa
function function_d98540c03eb44f92() {
    self notify("armor_regen_end");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf34b
// Size: 0x180
function function_de6e36b06bd630c4(pickupent, fromkiosk, var_db943473454f6ea6, backpackequip) {
    var_9aa3334c23f7c3bb = armor::function_ac266fc218266d08();
    var_29f26361d277c4c8 = level.var_4b78859bacc88808;
    var_7ab9a8f132665d68 = self.maxarmorhealth;
    var_a81e45534563d02a = int(var_7ab9a8f132665d68 / var_29f26361d277c4c8);
    if (pickupent.count > 0 && var_9aa3334c23f7c3bb < var_7ab9a8f132665d68) {
        var_a86307ef44894749 = 0;
        var_aed59370e8ac080f = var_7ab9a8f132665d68 - var_9aa3334c23f7c3bb;
        if (var_aed59370e8ac080f <= var_29f26361d277c4c8) {
            var_a86307ef44894749 = 1;
        } else {
            var_a86307ef44894749 = ceil(var_aed59370e8ac080f / var_29f26361d277c4c8);
        }
        if (var_a86307ef44894749 == pickupent.count) {
            pickupent.count = 0;
            armor::setArmorHealth(var_7ab9a8f132665d68);
            return 0;
        } else if (var_a86307ef44894749 < pickupent.count) {
            pickupent.count -= var_a86307ef44894749;
            armor::setArmorHealth(var_7ab9a8f132665d68);
            pickupremains = br_pickups::takeequipmentpickup(pickupent, fromkiosk, var_db943473454f6ea6, backpackequip);
            return pickupremains;
        } else {
            var_7349319252d8e770 = min(pickupent.count * var_29f26361d277c4c8, var_7ab9a8f132665d68);
            pickupent.count = 0;
            armor::setArmorHealth(var_7349319252d8e770);
            return 0;
        }
        return;
    }
    pickupremains = br_pickups::takeequipmentpickup(pickupent, fromkiosk, var_db943473454f6ea6, backpackequip);
    return pickupremains;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4d3
// Size: 0xc3
function function_c5d5909e07c87005(armor) {
    var_9aa3334c23f7c3bb = armor::function_ac266fc218266d08();
    var_29f26361d277c4c8 = level.var_4b78859bacc88808;
    var_7ab9a8f132665d68 = self.maxarmorhealth;
    var_a81e45534563d02a = int(var_7ab9a8f132665d68 / var_29f26361d277c4c8);
    if (var_9aa3334c23f7c3bb < var_7ab9a8f132665d68) {
        var_a86307ef44894749 = 0;
        var_aed59370e8ac080f = var_7ab9a8f132665d68 - var_9aa3334c23f7c3bb;
        if (var_aed59370e8ac080f <= var_29f26361d277c4c8) {
            var_a86307ef44894749 = 1;
        } else {
            var_a86307ef44894749 = ceil(var_aed59370e8ac080f / var_29f26361d277c4c8);
        }
        if (var_a86307ef44894749 == 1) {
            armor::setArmorHealth(var_7ab9a8f132665d68);
            return true;
        } else {
            var_7349319252d8e770 = min(var_29f26361d277c4c8, var_7ab9a8f132665d68);
            armor::setArmorHealth(var_7349319252d8e770);
            return true;
        }
    }
    return false;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf59f
// Size: 0x57
function setdurability() {
    healthscale = getdvarfloat(@"hash_295c99a0f67c5f7d", 1.5);
    self.maxhealth = int(healthscale * float(letweakables::gettweakablevalue("player", "maxhealth")));
    self.health = self.maxhealth;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf5fe
// Size: 0x1b
function unsetdurability() {
    self.maxhealth = tweakables::gettweakablevalue("player", "maxhealth");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf621
// Size: 0x43
function function_a85e18c43231438d() {
    speedboost = getdvarfloat(@"hash_94084550cb0f64e7", 2);
    self.var_a100e03b8bb95214 = self.movespeedscaler;
    self.movespeedscaler = speedboost;
    weapons::updatemovespeedscale();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf66c
// Size: 0x25
function function_b9186877a86e12f0() {
    self.movespeedscaler = self.var_a100e03b8bb95214;
    self.var_a100e03b8bb95214 = undefined;
    weapons::updatemovespeedscale();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf699
// Size: 0xa1
function setoperative() {
    if (!isdefined(self.var_892c291c8eec8af2)) {
        self.var_892c291c8eec8af2 = 0;
        return;
    }
    if (istrue(self.var_892c291c8eec8af2)) {
        return;
    }
    thread function_b2219a25a144067();
    self notify("setoperative_outlines");
    if (istrue(self.gettingloadout)) {
        self endon("setoperative_outlines");
        self endon("death_or_disconnect");
        self waittill("giveLoadout");
    }
    bundle = level.perkbundles["specialty_operative"];
    buffduration = utility::default_to(bundle.var_ffe863e741796294, 0);
    setoperativeoutlines();
    function_4030b0cbd934f9c(buffduration);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf742
// Size: 0x2a
function function_b2219a25a144067() {
    self notify("resetOperativeSingleton");
    self endon("resetOperativeSingleton");
    self endon("disconnect");
    self waittill("death");
    self.var_892c291c8eec8af2 = 0;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf774
// Size: 0xad
function setoperativeoutlines() {
    self.var_892c291c8eec8af2 = 1;
    if (!isdefined(self.var_4920729d2bb168e6)) {
        self.var_4920729d2bb168e6 = [];
    }
    foreach (enemy in level.players) {
        if (!isplayer(enemy)) {
            continue;
        }
        if (!player_utility::isenemy(enemy)) {
            continue;
        }
        self.var_4920729d2bb168e6[enemy getentitynumber()] = outline::outlineenableforplayer(enemy, self, "outline_nodepth_red", "level_script");
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf829
// Size: 0xcd
function function_4030b0cbd934f9c(delaytime) {
    if (!isarray(self.var_4920729d2bb168e6)) {
        return;
    }
    if (delaytime) {
        self endon("setoperative_outlines");
        self endon("death_or_disconnect");
        wait delaytime;
    }
    foreach (enemy in level.players) {
        if (!isplayer(enemy)) {
            continue;
        }
        if (!player_utility::isenemy(enemy)) {
            continue;
        }
        enemyentnum = enemy getentitynumber();
        if (!isdefined(self.var_4920729d2bb168e6[enemyentnum])) {
            continue;
        }
        outline::outlinedisable(self.var_4920729d2bb168e6[enemyentnum], enemy);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8fe
// Size: 0xa
function unsetoperative() {
    function_4030b0cbd934f9c(0);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf910
// Size: 0xd
function setoverwatch() {
    self.radarshowenemydirection = 1;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf925
// Size: 0x4b
function unsetoverwatch() {
    if (isdefined(level.activeadvanceduavs) && isdefined(level.activeadvanceduavs[self.team]) && level.activeadvanceduavs[self.team] > 0) {
        return;
    }
    self.radarshowenemydirection = 0;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf978
// Size: 0x1b
function function_af3d35751dfd4e79() {
    if (game_utility::isbrstylegametype()) {
        return undefined;
    }
    return ["specialty_expanded_minimap"];
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf99b
// Size: 0xe
function function_81f0718f6c5ab1d7() {
    self setgrenadethrowscale(1.25);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9b1
// Size: 0xb
function function_2bba0e9e144c276c() {
    self setgrenadethrowscale(1);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9c4
// Size: 0x59
function function_e2df669ada6f810c() {
    bundle = level.perkbundles["specialty_scavenger"];
    var_d86975024a74ba6c = isdefined(bundle) && istrue(bundle.var_a17534d1b2c3f881);
    if (!var_d86975024a74ba6c && perk::_hasperk("specialty_scavenger_equipment")) {
        perks::_unsetperk("specialty_scavenger_equipment");
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa25
// Size: 0xd7
function function_76826219412c80ce() {
    bundle = level.perkbundles["specialty_flak_jacket"];
    if (!isdefined(bundle) && perk::_hasperk("specialty_flak_jacket")) {
        perks::_unsetperk("specialty_flak_jacket");
        return;
    }
    if (isdefined(self.flakjackethealth)) {
        if (self.flakjackethealth <= 0) {
            function_bbfb43eded941446();
        }
        return;
    }
    self.flakjackethealth = utility::default_to(bundle.var_ae4892e2f1bb4145, 200);
    self.var_8cbe63a199e19de = utility::default_to(bundle.var_8cbe63a199e19de, 50);
    self.var_fb1106d94cc95901 = utility::default_to(bundle.var_fb1106d94cc95901, 50);
    self.var_567daf189be4de79 = utility::default_to(bundle.var_13d115cb3cbfd2d0, 0);
    function_576ff7cb2b682b18();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb04
// Size: 0x31
function function_2a071b7e5d0351d3() {
    self.flakjackethealth = undefined;
    self.var_8ddde3a19b245a2 = undefined;
    self.var_fb21fed94cdb51c5 = undefined;
    self.var_567daf189be4de79 = undefined;
    function_8a6140b305c1b22b();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb3d
// Size: 0x10
function initflakjacket() {
    damagefeedback::function_7bc7c3983cef0956("hitFlakJacket", 20);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfb55
// Size: 0x67
function function_21ec07ce4e600c3a(amount) {
    startinghealth = self.flakjackethealth;
    self.flakjackethealth += amount;
    if (startinghealth <= 0 && self.flakjackethealth > 0) {
        perks::_setperk("specialty_blastshield");
        perks::_setperk("specialty_fire_resistence");
        function_576ff7cb2b682b18();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfbc4
// Size: 0x38
function function_576ff7cb2b682b18() {
    self notify("flakJacket_Singleton");
    self endon("flakJacket_Singleton");
    self setclientomnvar("ui_flakJacket", 1);
    thread function_46990aae5ce032ad();
    self notify("blast_shield_damaged", self.flakjackethealth);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc04
// Size: 0x17
function function_8a6140b305c1b22b() {
    self setclientomnvar("ui_flakJacket", 0);
    self notify("blast_shield_removed");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc23
// Size: 0x43
function function_46990aae5ce032ad() {
    self endon("death_or_disconnect");
    self endon("blast_shield_removed");
    while (true) {
        remaining = self waittill("blast_shield_damaged");
        self setclientomnvar("ui_flakJacket_health", int(max(remaining, 0)));
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc6e
// Size: 0x4c
function function_df1f464b16738e76() {
    bundle = level.perkbundles["specialty_flak_jacket"];
    if (!isdefined(bundle)) {
        return;
    }
    if (isdefined(self.var_fb21fed94cdb51c5)) {
        return;
    }
    self.var_fb21fed94cdb51c5 = utility::default_to(bundle.var_fb21fed94cdb51c5, 50);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfcc2
// Size: 0xc
function function_9a3330b21e0ad027() {
    self.var_fb21fed94cdb51c5 = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfcd6
// Size: 0x10
function breakflakjacket() {
    function_bbfb43eded941446();
    function_8a6140b305c1b22b();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfcee
// Size: 0x1a
function function_bbfb43eded941446() {
    perks::_unsetperk("specialty_blastshield");
    perks::_unsetperk("specialty_fire_resistence");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd10
// Size: 0x2
function function_c834f1eacbb06d09() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd1a
// Size: 0x2
function function_b35c8cf5dd0e38a2() {
    
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd24
// Size: 0x26
function function_57fa0386e81eaf33() {
    self.radarshowenemydirection = 1;
    if (scripts\mp\utility\game::getsubgametype() == "dmz") {
        level thread overlord::function_aea00c3815b226da(self);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd52
// Size: 0x78
function function_4173e65571fbfd44() {
    if (!isdefined(self) || !isdefined(self.team)) {
        return 0;
    }
    if (scripts\mp\utility\game::getsubgametype() == "dmz") {
        self notify("monitor_enemy_prox");
    }
    if (isdefined(level.activeadvanceduavs) && isdefined(level.activeadvanceduavs[self.team]) && level.activeadvanceduavs[self.team] > 0) {
        return;
    }
    self.radarshowenemydirection = 0;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfdd2
// Size: 0x1a
function function_4ca1864c4b501d86() {
    return ceil(self.maxarmorhealth / (namespace_f8d3520d3483c1::function_829e435158d419cf() - 1));
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfdf5
// Size: 0x24
function function_f307e70927a22f9e() {
    self.var_42294cc94c3bf2c3 = &function_4ca1864c4b501d86;
    self.var_cc09658e840807ae = 1;
    namespace_f8d3520d3483c1::setarmoromnvars(1);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe21
// Size: 0x1f
function function_618d9ea3d5fd1a77() {
    self.var_42294cc94c3bf2c3 = undefined;
    self.var_cc09658e840807ae = undefined;
    namespace_f8d3520d3483c1::setarmoromnvars(1);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe48
// Size: 0xd
function function_7603aadd14da7ec6() {
    self.hasplatepouch = 1;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe5d
// Size: 0xc
function function_6af20073381a18d3() {
    self.hasplatepouch = 0;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe71
// Size: 0xa
function function_da3d9f34d24ac85a() {
    namespace_27c74152ccb91331::function_f70b3ce9138e10b(self);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe83
// Size: 0x21
function function_96f59fefd781e47() {
    if (!getdvarint(@"hash_18bf04d5c5766462")) {
        return;
    }
    namespace_27c74152ccb91331::function_2cc0d17b7e641e00(self, "announcer");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfeac
// Size: 0x21
function function_96f5afefd78207a() {
    if (!getdvarint(@"hash_18bf04d5c5766462")) {
        return;
    }
    namespace_27c74152ccb91331::function_2cc0d17b7e641e00(self, "robot");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfed5
// Size: 0x21
function function_96f5bfefd7822ad() {
    if (!getdvarint(@"hash_18bf04d5c5766462")) {
        return;
    }
    namespace_27c74152ccb91331::function_2cc0d17b7e641e00(self, "hypeman");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfefe
// Size: 0x21
function function_96f54fefd781348() {
    if (!getdvarint(@"hash_18bf04d5c5766462")) {
        return;
    }
    namespace_27c74152ccb91331::function_2cc0d17b7e641e00(self, "blackcell");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff27
// Size: 0xf
function function_fc6e0b02abb995cb() {
    namespace_27c74152ccb91331::function_2cc0d17b7e641e00(self, "announcer");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff3e
// Size: 0xf
function function_73e4ae4f932e9f30() {
    namespace_27c74152ccb91331::function_2cc0d17b7e641e00(self, "robot");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff55
// Size: 0xc0
function function_53e56fe3fd9ad3e1() {
    if (isdefined(level.nvgvisionsetoverride) && isstring(level.nvgvisionsetoverride)) {
        visionsetnight(level.nvgvisionsetoverride);
    } else {
        self visionsetnightforplayer(function_1564f9bd3b0b6974());
        self visionsetthermalforplayer("flir_2_color_gradient", 100);
    }
    if (!isdefined(self.pers["killstreak_forcedNVGOff"])) {
        self.pers["killstreak_forcedNVGOff"] = 0;
    }
    thread function_f45b32f9e7bc9d8d(0);
    thread function_a13126ffa1e84c59(2);
    self notifyonplayercommand("nods_button_down", "+usereload");
    self notifyonplayercommand("nods_button_up", "-usereload");
    self notifyonplayercommand("nods_kbm_button", "nightvision");
    thread function_4a6d4f51c86333c8();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1001d
// Size: 0x68
function function_d23fd2ceae84da28() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self notify("nods_removed");
    self notifyonplayercommandremove("nods_button_down", "+usereload");
    self notifyonplayercommandremove("nods_button_up", "-usereload");
    self notifyonplayercommandremove("nods_kbm_button", "nightvision");
    if (istrue(self.pers["useNVG"])) {
        wait 1;
        function_5de0156e74e1a721();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1008d
// Size: 0xe2
function function_1564f9bd3b0b6974() {
    value = getdvarint(@"hash_35d51fe231a93ba9", 0);
    visionset = undefined;
    switch (value) {
    case 0: 
        visionset = "nvg_base_mp";
        break;
    case 1: 
        visionset = "flir_2_color_gradient";
        break;
    case 2: 
        visionset = "nvg_base_color_nods_jup_test";
        break;
    case 3: 
        visionset = "nvg_base_color_nods_jup_test_02";
        break;
    case 4: 
        visionset = "nvg_base_color_nods_jup_test_03";
        break;
    case 5: 
        visionset = "nvg_base_color_nods_jup_test_04";
        break;
    case 6: 
        visionset = "nvg_base_color_nods_jup_test_05";
        break;
    default: 
        visionset = "nvg_base_mp";
        break;
    }
    return visionset;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10178
// Size: 0x84
function function_4a6d4f51c86333c8() {
    self endon("death_or_disconnect");
    self endon("nods_removed");
    while (true) {
        result = utility::waittill_any_return_2("nods_button_down", "nods_kbm_button");
        if (result == "nods_kbm_button" && !self usinggamepad()) {
            function_5de0156e74e1a721();
            wait 1;
            continue;
        }
        if (result == "nods_button_down") {
            result = utility::waittill_any_timeout_1(0.5, "nods_button_up");
        }
        if (result != "nods_button_up") {
            function_5de0156e74e1a721();
            wait 1;
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10204
// Size: 0x14a
function function_5de0156e74e1a721() {
    if (self isonladder() || self ishanging() || self isthrowinggrenade()) {
        return;
    }
    if (isdefined(level.nvgvisionsetoverride) && isstring(level.nvgvisionsetoverride)) {
        visionsetnight(level.nvgvisionsetoverride);
    } else {
        self visionsetnightforplayer(function_1564f9bd3b0b6974());
        self visionsetthermalforplayer("flir_2_color_gradient", 100);
    }
    var_463eede85943f8d1 = getdvarint(@"hash_787fb71bbd471c11", 3);
    if (istrue(self.pers["useNVG"])) {
        self notify("perk_nods_off");
        if (var_463eede85943f8d1 == 0 || var_463eede85943f8d1 == 3) {
            self nightvisionviewoff();
            thread function_f45b32f9e7bc9d8d(0);
            if (var_463eede85943f8d1 == 3) {
                thread function_c5f054586f38e212(0.5);
            }
        } else if (var_463eede85943f8d1 == 1) {
            player_utility::setthermalvision(0);
        }
        function_4c1282555bf1a747();
        return;
    }
    thread function_187253ccc9a3b3d3();
    if (var_463eede85943f8d1 == 0 || var_463eede85943f8d1 == 3) {
        self nightvisionviewon();
        thread function_f45b32f9e7bc9d8d(1);
        if (var_463eede85943f8d1 == 3) {
            thread function_a2668409a49bdef4(0.6);
        }
    } else if (var_463eede85943f8d1 == 1) {
        player_utility::setthermalvision(1, 12, 1000);
    }
    function_4c1282555bf1a747();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10356
// Size: 0x62
function function_4c1282555bf1a747() {
    if (!istrue(self.pers["useNVG"])) {
        self.pers["useNVG"] = 1;
        return;
    }
    if (istrue(self.pers["useNVG"]) && !istrue(self.pers["killstreak_forcedNVGOff"])) {
        self.pers["useNVG"] = 0;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x103c0
// Size: 0x83
function function_a13126ffa1e84c59(delay, var_b34a1ff2f59f1fe7) {
    if (!istrue(game["flags"]["prematch_done"])) {
        flags::gameflagwait("prematch_done");
    }
    wait delay;
    time = 4;
    if (isdefined(var_b34a1ff2f59f1fe7) && (isint(var_b34a1ff2f59f1fe7) || isfloat(var_b34a1ff2f59f1fe7))) {
        time = var_b34a1ff2f59f1fe7;
    }
    if (self usinggamepad()) {
        thread print::tutorialprint(%JUP_PERKS/NODS_PRESS_TO_USE, time);
        return;
    }
    thread print::tutorialprint(%JUP_PERKS/NODS_PRESS_TO_USE_KB, time);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1044b
// Size: 0x70
function function_187253ccc9a3b3d3() {
    self endon("perk_nods_off");
    self waittill("death_or_disconnect");
    self notify("perk_nods_off_death");
    var_463eede85943f8d1 = getdvarint(@"hash_787fb71bbd471c11", 0);
    if (var_463eede85943f8d1 == 0 || var_463eede85943f8d1 == 3) {
        self nightvisionviewoff();
        waitframe();
        if (var_463eede85943f8d1 == 3) {
            function_c5f054586f38e212();
        }
    } else if (var_463eede85943f8d1 == 1) {
        player_utility::setthermalvision(0);
    }
    function_4c1282555bf1a747();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x104c3
// Size: 0xbe
function function_f45b32f9e7bc9d8d(enabled) {
    if (getdvarint(@"hash_1ffc5f854690aa28", 1) == 0) {
        return;
    }
    if (isdefined(self.nvg3rdpersonmodel)) {
        self detach(self.nvg3rdpersonmodel, "j_head");
        self.nvg3rdpersonmodel = undefined;
    }
    if (enabled) {
        modeldown = function_b9ae2029e2c1f6fb();
        if (isdefined(modeldown)) {
            self.nvg3rdpersonmodel = modeldown;
            self attach(self.nvg3rdpersonmodel, "j_head");
        }
        return;
    }
    modelup = function_f88841fc0718438();
    if (isdefined(modelup)) {
        self.nvg3rdpersonmodel = modelup;
        self attach(self.nvg3rdpersonmodel, "j_head");
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10589
// Size: 0xd4
function function_b9ae2029e2c1f6fb() {
    modeldown = undefined;
    if (isdefined(level.nvgheadoverrides) && isdefined(level.nvgheadoverrides[self.operatorcustomization.head])) {
        modeldown = level.nvgheadoverrides[self.operatorcustomization.head]["down"];
    }
    if (!isdefined(modeldown)) {
        modeldown = "offhand_wm_nvgquad_mp_1";
    } else if (modeldown == "nvg_2") {
        modeldown = "offhand_wm_nvgquad_mp_2";
    } else if (modeldown == "nvg_3") {
        modeldown = "offhand_wm_nvgquad_mp_3";
    } else if (modeldown == "nvg_4") {
        modeldown = "offhand_wm_nvgquad_mp_4";
    } else if (modeldown == "none") {
        modeldown = undefined;
    } else {
        assert(0, "Invalid entry value set in level.nvgHeadOverrides for NVG Override Down");
        modeldown = "offhand_wm_nvgquad_mp_1";
    }
    return modeldown;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10666
// Size: 0xd4
function function_f88841fc0718438() {
    modelup = undefined;
    if (isdefined(level.nvgheadoverrides) && isdefined(level.nvgheadoverrides[self.operatorcustomization.head])) {
        modelup = level.nvgheadoverrides[self.operatorcustomization.head]["up"];
    }
    if (!isdefined(modelup)) {
        modelup = "offhand_wm_nvgquad_mp_1_up";
    } else if (modelup == "nvg_2") {
        modelup = "offhand_wm_nvgquad_mp_2_up";
    } else if (modelup == "nvg_3") {
        modelup = "offhand_wm_nvgquad_mp_3_up";
    } else if (modelup == "nvg_4") {
        modelup = "offhand_wm_nvgquad_mp_3_up";
    } else if (modelup == "none") {
        modelup = undefined;
    } else {
        assert(0, "Invalid entry value set in level.nvgHeadOverrides for NVG Override Up");
        modelup = "offhand_wm_nvgquad_mp_1_up";
    }
    return modelup;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10743
// Size: 0x1e3
function function_a2668409a49bdef4(animdelay) {
    self endon("perk_nods_off");
    self endon("perk_nods_off_death");
    if (isdefined(animdelay) && animdelay > 0) {
        wait animdelay;
    }
    distancechecks = getdvarint(@"hash_b439df56cc1fc84c", 1);
    distancethreshold = getdvarint(@"hash_aaccfa1cd779f68", 3000);
    distancethreshold *= distancethreshold;
    var_5b27571147e34abd = getdvarint(@"hash_1151abd1f1c19ee3", 1);
    var_4430b08d5a2d47bf = undefined;
    while (true) {
        foreach (player in level.players) {
            if (player == self) {
                continue;
            }
            inrange = 1;
            if (distancechecks) {
                dist = distancesquared(self.origin, player.origin);
                if (dist >= distancethreshold) {
                    inrange = 0;
                }
            }
            entnum = player getentitynumber();
            if (!isdefined(self.outlineents)) {
                self.outlineents = [];
            }
            if (isdefined(self.outlineents[entnum]) && inrange) {
                continue;
            } else if (isdefined(self.outlineents[entnum])) {
                outline::outlinedisable(self.outlineents[entnum], player);
                continue;
            }
            if (player.team == self.team) {
                if (var_5b27571147e34abd) {
                    var_4430b08d5a2d47bf = "outline_depth_blue";
                }
            } else {
                var_4430b08d5a2d47bf = "outline_depth_orange";
            }
            self.outlineents[entnum] = outline::outlineenableforplayer(player, self, var_4430b08d5a2d47bf, "level_script");
        }
        wait 0.5;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1092e
// Size: 0xbe
function function_c5f054586f38e212(animdelay) {
    if (isdefined(animdelay) && animdelay > 0) {
        wait animdelay;
    }
    foreach (player in level.players) {
        if (player == self) {
            continue;
        }
        entnum = player getentitynumber();
        if (!isdefined(self.outlineents) || !isdefined(self.outlineents[entnum])) {
            continue;
        }
        outline::outlinedisable(self.outlineents[entnum], player);
    }
    self.outlineents = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x109f4
// Size: 0xa2
function function_4d3b1a8f38c4d448(damage, attacker, victim) {
    dmgmod = clamp(getdvarfloat(@"hash_3bb44b33b3bf5abd", 0.25), 0, 1);
    dmgclamp = clamp(getdvarfloat(@"hash_36b8e20bff4b3196", 0.8), 0, 1);
    var_46381c94b0138dc7 = int(damage * dmgmod);
    if (attacker != victim) {
        var_46381c94b0138dc7 = int(clamp(var_46381c94b0138dc7, 0, victim.maxhealth * dmgclamp));
    }
    return var_46381c94b0138dc7;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x10a9f
// Size: 0x96
function function_3c677364a897306(attacker, victim, objweapon, smeansofdeath, inflictor, hitloc) {
    if (smeansofdeath != "MOD_FIRE") {
        return true;
    }
    if (isdefined(attacker) && attacker == victim && !istrue(victim.var_89feaaadef58c4d4)) {
        return true;
    }
    data = damage_utility::packdamagedata(attacker, victim, undefined, objweapon, smeansofdeath, inflictor);
    if (victim damage_utility::isstuckdamage(data)) {
        return true;
    }
    if (function_bd9883d12fef0b36(objweapon, hitloc)) {
        return true;
    }
    return false;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b3e
// Size: 0x69
function function_bd9883d12fef0b36(objweapon, hitloc) {
    weaponbasename = objweapon.basename;
    if (weapon::issuperweapon(weaponbasename)) {
        return 1;
    }
    if (weapon::iskillstreakweapon(weaponbasename)) {
        return 1;
    }
    switch (weaponbasename) {
    case #"hash_1ed1da8a2c218aa7": 
        return 1;
    default: 
        return 0;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10baf
// Size: 0xa
function function_64a27781e3f26162() {
    thread function_2ecdf54199c3435d();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10bc1
// Size: 0xa
function unsettaccom() {
    self notify("unset_perk_taccom");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10bd3
// Size: 0x2b3
function function_2ecdf54199c3435d() {
    self endon("death_or_disconnect");
    self endon("unset_perk_taccom");
    self.var_3a394cc3ef43fb5e = spawnstruct();
    self.var_3a394cc3ef43fb5e.player = [];
    self.var_3a394cc3ef43fb5e.cooldown = [];
    var_e2073531fa9c0c72 = getdvarint(@"hash_87ea8b287cb730ea", 1);
    bundle = level.perkbundles["specialty_taccom_system"];
    while (true) {
        if (var_e2073531fa9c0c72 && self playerads() < 1) {
            wait 0.1;
            continue;
        }
        targetedenemy = function_f660aecf9c2aeec6(bundle, targetedenemy);
        if (!isdefined(targetedenemy)) {
            if (isdefined(self.var_c140bf1d7f29d341)) {
                self.var_c140bf1d7f29d341 = undefined;
                self.var_3863644935270551 = undefined;
            }
            wait 0.1;
            continue;
        }
        if (!isdefined(self.var_c140bf1d7f29d341) || self.var_c140bf1d7f29d341 != targetedenemy) {
            self.var_c140bf1d7f29d341 = targetedenemy;
            self.var_d82e94d7c3c73fb = gettime() + bundle.var_d62b2bffaa3a63d3;
            wait 0.1;
        } else if (!isdefined(self.var_d82e94d7c3c73fb)) {
            self.var_d82e94d7c3c73fb = gettime() + bundle.var_d62b2bffaa3a63d3;
        } else if (gettime() >= self.var_d82e94d7c3c73fb) {
            num = targetedenemy getentitynumber();
            if (isdefined(self.var_3a394cc3ef43fb5e.player[num]) && self.var_3a394cc3ef43fb5e.player[num] == targetedenemy) {
                if (isdefined(self.var_3a394cc3ef43fb5e.cooldown[num]) && self.var_3a394cc3ef43fb5e.cooldown[num] > gettime()) {
                    wait 0.1;
                    continue;
                }
            }
            newpingindex = scripts\cp_mp\calloutmarkerping::calloutmarkerping_createcallout(6, self.var_c140bf1d7f29d341.origin + (0, 0, 50));
            thread scripts\cp_mp\calloutmarkerping::function_9a7200f5142066ba(self, newpingindex, undefined, ["unset_perk_taccom", "disconnect"], bundle.var_84d180cfd1b00a40);
            perks::activatePerk("specialty_taccom_system");
            self.var_d82e94d7c3c73fb = undefined;
            self.var_3a394cc3ef43fb5e.player[num] = targetedenemy;
            self.var_3a394cc3ef43fb5e.cooldown[num] = gettime() + bundle.var_3430721118ed09d0;
            targetedenemy = undefined;
            wait bundle.var_4c64062ca9e30f17;
        }
        wait 0.1;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e8e
// Size: 0x17b
function function_f660aecf9c2aeec6(bundle, var_34aba8d62374a55b) {
    selfpos = self getvieworigin();
    var_e61f6cdf1a489f08 = anglestoforward(self getplayerangles());
    targetedenemy = undefined;
    enemydist = undefined;
    foreach (player in level.players) {
        if (self.team == player.team) {
            continue;
        }
        if (!isalive(player)) {
            continue;
        }
        if (!isdefined(player getviewmodel())) {
            continue;
        }
        if (player perk::_hasperk("specialty_thermal_camo")) {
            continue;
        }
        enemypos = player gettagorigin("j_spinelower");
        if (function_acd8e1bf3a604aea(self, enemypos, selfpos, var_e61f6cdf1a489f08, bundle)) {
            dist = distancesquared(selfpos, enemypos);
            maxdist = bundle.var_86d66e96ee4b380b * bundle.var_86d66e96ee4b380b;
            if (dist > maxdist) {
                continue;
            }
            if (isdefined(var_34aba8d62374a55b) && player == var_34aba8d62374a55b) {
                return player;
            }
            if (!isdefined(targetedenemy)) {
                targetedenemy = player;
                enemydist = dist;
                continue;
            }
            if (dist < enemydist) {
                targetedenemy = player;
                enemydist = dist;
            }
        }
    }
    return targetedenemy;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11012
// Size: 0xdb
function function_acd8e1bf3a604aea(player, enemypos, playerpos, playeraim, bundle) {
    fromplayer = enemypos - playerpos;
    dot = vectordot(fromplayer, playeraim);
    if (dot <= 0) {
        return 0;
    }
    var_a2585110d07faeb8 = length(fromplayer);
    var_a4b3b596dcf9790c = bundle.var_50ea6089f0e95fe1;
    var_a4b3b596dcf9790c += bundle.var_90d691af1d7be5e6 * sqrt(var_a2585110d07faeb8);
    var_b6b1cd24e33b485f = math::degrees_to_radians(var_a4b3b596dcf9790c);
    var_29f5e95c42138166 = 1 - 0.5 * var_b6b1cd24e33b485f * var_b6b1cd24e33b485f;
    if (dot < var_29f5e95c42138166 * var_a2585110d07faeb8) {
        return 0;
    }
    if (function_fe136c3b362a577e(playerpos, enemypos)) {
        return 1;
    }
    return 0;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110f5
// Size: 0x66
function function_fe136c3b362a577e(playerpos, enemypos) {
    var_68e6f05a4ee24dee = physics_createcontents(["physicscontents_vehicleclip", "physicscontents_item", "physicscontents_ainoshoot", "physicscontents_playernosight"]);
    var_97db5d48f2509e02 = physics_raycast(playerpos, enemypos, var_68e6f05a4ee24dee, undefined, 0, "physicsquery_any", 1);
    return !var_97db5d48f2509e02;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11164
// Size: 0x10
function function_cc2cf1db71343d8f() {
    self.var_4aec8a632dc40e2c = &function_5790c8111baf94d3;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1117c
// Size: 0xc
function function_5ab8f9c4d813c44a() {
    self.var_4aec8a632dc40e2c = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11190
// Size: 0xe
function function_5790c8111baf94d3() {
    scripts\mp\perks\perks::activatePerk("specialty_compression_carrier");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x111a6
// Size: 0xe
function function_e906d1c066af953a() {
    self function_9354c4c50c43abc0(1.3);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x111bc
// Size: 0xb
function function_488e69b3f2811165() {
    self function_9354c4c50c43abc0(1);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x111cf
// Size: 0xd9
function function_3e285d679cd4ac57() {
    bundle = level.perkbundles["specialty_support_streaker"];
    if (!isdefined(bundle) || !isdefined(bundle.var_673e66d59cd548eb) || isdefined(level.var_39c3f3e4abe0da33)) {
        return;
    }
    var_dc9b09da91621b2c = bundle.var_673e66d59cd548eb;
    level.var_39c3f3e4abe0da33 = [];
    for (i = 0; i < var_dc9b09da91621b2c.size; i++) {
        streakbundle = var_dc9b09da91621b2c[i];
        overridesstruct = spawnstruct();
        overridesstruct.values = [];
        overridesstruct.values["support_streaker"] = streakbundle.cost;
        level.var_39c3f3e4abe0da33[streakbundle.streakname] = overridesstruct;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x112b0
// Size: 0xe3
function function_37de052fb8326c6f() {
    if (!isdefined(level.var_39c3f3e4abe0da33)) {
        return;
    }
    if (!isdefined(self.var_f3c2f1677bc581d7) || self.var_f3c2f1677bc581d7.size == 0) {
        self.var_f3c2f1677bc581d7 = level.var_39c3f3e4abe0da33;
    } else {
        foreach (streakname, var_d5efe609fc99681c in level.var_39c3f3e4abe0da33) {
            if (isdefined(self.var_f3c2f1677bc581d7[streakname])) {
                self.var_f3c2f1677bc581d7[streakname].values["support_streaker"] = var_d5efe609fc99681c.values["support_streaker"];
                continue;
            }
            self.var_f3c2f1677bc581d7[streakname] = var_d5efe609fc99681c;
        }
    }
    function_9735e382a48bd594();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1139b
// Size: 0xd1
function function_191ab60d4588d0c8() {
    if (!isdefined(self.var_f3c2f1677bc581d7) || !isdefined(level.var_39c3f3e4abe0da33)) {
        return;
    }
    foreach (streakname, var_d5efe609fc99681c in level.var_39c3f3e4abe0da33) {
        if (self.var_f3c2f1677bc581d7[streakname].values.size > 1) {
            self.var_f3c2f1677bc581d7[streakname].values["support_streaker"] = undefined;
            continue;
        }
        self.var_f3c2f1677bc581d7[streakname] = undefined;
    }
    if (self.var_f3c2f1677bc581d7.size == 0) {
        self.var_f3c2f1677bc581d7 = undefined;
    }
    function_9735e382a48bd594();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11474
// Size: 0x20
function function_9735e382a48bd594() {
    killstreaks::updatestreakcosts();
    killstreaks::checkstreakreward(self.streakpoints);
    killstreaks::updatestreakmeterui();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1149c
// Size: 0x26
function function_a01c9e1d5b2abc3a() {
    level.var_ff7ad25f9727ddc4 = [];
    level.var_58e389cffaea4aec = [];
    while (true) {
        waitframe();
        function_4730863c5f3d4d76();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x114ca
// Size: 0x2db
function function_4730863c5f3d4d76() {
    var_4d2c89632f9bac8a = getdvarint(@"hash_6cf8ef451d7eb086", 500);
    var_e04256cb6e7bec04 = var_4d2c89632f9bac8a * var_4d2c89632f9bac8a;
    var_e58f7f1e0b03e93c = getdvarint(@"hash_9e837079460d2ffd", 800);
    var_c6a2d67e179c09c6 = getdvarint(@"hash_db6950720d7faa27", 100);
    equipmentarray = [[ level.getactiveequipmentarray ]]();
    foreach (player in level.var_ff7ad25f9727ddc4) {
        foreach (equipment in equipmentarray) {
            if (isdefined(player.team) && isdefined(equipment.team) && equipment.team != player.team) {
                thisdistsqr = distancesquared(player.origin, equipment.origin);
                if (thisdistsqr < var_e04256cb6e7bec04) {
                    if (!isdefined(equipment.var_50d8a278fa3d1ddd)) {
                        objid = namespace_6c8a837ec98fe0b8::requestobjectiveid();
                        if (objid != -1) {
                            namespace_6c8a837ec98fe0b8::objective_add_objective(objid, "active", equipment.origin, "icon_navbar_signal_jammer", "icon_small");
                            objective_setshowoncompass(objid, 1);
                            function_9766d0b79eada249(objid, 1);
                            objective_setbackground(objid, 1);
                            equipment.var_50d8a278fa3d1ddd = objid;
                            level.var_58e389cffaea4aec[objid] = equipment;
                        }
                    }
                    namespace_6c8a837ec98fe0b8::objective_playermask_addshowplayer(equipment.var_50d8a278fa3d1ddd, player);
                    player thread function_f0acc19bc9f58105(equipment);
                    prop = float(thisdistsqr) / float(var_e04256cb6e7bec04);
                    var_261285cfc88f8ee0 = math::lerp(var_c6a2d67e179c09c6, var_e58f7f1e0b03e93c, prop);
                    player function_3f33157318043ac2(var_261285cfc88f8ee0, equipment);
                    continue;
                }
                if (isdefined(equipment.var_50d8a278fa3d1ddd)) {
                    objective_removeclientfrommask(equipment.var_50d8a278fa3d1ddd, player);
                    player thread function_6cf221eaa466443b(equipment);
                }
            }
        }
    }
    foreach (objid, equipment in level.var_58e389cffaea4aec) {
        if (!utility::array_contains(equipmentarray, equipment)) {
            namespace_6c8a837ec98fe0b8::returnobjectiveid(objid);
            level.var_58e389cffaea4aec[objid] = undefined;
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x117ad
// Size: 0x23
function function_8d63cc03c22e972() {
    level endon("game_ended");
    level.var_52ec346520cb321c = [];
    while (true) {
        waitframe();
        function_7cbf935d70716bce();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x117d8
// Size: 0x5ad
function function_7cbf935d70716bce() {
    tracecontents = trace::create_default_contents(1);
    process = 0;
    var_6d7eba8a96f9541 = 1;
    if (getdvarint(@"hash_331b1ec774a4d54b", 0)) {
        var_6d7eba8a96f9541 = 0;
    }
    foreach (num, player in level.var_52ec346520cb321c) {
        var_2f3b228d8493de0e = [];
        otherplayerlaser = undefined;
        var_50843d76956e8fd4 = undefined;
        var_7160ff774dc6778d = undefined;
        var_96f404f41dcf0af0 = 0;
        var_2d8cf2fc75fdaece = undefined;
        if (!isdefined(player)) {
            level.var_52ec346520cb321c[num] = undefined;
            break;
        }
        var_24f9b94a171cca52 = player gettagorigin("j_spinelower");
        var_64a457a19d7daa44 = player geteye();
        playeraim = anglestoforward(player getplayerangles());
        equipmentarray = [[ level.getactiveequipmentarray ]]();
        playerarray = level.players;
        var_2ce72edced53e34c = level.activekillstreaks;
        activeobjects = undefined;
        if (isdefined(equipmentarray) && isdefined(playerarray)) {
            activeobjects = utility::array_combine_unique(playerarray, equipmentarray);
        } else {
            if (isdefined(equipmentarray)) {
                activeobjects = equipmentarray;
            }
            if (isdefined(playerarray)) {
                activeobjects = playerarray;
            }
        }
        if (isdefined(var_2ce72edced53e34c)) {
            var_1c657e4ea33dcdd6 = [];
            foreach (streak in var_2ce72edced53e34c) {
                switch (streak.streakname) {
                case #"hash_fa4536bde6f7ad9":
                case #"hash_ab5712e297cd430e":
                case #"hash_cf0ef5bef19a311b": 
                    var_1c657e4ea33dcdd6[var_1c657e4ea33dcdd6.size] = streak;
                    break;
                }
            }
            activeobjects = utility::array_combine_unique(activeobjects, var_1c657e4ea33dcdd6);
        }
        if (!isdefined(activeobjects)) {
            continue;
        }
        foreach (targetobj in activeobjects) {
            if (process >= 25) {
                process = 0;
                waitframe();
            }
            if (!isdefined(player)) {
                level.var_52ec346520cb321c[num] = undefined;
                break;
            }
            if (isplayer(targetobj)) {
                if (!player function_3b9f02152a634ee9(targetobj)) {
                    continue;
                }
                process++;
                if (targetobj utility::isusingremote()) {
                    var_7160ff774dc6778d = targetobj.origin;
                } else if (isplayer(targetobj) || isagent(targetobj)) {
                    var_7160ff774dc6778d = targetobj geteye();
                } else {
                    var_7160ff774dc6778d = targetobj gettagorigin("j_spinelower");
                }
                var_ed6e173aa5e562a5 = anglestoforward(targetobj getplayerangles());
                otherplayerlaser = function_3a930ec69b2ea052(targetobj);
                var_50843d76956e8fd4 = player function_54a4fb429eda8e2(targetobj, var_24f9b94a171cca52);
                /#
                    if (getdvarint(@"hash_4a5e53c86be19882", 0) > 0) {
                        otherplayerlaser = 1;
                    }
                    if (getdvarint(@"hash_72de1d9c7d36f7e2", 0) > 0) {
                        var_50843d76956e8fd4 = 1;
                    }
                #/
                if (!istrue(otherplayerlaser) && !istrue(var_50843d76956e8fd4)) {
                    continue;
                }
                if (istrue(var_50843d76956e8fd4)) {
                    var_96f404f41dcf0af0 = 1;
                    var_2f3b228d8493de0e[var_2f3b228d8493de0e.size] = targetobj;
                } else if (player function_33662f36c6e2421a(targetobj, var_24f9b94a171cca52, var_7160ff774dc6778d, var_ed6e173aa5e562a5)) {
                    castcontents = physics_createcontents(["physicscontents_ainosight"]);
                    castresults = physics_raycast(var_24f9b94a171cca52, var_7160ff774dc6778d, castcontents, [player, targetobj], 0, "physicsquery_closest");
                    if (isdefined(castresults) && castresults.size > 0) {
                        continue;
                    } else {
                        var_96f404f41dcf0af0 = 1;
                        var_2f3b228d8493de0e[var_2f3b228d8493de0e.size] = targetobj;
                    }
                }
            } else if (isdefined(targetobj)) {
                if (istrue(targetobj.exploding)) {
                    continue;
                }
                var_7160ff774dc6778d = targetobj.origin;
                process++;
                if (isdefined(targetobj.streakname)) {
                    if (function_6dbc5df69e5134a0(targetobj, player)) {
                        var_96f404f41dcf0af0 = 1;
                        var_2f3b228d8493de0e[var_2f3b228d8493de0e.size] = targetobj;
                    }
                } else if (function_151d6bf67d113b1e(targetobj, player)) {
                    var_96f404f41dcf0af0 = 1;
                    var_2f3b228d8493de0e[var_2f3b228d8493de0e.size] = targetobj;
                }
            } else {
                continue;
            }
            if (isdefined(targetobj) && !utility::array_contains(player.var_5dcd6d4ac51be6d5, targetobj) && utility::array_contains(var_2f3b228d8493de0e, targetobj)) {
                var_2d8cf2fc75fdaece = 1;
            }
        }
        var_2f3b228d8493de0e = player function_377b7c0c8c274789(var_2f3b228d8493de0e);
        player.var_5dcd6d4ac51be6d5 = var_2f3b228d8493de0e;
        if (var_96f404f41dcf0af0) {
            dot = undefined;
            var_8b9593a2b3f37e08 = getdvarfloat(@"hash_176909c53ee0395e", 0.985);
            foreach (targetobj in var_2f3b228d8493de0e) {
                if (!isdefined(dot)) {
                    dot = function_f8ae6ea503ee187a(playeraim, var_24f9b94a171cca52, targetobj.origin);
                    break;
                }
                tempdot = function_f8ae6ea503ee187a(playeraim, var_24f9b94a171cca52, targetobj.origin);
                if (tempdot > dot) {
                    dot = tempdot;
                }
            }
            if (dot >= var_8b9593a2b3f37e08) {
                var_6d7eba8a96f9541 = 1;
            }
        }
        player thread function_bc9281d925b86c7e(var_96f404f41dcf0af0, var_6d7eba8a96f9541, var_2d8cf2fc75fdaece);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d8d
// Size: 0x254
function function_377b7c0c8c274789(var_2f3b228d8493de0e) {
    if (!isdefined(750) || false) {
        return var_2f3b228d8493de0e;
    }
    if (!isdefined(self.var_df81db1ae87349f2)) {
        self.var_df81db1ae87349f2 = [];
    }
    foreach (ent in self.var_5dcd6d4ac51be6d5) {
        if (!isdefined(ent)) {
            continue;
        }
        entdetected = utility::array_contains(var_2f3b228d8493de0e, ent);
        var_c34e02f7e11269cf = 0;
        var_7e04d11079ba5e66 = undefined;
        if (self.var_df81db1ae87349f2.size > 0) {
            for (index = 0; index < self.var_df81db1ae87349f2.size; index++) {
                if (self.var_df81db1ae87349f2[index].ent == ent) {
                    var_7e04d11079ba5e66 = index;
                    var_c34e02f7e11269cf = 1;
                    break;
                }
            }
        }
        if (entdetected && var_c34e02f7e11269cf) {
            self.var_df81db1ae87349f2 = utility::array_remove_index(self.var_df81db1ae87349f2, var_7e04d11079ba5e66, 0);
            continue;
        }
        if (!entdetected && !var_c34e02f7e11269cf) {
            newentry = spawnstruct();
            newentry.ent = ent;
            newentry.time = gettime();
            self.var_df81db1ae87349f2[self.var_df81db1ae87349f2.size] = newentry;
        }
    }
    removedelay = getdvarint(@"hash_1418e2a60694ce70", 750);
    for (index = self.var_df81db1ae87349f2.size - 1; index >= 0; index--) {
        ent = self.var_df81db1ae87349f2[index];
        if (!isdefined(ent)) {
            self.var_df81db1ae87349f2 = utility::array_remove_index(self.var_df81db1ae87349f2, index, 0);
            continue;
        }
        entdetected = utility::array_contains(var_2f3b228d8493de0e, ent.ent);
        if (!entdetected) {
            removetime = ent.time + removedelay;
            if (gettime() < removetime) {
                var_2f3b228d8493de0e[var_2f3b228d8493de0e.size] = ent.ent;
                continue;
            }
            self.var_df81db1ae87349f2 = utility::array_remove_index(self.var_df81db1ae87349f2, index, 0);
        }
    }
    return var_2f3b228d8493de0e;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11fea
// Size: 0xe0
function function_bc9281d925b86c7e(var_96f404f41dcf0af0, var_6d7eba8a96f9541, var_2d8cf2fc75fdaece) {
    if (var_96f404f41dcf0af0) {
        if (istrue(var_2d8cf2fc75fdaece)) {
            thread function_76607a90fc659cd7();
        }
        if (!isdefined(self.var_be2b394965b786ba)) {
            self.var_be2b394965b786ba = gettime();
            function_1d114ca0c1f73008(16);
            function_b287c9114a845cee(var_6d7eba8a96f9541);
        } else {
            currtime = gettime();
            var_58e6805f5b00a307 = undefined;
            switch (var_6d7eba8a96f9541) {
            case 1: 
                var_58e6805f5b00a307 = 500;
                break;
            }
            if (isdefined(var_58e6805f5b00a307) && currtime - var_58e6805f5b00a307 >= self.var_be2b394965b786ba) {
                function_1d114ca0c1f73008(16);
                function_b287c9114a845cee(var_6d7eba8a96f9541);
                self.var_be2b394965b786ba = currtime;
            } else if (!istrue(var_2d8cf2fc75fdaece)) {
                function_1d114ca0c1f73008(0);
            }
        }
        return;
    }
    function_1d114ca0c1f73008(0);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x120d2
// Size: 0x188
function function_151d6bf67d113b1e(targetobj, player) {
    var_c7afe0cfc4a23bb9 = targetobj.owner;
    var_f31940d93afc41db = 1;
    if (var_f31940d93afc41db) {
        if (isdefined(var_c7afe0cfc4a23bb9) && !istrue(player_utility::playersareenemies(player, var_c7afe0cfc4a23bb9))) {
            return false;
        }
    }
    if (distancesquared(targetobj.origin, player.origin) > 202500) {
        return false;
    }
    var_6f6a39d243eb6a5 = undefined;
    if (isdefined(targetobj.weapon_name)) {
        var_6f6a39d243eb6a5 = targetobj.weapon_name;
    }
    if (!isdefined(var_6f6a39d243eb6a5) && isdefined(targetobj.weapon_object)) {
        var_6f6a39d243eb6a5 = targetobj.weapon_object.basename;
    }
    if (isdefined(var_6f6a39d243eb6a5)) {
        if (var_6f6a39d243eb6a5 == "claymore_mp" || var_6f6a39d243eb6a5 == "jup_claymore_mp" || var_6f6a39d243eb6a5 == "jup_claymore_cp") {
            if (player function_33662f36c6e2421a(targetobj, player.origin, targetobj.origin, anglestoforward(targetobj.angles), 25)) {
                castcontents = physics_createcontents(["physicscontents_ainosight"]);
                castresults = physics_raycast(player.origin, targetobj.origin, castcontents, [player, targetobj], 0, "physicsquery_closest");
                if (isdefined(castresults) && castresults.size > 0) {
                    return false;
                }
                return true;
            }
        }
    }
    return false;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12263
// Size: 0x160
function function_6dbc5df69e5134a0(killstreak, player) {
    streakname = killstreak.streakname;
    if (isdefined(streakname)) {
        if (streakname == "remote_turret" || streakname == "pac_sentry" || streakname == "sentry_turret") {
            if (isdefined(killstreak.owner) && !istrue(player_utility::playersareenemies(player, killstreak.owner))) {
                return false;
            }
            if (distancesquared(killstreak.origin, player.origin) > 36000000) {
                return false;
            }
            if (player function_33662f36c6e2421a(killstreak, player.origin, killstreak.origin, anglestoforward(killstreak.angles))) {
                traceloc = killstreak gettagorigin("tag_flash", 1);
                if (!isdefined(traceloc)) {
                    traceloc = killstreak.origin + (0, 0, 6);
                }
                castcontents = physics_createcontents(["physicscontents_ainosight"]);
                castresults = physics_raycast(player.origin, traceloc, castcontents, [player, killstreak], 0, "physicsquery_closest");
                if (isdefined(castresults) && castresults.size > 0) {
                    return false;
                }
                return true;
            }
        }
    }
    return false;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x123cc
// Size: 0x14b
function function_3b9f02152a634ee9(otherplayer) {
    if (!perk::_hasperk("specialty_lr_detector")) {
        return false;
    }
    if (!player_utility::_isalive()) {
        return false;
    }
    if (!isdefined(otherplayer)) {
        return false;
    }
    if (!otherplayer player_utility::_isalive()) {
        return false;
    }
    if (otherplayer.team == self.team) {
        return false;
    }
    if (otherplayer == self) {
        return false;
    }
    if (distancesquared(otherplayer.origin, self.origin) > 36000000) {
        return false;
    }
    vehicle = otherplayer player_utility::getvehicle();
    if (isdefined(vehicle) && isdefined(vehicle.vehiclename)) {
        isdriver = vehicle_occupancy::vehicle_occupancy_occupantisvehicledriver(otherplayer);
        if (isdriver) {
            if (vehicle.vehiclename != "light_tank" && vehicle.vehiclename != "apc_russian") {
                return false;
            }
        } else if (vehicle.vehiclename == "apc_russian") {
            return false;
        }
    }
    if (otherplayer utility::isusingremote()) {
        remotename = otherplayer player::getremotename();
        if (remotename == "gunship" || remotename == "radar_drone_recon" || remotename == "chopper_gunner" || remotename == "cruise_predator") {
            return false;
        }
    }
    return true;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12520
// Size: 0x210
function function_3a930ec69b2ea052(otherplayer) {
    var_e939d845c078f13a = [];
    equippedweapon = undefined;
    equippedweapon = otherplayer getcurrentweapon();
    if (isdefined(equippedweapon)) {
        var_e939d845c078f13a = getweaponattachments(equippedweapon);
    } else {
        return false;
    }
    if (isdefined(equippedweapon.basename) && issubstr(equippedweapon.basename, "laser")) {
        return true;
    }
    if (isdefined(var_e939d845c078f13a)) {
        foreach (attachment in var_e939d845c078f13a) {
            attachmentdataname = function_d3831c58b9d05ac2(equippedweapon.basename, attachment);
            if (!isdefined(attachmentdataname)) {
                continue;
            }
            attachmentcategory = tolower(getscriptbundlefieldvalue(attachmentdataname, #"category"));
            if (isdefined(attachmentcategory) && attachmentcategory != "") {
                switch (attachmentcategory) {
                case #"hash_c9e63a9bddd371e": 
                    if (function_ec9cd761df1a3271(equippedweapon.basename, attachment) || issubstr(attachment, "therm") || issubstr(attachment, "range") || issubstr(attachment, "rf") || issubstr(attachment, "las") && !issubstr(attachment, "flashlight")) {
                        return true;
                    }
                    break;
                case #"hash_db653a4972b3c13b": 
                    if (issubstr(attachment, "las") && !issubstr(attachment, "flashlight")) {
                        return true;
                    }
                    break;
                case #"hash_2bc3eb92ebf513f8": 
                    if (issubstr(attachment, "las") && !issubstr(attachment, "flashlight")) {
                        return true;
                    }
                    break;
                case #"hash_6fc1c97a058fdcc9": 
                    if (issubstr(attachment, "las") && !issubstr(attachment, "flashlight")) {
                        return true;
                    }
                    break;
                }
            }
        }
    }
    return false;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12739
// Size: 0x116
function function_54a4fb429eda8e2(otherplayer, var_24f9b94a171cca52) {
    if (distancesquared(otherplayer.origin, self.origin) > 562500) {
        return 0;
    }
    if (otherplayer utility::isusingremote()) {
        remotename = otherplayer player::getremotename();
        if (remotename == "assault_drone" || remotename == "sentry_turret" || remotename == "recon_drone" || remotename == "tacCam" || remotename == "remote_turret" || remotename == "pac_sentry") {
            if (getdvarint(@"hash_1440d4d37f1d5de5") == 1) {
                castcontents = physics_createcontents(["physicscontents_ainosight"]);
                castresults = physics_raycast(var_24f9b94a171cca52, otherplayer.origin, castcontents, [self, otherplayer], 0, "physicsquery_closest");
                if (isdefined(castresults) && castresults.size > 0) {
                    return 0;
                }
                return 1;
            } else {
                return 1;
            }
        } else {
            return 0;
        }
        return;
    }
    return 0;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12857
// Size: 0xc6
function function_33662f36c6e2421a(otherplayer, playerpos, otherplayerpos, var_ed6e173aa5e562a5, var_bbc7488043a90e4b) {
    fromotherplayer = playerpos - otherplayerpos;
    dot = vectordot(fromotherplayer, var_ed6e173aa5e562a5);
    if (dot <= 0) {
        return false;
    }
    var_33e2af87c7b68ce8 = length(fromotherplayer);
    if (isdefined(var_bbc7488043a90e4b)) {
        var_a4b3b596dcf9790c = var_bbc7488043a90e4b;
    } else {
        var_a4b3b596dcf9790c = 12;
    }
    var_a4b3b596dcf9790c += -0.15 * sqrt(var_33e2af87c7b68ce8);
    var_b6b1cd24e33b485f = math::degrees_to_radians(var_a4b3b596dcf9790c);
    var_29f5e95c42138166 = 1 - 0.5 * var_b6b1cd24e33b485f * var_b6b1cd24e33b485f;
    if (dot < var_29f5e95c42138166 * var_33e2af87c7b68ce8) {
        return false;
    }
    return true;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12926
// Size: 0x41
function function_f8ae6ea503ee187a(playeraim, playerpos, otherplayerpos) {
    tootherplayer = otherplayerpos - playerpos;
    dot = vectordot(playeraim, vectornormalize(tootherplayer));
    return dot;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12970
// Size: 0x78
function function_1d114ca0c1f73008(vfxvalue) {
    if (vfxvalue == 0) {
        if (istrue(self.var_bc4c5b060cdf149f)) {
            self setscriptablepartstate("lrDetector", "lrDetector_off", 0);
            self.var_bc4c5b060cdf149f = 0;
        }
        return;
    }
    self setclientomnvar("ui_lr_detector", gettime());
    if (!istrue(self.var_bc4c5b060cdf149f)) {
        self setscriptablepartstate("lrDetector", "lrDetector_on", 0);
        self.var_bc4c5b060cdf149f = 1;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129f0
// Size: 0x34
function function_76607a90fc659cd7() {
    function_1d114ca0c1f73008(16);
    self playsoundtoplayer("prk_lr_detector_first_beep", self);
    wait 0.1;
    function_1d114ca0c1f73008(16);
    self playsoundtoplayer("prk_lr_detector_first_beep", self);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12a2c
// Size: 0x1e
function function_b287c9114a845cee(var_6d7eba8a96f9541) {
    if (var_6d7eba8a96f9541 != 0) {
        self playsoundtoplayer("prk_lr_detector_beep", self);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12a52
// Size: 0x83
function function_3f33157318043ac2(var_3f532f304395a854, fromentity) {
    if (var_3f532f304395a854 > 0 && isdefined(fromentity)) {
        if (!isdefined(self.var_29c495bc5fed0c4c)) {
            self.var_29c495bc5fed0c4c = gettime();
            self playsoundtoplayer("prk_signal_jammer_beep", self, fromentity);
            return;
        }
        currtime = gettime();
        if (currtime - self.var_29c495bc5fed0c4c >= var_3f532f304395a854) {
            self.var_29c495bc5fed0c4c = currtime;
            self playsoundtoplayer("prk_signal_jammer_beep", self, fromentity);
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12add
// Size: 0x48d
function settacmask() {
    bundle = level.perkbundles["specialty_tac_mask"];
    if (!isdefined(bundle) || !isdefined(bundle.var_e9766119e389af1c)) {
        return;
    }
    self.var_a5ccdc92ae9b4392 = [];
    foreach (index, var_e9b0f38faaf7b29b in bundle.var_e9766119e389af1c) {
        switch (var_e9b0f38faaf7b29b.var_b84101f4c3174b88) {
        case #"hash_23f2c68a2fc41281": 
            if (isdefined(var_e9b0f38faaf7b29b.var_c1ab5588db5fa28c)) {
                switch (var_e9b0f38faaf7b29b.var_c1ab5588db5fa28c) {
                case #"hash_8b85ac7f081e7060": 
                    perks::_setperk("specialty_stun_resistance");
                    self.var_a5ccdc92ae9b4392[index] = "specialty_stun_resistance";
                    break;
                case #"hash_db653a4972b3c13b":
                case #"hash_e3ea33954e1ac9f7":
                default: 
                    break;
                }
            }
            break;
        case #"hash_ed469a6bfff6b265": 
            if (isdefined(var_e9b0f38faaf7b29b.var_c1ab5588db5fa28c)) {
                switch (var_e9b0f38faaf7b29b.var_c1ab5588db5fa28c) {
                case #"hash_8b85ac7f081e7060": 
                    perks::_setperk("specialty_emp_resist");
                    self.var_a5ccdc92ae9b4392[index] = "specialty_emp_resist";
                    break;
                case #"hash_e3ea33954e1ac9f7": 
                    perks::_setperk("specialty_emp_immunity");
                    perks::_setperk("specialty_empimmune");
                    self.var_a5ccdc92ae9b4392[index] = "specialty_emp_immunity";
                    break;
                case #"hash_db653a4972b3c13b":
                default: 
                    break;
                }
            }
            break;
        case #"hash_fb36696c0708bf42": 
            if (isdefined(var_e9b0f38faaf7b29b.var_c1ab5588db5fa28c)) {
                switch (var_e9b0f38faaf7b29b.var_c1ab5588db5fa28c) {
                case #"hash_8b85ac7f081e7060": 
                    perks::_setperk("specialty_gas_grenade_resist");
                    self.var_a5ccdc92ae9b4392[index] = "specialty_gas_grenade_resist";
                    break;
                case #"hash_e3ea33954e1ac9f7": 
                    perks::_setperk("specialty_gas_immunity");
                    self.var_a5ccdc92ae9b4392[index] = "specialty_gas_immunity";
                case #"hash_db653a4972b3c13b":
                default: 
                    break;
                }
            }
            break;
        case #"hash_ce04129c57195506": 
            if (isdefined(var_e9b0f38faaf7b29b.var_c1ab5588db5fa28c)) {
                switch (var_e9b0f38faaf7b29b.var_c1ab5588db5fa28c) {
                case #"hash_e3ea33954e1ac9f7": 
                    perks::_setperk("specialty_hallucination_immunity");
                    self.var_a5ccdc92ae9b4392[index] = "specialty_hallucination_immunity";
                    break;
                case #"hash_8b85ac7f081e7060":
                case #"hash_db653a4972b3c13b":
                default: 
                    break;
                }
            }
            break;
        case #"hash_1f1d7b3efcb82111": 
            if (isdefined(var_e9b0f38faaf7b29b.var_c1ab5588db5fa28c)) {
                switch (var_e9b0f38faaf7b29b.var_c1ab5588db5fa28c) {
                case #"hash_e3ea33954e1ac9f7": 
                    perks::_setperk("specialty_shock_immunity");
                    self.var_a5ccdc92ae9b4392[index] = "specialty_shock_immunity";
                    break;
                case #"hash_8b85ac7f081e7060":
                case #"hash_db653a4972b3c13b":
                default: 
                    break;
                }
            }
        case #"hash_ed1356899cfee3ed": 
            if (isdefined(var_e9b0f38faaf7b29b.var_c1ab5588db5fa28c)) {
                switch (var_e9b0f38faaf7b29b.var_c1ab5588db5fa28c) {
                case #"hash_e3ea33954e1ac9f7": 
                    perks::_setperk("specialty_snapshot_immunity");
                    self.var_a5ccdc92ae9b4392[index] = "specialty_snapshot_immunity";
                    break;
                case #"hash_8b85ac7f081e7060":
                case #"hash_db653a4972b3c13b":
                default: 
                    break;
                }
            }
        case #"hash_1b98d081f90934b8": 
            if (isdefined(var_e9b0f38faaf7b29b.var_c1ab5588db5fa28c)) {
                switch (var_e9b0f38faaf7b29b.var_c1ab5588db5fa28c) {
                case #"hash_8b85ac7f081e7060": 
                    perks::_setperk("specialty_gas_warlord_resist");
                    self.var_a5ccdc92ae9b4392[index] = "specialty_gas_warlord_resist";
                    break;
                case #"hash_db653a4972b3c13b":
                case #"hash_e3ea33954e1ac9f7":
                default: 
                    break;
                }
            }
            break;
        default: 
            break;
        }
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f72
// Size: 0x79
function unsettacmask() {
    if (!isdefined(self.var_a5ccdc92ae9b4392)) {
        return;
    }
    foreach (var_f98915c242e60c19 in self.var_a5ccdc92ae9b4392) {
        if (perk::_hasperk(var_f98915c242e60c19)) {
            perks::_unsetperk(var_f98915c242e60c19);
        }
    }
    self.var_a5ccdc92ae9b4392 = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ff3
// Size: 0x3c
function function_9ab9afce9ddf23d3() {
    var_5b097bde4417d7ad = "jup_mp_bone_conduction";
    var_fdd4cb56c3b978a3 = scripts\cp_mp\utility\game_utility::isbrstylegametype();
    if (istrue(var_fdd4cb56c3b978a3)) {
        var_5b097bde4417d7ad = "wz_mp_bone_conduction";
    }
    self setsoundsubmix(var_5b097bde4417d7ad, 0.2);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13037
// Size: 0x3c
function function_f4981401b60aff4e() {
    var_5b097bde4417d7ad = "jup_mp_bone_conduction";
    var_fdd4cb56c3b978a3 = scripts\cp_mp\utility\game_utility::isbrstylegametype();
    if (istrue(var_fdd4cb56c3b978a3)) {
        var_5b097bde4417d7ad = "wz_mp_bone_conduction";
    }
    self clearsoundsubmix(var_5b097bde4417d7ad, 0.2);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1307b
// Size: 0x83
function function_e77e0f080cbde77a() {
    if (!isdefined(level.perkbundles)) {
        return;
    }
    var_ce97d61299ae4f64 = level.perkbundles["specialty_gearhead"];
    if (!isstruct(var_ce97d61299ae4f64)) {
        return;
    }
    var_d7d948c55db143ae = var_ce97d61299ae4f64.var_d7d948c55db143ae;
    if (isnumber(var_d7d948c55db143ae)) {
        if (!isdefined(self.perktunables)) {
            self.perktunables = spawnstruct();
        }
        self.perktunables.var_d7d948c55db143ae = var_d7d948c55db143ae;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13106
// Size: 0x3a
function function_91c59fd71ce44c87() {
    if (!isdefined(self.perktunables)) {
        return;
    }
    if (isdefined(self.perktunables.var_d7d948c55db143ae)) {
        self.perktunables.var_d7d948c55db143ae = undefined;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13148
// Size: 0x6b
function function_efd84dab18312f3f() {
    if (!isdefined(self.var_c2c2848ce2585f29)) {
        self.var_c2c2848ce2585f29 = 0;
    }
    self.var_29c2f60059bfa3aa = 1;
    self.var_c2c2848ce2585f29 += getdvarfloat(@"hash_50dc5065112199d7", -0.2);
    if (!getdvarint(@"hash_e57295eeedbf41eb", 0)) {
        thread function_b58456eeca76b311();
    }
    function_2a32431b16c54b0d();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x131bb
// Size: 0x41
function unsetoutlander() {
    self.var_29c2f60059bfa3aa = 0;
    self.var_c2c2848ce2585f29 -= getdvarfloat(@"hash_50dc5065112199d7", -0.2);
    self notify("outlander_unset");
    function_2a32431b16c54b0d();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13204
// Size: 0xc6
function function_2a32431b16c54b0d() {
    if (!istrue(self.var_9ee4330fe38ffc6) && istrue(self.var_29c2f60059bfa3aa) && istrue(self.isincircle)) {
        if (!isdefined(self.var_740c1298f33f5910) || self.var_740c1298f33f5910 != getdvarfloat(@"hash_f12f9c3e925d6a69", 0.1)) {
            self.var_740c1298f33f5910 = getdvarfloat(@"hash_f12f9c3e925d6a69", 0.1);
            scripts\mp\weapons::updatemovespeedscale();
            function_332887b37621cafe("outlander");
        }
        return;
    }
    if (isdefined(self.var_740c1298f33f5910) && self.var_740c1298f33f5910 != 0) {
        self.var_740c1298f33f5910 = 0;
        scripts\mp\weapons::updatemovespeedscale();
        function_dc6425bc8ea85ac0("outlander");
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x132d2
// Size: 0x37
function function_b58456eeca76b311() {
    self endon("death_or_disconnect");
    self endon("outlander_unset");
    level endon("game_ended");
    while (true) {
        waittill_any_2("powerup_apply_zombie_legs", "powerup_remove_zombie_legs");
        function_2a32431b16c54b0d();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13311
// Size: 0x1e
function function_198adc5136f6a4b3() {
    self.var_4d52ef6a17e52924 = getdvarfloat(@"hash_28d9e384824bc463", 0.2);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13337
// Size: 0xc
function function_a4142d5fdfc879b4() {
    self.var_4d52ef6a17e52924 = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1334b
// Size: 0x17
function function_7c927ee710825162() {
    self.var_86d77db605c0c948 = 1;
    scripts\mp\weapons::updatemovespeedscale();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1336a
// Size: 0x13
function function_33f65bc5db503a11() {
    self.var_86d77db605c0c948 = undefined;
    scripts\mp\weapons::updatemovespeedscale();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13385
// Size: 0x1e
function function_b128334187ed23fb() {
    self.var_2da660fa32b4cd1 = getdvarfloat(@"hash_d2139809963cc0c8", 0.8);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x133ab
// Size: 0xc
function function_26088d91835eae50() {
    self.var_2da660fa32b4cd1 = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x133bf
// Size: 0x1e
function function_763531f5f7839ab6() {
    self.var_a7004ed1f5ca8132 = getdvarfloat(@"hash_c825c43c66abd9c7", 0.8);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x133e5
// Size: 0xc
function function_d5d1e40fc4911309() {
    self.var_a7004ed1f5ca8132 = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x133f9
// Size: 0x1e
function function_91d30d6bd5c9987e() {
    self.var_dc3b97ba2322ca5a = getdvarfloat(@"hash_80d20097a357fa4b", 0.8);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1341f
// Size: 0xc
function function_67f057d98cc8b147() {
    self.var_dc3b97ba2322ca5a = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13433
// Size: 0x1f
function function_416b659a8c183f5() {
    self.var_ce58e8eff85f7366 = 0;
    self.var_381cb6b216dfa1a5 = 1;
    thread function_a107792339aa634a();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1345a
// Size: 0xc
function function_61f59f06b860e9de() {
    self.var_381cb6b216dfa1a5 = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1346e
// Size: 0x1f8
function function_a107792339aa634a() {
    level endon("game_ended");
    self endon("disconnect");
    var_73b315283a02415d = getdvarint(@"hash_526707faa275db17", 3000);
    var_a3bec96e7cc640f3 = getdvarfloat(@"hash_f01c092cfcf11d56", 0.05);
    var_910c617d84c5e97c = getdvarint(@"hash_13b7c83a06a9ea71", 3000);
    if (!isdefined(self.var_7698968039f1d786)) {
        self.var_7698968039f1d786 = [];
    }
    while (istrue(self.var_381cb6b216dfa1a5)) {
        speedmod = 0;
        timestamp = gettime();
        if (!istrue(self.var_9ee4330fe38ffc6) && isdefined(self.lastshottime) && isreallyalive(self) && self.lastshottime + var_73b315283a02415d >= timestamp) {
            speedmod = var_a3bec96e7cc640f3;
        }
        if (speedmod != self.var_ce58e8eff85f7366) {
            self.var_ce58e8eff85f7366 = speedmod;
            if (isreallyalive(self)) {
                scripts\mp\weapons::updatemovespeedscale();
            }
            if (speedmod > 0) {
                function_332887b37621cafe("lightweight");
            } else {
                function_dc6425bc8ea85ac0("lightweight");
                self.var_7698968039f1d786 = [];
            }
        }
        if (self.var_7698968039f1d786.size > 0) {
            foreach (guid, ts in self.var_7698968039f1d786) {
                if (isdefined(ts) && timestamp >= ts + var_910c617d84c5e97c) {
                    self.var_7698968039f1d786[guid] = undefined;
                }
            }
        }
        waitframe();
    }
    self.var_7698968039f1d786 = undefined;
    if (isdefined(self.var_ce58e8eff85f7366)) {
        self.var_ce58e8eff85f7366 = undefined;
        function_dc6425bc8ea85ac0("lightweight");
        if (isreallyalive(self)) {
            scripts\mp\weapons::updatemovespeedscale();
        }
    }
    self.lastshottime = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1366e
// Size: 0x9b
function function_332887b37621cafe(source) {
    level endon("game_ended");
    self endon("disconnect");
    assertex(isdefined(source), "showSpeedBoostOverlay requires a source value");
    if (!isdefined(self.var_54812cfe36016249)) {
        self.var_54812cfe36016249 = [];
    }
    if (!array_contains(self.var_54812cfe36016249, source)) {
        self.var_54812cfe36016249[self.var_54812cfe36016249.size] = source;
    }
    if (!istrue(self.var_9fc96f05758bf981)) {
        self.var_9fc96f05758bf981 = 1;
        self lerpfovbypreset("zombiedefault");
        self setclientomnvar("ui_speedboost_overlay", 0);
    }
    waitframe();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13711
// Size: 0xbd
function function_dc6425bc8ea85ac0(source) {
    level endon("game_ended");
    self endon("disconnect");
    assertex(isdefined(source), "clearSpeedBoostOverlay requires a source value");
    if (!isdefined(self.var_54812cfe36016249) || self.var_54812cfe36016249.size <= 0) {
        return;
    }
    sources = self.var_54812cfe36016249;
    if (array_contains(sources, source)) {
        self.var_54812cfe36016249 = array_remove(sources, source);
    }
    if (self.var_54812cfe36016249.size <= 0) {
        if (istrue(self.var_9fc96f05758bf981)) {
            self.var_9fc96f05758bf981 = undefined;
            childthread function_2348d57e12fccb7c();
            self lerpfovbypreset("default_2seconds");
        }
        self.var_54812cfe36016249 = undefined;
    }
    waitframe();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x137d6
// Size: 0x50
function function_bd90db337f1ae0d4(victim, attacker) {
    return istrue(victim.var_381cb6b216dfa1a5) && (!isdefined(victim.var_7698968039f1d786) || !array_contains_key(victim.var_7698968039f1d786, attacker.guid));
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1382f
// Size: 0x5b
function function_675990374e11b0f7(victim, attacker) {
    if (istrue(victim.var_381cb6b216dfa1a5)) {
        if (!isdefined(victim.var_7698968039f1d786)) {
            victim.var_7698968039f1d786 = [];
        }
        victim.var_7698968039f1d786[attacker.guid] = gettime();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13892
// Size: 0x21
function private function_2348d57e12fccb7c() {
    self setclientomnvar("ui_speedboost_overlay", 2);
    wait 1;
    self setclientomnvar("ui_speedboost_overlay", -1);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138bb
// Size: 0x24
function setblastshield() {
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        self.var_567daf189be4de79 = getdvarint(@"hash_23a1060a2b94c0ad", 1);
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138e7
// Size: 0x15
function unsetblastshield() {
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        self.var_567daf189be4de79 = undefined;
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13904
// Size: 0x21
function function_2cfe8d3390ebf739() {
    namespace_872204d77e9872c0::function_5ee813ae390b4ce5("discount_perk", getdvarfloat(@"hash_cf717cd86623a83e", 0.5));
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1392d
// Size: 0xe
function function_2aa14f9e313a7ba0() {
    namespace_872204d77e9872c0::function_ade912f6ea99fe68("discount_perk");
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13943
// Size: 0x9
function function_30aea63c9309d877() {
    function_dfd6f3f52d42539e();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13954
// Size: 0x9
function function_9fc353061d5d9106() {
    function_dfd6f3f52d42539e();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13965
// Size: 0x99
function function_dfd6f3f52d42539e() {
    if (istrue(getdvarint(@"hash_a50815ce2cfbefbc", 0))) {
        squad = getteamarray(self.team);
        if (isdefined(squad)) {
            foreach (player in squad) {
                player function_2188834b8d5fe9e(scripts\mp\gametypes\br_quest_util::function_fd4c76c90a1a0333(player));
            }
        }
        return;
    }
    function_2188834b8d5fe9e(scripts\mp\gametypes\br_quest_util::function_fd4c76c90a1a0333(self));
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a06
// Size: 0x18
function function_2188834b8d5fe9e(mod) {
    self setclientomnvar("ui_br_contract_plunder_mod", mod);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a26
// Size: 0xd
function function_63e67108575e2dd7() {
    self.var_11554e20eb10a6dd = 1;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a3b
// Size: 0xc
function function_e750c905a0033fc0() {
    self.var_11554e20eb10a6dd = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a4f
// Size: 0x1b
function function_a0bbf85d80bdaabe() {
    self.var_a3376181eed3ffac = getdvarfloat(@"hash_dcefbf9575257226", 3);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a72
// Size: 0xc
function function_78abdd07d9b93295() {
    self.var_a3376181eed3ffac = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a86
// Size: 0x142
function function_dd4a053345e159c2(victim) {
    victim notify("explosiveSlow");
    victim endon("explosiveSlow");
    victim endon("disconnect");
    level endon("game_ended");
    if (!isdefined(victim.var_db8213973d2bb844)) {
        victim.var_db8213973d2bb844 = getdvarfloat(@"hash_c4d8d43799f0121a", -0.2);
        victim weapons::updatemovespeedscale();
    }
    timer = getdvarfloat(@"hash_829c5a80bc42ed8a", 3);
    if (victim _hasperk("specialty_frangible_resist")) {
        timer *= 1 + getdvarfloat(@"hash_47984606bec7ddf7", -0.5);
    }
    currtime = gettime();
    if (!isdefined(victim.disabledshocktime) || currtime - victim.disabledshocktime > 800) {
        duration = 0.8;
        victim shellshock("chargemode_mp", duration);
        victim.disabledshocktime = currtime;
    }
    while (isalive(victim) && timer > 0) {
        timer -= level.framedurationseconds;
        waitframe();
    }
    victim.var_db8213973d2bb844 = undefined;
    victim.disabledshocktime = undefined;
    victim weapons::updatemovespeedscale();
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13bd0
// Size: 0x1c
function setscavenger() {
    if (isdefined(level.var_331f0fbe61a03f2b)) {
        self [[ level.var_331f0fbe61a03f2b ]]();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13bf4
// Size: 0x1c
function unsetscavenger() {
    if (isdefined(level.var_36ed758616fc9e8d)) {
        self [[ level.var_36ed758616fc9e8d ]]();
    }
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c18
// Size: 0x1b
function function_3922f41cdbeb95b9() {
    self.var_93d588c5ef8b2dec = getdvarfloat(@"hash_9c6401e541da3ee", 4);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c3b
// Size: 0xc
function function_de875074da5476ca() {
    self.healthregendelayoverride = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c4f
// Size: 0x1e
function function_a8f9bfbe4bdf794() {
    self.var_c6ae3b455bfb5ac6 = getdvarfloat(@"hash_2f47a9b7c7ebab97", 0.8);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13c75
// Size: 0xc
function function_5ad4b969c3cf8f77() {
    self.var_c6ae3b455bfb5ac6 = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c89
// Size: 0x1e
function function_5ba973385ec4be3() {
    self.var_c101ccd3d5f8bd81 = getdvarfloat(@"hash_62f5a23e338fbc5c", 3.5);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13caf
// Size: 0xc
function function_1021beef855460ac() {
    self.var_c101ccd3d5f8bd81 = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13cc3
// Size: 0x1e
function function_3a2773d17b85afb2() {
    self.var_1f8a2a7d3f537 = getdvarfloat(@"hash_d273a042e1a2ba0d", 0.75);
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ce9
// Size: 0xc
function function_90ff5254f7e28f7() {
    self.var_1f8a2a7d3f537 = undefined;
}

// Namespace perkfunctions / scripts\mp\perks\perkfunctions
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13cfd
// Size: 0x1ce
function function_1665d49ac1a4f08e(mindistoverride, maxdistoverride) {
    mindist = mindistoverride;
    maxdist = maxdistoverride;
    if (!isdefined(mindist)) {
        mindist = getdvarfloat(@"hash_24af95923d90f4fd", 0);
    }
    if (!isdefined(maxdist)) {
        maxdist = getdvarfloat(@"hash_cb9da631139b0a77", 24);
    }
    droporigin = self.origin;
    if (mindist != maxdist) {
        originoffsetdist = randomfloatrange(mindist, maxdist);
    } else {
        originoffsetdist = maxdist;
    }
    velocity = (0, 0, 0);
    if (originoffsetdist != 0) {
        originoffsetdir = anglestoforward((0, randomfloat(359), 0));
        targetposition = droporigin + originoffsetdir * originoffsetdist;
        gravity = (0, 0, getdvarint(@"hash_b5d7d39d32720e78") * -1);
        velocity = trajectorycalculateinitialvelocity(droporigin, targetposition, gravity, 0.5);
    }
    grenade = self launchgrenade("jup_smoke_grenade_mp", droporigin, velocity, 0.5);
    /#
        if (istrue(getdvarint(@"hash_21a13d02148f35f5", 0))) {
            position = grenade waittill("<dev string:x7b>");
            thread draw_line_for_time(droporigin, position, 1, 0, 0, 10);
            frameduration = int(10000 / level.frameduration + 0.5);
            print3d(position + (0, 0, 20), string(distance2d(droporigin, position)) + "<dev string:x83>", (1, 0, 0), 1, 1, frameduration, 1);
        }
    #/
}

