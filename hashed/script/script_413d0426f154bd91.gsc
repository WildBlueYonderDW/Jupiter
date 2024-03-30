// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace data_tracker;

// Namespace data_tracker / namespace_e82a1efb852543c9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x429
// Size: 0x9
function function_b205b5926c02717f() {
    return function_9c7053f2799c3238();
}

// Namespace data_tracker / namespace_e82a1efb852543c9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43a
// Size: 0x2b
function function_4d1de11b1a5630ec(var_fc27cf5aa6482417) {
    if (!isstruct(var_fc27cf5aa6482417)) {
        /#
            assertmsg("Argument must be of type 'Struct' to be setup as a Data Tracker");
        #/
    }
    function_9c7053f2799c3238(var_fc27cf5aa6482417);
}

// Namespace data_tracker / namespace_e82a1efb852543c9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46c
// Size: 0x41
function function_3234a152a64387c7(dataobject) {
    if (!isdefined(dataobject.uniquename)) {
        /#
            assertmsg("This data object requires a defined 'uniqueName' property in order to be added to this tracker.");
        #/
        return;
    }
    self.dataobjects[dataobject.uniquename] = dataobject;
}

// Namespace data_tracker / namespace_e82a1efb852543c9
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b4
// Size: 0x67
function adddata(var_f22b51105fa16a29, datatype, value, callbackfunction) {
    if (isdefined(self.dataobjects[var_f22b51105fa16a29])) {
        /#
            assertmsg("The data object you are trying to add ( " + var_f22b51105fa16a29 + " ) is already defined in this data tracker.");
        #/
        return;
    }
    dataobject = function_29564ce8dc854f53(var_f22b51105fa16a29, datatype, value, callbackfunction);
    function_3234a152a64387c7(dataobject);
}

// Namespace data_tracker / namespace_e82a1efb852543c9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x522
// Size: 0x4b
function function_b584ae8dddb33821(var_f22b51105fa16a29, value, callbackfunction) {
    if (!isint(value)) {
        /#
            assertmsg("The Add Int Data function was called for the ( " + var_f22b51105fa16a29 + " ) Data Object but value passed in is not an Integer.");
        #/
        return;
    }
    adddata(var_f22b51105fa16a29, "Integer", value, callbackfunction);
}

// Namespace data_tracker / namespace_e82a1efb852543c9
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x574
// Size: 0x4b
function function_a5bdec253a251d2a(var_f22b51105fa16a29, value, callbackfunction) {
    if (!isfloat(value)) {
        /#
            assertmsg("The Add Float Data function was called for the ( " + var_f22b51105fa16a29 + " ) Data Object but value passed in is not a Float.");
        #/
        return;
    }
    adddata(var_f22b51105fa16a29, "Float", value, callbackfunction);
}

// Namespace data_tracker / namespace_e82a1efb852543c9
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5c6
// Size: 0x4b
function function_e39de66971de6959(var_f22b51105fa16a29, value, callbackfunction) {
    if (!isstring(value)) {
        /#
            assertmsg("The Add String Data function was called for the ( " + var_f22b51105fa16a29 + " ) Data Object but value passed in is not a String.");
        #/
        return;
    }
    adddata(var_f22b51105fa16a29, "String", value, callbackfunction);
}

// Namespace data_tracker / namespace_e82a1efb852543c9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x618
// Size: 0x2b
function function_e4b4be816ed43365(var_f22b51105fa16a29, value, callbackfunction) {
    adddata(var_f22b51105fa16a29, "ProgressTracker", value, callbackfunction);
}

// Namespace data_tracker / namespace_e82a1efb852543c9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64a
// Size: 0x17
function removedata(var_f22b51105fa16a29) {
    self.dataobjects[var_f22b51105fa16a29] = undefined;
}

// Namespace data_tracker / namespace_e82a1efb852543c9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x668
// Size: 0x5b
function updatedata(var_9e5a064a346c5b42, updatedvalue) {
    dataobject = self.dataobjects[var_9e5a064a346c5b42];
    if (!isdefined(dataobject)) {
        /#
            assertmsg("The data object you are trying to update ( " + var_9e5a064a346c5b42 + " ) was not found on this data tracker.");
        #/
        return;
    }
    dataobject.value = updatedvalue;
    function_5aa098a0e2a91e3e(var_9e5a064a346c5b42);
}

// Namespace data_tracker / namespace_e82a1efb852543c9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ca
// Size: 0x46
function function_5aa098a0e2a91e3e(var_9e5a064a346c5b42) {
    dataobject = self.dataobjects[var_9e5a064a346c5b42];
    if (!isdefined(dataobject)) {
        /#
            assertmsg("The data object you are trying to report an update for ( " + var_9e5a064a346c5b42 + " ) was not found on this data tracker.");
        #/
        return;
    }
    function_755936e0aeeb43f6(var_9e5a064a346c5b42);
}

// Namespace data_tracker / namespace_e82a1efb852543c9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x717
// Size: 0x3d
function addcallback(callbackfunction, var_1fd2df2315da3137) {
    newcallback = function_72504163d8901997(callbackfunction, var_1fd2df2315da3137);
    self.var_6b6f2974d8fc8810[self.var_6b6f2974d8fc8810.size] = newcallback;
}

// Namespace data_tracker / namespace_e82a1efb852543c9
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x75b
// Size: 0x58
function function_c0a81a4aa88ede55(callbackfunction, var_9e5a064a346c5b42, var_1fd2df2315da3137) {
    dataobject = self.dataobjects[var_9e5a064a346c5b42];
    if (!isdefined(dataobject)) {
        /#
            assertmsg("The data object you are trying to add a callback for ( " + var_9e5a064a346c5b42 + " ) was not found on this data tracker.");
        #/
        return;
    }
    function_18c71d7e16a8c68c(dataobject, callbackfunction, var_1fd2df2315da3137);
}

// Namespace data_tracker / namespace_e82a1efb852543c9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7ba
// Size: 0x6a
function removecallback(callbackfunction) {
    for (callbackid = 0; callbackid < self.var_6b6f2974d8fc8810.size; callbackid++) {
        if (self.var_6b6f2974d8fc8810[callbackid].callbackfunction == callbackfunction) {
            self.var_6b6f2974d8fc8810[callbackid] = undefined;
        }
    }
    self.var_6b6f2974d8fc8810 = array_removeundefined(self.callbacks);
}

// Namespace data_tracker / namespace_e82a1efb852543c9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x82b
// Size: 0xaf
function function_d6f2becdeb4c29be(callbackfunction, var_9e5a064a346c5b42) {
    dataobject = self.dataobjects[var_9e5a064a346c5b42];
    if (!isdefined(dataobject)) {
        /#
            assertmsg("The data object you are trying to remove a callback for ( " + var_9e5a064a346c5b42 + " ) was not found on this data tracker.");
        #/
        return;
    }
    for (callbackid = 0; callbackid < dataobject.callbacks.size; callbackid++) {
        if (dataobject.callbacks[callbackid].callbackfunction == callbackfunction) {
            dataobject.callbacks[callbackid] = undefined;
        }
    }
    dataobject.callbacks = array_removeundefined(dataobject.callbacks);
}

// Namespace data_tracker / namespace_e82a1efb852543c9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e1
// Size: 0x49
function function_e989e3f023f50368(var_9e5a064a346c5b42) {
    dataobject = self.dataobjects[var_9e5a064a346c5b42];
    if (!isdefined(dataobject)) {
        /#
            assertmsg("The data object you are trying to recieve ( " + var_9e5a064a346c5b42 + " ) was not found on this data tracker.");
        #/
        return;
    }
    return dataobject.value;
}

// Namespace data_tracker / namespace_e82a1efb852543c9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x932
// Size: 0x3f
function function_f709e958aa6900(var_9e5a064a346c5b42) {
    dataobject = self.dataobjects[var_9e5a064a346c5b42];
    if (!isdefined(dataobject)) {
        /#
            assertmsg("The data object you are trying to recieve ( " + var_9e5a064a346c5b42 + " ) was not found on this data tracker.");
        #/
        return;
    }
    return dataobject;
}

// Namespace data_tracker / namespace_e82a1efb852543c9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x979
// Size: 0x18
function function_6a26856f16c6a207(var_9e5a064a346c5b42) {
    return isdefined(self.dataobjects[var_9e5a064a346c5b42]);
}

// Namespace data_tracker / namespace_e82a1efb852543c9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x999
// Size: 0x115
function function_755936e0aeeb43f6(var_9e5a064a346c5b42) {
    dataobject = self.dataobjects[var_9e5a064a346c5b42];
    if (!isdefined(dataobject)) {
        /#
            assertmsg("The data object you are trying to run a callback for ( " + var_9e5a064a346c5b42 + " ) was not found on this data tracker.");
        #/
        return;
    }
    foreach (callback in dataobject.callbacks) {
        if (isdefined(callback)) {
            callback.callon thread [[ callback.callbackfunction ]](self, dataobject);
        }
    }
    foreach (callback in self.var_6b6f2974d8fc8810) {
        if (isdefined(callback)) {
            callback.callon thread [[ callback.callbackfunction ]](self, dataobject);
        }
    }
}

// Namespace data_tracker / namespace_e82a1efb852543c9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab5
// Size: 0x17
function function_71667164a3e75714(dataobject) {
    return dataobject.uniquename;
}

// Namespace data_tracker / namespace_e82a1efb852543c9
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xad4
// Size: 0x35
function private function_9c7053f2799c3238(var_9bc4f97e08bcc10e) {
    var_9bc4f97e08bcc10e = default_to(var_9bc4f97e08bcc10e, spawnstruct());
    var_9bc4f97e08bcc10e.dataobjects = [];
    var_9bc4f97e08bcc10e.var_6b6f2974d8fc8810 = [];
    return var_9bc4f97e08bcc10e;
}

// Namespace data_tracker / namespace_e82a1efb852543c9
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb11
// Size: 0x77
function private function_29564ce8dc854f53(uniquename, datatype, value, callbackfunction) {
    dataobject = spawnstruct();
    dataobject.uniquename = uniquename;
    dataobject.datatype = datatype;
    dataobject.value = value;
    dataobject.callbacks = [];
    if (isdefined(callbackfunction)) {
        function_18c71d7e16a8c68c(dataobject, callbackfunction);
    }
    return dataobject;
}

// Namespace data_tracker / namespace_e82a1efb852543c9
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb90
// Size: 0x46
function private function_72504163d8901997(callbackfunction, var_1fd2df2315da3137) {
    newcallback = spawnstruct();
    newcallback.callon = default_to(var_1fd2df2315da3137, level);
    newcallback.callbackfunction = callbackfunction;
    return newcallback;
}

// Namespace data_tracker / namespace_e82a1efb852543c9
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbde
// Size: 0x49
function private function_18c71d7e16a8c68c(dataobject, callbackfunction, var_1fd2df2315da3137) {
    newcallback = function_72504163d8901997(callbackfunction, var_1fd2df2315da3137);
    dataobject.callbacks[dataobject.callbacks.size] = newcallback;
}

