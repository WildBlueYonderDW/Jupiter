#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\sp\destructibles\barrel_common.gsc;

#namespace namespace_36e29f37467ebcd6;

// Namespace namespace_36e29f37467ebcd6 / namespace_831319c7b03ee2b3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x127
// Size: 0x7c
function function_51b91752c24c4995() {
    var_8b6e8b1442b446fe = getentarray("dyn_log_pile", "targetname");
    if (var_8b6e8b1442b446fe.size <= 0) {
        return;
    }
    level.g_effect["log_pile_impact"] = loadfx("vfx/jup/prop/scriptables/vfx_jup_log_shrapnel_01.vfx");
    for (i = 0; i < var_8b6e8b1442b446fe.size; i++) {
        var_8b6e8b1442b446fe[i] setcandamage(1);
        var_8b6e8b1442b446fe[i].spewtags = [];
        var_8b6e8b1442b446fe[i] thread function_36e29f37467ebcd6();
    }
}

// Namespace namespace_36e29f37467ebcd6 / namespace_831319c7b03ee2b3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ab
// Size: 0x17e
function function_36e29f37467ebcd6() {
    self endon("entitydeleted");
    while (true) {
        amount, attacker, direction_vec, point, type, modelname, tagname, partname, dflags, objweapon = self waittill("damage");
        if (!isdefined(type)) {
            continue;
        }
        if (ismeleedamage(type)) {
            continue;
        }
        if (self.spewtags.size >= 4) {
            continue;
        }
        stringarray = strtok(type, "_");
        if (!array_contains(stringarray, "BULLET")) {
            continue;
        }
        tag = spawn_tag_origin(point);
        vec = vectornormalize(self.origin - point);
        tagangles = vectortoangles(vec * -1);
        tag.angles = flat_angle(tagangles);
        tag linkto(self);
        self notify("new_spew", tag);
        playfxontag(level.g_effect["log_pile_impact"], tag, "tag_origin");
        self.spewtags = array_add(self.spewtags, tag);
        thread function_3289f7ed667e369c(tag);
    }
}

// Namespace namespace_36e29f37467ebcd6 / namespace_831319c7b03ee2b3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x331
// Size: 0x3e
function function_3289f7ed667e369c(var_7561611ace525e6) {
    waittill_notify_or_timeout("entitydeleted", 5);
    if (isdefined(self)) {
        self.spewtags = array_remove(self.spewtags, var_7561611ace525e6);
    }
    var_7561611ace525e6 delete();
}

