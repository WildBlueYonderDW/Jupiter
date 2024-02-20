// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\equipment.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\utility\scriptable_door_utility.gsc;
#using scripts\engine\scriptable_door.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\mp\analyticslog.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\damage.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_46a2e07dc61d9261;

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f1
// Size: 0x70
function function_bfeeefe1b4413ef0() {
    level.var_b73eb86d1d5a19e9 = [];
    precachestring("EQUIPMENT_HINTS/DOOR_BARRICADE_CAN_REMOVE");
    precachestring("EQUIPMENT_HINTS/DOOR_BARRICADE_CANNOT_REMOVE");
    namespace_7ee767bbb40971f1::function_29ba88e5ce21f3fd(&function_d42196552ddc1a12);
    namespace_7ee767bbb40971f1::function_e37078f3d00ef312(&function_20c4d2ad6cf2bed3);
    namespace_7ee767bbb40971f1::function_87d7be37d61cbae3(&function_7e1a3b2e2d74be03);
    namespace_17c25f0877bfb620::scriptable_adddamagedcallback(&function_fa856206e66d1aca);
    level.var_40a4b55961592afe = spawnstruct();
    function_f2f0951e4a6e218c();
    thread function_7b14c1e8b791b520();
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x368
// Size: 0xc
function function_23c3d8f2ae91b6c3() {
    return level.var_40a4b55961592afe;
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37c
// Size: 0x183
function function_f2f0951e4a6e218c() {
    levelData = function_23c3d8f2ae91b6c3();
    levelData.var_4acc66ea74cdc413 = getdvarint(@"hash_c7e9a5f7f0d6fe87", 1) == 1;
    levelData.var_71dbb8c4005d612b = getdvarint(@"hash_de33df60fcc33a48", 1) == 1;
    levelData.lifetime = getdvarint(@"hash_e94d386176ea049c", 360);
    levelData.var_8a25a7879becda51 = getdvarfloat(@"hash_6c0ae9b78fea9323", 1.4);
    levelData.maxhealth = getdvarfloat(@"hash_50c1b3e18786df16", 1000);
    levelData.meleedamage = getdvarfloat(@"hash_12cceb48a02504f", levelData.maxhealth / 3);
    levelData.explosivedamage = getdvarfloat(@"hash_e897c5f4d99c77e2", levelData.maxhealth);
    levelData.var_89bb3f5b08e3a5f2 = getdvarfloat(@"hash_f2559412d6f6e7d3", levelData.maxhealth / 5);
    levelData.var_f2f46c25f5851025 = getdvarfloat(@"hash_a418d23e834a23e7", levelData.maxhealth / 12);
    levelData.var_29fdcb922844f7f = getdvarfloat(@"hash_cce29f6632d1c759", 4);
    levelData.debugmode = getdvarint(@"hash_4e9d8c4ac5384a14", 1) == 1;
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x506
// Size: 0x2b
function function_7b14c1e8b791b520() {
    if (getdvarint(@"hash_198b319677696c92", 0) != 1) {
        return;
    }
    while (1) {
        wait(1);
        function_f2f0951e4a6e218c();
    }
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x538
// Size: 0x11d
function function_2e07802ab9938047() {
    if (!function_5d6c66032973087()) {
        /#
            if (function_23c3d8f2ae91b6c3().debugmode) {
                iprintlnbold("<unknown string>");
            }
        #/
        return 0;
    }
    var_216e4731b97b549b = function_4413c6dd67af86bc();
    if (!isdefined(var_216e4731b97b549b)) {
        /#
            if (function_23c3d8f2ae91b6c3().debugmode) {
                iprintlnbold("<unknown string>");
            }
        #/
        return 0;
    }
    var_3be4437913032095 = function_b0a452739651f90(var_216e4731b97b549b.var_5ddc24d915057e59, 1);
    if (!var_3be4437913032095) {
        return 0;
    }
    if (isdefined(var_216e4731b97b549b.var_1d80a45b74f9cf99)) {
        var_91073ab900319264 = var_216e4731b97b549b.var_e4197a93dc763167 == "double";
        var_ef956e1beea273d5 = function_b0a452739651f90(var_216e4731b97b549b.var_1d80a45b74f9cf99, var_91073ab900319264);
        if (!var_ef956e1beea273d5 && var_91073ab900319264) {
            return 0;
        }
        function_e2fe2dcb469b8151(var_216e4731b97b549b.var_5ddc24d915057e59, ter_op(var_ef956e1beea273d5, var_216e4731b97b549b.var_1d80a45b74f9cf99, undefined));
    } else {
        function_e2fe2dcb469b8151(var_216e4731b97b549b.var_5ddc24d915057e59, undefined);
    }
    return 1;
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65d
// Size: 0xe6
function function_b0a452739651f90(door, var_cb5da767b979cc7d) {
    if (!door scriptabledoorisclosed()) {
        /#
            if (function_23c3d8f2ae91b6c3().debugmode && var_cb5da767b979cc7d) {
                iprintlnbold("<unknown string>");
            }
        #/
        return 0;
    }
    if (!door function_76345fed7f6c60cb()) {
        if (door function_839932ee77f36e1c()) {
            /#
                if (function_23c3d8f2ae91b6c3().debugmode && var_cb5da767b979cc7d) {
                    iprintlnbold("<unknown string>");
                }
            #/
            return 0;
        }
    } else if (function_20c4d2ad6cf2bed3(door, self, 1)) {
        /#
            if (function_23c3d8f2ae91b6c3().debugmode && var_cb5da767b979cc7d) {
                iprintlnbold("<unknown string>");
            }
        #/
        return 0;
    } else {
        /#
            if (function_23c3d8f2ae91b6c3().debugmode && var_cb5da767b979cc7d) {
                iprintlnbold("<unknown string>");
            }
        #/
        return 0;
    }
    return 1;
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74b
// Size: 0x6d
function function_e2fe2dcb469b8151(var_67c2ef0a05674606, var_a68916f113c5beda) {
    barricade = function_c104f29141976961(var_67c2ef0a05674606, var_a68916f113c5beda);
    var_67c2ef0a05674606 function_a348fed54b7ad2d1(barricade);
    var_67c2ef0a05674606 function_8d35d9ef24e364e3(1);
    if (isdefined(var_a68916f113c5beda)) {
        var_a68916f113c5beda function_a348fed54b7ad2d1(barricade);
        var_a68916f113c5beda function_8d35d9ef24e364e3(1);
    }
    barricade thread function_47de387357a169a0();
    barricade thread function_9d44d1095c5076fc();
    barricade thread function_49c6f1e402dea720();
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bf
// Size: 0x230
function function_c104f29141976961(door, var_1d80a45b74f9cf99) {
    position = undefined;
    if (!isdefined(var_1d80a45b74f9cf99)) {
        position = door function_92093a4b887c3bdc();
    } else {
        position = door function_4903b126f5910cc7();
    }
    var_cf6237ce3f49c883 = spawnstruct();
    var_cf6237ce3f49c883.origin = position;
    var_cf6237ce3f49c883.door = door;
    var_cf6237ce3f49c883.owner = self;
    var_cf6237ce3f49c883 function_7f20536248ae1a5c();
    barricade = spawnstruct();
    barricade.origin = position;
    barricade.owner = self;
    barricade.superid = level.superglobals.staticsuperdata["super_door_barricade"].id;
    barricade.door = door;
    barricade.var_1d80a45b74f9cf99 = var_1d80a45b74f9cf99;
    barricade.maxhealth = function_23c3d8f2ae91b6c3().maxhealth;
    barricade.damagetaken = 0;
    barricade.var_ca026d0b161c5997 = 0;
    barricade.var_63193e0c7cee097e = spawnscriptable("equip_door_barricade_mp", var_cf6237ce3f49c883.var_80bf3818b8f0ef9e.origin, var_cf6237ce3f49c883.var_80bf3818b8f0ef9e.angles);
    barricade.var_da4f3d3b3eeac5be = spawnscriptable("equip_door_barricade_mp", var_cf6237ce3f49c883.var_e72df9befcd314de.origin, var_cf6237ce3f49c883.var_e72df9befcd314de.angles);
    barricade.var_63193e0c7cee097e.var_ca9b433c67c54628 = barricade;
    barricade.var_da4f3d3b3eeac5be.var_ca9b433c67c54628 = barricade;
    /#
        if (function_23c3d8f2ae91b6c3().debugmode) {
            barricade thread function_f01315df3715c3b1();
            thread namespace_f2ffc0540883e1ad::drawsphere(position, 1, 2.5, (0.22, 1, 0.07));
            thread namespace_f2ffc0540883e1ad::drawsphere(door function_4903b126f5910cc7(), 1, 2.5, (0.22, 1, 0.07));
        }
    #/
    return barricade;
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f7
// Size: 0xa6
function function_a6ad5685b28ec03a(var_6c2e7e8ffb9dc2b4, var_56bbde692db1e972) {
    if (self.var_ca026d0b161c5997) {
        return;
    }
    self.var_ca026d0b161c5997 = 1;
    dmg = min(self.damagetaken, self.maxhealth);
    namespace_bd0162aedd8c8594::logevent_fieldupgradeexpired(self.owner, self.superid, int(dmg), istrue(var_56bbde692db1e972));
    function_4c71e3b9e9268274(self.door);
    if (isdefined(self.var_1d80a45b74f9cf99)) {
        function_4c71e3b9e9268274(self.var_1d80a45b74f9cf99);
    }
    thread function_1591fdb99f47eb45(var_6c2e7e8ffb9dc2b4, var_56bbde692db1e972);
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa4
// Size: 0x1d
function function_4c71e3b9e9268274(var_67c2ef0a05674606) {
    var_67c2ef0a05674606 function_8d35d9ef24e364e3(0);
    var_67c2ef0a05674606 function_81f42d756861b14a();
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac8
// Size: 0xb8
function function_1591fdb99f47eb45(var_cbf7be4f62a0ddb2, var_56bbde692db1e972) {
    self notify("death");
    if (istrue(var_56bbde692db1e972)) {
        self.var_63193e0c7cee097e setscriptablepartstate("main_death_loop", "destroyed");
        self.var_da4f3d3b3eeac5be setscriptablepartstate("main_death_loop", "destroyed");
    } else {
        self.var_63193e0c7cee097e setscriptablepartstate("main_death_loop", "removed");
        self.var_da4f3d3b3eeac5be setscriptablepartstate("main_death_loop", "removed");
    }
    if (isdefined(var_cbf7be4f62a0ddb2) && var_cbf7be4f62a0ddb2 > 0) {
        wait(var_cbf7be4f62a0ddb2);
    } else {
        waitframe();
    }
    self.var_63193e0c7cee097e freescriptable();
    self.var_da4f3d3b3eeac5be freescriptable();
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb87
// Size: 0x48
function function_47de387357a169a0() {
    self endon("death");
    settings = function_23c3d8f2ae91b6c3();
    if (settings.var_71dbb8c4005d612b) {
        wait(settings.lifetime);
        function_a6ad5685b28ec03a(settings.var_8a25a7879becda51, 0);
    }
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd6
// Size: 0x1b
function function_9d44d1095c5076fc() {
    self endon("death");
    level waittill("game_ended");
    function_a6ad5685b28ec03a(undefined, 0);
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf8
// Size: 0x3
function function_49c6f1e402dea720() {
    
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params b, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc02
// Size: 0x134
function function_fa856206e66d1aca(einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname) {
    if (!isdefined(instance) || !isdefined(instance.type) || !isdefined(instance.var_ca9b433c67c54628) || instance.var_ca9b433c67c54628.var_ca026d0b161c5997) {
        return;
    }
    damage = instance function_5b121785e9363ea4(einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname);
    if (isdefined(eattacker) && isplayer(eattacker)) {
        eattacker namespace_e072c8407b2a861c::updatedamagefeedback("hitequip");
    }
    barricade = instance.var_ca9b433c67c54628;
    barricade.damagetaken = barricade.damagetaken + damage;
    if (barricade.damagetaken >= barricade.maxhealth) {
        barricade function_7081462a3365812b(eattacker);
    }
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params b, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd3d
// Size: 0x1a7
function function_5b121785e9363ea4(einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname) {
    settings = function_23c3d8f2ae91b6c3();
    if (objweapon.basename == "thermite_av_mp") {
        return settings.var_89bb3f5b08e3a5f2;
    }
    if (namespace_3e725f3cc58bddd3::issmallsplashdamage(objweapon)) {
        return 0;
    }
    if (isthrowingknife(objweapon.basename) || function_160a992c78bdf589(objweapon.basename)) {
        return 0;
    }
    if (objweapon.basename == "iw9_dm_crossbow_mp" && smeansofdeath != "MOD_MELEE") {
        return 0;
    }
    if (smeansofdeath == "MOD_MELEE" || smeansofdeath == "MOD_IMPACT") {
        if (smeansofdeath == "MOD_IMPACT" && objweapon.classname == "grenade") {
            return idamage;
        }
        return settings.meleedamage;
    }
    if (smeansofdeath == "MOD_CRUSH" && isdefined(einflictor) && einflictor.classname == "script_vehicle") {
        if (isdefined(eattacker) && !namespace_3bbb5a98b932c46f::friendlyfirecheck(instance.owner, eattacker)) {
            return idamage;
        }
    }
    if (isexplosivedamagemod(smeansofdeath)) {
        return settings.explosivedamage;
    }
    idamage = namespace_3e725f3cc58bddd3::handleapdamage(objweapon, smeansofdeath, idamage, eattacker);
    idamage = namespace_3e725f3cc58bddd3::handleshotgundamage(objweapon, smeansofdeath, idamage);
    return idamage;
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeec
// Size: 0x53
function function_7081462a3365812b(attacker) {
    if (istrue(namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker))) {
        attacker notify("destroyed_equipment");
        attacker thread namespace_48a08c5037514e04::doScoreEvent(#"destroyed_equipment");
    }
    function_a6ad5685b28ec03a(function_23c3d8f2ae91b6c3().var_8a25a7879becda51, 1);
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf46
// Size: 0x21
function function_8d35d9ef24e364e3(lockdoor) {
    if (lockdoor) {
        self function_9af4c9b2cc1bf989();
    } else {
        self function_80902296b05be00a();
    }
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6e
// Size: 0x49
function function_76345fed7f6c60cb() {
    if (!self function_73cc0f04c4c5001d()) {
        /#
            assertmsg("Calling door_barricade_doorIsBarricaded on something that's not a scriptable");
        #/
        return 0;
    }
    if (!self scriptableisdoor()) {
        /#
            assertmsg("Calling door_barricade_doorIsBarricaded on something that's not a door");
        #/
        return 0;
    }
    return isdefined(level.var_b73eb86d1d5a19e9[self.index]);
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfbf
// Size: 0x16
function function_988c3e09726886fd() {
    return level.var_b73eb86d1d5a19e9[self.index];
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfdd
// Size: 0x21
function function_a348fed54b7ad2d1(barricade) {
    level.var_b73eb86d1d5a19e9[self.index] = barricade;
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1005
// Size: 0x16
function function_81f42d756861b14a() {
    level.var_b73eb86d1d5a19e9[self.index] = undefined;
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1022
// Size: 0x9
function function_839932ee77f36e1c() {
    return self function_fac544c98a3d9eb4();
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1033
// Size: 0x49
function function_7e1a3b2e2d74be03(var_67c2ef0a05674606, player) {
    if (!var_67c2ef0a05674606 function_76345fed7f6c60cb()) {
        return;
    }
    barricade = var_67c2ef0a05674606 function_988c3e09726886fd();
    barricade function_a6ad5685b28ec03a(function_23c3d8f2ae91b6c3().var_8a25a7879becda51);
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1083
// Size: 0x4c
function function_20c4d2ad6cf2bed3(var_67c2ef0a05674606, player, var_85e3240d30e184e7) {
    if (!var_67c2ef0a05674606 function_76345fed7f6c60cb()) {
        return 0;
    }
    barricade = var_67c2ef0a05674606 function_988c3e09726886fd();
    return function_bbf23fbf1b086454(player, barricade.owner);
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10d7
// Size: 0x320
function function_4413c6dd67af86bc() {
    settings = function_23c3d8f2ae91b6c3();
    player_forward = anglestoforward(self getplayerangles());
    var_5fc01eeb8003136a = namespace_2a184fc4902783dc::ray_trace(self geteye(), self geteye() + player_forward * 120, undefined, undefined, undefined, undefined, 1);
    /#
        if (function_23c3d8f2ae91b6c3().debugmode) {
            thread namespace_f2ffc0540883e1ad::drawline(self geteye(), self geteye() + player_forward * 120, 2.5, (0.22, 1, 0.07));
        }
    #/
    if (!isdefined(var_5fc01eeb8003136a["position"]) || !isdefined(var_5fc01eeb8003136a["fraction"]) || var_5fc01eeb8003136a["fraction"] >= 1) {
        return;
    }
    var_f89541bfc95a3f55 = var_5fc01eeb8003136a["scriptable"];
    if (!isdefined(var_f89541bfc95a3f55) || !var_f89541bfc95a3f55 scriptableisdoor()) {
        return;
    }
    centerpos = var_f89541bfc95a3f55 function_92093a4b887c3bdc();
    var_91073ab900319264 = var_f89541bfc95a3f55 scriptabledoorisdouble();
    /#
        if (function_23c3d8f2ae91b6c3().debugmode) {
            thread namespace_f2ffc0540883e1ad::drawsphere(centerpos, 62.4, 2.5, ter_op(!var_91073ab900319264, (1, 0.22, 0.07), (0.22, 1, 0.07)));
        }
    #/
    result = spawnstruct();
    if (!var_91073ab900319264 && !settings.var_4acc66ea74cdc413) {
        result.var_e4197a93dc763167 = "single";
        result.var_5ddc24d915057e59 = var_f89541bfc95a3f55;
        return result;
    }
    var_68704f3ab9e70c8d = ter_op(settings.var_4acc66ea74cdc413, 104, 62.4);
    var_f89d5f2b4bb6ed36 = scriptable_door_get_in_radius(centerpos, var_68704f3ab9e70c8d, 20);
    foreach (door in var_f89d5f2b4bb6ed36) {
        if (door scriptable_door_is_double_door_pair(var_f89541bfc95a3f55)) {
            result.var_e4197a93dc763167 = "double";
            result.var_5ddc24d915057e59 = var_f89541bfc95a3f55;
            result.var_1d80a45b74f9cf99 = door;
            return result;
        }
    }
    /#
        if (function_23c3d8f2ae91b6c3().debugmode) {
            thread namespace_f2ffc0540883e1ad::drawsphere(centerpos, 104, 2.5, (0, 1, 1));
        }
    #/
    foreach (door in var_f89d5f2b4bb6ed36) {
        if (door function_8a84bf34f556872d(var_f89541bfc95a3f55)) {
            result.var_e4197a93dc763167 = "faux";
            result.var_5ddc24d915057e59 = var_f89541bfc95a3f55;
            result.var_1d80a45b74f9cf99 = door;
            return result;
        }
    }
    result.var_e4197a93dc763167 = "single";
    result.var_5ddc24d915057e59 = var_f89541bfc95a3f55;
    return result;
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ff
// Size: 0x42
function function_d42196552ddc1a12(var_67c2ef0a05674606, player) {
    if (!var_67c2ef0a05674606 function_76345fed7f6c60cb()) {
        return "";
    } else if (function_20c4d2ad6cf2bed3(var_67c2ef0a05674606, player, 0)) {
        return "EQUIPMENT_HINTS/DOOR_BARRICADE_CAN_REMOVE";
    } else {
        return "EQUIPMENT_HINTS/DOOR_BARRICADE_CANNOT_REMOVE";
    }
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1448
// Size: 0x6f
function function_bbf23fbf1b086454(firstplayer, var_204da528aa0a3464) {
    if (!isdefined(firstplayer) || !isdefined(var_204da528aa0a3464)) {
        return 0;
    }
    if (!isdefined(firstplayer.team) || !isdefined(var_204da528aa0a3464.team)) {
        return 0;
    }
    if (level.teambased) {
        return (firstplayer.team == var_204da528aa0a3464.team);
    } else {
        return (firstplayer == var_204da528aa0a3464);
    }
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14be
// Size: 0x5a
function function_5d6c66032973087() {
    if (self isswimming()) {
        return 0;
    }
    if (istrue(self.isjuggernaut)) {
        return 0;
    }
    if (self isinfreefall()) {
        return 0;
    }
    if (self isjumping()) {
        return 0;
    }
    if (self function_415fe9eeca7b2e2b()) {
        return 0;
    }
    if (self isthrowinggrenade()) {
        return 0;
    }
    if (isdefined(self.vehicle)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1520
// Size: 0x1e
function function_92093a4b887c3bdc() {
    return self function_d90515f5e17dbc6f() + anglestoup(self.angles) * 48;
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1546
// Size: 0x35
function function_4903b126f5910cc7() {
    centerpos = function_92093a4b887c3bdc();
    difference = centerpos - self.origin;
    return centerpos + (difference[0], difference[1], 0);
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1583
// Size: 0x253
function function_7f20536248ae1a5c() {
    self.angles = self.door.angles + (0, 90, 0);
    var_b6ece0fe9a2d379 = anglestoforward(self.angles);
    var_ea409933c7278118 = self.owner.origin - self.origin;
    var_ea409933c7278118 = (var_ea409933c7278118[0], var_ea409933c7278118[1], var_b6ece0fe9a2d379[2]);
    var_b6ece0fe9a2d379 = vectornormalize(var_b6ece0fe9a2d379);
    var_ea409933c7278118 = vectornormalize(var_ea409933c7278118);
    /#
        if (function_23c3d8f2ae91b6c3().debugmode) {
            thread namespace_f2ffc0540883e1ad::drawline(self.origin, self.origin + var_b6ece0fe9a2d379 * 4, 2.5, (0, 1, 1));
            thread namespace_f2ffc0540883e1ad::drawline(self.origin, self.origin + var_ea409933c7278118 * 4, 2.5, (0, 1, 1));
        }
    #/
    cosangle = vectordot(var_ea409933c7278118, var_b6ece0fe9a2d379);
    if (cosangle < 0) {
        self.angles = self.angles + (0, 180, 0);
    }
    self.origin = self.origin + anglestoforward(self.angles) * function_23c3d8f2ae91b6c3().var_29fdcb922844f7f;
    self.var_80bf3818b8f0ef9e = spawnstruct();
    self.var_80bf3818b8f0ef9e.origin = self.origin;
    self.var_80bf3818b8f0ef9e.angles = self.angles;
    self.angles = self.angles + (0, 180, 0);
    self.origin = self.origin + anglestoforward(self.angles) * function_23c3d8f2ae91b6c3().var_29fdcb922844f7f * 2;
    self.var_e72df9befcd314de = spawnstruct();
    self.var_e72df9befcd314de.origin = self.origin;
    self.var_e72df9befcd314de.angles = self.angles;
}

// Namespace namespace_46a2e07dc61d9261/namespace_35cf33c9c2941133
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17dd
// Size: 0x67
function function_f01315df3715c3b1() {
    /#
        self endon("<unknown string>");
        while (1) {
            waitframe();
            if (isdefined(self.damagetaken) && isdefined(self.maxhealth)) {
                print3d(self.origin, self.damagetaken + "<unknown string>" + self.maxhealth, undefined, 0.5, 0.4, undefined, 1);
            }
        }
    #/
}

