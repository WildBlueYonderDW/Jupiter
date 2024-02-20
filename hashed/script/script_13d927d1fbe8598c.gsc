// mwiii decomp prototype
#using script_7ff3a914e6c698c5;
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;

#namespace namespace_c456b188bf9f0dc4;

// Namespace namespace_c456b188bf9f0dc4/namespace_ea0f522eef874258
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde
// Size: 0x14
function function_1d4cf90e795ad643() {
    callback::add("zombie_melee", &function_b77a1c7cf3728429);
}

// Namespace namespace_c456b188bf9f0dc4/namespace_ea0f522eef874258
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf9
// Size: 0x1d7
function private function_b77a1c7cf3728429(params) {
    if (isplayer(params.var_5e9b4f251304521d)) {
        player = params.var_5e9b4f251304521d;
        var_4193765ddb4cdce7 = self asmgetcurrentstate(self.asmname) == "tail_whip";
        if (var_4193765ddb4cdce7) {
            player function_2861d9b80e013196(player.origin - self.origin, self.var_47399212b3052720.var_e58a65b7a8f5973c.var_fdef87a2422ca38a);
        } else {
            utility::function_3ab9164ef76940fd("melee", "melee");
            player utility::function_3ab9164ef76940fd("abomBiteVFX", "vfx_start");
            player function_2861d9b80e013196(player.origin - self.origin, self.var_47399212b3052720.var_e58a65b7a8f5973c.var_3d9c1f087e495f34);
            currtime = gettime();
            if (!isdefined(self.var_9575be1f86f1154c) || self.var_9575be1f86f1154c != player || !isdefined(self.var_1ff760e4506c1b1e) || currtime - self.var_1ff760e4506c1b1e > 2000) {
                self.var_9a9c90c313047857 = 0;
            }
            self.var_9a9c90c313047857++;
            self.var_1ff760e4506c1b1e = currtime;
            self.var_9575be1f86f1154c = player;
            if (self.var_9a9c90c313047857 >= 3 || params.var_5e9b4f251304521d.health <= 0 || istrue(params.var_5e9b4f251304521d.inlaststand)) {
                self.var_9a9c90c313047857 = 0;
                self function_3e89eb3d8e3f1811("roar_end_time", 1000);
                self function_3e89eb3d8e3f1811("multi_bite_roar_time", currtime + 3000);
            }
        }
    }
}

