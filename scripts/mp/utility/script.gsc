// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace script;

// Namespace script / scripts/mp/utility/script
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c
// Size: 0xa2
function waittillslowprocessallowed(allowloop) {
    if (level.lastslowprocessframe == gettime()) {
        if (isdefined(allowloop) && allowloop) {
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

// Namespace script / scripts/mp/utility/script
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

// Namespace script / scripts/mp/utility/script
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x242
// Size: 0x43
function queueadd(queuename, entity) {
    /#
        assert(isdefined(level.queues[queuename]));
    #/
    level.queues[queuename][level.queues[queuename].size] = entity;
}

// Namespace script / scripts/mp/utility/script
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c
// Size: 0xaf
function queueremovefirst(queuename) {
    /#
        assert(isdefined(level.queues[queuename]));
    #/
    first = undefined;
    newqueue = [];
    foreach (element in level.queues[queuename]) {
        if (!isdefined(element)) {
            continue;
        }
        if (!isdefined(first)) {
            first = element;
            continue;
        }
        newqueue[newqueue.size] = element;
    }
    level.queues[queuename] = newqueue;
    return first;
}

// Namespace script / scripts/mp/utility/script
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x343
// Size: 0x191
function quicksort(array, compare_func) {
    if (!isdefined(compare_func)) {
        compare_func = &default_compare;
    }
    l = 0;
    h = array.size - 1;
    stack = [l, h];
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
                for (j = l - 1; j >= 0 && [[ compare_func ]](x, array[j]); j = j - 1) {
                    array[j + 1] = array[j];
                }
                array[j + 1] = x;
                l = l + 1;
            }
            continue;
        }
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
    return array;
}

// Namespace script / scripts/mp/utility/script
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4dc
// Size: 0x17
function default_compare(left, right) {
    return left <= right;
}

// Namespace script / scripts/mp/utility/script
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fb
// Size: 0x5b
function limitdecimalplaces(value, places) {
    modifier = 1;
    for (i = 0; i < places; i++) {
        modifier = modifier * 10;
    }
    newvalue = value * modifier;
    newvalue = int(newvalue);
    newvalue = newvalue / modifier;
    return newvalue;
}

// Namespace script / scripts/mp/utility/script
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x55e
// Size: 0xac
function rounddecimalplaces(value, places, style) {
    if (!isdefined(style)) {
        style = "nearest";
    }
    modifier = 1;
    for (i = 0; i < places; i++) {
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

// Namespace script / scripts/mp/utility/script
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x612
// Size: 0x7f
function stringtofloat(stringval) {
    floatelements = strtok(stringval, ".");
    floatval = int(floatelements[0]);
    if (isdefined(floatelements[1])) {
        modifier = 1;
        for (i = 0; i < floatelements[1].size; i++) {
            modifier = modifier * 0.1;
        }
        floatval = floatval + int(floatelements[1]) * modifier;
    }
    return floatval;
}

// Namespace script / scripts/mp/utility/script
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x699
// Size: 0x71
function array_remove_keep_index(ents, remover) {
    newents = [];
    foreach (index, ent in ents) {
        if (ent != remover) {
            newents[index] = ent;
        }
    }
    return newents;
}

// Namespace script / scripts/mp/utility/script
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

// Namespace script / scripts/mp/utility/script
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73a
// Size: 0x31
function roundup(floatvalue) {
    if (floatvalue - int(floatvalue) >= 0.5) {
        return int(floatvalue + 1);
    }
    return int(floatvalue);
}

// Namespace script / scripts/mp/utility/script
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x772
// Size: 0x60
function bufferednotify(notification, param1, param2, param3, param4, param5, param6, param7, param8) {
    thread bufferednotify_internal(notification, param1, param2, param3, param4, param5, param6, param7, param8);
}

// Namespace script / scripts/mp/utility/script
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d9
// Size: 0x1eb
function bufferednotify_internal(notification, param1, param2, param3, param4, param5, param6, param7, param8) {
    self endon("disconnect");
    level endon("game_ended");
    uniqueendonnotify = "bufferedNotify_" + notification;
    self notify(uniqueendonnotify);
    self endon(uniqueendonnotify);
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

// Namespace script / scripts/mp/utility/script
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9cb
// Size: 0x3d
function notifyafterframeend(waittillmsg, var_7239f8830ef22b43) {
    /#
        assertex(isdefined(waittillmsg), "notifyAfterFrameEnd() was not given a notify to wait on");
    #/
    /#
        assertex(isdefined(var_7239f8830ef22b43), "notifyAfterFrameEnd() was not given a notify to send");
    #/
    self waittill(waittillmsg);
    waittillframeend();
    self notify(var_7239f8830ef22b43);
}

// Namespace script / scripts/mp/utility/script
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa0f
// Size: 0x2e
function delaysetclientomnvar(delaytime, omnvar, value) {
    self endon("disconnect");
    wait(delaytime);
    self setclientomnvar(omnvar, value);
}

// Namespace script / scripts/mp/utility/script
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa44
// Size: 0x3e
function strip_suffix(lookupstring, stripstring) {
    if (lookupstring.size <= stripstring.size) {
        return lookupstring;
    }
    if (getsubstr(lookupstring, lookupstring.size - stripstring.size, lookupstring.size) == stripstring) {
        return getsubstr(lookupstring, 0, lookupstring.size - stripstring.size);
    }
    return lookupstring;
}

// Namespace script / scripts/mp/utility/script
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8a
// Size: 0x43
function vectortoanglessafe(forward, up) {
    right = vectorcross(forward, up);
    up = vectorcross(right, forward);
    angles = axistoangles(forward, right, up);
    return angles;
}

// Namespace script / scripts/mp/utility/script
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

// Namespace script / scripts/mp/utility/script
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb6d
// Size: 0xc
function heapsize() {
    return self.nvals;
}

// Namespace script / scripts/mp/utility/script
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb81
// Size: 0xf
function heappeek() {
    return self.vals[1];
}

// Namespace script / scripts/mp/utility/script
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb98
// Size: 0xb8
function heappop() {
    if (self.nvals == 0) {
        return undefined;
    }
    if (self.nvals == 1) {
        val = self.vals[1];
        self.vals[1] = undefined;
        self.nvals = 0;
        return val;
    }
    val = self.vals[1];
    self.vals[1] = self.vals[self.nvals];
    self.vals[self.nvals] = undefined;
    _heapify(1);
    self.nvals = self.nvals - 1;
    return val;
}

// Namespace script / scripts/mp/utility/script
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
            continue;
        }
        break;
    }
    self.nvals = self.nvals + 1;
}

// Namespace script / scripts/mp/utility/script
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

// Namespace script / scripts/mp/utility/script
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc2
// Size: 0x2b
function _heapgreaterthan(i, j) {
    return self.vals[i] > self.vals[j];
}

// Namespace script / scripts/mp/utility/script
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf5
// Size: 0x2b
function _heaplessthan(i, j) {
    return self.vals[i] < self.vals[j];
}

// Namespace script / scripts/mp/utility/script
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe28
// Size: 0x10d
function _heapify(i) {
    lc = _heapleftchild(i);
    rc = _heaprightchild(i);
    newidx = undefined;
    swapleft = 0;
    if (isdefined(lc)) {
        swapleft = self [[ self.swap ]](i, lc);
    }
    swapright = 0;
    if (isdefined(rc)) {
        swapright = self [[ self.swap ]](i, rc);
    }
    if (!swapleft && !swapright) {
        return;
    } else if (swapleft && !swapright) {
        newidx = lc;
    } else if (!swapleft && swapright) {
        newidx = rc;
    } else if (self [[ self.swap ]](lc, rc)) {
        newidx = rc;
    } else {
        newidx = lc;
    }
    temp = self.vals[i];
    self.vals[i] = self.vals[newidx];
    self.vals[newidx] = temp;
    _heapify(newidx);
}

// Namespace script / scripts/mp/utility/script
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf3c
// Size: 0x24
function _heapleftchild(i) {
    if (!isdefined(self.vals[2 * i])) {
        return undefined;
    }
    return 2 * i;
}

// Namespace script / scripts/mp/utility/script
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf68
// Size: 0x2a
function _heaprightchild(i) {
    if (!isdefined(self.vals[2 * i + 1])) {
        return undefined;
    }
    return 2 * i + 1;
}

// Namespace script / scripts/mp/utility/script
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9a
// Size: 0x23
function _heapparent(i) {
    if (i == 1) {
        return undefined;
    }
    return int(floor(i / 2));
}

// Namespace script / scripts/mp/utility/script
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc5
// Size: 0x20
function isnumbermultipleof(number, factor) {
    return number > 0 && number % factor == 0;
}

// Namespace script / scripts/mp/utility/script
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfed
// Size: 0x1a
function demoforcesre(message) {
    var_f580de06a1c1891c = message == undefined;
}

