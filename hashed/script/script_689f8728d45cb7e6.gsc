// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using script_54f6d121e91434f8;
#using script_64351208cb856df9;
#using script_41387eecc35b88bf;
#using script_220d0eb95a8fab7d;
#using script_2707474774db34b;
#using script_185660037b9236c1;
#using script_42f1b4ddcbbf98b4;
#using script_7956d56c4922bd1;
#using script_7e41e37180e554f;
#using script_6617e2f2bb62b52b;
#using scripts\mp\utility\teams.gsc;
#using script_638d701d263ee1ed;

#namespace namespace_22ae363c8e287c38;

// Namespace namespace_22ae363c8e287c38/namespace_797ee4f931e4dbb8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x215
// Size: 0x1ab
function function_c56624984c6cfe44(var_c1a3a9cf7d2963b8) {
    /#
        assertex(isarray(var_c1a3a9cf7d2963b8) && var_c1a3a9cf7d2963b8.size == 1 && isplayer(var_c1a3a9cf7d2963b8[0]), "The Relevant Parameters array passed into the 'OnPlayerJoinNewSquad' Nexus Override was improperly formatted. It must be an array of size 1 with a player entity.");
    #/
    var_bd11f2561cb089ec = var_c1a3a9cf7d2963b8[0];
    squad = namespace_54d20dd0dd79277f::getSquadmates(var_bd11f2561cb089ec.team, var_bd11f2561cb089ec.var_ff97225579de16a, 0);
    var_861695cd06824d43 = function_553a690e1064cf0b(var_bd11f2561cb089ec);
    foreach (var_d13c18af4084bdfd in var_861695cd06824d43) {
        var_e6013eac45290cab = function_1f3e343912ae15c5(var_d13c18af4084bdfd.var_fb5fdfafc29f4513);
        if (function_511be8bcaede8b52(var_e6013eac45290cab) == "Contract") {
            function_ad54e18b503363a0(var_e6013eac45290cab, [0:var_bd11f2561cb089ec]);
        }
    }
    if (squad.size >= 2) {
        var_1acd4938f955faa5 = squad[0];
        if (var_1acd4938f955faa5 == var_bd11f2561cb089ec) {
            var_1acd4938f955faa5 = squad[1];
        }
        var_aca1cc230b21bf68 = function_553a690e1064cf0b(var_1acd4938f955faa5);
        foreach (var_d13c18af4084bdfd in var_aca1cc230b21bf68) {
            var_e6013eac45290cab = function_1f3e343912ae15c5(var_d13c18af4084bdfd.var_fb5fdfafc29f4513);
            if (function_9edc3a4b955d5a6c(var_e6013eac45290cab)) {
                if (!function_4ab1cdfd84bbd3f2(var_e6013eac45290cab, var_bd11f2561cb089ec)) {
                    function_bbdcd857d0c2a65e(var_e6013eac45290cab, var_bd11f2561cb089ec, "PlayerJoinedSquad");
                }
            }
        }
    }
}

// Namespace namespace_22ae363c8e287c38/namespace_797ee4f931e4dbb8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3c7
// Size: 0x80
function function_a0e2a0be2e23fef(var_e6013eac45290cab, params) {
    /#
        assertex(params.size == 1 && isdefined(params[0]), "The first parameter should be the player");
    #/
    player = params[0];
    var_201ddb9ccc3b7290 = namespace_4df2ab39b0e96ec7::function_688103a7b4041bf8(player.origin);
    var_43697de9671bb892 = namespace_68dc261109a9503f::function_8988a4c89289d7f4(var_e6013eac45290cab);
    var_39e0567fdb0638b4 = namespace_4df2ab39b0e96ec7::function_688103a7b4041bf8(var_43697de9671bb892);
    return var_201ddb9ccc3b7290 == var_39e0567fdb0638b4;
}

// Namespace namespace_22ae363c8e287c38/namespace_797ee4f931e4dbb8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44f
// Size: 0x2d
function function_17b1321ab95e72c1(player, params) {
    var_1682143280c131b1 = function_bfda021631854371(player, "REV_OB_EXFIL");
    return !var_1682143280c131b1;
}

// Namespace namespace_22ae363c8e287c38/namespace_797ee4f931e4dbb8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x484
// Size: 0x89
function function_30006181a99fb008(player, params) {
    /#
        assertex(isarray(params) && params.size == 2, "The conditional function expects two parameters to be passed in.");
    #/
    var_94bda1b3c0ae9bab = params[0];
    var_e6013eac45290cab = params[1];
    var_97889d347cc37c58 = var_94bda1b3c0ae9bab function_54ad2295d6995862();
    if (var_97889d347cc37c58 == "Overlord") {
        if (isdefined(level.var_7f1d1c7c6153a9bf)) {
            if ([[ level.var_7f1d1c7c6153a9bf ]]()) {
                return 0;
            }
        }
    }
    return 1;
}

