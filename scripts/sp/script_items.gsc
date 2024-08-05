#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_3fc9349f6f00dde5;

// Namespace namespace_3fc9349f6f00dde5 / scripts\sp\script_items
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xc0
// Size: 0x6f
function scriptitem_buildspawnflags(var_a11236b2c6149a38, usephysics, var_5056a852b72d7663, var_f09e7de41dc186ea, var_39d8191f0d9ca44c) {
    spawnflags = 0;
    if (istrue(var_a11236b2c6149a38)) {
        spawnflags |= 1;
    }
    if (istrue(usephysics)) {
        spawnflags |= 2;
    }
    if (istrue(var_5056a852b72d7663)) {
        spawnflags |= 4;
    }
    if (istrue(var_f09e7de41dc186ea)) {
        spawnflags |= 8;
    }
    if (istrue(var_39d8191f0d9ca44c)) {
        spawnflags |= 16;
    }
    return spawnflags;
}

// Namespace namespace_3fc9349f6f00dde5 / scripts\sp\script_items
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x138
// Size: 0xfe
function scriptitem_testspawn(position, angles, hintstring) {
    var_a11236b2c6149a38 = 0;
    usephysics = 1;
    var_31fb1cb0647f60c6 = 0;
    var_6ee2fa3bced473a6 = 0;
    var_39d8191f0d9ca44c = 0;
    classname = "script_item" + "_example";
    spawnflags = scriptitem_buildspawnflags(var_a11236b2c6149a38, usephysics, var_31fb1cb0647f60c6, var_6ee2fa3bced473a6, var_39d8191f0d9ca44c);
    model = "equipment_oxygen_tank_01";
    impulse = (randomintrange(-200, 200), randomintrange(-200, 200), 1000);
    contact_pos = position + (2, 2, -1);
    if (!isdefined(hintstring)) {
        hintstring = "hint string";
    }
    script_item = spawnscriptitem(classname, position, angles, spawnflags, model, hintstring, impulse, contact_pos);
    return script_item;
}

/#

    // Namespace namespace_3fc9349f6f00dde5 / scripts\sp\script_items
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x23f
    // Size: 0x22
    function scriptitem_playerwatchforanypickup() {
        self endon("<dev string:x1c>");
        for (;;) {
            self waittill("<dev string:x22>");
            println("<dev string:x29>");
        }
    }

#/

// Namespace namespace_3fc9349f6f00dde5 / scripts\sp\script_items
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x269
// Size: 0x5b
function scriptitem_itemwatchfortrigger(message) {
    self endon("death");
    player = self waittill("trigger");
    println("<dev string:x47>" + message);
    earthquake(0.6, 0.5, level.player.origin, 300);
}

