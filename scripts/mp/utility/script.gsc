// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace script;

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c
// Size: 0xa2
function waittillslowprocessallowed(var_57af160dea220aac) {
    if (level.lastslowprocessframe == gettime()) {
        if (isdefined(var_57af160dea220aac) && var_57af160dea220aac) {
            while (level.lastslowprocessframe == gettime()) {
                wait(0.05);
            }
        } else {
            wait(0.05);
            if (level.lastslowprocessframe == gettime()) {
                wait(0.05);
                if (level.lastslowprocessframe == gettime()) {
                    wait(0.05);
                    if (level.lastslowprocessframe == gettime()) {
                        wait(0.05);
                    }
                }
            }
        }
    }
    level.lastslowprocessframe = gettime();
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f5
// Size: 0x46
function queuecreate(queuename) {
    if (!isdefined(level.queues)) {
        level.queues = [];
    }
    /#
        assert(!isdefined(level.queues[queuename]));
    #/
    level.queues[queuename] = [];
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x242
// Size: 0x43
function queueadd(queuename, entity) {
    /#
        assert(isdefined(level.queues[queuename]));
    #/
    level.queues[queuename][level.queues[queuename].size] = entity;
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c
// Size: 0xaf
function queueremovefirst(queuename) {
    /#
        assert(isdefined(level.queues[queuename]));
    #/
    first = undefined;
    var_de3092683946e980 = [];
    foreach (element in level.queues[queuename]) {
        if (!isdefined(element)) {
            continue;
        }
        if (!isdefined(first)) {
            first = element;
        } else {
            var_de3092683946e980[var_de3092683946e980.size] = element;
        }
    }
    level.queues[queuename] = var_de3092683946e980;
    return first;
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x343
// Size: 0x191
function quicksort(array, compare_func) {
    if (!isdefined(compare_func)) {
        compare_func = &default_compare;
    }
    l = 0;
    h = array.size - 1;
    stack = [0:l, 1:h];
    top = 1;
    while (top >= 0) {
        h = stack[top];
        top--;
        l = stack[top];
        top--;
        if (h - l <= 9) {
            h++;
            while (l < h) {
                x = array[l];
                j = l - 1;
                while (j >= 0 && [[ compare_func ]](x, array[j])) {
                    array[j + 1] = array[j];
                    j = j - 1;
                }
                array[j + 1] = x;
                l = l + 1;
            }
        } else {
            x = array[h];
            p = l - 1;
            for (j = l; j <= h - 1; j++) {
                if ([[ compare_func ]](array[j], x)) {
                    p++;
                    temp = array[p];
                    array[p] = array[j];
                    array[j] = temp;
                }
            }
            p++;
            temp = array[p];
            array[p] = array[h];
            array[h] = temp;
            if (p - 1 > l) {
                top++;
                stack[top] = l;
                top++;
                stack[top] = p - 1;
            }
            if (p + 1 < h) {
                top++;
                stack[top] = p + 1;
                top++;
                stack[top] = h;
            }
        }
    }
    return array;
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4dc
// Size: 0x17
function default_compare(left, right) {
    return left <= right;
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fb
// Size: 0x5b
function limitdecimalplaces(value, var_b25f7bc9b6613cc9) {
    modifier = 1;
    for (i = 0; i < var_b25f7bc9b6613cc9; i++) {
        modifier = modifier * 10;
    }
    newvalue = value * modifier;
    newvalue = int(newvalue);
    newvalue = newvalue / modifier;
    return newvalue;
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x55e
// Size: 0xac
function rounddecimalplaces(value, var_b25f7bc9b6613cc9, style) {
    if (!isdefined(style)) {
        style = "nearest";
    }
    modifier = 1;
    for (i = 0; i < var_b25f7bc9b6613cc9; i++) {
        modifier = modifier * 10;
    }
    newvalue = value * modifier;
    if (style == "up") {
        var_ce526f59e2a5ad3f = ceil(newvalue);
    } else if (style == "down") {
        var_ce526f59e2a5ad3f = floor(newvalue);
    } else {
        var_ce526f59e2a5ad3f = newvalue + 0.5;
    }
    newvalue = int(var_ce526f59e2a5ad3f);
    newvalue = newvalue / modifier;
    return newvalue;
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x612
// Size: 0x7f
function stringtofloat(var_e0c16711b32b5fe3) {
    var_1b23d4be061900e8 = strtok(var_e0c16711b32b5fe3, ".");
    var_26baf6c49c8edb98 = int(var_1b23d4be061900e8[0]);
    if (isdefined(var_1b23d4be061900e8[1])) {
        modifier = 1;
        for (i = 0; i < var_1b23d4be061900e8[1].size; i++) {
            modifier = modifier * 0.1;
        }
        var_26baf6c49c8edb98 = var_26baf6c49c8edb98 + int(var_1b23d4be061900e8[1]) * modifier;
    }
    return var_26baf6c49c8edb98;
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x699
// Size: 0x71
function array_remove_keep_index(ents, var_f7e215bd10cc45e9) {
    var_d674d7970eef9653 = [];
    foreach (index, ent in ents) {
        if (ent != var_f7e215bd10cc45e9) {
            var_d674d7970eef9653[index] = ent;
        }
    }
    return var_d674d7970eef9653;
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x712
// Size: 0x21
function delayentdelete(time) {
    self endon("death");
    wait(time);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73a
// Size: 0x31
function roundup(var_b4a0db97ee6d9256) {
    if (var_b4a0db97ee6d9256 - int(var_b4a0db97ee6d9256) >= 0.5) {
        return int(var_b4a0db97ee6d9256 + 1);
    } else {
        return int(var_b4a0db97ee6d9256);
    }
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x772
// Size: 0x60
function bufferednotify(notification, param1, param2, param3, param4, param5, param6, param7, param8) {
    thread bufferednotify_internal(notification, param1, param2, param3, param4, param5, param6, param7, param8);
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d9
// Size: 0x1eb
function bufferednotify_internal(notification, param1, param2, param3, param4, param5, param6, param7, param8) {
    self endon("disconnect");
    level endon("game_ended");
    var_42bc8cab1454c047 = "bufferedNotify_" + notification;
    self notify(var_42bc8cab1454c047);
    self endon(var_42bc8cab1454c047);
    if (!isdefined(self.bufferednotifications)) {
        self.bufferednotifications = [];
    }
    if (!isdefined(self.bufferednotifications[notification])) {
        self.bufferednotifications[notification] = [];
    }
    parameters = spawnstruct();
    parameters.param1 = param1;
    parameters.param2 = param2;
    parameters.param3 = param3;
    parameters.param4 = param4;
    parameters.param5 = param5;
    parameters.param6 = param6;
    parameters.param7 = param7;
    parameters.param8 = param8;
    self.bufferednotifications[notification][self.bufferednotifications[notification].size] = parameters;
    waittillframeend();
    while (isdefined(self) && self.bufferednotifications[notification].size > 0) {
        parameters = self.bufferednotifications[notification][0];
        self notify(notification, parameters.param1);
        self.bufferednotifications[notification] = array_remove_index(self.bufferednotifications[notification], 0);
        waitframe();
    }
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9cb
// Size: 0x3d
function notifyafterframeend(var_9facc6f327e1e6b4, var_7239f8830ef22b43) {
    /#
        assertex(isdefined(var_9facc6f327e1e6b4), "notifyAfterFrameEnd() was not given a notify to wait on");
    #/
    /#
        assertex(isdefined(var_7239f8830ef22b43), "notifyAfterFrameEnd() was not given a notify to send");
    #/
    self waittill(var_9facc6f327e1e6b4);
    waittillframeend();
    self notify(var_7239f8830ef22b43);
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa0f
// Size: 0x2e
function delaysetclientomnvar(delaytime, omnvar, value) {
    self endon("disconnect");
    wait(delaytime);
    self setclientomnvar(omnvar, value);
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa44
// Size: 0x3e
function strip_suffix(var_a3c267c12168ae42, var_7c7c8bef8b9787b0) {
    if (var_a3c267c12168ae42.size <= var_7c7c8bef8b9787b0.size) {
        return var_a3c267c12168ae42;
    }
    if (getsubstr(var_a3c267c12168ae42, var_a3c267c12168ae42.size - var_7c7c8bef8b9787b0.size, var_a3c267c12168ae42.size) == var_7c7c8bef8b9787b0) {
        return getsubstr(var_a3c267c12168ae42, 0, var_a3c267c12168ae42.size - var_7c7c8bef8b9787b0.size);
    }
    return var_a3c267c12168ae42;
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8a
// Size: 0x43
function vectortoanglessafe(forward, up) {
    right = vectorcross(forward, up);
    up = vectorcross(right, forward);
    angles = axistoangles(forward, right, up);
    return angles;
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xad5
// Size: 0x90
function heap(type) {
    /#
        assertex(type == "max" || type == "min", "Heap type must be 'max' or 'min'");
    #/
    h = spawnstruct();
    h.nvals = 0;
    h.vals = [];
    if (type == "max") {
        h.swap = &_heaplessthan;
    } else if (type == "min") {
        h.swap = &_heapgreaterthan;
    }
    return h;
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb6d
// Size: 0xc
function heapsize() {
    return self.nvals;
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb81
// Size: 0xf
function heappeek() {
    return self.vals[1];
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb98
// Size: 0xb8
function heappop() {
    if (self.nvals == 0) {
        return undefined;
    } else if (self.nvals == 1) {
        val = self.vals[1];
        self.vals[1] = undefined;
        self.nvals = 0;
        return val;
    } else {
        val = self.vals[1];
        self.vals[1] = self.vals[self.nvals];
        self.vals[self.nvals] = undefined;
        _heapify(1);
        self.nvals = self.nvals - 1;
        return val;
    }
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc57
// Size: 0xc6
function heapinsert(val) {
    self.vals[self.nvals + 1] = val;
    i = self.nvals + 1;
    parent = _heapparent(i);
    while (isdefined(parent)) {
        if ([[ self.swap ]](parent, i)) {
            temp = self.vals[parent];
            self.vals[parent] = self.vals[i];
            self.vals[i] = temp;
            i = parent;
            parent = _heapparent(i);
        } else {
            break;
        }
    }
    self.nvals = self.nvals + 1;
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd24
// Size: 0x97
function printheap() {
    /#
        print("<unknown string>");
        vals = [];
        size = self.nvals;
        for (i = 0; i < size; i++) {
            vals[i] = heappop();
        }
        for (i = 0; i < vals.size; i++) {
            heapinsert(vals[i]);
        }
        for (i = 0; i < vals.size; i++) {
            print(vals[i] + "<unknown string>");
        }
        print("<unknown string>");
    #/
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc2
// Size: 0x2b
function _heapgreaterthan(i, j) {
    return self.vals[i] > self.vals[j];
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf5
// Size: 0x2b
function _heaplessthan(i, j) {
    return self.vals[i] < self.vals[j];
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe28
// Size: 0x10d
function _heapify(i) {
    var_ce482278f59e590c = _heapleftchild(i);
    var_cdd54a78f51f882e = _heaprightchild(i);
    var_d2e8ec5a21155950 = undefined;
    var_9d2e8c63b1bfd1ef = 0;
    if (isdefined(var_ce482278f59e590c)) {
        var_9d2e8c63b1bfd1ef = self [[ self.swap ]](i, var_ce482278f59e590c);
    }
    var_cac9aa5d2653cbe0 = 0;
    if (isdefined(var_cdd54a78f51f882e)) {
        var_cac9aa5d2653cbe0 = self [[ self.swap ]](i, var_cdd54a78f51f882e);
    }
    if (!var_9d2e8c63b1bfd1ef && !var_cac9aa5d2653cbe0) {
        return;
    } else if (var_9d2e8c63b1bfd1ef && !var_cac9aa5d2653cbe0) {
        var_d2e8ec5a21155950 = var_ce482278f59e590c;
    } else if (!var_9d2e8c63b1bfd1ef && var_cac9aa5d2653cbe0) {
        var_d2e8ec5a21155950 = var_cdd54a78f51f882e;
    } else if (self [[ self.swap ]](var_ce482278f59e590c, var_cdd54a78f51f882e)) {
        var_d2e8ec5a21155950 = var_cdd54a78f51f882e;
    } else {
        var_d2e8ec5a21155950 = var_ce482278f59e590c;
    }
    temp = self.vals[i];
    self.vals[i] = self.vals[var_d2e8ec5a21155950];
    self.vals[var_d2e8ec5a21155950] = temp;
    _heapify(var_d2e8ec5a21155950);
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf3c
// Size: 0x24
function _heapleftchild(i) {
    if (!isdefined(self.vals[2 * i])) {
        return undefined;
    }
    return 2 * i;
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf68
// Size: 0x2a
function _heaprightchild(i) {
    if (!isdefined(self.vals[2 * i + 1])) {
        return undefined;
    }
    return 2 * i + 1;
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9a
// Size: 0x23
function _heapparent(i) {
    if (i == 1) {
        return undefined;
    }
    return int(floor(i / 2));
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc5
// Size: 0x20
function isnumbermultipleof(number, var_ccbba16287668f0a) {
    return number > 0 && number % var_ccbba16287668f0a == 0;
}

// Namespace script/namespace_9c840bb9f2ecbf00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfed
// Size: 0x1a
function demoforcesre(message) {
    var_f580de06a1c1891c = message == undefined;
}

