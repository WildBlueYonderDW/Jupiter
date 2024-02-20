// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\anim\notetracks_mp.gsc;
#using scripts\asm\asm.gsc;

#namespace namespace_2d9c1bd5bad79cb6;

// Namespace namespace_2d9c1bd5bad79cb6/namespace_4580e60e1b7b40e2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x136
// Size: 0x76
function codecallback_agentadded() {
    self [[ level.initagentscriptvariables ]]();
    agentteam = "axis";
    if (level.numagents % 2 == 0) {
        agentteam = "allies";
    }
    level.numagents++;
    self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    self [[ level.setagentteam ]](agentteam);
    level.agentarray[level.agentarray.size] = self;
}

// Namespace namespace_2d9c1bd5bad79cb6/namespace_4580e60e1b7b40e2
// Params 12, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b3
// Size: 0xd9
function codecallback_agentdamaged(einflictor, eattacker, idamage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname) {
    sweapon = objweapon;
    if (isdefined(level.weaponmapfunc)) {
        objweapon = [[ level.weaponmapfunc ]](objweapon, einflictor);
    }
    eattacker = [[ level.agentvalidateattacker ]](eattacker);
    var_b652bf49fd2f53cd = self [[ level.agentfunc ]]("on_damaged");
    if (isdefined(var_b652bf49fd2f53cd)) {
        self [[ var_b652bf49fd2f53cd ]](einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
    }
}

// Namespace namespace_2d9c1bd5bad79cb6/namespace_4580e60e1b7b40e2
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x293
// Size: 0x67
function codecallback_agentimpaled(eattacker, objweapon, var_f98a651c69c13cba, vpoint, vdir, shitloc, var_920ff4456ce9a2fc, var_19f6f25777706f34) {
    if (isdefined(level.callbackplayerimpaled)) {
        [[ level.callbackplayerimpaled ]](eattacker, objweapon, var_f98a651c69c13cba, vpoint, vdir, shitloc, var_920ff4456ce9a2fc, var_19f6f25777706f34);
    }
}

// Namespace namespace_2d9c1bd5bad79cb6/namespace_4580e60e1b7b40e2
// Params a, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x301
// Size: 0xb4
function codecallback_agentkilled(einflictor, eattacker, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration) {
    if (isdefined(level.weaponmapfunc)) {
        objweapon = [[ level.weaponmapfunc ]](objweapon, einflictor);
    }
    eattacker = [[ level.agentvalidateattacker ]](eattacker);
    var_b652bf49fd2f53cd = self [[ level.agentfunc ]]("on_killed");
    if (isdefined(var_b652bf49fd2f53cd)) {
        self thread [[ var_b652bf49fd2f53cd ]](einflictor, eattacker, idamage, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration);
    }
}

// Namespace namespace_2d9c1bd5bad79cb6/namespace_4580e60e1b7b40e2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bc
// Size: 0x14
function codecallback_agentfinishweaponchange(var_492b944276064f63, var_82533969b4683de4) {
    
}

// Namespace namespace_2d9c1bd5bad79cb6/namespace_4580e60e1b7b40e2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d7
// Size: 0x23
function init() {
    initagentlevelvariables();
    namespace_aca06a2f73bc4246::registernotetracks();
    level thread namespace_bf5a1761a8d1bb07::setup_level_ents();
    level thread add_agents_to_game();
}

// Namespace namespace_2d9c1bd5bad79cb6/namespace_4580e60e1b7b40e2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x401
// Size: 0xe0
function connectnewagent(agent_type, team, class) {
    agent = [[ level.getfreeagent ]](agent_type);
    if (isdefined(agent)) {
        agent.connecttime = gettime();
        if (isdefined(team)) {
            agent [[ level.setagentteam ]](team);
        } else {
            agent [[ level.setagentteam ]](agent.team);
        }
        if (isdefined(class)) {
            agent.class_override = class;
        }
        if (isdefined(level.agent_funcs[agent_type]["onAIConnect"])) {
            agent [[ agent [[ level.agentfunc ]]("onAIConnect") ]]();
        }
        agent [[ level.addtocharactersarray ]]();
        /#
            assertex(agent.connecttime == gettime(), "Agent spawn took too long - there should be no waits in connectNewAgent");
        #/
    }
    return agent;
}

// Namespace namespace_2d9c1bd5bad79cb6/namespace_4580e60e1b7b40e2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e9
// Size: 0x2e
function initagentlevelvariables() {
    level.agentarray = [];
    level.numagents = 0;
    if (!isdefined(level.var_e58efb25be1ee016)) {
        level.var_e58efb25be1ee016 = 0;
    }
}

// Namespace namespace_2d9c1bd5bad79cb6/namespace_4580e60e1b7b40e2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51e
// Size: 0xbe
function add_agents_to_game() {
    level endon("game_ended");
    player = level waittill("connected");
    maxagents = getmaxagents();
    /#
        println("<unknown string>" + maxagents + "<unknown string>");
    #/
    var_48a1bbbf94f76091 = getdvarint(@"hash_3c453eaf21ea4a86", -1);
    while (level.agentarray.size < maxagents) {
        if (var_48a1bbbf94f76091 != -1 && level.agentarray.size != 0 && level.agentarray.size % var_48a1bbbf94f76091 == 0) {
            waitframe();
        }
        agent = addagent();
        if (!isdefined(agent)) {
            waitframe();
            continue;
        }
    }
    level.var_61198536443ad7ec = 1;
}

// Namespace namespace_2d9c1bd5bad79cb6/namespace_4580e60e1b7b40e2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e3
// Size: 0x20
function set_agent_health(health) {
    self.health = health;
    self.maxhealth = health;
}

// Namespace namespace_2d9c1bd5bad79cb6/namespace_4580e60e1b7b40e2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60a
// Size: 0x13
function ondeactivate() {
    self notify("killanimscript");
    self notify("terminate_ai_threads");
}

