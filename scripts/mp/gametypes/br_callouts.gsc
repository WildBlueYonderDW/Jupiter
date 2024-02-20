// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace namespace_e7f6caa0abefff43;

// Namespace namespace_e7f6caa0abefff43/namespace_cf43e8181d279e3e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0
// Size: 0x4d9
function init() {
    level.calloutglobals.namelocations = [];
    if (!istrue(level.calloutglobals.var_41e0068712e63739) && !isdefined(level.calloutglobals.var_a01735389a5d70d7) && (!isdefined(level.calloutglobals.callouttable) || !tableexists(level.calloutglobals.callouttable))) {
        return;
    }
    minx = level.mapcorners[0].origin[0];
    maxx = level.mapcorners[1].origin[0];
    var_4cb56d024c774848 = maxx - minx;
    miny = level.mapcorners[0].origin[1];
    maxy = level.mapcorners[1].origin[1];
    var_4cb56e024c774a7b = maxy - miny;
    if (istrue(level.calloutglobals.var_41e0068712e63739)) {
        level.calloutglobals.var_81bcc3f4c201eb = [];
        var_96e38bcf1337d181 = function_c3d63e6778e39f83(1);
        for (var_303ce5a5cea462cd = 0; var_303ce5a5cea462cd < var_96e38bcf1337d181; var_303ce5a5cea462cd++) {
            site = function_d0ed84c86e823a7c(1, var_303ce5a5cea462cd);
            region = function_7fdd7f9d54666e5f(1, site.region);
            ref = region.name + " site_" + var_303ce5a5cea462cd;
            /#
                assertex(!isdefined(level.calloutglobals.namelocations[ref]), "Callout Ref "" + ref + "" exists twice for map " + level.mapname);
            #/
            var_72865918609ff919 = spawnstruct();
            var_72865918609ff919.origin = site.origin;
            level.calloutglobals.namelocations[ref] = var_72865918609ff919;
            level.calloutglobals.var_81bcc3f4c201eb[var_303ce5a5cea462cd] = ref;
        }
    } else if (isdefined(level.calloutglobals.var_a01735389a5d70d7)) {
        foreach (callout in level.calloutglobals.var_a01735389a5d70d7) {
            if (!istrue(callout.var_c13986eca25dd35e)) {
                continue;
            }
            x = callout.var_1372a4550d27dbdb;
            x = float(x);
            x = x * var_4cb56d024c774848 + minx;
            y = callout.var_799fca8bdcc553e8;
            y = float(y);
            y = y * var_4cb56e024c774a7b + miny;
            radius = callout.radius;
            radius = float(radius);
            ref = callout.var_e90349c02adfb3a0;
            var_72865918609ff919 = spawnstruct();
            var_72865918609ff919.origin = (x, y, 0);
            var_72865918609ff919.radius = radius;
            level.calloutglobals.namelocations[ref] = var_72865918609ff919;
        }
    } else {
        for (row = 0; 1; row++) {
            var_c13986eca25dd35e = tablelookupbyrow(level.calloutglobals.callouttable, row, 5);
            if (!isdefined(var_c13986eca25dd35e) || var_c13986eca25dd35e == "") {
                break;
            }
            if (var_c13986eca25dd35e != "1") {
                continue;
            }
            x = tablelookupbyrow(level.calloutglobals.callouttable, row, 6);
            x = float(x);
            x = x * var_4cb56d024c774848 + minx;
            y = tablelookupbyrow(level.calloutglobals.callouttable, row, 7);
            y = float(y);
            y = y * var_4cb56e024c774a7b + miny;
            radius = tablelookupbyrow(level.calloutglobals.callouttable, row, 8);
            radius = float(radius);
            ref = tablelookupbyrow(level.calloutglobals.callouttable, row, 1);
            var_72865918609ff919 = spawnstruct();
            var_72865918609ff919.origin = (x, y, 0);
            var_72865918609ff919.radius = radius;
            level.calloutglobals.namelocations[ref] = var_72865918609ff919;
        }
    }
}

// Namespace namespace_e7f6caa0abefff43/namespace_cf43e8181d279e3e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x580
// Size: 0xef
function getlocationnameforpoint(point) {
    locname = "";
    if (istrue(level.calloutglobals.var_41e0068712e63739)) {
        var_303ce5a5cea462cd = function_3db4b97c31efed0b(1, point);
        if (isdefined(var_303ce5a5cea462cd)) {
            locname = level.calloutglobals.var_81bcc3f4c201eb[var_303ce5a5cea462cd];
        }
    } else {
        foreach (name, info in level.calloutglobals.namelocations) {
            if (distance2dsquared(point, info.origin) <= info.radius * info.radius) {
                locname = name;
                break;
            }
        }
    }
    return locname;
}

// Namespace namespace_e7f6caa0abefff43/namespace_cf43e8181d279e3e
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x677
// Size: 0xd8
function private function_758c08865c2c0b() {
    /#
        if (istrue(level.calloutglobals.var_41e0068712e63739)) {
            function_ca53c186276d760(0, 1);
        } else {
            foreach (ref, loc in level.calloutglobals.namelocations) {
                namespace_3c37cb17ade254d::draw_circle(loc.origin, loc.radius, (1, 1, 0), 1, 0, 1);
                debugstar(loc.origin, (1, 1, 0), 1, ref, 1);
            }
        }
    #/
}

// Namespace namespace_e7f6caa0abefff43/namespace_cf43e8181d279e3e
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x756
// Size: 0x184
function private function_59ff91039ae7cc92() {
    /#
        showtablets = isdefined(level.questinfo) && isdefined(level.questinfo.debuginfo) && isdefined(level.questinfo.debuginfo.var_70ad3759919237b7);
        foreach (ref, loc in level.calloutglobals.namelocations) {
            if (showtablets && isdefined(level.questinfo.debuginfo.var_70ad3759919237b7[ref])) {
                foreach (tablet in level.questinfo.debuginfo.var_70ad3759919237b7[ref]) {
                    sphere(tablet.origin, 30, (1, 0, 0));
                    line(tablet.origin, loc.origin, (1, 0, 0));
                }
            }
        }
    #/
}

// Namespace namespace_e7f6caa0abefff43/namespace_cf43e8181d279e3e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8e1
// Size: 0x4f
function function_1d1637db14bbc7d1() {
    /#
        if (istrue(level.var_d55be984182fdc3)) {
            level.var_d55be984182fdc3 = 0;
            level notify("<unknown string>");
            return;
        }
        level endon("<unknown string>");
        level.var_d55be984182fdc3 = 1;
        while (1) {
            function_758c08865c2c0b();
            function_59ff91039ae7cc92();
            waitframe();
        }
    #/
}

