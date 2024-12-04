#using script_6a977a0edf312405;
#using scripts\common\utility;
#using scripts\engine\utility;
#using scripts\mp\gametypes\br_public;
#using scripts\mp\utility\points;

#namespace namespace_ed1cfb3c9d4fe39f;

// Namespace namespace_ed1cfb3c9d4fe39f / namespace_e9cc5762e80bb016
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe1
// Size: 0x35
function init() {
    scripts\engine\utility::registersharedfunc("fogofwar", "isPlayerInGulag", &scripts\mp\gametypes\br_public::isplayeringulag);
    scripts\engine\utility::registersharedfunc("fogofwar", "giveXPWithText", &scripts\mp\utility\points::givexpwithtext);
    namespace_896381a08e76178f::init();
}

