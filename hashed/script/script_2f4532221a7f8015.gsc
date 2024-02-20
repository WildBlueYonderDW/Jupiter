// mwiii decomp prototype
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_595a577ac71de143;
#using script_2816a042b9f7996;

#namespace namespace_da7f866501613d61;

// Namespace namespace_da7f866501613d61/namespace_ff3e5909f6ed7be1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x161
// Size: 0x13
function main() {
    function_c53188c4ebcc287f();
    level thread namespace_f9b6a4254d2d8100::init_vehicles();
}

// Namespace namespace_da7f866501613d61/namespace_ff3e5909f6ed7be1
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17b
// Size: 0x28
function private function_4578645c05209b4(function) {
    /#
        assert(isfunction(function));
    #/
    if (isfunction(function)) {
        [[ function ]]();
    }
}

// Namespace namespace_da7f866501613d61/namespace_ff3e5909f6ed7be1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aa
// Size: 0x2bb
function function_c53188c4ebcc287f() {
    mapname = getmapname();
    if (!isdefined(mapname)) {
        return;
    }
    switch (mapname) {
    case #"hash_9ae3f9a4f2372775":
        function_4578645c05209b4(level.var_cd52e517ad96566d);
        level thread namespace_c19d6eef1c23c28f::function_29b46d591982c45a();
        break;
    case #"hash_727a83f7155e77af":
        function_4578645c05209b4(level.var_42f9d919e49a0633);
        level thread namespace_c19d6eef1c23c28f::function_29b46d591982c45a();
        break;
    case #"hash_20b3e47add062367":
        function_4578645c05209b4(level.var_b59297aa6933406b);
        level thread namespace_c19d6eef1c23c28f::function_29b46d591982c45a();
        break;
    case #"hash_d7741d09a5c36348":
        function_4578645c05209b4(level.var_cf32182eec3bc910);
        level thread namespace_c19d6eef1c23c28f::function_da135ec070e2e6e8("mp_jup_outbreak", undefined, 1);
        break;
    case #"hash_2a217c09d161ff72":
        function_4578645c05209b4(level.var_87cbaa272123525e);
        level thread namespace_c19d6eef1c23c28f::function_29b46d591982c45a();
        break;
    case #"hash_2a217b09d161fddf":
        function_4578645c05209b4(level.var_ba419fdced2d3dfb);
        level thread namespace_c19d6eef1c23c28f::function_29b46d591982c45a();
        break;
    case #"hash_2a217a09d161fc4c":
        function_4578645c05209b4(level.var_efcc16c5e7fc5a6c);
        level thread namespace_c19d6eef1c23c28f::function_29b46d591982c45a();
        break;
    case #"hash_e7a134448c275447":
        function_4578645c05209b4(level.var_7e1adb313a3b34d3);
        level thread namespace_c19d6eef1c23c28f::function_29b46d591982c45a();
        break;
    case #"hash_2a217909d161fab9":
        function_4578645c05209b4(level.var_9d4c681557f7fe61);
        level thread namespace_c19d6eef1c23c28f::function_29b46d591982c45a();
        break;
    case #"hash_2a217809d161f926":
        function_4578645c05209b4(level.var_d6d4a817542a6b12);
        level thread namespace_c19d6eef1c23c28f::function_29b46d591982c45a();
        break;
    case #"hash_2a217709d161f793":
        function_4578645c05209b4(level.var_c61c1ef4d4aaec8f);
        level thread namespace_c19d6eef1c23c28f::function_29b46d591982c45a();
        break;
    case #"hash_2a217609d161f600":
        function_4578645c05209b4(level.var_6bf302c2c5d67b40);
        level thread namespace_c19d6eef1c23c28f::function_29b46d591982c45a();
        break;
    case #"hash_2a218509d1620d9d":
        function_4578645c05209b4(level.var_de0ea044921d6935);
        level thread namespace_c19d6eef1c23c28f::function_29b46d591982c45a();
        break;
    case #"hash_2a218409d1620c0a":
        function_4578645c05209b4(level.var_8bc670aa106fa796);
        level thread namespace_c19d6eef1c23c28f::function_29b46d591982c45a();
        break;
    case #"hash_224f194c88e9eac":
        function_4578645c05209b4(level.var_870202fb30967234);
        level thread namespace_c19d6eef1c23c28f::function_da135ec070e2e6e8("mp_jup_fort", undefined, 1);
        break;
    case #"hash_330a93d145b37045":
        function_4578645c05209b4(level.var_b803ce6ba2261e5);
        level thread namespace_c19d6eef1c23c28f::function_da135ec070e2e6e8("mp_jup_outbreak", undefined, 1);
        break;
    }
}

