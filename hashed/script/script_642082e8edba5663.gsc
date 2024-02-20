// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\bots\bots.gsc;
#using scripts\mp\bots\bots_personality.gsc;

#namespace namespace_f162a4362b2b7718;

// Namespace namespace_f162a4362b2b7718/namespace_fed7ec0976bb84c5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e
// Size: 0x120
function initialize(var_fa2678ae217f88a4, var_2b06ab98d2dce887, var_9f5fb5ed74cbf3c9) {
    /#
        assert(!isdefined(level.var_f162a4362b2b7718));
    #/
    level.var_f162a4362b2b7718 = spawnstruct();
    level.var_f162a4362b2b7718.var_c214b782db6525f = &function_958101c7be2fa2ec;
    level.var_f162a4362b2b7718.var_205cb63b80da5b = &function_62646271af2f0aa;
    level.var_f162a4362b2b7718.var_f189ca4555aa689e = namespace_3c37cb17ade254d::function_53c4c53197386572(var_fa2678ae217f88a4, &function_9d0acfda366a7092);
    level.var_f162a4362b2b7718.var_a0e6fcdab1a67082 = namespace_3c37cb17ade254d::function_53c4c53197386572(var_2b06ab98d2dce887, &function_942d53aca85f56d9);
    if (isdefined(var_9f5fb5ed74cbf3c9)) {
        if (isarray(var_9f5fb5ed74cbf3c9)) {
            /#
                assert(var_9f5fb5ed74cbf3c9.size != 0);
            #/
            level.var_f162a4362b2b7718.var_25e0716dfe6bb4bf = var_9f5fb5ed74cbf3c9;
            level.var_f162a4362b2b7718.var_4fa0fd09a5fffe94 = &function_3133ea6a48ba727f;
        } else {
            /#
                assert(isfunction(var_9f5fb5ed74cbf3c9));
            #/
            level.var_f162a4362b2b7718.var_4fa0fd09a5fffe94 = var_9f5fb5ed74cbf3c9;
        }
    }
}

// Namespace namespace_f162a4362b2b7718/namespace_fed7ec0976bb84c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x235
// Size: 0x7b
function private function_958101c7be2fa2ec() {
    self notify("enter_autopilot");
    self function_d6570ce791fa1b08(1);
    self.entity_number = self getentitynumber();
    /#
        assert(isdefined(level.var_f162a4362b2b7718));
    #/
    if (isdefined(level.var_f162a4362b2b7718.var_a0e6fcdab1a67082)) {
        self [[ level.var_f162a4362b2b7718.var_a0e6fcdab1a67082 ]]();
    }
    namespace_e4a5fcd525f0b19b::bot_restart_think_threads();
    thread function_d70ef2f96965c20b();
    thread function_f45a17caa99fc47a();
}

// Namespace namespace_f162a4362b2b7718/namespace_fed7ec0976bb84c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b7
// Size: 0x20
function private function_d70ef2f96965c20b() {
    self endon("exit_autopilot");
    self endon("death_or_disconnect");
    level waittill("game_ended");
    self function_70c55d1c5a628350();
}

// Namespace namespace_f162a4362b2b7718/namespace_fed7ec0976bb84c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2de
// Size: 0x2f
function private function_f45a17caa99fc47a() {
    self endon("exit_autopilot");
    self endon("disconnect");
    level endon("game_ended");
    self waittill("death");
    thread function_ccdef5015d4493b6();
    self function_70c55d1c5a628350();
}

// Namespace namespace_f162a4362b2b7718/namespace_fed7ec0976bb84c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x314
// Size: 0x27
function private function_ccdef5015d4493b6() {
    self endon("enter_autopilot");
    self endon("death_or_disconnect");
    level endon("game_ended");
    self waittill("spawned_player");
    self function_54c0f616842eb58e();
}

// Namespace namespace_f162a4362b2b7718/namespace_fed7ec0976bb84c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x342
// Size: 0x64
function private function_62646271af2f0aa() {
    self notify("exit_autopilot");
    self notify("bot_suspended");
    self notify("bot_think_watch_aerial_killstreak");
    /#
        assert(isdefined(level.var_f162a4362b2b7718));
    #/
    if (isdefined(level.var_f162a4362b2b7718.var_4fa0fd09a5fffe94)) {
        self [[ level.var_f162a4362b2b7718.var_4fa0fd09a5fffe94 ]]();
    }
    self function_d6570ce791fa1b08(0);
}

// Namespace namespace_f162a4362b2b7718/namespace_fed7ec0976bb84c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3ad
// Size: 0x5
function private function_9d0acfda366a7092() {
    return 1;
}

// Namespace namespace_f162a4362b2b7718/namespace_fed7ec0976bb84c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3ba
// Size: 0xa
function private function_942d53aca85f56d9() {
    namespace_a89b0064fb8d2078::bot_assign_personality_functions();
}

// Namespace namespace_f162a4362b2b7718/namespace_fed7ec0976bb84c5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3cb
// Size: 0x7b
function private function_3133ea6a48ba727f() {
    /#
        assert(isdefined(level.var_f162a4362b2b7718.var_25e0716dfe6bb4bf));
    #/
    foreach (var_4d9878cf926d2d2d in level.var_f162a4362b2b7718.var_25e0716dfe6bb4bf) {
        self notify(var_4d9878cf926d2d2d);
    }
}

