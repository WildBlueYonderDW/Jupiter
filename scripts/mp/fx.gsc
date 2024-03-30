// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\fx.gsc;
#using scripts\common\createfx.gsc;
#using scripts\mp\createfx.gsc;

#namespace fx;

// Namespace fx / scripts/mp/fx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdf
// Size: 0x18d
function script_print_fx() {
    if (!isdefined(self.script_fxid) || !isdefined(self.script_fxcommand) || !isdefined(self.script_delay)) {
        /#
            println("<unknown string>", self.origin, "<unknown string>");
        #/
        self delete();
        return;
    }
    if (isdefined(self.target)) {
        org = getent(self.target).origin;
    } else {
        org = "undefined";
    }
    /#
        if (self.script_fxcommand == "<unknown string>") {
            println("<unknown string>" + self.script_fxid + "<unknown string>" + self.origin + "<unknown string>" + self.script_delay + "<unknown string>" + org + "<unknown string>");
        }
        if (self.script_fxcommand == "<unknown string>") {
            println("<unknown string>" + self.script_fxid + "<unknown string>" + self.origin + "<unknown string>" + self.script_delay + "<unknown string>" + org + "<unknown string>");
        }
        if (self.script_fxcommand == "<unknown string>") {
            println("<unknown string>" + self.script_fxid + "<unknown string>" + self.origin + "<unknown string>" + self.script_delay + "<unknown string>" + org + "<unknown string>");
        }
    #/
}

// Namespace fx / scripts/mp/fx
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x273
// Size: 0x35
function grenadeexplosionfx(pos) {
    playfx(level._effect["mechanical explosion"], pos);
    earthquake(0.15, 0.5, pos, 250);
}

// Namespace fx / scripts/mp/fx
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2af
// Size: 0x62
function soundfx(fxid, fxpos, endonnotify) {
    org = spawn("script_origin", (0, 0, 0));
    org.origin = fxpos;
    org playloopsound(fxid);
    if (isdefined(endonnotify)) {
        org thread soundfxdelete(endonnotify);
    }
}

// Namespace fx / scripts/mp/fx
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x318
// Size: 0x17
function soundfxdelete(endonnotify) {
    level waittill(endonnotify);
    self delete();
}

// Namespace fx / scripts/mp/fx
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x336
// Size: 0x15e
function func_glass_handler() {
    var_f5207dc7648baed9 = [];
    var_5f91ac0fae720aac = [];
    temp_decals = getentarray("vfx_custom_glass", "targetname");
    foreach (decal in temp_decals) {
        if (isdefined(decal.script_noteworthy)) {
            attached_glass = getglass(decal.script_noteworthy);
            if (isdefined(attached_glass)) {
                var_5f91ac0fae720aac[attached_glass] = decal;
                var_f5207dc7648baed9[var_f5207dc7648baed9.size] = attached_glass;
            }
        }
    }
    var_5765c257f01f4f2b = var_f5207dc7648baed9.size;
    var_5356ea5b8d524ec1 = var_f5207dc7648baed9.size;
    max_iterations = 5;
    current_index = 0;
    while (var_5765c257f01f4f2b != 0) {
        max_index = current_index + max_iterations - 1;
        if (max_index > var_5356ea5b8d524ec1) {
            max_index = var_5356ea5b8d524ec1;
        }
        if (current_index == var_5356ea5b8d524ec1) {
        }
        for (current_index = 0; current_index < max_index; current_index++) {
            glass_index = var_f5207dc7648baed9[current_index];
            decal = var_5f91ac0fae720aac[glass_index];
            if (isdefined(decal)) {
                if (isglassdestroyed(glass_index)) {
                    decal delete();
                    var_5765c257f01f4f2b--;
                    var_5f91ac0fae720aac[glass_index] = undefined;
                }
            }
        }
        wait(0.05);
    }
}

// Namespace fx / scripts/mp/fx
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x49b
// Size: 0x1b
function blenddelete(blend) {
    self waittill("death");
    blend delete();
}

