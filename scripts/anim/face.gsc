// mwiii decomp prototype
#namespace face;

// Namespace face/namespace_166dc34a2c7481df
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x197
// Size: 0x43e
function saygenericdialogue(typestring) {
    if (self.unittype != "soldier" && self.unittype != "civilian" && self.unittype != "juggernaut" && self.unittype != "suicidebomber") {
        return;
    }
    chance = undefined;
    switch (typestring) {
    case #"hash_48992ea0e7c59d03":
    case #"hash_69cda088cc03687b":
        importance = 0.5;
        break;
    case #"hash_a36bc9705096e427":
        importance = 0.7;
        chance = 50;
        break;
    case #"hash_c6e9d384b1d615f5":
        importance = 0.9;
        chance = 98;
        break;
    case #"hash_5b2312cf1df3e0a":
    case #"hash_16385fce47a909fa":
    case #"hash_77066905f9ad0542":
    case #"hash_ba7993736731e211":
    case #"hash_c046c4a28eed6ea2":
    case #"hash_e8bc3da4af287c2d":
    case #"hash_f65dca6d4fbde6c6":
        importance = 1;
        break;
    default:
        /#
            println("<unknown string>" + typestring);
        #/
        importance = 0.3;
        break;
    }
    if (isdefined(chance) && randomint(100) > chance) {
        return;
    }
    var_f85c71ac24b34a53 = undefined;
    prefix = "generic_";
    var_b4b6f604f09edb18 = undefined;
    var_46119ee4018a3e10 = undefined;
    if (isdefined(self.battlechatter) && isdefined(self.battlechatter.npcid)) {
        switch (self.battlechatter.npcid) {
        case #"hash_c614d6c10a50c4f":
        case #"hash_21618e6c1b52ee5a":
        case #"hash_289af76c1f0f0908":
        case #"hash_3689ba6c261f7001":
        case #"hash_5562686c3699e6a9":
        case #"hash_9009aa6c552a085a":
        case #"hash_ed5cac6c000817dc":
            var_b4b6f604f09edb18 = self.battlechatter.npcid;
            prefix = "hero_";
            var_46119ee4018a3e10 = 1;
            break;
        }
    }
    if (self.unittype == "juggernaut") {
        var_b4b6f604f09edb18 = "juggernaut";
        var_46119ee4018a3e10 = 8;
    }
    if (!isdefined(var_b4b6f604f09edb18)) {
        switch (self.voice) {
        case #"sas":
        case #"unitednations":
        case #"unitedstates":
        case #"unitednationshelmet":
        case #"fsa":
            var_b4b6f604f09edb18 = "friendly";
            var_46119ee4018a3e10 = anim.numfriendlyvoices;
            break;
        case #"hash_2271c18ddc896352":
        case #"fsafemale":
        case #"unitednationsfemale":
        case #"hash_56e75d50b07f42a2":
        case #"unitedstatesfemale":
        case #"hash_dd038f43e57f86da":
            var_b4b6f604f09edb18 = "friendly";
            prefix = "woman_";
            var_46119ee4018a3e10 = anim.numfriendlyfemalevoices;
            break;
        case #"c6":
            var_b4b6f604f09edb18 = "c6";
            var_46119ee4018a3e10 = 1;
            break;
        default:
            var_b4b6f604f09edb18 = "enemy";
            var_46119ee4018a3e10 = anim.numenemyvoices;
            break;
        }
    }
    /#
        assert(isdefined(var_b4b6f604f09edb18));
    #/
    /#
        assert(isdefined(var_46119ee4018a3e10));
    #/
    var_f85c71ac24b34a53 = 1 + self getentitynumber() % var_46119ee4018a3e10;
    /#
        assert(isdefined(var_f85c71ac24b34a53));
    #/
    var_b4b6f604f09edb18 = var_b4b6f604f09edb18 + "_" + var_f85c71ac24b34a53;
    soundalias = undefined;
    if (!isdefined(soundalias)) {
        if (isdefined(self.generic_voice_override)) {
            soundalias = self.generic_voice_override + "_" + typestring + "_" + var_b4b6f604f09edb18;
        } else {
            soundalias = prefix + typestring + "_" + var_b4b6f604f09edb18;
        }
        if (!soundexists(soundalias)) {
            soundalias = "generic_" + typestring + "_" + var_b4b6f604f09edb18;
        }
    }
    if (getdvarint(@"hash_67846a0d7aa3030a", 1)) {
        /#
            println("<unknown string>" + soundalias);
        #/
    }
    thread playfacethread(soundalias, undefined);
}

// Namespace face/namespace_166dc34a2c7481df
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5dc
// Size: 0x1e
function sayspecificdialogue(soundalias, notifystring) {
    thread playfacethread(soundalias, notifystring);
}

// Namespace face/namespace_166dc34a2c7481df
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x601
// Size: 0x43
function playfacethread(soundalias, notifystring) {
    if (isdefined(notifystring)) {
        if (isdefined(soundalias)) {
            playfacesound(soundalias, "animscript facesound" + notifystring, 1);
            thread waitforfacesound(notifystring);
        }
    } else {
        playfacesound(soundalias);
    }
}

// Namespace face/namespace_166dc34a2c7481df
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64b
// Size: 0x6f
function playfacesound(alias, notification, var_9a0afe8ff3d2508f) {
    if (isai(self)) {
        self [[ anim.callbacks["PlaySoundAtViewHeight"] ]](alias, notification, var_9a0afe8ff3d2508f);
    } else if (isdefined(notification) && isdefined(var_9a0afe8ff3d2508f)) {
        self playsound(alias, notification, var_9a0afe8ff3d2508f);
    } else if (isdefined(notification)) {
        self playsound(alias, notification);
    } else {
        self playsound(alias);
    }
}

// Namespace face/namespace_166dc34a2c7481df
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c1
// Size: 0x21
function waitforfacesound(msg) {
    self endon("death");
    self waittill("animscript facesound" + msg);
    self notify(msg);
}

// Namespace face/namespace_166dc34a2c7481df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e9
// Size: 0x2b
function initlevelface() {
    anim.numenemyvoices = 7;
    anim.numfriendlyvoices = 7;
    anim.numfriendlyfemalevoices = 3;
    initfacialanims();
}

// Namespace face/namespace_166dc34a2c7481df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71b
// Size: 0xd
function initfacialanims() {
    anim.facial = [];
}

// Namespace face/namespace_166dc34a2c7481df
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72f
// Size: 0x17
function animhasfacialoverride(var_63db3c9e26531938) {
    return animhasnotetrack(var_63db3c9e26531938, "facial_override");
}

// Namespace face/namespace_166dc34a2c7481df
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x74e
// Size: 0xf6
function playfacialanim(var_63db3c9e26531938, var_3a06ff8de29ae6de, var_7603481bb08ae5d0) {
    if (isdefined(self.bdisabledefaultfacialanims) && self.bdisabledefaultfacialanims) {
        self aiclearanim(generic_human%head, 0.2);
        return;
    }
    if (isdefined(var_63db3c9e26531938) && animhasfacialoverride(var_63db3c9e26531938)) {
        self aiclearanim(generic_human%head, 0.2);
        return;
    }
    /#
        assert(isdefined(anim.facial));
    #/
    if (!isdefined(anim.facial[var_3a06ff8de29ae6de])) {
        return;
    }
    if (isdefined(var_7603481bb08ae5d0) && var_7603481bb08ae5d0 >= 0 && var_7603481bb08ae5d0 < anim.facial[var_3a06ff8de29ae6de].size) {
        var_f49ee9d2911c5ab5 = var_7603481bb08ae5d0;
    } else {
        var_f49ee9d2911c5ab5 = randomint(anim.facial[var_3a06ff8de29ae6de].size);
    }
    facialanim = anim.facial[var_3a06ff8de29ae6de][var_f49ee9d2911c5ab5];
    self setanimknob(facialanim);
    return var_f49ee9d2911c5ab5;
}

