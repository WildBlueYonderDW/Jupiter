// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\cp_mp\parachute.gsc;
#using scripts\mp\equipment.gsc;

#namespace fulton;

// Namespace fulton/namespace_35493d8b6027046f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ef
// Size: 0xc3
function fulton_init() {
    fulton_initrepository();
    if (!namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        game["dialog"]["plunder_extract_fail_fulton"] = "pxff_grav_plnd";
    } else {
        game["dialog"]["plunder_extract_fail_fulton"] = "plunder_plunder_extract_fail_fulton";
    }
    level._effect["vfx_fulton_explode"] = loadfx("vfx/iw8_br/gameplay/vfx_br_money_fulton_destr.vfx");
    /#
        setdevdvarifuninitialized(@"hash_480475a0dec18661", 1);
        setdevdvarifuninitialized(@"hash_491b43c08b40fe8c", 1);
        setdevdvarifuninitialized(@"hash_6bcaa107055e7a7f", 0.75);
        setdevdvarifuninitialized(@"hash_f28eeaada0889d3a", 250);
        setdevdvarifuninitialized(@"hash_de5cf9b63e5508db", 1500);
        setdevdvarifuninitialized(@"hash_3fed2bee9823c2be", 20);
    #/
}

// Namespace fulton/namespace_35493d8b6027046f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b9
// Size: 0x84
function fulton_initanims() {
    level.scr_animtree["fulton"] = %script_model;
    level.scr_anim["fulton"]["fulton_open"] = level.var_1a209bd995a7fa83["wm_skyhook_ground_open"];
    level.scr_anim["fulton"]["fulton_open_idle"] = level.var_1a209bd995a7fa83["wm_skyhook_ground_idle_open"];
    level.scr_anim["fulton"]["fulton_takeoff"] = level.var_1a209bd995a7fa83["wm_skyhook_ground_takeoff"];
}

// Namespace fulton/namespace_35493d8b6027046f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x644
// Size: 0x1ac
function fulton_initrepository() {
    var_464eb48901113eb0 = plunder_getleveldataforrepository("equip_mp_fulton", 1);
    var_464eb48901113eb0.type = 0;
    var_464eb48901113eb0.usetime = getdvarfloat(@"hash_6bcaa107055e7a7f", 0.75);
    var_464eb48901113eb0.useeventtype = 2;
    var_464eb48901113eb0.useeventamount = getdvarint(@"hash_f28eeaada0889d3a", 250);
    var_464eb48901113eb0.teamuseonly = 1;
    var_464eb48901113eb0.teamanchoredwidget = 1;
    var_464eb48901113eb0.usefailcapacitymsg = "MP/CANNOT_DEPOSIT_CASH_BALLOON_FULL";
    var_464eb48901113eb0.usefailextractingmsg = "MP/CANNOT_DEPOSIT_CASH_BALLOON_LEAVING";
    var_464eb48901113eb0.scriptableusepart = "fulton_use_cache";
    var_464eb48901113eb0.scriptableusestate = "usable";
    var_464eb48901113eb0.scriptablenousestate = "unusable";
    var_464eb48901113eb0.extractcountdown = getdvarint(@"hash_3fed2bee9823c2be", 20);
    var_464eb48901113eb0.extractcountdownmsg = "MP/CASH_BALLOON_LEAVING_IN_N";
    var_464eb48901113eb0.capacity = getdvarint(@"hash_de5cf9b63e5508db", 1500);
    var_464eb48901113eb0.countdownendcallback = &fulton_repositorycountdownendcallback;
    var_464eb48901113eb0.extractcallback = &fulton_repositoryextractcallback;
    var_464eb48901113eb0.atcapacitycallback = &fulton_repositoryatcapacitycallback;
    var_464eb48901113eb0.extractionmethod = "fulton";
    var_464eb48901113eb0.dropplunder = getdvarint(@"hash_491b43c08b40fe8c", 1) > 0;
    var_464eb48901113eb0.cantakedamage = getdvarint(@"hash_480475a0dec18661", 1) > 0;
}

// Namespace fulton/namespace_35493d8b6027046f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f7
// Size: 0xec
function fulton_create(grenade) {
    fulton = spawn("script_model", grenade.origin);
    fulton setautoboxcalculationusingdobj(1);
    var_cb09fafea872c96d = "military_skyhook_far_mp";
    if (istrue(level.var_5a2620a56cf4bb)) {
        var_cb09fafea872c96d = "military_skyhook_far_plunder";
    }
    fulton setmodel(var_cb09fafea872c96d);
    fulton.angles = grenade.angles;
    fulton.owner = self;
    fulton.team = self.team;
    if (isdefined(grenade.moving_platform)) {
        fulton.moving_platform = grenade.moving_platform;
    }
    fulton.animname = "fulton";
    fulton namespace_bc4a4b9456315863::setanimtree();
    self.fulton = fulton;
    fulton thread fulton_planted();
}

// Namespace fulton/namespace_35493d8b6027046f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ea
// Size: 0x9d
function fulton_destroy(damagedata) {
    var_464eb48901113eb0 = plunder_getleveldataforrepository("equip_mp_fulton");
    thread namespace_d20f8ef223912e12::teamsplashbr("br_fulton_balloon_shot_down", self.owner, self.team, undefined, "splash_list_br_plunder_iw9_mp");
    namespace_c6ccccd95254983f::entityplunderlosealldeposited(var_464eb48901113eb0.dropplunder);
    playfx(getfx("vfx_fulton_explode"), self.origin, anglestoforward(self.angles));
    playsoundatpos(self.origin, "br_fulton_extract_exp");
    thread fulton_deletenextframe();
}

// Namespace fulton/namespace_35493d8b6027046f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98e
// Size: 0xa7
function fulton_deletenextframe() {
    self notify("death");
    if (isdefined(self.owner)) {
        self.owner.fulton = undefined;
    }
    self hide();
    namespace_3e725f3cc58bddd3::monitordamageend();
    self setscriptablepartstate("fulton_use_cache", "unusable", 0);
    self setscriptablepartstate("fulton_use_extract", "unusable", 0);
    self setscriptablepartstate("effects", "neutral", 0);
    plunder_deregisterrepositoryinstance(self);
    self stopanimscripted();
    if (isdefined(self.scenenode)) {
        self.scenenode delete();
    }
    waitframe();
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace fulton/namespace_35493d8b6027046f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa3c
// Size: 0x151
function fulton_used(grenade) {
    self endon("death_or_disconnect");
    if (!istrue(level.br_plunder_enabled)) {
        return;
    }
    stuckto = grenade waittill("missile_stuck");
    if (isdefined(stuckto)) {
        if (getdvarint(@"hash_269506ff08a558cd", 1) == 1) {
            fulton_check_for_moving_platform(grenade, stuckto);
        }
        if (!isdefined(grenade.moving_platform)) {
            self playlocalsound("br_pickup_deny");
            namespace_44abc05161e2e2cb::showerrormessage("MP/CASH_BALLOON_CANNOT_PLACE");
            if (isdefined(self.super)) {
                fulton_refundsuper();
            }
            grenade delete();
            return;
        }
    }
    if (!fulton_cancreate(grenade)) {
        self playlocalsound("br_pickup_deny");
        namespace_44abc05161e2e2cb::showerrormessage("MP/CASH_BALLOON_BLOCKED");
        if (isdefined(self.super)) {
            fulton_refundsuper();
        }
        grenade delete();
        return;
    } else if (1 && isdefined(self.fulton)) {
        self playlocalsound("br_pickup_deny");
        namespace_44abc05161e2e2cb::showerrormessage("MP/CASH_BALLOON_TOO_MANY");
        if (isdefined(self.super)) {
            fulton_refundsuper();
        }
        grenade delete();
        return;
    }
    if (isdefined(self.super)) {
        namespace_85d036cb78063c4a::superusefinished(undefined, undefined, undefined, 1);
    }
    thread fulton_create(grenade);
    if (isdefined(grenade)) {
        grenade delete();
    }
}

// Namespace fulton/namespace_35493d8b6027046f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb94
// Size: 0x9b
function fulton_check_for_moving_platform(grenade, stuckto) {
    if (isdefined(stuckto.linked_brush)) {
        if (isdefined(stuckto.linked_brush.targetname)) {
            if (stuckto.linked_brush.targetname == "train_wz") {
                grenade.moving_platform = stuckto;
            }
        }
    } else if (isdefined(stuckto.targetname) && stuckto.targetname == "train_wz") {
        grenade.moving_platform = stuckto;
    }
}

// Namespace fulton/namespace_35493d8b6027046f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc36
// Size: 0x15c
function fulton_planted() {
    self endon("death");
    self endon("start_extract");
    playsoundatpos(self.origin, "iw9_extraction_balloon_drop");
    thread namespace_d20f8ef223912e12::teamsplashbr("br_fulton_device_placed", self.owner, self.team, undefined, "splash_list_br_plunder_iw9_mp");
    players = namespace_54d20dd0dd79277f::getfriendlyplayers(self.team);
    plunder_registerrepositoryinstance(self, "equip_mp_fulton");
    thread namespace_c6ccccd95254983f::plunder_repositorywatchcountdown(self, players);
    plunder_updateanchoredwidgetforplayers(self, players);
    scenenode = spawn("script_model", self.origin);
    scenenode setmodel("tag_origin");
    scenenode.angles = self.angles * (0, 1, 0);
    scenenode.fulton = self;
    self.scenenode = scenenode;
    if (isdefined(self.moving_platform)) {
        self linkto(self.moving_platform);
        scenenode linkto(self.moving_platform);
    }
    fulton_open();
    var_464eb48901113eb0 = plunder_getleveldataforrepository("equip_mp_fulton", 1);
    if (var_464eb48901113eb0.cantakedamage) {
        thread namespace_3e725f3cc58bddd3::monitordamage(300, "", &fulton_handlefataldamage, &fulton_handledamage);
    }
}

// Namespace fulton/namespace_35493d8b6027046f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd99
// Size: 0x3b
function fulton_open() {
    self setscriptablepartstate("effects", "fillUp", 0);
    self.scenenode namespace_bc4a4b9456315863::anim_single_solo(self, "fulton_open");
    childthread function_f71b5e7dfcfa8820();
    childthread fulton_openidle();
}

// Namespace fulton/namespace_35493d8b6027046f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xddb
// Size: 0x21
function fulton_openidle() {
    while (1) {
        self.scenenode namespace_bc4a4b9456315863::anim_single_solo(self, "fulton_open_idle");
    }
}

// Namespace fulton/namespace_35493d8b6027046f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe03
// Size: 0x3f
function function_f71b5e7dfcfa8820() {
    self endon("death");
    var_72b2451562363925 = "iw9_extraction_balloon_idle_lp";
    play_loop_sound_on_entity(var_72b2451562363925, (0, 0, 72));
    self waittill("fulton_takeoff");
    stop_loop_sound_on_entity(var_72b2451562363925);
}

// Namespace fulton/namespace_35493d8b6027046f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe49
// Size: 0xe7
function fulton_handledamage(damagedata) {
    damage = damagedata.damage;
    if (!istrue(namespace_f8065cafc523dba5::playersareenemies(damagedata.attacker, self.owner))) {
        damage = 0;
    } else {
        damage = namespace_3e725f3cc58bddd3::handleshotgundamage(damagedata.objweapon, damagedata.meansofdeath, damagedata.damage);
        hitstokill = undefined;
        if (damagedata.meansofdeath == "MOD_MELEE") {
            damage = int(ceil(self.maxhealth / 6));
        } else if (isexplosivedamagemod(damagedata.meansofdeath)) {
            if (damagedata.damage >= 50) {
                damage = int(ceil(self.maxhealth / 1));
            }
        }
    }
    return damage;
}

// Namespace fulton/namespace_35493d8b6027046f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf38
// Size: 0x15
function fulton_handlefataldamage(damagedata) {
    thread fulton_destroy(damagedata);
}

// Namespace fulton/namespace_35493d8b6027046f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf54
// Size: 0x48
function fulton_repositoryusecallback(entity, player, amount) {
    var_464eb48901113eb0 = plunder_getleveldataforrepository("equip_mp_fulton");
    player thread playerplunderevent(amount, var_464eb48901113eb0.useeventtype, entity);
}

// Namespace fulton/namespace_35493d8b6027046f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa3
// Size: 0x40
function fulton_repositorycountdownendcallback(entity, var_c76f5ba0ad745444) {
    if (isdefined(entity.owner)) {
        entity.owner.fulton = undefined;
    }
    plunder_repositoryextract(entity);
}

// Namespace fulton/namespace_35493d8b6027046f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfea
// Size: 0x9c
function fulton_repositoryextractcallback(entity) {
    entity endon("death");
    var_464eb48901113eb0 = plunder_getleveldataforrepository("equip_mp_fulton");
    data = undefined;
    entity namespace_3e725f3cc58bddd3::monitordamageend();
    data = namespace_c6ccccd95254983f::entityplunderbankalldeposited();
    thread namespace_d20f8ef223912e12::teamsplashbr("br_fulton_balloon_successfully_away", self.owner, self.team, undefined, "splash_list_br_plunder_iw9_mp");
    self notify("fulton_takeoff");
    self playsoundonmovingent("iw9_extraction_balloon_takeoff");
    self.scenenode namespace_bc4a4b9456315863::anim_single_solo(self, "fulton_takeoff");
    thread fulton_deletenextframe();
}

// Namespace fulton/namespace_35493d8b6027046f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108d
// Size: 0x35
function fulton_repositoryatcapacitycallback(entity) {
    thread namespace_d20f8ef223912e12::teamsplashbr("br_fulton_balloon_full", entity.owner, entity.team, undefined, "splash_list_br_plunder_iw9_mp");
}

// Namespace fulton/namespace_35493d8b6027046f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c9
// Size: 0xbd
function fulton_cancreate(grenade) {
    if (namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        return 1;
    }
    var_57f6e7d1be00d5f9 = 25;
    planeflyheight = namespace_5078ee98abb32db9::getc130height();
    start = grenade.origin + (0, 0, var_57f6e7d1be00d5f9 + 1);
    end = (grenade.origin[0], grenade.origin[1], planeflyheight);
    contents = create_contents(0, 1, 1, 1, 1, 1, 0);
    var_e96577032a7740fc = sphere_trace(start, end, var_57f6e7d1be00d5f9, grenade, contents);
    return var_e96577032a7740fc["fraction"] == 1;
}

// Namespace fulton/namespace_35493d8b6027046f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x118e
// Size: 0x49
function fulton_refundsuper() {
    self notify("super_use_finished_lb");
    self notify("super_use_finished");
    var_19163e14365d9264 = namespace_85d036cb78063c4a::getcurrentsuper();
    namespace_85d036cb78063c4a::setsuperisinuse(0);
    namespace_85d036cb78063c4a::setsuperexpended(0);
    var_19163e14365d9264.wasrefunded = 1;
    namespace_85d036cb78063c4a::refundsuper();
}

// Namespace fulton/namespace_35493d8b6027046f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11de
// Size: 0x1f
function function_5b95dd8b798c16e1() {
    if (namespace_1a507865f681850e::hasequipment("equip_extract")) {
        namespace_1a507865f681850e::incrementequipmentammo("equip_extract", 1);
    }
}

