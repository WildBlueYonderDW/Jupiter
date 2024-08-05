#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\cp\utility.gsc;
#using scripts\cp\cp_outline.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\math.gsc;
#using script_489bc5ff08558a82;
#using script_71332a5b74214116;
#using script_74502a9e0ef1f19c;

#namespace namespace_a1efa6e7f9d6a3ba;

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x995
// Size: 0xb
function init() {
    level thread namespace_32bee385f5a24c28::init();
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9a8
// Size: 0x1e
function init_binary_puzzle() {
    reroll_binary_op();
    flag_set("binary_puzzle_initialized");
    level thread updatecurrentoutput();
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9ce
// Size: 0xd2
function reroll_binary_op() {
    level.escape_binary_sequence = calculatecorrectbinarysequence();
    level.current_cbreaker_sequence = "0_0_0_0";
    level.blocks_binary_sequence = calculatefourbitbinarysequence();
    level.current_blocks_sequence = level.blocks_binary_sequence;
    level.sequence_operator = determineoperation();
    assertex(isdefined(level.escape_binary_sequence), "The Sequence to escape the room isn't defined!!");
    assertex(isdefined(level.current_cbreaker_sequence), "The Current Circuit Breaker Sequence isn't defined!!");
    assertex(isdefined(level.blocks_binary_sequence), "The Blocks Binary Sequence isn't defined!!");
    assertex(isdefined(level.current_blocks_sequence), "The Current Blocks Binary Sequence isn't defined!!");
    assertex(isdefined(level.sequence_operator), "The Sequence Operator isn't defined!!");
    iprintln(" ^1 BINARY SEQUENCES AND OPERATIONS CHANGED!!! LOOK AGAIN!! ");
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaa8
// Size: 0x1e1
function updatecurrentoutput() {
    op = getdvarint(@"hash_d889f30225b83fa5", 0);
    if (op != 0) {
        level.current_output = op;
    } else {
        level.current_output = performoperation(level.current_cbreaker_sequence, level.current_blocks_sequence, level.sequence_operator);
    }
    while (true) {
        level waittill("input_sequence_changed");
        op = getdvarint(@"hash_d889f30225b83fa5", 0);
        if (op != 0) {
            level.current_output = op;
        } else {
            level.current_output = performoperation(level.current_cbreaker_sequence, level.current_blocks_sequence, level.sequence_operator);
        }
        var_4250e8f4232a71c5 = converttobinary(level.current_output, 1);
        iprintln(" ^1 BINARY VALUES FOR THE LAPTOPS - ^7" + var_4250e8f4232a71c5);
        var_1c3321f0f58f0e6c = strtok(var_4250e8f4232a71c5, "_");
        foreach (struct in level.cameraactivationstructs) {
            switch (struct.name) {
            case #"hash_b195b7771a2c2ac8": 
                struct.bval = int(var_1c3321f0f58f0e6c[0]);
                break;
            case #"hash_b195ba771a2c2f81": 
                struct.bval = int(var_1c3321f0f58f0e6c[1]);
                break;
            case #"hash_b195b9771a2c2dee": 
                struct.bval = int(var_1c3321f0f58f0e6c[2]);
                break;
            case #"hash_b195bc771a2c32a7": 
                struct.bval = int(var_1c3321f0f58f0e6c[3]);
                break;
            }
        }
    }
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc91
// Size: 0x4e
function determineoperation() {
    array = ["add", "sub", "and", "or", "xor"];
    choice = random(array);
    return choice;
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xce8
// Size: 0x155
function performoperation(var_23593744eb26db24, var_23593a44eb26e1bd, operator) {
    var_f69e39e78fa16603 = 666;
    switch (operator) {
    case #"hash_c4e286c1095c786": 
        var_f69e39e78fa16603 = convertfrombinary(var_23593744eb26db24) & convertfrombinary(var_23593a44eb26e1bd);
        if (var_f69e39e78fa16603 <= 0) {
            var_f69e39e78fa16603 = 0;
        }
        return var_f69e39e78fa16603;
    case #"hash_fa2ad2f6bd6509e4": 
        var_f69e39e78fa16603 = convertfrombinary(var_23593744eb26db24) | convertfrombinary(var_23593a44eb26e1bd);
        if (var_f69e39e78fa16603 <= 0) {
            var_f69e39e78fa16603 = 0;
        }
        return var_f69e39e78fa16603;
    case #"hash_c3f1836c705d775e": 
        var_f69e39e78fa16603 = convertfrombinary(var_23593744eb26db24) ^ convertfrombinary(var_23593a44eb26e1bd);
        if (var_f69e39e78fa16603 <= 0) {
            var_f69e39e78fa16603 = 0;
        }
        return var_f69e39e78fa16603;
    case #"hash_c61546c10a51754": 
        var_f69e39e78fa16603 = convertfrombinary(var_23593744eb26db24) + convertfrombinary(var_23593a44eb26e1bd);
        if (var_f69e39e78fa16603 >= 15) {
            var_f69e39e78fa16603 = 15;
        }
        if (var_f69e39e78fa16603 <= 0) {
            var_f69e39e78fa16603 = 0;
        }
        return var_f69e39e78fa16603;
    case #"hash_9025ae6c553fd4f5": 
        var_f69e39e78fa16603 = convertfrombinary(var_23593744eb26db24) - convertfrombinary(var_23593a44eb26e1bd);
        if (var_f69e39e78fa16603 <= 0) {
            var_f69e39e78fa16603 = 0;
        }
        return var_f69e39e78fa16603;
    case #"hash_fa50baf6bd82f930": 
        var_f69e39e78fa16603 = convertfrombinary(var_23593744eb26db24) >> convertfrombinary(var_23593a44eb26e1bd);
        if (var_f69e39e78fa16603 <= 0) {
            var_f69e39e78fa16603 = 0;
        }
        return var_f69e39e78fa16603;
    case #"hash_fa50b8f6bd82f60a": 
        var_f69e39e78fa16603 = convertfrombinary(var_23593744eb26db24) << convertfrombinary(var_23593a44eb26e1bd);
        if (var_f69e39e78fa16603 <= 0) {
            var_f69e39e78fa16603 = 0;
        }
        return var_f69e39e78fa16603;
    }
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe45
// Size: 0x1f
function calculatefourbitbinarysequence() {
    randint = randomintrange(1, 16);
    return converttobinary(randint, 1);
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe6d
// Size: 0x1f
function calculatecorrectbinarysequence() {
    randint = randomintrange(1, 16);
    return converttobinary(randint, 1);
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe95
// Size: 0x1f1
function converttobinary(digit, var_130c7170b6a041d4) {
    switch (digit) {
    case 0: 
        if (istrue(var_130c7170b6a041d4)) {
            return "0_0_0_0";
        }
        return "0_0_0";
    case 1: 
        if (istrue(var_130c7170b6a041d4)) {
            return "0_0_0_1";
        }
        return "0_0_1";
    case 2: 
        if (istrue(var_130c7170b6a041d4)) {
            return "0_0_1_0";
        }
        return "0_1_0";
    case 3: 
        if (istrue(var_130c7170b6a041d4)) {
            return "0_0_1_1";
        }
        return "0_1_1";
    case 4: 
        if (istrue(var_130c7170b6a041d4)) {
            return "0_1_0_0";
        }
        return "1_0_0";
    case 5: 
        if (istrue(var_130c7170b6a041d4)) {
            return "0_1_0_1";
        }
        return "1_0_1";
    case 6: 
        if (istrue(var_130c7170b6a041d4)) {
            return "0_1_1_0";
        }
        return "1_1_0";
    case 7: 
        if (istrue(var_130c7170b6a041d4)) {
            return "0_1_1_1";
        }
        return "1_1_1";
    case 8: 
        if (istrue(var_130c7170b6a041d4)) {
            return "1_0_0_0";
        }
    case 9: 
        if (istrue(var_130c7170b6a041d4)) {
            return "1_0_0_1";
        }
    case 10: 
        if (istrue(var_130c7170b6a041d4)) {
            return "1_0_1_0";
        }
    case 11: 
        if (istrue(var_130c7170b6a041d4)) {
            return "1_0_1_1";
        }
    case 12: 
        if (istrue(var_130c7170b6a041d4)) {
            return "1_1_0_0";
        }
    case 13: 
        if (istrue(var_130c7170b6a041d4)) {
            return "1_1_0_1";
        }
    case 14: 
        if (istrue(var_130c7170b6a041d4)) {
            return "1_1_1_0";
        }
    case 15: 
        if (istrue(var_130c7170b6a041d4)) {
            return "1_1_1_1";
        }
        assertex(istrue(var_130c7170b6a041d4), "^3YOU CANT REPRESENT ^6" + digit + " ^3WITH A 3 BIT NUMBER! ERROR IN SCRIPT - Aj ");
        break;
    default: 
        iprintln(" you should not be getting this result. Error in Script - Aj ");
        break;
    }
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x108e
// Size: 0x90
function convertfrombinary(var_8affa1d52e6aa880) {
    var_becbdfa822fd69e = strtok(var_8affa1d52e6aa880, "_");
    one = int(var_becbdfa822fd69e[3]);
    two = int(var_becbdfa822fd69e[2]);
    four = int(var_becbdfa822fd69e[1]);
    eight = int(var_becbdfa822fd69e[0]);
    var_e3c151091a692f60 = one * 1 + two * 2 + four * 4 + eight * 8;
    return var_e3c151091a692f60;
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1127
// Size: 0xe9
function getbinarysequencemapping() {
    array = ["f", "f_r", "r", "b_r", "b", "b_l", "l", "f_l"];
    var_69d32d6403bef4e0 = random(array);
    var_e0cf7acecab4470f = [];
    chosen = 0;
    counter = 0;
    var_2fe0c25b7c39977c = array;
    foreach (element in array) {
        var_e0cf7acecab4470f[element] = converttobinary(index);
    }
    return var_e0cf7acecab4470f;
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1219
// Size: 0x34
function calculaterangeofprojectilemotion(u, var_450483a591a06439) {
    var_26d9ce38d34a1302 = squared(u) * sin(2 * var_450483a591a06439) / 19.62;
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1255
// Size: 0x48
function init_block_puzzle_interaction() {
    namespace_a3902e911697e714::register_interaction("block_puzzle_interaction", "null", undefined, &blockpuzzlehint, &blockpuzzleactivation, 0, 0, &blockpuzzleinit);
    namespace_a3902e911697e714::register_interaction("view_operation_result", "null", undefined, &viewoperationhint, &viewoperationactivation, 0, 0, &viewoperationinit);
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12a5
// Size: 0xb3
function viewoperationinit(structarray) {
    foreach (str in structarray) {
        str.model = spawn("script_model", str.origin);
        str.model setmodel("button_on_green");
        if (isdefined(str.angles)) {
            str.model.angles = str.angles;
        }
    }
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1360
// Size: 0x18
function viewoperationhint(var_df071553d0996ff9, player) {
    return %CP_LAB/VIEW_OP_RESULT;
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1381
// Size: 0x39
function viewoperationactivation(var_df071553d0996ff9, player) {
    player iprintln("^5 CURRENT RESULT WITH THE ^1 " + level.sequence_operator + "^5 OPERATOR IS  - ^8 " + level.current_output);
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13c2
// Size: 0x18b
function blockpuzzleinit(structarray) {
    flag_wait("strike_init_done");
    flag_wait("binary_puzzle_initialized");
    if (!isdefined(level.blocks)) {
        level.blocks = [];
    }
    var_af617b7501ac2ff5 = getentarray("block_puzzle", "script_noteworthy");
    foreach (var_eea1264dd9d59093 in var_af617b7501ac2ff5) {
        var_eea1264dd9d59093.startpoint = var_eea1264dd9d59093.origin;
        var_6fc03e38f8cbf37d = getstruct(var_eea1264dd9d59093.target, "targetname");
        var_eea1264dd9d59093.endpoint = var_6fc03e38f8cbf37d.origin;
        var_29a13668ab4b5528 = strtok(var_eea1264dd9d59093.name, "_");
        blocknumber = int(var_29a13668ab4b5528[1]);
        var_eea1264dd9d59093.blocknumber = blocknumber;
        switch (var_eea1264dd9d59093.name) {
        case #"hash_6f85746e243f8969":
        case #"hash_6f85756e243f8afc":
        case #"hash_6f85766e243f8c8f":
        case #"hash_6f85776e243f8e22": 
            level.blocks[blocknumber] = var_eea1264dd9d59093;
            orientblocksbasedonsequence(level.blocks_binary_sequence, var_eea1264dd9d59093, blocknumber);
            break;
        }
    }
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1555
// Size: 0x1be
function orientblocksbasedonsequence(blocks_binary_sequence, var_eea1264dd9d59093, blocknumber) {
    var_becbdfa822fd69e = strtok(blocks_binary_sequence, "_");
    one = int(var_becbdfa822fd69e[3]);
    two = int(var_becbdfa822fd69e[2]);
    four = int(var_becbdfa822fd69e[1]);
    eight = int(var_becbdfa822fd69e[0]);
    switch (blocknumber) {
    case 1: 
        if (one == 1) {
            var_eea1264dd9d59093 moveto(var_eea1264dd9d59093.startpoint, 1, 0.2);
        } else {
            var_eea1264dd9d59093 moveto(var_eea1264dd9d59093.endpoint, 1, 0.2);
        }
        break;
    case 2: 
        if (two == 1) {
            var_eea1264dd9d59093 moveto(var_eea1264dd9d59093.startpoint, 1, 0.2);
        } else {
            var_eea1264dd9d59093 moveto(var_eea1264dd9d59093.endpoint, 1, 0.2);
        }
        break;
    case 3: 
        if (four == 1) {
            var_eea1264dd9d59093 moveto(var_eea1264dd9d59093.startpoint, 1, 0.2);
        } else {
            var_eea1264dd9d59093 moveto(var_eea1264dd9d59093.endpoint, 1, 0.2);
        }
        break;
    case 4: 
        if (eight == 1) {
            var_eea1264dd9d59093 moveto(var_eea1264dd9d59093.startpoint, 1, 0.2);
        } else {
            var_eea1264dd9d59093 moveto(var_eea1264dd9d59093.endpoint, 1, 0.2);
        }
        break;
    }
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x171b
// Size: 0x2b
function blockpuzzlehint(var_df071553d0996ff9, player) {
    if (istrue(level.playeraccessinglaptops)) {
        return %CP_LAB/LOCKED;
    }
    return %CP_LAB/BLOCK_SEQUENCE_TRIGGER;
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x174f
// Size: 0xbc
function blockpuzzleactivation(var_df071553d0996ff9, player) {
    decimal = convertfrombinary(level.current_blocks_sequence);
    if (decimal >= 15) {
        decimal = 0;
    } else {
        decimal++;
    }
    level.current_blocks_sequence = converttobinary(decimal, 1);
    level notify("input_sequence_changed");
    foreach (block in level.blocks) {
        orientblocksbasedonsequence(level.current_blocks_sequence, block, block.blocknumber);
    }
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1813
// Size: 0x37e
function caminit(var_7ebe92767a65429a) {
    precacheshader("nightvision_overlay_goggles_grain");
    cam_structs = getstructarray("cam_struct", "script_noteworthy");
    level.cam_target = getent("cam_target", "script_noteworthy");
    level.cam_target.targets = [];
    level.cam_target.finalstr = undefined;
    level.cameraactivationstructs = [];
    level.laptopinteractions = [];
    hack_structs = getstructarray("camhack_struct", "script_noteworthy");
    foreach (struct in var_7ebe92767a65429a) {
        foreach (str in cam_structs) {
            if (struct.script_label == str.name) {
                str.model = spawn("script_model", str.origin);
                str.model setmodel("security_camera_small_white_01");
                str.bval = 0;
                if (isdefined(str.angles)) {
                    str.model.angles = str.angles + (0, 0, 180);
                }
                str = rollsequencepercamera(str, hack_structs);
                level.cameraactivationstructs[level.cameraactivationstructs.size] = str;
                struct.camstr = str;
                struct.camstr.targetname = random(hack_structs);
                level.cam_target.targets[level.cam_target.targets.size] = struct.camstr.model;
                level.laptopinteractions[level.laptopinteractions.size] = struct;
            }
        }
    }
    level.hack_structs = [];
    temparr = hack_structs;
    foreach (var_8a15e145fbbcc32b in hack_structs) {
        var_8a15e145fbbcc32b.model = spawn("script_model", var_8a15e145fbbcc32b.origin);
        var_8a15e145fbbcc32b.model setmodel("security_camera_small_white_01");
        if (isdefined(var_8a15e145fbbcc32b.angles)) {
            var_8a15e145fbbcc32b.model.angles = var_8a15e145fbbcc32b.angles + (0, 0, 180);
        }
        var_8a15e145fbbcc32b.sequencename = strtok(var_8a15e145fbbcc32b.name, "_")[1];
        level.hack_structs[level.hack_structs.size] = var_8a15e145fbbcc32b;
    }
    level thread rollnewcamerapath();
    level thread watchforcorrectsequencecompletion();
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b99
// Size: 0x22f
function watchforcorrectsequencecompletion() {
    while (true) {
        var_1430c2c17d46405f, var_1cdb7cbc2df1bcd1 = level waittill("sequence_changed");
        if (!isdefined(level.balocked)) {
            level.balocked = 0;
        }
        if (!isdefined(level.bblocked)) {
            level.bblocked = 0;
        }
        if (!isdefined(level.bclocked)) {
            level.bclocked = 0;
        }
        if (!isdefined(level.bdlocked)) {
            level.bdlocked = 0;
        }
        foreach (var_1ba182408d3da4cb, sequence in level.finalsequence) {
            if (var_1430c2c17d46405f == sequence) {
                if (var_1ba182408d3da4cb == var_1cdb7cbc2df1bcd1) {
                    switch (var_1ba182408d3da4cb) {
                    case #"hash_b195b7771a2c2ac8": 
                        level.balocked = 1;
                        break;
                    case #"hash_b195ba771a2c2f81": 
                        level.bblocked = 1;
                        break;
                    case #"hash_b195b9771a2c2dee": 
                        level.bclocked = 1;
                        break;
                    case #"hash_b195bc771a2c32a7": 
                        level.bdlocked = 1;
                        break;
                    }
                }
                continue;
            }
            if (var_1ba182408d3da4cb == var_1cdb7cbc2df1bcd1) {
                switch (var_1ba182408d3da4cb) {
                case #"hash_b195b7771a2c2ac8": 
                    level.balocked = 0;
                    break;
                case #"hash_b195ba771a2c2f81": 
                    level.bblocked = 0;
                    break;
                case #"hash_b195b9771a2c2dee": 
                    level.bclocked = 0;
                    break;
                case #"hash_b195bc771a2c32a7": 
                    level.bdlocked = 0;
                    break;
                }
            }
        }
        if (level.balocked && level.bblocked && level.bclocked && level.bdlocked) {
            iprintlnbold(" THE SEQUENCES ARE CORRECT!! YOU CAN NOW ACCESS THE ELEVATOR! ");
            level.door_unlocked = 1;
            level.unlockedelevator = 1;
            level notify("unlock_pap_and_epic_weapon");
            level notify("end_target_door_watcher_thread");
            level notify("binary_puzzle_solved");
            break;
        }
    }
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1dd0
// Size: 0x17b
function rollsequencepercamera(camstr, var_28a1d8ee2f6cfc02) {
    size = var_28a1d8ee2f6cfc02.size;
    switch (camstr.name) {
    case #"hash_b195b7771a2c2ac8": 
        camstr.sequencetype = "A_";
        break;
    case #"hash_b195ba771a2c2f81": 
        camstr.sequencetype = "B_";
        break;
    case #"hash_b195b9771a2c2dee": 
        camstr.sequencetype = "C_";
        break;
    case #"hash_b195bc771a2c32a7": 
        camstr.sequencetype = "D_";
        break;
    }
    camstr.finalsequence = camstr.sequencetype;
    camstr.finalsequence += randomintrange(1, size + 1);
    /#
        println("<dev string:x1c>" + camstr.name + "<dev string:x3a>" + camstr.finalsequence);
        iprintlnbold("<dev string:x1c>" + camstr.name + "<dev string:x3a>" + camstr.finalsequence);
    #/
    if (!isdefined(level.finalsequence)) {
        level.finalsequence = [];
    }
    level.finalsequence[camstr.name] = camstr.finalsequence;
    return camstr;
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f54
// Size: 0x85
function rollnewcamerapath() {
    level.chosenarray = scripts\engine\utility::array_randomize(level.hack_structs);
    level.cam_target.finalstr = level.chosenarray[level.hack_structs.size - 1];
    level.cam_target.finalstr.model hudoutlineenable("outlinefill_nodepth_red");
    level.mappedtargetsarray = settargetsbasedonchosenarray(level.chosenarray);
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1fe1
// Size: 0x43
function settargetsbasedonchosenarray(chosenarray) {
    for (i = 0; i < chosenarray.size; i++) {
        if (isdefined(chosenarray[i + 1])) {
            chosenarray[i].target = chosenarray[i + 1];
        }
    }
    return chosenarray;
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x202d
// Size: 0x51
function generatepath(array) {
    assertex(isdefined(array), "check that the array is defined when passed in");
    start = 0;
    end = array.size - 1;
    assertex(isdefined(end), "check the target struct that's being passed in");
    permute(array, start, end);
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2086
// Size: 0x5d
function getindicesofelements(array, element) {
    foreach (var_a19bbe1fd4389e8d in array) {
        if (element == var_a19bbe1fd4389e8d) {
            return index;
        }
    }
    return undefined;
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x20ec
// Size: 0x36
function swapviaarraylocations(arr, var_6c1a2b66e4d519f, var_6c1a3b66e4d53d2) {
    temp = arr[var_6c1a2b66e4d519f];
    arr[var_6c1a2b66e4d519f] = arr[var_6c1a3b66e4d53d2];
    arr[var_6c1a3b66e4d53d2] = temp;
    return arr;
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x212b
// Size: 0x42
function printpermute(arr, size) {
    for (i = 0; i <= size; i++) {
        waitframe();
    }
    level.escapepathpermutations[level.escapepathpermutations.size] = arr;
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2175
// Size: 0x7c
function permute(arr, var_403c537cb8e90b93, var_4c84bd9af981db1a) {
    if (!isdefined(level.escapepathpermutations)) {
        level.escapepathpermutations = [];
    }
    if (var_403c537cb8e90b93 == var_4c84bd9af981db1a) {
        printpermute(arr, var_4c84bd9af981db1a);
    }
    for (i = var_403c537cb8e90b93; i <= var_4c84bd9af981db1a; i++) {
        arr = swapviaarraylocations(arr, var_403c537cb8e90b93, i);
        permute(arr, var_403c537cb8e90b93 + 1, var_4c84bd9af981db1a);
        arr = swapviaarraylocations(arr, var_403c537cb8e90b93, i);
    }
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x21f9
// Size: 0x4b
function is_player_looking_at_camera(start, angles, ignore_ent, var_e288d7904fbcf050) {
    if (within_fov(start, angles, var_e288d7904fbcf050.origin, cos(7.5))) {
        return 1;
    }
    return 0;
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x224c
// Size: 0xf2
function is_player_looking_at(start, dot, dot_only, ignore_ent) {
    self endon("death");
    self endon("disconnect");
    self endon("leave_cam");
    if (!isdefined(dot)) {
        dot = 0.8;
    }
    player = self;
    end = player geteye();
    angles = vectortoangles(start - end);
    forward = anglestoforward(angles);
    player_angles = player getplayerangles();
    player_forward = anglestoforward(player_angles);
    new_dot = vectordot(forward, player_forward);
    if (new_dot < dot) {
        return 0;
    }
    if (isdefined(dot_only)) {
        assertex(dot_only, "dot_only must be true or undefined");
        return 1;
    }
    return ray_trace_detail_passed(start, end, ignore_ent, create_default_contents(1));
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2347
// Size: 0x154
function check_looking_at(fdelay) {
    self notify("one_instance_for_" + self.model);
    self endon("one_instance_for_" + self.model);
    level endon("end_target_door_watcher_thread");
    if (isdefined(fdelay)) {
        wait fdelay;
    } else {
        waitframe();
    }
    level.cam_target.finalstr.model hudoutlineenable("outlinefill_nodepth_red");
    while (true) {
        foreach (player in level.players) {
            if (player worldpointinreticle_circle(self.origin, 10, 10000)) {
                if (istrue(player.isusingcamera)) {
                    if (isdefined(player.currentcamera)) {
                        if (level.cam_target.finalstr == player.currentcamera) {
                            level.cam_target.finalstr.model hudoutlineenable("outlinefill_nodepth_cyan");
                            level.door_unlocked = 1;
                            level notify("unlock_pap_and_epic_weapon");
                            level notify("end_target_door_watcher_thread");
                        }
                    }
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24a3
// Size: 0x25
function init_camera_interaction() {
    namespace_a3902e911697e714::register_interaction("cam_interaction", "null", undefined, &camhint, &camactivation, 0, 0, &caminit);
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x24d0
// Size: 0x74
function camhint(var_df071553d0996ff9, player) {
    if (istrue(level.door_unlocked)) {
        return "";
    }
    if (var_df071553d0996ff9.camstr.bval != 1) {
        return %CP_LAB/LOCKED;
    }
    if (isdefined(var_df071553d0996ff9.hacker)) {
        return %CP_LAB/LOCKED;
    }
    if (!istrue(level.sequence_locked)) {
        return %CP_LAB/LOCKED;
    }
    return %CP_LAB/ENTER_CAMERAS;
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x254d
// Size: 0x3e7
function camactivation(var_df071553d0996ff9, player) {
    player endon("disconnect");
    if (var_df071553d0996ff9.camstr.bval != 1) {
        return;
    }
    if (!istrue(level.sequence_locked)) {
        return;
    }
    if (istrue(level.door_unlocked)) {
        player iprintln(" ^7YOU'VE ALREADY FINISHED THIS PUZZLE");
        return;
    }
    if (isdefined(var_df071553d0996ff9.hacker)) {
        player iprintln("^7" + var_df071553d0996ff9.hacker + " ^3 IS ALREADY ACCESSING THE CAMERAS...Try again later");
        return;
    }
    if (!isdefined(var_df071553d0996ff9.camstr.angles)) {
        var_df071553d0996ff9.camstr.angles = (0, 0, 0);
    }
    player.enteredcamera = 1;
    outline_fade_alpha_for_index(6, 0, 0);
    player notify("enter_cam");
    var_df071553d0996ff9.hacker = player;
    level.playeraccessinglaptops = 1;
    player.og_origin = player.origin;
    player.og_angles = player getplayerangles();
    player.og_stance = player getstance();
    fwd = anglestoforward(var_df071553d0996ff9.camstr.angles);
    var_1f7736673cda8d6 = vectornormalize(var_df071553d0996ff9.camstr.origin - player getorigin());
    dot = vectordot(fwd, var_1f7736673cda8d6);
    tag = spawn("script_model", player.origin);
    tag setmodel("tag_player");
    tag.origin = var_df071553d0996ff9.camstr.origin;
    tag.angles = var_df071553d0996ff9.camstr.angles;
    put_player_on_cam(tag, player, var_df071553d0996ff9);
    level.cam_hud = snake_door_cam_hud(player);
    while (player usebuttonpressed()) {
        if (!istrue(player.enteredcamera)) {
            break;
        }
        wait 0.05;
    }
    waittill_player_exits_cam(player);
    var_1b9b8daf429dd199 = tag.origin + anglestoforward(tag.angles) * -20;
    player.enteredcamera = undefined;
    if (!istrue(player.enteredcamera)) {
        tag moveto(var_1b9b8daf429dd199, 0.05);
    } else {
        tag moveto(var_1b9b8daf429dd199, 0.5, 0.125);
    }
    wait 0.25;
    player notify("leave_cam");
    foreach (thing in level.cam_hud) {
        thing destroy();
    }
    level thread static_burst(0.125, player);
    level add_wait(&waittill_msg, "static_faded_in");
    do_wait_any();
    outline_fade_alpha_for_index(6, 0.8, 0);
    level notify("vision_set_change_request", undefined, player, 0.5, "snake_cam");
    setsaveddvar(@"r_mbRadialOverrideChromaticAberration", 0);
    setsaveddvar(@"r_mbRadialOverrideDistortion", 0);
    setsaveddvar(@"r_mbRadialOverrideRadius", 0);
    setsaveddvar(@"r_mbRadialOverrideStrength", 0);
    wait 0.1;
    remove_player_from_cam(player);
    var_df071553d0996ff9.hacker = undefined;
    level.playeraccessinglaptops = undefined;
    outline_fade_alpha_for_index(6, 0, 6);
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x293c
// Size: 0x63
function remove_door_snake_cam_ability() {
    /#
    #/
    foreach (struct in self.cam_structs) {
        if (isdefined(struct)) {
            struct notify("stop_snake_cam");
            struct remove_cursor_hint();
        }
    }
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29a7
// Size: 0xfa
function unlock_pap_and_ww() {
    level waittill("unlock_pap_and_epic_weapon");
    level notify("delete_sequence_timer_thread");
    iprintln(" ^7YOU HAVE UNLOCKED AN EPIC WEAPON AND PACK - A -PUNCH ");
    level.pap_unlocked = 1;
    structarray = getstructarray("weapon_pickup", "script_noteworthy");
    foreach (struct in structarray) {
        if (isdefined(struct.script_parameters)) {
            name = namespace_a0628d6954815ef8::getcompletenameforweapon(struct.script_parameters + "_mp");
            println("<dev string:x43>" + name);
            weapon = spawn("weapon_" + name, struct.origin);
            weapon itemweaponsetammo(weaponclipsize(name), weaponmaxammo(name));
        }
    }
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2aa9
// Size: 0x5a7
function snake_cam_control(player) {
    player endon("leave_cam");
    og_angles = self.angles;
    minpitch = -90;
    maxpitch = 90;
    var_cb6680317be1e374 = 90;
    var_aae6a37f78b5674 = 90;
    minyaw = og_angles[1] - var_cb6680317be1e374;
    maxyaw = og_angles[1] + var_cb6680317be1e374;
    minroll = og_angles[2] - var_aae6a37f78b5674;
    maxroll = og_angles[2] + var_aae6a37f78b5674;
    var_827abacd5ca8f6b3 = 20;
    var_594240552b896878 = 90;
    var_440ebeeb83bd05a8 = 0.6;
    var_75eb1524afeb7f2b = 0.8;
    var_c9ff6eeaaf645cee = 10;
    var_2fca29730a69ee8a = 4;
    var_e47ae22ec47fcedb = 1.2;
    var_d296b0eaf4a6b00f = [0, 0];
    var_d5e6310914396ac3 = 0.2;
    var_848e35f763ce65b0 = 0.2;
    var_91ab80bc6772504d = 0;
    while (true) {
        currentangles = self.angles;
        var_b4f55166f66361e9 = player.cam_ent.angles;
        input = player getnormalizedmovement();
        input = [-1, 1];
        multiplier = 0;
        var_e2dda8ff32bb022 = (input[0], input[1], 0);
        var_e2dda8ff32bb022 = length(var_e2dda8ff32bb022);
        var_5eb5724f78d37c4c = math::factor_value(var_848e35f763ce65b0, var_d5e6310914396ac3, var_e2dda8ff32bb022);
        var_d296b0eaf4a6b00f[0] = math::lerp(var_d296b0eaf4a6b00f[0], input[0], var_5eb5724f78d37c4c);
        var_d296b0eaf4a6b00f[1] = math::lerp(var_d296b0eaf4a6b00f[1], input[1], var_5eb5724f78d37c4c);
        if (currentangles[0] > 0 && var_d296b0eaf4a6b00f[0] < 0) {
            var_13a3fd6ddfa8548f = 1 - math::normalize_value(maxpitch * var_440ebeeb83bd05a8, maxpitch, currentangles[0]);
        } else if (currentangles[0] < 0 && var_d296b0eaf4a6b00f[0] > 0) {
            var_13a3fd6ddfa8548f = math::normalize_value(minpitch, minpitch * var_440ebeeb83bd05a8, currentangles[0]);
        } else {
            var_13a3fd6ddfa8548f = 1;
        }
        if (currentangles[1] > og_angles[1] && var_d296b0eaf4a6b00f[1] < 0) {
            var_8366082d034c6132 = 1 - math::normalize_value(maxyaw - var_cb6680317be1e374 * var_75eb1524afeb7f2b, maxyaw, currentangles[1]);
        } else if (currentangles[1] < og_angles[1] && var_d296b0eaf4a6b00f[1] > 0) {
            var_8366082d034c6132 = math::normalize_value(minyaw, minyaw + var_cb6680317be1e374 * var_75eb1524afeb7f2b, currentangles[1]);
        } else {
            var_8366082d034c6132 = 1;
        }
        var_9210ceace4810322 = var_d296b0eaf4a6b00f[1] * -1;
        var_181570543b8da6f7 = currentangles[1] + var_2fca29730a69ee8a * var_9210ceace4810322 * var_8366082d034c6132;
        if (var_181570543b8da6f7 > og_angles[1]) {
            multiplier = math::normalized_float_smooth_out(math::normalize_value(og_angles[1], maxyaw, var_181570543b8da6f7)) * -1;
        }
        if (var_181570543b8da6f7 < og_angles[1]) {
            multiplier = 1 - math::normalized_float_smooth_in(math::normalize_value(minyaw, og_angles[1], var_181570543b8da6f7));
        }
        var_a810b9620521c338 = input[1];
        var_d7f62313ffe99d1f = og_angles[2] + var_594240552b896878 * multiplier;
        maxroll *= multiplier;
        var_181570543b8da6f7 = clamp(var_181570543b8da6f7, minyaw, maxyaw);
        var_74eedd477f94f3a3 = var_d296b0eaf4a6b00f[0] * -1;
        var_6bf51480c3252112 = currentangles[0] + var_e47ae22ec47fcedb * var_74eedd477f94f3a3 * var_13a3fd6ddfa8548f;
        var_bc4b977758b3324e = minpitch;
        var_2f22df6828a1bcb0 = maxpitch;
        var_6bf51480c3252112 = clamp(var_6bf51480c3252112, var_bc4b977758b3324e, var_2f22df6828a1bcb0);
        var_6612315290576b0f = (var_6bf51480c3252112, var_181570543b8da6f7, var_d7f62313ffe99d1f);
        var_122923b7fd027a6f = length(var_6612315290576b0f - self.angles);
        var_122923b7fd027a6f = math::normalize_value(0, 1.5, var_122923b7fd027a6f);
        var_4d8cd161a8eaadc2 = math::factor_value(0, 0.105, var_122923b7fd027a6f);
        rumble = math::factor_value(0, 0.08, var_122923b7fd027a6f);
        volume = math::factor_value(0, 0.2, var_122923b7fd027a6f);
        if (var_4d8cd161a8eaadc2 > 0.005) {
            earthquake(var_4d8cd161a8eaadc2, 0.07, player.origin, 2000);
        }
        if (rumble > 0.0001) {
            if (!var_91ab80bc6772504d) {
                self.rumbleent playrumblelooponentity("steady_rumble");
                var_91ab80bc6772504d = 1;
            }
        } else if (var_91ab80bc6772504d) {
            self.rumbleent stoprumble("steady_rumble");
            var_91ab80bc6772504d = 0;
        }
        height = 1 - rumble;
        height *= 1000;
        self.rumbleent.origin = player geteye() + (0, 0, height);
        self.angles = var_6612315290576b0f;
        var_1b9b8daf429dd199 = self.origin + anglestoforward(self.angles) * 12 + anglestoup(self.angles) * -55 + (0, 0, 3);
        player.cam_ent.origin = var_1b9b8daf429dd199;
        player.cam_ent.angles = (self.angles[0], self.angles[1], self.angles[2]);
        wait 0.05;
    }
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3058
// Size: 0x116
function put_player_on_cam(tag, player, var_df071553d0996ff9) {
    var_1b9b8daf429dd199 = tag.origin + anglestoforward(tag.angles) * 12 - (0, 0, 55);
    player.cam_ent = tag;
    player.isusingcamera = 1;
    player.currentcamera = var_df071553d0996ff9.camstr;
    player.cameratarget = var_df071553d0996ff9.camstr.targetname;
    player val::set("player_on_cam", "fire", 0);
    player cameraunlink();
    player cameralinkto(player.cam_ent, "tag_player", 1);
    player playerlinkweaponviewtodelta(player.cam_ent, "tag_player", 1);
    player playerlinkedsetviewznear(0);
    player setplayerangles(tag.angles);
    thread watchforcameralookatothercameras(player, var_df071553d0996ff9);
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3176
// Size: 0xa3
function watchforcameralookatothercameras(player, var_df071553d0996ff9) {
    player endon("death");
    player endon("disconnect");
    player endon("leave_cam");
    player endon("switch_cams");
    foreach (camerastruct in level.hack_structs) {
        camerastruct.model thread watchforplayerlookat(player, camerastruct);
        camerastruct.model thread watchforcameralaunch(player, camerastruct, var_df071553d0996ff9);
    }
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3221
// Size: 0x71
function watchforcameralaunch(player, camerastruct, var_df071553d0996ff9) {
    player endon("death");
    player endon("disconnect");
    player endon("leave_cam");
    player endon("switch_cams");
    player notifyonplayercommand("enter_hack_cam", "+attack");
    while (true) {
        player waittill("enter_hack_cam");
        if (istrue(self.outlined)) {
            player thread enter_hacked_cam_model(self, camerastruct, var_df071553d0996ff9);
        }
    }
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x329a
// Size: 0x91
function watchforplayerlookat(player, camerastruct) {
    player endon("death");
    player endon("disconnect");
    player endon("leave_cam");
    player endon("switch_cams");
    while (true) {
        wait 0.07;
        if (player is_player_looking_at_camera(player.cam_ent.origin, player getplayerangles(), player, self)) {
            self hudoutlineenableforclient(player, "outlinefill_nodepth_cyan");
            self.outlined = 1;
            continue;
        }
        self hudoutlinedisableforclient(player);
        self.outlined = undefined;
    }
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3333
// Size: 0x75
function watchforcurrentcamerahack(player, currentcamera, cameratarget) {
    player endon("death");
    player endon("disconnect");
    player endon("leave_cam");
    player endon("switch_cams");
    cameraent = player.cam_ent;
    if (!isdefined(cameratarget)) {
        return;
    }
    cameratarget.model thread watchforlookathackcam(player, cameratarget, cameraent);
    cameratarget thread watchforplayerfirepress(player);
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x33b0
// Size: 0xaf
function watchforplayerfirepress(player) {
    player endon("death");
    player endon("disconnect");
    player endon("leave_cam");
    player endon("switch_cams");
    player notifyonplayercommand("enter_hack_cam", "+attack");
    while (true) {
        player waittill("enter_hack_cam");
        if (istrue(self.model.outlined)) {
            player thread enter_hacked_cam(self);
            continue;
        }
        player iprintln("^1 YOU TRIED TO ENTER THE WRONG CAMERA! FAIL!");
        level.cam_target.finalstr.model hudoutlinedisable();
        level notify("override_cooldowns");
        flag_set("exit_snakecam_immediately");
    }
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3467
// Size: 0x120
function enter_hacked_cam_model(var_609f3dae81876c41, camerastruct, var_df071553d0996ff9) {
    var_609f3dae81876c41 hudoutlineenableforclient(self, "outlinefill_nodepth_orange");
    self notify("switch_cams");
    outline_fade_alpha_for_index(6, 0, 0);
    level thread static_burst(0.1, self);
    self.cam_ent.origin = var_609f3dae81876c41.origin;
    self.cam_ent.angles = self.angles;
    self.currentcamera = var_609f3dae81876c41;
    var_1430c2c17d46405f = var_df071553d0996ff9.camstr.sequencetype + camerastruct.sequencename;
    if (var_1430c2c17d46405f == var_df071553d0996ff9.camstr.finalsequence) {
        self iprintln("^4this is the correct Sequence for ^7" + var_df071553d0996ff9.camstr.name);
    }
    level notify("sequence_changed", var_1430c2c17d46405f, var_df071553d0996ff9.camstr.name);
    thread watchforcameralookatothercameras(self, var_df071553d0996ff9);
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x358f
// Size: 0xbb
function enter_hacked_cam(var_2c70181123b48543) {
    var_2c70181123b48543.model hudoutlineenableforclient(self, "outlinefill_nodepth_orange");
    self notify("switch_cams");
    outline_fade_alpha_for_index(6, 0, 0);
    level thread static_burst(0.1, self);
    self.cam_ent.origin = var_2c70181123b48543.origin;
    self.cam_ent.angles = var_2c70181123b48543.angles;
    self.cameratarget = var_2c70181123b48543.target;
    self.currentcamera = var_2c70181123b48543;
    thread watchforcurrentcamerahack(self, self.currentcamera, self.cameratarget);
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3652
// Size: 0x142
function watchforlookathackcam(player, var_2c70181123b48543, cameraent) {
    player endon("death");
    player endon("disconnect");
    player endon("leave_cam");
    player endon("switch_cams");
    while (true) {
        wait 0.1;
        if (player worldpointinreticle_circle(self.origin, 10, 2000)) {
            if (istrue(self.outlined)) {
                self hudoutlineenableforclient(player, "outlinefill_nodepth_cyan");
                continue;
            }
            if (isdefined(player.cameratarget) && isdefined(var_2c70181123b48543.name)) {
                if (player.cameratarget.name == var_2c70181123b48543.name) {
                    self hudoutlineenableforclient(player, "outlinefill_nodepth_green");
                    self.outlined = 1;
                }
            } else if (level.cam_target.finalstr.model != self) {
                self hudoutlinedisableforclient(player);
                self.outlined = undefined;
            }
            continue;
        }
        if (level.cam_target.finalstr.model != self) {
            self hudoutlinedisableforclient(player);
            self.outlined = undefined;
        }
    }
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x379c
// Size: 0x10f
function remove_player_from_cam(player) {
    player unlink();
    player cameraunlink();
    player controlsunlink();
    player setorigin(player.og_origin);
    player setplayerangles(player.og_angles);
    player setstance(player.og_stance);
    player val::reset_all("player_on_cam");
    player.isusingcamera = 0;
    player.cameraused = undefined;
    player.cameratarget = undefined;
    foreach (var_2c70181123b48543 in level.hack_structs) {
        if (istrue(var_2c70181123b48543.model.outlined)) {
            var_2c70181123b48543.model hudoutlinedisableforclient(player);
            var_2c70181123b48543.model.outlined = undefined;
        }
    }
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38b3
// Size: 0x72
function waittill_player_exits_cam(player) {
    while (true) {
        if (player_is_trying_to_exit_camera(player)) {
            break;
        }
        if (!istrue(player.enteredcamera)) {
            break;
        }
        if (!istrue(level.sequence_locked)) {
            break;
        }
        if (istrue(level.unlockedelevator)) {
            break;
        }
        if (istrue(self.disabled)) {
            break;
        }
        waitframe();
    }
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x392d
// Size: 0x5c
function player_is_trying_to_exit_camera(player) {
    return player usebuttonpressed() || player fragbuttonpressed() || player meleebuttonpressed() || player buttonpressed("BUTTON_B") || player jumpbuttonpressed() || player buttonpressed("BUTTON_LSTICK") || player buttonpressed("BUTTON_RSTICK");
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3992
// Size: 0xa1
function static_burst(duration, player) {
    fade_time = 0.25;
    duration = ter_op(isdefined(duration), duration, 0.5);
    static = create_client_overlay("white", 1, player);
    static.alpha = 0;
    static fadeovertime(fade_time);
    static.alpha = 1;
    wait fade_time;
    level notify("static_faded_in");
    wait duration;
    static fadeovertime(fade_time);
    static.alpha = 0;
    wait fade_time;
    level notify("static_faded_out");
    static destroy();
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a3b
// Size: 0x1b0
function snake_door_cam_hud(player) {
    crosshair = newhudelem();
    crosshair.archived = 0;
    crosshair.location = 0;
    crosshair.alignx = "center";
    crosshair.aligny = "middle";
    crosshair.foreground = 1;
    crosshair.fontscale = 1;
    crosshair.sort = 20;
    crosshair.alpha = 0.7;
    crosshair.y = 233;
    crosshair settext(%CP_LAB/CAMERA_CROSSHAIR);
    overlay = newhudelem();
    overlay.x = 292;
    overlay.y = 60;
    overlay.alignx = "center";
    overlay.aligny = "middle";
    overlay.font = "smallfixed";
    overlay.fontscale = 0.75;
    overlay settext(%CP_LAB/CAMERA_CONTROLS);
    var_83a337b15031dab = create_client_overlay("nightvision_overlay_goggles_grain", 1, player);
    level notify("vision_set_change_request", "snake_cam", player);
    setsaveddvar(@"r_mbRadialOverrideChromaticAberration", 0.5);
    setsaveddvar(@"r_mbRadialOverrideDistortion", 0.2);
    setsaveddvar(@"r_mbRadialOverrideRadius", -0.75);
    setsaveddvar(@"r_mbRadialOverrideStrength", 0.011);
    return [crosshair, var_83a337b15031dab, overlay];
}

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3bf4
// Size: 0x5d
function fake_effects(start, end, model, player) {
    while (true) {
        start = model.origin;
        end = model.origin + anglestoforward(player.angles) * 1000;
        wait 1;
    }
}

/#

    // Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
    // Params 6, eflags: 0x0
    // Checksum 0x0, Offset: 0x3c59
    // Size: 0x64
    function draw_line_for_time_endon_death(org1, org2, r, g, b, timer) {
        timer = gettime() + timer * 1000;
        while (gettime() < timer) {
            line(org1, org2, (r, g, b), 1);
            wait 0.05;
        }
    }

#/

// Namespace namespace_a1efa6e7f9d6a3ba / scripts\cp\cp_puzzles_core
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x3cc5
// Size: 0xbb
function draw_angles_on_line(start, end, r, g, b, timer, model) {
    model endon("death");
    var_4dffbf84669f6c5 = spawn("script_model", start);
    var_4dffbf84669f6c5 moveto(end, 1);
    for (i = 0; i < timer; i++) {
        thread draw_capsule(var_4dffbf84669f6c5.origin, 3, 3, model.angles, (1, 0, 0), 0, 1);
        wait 0.05;
    }
    var_4dffbf84669f6c5 delete();
}

