// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\execution.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player_frame_update_aggregator.gsc;

#namespace namespace_d249b12f7ad44b07;

// Namespace namespace_d249b12f7ad44b07/namespace_c1dac7ea1e10ca64
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90
// Size: 0x18
function execution_mp_init() {
    if (!namespace_cd0b2d039510b38d::runleanthreadmode()) {
        namespace_be1f190b46fee430::registerplayerframeupdatecallback(&execution_blockladders);
    }
}

