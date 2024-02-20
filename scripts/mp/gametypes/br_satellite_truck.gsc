// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\gametypes\br_functional_poi.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\gametypes\br.gsc;

#namespace namespace_d15f50588af476af;

// Namespace namespace_d15f50588af476af/namespace_cb679e0508ce5044
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a2
// Size: 0x111
function init() {
    level._effect["poi_sat_truck_available"] = loadfx("vfx/iw8_br/gameplay/vfx_br_poi_satnav_white.vfx");
    level._effect["poi_sat_truck_charging"] = loadfx("vfx/iw8_br/gameplay/vfx_br_poi_satnav_red.vfx");
    level.br_satellitetruck = [];
    level.br_satellite_truck_enabled = getdvarint(@"hash_2f77ec116b49bdf9", 0) != 0;
    level.satellitetruckactivetimeseconds = getdvarfloat(@"hash_aed581beb83f1b08", 15);
    level.satellitetruckplundercost = getdvarint(@"hash_e361609d81154a08", 1);
    namespace_15111e421d79d07d::initstatemachineforpoitype("satellite_truck");
    namespace_15111e421d79d07d::registerstatecallbacksforpoitype("satellite_truck", 0, &_onenterdefaultstate, undefined, &_onexitdefaultstate);
    namespace_15111e421d79d07d::registerstatecallbacksforpoitype("satellite_truck", 1, &_onenterchargingstate, undefined, &_onexitchargingstate);
    namespace_15111e421d79d07d::registerstatecallbacksforpoitype("satellite_truck", 2, &_onenteractivestate, undefined, &_onexitactivestate);
    namespace_15111e421d79d07d::registerstatecallbacksforpoitype("satellite_truck", 3, &_onenterscanningstate, undefined, &_onexitscanningstate);
    namespace_15111e421d79d07d::registerstatecallbacksforpoitype("satellite_truck", 4, &_onentercooldownstate, undefined, undefined);
}

// Namespace namespace_d15f50588af476af/namespace_cb679e0508ce5044
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ba
// Size: 0x1c9
function spawnsatellitetruck(struct) {
    if (!istrue(level.br_satellite_truck_enabled)) {
        return;
    }
    var_f95cd92c3f35a916 = spawn("script_model", struct.origin);
    if (isdefined(struct.angles)) {
        var_f95cd92c3f35a916.angles = struct.angles;
    }
    var_f95cd92c3f35a916 setmodel("veh8_mil_lnd_mkilo23_skud_static2");
    var_b7729b6d8545a7fe = getstruct(struct.target, "targetname");
    if (!isdefined(var_f95cd92c3f35a916.satellitekeyboard)) {
        satellitekeyboard = spawn("script_model", var_b7729b6d8545a7fe.origin);
        if (isdefined(var_b7729b6d8545a7fe.angles)) {
            satellitekeyboard.angles = var_b7729b6d8545a7fe.angles;
        }
        satellitekeyboard setmodel("electrical_elevator_access_keypad_01");
        satellitekeyboard setcursorhint("HINT_NOICON");
        satellitekeyboard setuseholdduration("duration_medium");
        satellitekeyboard sethintdisplayfov(120);
        satellitekeyboard setusefov(120);
        satellitekeyboard setuserange(80);
        satellitekeyboard setusepriority(-1);
        var_f95cd92c3f35a916.satellitekeyboard = satellitekeyboard;
    }
    satelliteiconid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    if (satelliteiconid != -1) {
        namespace_5a22b6f3a56f7e9b::objective_add_objective(satelliteiconid, "active", (0, 0, 0), "hud_icon_br_satellite_truck");
        namespace_5a22b6f3a56f7e9b::update_objective_onentity(satelliteiconid, var_f95cd92c3f35a916);
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(satelliteiconid, 1);
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(satelliteiconid);
        var_f95cd92c3f35a916.satelliteiconid = satelliteiconid;
        var_f95cd92c3f35a916 thread _satellitetruckmanageminimapicon();
    } else {
        /#
            println("tag_origin");
        #/
    }
    level.br_satellitetruck[level.br_satellitetruck.size] = var_f95cd92c3f35a916;
    return var_f95cd92c3f35a916;
}

// Namespace namespace_d15f50588af476af/namespace_cb679e0508ce5044
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68b
// Size: 0x5e
function onprematchdone() {
    foreach (var_e08cf97a737eede1 in level.br_satellitetruck) {
        var_e08cf97a737eede1 namespace_15111e421d79d07d::gotopoistate("satellite_truck", 0);
    }
}

// Namespace namespace_d15f50588af476af/namespace_cb679e0508ce5044
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f0
// Size: 0x17a
function _satellitetruckmanageminimapicon() {
    var_e08cf97a737eede1 = self;
    var_e08cf97a737eede1 endon("death");
    updateinterval = 1;
    var_e2329e812c2919bb = 5000;
    var_e08cf97a737eede1.playersinrange = [];
    while (1) {
        wait(updateinterval);
        if (!istrue(level.br_prematchstarted)) {
            continue;
        }
        foreach (player in var_e08cf97a737eede1.playersinrange) {
            if (isdefined(player)) {
                namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(var_e08cf97a737eede1.satelliteiconid, player);
            }
        }
        var_e08cf97a737eede1.playersinrange = namespace_7e17181d03156026::getplayersinradius(var_e08cf97a737eede1.origin, var_e2329e812c2919bb);
        foreach (player in var_e08cf97a737eede1.playersinrange) {
            if (isdefined(var_e08cf97a737eede1.playerteam) && player.team == var_e08cf97a737eede1.playerteam && var_e08cf97a737eede1.currentstate == 3) {
                continue;
            }
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(var_e08cf97a737eede1.satelliteiconid, player);
        }
    }
}

// Namespace namespace_d15f50588af476af/namespace_cb679e0508ce5044
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x871
// Size: 0x19f
function _satellitetruckstartsound() {
    var_e08cf97a737eede1 = self;
    var_5c8800eda76b9a59 = var_e08cf97a737eede1;
    var_dd99c56a1f7a2b7 = var_e08cf97a737eede1.satellitekeyboard;
    /#
        assertex(isdefined(var_dd99c56a1f7a2b7), "sat truck with no sat keyboard!");
    #/
    while (1) {
        var_e08cf97a737eede1 waittill("poi_state_change");
        state = var_e08cf97a737eede1.currentstate;
        if (!isdefined(var_e08cf97a737eede1.audiostate)) {
            var_e08cf97a737eede1.audiostate = state;
        } else if (var_e08cf97a737eede1.audiostate == state) {
            continue;
        }
        var_e08cf97a737eede1.audiostate = state;
        switch (state) {
        default:
            break;
        case 0:
            break;
        case 1:
            var_5c8800eda76b9a59 playsound("truck_sattruck_initialstartup_os");
            wait(7.5);
            var_5c8800eda76b9a59 playloopsound("truck_sattruck_idling_lp");
            break;
        case 2:
            break;
        case 3:
            var_e08cf97a737eede1.isscanning = 1;
            var_dd99c56a1f7a2b7 playsound("truck_sattruck_initdeploy_os");
            wait(4);
            var_dd99c56a1f7a2b7 playloopsound("truck_sattruck_scanning_lp");
            break;
        case 4:
            var_5c8800eda76b9a59 playsound("truck_sattruck_engineoff");
            if (istrue(var_e08cf97a737eede1.isscanning)) {
                var_dd99c56a1f7a2b7 playsound("truck_sattruck_scanning_off");
                var_e08cf97a737eede1.isscanning = undefined;
                wait(0.05);
                var_dd99c56a1f7a2b7 stoploopsound();
            }
            wait(0.45);
            var_5c8800eda76b9a59 stoploopsound();
            break;
        }
    }
}

// Namespace namespace_d15f50588af476af/namespace_cb679e0508ce5044
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa17
// Size: 0x17
function _satellitetruckendusethink() {
    var_e08cf97a737eede1 = self;
    var_e08cf97a737eede1 notify("satelliteTruckUseThinkEnd");
}

// Namespace namespace_d15f50588af476af/namespace_cb679e0508ce5044
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa35
// Size: 0x125
function _satellitetruckusethink() {
    var_e08cf97a737eede1 = self;
    var_e08cf97a737eede1 endon("death");
    var_e08cf97a737eede1 _satellitetruckendusethink();
    var_e08cf97a737eede1 endon("satelliteTruckUseThinkEnd");
    var_e08cf97a737eede1 thread _satellitetruckstartsound();
    var_3268df12a22d1a03 = var_e08cf97a737eede1 namespace_15111e421d79d07d::getcurrentpoistate();
    while (1) {
        player = var_e08cf97a737eede1.satellitekeyboard waittill("trigger");
        if (var_e08cf97a737eede1 namespace_15111e421d79d07d::getcurrentpoistate() != var_3268df12a22d1a03) {
            return;
        }
        if (var_e08cf97a737eede1 namespace_15111e421d79d07d::getcurrentpoistate() == 0) {
            if (player.plundercount < level.satellitetruckplundercost) {
                player namespace_44abc05161e2e2cb::showerrormessage("MP_BR_INGAME/NOT_ENOUGH_PLUNDER_ACTIVATE");
                continue;
            } else {
                player namespace_c6ccccd95254983f::playersetplundercount(player.plundercount - level.satellitetruckplundercost);
            }
        }
        if (var_3268df12a22d1a03 == 0) {
            var_e08cf97a737eede1.playerteam = player.team;
            var_e08cf97a737eede1 thread namespace_15111e421d79d07d::gotopoistate("satellite_truck", 1);
            return;
        } else if (var_3268df12a22d1a03 == 2) {
            var_e08cf97a737eede1.playerteam = player.team;
            var_e08cf97a737eede1 thread namespace_15111e421d79d07d::gotopoistate("satellite_truck", 3);
        }
    }
}

// Namespace namespace_d15f50588af476af/namespace_cb679e0508ce5044
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb61
// Size: 0xf6
function _satellitetruckactivate() {
    var_e08cf97a737eede1 = self;
    var_e08cf97a737eede1 endon("death");
    level thread namespace_d20f8ef223912e12::teamsplashbr("br_satellite_truck_active", var_e08cf97a737eede1.player, var_e08cf97a737eede1.playerteam);
    var_7ebe382bcacfe466 = 0;
    var_9b4a37baf5f7793a = getdvarint(@"hash_53e16ec28b970932", 500);
    var_46d176fdcd576507 = getdvarint(@"hash_d1658ac67eb8d4a8", 2);
    while (var_7ebe382bcacfe466 * var_46d176fdcd576507 <= level.satellitetruckactivetimeseconds) {
        triggerportableradarpingteam(self.origin, var_e08cf97a737eede1.playerteam, 5000, var_9b4a37baf5f7793a);
        var_7ebe382bcacfe466++;
        wait(var_46d176fdcd576507);
    }
    var_6e5bd4fa4b5fcf47 = getdvarfloat(@"hash_9a9c532332e3743d", 3);
    namespace_15111e421d79d07d::showmiscmessagetoteam(var_e08cf97a737eede1.playerteam, "br_satellite_truck_cooldown", var_6e5bd4fa4b5fcf47);
    var_e08cf97a737eede1 thread namespace_15111e421d79d07d::gotopoistate("satellite_truck", 4);
}

// Namespace namespace_d15f50588af476af/namespace_cb679e0508ce5044
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5e
// Size: 0x82
function _onenterdefaultstate(var_e08cf97a737eede1) {
    var_4430b08d5a2d47bf = namespace_15111e421d79d07d::getinteractiveoutlineasset();
    var_e08cf97a737eede1.satellitekeyboard hudoutlineenable(var_4430b08d5a2d47bf);
    var_e08cf97a737eede1.satellitekeyboard makeusable();
    var_e08cf97a737eede1.satellitekeyboard sethintstring("MP/BR_ACTIVATE_SATELLITE_TRUCK");
    var_e08cf97a737eede1 thread _satellitetruckusethink();
    var_18e46c38378f618 = getfx("poi_sat_truck_available");
    playfxontag(var_18e46c38378f618, var_e08cf97a737eede1, "tag_origin");
}

// Namespace namespace_d15f50588af476af/namespace_cb679e0508ce5044
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce7
// Size: 0x59
function _onexitdefaultstate(var_e08cf97a737eede1) {
    var_e08cf97a737eede1.satellitekeyboard hudoutlinedisable();
    var_e08cf97a737eede1 _satellitetruckendusethink();
    var_e08cf97a737eede1.satellitekeyboard makeunusable();
    var_18e46c38378f618 = getfx("poi_sat_truck_available");
    stopfxontag(var_18e46c38378f618, var_e08cf97a737eede1, "tag_origin");
}

// Namespace namespace_d15f50588af476af/namespace_cb679e0508ce5044
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd47
// Size: 0x7d
function _onenterchargingstate(var_e08cf97a737eede1) {
    var_3058dbc123e6c741 = getdvarfloat(@"hash_9ecb6742d002ed16", 10);
    var_e08cf97a737eede1 thread namespace_15111e421d79d07d::gotopoistateontimer("satellite_truck", 2, var_3058dbc123e6c741);
    namespace_15111e421d79d07d::showmiscmessagetoteam(var_e08cf97a737eede1.playerteam, "br_satellite_truck_charging", var_3058dbc123e6c741, int(var_3058dbc123e6c741 * 1000));
    var_90d6a5c6923319de = getfx("poi_sat_truck_charging");
    playfxontag(var_90d6a5c6923319de, var_e08cf97a737eede1, "tag_origin");
}

// Namespace namespace_d15f50588af476af/namespace_cb679e0508ce5044
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdcb
// Size: 0x2f
function _onexitchargingstate(var_e08cf97a737eede1) {
    var_90d6a5c6923319de = getfx("poi_sat_truck_charging");
    stopfxontag(var_90d6a5c6923319de, var_e08cf97a737eede1, "tag_origin");
}

// Namespace namespace_d15f50588af476af/namespace_cb679e0508ce5044
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe01
// Size: 0x5f
function _onenteractivestate(var_e08cf97a737eede1) {
    var_4430b08d5a2d47bf = namespace_15111e421d79d07d::getinteractiveoutlineasset();
    var_e08cf97a737eede1.satellitekeyboard hudoutlineenable(var_4430b08d5a2d47bf);
    var_e08cf97a737eede1.satellitekeyboard makeusable();
    var_e08cf97a737eede1.satellitekeyboard sethintstring("MP/BR_USE_SATELLITE_TRUCK");
    var_e08cf97a737eede1 thread _satellitetruckusethink();
}

// Namespace namespace_d15f50588af476af/namespace_cb679e0508ce5044
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe67
// Size: 0x36
function _onexitactivestate(var_e08cf97a737eede1) {
    var_e08cf97a737eede1.satellitekeyboard hudoutlinedisable();
    var_e08cf97a737eede1 _satellitetruckendusethink();
    var_e08cf97a737eede1.satellitekeyboard makeunusable();
}

// Namespace namespace_d15f50588af476af/namespace_cb679e0508ce5044
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea4
// Size: 0x15
function _onenterscanningstate(var_e08cf97a737eede1) {
    var_e08cf97a737eede1 thread _satellitetruckactivate();
}

// Namespace namespace_d15f50588af476af/namespace_cb679e0508ce5044
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec0
// Size: 0x17
function _onexitscanningstate(var_e08cf97a737eede1) {
    var_e08cf97a737eede1.playerteam = undefined;
}

// Namespace namespace_d15f50588af476af/namespace_cb679e0508ce5044
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xede
// Size: 0x37
function _onentercooldownstate(var_e08cf97a737eede1) {
    var_ecda8dcb2c2ca2d2 = getdvarfloat(@"hash_2333f90f274605a5", 15);
    var_e08cf97a737eede1 thread namespace_15111e421d79d07d::gotopoistateontimer("satellite_truck", 0, var_ecda8dcb2c2ca2d2);
}

