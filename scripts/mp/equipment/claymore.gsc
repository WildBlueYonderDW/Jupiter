// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\equipment.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\perk.gsc;
#using script_5762ac2f22202ba2;
#using scripts\cp_mp\vehicles\vehicle_mines.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\cp_mp\utility\train_utility.gsc;
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_736dec95a49487a6;
#using scripts\common\elevators.gsc;
#using scripts\mp\equipment_interact.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using script_7ef95bba57dc4b82;
#using scripts\mp\equipment\claymore.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\points.gsc;

#namespace claymore;

// Namespace claymore / scripts/mp/equipment/claymore
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d5
// Size: 0x52
function claymore_init() {
    level._effect["claymore_explode"] = loadfx("vfx/iw9/core/equipment/vfx_equip_claymore_trigger.vfx");
    if (istrue(game["isLaunchChunk"])) {
        return;
    }
    minetriggerdata = scripts/cp_mp/vehicles/vehicle_mines::vehicle_mines_getleveldataformine("equip_claymore", 1);
    minetriggerdata.triggercallback = &claymore_triggerfromvehicle;
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52e
// Size: 0x2c5
function claymore_use(grenade) {
    self endon("death_or_disconnect");
    grenade endon("death");
    if (_hasperk("specialty_rugged_eqp")) {
        grenade.hasruggedeqp = 1;
    }
    grenade.exploding = 1;
    thread scripts/mp/weapons::monitordisownedgrenade(self, grenade);
    if (isdefined(scripts/cp_mp/utility/player_utility::getvehicle())) {
        scripts/mp/hud_message::showerrormessage(grenade.bundle.var_512d802771a9bd3f);
        thread scripts/mp/equipment::incrementequipmentammo("equip_claymore", 1);
        waitframe();
        grenade delete();
    }
    plantdata = spawnstruct();
    plantdata.throwspeedforward = 100;
    plantdata.throwspeedup = -50;
    plantdata.castdivisions = 3;
    plantdata.castmaxtime = 0.5;
    plantdata.castdetail = 1;
    plantdata.plantmaxtime = 0.5;
    plantdata.plantmaxroll = 15;
    plantdata.plantmindistbeloweye = 12;
    plantdata.plantmaxdistbelowownerfeet = 20;
    plantdata.plantmindisteyetofeet = 45;
    plantdata.plantnormalcos = 0.342;
    plantdata.plantoffsetz = 3;
    if (scripts/cp_mp/utility/train_utility::player_standing_on_train()) {
        plantdata.plantoffsetz = plantdata.plantoffsetz + 2;
        plantdata.contents = scripts/cp_mp/utility/train_utility::function_d699841d5e241043();
    } else {
        plantdata.contents = physics_createcontents(["physicscontents_missileclip", "physicscontents_item", "physicscontents_vehicle", "physicscontents_glass"]);
    }
    plantresult = scripts/mp/utility/equipment::plant(grenade, plantdata);
    if (!istrue(plantresult)) {
        scripts/mp/hud_message::showerrormessage(grenade.bundle.var_512d802771a9bd3f);
        thread scripts/mp/equipment::incrementequipmentammo("equip_claymore", 1);
        grenade delete();
        return;
    }
    if (isdefined(level.var_ca4e08767cbdae12)) {
        canplant = grenade [[ level.var_ca4e08767cbdae12 ]]();
        if (!canplant) {
            scripts/mp/hud_message::showerrormessage(grenade.bundle.var_512d802771a9bd3f);
            scripts/mp/equipment::incrementequipmentslotammo("primary");
            grenade delete();
            return;
        }
    }
    linkedparent = grenade getlinkedparent();
    if (isdefined(linkedparent)) {
        grenade explosivehandlemovers(linkedparent);
    }
    grenade.exploding = 0;
    grenade thread claymore_plant();
    if (scripts/engine/utility::issharedfuncdefined("entity", "trackEntityLimit")) {
        [[ scripts/engine/utility::getsharedfunc("entity", "trackEntityLimit") ]](grenade, self);
        grenade thread function_a05a0b89582e22a3();
    }
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fa
// Size: 0x241
function claymore_plant() {
    self endon("mine_triggered");
    self endon("mine_destroyed");
    self endon("death");
    owner = self.owner;
    team = self.owner.team;
    scripts/cp_mp/ent_manager::registerspawn(1, &sweepclaymore);
    scripts/mp/sentientpoolmanager::registersentient("Lethal_Static", owner, 1);
    thread makeexplosiveusabletag("tag_use", 1);
    owner onequipmentplanted(self, "equip_claymore", &claymore_delete);
    thread monitordisownedequipment(owner, self);
    self missilethermal();
    self missileoutline();
    self setentityowner(owner);
    self setotherent(owner);
    self setnodeploy(1);
    self.headiconid = scripts/cp_mp/entityheadicons::setheadicon_factionimage(0, 5, undefined, undefined, undefined, 0.1, 1);
    thread scripts/mp/weapons::outlineequipmentforowner(self);
    thread minedamagemonitor();
    thread claymore_explodeonnotify();
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        self [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_ac5843028846c67);
    }
    if (issharedfuncdefined("emp", "setEMP_Cleared_Callback")) {
        self [[ getsharedfunc("emp", "setEMP_Cleared_Callback") ]](&function_b3a55145aba7855e);
    }
    scripts/cp_mp/emp_debuff::set_apply_emp_callback(&claymore_empapplied);
    namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_4373872960a2d51a);
    function_49197cd063a740ea(&claymore_destroy);
    if (isdefined(level.elevators)) {
        foreach (elevators in level.elevators) {
            elevators thread scripts/common/elevators::function_5c07037726ae5001(self);
        }
    }
    claymore_updatedangerzone();
    self setscriptablepartstate("plant", "active", 0);
    owner setscriptablepartstate("equipClaymoreFXView", "plant", 0);
    thread claymore_forceclampangles();
    wait(self.bundle.var_fc5fafaec60831f9);
    self setscriptablepartstate("arm", "active", 0);
    thread claymore_watchfortrigger();
    thread scripts/mp/equipment_interact::remoteinteractsetup(&claymore_trigger, 1, 1);
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa42
// Size: 0x6f
function claymore_updatedangerzone() {
    if (istrue(level.dangerzoneskipequipment)) {
        return;
    }
    if (isdefined(self.dangerzone)) {
        scripts/mp/spawnlogic::removespawndangerzone(self.dangerzone);
    }
    self.dangerzone = scripts/mp/spawnlogic::addspawndangerzone(self.origin, scripts/mp/spawnlogic::getdefaultminedangerzoneradiussize(), 72, self.owner.team, undefined, self.owner, 0, self, 1);
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab8
// Size: 0x73
function claymore_forceclampangles() {
    self endon("mine_selfdestruct");
    self endon("death");
    endtime = gettime() + 2000;
    while (endtime > gettime()) {
        yawonly = (0, self.angles[1], 0);
        maxdiff = 15;
        self.angles = anglelerpquat(yawonly, self.angles, maxdiff);
        waitframe();
    }
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb32
// Size: 0x356
function claymore_watchfortrigger() {
    self endon("mine_triggered");
    self endon("mine_destroyed");
    self endon("death");
    contents = physics_createcontents(["physicscontents_missileclip", "physicscontents_item", "physicscontents_vehicle", "physicscontents_glass", "physicscontents_water"]);
    while (true) {
        entarr = self waittill("trigger_grenade");
        /#
            assert(isdefined(entarr));
        #/
        if (istrue(self.stunned)) {
            continue;
        }
        foreach (ent in entarr) {
            if (isdefined(ent.classname)) {
                if (ent.classname == "script_vehicle") {
                    if (ent scripts/cp_mp/vehicles/vehicle_mines::vehicle_mines_isfriendlytomine(self)) {
                        continue;
                    }
                    if (!scripts/cp_mp/vehicles/vehicle_mines::vehicle_mines_shouldvehicletriggermine(ent, self)) {
                        continue;
                    }
                    scripts/cp_mp/vehicles/vehicle_mines::vehicle_mines_minetrigger(ent, self);
                    break;
                }
                if (isagent(ent) || isplayer(ent)) {
                    if (!isreallyalive(ent)) {
                        continue;
                    }
                    forward = anglestoforward(self.angles);
                    up = anglestoup(self.angles);
                    castorigin = self.origin + up * 0;
                    if (isent(self)) {
                        ignorelist = scripts/mp/utility/equipment::get_mine_ignore_list();
                    } else {
                        ignorelist = [];
                    }
                    var_ad283a45677a1ea3 = ent gettagorigin("j_mainroot");
                    eorigins = [var_ad283a45677a1ea3];
                    btwn = castorigin - var_ad283a45677a1ea3;
                    eorigin = ent.origin;
                    if (vectordot(btwn, (0, 0, 1)) >= 0) {
                        eorigin = isdefined(ent gettagorigin("j_spineupper", 1)) ? ent gettagorigin("j_spineupper", 1) : eorigin;
                    }
                    eorigins[eorigins.size] = eorigin;
                    handled = 0;
                    foreach (eorigin in eorigins) {
                        btwn = eorigin - self.origin;
                        var_cc00b910bd1d69c8 = vectordot(btwn, forward);
                        if (var_cc00b910bd1d69c8 > 90) {
                            continue;
                        }
                        var_69211973f7d7bbd6 = vectordot(btwn, up);
                        if (abs(var_69211973f7d7bbd6) > 32) {
                            continue;
                        }
                        var_a3d051ef761efd24 = vectornormalize(btwn);
                        var_74876e67651c79a6 = vectordot(var_a3d051ef761efd24, forward);
                        if (var_74876e67651c79a6 < 0.86602) {
                            continue;
                        }
                        castresults = physics_raycast(castorigin, eorigin, contents, ignorelist, 0, "physicsquery_closest", 1);
                        if (isdefined(castresults) && castresults.size > 0) {
                            continue;
                        }
                        handled = 1;
                        thread claymore_trigger(ent);
                    }
                    if (handled) {
                        break;
                    }
                }
            }
        }
    }
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe8f
// Size: 0xd3
function claymore_trigger(ent, attacker) {
    self endon("mine_destroyed");
    self endon("death");
    self.owner endon("disconnect");
    if (isdefined(attacker)) {
        attacker endon("disconnect");
    } else {
        attacker = self.owner;
    }
    self notify("mine_triggered");
    printgameaction("claymore triggered", self.owner);
    if (isent(self)) {
        makeexplosiveunusuabletag();
    }
    self setscriptablepartstate("arm", "neutral", 0);
    self setscriptablepartstate("trigger", "active", 0);
    graceperiod = default_to(self.bundle.claymore_graceperiod, 0);
    explosivetrigger(ent, graceperiod);
    thread claymore_explode(attacker);
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf69
// Size: 0x87
function claymore_triggerfromvehicle(vehicle, mine) {
    mine endon("mine_destroyed");
    mine endon("death");
    mine.owner endon("disconnect");
    mine notify("mine_triggered");
    mine makeexplosiveunusuabletag();
    mine setscriptablepartstate("arm", "neutral", 0);
    mine setscriptablepartstate("trigger", "active", 0);
    wait(mine.bundle.var_da8863dc7605cb83);
    mine thread claymore_explodefromvehicletrigger(vehicle);
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff7
// Size: 0x8a
function claymore_explodefromvehicletrigger(vehicle) {
    vehicle dodamage(self.bundle.var_1686cbcbae48a0fe, self.origin, self.owner, self, "MOD_EXPLOSIVE", makeweapon("claymore_mp"));
    ignoredamageid = vehicle scripts/mp/utility/damage::non_player_add_ignore_damage_signature(self.owner, makeweapon("claymore_mp"), self, "MOD_EXPLOSIVE");
    thread claymore_explode();
    waitframe();
    if (isdefined(vehicle)) {
        vehicle scripts/mp/utility/damage::non_player_remove_ignore_damage_signature(ignoredamageid);
    }
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1088
// Size: 0x28b
function claymore_explode(attacker) {
    self setscriptablepartstate("plant", "neutral", 0);
    self setscriptablepartstate("trigger", "neutral", 0);
    self setscriptablepartstate("explode", "active", 0);
    if (self getscriptablehaspart("health")) {
        self setscriptablepartstate("health", "ignore_damage", 0);
    }
    if (isent(self)) {
        level.mines[self getentitynumber()] = undefined;
        self setcandamage(0);
        scripts/cp_mp/ent_manager::deregisterspawn();
        makeexplosiveunusuabletag();
    }
    if (isdefined(self.useobj)) {
        self.useobj delete();
    }
    self.exploding = 1;
    owner = self.owner;
    if (isdefined(self.owner)) {
        owner removeequip(self);
    }
    scripts/cp_mp/entityheadicons::setheadicon_deleteicon(self.headiconid);
    forward = anglestoup(self.angles);
    right = -1 * anglestoright(self.angles);
    up = anglestoforward(self.angles);
    playfx(getfx("claymore_explode"), self.origin, forward, up);
    if (isent(self)) {
        var_25144f9160d59fd = self;
    } else if (isent(owner)) {
        var_25144f9160d59fd = owner;
        if (!isdefined(owner.var_2e8bbe611a66d602)) {
            owner.var_2e8bbe611a66d602 = [];
        }
        if (!isdefined(owner.var_2e8bbe611a66d602["claymore_mp"])) {
            owner.var_2e8bbe611a66d602["claymore_mp"] = [];
        }
        owner.var_2e8bbe611a66d602["claymore_mp"][owner.var_2e8bbe611a66d602["claymore_mp"].size] = self.index;
    }
    if (isdefined(var_25144f9160d59fd)) {
        var_25144f9160d59fd radiusdamage(self.origin, self.bundle.var_2870c709e5604e6f, 100, 100, self.owner, "MOD_EXPLOSIVE", isdefined(self.bundle.var_81e0f871add9f577) ? self.bundle.var_81e0f871add9f577 : "claymore_radial_mp");
    }
    earthquake(0.45, 0.7, self.origin, 800);
    if (isent(self)) {
        self detonate(attacker);
    }
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x131a
// Size: 0x77
function claymore_explodeonnotify() {
    self endon("death");
    level endon("game_ended");
    owner = self.owner;
    attacker = self waittill("detonateExplosive");
    self.detonatingplayer = attacker;
    self setscriptablepartstate("arm", "neutral", 0);
    self setscriptablepartstate("trigger", "active", 0);
    self notify("mine_triggered");
    thread claymore_explode(attacker);
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1398
// Size: 0xa
function sweepclaymore() {
    claymore_destroy();
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a9
// Size: 0x37
function claymore_destroy(destroydelay) {
    if (!isdefined(destroydelay)) {
        destroydelay = 0;
    }
    thread claymore_delete(destroydelay + 0.2);
    wait(destroydelay);
    self setscriptablepartstate("destroy", "active", 0);
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e7
// Size: 0x99
function claymore_empapplied(data) {
    attacker = data.attacker;
    if (istrue(scripts/cp_mp/utility/player_utility::playersareenemies(self.owner, attacker)) || getdvarint(@"hash_58254c61de76bffe", 0)) {
        attacker notify("destroyed_equipment");
        attacker scripts/mp/killstreaks/killstreaks::givescoreforequipment(self);
    }
    damagefeedback = "";
    if (istrue(self.hasruggedeqp)) {
        damagefeedback = "hitequip";
    }
    if (isplayer(attacker)) {
        attacker updatedamagefeedback(damagefeedback);
    }
    thread function_8ebab9db1b5be748(attacker);
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1487
// Size: 0x89
function function_ac5843028846c67(data) {
    attacker = data.attacker;
    if (istrue(scripts/cp_mp/utility/player_utility::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        attacker scripts/mp/killstreaks/killstreaks::givescoreforequipment(self, undefined, 1);
    }
    damagefeedback = "";
    if (istrue(self.hasruggedeqp)) {
        damagefeedback = "hitequip";
    }
    if (isplayer(attacker)) {
        attacker updatedamagefeedback(damagefeedback);
    }
    thread function_6d0e1341e170c6(attacker);
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1517
// Size: 0x85
function function_4373872960a2d51a(data) {
    attacker = data.attacker;
    if (istrue(scripts/cp_mp/utility/player_utility::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        attacker scripts/mp/killstreaks/killstreaks::givescoreforequipment(self);
    }
    damagefeedback = "";
    if (istrue(self.hasruggedeqp)) {
        damagefeedback = "hitequip";
    }
    if (isplayer(attacker)) {
        attacker updatedamagefeedback(damagefeedback);
    }
    claymore_explode(attacker);
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a3
// Size: 0x44
function function_8ebab9db1b5be748(attacker) {
    self endon("death");
    self setscriptablepartstate("empd", "active", 0);
    claymore_stunned(attacker, 6);
    self setscriptablepartstate("empd", "neutral", 0);
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ee
// Size: 0x2d
function function_6d0e1341e170c6(attacker) {
    self endon("death");
    self setscriptablepartstate("empd", "active", 0);
    function_3120a2693959efa1(attacker);
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1622
// Size: 0x12e
function claymore_delete(var_cbf7be4f62a0ddb2) {
    if (!isdefined(var_cbf7be4f62a0ddb2)) {
        var_cbf7be4f62a0ddb2 = 0;
    }
    self setscriptablepartstate("hack_usable", "off");
    self notify("death");
    scripts/cp_mp/ent_manager::deregisterspawn();
    if (isent(self)) {
        level.mines[self getentitynumber()] = undefined;
        self setcandamage(0);
        makeexplosiveunusuabletag();
    } else if (isdefined(level.var_8106ad57bb892525) && isdefined(level.var_8106ad57bb892525[self.index])) {
        level.var_8106ad57bb892525[self.index] = undefined;
    }
    scripts/cp_mp/entityheadicons::setheadicon_deleteicon(self.headiconid);
    self.headiconid = undefined;
    self.exploding = 1;
    if (isdefined(self.dangerzone)) {
        scripts/mp/spawnlogic::removespawndangerzone(self.dangerzone);
        self.dangerzone = undefined;
    }
    owner = self.owner;
    if (isdefined(self.owner)) {
        owner removeequip(self);
    }
    if (isdefined(var_cbf7be4f62a0ddb2)) {
        wait(var_cbf7be4f62a0ddb2);
    }
    if (isent(self)) {
        self delete();
        return;
    }
    self freescriptable();
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1757
// Size: 0x49b
function claymore_modifieddamage(victim, objweapon, inflictor, meansofdeath, damage) {
    if (!isdefined(inflictor)) {
        return damage;
    }
    if (isnullweapon(objweapon)) {
        return damage;
    }
    tableinfo = namespace_4fb9dddfb8c1a67a::getequipmenttableinfo("equip_claymore");
    bundle = tableinfo.bundle;
    if (isdefined(inflictor.owner)) {
        attacker = inflictor.owner;
        claymoreorigin = inflictor.origin;
        var_81af81c5d73867c1 = inflictor.angles;
    } else if (isdefined(inflictor.team) && isagent(inflictor) && objweapon.basename == (isdefined(bundle.var_81e0f871add9f577) ? bundle.var_81e0f871add9f577 : "claymore_radial_mp")) {
        attacker = inflictor;
        if (isdefined(attacker.var_2e8bbe611a66d602) && isdefined(attacker.var_2e8bbe611a66d602["claymore_mp"])) {
            foreach (explosiveid in attacker.var_2e8bbe611a66d602["claymore_mp"]) {
                explosive = level.var_8106ad57bb892525[explosiveid];
                claymoreorigin = explosive.origin;
                var_81af81c5d73867c1 = explosive.angles;
                attacker.var_2e8bbe611a66d602["claymore_mp"] = array_remove(attacker.var_2e8bbe611a66d602["claymore_mp"], explosiveid);
                break;
            }
        } else {
            /#
                assertmsg("Tried to explode an entless explosive without a valid scriptable ID");
            #/
        }
    }
    if (objweapon.basename == "claymore_mp") {
        if (isdefined(self.claymoreshitby)) {
            foreach (claymore in self.claymoreshitby) {
                if (isdefined(claymore) && claymore == inflictor) {
                    return 0;
                }
            }
        }
    } else if (objweapon.basename == (isdefined(bundle.var_81e0f871add9f577) ? bundle.var_81e0f871add9f577 : "claymore_radial_mp")) {
        if (!istrue(scripts/cp_mp/utility/player_utility::playersareenemies(victim, attacker))) {
            return 0;
        }
        thread scripts/mp/equipment/claymore::claymore_blockdamageuntilframeend(inflictor);
    } else {
        return damage;
    }
    if (isdefined(level.gametype) && scripts/cp_mp/utility/game_utility::isbrstylegametype()) {
        return damage;
    }
    if (!isexplosivedamagemod(meansofdeath)) {
        return damage;
    }
    btwn = victim.origin - claymoreorigin;
    dist = vectordot(btwn, anglestoup(var_81af81c5d73867c1));
    if (dist > 65) {
        return 0;
    }
    btwn = claymoreorigin - victim geteye();
    dist = vectordot(btwn, anglestoup(var_81af81c5d73867c1));
    if (dist > 65) {
        return 0;
    }
    forward = anglestoforward(var_81af81c5d73867c1);
    forward = (forward[0], forward[1], 0);
    disp = victim.origin - claymoreorigin;
    disp = (disp[0], disp[1], 0);
    dot = vectordot(forward, disp);
    if (dot < 0) {
        return 0;
    }
    dist = distance2d(claymoreorigin, victim.origin);
    ratio = 1 - clamp((dist - bundle.var_97202c494b76611a) / (bundle.var_974316494b9c7870 - bundle.var_97202c494b76611a), 0, 1);
    damage = bundle.var_f184982f38f0d4e + (bundle.var_974316494b9c7870 - bundle.var_97202c494b76611a) * ratio;
    if (isdefined(inflictor.detonatingplayer)) {
        var_68c7b0cd4c501af6 = isdefined(inflictor.owner) && inflictor.detonatingplayer == inflictor.owner;
        var_a38dc5334101941b = inflictor.detonatingplayer == victim;
        if (!var_68c7b0cd4c501af6 && var_a38dc5334101941b) {
            damage = min(damage, 80);
        }
    }
    return damage;
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bfa
// Size: 0x5a
function claymore_blockdamageuntilframeend(inflictor) {
    self endon("disconnect");
    self notify("claymore_blockDamageUntilFrameEnd");
    self endon("claymore_blockDamageUntilFrameEnd");
    if (!isdefined(self.claymoreshitby)) {
        self.claymoreshitby = [];
    }
    self.claymoreshitby[self.claymoreshitby.size] = inflictor;
    waittillframeend();
    self.claymoreshitby = undefined;
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c5b
// Size: 0x80
function claymore_onownerchanged(oldowner) {
    self setscriptablepartstate("hacked", "active", 0);
    claymore_updatedangerzone();
    sentientpool = self.sentientpool;
    scripts/mp/sentientpoolmanager::unregistersentient(self.sentientpool, self.sentientpoolindex);
    scripts/mp/sentientpoolmanager::registersentient(sentientpool, self.owner, 1);
    thread monitordisownedequipment(self.owner, self);
    thread outlineequipmentforowner(self);
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ce2
// Size: 0xa7
function claymore_stunned(attacker, duration) {
    self endon("death");
    if (!isdefined(duration)) {
        duration = self.bundle.claymore_stunduration;
    }
    if (isplayer(attacker)) {
        attacker updatedamagefeedback("hitequip");
    }
    self notify("claymore_stunned");
    self endon("claymore_stunned");
    attacker thread scripts/mp/utility/points::doScoreEvent(#"disabled_claymore");
    self setscriptablepartstate("arm", "neutral", 0);
    self.stunned = 1;
    wait(duration);
    self.stunned = 0;
    self setscriptablepartstate("arm", "active", 0);
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d90
// Size: 0x67
function function_3120a2693959efa1(attacker) {
    self endon("death");
    if (isplayer(attacker)) {
        attacker updatedamagefeedback("hitequip");
    }
    self notify("claymore_stunned");
    self endon("claymore_stunned");
    attacker thread scripts/mp/utility/points::doScoreEvent(#"disabled_claymore");
    self setscriptablepartstate("arm", "neutral", 0);
    self.stunned = 1;
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dfe
// Size: 0x28
function function_b3a55145aba7855e(data) {
    self.stunned = 0;
    self setscriptablepartstate("arm", "active", 0);
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e2d
// Size: 0x16
function function_49197cd063a740ea(callbackfunction) {
    self.var_d1659ed0a33bf98f = callbackfunction;
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e4a
// Size: 0x2b
function function_773e48f8d031510e() {
    self endon("mine_destroyed");
    self endon("death");
    level waittill_any_2("game_ended", "bro_shot_start");
    thread claymore_destroy();
}

// Namespace claymore / scripts/mp/equipment/claymore
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e7c
// Size: 0x20
function function_a05a0b89582e22a3() {
    self endon("mine_destroyed");
    self endon("death");
    self waittill("entity_limit_destroy");
    claymore_destroy();
}

