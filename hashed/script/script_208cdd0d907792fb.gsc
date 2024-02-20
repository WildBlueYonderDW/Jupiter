// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace queue;

// Namespace queue/namespace_8a4eb35e306940ad
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0xf9
// Size: 0xf9
function function_e6d5d1b10a962759(queue, ref, init_func, var_907b57cdaa15c02b, var_37b6c31d32f83553, var_a44c6ed0a478179, var_d788f3fc2e260fea, priority, duration, var_bc4e6b0234ca62b8) {
    item = spawnstruct();
    item.ref = function_53c4c53197386572(ref, "default");
    item.init_func = init_func;
    item.var_907b57cdaa15c02b = var_907b57cdaa15c02b;
    item.var_37b6c31d32f83553 = var_37b6c31d32f83553;
    item.var_a44c6ed0a478179 = var_a44c6ed0a478179;
    item.var_d788f3fc2e260fea = var_d788f3fc2e260fea;
    item.priority = function_53c4c53197386572(priority, 0);
    item.duration = duration;
    item.var_bc4e6b0234ca62b8 = var_bc4e6b0234ca62b8;
    function_ffbf82197897dac9(queue, item);
}

// Namespace queue/namespace_8a4eb35e306940ad
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f9
// Size: 0x299
function function_ffbf82197897dac9(queue, item) {
    if (!isdefined(self.var_fd776bf3ffd9d44e)) {
        self.var_fd776bf3ffd9d44e = [];
    }
    if (!isdefined(self.var_fd776bf3ffd9d44e[queue])) {
        self.var_fd776bf3ffd9d44e[queue] = spawnstruct();
    }
    item.ref = function_53c4c53197386572(item.ref, "default");
    item.priority = function_53c4c53197386572(item.priority, 0);
    if (!isdefined(self.var_fd776bf3ffd9d44e[queue].items) || self.var_fd776bf3ffd9d44e[queue].items.size == 0) {
        self.var_fd776bf3ffd9d44e[queue].items = [];
        self.var_fd776bf3ffd9d44e[queue].items[0] = item;
        thread function_a21a0cb1935daf63(queue);
    } else {
        index = self.var_fd776bf3ffd9d44e[queue].items.size;
        var_5f6f31dcc4c46aca = 0;
        foreach (idx, data in self.var_fd776bf3ffd9d44e[queue].items) {
            if (item.ref != "default" && item.ref == data.ref) {
                if (idx == 0) {
                    /#
                        assert("Updating " + item.ref + " in queue " + queue + " while it is the currently active queue item");
                    #/
                    return;
                }
                self.var_fd776bf3ffd9d44e[queue].items[idx] = item;
                var_5f6f31dcc4c46aca = 1;
                break;
            }
            if (!isdefined(index) && item.priority > data.priority) {
                index = idx;
            }
        }
        if (!var_5f6f31dcc4c46aca && isdefined(index)) {
            self.var_fd776bf3ffd9d44e[queue].items = array_insert(self.var_fd776bf3ffd9d44e[queue].items, item, index);
            if (index == 0) {
                thread function_b4f70eec2b62bbc5(queue, self.var_fd776bf3ffd9d44e[queue].items[1]);
            }
        }
    }
}

// Namespace queue/namespace_8a4eb35e306940ad
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x499
// Size: 0xc9
function function_46d80f020560ce6(queue, ref) {
    if (isdefined(self.var_fd776bf3ffd9d44e) && isdefined(self.var_fd776bf3ffd9d44e[queue])) {
        for (i = self.var_fd776bf3ffd9d44e[queue].items.size - 1; i >= 0; i--) {
            if (self.var_fd776bf3ffd9d44e[queue].items[i].ref == ref) {
                self.var_fd776bf3ffd9d44e[queue].items = array_remove_index(self.var_fd776bf3ffd9d44e[queue].items, i);
                if (i == 0) {
                    self notify(queue + "_removed");
                }
            }
        }
    }
}

// Namespace queue/namespace_8a4eb35e306940ad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x569
// Size: 0x59
function function_5bf3778b0956a0ab(queue) {
    if (isdefined(self.var_fd776bf3ffd9d44e) && isdefined(self.var_fd776bf3ffd9d44e[queue])) {
        if (self.var_fd776bf3ffd9d44e[queue].items.size > 0) {
            self notify(queue + "_removed");
        }
        self.var_fd776bf3ffd9d44e[queue] = undefined;
    }
}

// Namespace queue/namespace_8a4eb35e306940ad
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5c9
// Size: 0x294
function private function_a21a0cb1935daf63(queue) {
    self endon("death");
    self endon("entitydeleted");
    while (isdefined(self.var_fd776bf3ffd9d44e[queue]) && self.var_fd776bf3ffd9d44e[queue].items.size > 0) {
        item = self.var_fd776bf3ffd9d44e[queue].items[0];
        item.start_time = gettime();
        if (isdefined(item.var_907b57cdaa15c02b) && self [[ item.var_907b57cdaa15c02b ]](item.var_d788f3fc2e260fea, item.start_time, 1)) {
            self.var_fd776bf3ffd9d44e[queue].items = array_remove_index(self.var_fd776bf3ffd9d44e[queue].items, 0);
            continue;
        }
        if (isdefined(item.init_func)) {
            self thread [[ item.init_func ]](item.var_d788f3fc2e260fea, item.start_time, [0:queue + "_removed", 1:queue + "_interrupted", 2:queue + "_done"]);
        }
        if (isdefined(item.var_907b57cdaa15c02b)) {
            childthread function_83c2eeef11738a5d(queue, item);
        }
        ret = undefined;
        if (isdefined(item.duration)) {
            if (isdefined(item.var_bc4e6b0234ca62b8)) {
                ret = waittill_any_timeout_4(item.duration, item.var_bc4e6b0234ca62b8, queue + "_break", queue + "_removed", queue + "_interrupted");
            } else {
                ret = waittill_any_timeout_3(item.duration, queue + "_break", queue + "_removed", queue + "_interrupted");
            }
        } else if (isdefined(item.var_bc4e6b0234ca62b8)) {
            ret = waittill_any_return_4(item.var_bc4e6b0234ca62b8, queue + "_break", queue + "_removed", queue + "_interrupted");
        } else {
            ret = waittill_any_return_3(queue + "_break", queue + "_removed", queue + "_interrupted");
        }
        if (ret == "timeout" || ret == queue + "_break" || isdefined(item.var_bc4e6b0234ca62b8) && ret == item.var_bc4e6b0234ca62b8) {
            function_e4f3902eebc8816d(queue, item);
        } else if (ret == queue + "_removed") {
            function_b4f70eec2b62bbc5(queue, item);
        }
    }
}

// Namespace queue/namespace_8a4eb35e306940ad
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x864
// Size: 0x64
function private function_83c2eeef11738a5d(queue, item) {
    self endon(queue + "_done");
    self endon(queue + "_removed");
    self endon(queue + "_interrupted");
    while (!self [[ item.var_907b57cdaa15c02b ]](item.var_d788f3fc2e260fea, item.start_time)) {
        waitframe();
    }
    self notify(queue + "_break");
}

// Namespace queue/namespace_8a4eb35e306940ad
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x8cf
// Size: 0x53
function private function_b4f70eec2b62bbc5(queue, item) {
    if (isdefined(item.var_37b6c31d32f83553)) {
        self thread [[ item.var_37b6c31d32f83553 ]](item.var_d788f3fc2e260fea, item.start_time);
    }
    self notify(queue + "_interrupted");
}

// Namespace queue/namespace_8a4eb35e306940ad
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x929
// Size: 0x85
function private function_e4f3902eebc8816d(queue, item) {
    if (isdefined(item.var_a44c6ed0a478179)) {
        self thread [[ item.var_a44c6ed0a478179 ]](item.var_d788f3fc2e260fea, item.start_time);
    }
    self notify(queue + "_done");
    self.var_fd776bf3ffd9d44e[queue].items = array_remove_index(self.var_fd776bf3ffd9d44e[queue].items, 0);
}

