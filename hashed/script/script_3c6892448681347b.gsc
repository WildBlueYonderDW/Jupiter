// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_906f7fabdda92dc;

// Namespace namespace_906f7fabdda92dc/namespace_447031647c18249
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9c
// Size: 0xbe
function function_a16975ad999570bf(asmname, statename, params) {
    self endon(statename + "_finished");
    /#
        assert(isdefined(self.var_d920859fcc741412) && self.var_d920859fcc741412 >= 0);
    #/
    var_2c8936d08f85c5c1 = asm_getanim(asmname, statename);
    xanim = asm_getxanim(statename, var_2c8936d08f85c5c1);
    self aisetanim(statename, var_2c8936d08f85c5c1);
    asm_playfacialanim(asmname, statename, asm_getxanim(statename, var_2c8936d08f85c5c1));
    endnote = asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
    if (endnote == "code_move") {
        endnote = asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
    }
}

