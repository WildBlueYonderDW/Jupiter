// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;

#namespace secrethunt;

// Namespace secrethunt/namespace_60a8dda3c8940fff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10e
// Size: 0x81
function secrethunt(targetname) {
    while (!istrue(game["gamestarted"])) {
        waitframe();
    }
    var_c5eec6817cb3208b = getentarray(targetname, "targetname");
    foreach (obj in var_c5eec6817cb3208b) {
        obj thread trackhiddenobj(var_c5eec6817cb3208b.size);
    }
}

// Namespace secrethunt/namespace_60a8dda3c8940fff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x196
// Size: 0x1ce
function trackhiddenobj(var_aa030029a5b16ae5) {
    level endon("game_ended");
    self setcandamage(1);
    self.found = [];
    /#
        thread secrethunt_debuglocations();
    #/
    while (1) {
        inflictor = normal = angles = origin = objweapon = idflags = partname = tagname = modelname = meansofdeath = point = direction_vec = attacker = damage = self waittill("damage");
        if (isdefined(objweapon)) {
            if (meansofdeath == "MOD_EXPLOSIVE" || meansofdeath == "MOD_GRENADE_SPLASH") {
                continue;
            }
        } else if (isdefined(inflictor.streakinfo) && namespace_9abe40d2af041eb2::function_ce1a9c6c9043809f(inflictor.streakinfo.streakname)) {
            self.health = 5;
            continue;
        }
        if (!isdefined(self.found[attacker.guid])) {
            self.found[attacker.guid] = 1;
            if (!isdefined(attacker.hiddenobjcount)) {
                attacker.hiddenobjcount = 1;
            } else {
                attacker.hiddenobjcount++;
            }
            iprintln("Secret objects found: " + attacker.hiddenobjcount + " of " + var_aa030029a5b16ae5);
        }
        if (self.health <= 0) {
            break;
        }
    }
    self delete();
}

// Namespace secrethunt/namespace_60a8dda3c8940fff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36b
// Size: 0x6c
function secrethunt_debuglocations() {
    level endon("game_ended");
    self endon("death");
    while (1) {
        if (getdvarint(@"hash_7a5a40586350d163", 0) == 1) {
            self hudoutlineenable("outlinefill_nodepth_green");
            self.outlined = 1;
        } else if (istrue(self.outlined)) {
            self hudoutlinedisable();
            self.outlined = 0;
        }
        wait(1);
    }
}

