// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\execution.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player_frame_update_aggregator.gsc;

#namespace execution_mp;

// Namespace execution_mp / scripts/mp/execution_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90
// Size: 0x18
function execution_mp_init() {
    if (!scripts/mp/utility/game::runleanthreadmode()) {
        scripts/mp/utility/player_frame_update_aggregator::registerplayerframeupdatecallback(&execution_blockladders);
    }
}

