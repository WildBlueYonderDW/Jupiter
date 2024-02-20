// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\mp\movers.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\utility\dialog.gsc;

#namespace placeable;

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x318
// Size: 0x1a
function init() {
    if (!isdefined(level.placeableconfigs)) {
        level.placeableconfigs = [];
    }
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x339
// Size: 0x7a
function giveplaceable(streakname, var_41dbe7a9c2a55dab) {
    placeable = createplaceable(streakname);
    removeperks();
    self.carrieditem = placeable;
    /#
        if (getdvarint(@"hash_cae913bf39486207", 0) != 0) {
            var_41dbe7a9c2a55dab = 0;
        }
    #/
    result = onbegincarrying(streakname, placeable, 1, var_41dbe7a9c2a55dab);
    self.carrieditem = undefined;
    restoreperks();
    return isdefined(placeable);
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3bb
// Size: 0x110
function createplaceable(streakname) {
    if (isdefined(self.iscarrying) && self.iscarrying) {
        return;
    }
    config = level.placeableconfigs[streakname];
    obj = spawn("script_model", self.origin);
    obj setmodel(config.modelbase);
    obj.angles = self.angles;
    obj.owner = self;
    obj.team = self.team;
    obj.config = config;
    obj.firstplacement = 1;
    if (isdefined(config.oncreatedelegate)) {
        obj [[ config.oncreatedelegate ]](streakname);
    }
    obj deactivate(streakname);
    obj thread timeout(streakname);
    obj thread handleuse(streakname);
    obj thread onkillstreakdisowned(streakname);
    obj thread ongameended(streakname);
    return obj;
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4d3
// Size: 0x86
function handleuse(streakname) {
    self endon("death");
    level endon("game_ended");
    while (1) {
        player = self waittill("trigger");
        /#
            assert(player == self.owner);
        #/
        /#
            assert(!isdefined(self.carriedby));
        #/
        if (!isreallyalive(player)) {
            continue;
        }
        if (isdefined(self getlinkedparent())) {
            self unlink();
        }
        player onbegincarrying(streakname, self, 0);
    }
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x560
// Size: 0x1ae
function onbegincarrying(streakname, placeable, var_3a565847d875f3ec, var_41dbe7a9c2a55dab) {
    self endon("death_or_disconnect");
    /#
        assert(isreallyalive(self));
    #/
    placeable thread oncarried(streakname, self);
    val::set("carry", "weapon", 0);
    if (!isai(self)) {
        self notifyonplayercommand("placePlaceable", "+attack");
        self notifyonplayercommand("placePlaceable", "+attack_akimbo_accessible");
        self notifyonplayercommand("cancelPlaceable", "+actionslot 4");
        if (!self isconsoleplayer()) {
            self notifyonplayercommand("cancelPlaceable", "+actionslot 5");
            self notifyonplayercommand("cancelPlaceable", "+actionslot 6");
            self notifyonplayercommand("cancelPlaceable", "+actionslot 7");
        }
    }
    while (1) {
        if (isdefined(var_41dbe7a9c2a55dab) && var_41dbe7a9c2a55dab == 1 && !self isonladder() && self isonground() && !self ismantling()) {
            result = "placePlaceable";
        } else {
            result = waittill_any_return_3("placePlaceable", "cancelPlaceable", "force_cancel_placement");
        }
        if (!isdefined(placeable)) {
            val::function_c9d0b43701bdba00("carry");
            return 1;
        } else if (result == "cancelPlaceable" && var_3a565847d875f3ec || result == "force_cancel_placement") {
            placeable oncancel(streakname, result == "force_cancel_placement" && !isdefined(placeable.firstplacement));
            return 0;
        } else if (placeable.canbeplaced) {
            placeable thread onplaced(streakname);
            val::function_c9d0b43701bdba00("carry");
            return 1;
        } else {
            waitframe();
        }
    }
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x715
// Size: 0xe4
function oncancel(streakname, var_ddd5b75d0cd367c5) {
    if (isdefined(self.carriedby)) {
        owner = self.carriedby;
        owner forceusehintoff();
        owner.iscarrying = undefined;
        owner.carrieditem = undefined;
        owner val::function_c9d0b43701bdba00("carry");
    }
    if (isdefined(self.bombsquadmodel)) {
        self.bombsquadmodel delete();
    }
    if (isdefined(self.carriedobj)) {
        self.carriedobj delete();
    }
    config = level.placeableconfigs[streakname];
    if (isdefined(config.oncanceldelegate)) {
        self [[ config.oncanceldelegate ]](streakname);
    }
    if (isdefined(var_ddd5b75d0cd367c5) && var_ddd5b75d0cd367c5) {
        namespace_3bbb5a98b932c46f::equipmentdeletevfx();
    }
    self delete();
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x800
// Size: 0x270
function onplaced(streakname) {
    config = level.placeableconfigs[streakname];
    self.origin = self.placementorigin;
    self.angles = self.carriedobj.angles;
    self playsound(config.placedsfx);
    showplacedmodel(streakname);
    if (isdefined(config.onplaceddelegate)) {
        self [[ config.onplaceddelegate ]](streakname);
    }
    owner = self.owner;
    owner forceusehintoff();
    owner.iscarrying = undefined;
    self.carriedby = undefined;
    self.isplaced = 1;
    self.firstplacement = undefined;
    if (isdefined(config.headiconheight)) {
        self.headiconid = thread namespace_7bdde15c3500a23f::setheadicon_factionimage(0, config.headiconheight, 0, undefined, undefined, undefined, 1);
    }
    thread handledamage(streakname);
    thread handledeath(streakname);
    self makeusable();
    self setcursorhint("HINT_NOICON");
    self sethintstring(config.hintstring);
    namespace_6d9917c3dc05dbe9::registersentient("Killstreak_Ground", self.owner);
    foreach (player in level.players) {
        if (player == owner) {
            self enableplayeruse(player);
        } else {
            self disableplayeruse(player);
        }
    }
    if (isdefined(self.shouldsplash)) {
        level thread teamplayercardsplash(config.splashname, owner);
        self.shouldsplash = 0;
    }
    data = spawnstruct();
    data.linkparent = self.moving_platform;
    data.endonstring = "carried";
    if (isdefined(config.onmovingplatformcollision)) {
        data.deathoverridecallback = config.onmovingplatformcollision;
    }
    thread namespace_d7b023c7eb3949d0::handle_moving_platforms(data);
    thread watchplayerconnected();
    self notify("placed");
    self.carriedobj delete();
    self.carriedobj = undefined;
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa77
// Size: 0xd0
function oncarried(streakname, carrier) {
    config = level.placeableconfigs[streakname];
    /#
        assert(isplayer(carrier));
    #/
    /#
        assertex(carrier == self.owner, "_placeable::onCarried: specified carrier does not own this ims");
    #/
    self.carriedobj = carrier createcarriedobject(streakname);
    self.isplaced = undefined;
    self.carriedby = carrier;
    carrier.iscarrying = 1;
    deactivate(streakname);
    hideplacedmodel(streakname);
    if (isdefined(config.oncarrieddelegate)) {
        self [[ config.oncarrieddelegate ]](streakname);
    }
    thread updateplacement(streakname, carrier);
    thread oncarrierdeath(streakname, carrier);
    self notify("carried");
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb4e
// Size: 0x1ed
function updateplacement(streakname, carrier) {
    carrier endon("death_or_disconnect");
    level endon("game_ended");
    self endon("placed");
    self endon("death");
    self.canbeplaced = 1;
    var_60dd404a742cba9a = -1;
    config = level.placeableconfigs[streakname];
    placementoffset = (0, 0, 0);
    if (isdefined(config.placementoffsetz)) {
        placementoffset = (0, 0, config.placementoffsetz);
    }
    carriedobj = self.carriedobj;
    while (1) {
        placement = carrier canplayerplacesentry(1, config.placementradius);
        self.placementorigin = placement["origin"];
        carriedobj.origin = self.placementorigin + placementoffset;
        carriedobj.angles = placement["angles"];
        self.canbeplaced = carrier isonground() && placement["result"] && abs(self.placementorigin[2] - carrier.origin[2]) < config.placementheighttolerance;
        if (isdefined(placement["entity"])) {
            self.moving_platform = placement["entity"];
        } else {
            self.moving_platform = undefined;
        }
        if (self.canbeplaced != var_60dd404a742cba9a) {
            if (self.canbeplaced) {
                carriedobj setmodel(config.modelplacement);
                carrier forceusehinton(config.placestring);
            } else {
                carriedobj setmodel(config.modelplacementfailed);
                carrier forceusehinton(config.cannotplacestring);
            }
        }
        var_60dd404a742cba9a = self.canbeplaced;
        waitframe();
    }
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd42
// Size: 0x4f
function deactivate(streakname) {
    self makeunusable();
    hideheadicons();
    config = level.placeableconfigs[streakname];
    if (isdefined(config.ondeactivedelegate)) {
        self [[ config.ondeactivedelegate ]](streakname);
    }
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd98
// Size: 0x13
function hideheadicons() {
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconid);
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdb2
// Size: 0x52
function handledamage(streakname) {
    self endon("carried");
    config = level.placeableconfigs[streakname];
    namespace_3e725f3cc58bddd3::monitordamage(config.maxhealth, config.damagefeedback, &handledeathdamage, &modifydamage, 1);
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe0b
// Size: 0x132
function modifydamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    modifieddamage = damage;
    config = self.config;
    if (isdefined(config.allowmeleedamage) && config.allowmeleedamage) {
        modifieddamage = utility::handlemeleedamage(objweapon, type, modifieddamage);
    }
    if (isdefined(config.allowempdamage) && config.allowempdamage) {
        modifieddamage = namespace_3e725f3cc58bddd3::handleempdamage(objweapon, type, modifieddamage);
    }
    modifieddamage = namespace_3e725f3cc58bddd3::handlemissiledamage(objweapon, type, modifieddamage);
    modifieddamage = namespace_3e725f3cc58bddd3::handlegrenadedamage(objweapon, type, modifieddamage);
    modifieddamage = namespace_3e725f3cc58bddd3::handleapdamage(objweapon, type, modifieddamage, attacker);
    if (isdefined(config.modifydamage)) {
        modifieddamage = self [[ config.modifydamage ]](objweapon, type, modifieddamage);
    }
    return modifieddamage;
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf45
// Size: 0xe3
function handledeathdamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    config = self.config;
    var_3737240cefe2c793 = namespace_3e725f3cc58bddd3::onkillstreakkilled(self.streakname, attacker, objweapon, type, damage, config.scorepopup, config.destroyedvo);
    if (var_3737240cefe2c793 && isdefined(config.ondestroyeddelegate)) {
        self [[ config.ondestroyeddelegate ]](self.streakname, attacker, self.owner, type);
    }
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x102f
// Size: 0x85
function handledeath(streakname) {
    self endon("carried");
    self waittill("death");
    config = level.placeableconfigs[streakname];
    if (isdefined(self)) {
        deactivate(streakname);
        if (isdefined(config.modeldestroyed)) {
            self setmodel(config.modeldestroyed);
        }
        if (isdefined(config.ondeathdelegate)) {
            self [[ config.ondeathdelegate ]](streakname);
        }
        self delete();
    }
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10bb
// Size: 0x51
function oncarrierdeath(streakname, carrier) {
    self endon("placed");
    self endon("death");
    carrier endon("disconnect");
    carrier waittill("death");
    if (self.canbeplaced) {
        thread onplaced(streakname);
    } else {
        oncancel(streakname);
    }
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1113
// Size: 0x44
function onkillstreakdisowned(streakname) {
    self endon("death");
    level endon("game_ended");
    childthread watchownerstatus("disconnect", streakname);
    childthread watchownerstatus("joined_team", streakname);
    childthread watchownerstatus("joined_spectators", streakname);
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x115e
// Size: 0x28
function watchownerstatus(var_70687e0cc558a009, streakname) {
    self.owner waittill(var_70687e0cc558a009);
    cleanup(streakname);
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x118d
// Size: 0x23
function ongameended(streakname) {
    self endon("death");
    level waittill("game_ended");
    cleanup(streakname);
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11b7
// Size: 0x2c
function cleanup(streakname) {
    if (isdefined(self.isplaced)) {
        self notify("death");
    } else {
        oncancel(streakname);
    }
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11ea
// Size: 0x2e
function watchplayerconnected() {
    self endon("death");
    while (1) {
        player = level waittill("connected");
        thread onplayerconnected(player);
    }
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x121f
// Size: 0x2a
function onplayerconnected(owner) {
    self endon("death");
    owner endon("disconnect");
    owner waittill("spawned_player");
    self disableplayeruse(owner);
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1250
// Size: 0xb7
function timeout(streakname) {
    self endon("death");
    level endon("game_ended");
    config = level.placeableconfigs[streakname];
    lifespan = config.lifespan;
    while (lifespan > 0) {
        wait(1);
        namespace_e323c8674b44c8f4::waittillhostmigrationdone();
        if (!isdefined(self.carriedby)) {
            lifespan = lifespan - 1;
        }
    }
    if (isdefined(self.owner) && isdefined(config.gonevo)) {
        self.owner thread namespace_944ddf7b8df1b0e3::leaderdialogonplayer(config.gonevo);
    }
    self notify("death");
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x130e
// Size: 0x2b
function removeweapons() {
    if (self hasweapon("iw6_riotshield_mp")) {
        self.restoreweapon = "iw6_riotshield_mp";
        _takeweapon("iw6_riotshield_mp");
    }
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1340
// Size: 0x2b
function removeperks() {
    if (_hasperk("specialty_explosivebullets")) {
        self.restoreperk = "specialty_explosivebullets";
        removeperk("specialty_explosivebullets");
    }
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1372
// Size: 0x2a
function restoreweapons() {
    if (isdefined(self.restoreweapon)) {
        _giveweapon(self.restoreweapon);
        self.restoreweapon = undefined;
    }
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13a3
// Size: 0x2a
function restoreperks() {
    if (isdefined(self.restoreperk)) {
        giveperk(self.restoreperk);
        self.restoreperk = undefined;
    }
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13d4
// Size: 0x37
function showplacedmodel(streakname) {
    self show();
    if (isdefined(self.bombsquadmodel)) {
        self.bombsquadmodel show();
        level notify("update_bombsquad");
    }
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1412
// Size: 0x2f
function hideplacedmodel(streakname) {
    self hide();
    if (isdefined(self.bombsquadmodel)) {
        self.bombsquadmodel hide();
    }
}

// Namespace placeable/namespace_cac9ec0529ef7f4d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1448
// Size: 0xf5
function createcarriedobject(streakname) {
    /#
        assertex(isdefined(self), "createIMSForPlayer() called without owner specified");
    #/
    if (isdefined(self.iscarrying) && self.iscarrying) {
        return;
    }
    carriedobj = spawnturret("misc_turret", self.origin + (0, 0, 25), "sentry_minigun_mp");
    carriedobj.angles = self.angles;
    carriedobj.owner = self;
    config = level.placeableconfigs[streakname];
    carriedobj setmodel(config.modelbase);
    carriedobj maketurretinoperable();
    carriedobj setturretmodechangewait(1);
    carriedobj setmode("sentry_offline");
    carriedobj makeunusable();
    carriedobj setsentryowner(self);
    carriedobj setsentrycarrier(self);
    carriedobj setcandamage(0);
    carriedobj notsolid();
    return carriedobj;
}

