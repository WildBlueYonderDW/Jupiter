#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using script_16ea1b94f0f381b3;
#using script_4c543f01345a2c04;
#using scripts\mp\utility\debug.gsc;

#namespace namespace_6693a0c04250d04c;

// Namespace namespace_6693a0c04250d04c / namespace_85abdc73fdc473e0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2c9
// Size: 0x2b9
function function_b25d4cb935628ac8(taskid, params) {
    var_b33910d3fd7718b1 = function_2da1745aab41cb94(self.entitydata.phaseindex);
    self.entitydata.var_9adf21d0962a922b = 2;
    self.entitydata.var_1be563f374236c47 = 1;
    self.var_a3d0ad660af72d52.var_d91ebd99b9e4a77 = [];
    self.var_a3d0ad660af72d52.var_d8e4422371928803 = [];
    self.var_a3d0ad660af72d52.var_49723cc0041f1836 = [];
    self.var_a3d0ad660af72d52.targetindex = 0;
    ent_flag_set("beam_attack_vo");
    self.var_a3d0ad660af72d52.starttime = gettime();
    self.var_a3d0ad660af72d52.var_ca191c145576c838 = utility::spawn_model("tag_origin", self gettagorigin(self.var_a3d0ad660af72d52.handtag), (0, 0, 0));
    self.var_a3d0ad660af72d52.var_ca191c145576c838 setmodel(var_b33910d3fd7718b1.var_4be7b82edbfe5a31);
    thread function_5ee1730c2e122134(self.var_a3d0ad660af72d52.var_ca191c145576c838, "beam_attack_end");
    if (var_b33910d3fd7718b1.var_15c62e2a3e84a52 == "Random") {
        self.var_a3d0ad660af72d52.var_98a650d81ee56d1a = 1;
        var_b33910d3fd7718b1.var_15c62e2a3e84a52 = function_d4d4badbc5957e54();
    }
    if (var_b33910d3fd7718b1.var_15c62e2a3e84a52 == "Standard") {
        self.var_a3d0ad660af72d52.targetent = function_1b412af6d5fbead2();
        self.var_a3d0ad660af72d52.var_5cbba012d5f74041 = utility::spawn_model("tag_origin", self.var_a3d0ad660af72d52.targetent.origin);
        self.var_a3d0ad660af72d52.var_5cbba012d5f74041 setmodel(var_b33910d3fd7718b1.var_591cbe2e14d189c0);
        thread function_5ee1730c2e122134(self.var_a3d0ad660af72d52.var_5cbba012d5f74041, "beam_attack_end");
        thread function_741a839378a9a54c();
    } else {
        self.var_a3d0ad660af72d52.targetents = function_ec3c1dd899050013();
        function_a4874db27f866be1(var_b33910d3fd7718b1);
        for (i = 0; i < self.var_a3d0ad660af72d52.targetents.size; i++) {
            thread function_741a839378a9a54c(i);
        }
    }
    return anim.success;
}

// Namespace namespace_6693a0c04250d04c / namespace_85abdc73fdc473e0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x58b
// Size: 0xd4
function function_a4874db27f866be1(var_b33910d3fd7718b1) {
    self.var_a3d0ad660af72d52.var_e7e13b6c8ec22df6 = [];
    for (i = 0; i < self.var_a3d0ad660af72d52.targetents.size; i++) {
        self.var_a3d0ad660af72d52.var_e7e13b6c8ec22df6[i] = utility::spawn_model("tag_origin", self.var_a3d0ad660af72d52.targetents[i].origin);
        self.var_a3d0ad660af72d52.var_e7e13b6c8ec22df6[i] setmodel(var_b33910d3fd7718b1.var_591cbe2e14d189c0);
        thread function_5ee1730c2e122134(self.var_a3d0ad660af72d52.var_e7e13b6c8ec22df6[i], "beam_attack_end");
    }
}

// Namespace namespace_6693a0c04250d04c / namespace_85abdc73fdc473e0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x667
// Size: 0x4e
function function_ec3c1dd899050013() {
    targets = [];
    count = clamp(level.players.size, 1, 3);
    for (i = 0; i < count; i++) {
        targets[i] = function_1b412af6d5fbead2();
    }
    return targets;
}

// Namespace namespace_6693a0c04250d04c / namespace_85abdc73fdc473e0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6be
// Size: 0xab
function function_1b412af6d5fbead2() {
    var_8b591b0bc361ab3d = randomint(3);
    selectedplayer = undefined;
    switch (var_8b591b0bc361ab3d) {
    case 0: 
        selectedplayer = function_370e89cf65df0b01(1, 1);
        break;
    case 1: 
        selectedplayer = function_f3a96ba65901316(1, 1);
        break;
    case 2:
    default: 
        selectedplayer = function_34f345873460798b(1, 1);
        break;
    }
    if (!isdefined(selectedplayer)) {
        selectedplayer = random(level.players);
    }
    selectedplayer.var_c764aba579deab63 = 1;
    return selectedplayer;
}

// Namespace namespace_6693a0c04250d04c / namespace_85abdc73fdc473e0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x772
// Size: 0x2c1
function function_741a839378a9a54c(index) {
    self endon("death");
    self endon("beam_attack_end");
    predictedposition = undefined;
    face_direction = (0, 0, 0);
    var_b33910d3fd7718b1 = function_2da1745aab41cb94(self.entitydata.phaseindex);
    while (var_b33910d3fd7718b1.var_15c62e2a3e84a52 == "Standard" && isdefined(self.var_a3d0ad660af72d52.var_ca191c145576c838) && isdefined(self.var_a3d0ad660af72d52.var_5cbba012d5f74041) || isdefined(self.var_a3d0ad660af72d52.var_ca191c145576c838) && isdefined(self.var_a3d0ad660af72d52.var_e7e13b6c8ec22df6[index])) {
        if (self function_11e2d4051ea44b35("in_beam_attack") == 4) {
            if (var_b33910d3fd7718b1.var_15c62e2a3e84a52 == "Standard") {
                predictedposition = function_a11b584f07a0a8b4();
            } else {
                predictedposition = function_52b9e6a7c93ab15c(index);
            }
        } else if (self function_11e2d4051ea44b35("in_beam_attack") == 2) {
            if (var_b33910d3fd7718b1.var_15c62e2a3e84a52 == "Standard") {
                predictedposition = function_2a4593cba21b7ead();
            } else {
                predictedposition = function_2971c0d765357e2b(index);
            }
        }
        if (isdefined(predictedposition)) {
            if (var_b33910d3fd7718b1.var_15c62e2a3e84a52 == "Standard") {
                target_yaw = utility::getyawtospot(predictedposition);
                var_2c36b2f75a07cb5d = self.var_a3d0ad660af72d52.var_ca191c145576c838 getpitchtospot3d(predictedposition);
                self function_a490fd20800374d8(target_yaw);
                self.var_a3d0ad660af72d52.var_5cbba012d5f74041.origin = predictedposition;
            } else {
                if (index == self.var_a3d0ad660af72d52.targetindex) {
                    target_yaw = utility::getyawtospot(predictedposition);
                    var_2c36b2f75a07cb5d = self.var_a3d0ad660af72d52.var_ca191c145576c838 getpitchtospot3d(predictedposition);
                    self function_a490fd20800374d8(target_yaw);
                }
                self.var_a3d0ad660af72d52.var_e7e13b6c8ec22df6[index].origin = predictedposition;
            }
            face_direction = predictedposition - self.var_a3d0ad660af72d52.var_ca191c145576c838.origin;
            face_angles = vectortoangles(face_direction);
            self.var_a3d0ad660af72d52.var_ca191c145576c838.angles = face_angles;
        }
        self.var_a3d0ad660af72d52.var_ca191c145576c838.origin = self gettagorigin(self.var_a3d0ad660af72d52.handtag) - vectornormalize(face_direction) * 175;
        waitframe();
    }
}

// Namespace namespace_6693a0c04250d04c / namespace_85abdc73fdc473e0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa3b
// Size: 0x130
function function_a11b584f07a0a8b4() {
    var_b33910d3fd7718b1 = function_2da1745aab41cb94(self.entitydata.phaseindex);
    if (!(isdefined(self.var_a3d0ad660af72d52.var_52c410f7e0d3b282) && isdefined(self.var_a3d0ad660af72d52.var_974971cf3b92ec81))) {
        target = self.var_a3d0ad660af72d52.targetent;
        forward = anglestoforward(target.angles);
        randomyaw = randomfloatrange(-20, 20);
        randomdirection = rotatevector(forward, (0, randomyaw, 0));
        self.var_a3d0ad660af72d52.var_52c410f7e0d3b282 = target.origin + randomdirection * 1000;
        self.var_a3d0ad660af72d52.var_974971cf3b92ec81 = target.origin - randomdirection * 1000;
    }
    return function_70bb54c5694e2df4(self.var_a3d0ad660af72d52.var_52c410f7e0d3b282, self.var_a3d0ad660af72d52.var_974971cf3b92ec81, var_b33910d3fd7718b1);
}

// Namespace namespace_6693a0c04250d04c / namespace_85abdc73fdc473e0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb74
// Size: 0x147
function function_52b9e6a7c93ab15c(index) {
    var_b33910d3fd7718b1 = function_2da1745aab41cb94(self.entitydata.phaseindex);
    if (!(isdefined(self.var_a3d0ad660af72d52.var_d8e4422371928803[index]) && isdefined(self.var_a3d0ad660af72d52.var_49723cc0041f1836[index]))) {
        target = self.var_a3d0ad660af72d52.targetents[index];
        forward = anglestoforward(target.angles);
        randomyaw = randomfloatrange(-20, 20);
        randomdirection = rotatevector(forward, (0, randomyaw, 0));
        self.var_a3d0ad660af72d52.var_d8e4422371928803[index] = target.origin + randomdirection * 1000;
        self.var_a3d0ad660af72d52.var_49723cc0041f1836[index] = target.origin - randomdirection * 1000;
    }
    return function_70bb54c5694e2df4(self.var_a3d0ad660af72d52.var_d8e4422371928803[index], self.var_a3d0ad660af72d52.var_49723cc0041f1836[index], var_b33910d3fd7718b1);
}

// Namespace namespace_6693a0c04250d04c / namespace_85abdc73fdc473e0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xcc4
// Size: 0x20a
function function_70bb54c5694e2df4(startpoint, endpoint, var_b33910d3fd7718b1) {
    currenttime = gettime() - self.var_a3d0ad660af72d52.var_8b3564d3aa8cefe2;
    var_d465ac053115a827 = var_b33910d3fd7718b1.var_68e04b0455c43bfe;
    fraction = currenttime / var_d465ac053115a827;
    predictedposition = vectorlerp(startpoint, endpoint, fraction);
    hitents = [];
    var_9786a680355a9e9c = undefined;
    var_2ea13c3bee4acef8 = 0;
    var_d99cdcd32709ef50 = self.var_a3d0ad660af72d52.var_ca191c145576c838 gettagorigin("tag_origin");
    var_9073e87eddd24712 = distance(var_d99cdcd32709ef50, predictedposition);
    attackdirection = vectornormalize(predictedposition - self.var_a3d0ad660af72d52.var_ca191c145576c838.origin);
    var_5ab424641b9665c1 = self.var_a3d0ad660af72d52.var_ca191c145576c838.origin + attackdirection * 10000;
    traceresults = trace::ray_trace_get_all_results(var_d99cdcd32709ef50, var_5ab424641b9665c1);
    foreach (traceresult in traceresults) {
        if (isdefined(traceresult["hittype"])) {
            if (traceresult["hittype"] == "hittype_world") {
                if (!isdefined(var_9786a680355a9e9c)) {
                    var_9786a680355a9e9c = traceresult["position"];
                    var_2ea13c3bee4acef8 = distance(var_d99cdcd32709ef50, var_9786a680355a9e9c);
                    break;
                }
            }
            if (traceresult["hittype"] == "hittype_entity") {
                hitents = utility::array_add(hitents, traceresult["entity"]);
            }
        }
    }
    if (!isdefined(var_9786a680355a9e9c)) {
        predictedposition = var_5ab424641b9665c1;
    } else {
        predictedposition = var_9786a680355a9e9c;
    }
    if (isdefined(hitents) && hitents.size > 0) {
        function_cb2f8ad0f4aad08a(hitents, var_d99cdcd32709ef50);
    }
    return predictedposition;
}

// Namespace namespace_6693a0c04250d04c / namespace_85abdc73fdc473e0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xed7
// Size: 0x1e4
function function_cb2f8ad0f4aad08a(hitents, var_6ab10bf6e1963525) {
    var_b33910d3fd7718b1 = function_2da1745aab41cb94(self.entitydata.phaseindex);
    foreach (hitent in hitents) {
        if (!isalive(hitent) || self == hitent || istrue(self.inlaststand)) {
            continue;
        }
        var_939e1aed87d29e13 = 50;
        var_f4991c83e09960bd = 0;
        if (isplayer(hitent)) {
            var_939e1aed87d29e13 = var_b33910d3fd7718b1.playerdamage;
        } else if (isai(hitent)) {
            if (is_equal(hitent.subclass, "zombie_hellhound_pet")) {
                var_939e1aed87d29e13 = self.var_a3d0ad660af72d52.var_e3283b87da5f2e91;
            } else if ((!isdefined(hitent.aicategory) || hitent.aicategory == "normal") && !istrue(hitent.damageshield)) {
                var_f4991c83e09960bd = 1;
            } else if (is_equal(hitent.aicategory, "special")) {
                var_939e1aed87d29e13 = self.var_a3d0ad660af72d52.specialdamage;
            } else if (is_equal(hitent.aicategory, "elite")) {
                var_939e1aed87d29e13 = self.var_a3d0ad660af72d52.var_6004242b2a8e2529;
            }
        }
        if (istrue(var_f4991c83e09960bd)) {
            hitent utility::ent_flag_set("dissolve");
            hitent playsound("evt_entity_beam_zombie_dissolve_death");
            hitent kill(var_6ab10bf6e1963525, self, self, "MOD_PROJECTILE");
            continue;
        }
        hitent dodamage(var_939e1aed87d29e13, var_6ab10bf6e1963525, self, self, "MOD_PROJECTILE");
    }
}

// Namespace namespace_6693a0c04250d04c / namespace_85abdc73fdc473e0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10c3
// Size: 0x53
function function_2a4593cba21b7ead() {
    predictedposition = vectorlerp(self.var_a3d0ad660af72d52.var_5cbba012d5f74041.origin, self.var_a3d0ad660af72d52.targetent.origin, 0.2);
    return predictedposition;
}

// Namespace namespace_6693a0c04250d04c / namespace_85abdc73fdc473e0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x111f
// Size: 0x60
function function_2971c0d765357e2b(index) {
    predictedposition = vectorlerp(self.var_a3d0ad660af72d52.var_e7e13b6c8ec22df6[index].origin, self.var_a3d0ad660af72d52.targetents[index].origin, 0.2);
    return predictedposition;
}

// Namespace namespace_6693a0c04250d04c / namespace_85abdc73fdc473e0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1188
// Size: 0xb6
function function_e4a60b288e21acbd(taskid, params) {
    var_b33910d3fd7718b1 = function_2da1745aab41cb94(self.entitydata.phaseindex);
    if (self function_11e2d4051ea44b35("in_beam_attack") == 4) {
        switch (var_b33910d3fd7718b1.var_15c62e2a3e84a52) {
        case #"hash_5a7a588e698f5388": 
            return function_a9ebe59a07633a35(var_b33910d3fd7718b1);
        case #"hash_16a7a0d29228a344": 
            return function_dd84c64b6c429321(var_b33910d3fd7718b1);
        case #"hash_4d08ff3ad458ee96":
        default: 
            return function_db31a2f63dd1d59b(var_b33910d3fd7718b1);
        }
    }
    return anim.running;
}

// Namespace namespace_6693a0c04250d04c / namespace_85abdc73fdc473e0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1247
// Size: 0x2d5
function function_db31a2f63dd1d59b(var_b33910d3fd7718b1) {
    if (gettime() > self.var_a3d0ad660af72d52.var_8b3564d3aa8cefe2 + var_b33910d3fd7718b1.var_68e04b0455c43bfe) {
        str = "beam_attack_end" + self.var_a3d0ad660af72d52.targetindex;
        self notify(str);
        self.var_a3d0ad660af72d52.var_e7e13b6c8ec22df6[self.var_a3d0ad660af72d52.targetindex] utility::function_3ab9164ef76940fd("beam_target", "off");
        self.var_a3d0ad660af72d52.targetindex += 1;
        self.var_a3d0ad660af72d52.var_8b3564d3aa8cefe2 = gettime();
        if (self.var_a3d0ad660af72d52.targetindex == self.var_a3d0ad660af72d52.targetents.size) {
            function_680e907027d24e86();
            return anim.success;
        }
    }
    index = self.var_a3d0ad660af72d52.targetindex;
    if (!isdefined(self.var_a3d0ad660af72d52.var_d91ebd99b9e4a77[index]) && isdefined(self.var_a3d0ad660af72d52.var_d8e4422371928803[index]) && isdefined(self.var_a3d0ad660af72d52.var_49723cc0041f1836[index])) {
        fxid = function_c4447e7f406126bb("entity_beam_vfx", self.entitydata.phaseindex);
        self.var_a3d0ad660af72d52.var_d91ebd99b9e4a77[index] = playfxontagsbetweenclients(getfx(fxid), self.var_a3d0ad660af72d52.var_e7e13b6c8ec22df6[index], "tag_origin", self.var_a3d0ad660af72d52.var_ca191c145576c838, "tag_origin");
        if (isdefined(self.var_a3d0ad660af72d52.var_d91ebd99b9e4a77[index])) {
            self.var_a3d0ad660af72d52.var_d91ebd99b9e4a77[index] function_cea710f9d017694a(1);
            thread function_5ee1730c2e122134(self.var_a3d0ad660af72d52.var_d91ebd99b9e4a77[index], "beam_attack_end");
            str = "beam_attack_end" + self.var_a3d0ad660af72d52.targetindex;
            thread function_5ee1730c2e122134(self.var_a3d0ad660af72d52.var_d91ebd99b9e4a77[index], str);
        }
        self.var_a3d0ad660af72d52.var_e7e13b6c8ec22df6[index] utility::function_3ab9164ef76940fd("beam_target", "beam_target_on");
        self.var_a3d0ad660af72d52.var_e7e13b6c8ec22df6[index] dontinterpolate();
    }
    return anim.running;
}

// Namespace namespace_6693a0c04250d04c / namespace_85abdc73fdc473e0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1525
// Size: 0x1dc
function function_dd84c64b6c429321(var_b33910d3fd7718b1) {
    if (gettime() > self.var_a3d0ad660af72d52.var_8b3564d3aa8cefe2 + var_b33910d3fd7718b1.var_68e04b0455c43bfe) {
        function_680e907027d24e86();
        return anim.success;
    }
    for (i = 0; i < self.var_a3d0ad660af72d52.targetents.size; i++) {
        if (!isdefined(self.var_a3d0ad660af72d52.var_d91ebd99b9e4a77[i]) && isdefined(self.var_a3d0ad660af72d52.var_d8e4422371928803[i]) && isdefined(self.var_a3d0ad660af72d52.var_49723cc0041f1836[i])) {
            fxid = function_c4447e7f406126bb("entity_beam_vfx", self.entitydata.phaseindex);
            self.var_a3d0ad660af72d52.var_d91ebd99b9e4a77[i] = playfxontagsbetweenclients(getfx(fxid), self.var_a3d0ad660af72d52.var_e7e13b6c8ec22df6[i], "tag_origin", self.var_a3d0ad660af72d52.var_ca191c145576c838, "tag_origin");
            if (isdefined(self.var_a3d0ad660af72d52.var_d91ebd99b9e4a77[i])) {
                self.var_a3d0ad660af72d52.var_d91ebd99b9e4a77[i] function_cea710f9d017694a(1);
                thread function_5ee1730c2e122134(self.var_a3d0ad660af72d52.var_d91ebd99b9e4a77[i], "beam_attack_end");
            }
            self.var_a3d0ad660af72d52.var_e7e13b6c8ec22df6[i] utility::function_3ab9164ef76940fd("beam_target", "beam_target_on");
            self.var_a3d0ad660af72d52.var_e7e13b6c8ec22df6[i] dontinterpolate();
        }
    }
    return anim.running;
}

// Namespace namespace_6693a0c04250d04c / namespace_85abdc73fdc473e0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x170a
// Size: 0x1af
function function_a9ebe59a07633a35(var_b33910d3fd7718b1) {
    if (gettime() > self.var_a3d0ad660af72d52.var_8b3564d3aa8cefe2 + var_b33910d3fd7718b1.var_68e04b0455c43bfe) {
        function_680e907027d24e86();
        return anim.success;
    }
    if (!isdefined(self.var_a3d0ad660af72d52.var_43ebce8c6fadfade) && isdefined(self.var_a3d0ad660af72d52.var_52c410f7e0d3b282) && isdefined(self.var_a3d0ad660af72d52.var_974971cf3b92ec81)) {
        fxid = function_c4447e7f406126bb("entity_beam_vfx", self.entitydata.phaseindex);
        self.var_a3d0ad660af72d52.var_43ebce8c6fadfade = playfxontagsbetweenclients(getfx(fxid), self.var_a3d0ad660af72d52.var_5cbba012d5f74041, "tag_origin", self.var_a3d0ad660af72d52.var_ca191c145576c838, "tag_origin");
        if (isdefined(self.var_a3d0ad660af72d52.var_43ebce8c6fadfade)) {
            self.var_a3d0ad660af72d52.var_43ebce8c6fadfade function_cea710f9d017694a(1);
            thread function_5ee1730c2e122134(self.var_a3d0ad660af72d52.var_43ebce8c6fadfade, "beam_attack_end");
        }
        self.var_a3d0ad660af72d52.var_5cbba012d5f74041 utility::function_3ab9164ef76940fd("beam_target", "beam_target_on");
        self.var_a3d0ad660af72d52.var_5cbba012d5f74041 dontinterpolate();
        utility::function_3ab9164ef76940fd("palm", "beam");
    }
    return anim.running;
}

// Namespace namespace_6693a0c04250d04c / namespace_85abdc73fdc473e0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18c2
// Size: 0x295
function function_5231ea5134958d4d(taskid, params) {
    var_b33910d3fd7718b1 = function_2da1745aab41cb94(self.entitydata.phaseindex);
    if (self function_11e2d4051ea44b35("in_beam_attack") == 2) {
        if (self.var_a3d0ad660af72d52.var_ca191c145576c838 getscriptablehaspart("beam_origin") && self.var_a3d0ad660af72d52.var_ca191c145576c838 getscriptablepartstate("beam_origin") != "beam_origin_on") {
            self.var_a3d0ad660af72d52.var_ca191c145576c838 utility::function_3ab9164ef76940fd("beam_origin", "beam_origin_on");
            self.var_a3d0ad660af72d52.var_ca191c145576c838 dontinterpolate();
            var_d10f14fc6f112fa4 = function_b61d0a63a27dd52e("beam_attack_target", self.entitydata.phaseindex);
            if (var_b33910d3fd7718b1.var_15c62e2a3e84a52 == "Standard") {
                self.var_a3d0ad660af72d52.targetent function_3ab9164ef76940fd("zombieEntityVFX", var_d10f14fc6f112fa4);
            } else {
                for (i = 0; i < self.var_a3d0ad660af72d52.targetents.size; i++) {
                    if (isent(self.var_a3d0ad660af72d52.targetents[i])) {
                        self.var_a3d0ad660af72d52.targetents[i] function_3ab9164ef76940fd("zombieEntityVFX", var_d10f14fc6f112fa4);
                    }
                }
            }
        }
        if (gettime() > self.var_a3d0ad660af72d52.var_ba5f72633d21887d + var_b33910d3fd7718b1.var_136749637cbe9ad2) {
            self function_3e89eb3d8e3f1811("in_beam_attack", 3);
            if (var_b33910d3fd7718b1.var_15c62e2a3e84a52 == "Standard") {
                if (isdefined(self.var_a3d0ad660af72d52.targetent)) {
                    self.var_a3d0ad660af72d52.targetent function_3ab9164ef76940fd("zombieEntityVFX", "off");
                }
            } else {
                for (i = 0; i < self.var_a3d0ad660af72d52.targetents.size; i++) {
                    if (isent(self.var_a3d0ad660af72d52.targetents[i])) {
                        self.var_a3d0ad660af72d52.targetents[i] function_3ab9164ef76940fd("zombieEntityVFX", "off");
                    }
                }
            }
            return anim.success;
        }
    }
    return anim.running;
}

// Namespace namespace_6693a0c04250d04c / namespace_85abdc73fdc473e0
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1b60
// Size: 0x19
function private function_6b4f9e89f81383ea() {
    self notify("tracker_beam_end");
    self notify("beam_attack_end");
    function_680e907027d24e86();
}

// Namespace namespace_6693a0c04250d04c / namespace_85abdc73fdc473e0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b81
// Size: 0x314
function function_680e907027d24e86() {
    var_b33910d3fd7718b1 = function_2da1745aab41cb94(self.entitydata.phaseindex);
    self.entitydata.var_37e9fcfa2a8f6a31 = gettime() + var_b33910d3fd7718b1.cooldown;
    self.entitydata.var_1205963be798c1e3 = gettime();
    self.entitydata.var_9adf21d0962a922b = 0;
    self.entitydata.var_1be563f374236c47 = undefined;
    if (isdefined(self.var_a3d0ad660af72d52.targetents)) {
        for (i = 0; i < self.var_a3d0ad660af72d52.targetents.size; i++) {
            if (isdefined(self.var_a3d0ad660af72d52.targetents[i])) {
                self.var_a3d0ad660af72d52.targetents[i].var_c764aba579deab63 = 0;
            }
        }
    }
    self.var_a3d0ad660af72d52.var_d8e4422371928803 = [];
    self.var_a3d0ad660af72d52.var_49723cc0041f1836 = [];
    self.var_a3d0ad660af72d52.targetents = [];
    self.var_a3d0ad660af72d52.var_e7e13b6c8ec22df6 = [];
    self.var_a3d0ad660af72d52.var_d91ebd99b9e4a77 = [];
    self function_3e89eb3d8e3f1811("in_beam_attack", 5);
    utility::function_3ab9164ef76940fd("palm", "off");
    ent_flag_clear("beam_attack_vo");
    self.var_a3d0ad660af72d52.var_52c410f7e0d3b282 = undefined;
    self.var_a3d0ad660af72d52.var_974971cf3b92ec81 = undefined;
    if (isdefined(self.var_a3d0ad660af72d52.var_ca191c145576c838)) {
        self.var_a3d0ad660af72d52.var_ca191c145576c838 utility::function_3ab9164ef76940fd("beam_origin", "beam_origin_off");
        self.var_a3d0ad660af72d52.var_ca191c145576c838 delete();
    }
    if (isdefined(self.var_a3d0ad660af72d52.var_5cbba012d5f74041)) {
        self.var_a3d0ad660af72d52.var_5cbba012d5f74041 utility::function_3ab9164ef76940fd("beam_target", "beam_target_off");
        self.var_a3d0ad660af72d52.var_5cbba012d5f74041 delete();
    }
    if (isdefined(self.var_a3d0ad660af72d52.targetent)) {
        self.var_a3d0ad660af72d52.targetent.var_c764aba579deab63 = 0;
        self.var_a3d0ad660af72d52.targetent utility::function_3ab9164ef76940fd("zombieEntityVFX", "off");
        self.var_a3d0ad660af72d52.targetent = undefined;
    }
    if (istrue(self.var_a3d0ad660af72d52.var_98a650d81ee56d1a)) {
        var_b33910d3fd7718b1.var_15c62e2a3e84a52 = "Random";
        self.var_a3d0ad660af72d52.var_98a650d81ee56d1a = 0;
    }
}

// Namespace namespace_6693a0c04250d04c / namespace_85abdc73fdc473e0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e9d
// Size: 0x69
function function_d4d4badbc5957e54() {
    var_21e7f83a51e08f01 = randomint(3);
    switch (var_21e7f83a51e08f01) {
    case 2: 
        return "Successive";
    case 1: 
        return "Simultaneous";
    case 0:
    default: 
        return "Standard";
    }
}

