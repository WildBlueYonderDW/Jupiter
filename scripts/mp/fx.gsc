// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\fx.gsc;
#using scripts\common\createfx.gsc;
#using scripts\mp\createfx.gsc;

#namespace fx;

// Namespace fx/namespace_ef20c47a09e3a5f8
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

// Namespace fx/namespace_ef20c47a09e3a5f8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x273
// Size: 0x35
function grenadeexplosionfx(pos) {
    playfx(level._effect["mechanical explosion"], pos);
    earthquake(0.15, 0.5, pos, 250);
}

// Namespace fx/namespace_ef20c47a09e3a5f8
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

// Namespace fx/namespace_ef20c47a09e3a5f8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x318
// Size: 0x17
function soundfxdelete(endonnotify) {
    level waittill(endonnotify);
    self delete();
}

// Namespace fx/namespace_ef20c47a09e3a5f8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x336
// Size: 0x15e
function func_glass_handler() {
    var_f5207dc7648baed9 = [];
    var_5f91ac0fae720aac = [];
    var_20d527e317c41d46 = getentarray("vfx_custom_glass", "targetname");
    foreach (decal in var_20d527e317c41d46) {
        if (isdefined(decal.script_noteworthy)) {
            var_8d25f853511ac66e = getglass(decal.script_noteworthy);
            if (isdefined(var_8d25f853511ac66e)) {
                var_5f91ac0fae720aac[var_8d25f853511ac66e] = decal;
                var_f5207dc7648baed9[var_f5207dc7648baed9.size] = var_8d25f853511ac66e;
            }
        }
    }
    var_5765c257f01f4f2b = var_f5207dc7648baed9.size;
    var_5356ea5b8d524ec1 = var_f5207dc7648baed9.size;
    var_380081ed3d43c6aa = 5;
    current_index = 0;
    while (var_5765c257f01f4f2b != 0) {
        max_index = current_index + var_380081ed3d43c6aa - 1;
        if (max_index > var_5356ea5b8d524ec1) {
            max_index = var_5356ea5b8d524ec1;
        }
        if (current_index == var_5356ea5b8d524ec1) {
            current_index = 0;
        }
        while (current_index < max_index) {
            var_d3f442ebd2d75d2c = var_f5207dc7648baed9[current_index];
            decal = var_5f91ac0fae720aac[var_d3f442ebd2d75d2c];
            if (isdefined(decal)) {
                if (isglassdestroyed(var_d3f442ebd2d75d2c)) {
                    decal delete();
                    var_5765c257f01f4f2b--;
                    var_5f91ac0fae720aac[var_d3f442ebd2d75d2c] = undefined;
                }
            }
            current_index++;
        }
        wait(0.05);
    }
}

// Namespace fx/namespace_ef20c47a09e3a5f8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x49b
// Size: 0x1b
function blenddelete(blend) {
    self waittill("death");
    blend delete();
}

