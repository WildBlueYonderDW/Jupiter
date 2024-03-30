// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\gametypes\br_multi_circle.gsc;
#using scripts\mp\flags.gsc;

#namespace namespace_553788426d0f4133;

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x275
// Size: 0x2d2
function function_c7f3ae56442546d1(origin, circleradii, var_79a6e85c95fe549b, var_b7c9fe00120ea96c, var_437c3e3159a04f4e) {
    if (!isdefined(circleradii) || circleradii.size < 2 || circleradii[0] <= 0) {
        return undefined;
    }
    var_38a4c729748ad94c = getdvarint(@"hash_67a8c844bad5a45b", 0);
    if (!var_38a4c729748ad94c && scripts/mp/gametypes/br_gametypes::isfeatureenabled("circleSnapToNavMesh")) {
        var_38a4c729748ad94c = 1;
    }
    circlecenters = [];
    circlecenters[0] = (origin[0], origin[1], 0);
    radius = circleradii[0];
    maxpct = 1 - circleradii[1] / radius;
    lastcircleindex = circleradii.size - 1;
    circlecenters[lastcircleindex] = getrandompointinboundscircle(origin, radius, 0, maxpct, 1, var_38a4c729748ad94c, 1);
    if (istrue(var_437c3e3159a04f4e)) {
        return circlecenters;
    }
    playerspeed = getdvarfloat(@"hash_917b939513f89b55", 200);
    var_11c1e6222da58849 = getdvarint(@"hash_e65611a4d524bcbe", 0);
    for (circleindex = lastcircleindex - 1; circleindex >= 0; circleindex--) {
        origin = circlecenters[circleindex + 1];
        radius = circleradii[circleindex];
        minpct = 0;
        maxpct = 1 - circleradii[circleindex + 1] / radius;
        pct = minpct + randomfloat(maxpct - minpct);
        closetime = var_79a6e85c95fe549b[circleindex];
        prevradius = circleradii[circleindex + 1];
        deltaradius = radius - prevradius;
        radiusspeed = deltaradius / closetime;
        maxmovespeed = max(0, playerspeed - radiusspeed);
        maxmovedist = maxmovespeed * closetime;
        var_6443d240572e7a5b = maxmovedist / radius;
        var_3f139f4756ad700e = pct > var_6443d240572e7a5b;
        if (var_3f139f4756ad700e && !istrue(var_b7c9fe00120ea96c)) {
            circlespeed = radiusspeed + pct * radius / closetime;
            dlog_recordevent("dlog_event_br_circle_speed_warning", ["player_speed", playerspeed, "circle_speed", circlespeed, "circle_close_time", float(closetime), "circle_current_radius", float(radius), "circle_next_radius", float(prevradius)]);
        }
        if (circleindex) {
            if (var_11c1e6222da58849 && var_3f139f4756ad700e) {
                pct = minpct + randomfloat(var_6443d240572e7a5b - minpct);
            }
            circlecenters[circleindex] = getrandompointinboundscircle(origin, radius, pct, pct, 1, var_38a4c729748ad94c, 1);
        }
    }
    return circlecenters;
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54f
// Size: 0xdd
function function_a09532919ae80718(requestedcount, circlecenters, circleradii, var_38a4c729748ad94c) {
    movingcircles = [];
    for (circleindex = 1; circleindex <= requestedcount; circleindex++) {
        var_9d2610f6a0b725a4 = circleradii[circleindex - 1];
        var_a754cfa0ff072630 = circlecenters[circleindex - 1];
        current_circle_radius = circleradii[circleindex];
        mindist = var_9d2610f6a0b725a4 + current_circle_radius + level.br_level.br_movingcirclemovedistmin;
        maxdist = var_9d2610f6a0b725a4 + current_circle_radius + level.br_level.br_movingcirclemovedistmax;
        movingcircles[circleindex - 1] = getrandompointinboundscircle(var_a754cfa0ff072630, maxdist, mindist / maxdist, 1, 1, var_38a4c729748ad94c, 1);
    }
    return movingcircles;
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x634
// Size: 0x25
function function_d987886bb9de9137() {
    if (!istrue(level.var_2df69b8e552238b6)) {
        return 0;
    }
    return level.br_multi_circle.circlecount;
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x661
// Size: 0x3a
function function_d8fbacc18e5d8498() {
    return function_d987886bb9de9137() > 1 && level.br_circle.circleindex + 1 == level.br_multi_circle.mergeindex;
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a3
// Size: 0x1f
function function_29e8194ff7e13e2e() {
    return function_49411683f5a51daa(level.br_circle.circleindex + 1);
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ca
// Size: 0x75
function function_49411683f5a51daa(circleindex) {
    if (isdefined(level.br_multi_circle.var_29e8194ff7e13e2e)) {
        return [[ level.br_multi_circle.var_29e8194ff7e13e2e ]](circleindex);
    }
    return function_d987886bb9de9137() > 1 && (circleindex < level.br_multi_circle.splitindex || circleindex > level.br_multi_circle.mergeindex);
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x747
// Size: 0x80
function function_57f3fd16b628c829(circleindex) {
    var_a9ed63230d9a3c95 = level.br_level.br_circleshowdelaydanger[circleindex];
    if (var_a9ed63230d9a3c95 > 0) {
        hidedangercircle();
        delaythread(var_a9ed63230d9a3c95, &showdangercircle);
    }
    var_4f48a6344ec8a9c7 = level.br_level.br_circleshowdelaysafe[circleindex];
    if (var_4f48a6344ec8a9c7 > 0) {
        hidesafecircle();
        delaythread(var_4f48a6344ec8a9c7, &showsafecircle);
    }
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ce
// Size: 0x4f
function function_47759b7ed0818a3f(circleindex, var_f007ce073dc3c519) {
    if (canplaycircleopendialog(circleindex)) {
        if (var_f007ce073dc3c519) {
            scripts/mp/gametypes/br_public::brleaderdialog("first_circle", 1, undefined, undefined, 0.5);
            return;
        }
        scripts/mp/gametypes/br_public::brleaderdialog("new_circle", 1, undefined, undefined, 0.5);
    }
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x824
// Size: 0x58
function function_8d09229c08abd549(circleindex, var_6b890e6be7982efb) {
    if (canplaycircleclosedialog(circleindex)) {
        if (var_6b890e6be7982efb) {
            scripts/mp/gametypes/br_public::brleaderdialog("final_circle", 1, undefined, undefined, 0.5);
            return;
        }
        scripts/mp/gametypes/br_public::brleaderdialog("circle_closing", 1, undefined, undefined, 0.5);
        thread brcirclebattlechatter(circleindex);
    }
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x883
// Size: 0xc
function function_6ab5543ce292e3fc(circleindex) {
    
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x896
// Size: 0xc
function function_d19f6d13e6cefce8(circleindex) {
    
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a9
// Size: 0x12
function function_ea6cdf6492dfb4fa() {
    return getdvarint(@"hash_afe2a26cda0aaf42", 0);
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c3
// Size: 0x7d
function function_8c0f978940451524(var_819edacdacb810e4, dangercircleradius, thresholdradius) {
    if (isdefined(level.var_9ebef1efb6e8a3a9)) {
        foreach (callback in level.var_9ebef1efb6e8a3a9) {
            [[ callback ]](var_819edacdacb810e4, dangercircleradius, thresholdradius);
        }
    }
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x947
// Size: 0xaf
function function_ebdd2e77a8ade959() {
    /#
    #/
    if (isdefined(level.var_c7fd2b5cf3acb3da)) {
        foreach (var_7f590f6ae7f3bc83, callback in level.var_c7fd2b5cf3acb3da) {
            hiddenobjects = [[ callback ]]();
            if (isdefined(hiddenobjects) && hiddenobjects.size > 0 && !function_ea6cdf6492dfb4fa()) {
                hiddenobjects = array_remove_duplicates(hiddenobjects);
                level.var_8a12e160a2617c92[var_7f590f6ae7f3bc83] = array_combine_unique(level.var_8a12e160a2617c92[var_7f590f6ae7f3bc83], hiddenobjects);
            }
        }
    }
    /#
    #/
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fd
// Size: 0x105
function function_799fe4ee850f911(circleindex) {
    if (!isdefined(level.br_multi_circle) || !isdefined(level.br_multi_circle.circles) || !isdefined(level.br_multi_circle.circles[circleindex]) || !isdefined(level.br_multi_circle.circles[circleindex].entdata)) {
        return (0, 0, 0);
    }
    entdata = level.br_multi_circle.circles[circleindex].entdata;
    if (!isdefined(entdata)) {
        return (0, 0, 0);
    }
    safecircle = entdata.safeent;
    if (!isdefined(safecircle)) {
        return (0, 0, 0);
    }
    return (safecircle.origin[0], safecircle.origin[1], 0);
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0a
// Size: 0x70
function function_8a985543e6853bbd(circleindex) {
    entdata = level.br_multi_circle.circles[circleindex].entdata;
    if (!isdefined(entdata)) {
        return 0;
    }
    safecircle = entdata.safeent;
    if (!isdefined(safecircle)) {
        return 0;
    }
    return safecircle.origin[2];
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb82
// Size: 0x93
function function_755c691f70eafe3b(circleindex) {
    entdata = level.br_multi_circle.circles[circleindex].entdata;
    if (!isdefined(entdata)) {
        return (0, 0, 0);
    }
    dangercircle = entdata.dangerent;
    if (!isdefined(dangercircle)) {
        return (0, 0, 0);
    }
    return (dangercircle.origin[0], dangercircle.origin[1], 0);
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1d
// Size: 0x70
function function_a835b5dff878f77(circleindex) {
    entdata = level.br_multi_circle.circles[circleindex].entdata;
    if (!isdefined(entdata)) {
        return 0;
    }
    dangercircle = entdata.dangerent;
    if (!isdefined(dangercircle)) {
        return 0;
    }
    return dangercircle.origin[2];
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc95
// Size: 0xd4
function function_d277283fb9ad5d46(origin, index, bufferdist) {
    entdata = level.br_multi_circle.circles[index].entdata;
    if (!isdefined(entdata)) {
        return false;
    }
    dangercircle = entdata.dangerent;
    if (!isdefined(dangercircle)) {
        return false;
    }
    if (!isdefined(origin)) {
        return false;
    }
    var_819edacdacb810e4 = (dangercircle.origin[0], dangercircle.origin[1], 0);
    dangercircleradius = dangercircle.origin[2];
    if (isdefined(bufferdist)) {
        dangercircleradius = dangercircleradius + bufferdist;
    }
    if (distance2dsquared(var_819edacdacb810e4, origin) < dangercircleradius * dangercircleradius) {
        return true;
    }
    return false;
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd71
// Size: 0x7e
function function_ee854fdd1e77efc4(origin, gracedistance) {
    if (!istrue(level.var_2df69b8e552238b6)) {
        return false;
    }
    if (!isdefined(gracedistance)) {
        gracedistance = 0;
    }
    multicirclecount = function_d987886bb9de9137();
    if (function_29e8194ff7e13e2e()) {
        multicirclecount = 1;
    }
    for (i = 0; i < multicirclecount; i++) {
        isdanger = function_d277283fb9ad5d46(origin, i, gracedistance);
        if (istrue(isdanger)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf7
// Size: 0xd6
function function_783961b002f33360(origin, index, bufferdist) {
    if (!isdefined(level.br_multi_circle.circles[index].entdata)) {
        return undefined;
    }
    safecircle = level.br_multi_circle.circles[index].entdata.safeent;
    var_add4fd7502a75a8a = (safecircle.origin[0], safecircle.origin[1], 0);
    safecircleradius = safecircle.origin[2];
    if (isdefined(bufferdist)) {
        safecircleradius = safecircleradius + bufferdist;
    }
    if (distance2dsquared(var_add4fd7502a75a8a, origin) < safecircleradius * safecircleradius) {
        return 1;
    }
    return 0;
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed5
// Size: 0x6d
function function_27779e30fe4c0d62(origin) {
    if (!istrue(level.var_2df69b8e552238b6)) {
        return false;
    }
    multicirclecount = function_d987886bb9de9137();
    if (function_29e8194ff7e13e2e()) {
        multicirclecount = 1;
    }
    for (i = 0; i < multicirclecount; i++) {
        issafe = function_783961b002f33360(origin, i);
        if (istrue(issafe)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4a
// Size: 0x60
function function_77cec84f05ca9418(point1, point2, bufferdist) {
    multicirclecount = function_d987886bb9de9137();
    for (i = 0; i < multicirclecount; i++) {
        if (function_d277283fb9ad5d46(point1, i) && function_d277283fb9ad5d46(point2, i)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb2
// Size: 0x6b
function function_de2f1b656ee04ba9() {
    multicirclecount = function_d987886bb9de9137();
    if (multicirclecount > 1) {
        var_f2c46154d60d119b = [];
        for (i = 0; i < multicirclecount; i++) {
            safeorigin = function_799fe4ee850f911(i);
            var_f2c46154d60d119b[var_f2c46154d60d119b.size] = safeorigin;
        }
        return var_f2c46154d60d119b;
    }
    safeorigin = scripts/mp/gametypes/br_circle::getsafecircleorigin();
    return [safeorigin];
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1024
// Size: 0x6b
function function_54798383fa7f572b() {
    multicirclecount = function_d987886bb9de9137();
    if (multicirclecount > 1) {
        var_5960287de2e9eb0d = [];
        for (i = 0; i < multicirclecount; i++) {
            saferadius = function_8a985543e6853bbd(i);
            var_5960287de2e9eb0d[var_5960287de2e9eb0d.size] = saferadius;
        }
        return var_5960287de2e9eb0d;
    }
    saferadius = scripts/mp/gametypes/br_circle::getsafecircleradius();
    return [saferadius];
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1096
// Size: 0x6b
function function_7d381171eae99b77() {
    multicirclecount = function_d987886bb9de9137();
    if (multicirclecount > 1) {
        var_c86bc952d8cc7c15 = [];
        for (i = 0; i < multicirclecount; i++) {
            dangerorigin = function_755c691f70eafe3b(i);
            var_c86bc952d8cc7c15[var_c86bc952d8cc7c15.size] = dangerorigin;
        }
        return var_c86bc952d8cc7c15;
    }
    dangerorigin = scripts/mp/gametypes/br_circle::getdangercircleorigin();
    return [dangerorigin];
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1108
// Size: 0x6b
function function_bf15a5aa7e72aee9() {
    multicirclecount = function_d987886bb9de9137();
    if (multicirclecount > 1) {
        var_18a9373b09ac2fb7 = [];
        for (i = 0; i < multicirclecount; i++) {
            dangerradius = function_a835b5dff878f77(i);
            var_18a9373b09ac2fb7[var_18a9373b09ac2fb7.size] = dangerradius;
        }
        return var_18a9373b09ac2fb7;
    }
    dangerradius = scripts/mp/gametypes/br_circle::getdangercircleradius();
    return [dangerradius];
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x117a
// Size: 0x3e
function function_a465e3c1371d7dab(point) {
    if (istrue(level.br_circle_disabled)) {
        return 1;
    }
    if (namespace_bbc79db4c3949a5c::function_d987886bb9de9137() > 1) {
        return function_27779e30fe4c0d62(point);
    }
    return scripts/mp/gametypes/br_circle::ispointincurrentsafecircle(point);
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11bf
// Size: 0x3e
function function_778a4c3d053ed0a9(point) {
    if (istrue(level.br_circle_disabled)) {
        return 1;
    }
    if (namespace_bbc79db4c3949a5c::function_d987886bb9de9137() > 1) {
        return function_ee854fdd1e77efc4(point);
    }
    return scripts/mp/gametypes/br_circle::function_c11714256f856e10(point);
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1204
// Size: 0xa1
function function_d12a7c7251710cbf() {
    totaltime = 0;
    for (i = 0; i < level.br_level.br_circleclosetimes.size; i++) {
        totaltime = totaltime + level.br_level.br_circleclosetimes[i];
    }
    for (i = 0; i < level.br_level.br_circledelaytimes.size; i++) {
        totaltime = totaltime + level.br_level.br_circledelaytimes[i];
    }
    logstring("br_circle_util::logTotalMatchTime = " + totaltime + " seconds");
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ac
// Size: 0x38c
function function_60951b84c58915ab(testpoint, var_ff696ac4914036ee) {
    if (!isdefined(var_ff696ac4914036ee)) {
        var_ff696ac4914036ee = 0;
    }
    times = [];
    if (istrue(level.var_2df69b8e552238b6)) {
        circleinfo = level.br_multi_circle;
    } else {
        circleinfo = spawnstruct();
        circleinfo.circles[0] = spawnstruct();
        circleinfo.circles[0].circlecenters = level.br_level.br_circlecenters;
    }
    for (multicirclecount = 0; multicirclecount < circleinfo.circles.size; multicirclecount++) {
        currenttime = 0;
        circlecenters = circleinfo.circles[multicirclecount].circlecenters;
        for (i = 0; i < circlecenters.size - 1; i++) {
            currentorigin = circlecenters[i];
            nextorigin = circlecenters[i + 1];
            currentradius = level.br_level.br_circleradii[i];
            nextradius = level.br_level.br_circleradii[i + 1];
            currenttime = currenttime + level.br_level.br_circledelaytimes[i];
            ts = function_64fccd3662b256c4(testpoint, currentorigin, currentradius, nextorigin, nextradius, i);
            for (j = 0; j < ts.size; j++) {
                ts[j].time = currenttime + level.br_level.br_circleclosetimes[i] * ts[j].time;
                times[times.size] = ts[j];
            }
            currenttime = currenttime + level.br_level.br_circleclosetimes[i];
        }
    }
    timessorted = scripts/mp/utility/script::quicksort(times, &function_71b56c961304206d);
    entercount = 0;
    for (multicirclecount = 0; multicirclecount < circleinfo.circles.size; multicirclecount++) {
        circlecenters = circleinfo.circles[multicirclecount].circlecenters;
        dist = distance2d(testpoint, circlecenters[0]);
        if (dist < level.br_level.br_circleradii[0]) {
            entercount++;
        }
    }
    times = [];
    times[0] = function_a0662c2865628336(0, ter_op(entercount > 0, 0, 1), -1);
    for (i = 0; i < timessorted.size; i++) {
        addtime = 0;
        state = timessorted[i].state;
        if (state == 0) {
            addtime = entercount == 0;
            entercount++;
        } else {
            /#
                assert(state == 1);
            #/
            entercount--;
            addtime = entercount == 0;
        }
        if (addtime) {
            times[times.size] = timessorted[i];
            if (var_ff696ac4914036ee > 0 && times.size > 2) {
                deltatime = times[times.size - 1].time - times[times.size - 2].time;
                if (deltatime <= var_ff696ac4914036ee) {
                    times[times.size - 1] = undefined;
                    times[times.size - 1] = undefined;
                }
            }
        }
    }
    return times;
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1640
// Size: 0x25
function gettimetilldangerforpoint(testpoint) {
    times = function_60951b84c58915ab(testpoint);
    return function_7d8550b9a2c52852(times);
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x166d
// Size: 0x15
function function_7d8550b9a2c52852(times) {
    return function_97dc13fd8de003a(times, 1);
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x168a
// Size: 0x25
function function_f487a2a306e21bdb(testpoint) {
    times = function_60951b84c58915ab(testpoint);
    return function_169347c7de51f088(times);
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16b7
// Size: 0x14
function function_169347c7de51f088(times) {
    return function_97dc13fd8de003a(times, 0);
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16d3
// Size: 0xcc
function function_97dc13fd8de003a(times, state) {
    circlestarttime = level.br_circle.circleinittime;
    if (!isdefined(circlestarttime)) {
        circlestarttime = gettime();
    }
    var_f17b39dcb7f8fc64 = (gettime() - circlestarttime) / 1000;
    time_index = 0;
    for (i = 1; i < times.size; i++) {
        if (times[i].time <= var_f17b39dcb7f8fc64) {
            time_index = i;
        }
    }
    if (times[time_index].state == state) {
        return 0;
    }
    if (time_index == times.size - 1) {
        return 999999;
    }
    return times[time_index + 1].time - var_f17b39dcb7f8fc64;
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17a6
// Size: 0x2e
function function_d5cf183ee258befb(testpoint, offsetsec) {
    times = function_60951b84c58915ab(testpoint);
    return function_ae20efd2c4b04628(times, offsetsec);
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17dc
// Size: 0xf3
function function_ae20efd2c4b04628(times, offsetsec) {
    if (!isdefined(offsetsec)) {
        offsetsec = 0;
    }
    circlestarttime = level.br_circle.circleinittime;
    if (!isdefined(circlestarttime)) {
        circlestarttime = gettime();
    }
    var_f17b39dcb7f8fc64 = (gettime() - circlestarttime) / 1000 + offsetsec;
    time_index = 0;
    for (i = 1; i < times.size; i++) {
        if (times[i].time <= var_f17b39dcb7f8fc64) {
            time_index = i;
        }
    }
    if (times[time_index].state == 1) {
        return times[time_index].circleindex;
    }
    if (time_index == times.size - 1) {
        return (level.br_level.br_circleradii.size - 1);
    }
    return times[time_index + 1].circleindex;
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18d6
// Size: 0x54
function private function_a0662c2865628336(time, state, circleindex) {
    s = spawnstruct();
    s.time = time;
    s.state = state;
    s.circleindex = circleindex;
    return s;
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1932
// Size: 0x53
function private function_71b56c961304206d(left, right) {
    if (left.time == right.time) {
        return (left.state == 0);
    }
    return left.time <= right.time;
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x198d
// Size: 0x29c
function function_6ec3b4c4b5a9edd(time) {
    starttime = level.br_circle.circleinittime;
    if (!isdefined(starttime)) {
        return undefined;
    }
    if (istrue(level.var_2df69b8e552238b6)) {
        circleinfo = level.br_multi_circle;
    } else {
        circleinfo = spawnstruct();
        circleinfo.circles[0] = spawnstruct();
        circleinfo.circles[0].circlecenters = level.br_level.br_circlecenters;
    }
    circlelist = [];
    for (multicirclecount = 0; multicirclecount < circleinfo.circles.size; multicirclecount++) {
        deltaseconds = (time - starttime) / 1000;
        circledata = spawnstruct();
        circlecenters = circleinfo.circles[multicirclecount].circlecenters;
        for (i = 0; i < circlecenters.size - 1; i++) {
            currentorigin = circlecenters[i];
            currentradius = level.br_level.br_circleradii[i];
            deltaseconds = deltaseconds - level.br_level.br_circledelaytimes[i];
            if (deltaseconds <= 0) {
                circledata.origin = currentorigin;
                circledata.radius = currentradius;
                break;
            }
            closetime = level.br_level.br_circleclosetimes[i];
            deltaseconds = deltaseconds - closetime;
            if (deltaseconds <= 0) {
                frac = (deltaseconds + closetime) / closetime;
                frac = clamp(frac, 0, 1);
                nextorigin = circlecenters[i + 1];
                circledata.origin = vectorlerp(currentorigin, nextorigin, frac);
                nextradius = level.br_level.br_circleradii[i + 1];
                circledata.radius = math::lerp(currentradius, nextradius, frac);
                break;
            }
        }
        if (deltaseconds > 0) {
            circledata.origin = circlecenters[circlecenters.size - 1];
            circledata.radius = level.br_level.br_circleradii[circlecenters.size - 1];
        }
        circlelist[multicirclecount] = circledata;
    }
    return circlelist;
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c31
// Size: 0x18e
function function_8e779f490bbd1ae9() {
    if (getdvarint(@"hash_cb361ca8aa1b869f", 0) == 0) {
        return;
    }
    for (oldparams = function_a3920e4ddd93cf3(); true; oldparams = newparams) {
        level waittill("br_circle_set");
        newparams = function_a3920e4ddd93cf3();
        if (newparams.strength <= 0) {
            oldparams = newparams;
            continue;
        }
        var_d04962fa7f3ef6a1 = gettime();
        var_a9e9a1c18405739c = var_d04962fa7f3ef6a1 + 10000;
        while (gettime() < var_a9e9a1c18405739c) {
            progress = (gettime() - var_d04962fa7f3ef6a1) / 10000;
            strength = scripts/engine/math::lerp(oldparams.strength, newparams.strength, progress);
            radius = scripts/engine/math::lerp(oldparams.radius, newparams.radius, progress);
            function_2eb76cbe682595c3(vectorlerp(oldparams.origin, newparams.origin, progress), radius + 2000, radius + 5000, 0, 4000, strength / 2, strength, 0.35, 1);
            wait(1);
        }
        function_2eb76cbe682595c3(newparams.origin, newparams.radius + 2000, newparams.radius + 5000, 0, 4000, newparams.strength / 2, newparams.strength, 0.35, 1);
    }
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1dc6
// Size: 0x10e
function private function_a3920e4ddd93cf3() {
    struct = spawnstruct();
    struct.origin = scripts/mp/gametypes/br_public::droptogroundmultitrace(scripts/mp/gametypes/br_circle::getsafecircleorigin());
    struct.radius = scripts/mp/gametypes/br_circle::getsafecircleradius();
    circlesleft = level.br_level.br_circleclosetimes.size - level.br_circle.circleindex - 1;
    switch (circlesleft) {
    case 0:
        struct.strength = 300;
        break;
    case 1:
        struct.strength = 200;
        break;
    case 2:
        struct.strength = 100;
        break;
    case 3:
        struct.strength = 50;
        break;
    default:
        struct.strength = 0;
        break;
    }
    return struct;
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1edc
// Size: 0x12c
function function_62c8ef916090a2c(var_1bfc048b9cb49482, var_4643546cfff620a5) {
    function_f913ed6ea80cce0d();
    if (!level.var_da89dff7e3009777.size) {
        return;
    }
    var_c1427c3606becd8d = (level.var_779cd9f4c4324154 + 1) % level.var_da89dff7e3009777.size;
    var_85a812a8e488e444 = level.var_da89dff7e3009777[var_c1427c3606becd8d].stringref;
    var_f94237d8c14e730d = scripts/mp/gametypes/br_public::droptogroundmultitrace(var_1bfc048b9cb49482, 0, -1000);
    level.var_936f588a93032e5b = spawn("script_model", var_f94237d8c14e730d);
    if (isdefined(var_4643546cfff620a5)) {
        level.var_936f588a93032e5b.angles = var_4643546cfff620a5;
    }
    level.var_936f588a93032e5b setmodel("jup_usa_electronics_casino_slot_machine_01");
    level.var_936f588a93032e5b makeusable();
    level.var_936f588a93032e5b setuseholdduration("duration_short");
    level.var_936f588a93032e5b sethintstring("MP_BR_INGAME/DEV_CIRCLE_REROLLER");
    level.var_936f588a93032e5b sethintstringparams(var_85a812a8e488e444);
    level.var_936f588a93032e5b thread function_aa86aebc45c3ebca();
    level.var_936f588a93032e5b thread function_9c170550c16f8876();
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x200f
// Size: 0x3e
function function_f913ed6ea80cce0d() {
    if (!isdefined(level.var_779cd9f4c4324154)) {
        level.var_779cd9f4c4324154 = -1;
    }
    if (!isdefined(level.var_da89dff7e3009777) || !level.var_da89dff7e3009777.size) {
        br_circle::function_72cbdb2550894694();
    }
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2054
// Size: 0x194
function function_aa86aebc45c3ebca(var_dfd8829dea17d4f5) {
    level endon("game_ended");
    self endon("death");
    while (true) {
        player = self waittill("trigger");
        level.var_779cd9f4c4324154 = (level.var_779cd9f4c4324154 + 1) % level.var_da89dff7e3009777.size;
        level.br_circle.br_finalcircleoverride = level.var_da89dff7e3009777[level.var_779cd9f4c4324154].origin;
        var_c1427c3606becd8d = (level.var_779cd9f4c4324154 + 1) % level.var_da89dff7e3009777.size;
        var_85a812a8e488e444 = level.var_da89dff7e3009777[var_c1427c3606becd8d].stringref;
        self sethintstring("MP_BR_INGAME/DEV_CIRCLE_REROLLER");
        self sethintstringparams(var_85a812a8e488e444);
        debugplayer = player;
        if (!isdefined(player)) {
            debugplayer = level.player;
        }
        /#
            debugplayer iprintlnbold("<unknown string>" + level.var_779cd9f4c4324154 + "<unknown string>" + level.var_da89dff7e3009777[level.var_779cd9f4c4324154].name + "<unknown string>");
        #/
        scripts/mp/gametypes/br_circle::applycirclesettings();
        level thread scripts/mp/gametypes/br_circle::_precalcsafecirclecenters(level.br_circle.br_finalcircleoverride);
        level thread scripts/mp/gametypes/br_multi_circle::function_e71987651701448a();
        if (scripts/mp/gametypes/br_gametypes::isbrgametypefuncdefined("createC130PathStruct")) {
            level.infilstruct.c130pathstruct = scripts/mp/gametypes/br_gametypes::runbrgametypefunc("createC130PathStruct");
        }
    }
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21ef
// Size: 0x1e
function function_9c170550c16f8876() {
    level endon("game_ended");
    waitframe();
    scripts/mp/flags::gameflagwait("prematch_fade_done");
    self delete();
}

// Namespace namespace_553788426d0f4133 / namespace_bbc79db4c3949a5c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2214
// Size: 0x19f
function savecircles() {
    /#
        println("<unknown string>");
        println("<unknown string>");
        for (i = 0; i < level.br_level.br_circlecenters.size; i++) {
            origin = level.br_level.br_circlecenters[i];
            println("<unknown string>" + i + "<unknown string>" + origin + "<unknown string>");
            waitframe();
        }
        println("<unknown string>");
        for (i = 0; i < level.br_level.br_circleradii.size; i++) {
            radius = level.br_level.br_circleradii[i];
            println("<unknown string>" + i + "<unknown string>" + radius + "<unknown string>");
            waitframe();
        }
        println("<unknown string>");
        multicirclecount = function_d987886bb9de9137();
        for (i = 0; i < multicirclecount; i++) {
            for (j = 0; j < level.br_level.br_circlecenters.size; j++) {
                origin = level.br_multi_circle.circles[i].circlecenters[j];
                println("<unknown string>" + i + "<unknown string>" + j + "<unknown string>" + origin + "<unknown string>");
                waitframe();
            }
        }
        println("<unknown string>");
        println("<unknown string>");
    #/
}

