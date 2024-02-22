// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_16ea1b94f0f381b3;
#using scripts\asm\asm.gsc;
#using script_429c2a03090c1ea1;

#namespace namespace_463c541c6afd19ee;

// Namespace namespace_463c541c6afd19ee/namespace_61562d3eb0e80552
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x107
// Size: 0x66
function function_bcfbb1093d28dce6(taskid, params) {
    if (self function_1fde453596ea559c() < 2000) {
        return anim.failure;
    }
    self.var_38d388b86915db8a = function_fdc9d5557c53078e(self.var_38d388b86915db8a);
    if (self.var_38d388b86915db8a.size < 5) {
        return anim.success;
    }
    return anim.failure;
}

// Namespace namespace_463c541c6afd19ee/namespace_61562d3eb0e80552
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x175
// Size: 0x15
function function_5ccebaad82aa8913() {
    self.var_38d388b86915db8a = [];
    thread function_f944303a35b8b27b();
}

// Namespace namespace_463c541c6afd19ee/namespace_61562d3eb0e80552
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x191
// Size: 0x3f
function private function_f944303a35b8b27b() {
    self endon("death");
    while (1) {
        self waittill("start_crawler_deploy");
        if (isdefined(self.enemy)) {
            self getenemyinfo(self.enemy);
        }
        thread function_7674186f5ca25b0c();
    }
}

// Namespace namespace_463c541c6afd19ee/namespace_61562d3eb0e80552
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d7
// Size: 0x39
function private function_7674186f5ca25b0c() {
    self endon("death");
    self endon("start_crawler_deploy");
    while (1) {
        self waittill("spawn_crawler");
        if (self.var_38d388b86915db8a.size < 5) {
            function_7b781321e1c42add();
        }
        waitframe();
    }
}

// Namespace namespace_463c541c6afd19ee/namespace_61562d3eb0e80552
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x217
// Size: 0x17e
function private function_7b781321e1c42add() {
    aitypes = get_aitype_by_subclass_sharedfunc(self.var_47399212b3052720.var_e58a65b7a8f5973c.var_a50ee2b67d1afeb9);
    /#
        /#
            assert(isdefined(aitypes) && aitypes.size > 0);
        #/
    #/
    var_9f578d49d039394b = undefined;
    foreach (aitype in aitypes) {
        var_90906ae7ffd6dee3 = aitype.size;
        if (!isdefined(var_9f578d49d039394b) || var_9f578d49d039394b.size > var_90906ae7ffd6dee3) {
            var_9f578d49d039394b = aitype;
        }
    }
    var_ea3e656b50d22272 = var_9f578d49d039394b;
    crawler = spawnnewaitype_sharedfunc(var_ea3e656b50d22272, self.origin, self.angles, self.team);
    if (isdefined(crawler)) {
        crawler thread animscripted_sharedfunc("spawn_abom_crawler", "spawn_end", undefined, undefined, "spawn_animating");
        crawler.var_c383683308e840a7 = self;
        self.var_38d388b86915db8a = array_add(self.var_38d388b86915db8a, crawler);
        if (flag("level_stealth_initialized") && isdefined(self.enemy)) {
            crawler aieventlistenerevent("attack", self.enemy, self.enemy.origin);
        }
    }
}

