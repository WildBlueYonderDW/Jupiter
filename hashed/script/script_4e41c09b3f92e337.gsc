// mwiii decomp prototype
#using script_3db04fd1b466bdba;
#using scripts\engine\utility.gsc;
#using script_16ea1b94f0f381b3;

#namespace namespace_7ca2edec801acbcc;

// Namespace namespace_7ca2edec801acbcc / namespace_4d5a8c2a78a8732f
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x17c
// Size: 0x19
function autoexec main() {
    function_df7ab5b0f898e8bc(function_1823ff50bb28148d("electric_discharge"), &init);
}

// Namespace namespace_7ca2edec801acbcc / namespace_4d5a8c2a78a8732f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x19c
// Size: 0x4d
function private init() {
    if (issharedfuncdefined("killstreak", "registerKillstreak")) {
        [[ getsharedfunc("killstreak", "registerKillstreak") ]]("electric_discharge", &function_784d2bedc96c026a);
    }
    function_a41e3a211a9e37a4("electric_discharge", "super_laser_charge_mp", #"low");
}

// Namespace namespace_7ca2edec801acbcc / namespace_4d5a8c2a78a8732f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f0
// Size: 0xd4
function private function_784d2bedc96c026a(streakinfo) {
    self endon("disconnect");
    level endon("game_ended");
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    if (issharedfuncdefined("super_electric_discharge", "giveAndFireOffhand")) {
        if (isdefined(level.killstreakbeginusefunc)) {
            if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
                return 0;
            }
        }
        bundle = level.streakglobals.streakbundles["electric_discharge"];
        function_5942f6cdbb6cb63b("specialty_blastshield");
        result = function_f3bb4f4911a1beb2("super_electric_discharge", "giveAndFireOffhand", bundle);
        thread function_b8da39607869896();
        return result;
    }
    /#
        assertmsg("The super version of electric discharge is not initialized.");
    #/
    return 0;
}

// Namespace namespace_7ca2edec801acbcc / namespace_4d5a8c2a78a8732f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2cb
// Size: 0x65
function private function_b8da39607869896() {
    self endon("disconnect");
    level endon("game_ended");
    if (!issharedfuncdefined("super_electric_discharge", "endSuper")) {
        /#
            assertmsg("The super version of electric discharge is not initialized.");
        #/
        return;
    }
    endmsg = waittill_any_timeout_1(10, "finished_electric_blast");
    if (isdefined(self)) {
        function_f3bb4f4911a1beb2("super_electric_discharge", "endSuper", 1, 1);
    }
}

