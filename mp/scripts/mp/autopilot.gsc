#using scripts\engine\utility.gsc;
#using scripts\mp\bots\bots.gsc;
#using scripts\mp\bots\bots_personality.gsc;

#namespace autopilot;

// Namespace autopilot / scripts\mp\autopilot
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x149
// Size: 0x11f
function initialize(var_fa2678ae217f88a4, var_2b06ab98d2dce887, var_9f5fb5ed74cbf3c9) {
    assert(!isdefined(level.autopilot));
    level.autopilot = spawnstruct();
    level.autopilot.var_c214b782db6525f = &function_958101c7be2fa2ec;
    level.autopilot.var_205cb63b80da5b = &function_62646271af2f0aa;
    level.autopilot.var_f189ca4555aa689e = scripts\engine\utility::default_to(var_fa2678ae217f88a4, &function_9d0acfda366a7092);
    level.autopilot.var_a0e6fcdab1a67082 = scripts\engine\utility::default_to(var_2b06ab98d2dce887, &function_942d53aca85f56d9);
    if (isdefined(var_9f5fb5ed74cbf3c9)) {
        if (isarray(var_9f5fb5ed74cbf3c9)) {
            assert(var_9f5fb5ed74cbf3c9.size != 0);
            level.autopilot.var_25e0716dfe6bb4bf = var_9f5fb5ed74cbf3c9;
            level.autopilot.var_4fa0fd09a5fffe94 = &function_3133ea6a48ba727f;
            return;
        }
        assert(isfunction(var_9f5fb5ed74cbf3c9));
        level.autopilot.var_4fa0fd09a5fffe94 = var_9f5fb5ed74cbf3c9;
    }
}

// Namespace autopilot / scripts\mp\autopilot
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x270
// Size: 0x7a
function private function_958101c7be2fa2ec() {
    self notify("enter_autopilot");
    self function_d6570ce791fa1b08(1);
    self.entity_number = self getentitynumber();
    assert(isdefined(level.autopilot));
    if (isdefined(level.autopilot.var_a0e6fcdab1a67082)) {
        self [[ level.autopilot.var_a0e6fcdab1a67082 ]]();
    }
    scripts\mp\bots\bots::bot_restart_think_threads();
    thread function_d70ef2f96965c20b();
    thread watchdeaththread();
}

// Namespace autopilot / scripts\mp\autopilot
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2f2
// Size: 0x1f
function private function_d70ef2f96965c20b() {
    self endon("exit_autopilot");
    self endon("death_or_disconnect");
    level waittill("game_ended");
    self function_70c55d1c5a628350();
}

// Namespace autopilot / scripts\mp\autopilot
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x319
// Size: 0x2e
function private watchdeaththread() {
    self endon("exit_autopilot");
    self endon("disconnect");
    level endon("game_ended");
    self waittill("death");
    thread function_ccdef5015d4493b6();
    self function_70c55d1c5a628350();
}

// Namespace autopilot / scripts\mp\autopilot
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x34f
// Size: 0x26
function private function_ccdef5015d4493b6() {
    self endon("enter_autopilot");
    self endon("death_or_disconnect");
    level endon("game_ended");
    self waittill("spawned_player");
    self function_54c0f616842eb58e();
}

// Namespace autopilot / scripts\mp\autopilot
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x37d
// Size: 0x63
function private function_62646271af2f0aa() {
    self notify("exit_autopilot");
    self notify("bot_suspended");
    self notify("bot_think_watch_aerial_killstreak");
    assert(isdefined(level.autopilot));
    if (isdefined(level.autopilot.var_4fa0fd09a5fffe94)) {
        self [[ level.autopilot.var_4fa0fd09a5fffe94 ]]();
    }
    self function_d6570ce791fa1b08(0);
}

// Namespace autopilot / scripts\mp\autopilot
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3e8
// Size: 0x4
function private function_9d0acfda366a7092() {
    return true;
}

// Namespace autopilot / scripts\mp\autopilot
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3f5
// Size: 0x9
function private function_942d53aca85f56d9() {
    scripts\mp\bots\bots_personality::bot_assign_personality_functions();
}

// Namespace autopilot / scripts\mp\autopilot
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x406
// Size: 0x79
function private function_3133ea6a48ba727f() {
    assert(isdefined(level.autopilot.var_25e0716dfe6bb4bf));
    foreach (signal in level.autopilot.var_25e0716dfe6bb4bf) {
        self notify(signal);
    }
}

