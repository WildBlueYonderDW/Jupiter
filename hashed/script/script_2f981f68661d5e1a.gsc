// mwiii decomp prototype
#using scripts\engine\math.gsc;

#namespace namespace_8f7beb0570b92f2f;

// Namespace namespace_8f7beb0570b92f2f/namespace_5346e7f2461d2b76
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb5
// Size: 0x3c
function function_348924356f8bad24() {
    /#
        assert(!isbot(self));
    #/
    self endon("disconnect");
    self.var_6c5a93f08dd4c17a = 0;
    while (!self issprinting()) {
        waitframe();
    }
    self.var_6c5a93f08dd4c17a = 1;
}

// Namespace namespace_8f7beb0570b92f2f/namespace_5346e7f2461d2b76
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf8
// Size: 0x3c
function function_d4a746782d28e9ad() {
    /#
        assert(!isbot(self));
    #/
    self endon("disconnect");
    self.var_56e1f146cc6f124f = 0;
    while (!self issupersprinting()) {
        waitframe();
    }
    self.var_56e1f146cc6f124f = 1;
}

// Namespace namespace_8f7beb0570b92f2f/namespace_5346e7f2461d2b76
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13b
// Size: 0x3c
function function_4cf7b50740f57f7b() {
    /#
        assert(!isbot(self));
    #/
    self endon("disconnect");
    self.var_f01dcaab58c1ab99 = 0;
    while (!self function_38932cc1ef28756()) {
        waitframe();
    }
    self.var_f01dcaab58c1ab99 = 1;
}

// Namespace namespace_8f7beb0570b92f2f/namespace_5346e7f2461d2b76
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x17e
// Size: 0x78
function function_ee0f48a23c219539(var_a324c7cbbc4f2e30, var_6e8b41e0a5648f49, var_eecb169540a9f109) {
    /#
        assert(!isbot(self));
    #/
    self endon("disconnect");
    inittime = gettime();
    var_a324c7cbbc4f2e30 = var_a324c7cbbc4f2e30 * 1000;
    while (!istrue(self.var_6c5a93f08dd4c17a)) {
        if (gettime() - inittime >= var_a324c7cbbc4f2e30) {
            inittime = gettime();
            [[ var_eecb169540a9f109 ]](self);
        }
        waitframe();
    }
    [[ var_6e8b41e0a5648f49 ]](self);
}

// Namespace namespace_8f7beb0570b92f2f/namespace_5346e7f2461d2b76
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1fd
// Size: 0x78
function function_4dfbc95b23a556f4(var_a324c7cbbc4f2e30, var_6e8b41e0a5648f49, var_eecb169540a9f109) {
    /#
        assert(!isbot(self));
    #/
    self endon("disconnect");
    inittime = gettime();
    var_a324c7cbbc4f2e30 = var_a324c7cbbc4f2e30 * 1000;
    while (!istrue(self.var_56e1f146cc6f124f)) {
        if (gettime() - inittime >= var_a324c7cbbc4f2e30) {
            inittime = gettime();
            [[ var_eecb169540a9f109 ]](self);
        }
        waitframe();
    }
    [[ var_6e8b41e0a5648f49 ]](self);
}

// Namespace namespace_8f7beb0570b92f2f/namespace_5346e7f2461d2b76
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x27c
// Size: 0x78
function function_768aaa759077df62(var_a324c7cbbc4f2e30, var_6e8b41e0a5648f49, var_eecb169540a9f109) {
    /#
        assert(!isbot(self));
    #/
    self endon("disconnect");
    inittime = gettime();
    var_a324c7cbbc4f2e30 = var_a324c7cbbc4f2e30 * 1000;
    while (!istrue(self.var_f01dcaab58c1ab99)) {
        if (gettime() - inittime >= var_a324c7cbbc4f2e30) {
            inittime = gettime();
            [[ var_eecb169540a9f109 ]](self);
        }
        waitframe();
    }
    [[ var_6e8b41e0a5648f49 ]](self);
}

// Namespace namespace_8f7beb0570b92f2f/namespace_5346e7f2461d2b76
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2fb
// Size: 0x81
function function_33749fefab503510(targetdistance) {
    /#
        assert(!isbot(self));
    #/
    self endon("disconnect");
    self.var_7cc4914a032a2df3 = 0;
    self.init_pos = self.origin;
    dist = 0;
    while (dist < targetdistance * 10) {
        dist = distance(self.origin, self.init_pos);
        wait(0.5);
    }
    self.var_7cc4914a032a2df3 = 1;
}

// Namespace namespace_8f7beb0570b92f2f/namespace_5346e7f2461d2b76
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x383
// Size: 0x6f
function function_87682c85d41c2e13(var_7b59b41b01684053, targetdistance) {
    /#
        assert(!isbot(self));
    #/
    self endon("disconnect");
    self.var_919769d433a608f3 = 0;
    dist = targetdistance * 10;
    while (dist > targetdistance) {
        dist = distance(self.origin, var_7b59b41b01684053);
        wait(0.2);
    }
    self.var_919769d433a608f3 = 1;
}

// Namespace namespace_8f7beb0570b92f2f/namespace_5346e7f2461d2b76
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3fa
// Size: 0xa1
function function_105bd25b72f6ea55(anglediff) {
    /#
        assert(!isbot(self));
    #/
    self endon("disconnect");
    self.var_c3661355a5b3083d = 0;
    var_db1111b1b4c72b10 = anglestoforward(self getplayerangles(0));
    var_db1111b1b4c72b10 = vectornormalize(var_db1111b1b4c72b10);
    while (1) {
        var_73d0c62ee90ef3c3 = anglestoforward(self getplayerangles(0));
        var_73d0c62ee90ef3c3 = vectornormalize(var_73d0c62ee90ef3c3);
        var_da41dd6f879889d2 = anglebetweenvectors(var_73d0c62ee90ef3c3, var_db1111b1b4c72b10);
        if (isdefined(var_da41dd6f879889d2) && var_da41dd6f879889d2 >= anglediff) {
            self.var_c3661355a5b3083d = 1;
            break;
        }
        waitframe();
    }
}

// Namespace namespace_8f7beb0570b92f2f/namespace_5346e7f2461d2b76
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4a3
// Size: 0x3e
function function_4f94f7b207e54b3f(targetdistance, anglediff) {
    /#
        assert(!isbot(self));
    #/
    self endon("disconnect");
    self.var_e36371bc08c4f3e7 = 0;
    function_a67db5cf006fc19e(targetdistance, anglediff);
}

// Namespace namespace_8f7beb0570b92f2f/namespace_5346e7f2461d2b76
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e9
// Size: 0xe9
function function_a67db5cf006fc19e(targetdistance, anglediff) {
    /#
        assert(!isbot(self));
    #/
    self endon("disconnect");
    self endon("currentContextualTipCompleted");
    self endon("currentContextualTipAborted");
    self.var_e36371bc08c4f3e7 = 0;
    init_pos = self.origin;
    var_db1111b1b4c72b10 = anglestoforward(self getplayerangles(0));
    while (1) {
        var_b6c7f877ffdde154 = distance(self.origin, init_pos);
        var_73d0c62ee90ef3c3 = anglestoforward(self getplayerangles(0));
        if (var_73d0c62ee90ef3c3 != var_db1111b1b4c72b10) {
            var_da41dd6f879889d2 = anglebetweenvectorsunit(var_73d0c62ee90ef3c3, var_db1111b1b4c72b10);
            if (isdefined(var_da41dd6f879889d2) && isdefined(var_b6c7f877ffdde154) && var_da41dd6f879889d2 >= anglediff && var_b6c7f877ffdde154 > targetdistance) {
                self.var_e36371bc08c4f3e7 = 1;
                break;
            }
        }
        waitframe();
    }
}

// Namespace namespace_8f7beb0570b92f2f/namespace_5346e7f2461d2b76
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5d9
// Size: 0x78
function function_7c4b6588a387e2d5(var_a324c7cbbc4f2e30, var_6e8b41e0a5648f49, var_eecb169540a9f109) {
    /#
        assert(!isbot(self));
    #/
    self endon("disconnect");
    inittime = gettime();
    var_a324c7cbbc4f2e30 = var_a324c7cbbc4f2e30 * 1000;
    while (!istrue(self.var_7cc4914a032a2df3)) {
        if (gettime() - inittime >= var_a324c7cbbc4f2e30) {
            inittime = gettime();
            [[ var_eecb169540a9f109 ]](self);
        }
        waitframe();
    }
    [[ var_6e8b41e0a5648f49 ]](self);
}

// Namespace namespace_8f7beb0570b92f2f/namespace_5346e7f2461d2b76
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x658
// Size: 0x78
function function_e58bb74ec5f54731(var_a324c7cbbc4f2e30, var_6e8b41e0a5648f49, var_eecb169540a9f109) {
    /#
        assert(!isbot(self));
    #/
    self endon("disconnect");
    inittime = gettime();
    var_a324c7cbbc4f2e30 = var_a324c7cbbc4f2e30 * 1000;
    while (!istrue(self.var_c3661355a5b3083d)) {
        if (gettime() - inittime >= var_a324c7cbbc4f2e30) {
            inittime = gettime();
            [[ var_eecb169540a9f109 ]](self);
        }
        waitframe();
    }
    [[ var_6e8b41e0a5648f49 ]](self);
}

// Namespace namespace_8f7beb0570b92f2f/namespace_5346e7f2461d2b76
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6d7
// Size: 0x78
function function_e7a33bfb4cba7633(var_a324c7cbbc4f2e30, var_6e8b41e0a5648f49, var_eecb169540a9f109) {
    /#
        assert(!isbot(self));
    #/
    self endon("disconnect");
    inittime = gettime();
    var_a324c7cbbc4f2e30 = var_a324c7cbbc4f2e30 * 1000;
    while (!istrue(self.var_e36371bc08c4f3e7)) {
        if (gettime() - inittime >= var_a324c7cbbc4f2e30) {
            inittime = gettime();
            [[ var_eecb169540a9f109 ]](self);
        }
        waitframe();
    }
    [[ var_6e8b41e0a5648f49 ]](self);
}

// Namespace namespace_8f7beb0570b92f2f/namespace_5346e7f2461d2b76
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x756
// Size: 0x1a
function function_f656ad666eda6d08() {
    result = self isonground();
    return self isonground();
}

