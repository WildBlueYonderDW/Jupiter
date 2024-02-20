// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_4e0147999438b62;

// Namespace namespace_4e0147999438b62/namespace_e82a1efb852543c9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x429
// Size: 0x9
function function_b205b5926c02717f() {
    return function_9c7053f2799c3238();
}

// Namespace namespace_4e0147999438b62/namespace_e82a1efb852543c9
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

// Namespace namespace_4e0147999438b62/namespace_e82a1efb852543c9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46c
// Size: 0x41
function function_3234a152a64387c7(var_c8796b66a6b3c07e) {
    if (!isdefined(var_c8796b66a6b3c07e.var_d389f1191e609479)) {
        /#
            assertmsg("This data object requires a defined 'uniqueName' property in order to be added to this tracker.");
        #/
        return;
    }
    self.var_96c73fc09d4f5c97[var_c8796b66a6b3c07e.var_d389f1191e609479] = var_c8796b66a6b3c07e;
}

// Namespace namespace_4e0147999438b62/namespace_e82a1efb852543c9
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b4
// Size: 0x67
function function_7d5b3426b48d62f0(var_f22b51105fa16a29, datatype, value, callbackfunction) {
    if (isdefined(self.var_96c73fc09d4f5c97[var_f22b51105fa16a29])) {
        /#
            assertmsg("The data object you are trying to add ( " + var_f22b51105fa16a29 + " ) is already defined in this data tracker.");
        #/
        return;
    }
    var_c8796b66a6b3c07e = function_29564ce8dc854f53(var_f22b51105fa16a29, datatype, value, callbackfunction);
    function_3234a152a64387c7(var_c8796b66a6b3c07e);
}

// Namespace namespace_4e0147999438b62/namespace_e82a1efb852543c9
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
    function_7d5b3426b48d62f0(var_f22b51105fa16a29, "Integer", value, callbackfunction);
}

// Namespace namespace_4e0147999438b62/namespace_e82a1efb852543c9
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
    function_7d5b3426b48d62f0(var_f22b51105fa16a29, "Float", value, callbackfunction);
}

// Namespace namespace_4e0147999438b62/namespace_e82a1efb852543c9
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
    function_7d5b3426b48d62f0(var_f22b51105fa16a29, "String", value, callbackfunction);
}

// Namespace namespace_4e0147999438b62/namespace_e82a1efb852543c9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x618
// Size: 0x2b
function function_e4b4be816ed43365(var_f22b51105fa16a29, value, callbackfunction) {
    function_7d5b3426b48d62f0(var_f22b51105fa16a29, "ProgressTracker", value, callbackfunction);
}

// Namespace namespace_4e0147999438b62/namespace_e82a1efb852543c9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64a
// Size: 0x17
function function_7548a706b47c1eb1(var_f22b51105fa16a29) {
    self.var_96c73fc09d4f5c97[var_f22b51105fa16a29] = undefined;
}

// Namespace namespace_4e0147999438b62/namespace_e82a1efb852543c9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x668
// Size: 0x5b
function function_db95dd6225b6add8(var_9e5a064a346c5b42, var_d889caaf0d7655) {
    var_c8796b66a6b3c07e = self.var_96c73fc09d4f5c97[var_9e5a064a346c5b42];
    if (!isdefined(var_c8796b66a6b3c07e)) {
        /#
            assertmsg("The data object you are trying to update ( " + var_9e5a064a346c5b42 + " ) was not found on this data tracker.");
        #/
        return;
    }
    var_c8796b66a6b3c07e.value = var_d889caaf0d7655;
    function_5aa098a0e2a91e3e(var_9e5a064a346c5b42);
}

// Namespace namespace_4e0147999438b62/namespace_e82a1efb852543c9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ca
// Size: 0x46
function function_5aa098a0e2a91e3e(var_9e5a064a346c5b42) {
    var_c8796b66a6b3c07e = self.var_96c73fc09d4f5c97[var_9e5a064a346c5b42];
    if (!isdefined(var_c8796b66a6b3c07e)) {
        /#
            assertmsg("The data object you are trying to report an update for ( " + var_9e5a064a346c5b42 + " ) was not found on this data tracker.");
        #/
        return;
    }
    function_755936e0aeeb43f6(var_9e5a064a346c5b42);
}

// Namespace namespace_4e0147999438b62/namespace_e82a1efb852543c9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x717
// Size: 0x3d
function function_af4d87f338d86a53(callbackfunction, var_1fd2df2315da3137) {
    var_a4857eabc50be3ce = function_72504163d8901997(callbackfunction, var_1fd2df2315da3137);
    self.var_6b6f2974d8fc8810[self.var_6b6f2974d8fc8810.size] = var_a4857eabc50be3ce;
}

// Namespace namespace_4e0147999438b62/namespace_e82a1efb852543c9
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x75b
// Size: 0x58
function function_c0a81a4aa88ede55(callbackfunction, var_9e5a064a346c5b42, var_1fd2df2315da3137) {
    var_c8796b66a6b3c07e = self.var_96c73fc09d4f5c97[var_9e5a064a346c5b42];
    if (!isdefined(var_c8796b66a6b3c07e)) {
        /#
            assertmsg("The data object you are trying to add a callback for ( " + var_9e5a064a346c5b42 + " ) was not found on this data tracker.");
        #/
        return;
    }
    function_18c71d7e16a8c68c(var_c8796b66a6b3c07e, callbackfunction, var_1fd2df2315da3137);
}

// Namespace namespace_4e0147999438b62/namespace_e82a1efb852543c9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7ba
// Size: 0x6a
function function_31ab61e6884f3bc2(callbackfunction) {
    for (var_ac07eee564e51c5f = 0; var_ac07eee564e51c5f < self.var_6b6f2974d8fc8810.size; var_ac07eee564e51c5f++) {
        if (self.var_6b6f2974d8fc8810[var_ac07eee564e51c5f].callbackfunction == callbackfunction) {
            self.var_6b6f2974d8fc8810[var_ac07eee564e51c5f] = undefined;
        }
    }
    self.var_6b6f2974d8fc8810 = array_removeundefined(self.callbacks);
}

// Namespace namespace_4e0147999438b62/namespace_e82a1efb852543c9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x82b
// Size: 0xaf
function function_d6f2becdeb4c29be(callbackfunction, var_9e5a064a346c5b42) {
    var_c8796b66a6b3c07e = self.var_96c73fc09d4f5c97[var_9e5a064a346c5b42];
    if (!isdefined(var_c8796b66a6b3c07e)) {
        /#
            assertmsg("The data object you are trying to remove a callback for ( " + var_9e5a064a346c5b42 + " ) was not found on this data tracker.");
        #/
        return;
    }
    for (var_ac07eee564e51c5f = 0; var_ac07eee564e51c5f < var_c8796b66a6b3c07e.callbacks.size; var_ac07eee564e51c5f++) {
        if (var_c8796b66a6b3c07e.callbacks[var_ac07eee564e51c5f].callbackfunction == callbackfunction) {
            var_c8796b66a6b3c07e.callbacks[var_ac07eee564e51c5f] = undefined;
        }
    }
    var_c8796b66a6b3c07e.callbacks = array_removeundefined(var_c8796b66a6b3c07e.callbacks);
}

// Namespace namespace_4e0147999438b62/namespace_e82a1efb852543c9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e1
// Size: 0x49
function function_e989e3f023f50368(var_9e5a064a346c5b42) {
    var_c8796b66a6b3c07e = self.var_96c73fc09d4f5c97[var_9e5a064a346c5b42];
    if (!isdefined(var_c8796b66a6b3c07e)) {
        /#
            assertmsg("The data object you are trying to recieve ( " + var_9e5a064a346c5b42 + " ) was not found on this data tracker.");
        #/
        return;
    }
    return var_c8796b66a6b3c07e.value;
}

// Namespace namespace_4e0147999438b62/namespace_e82a1efb852543c9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x932
// Size: 0x3f
function function_f709e958aa6900(var_9e5a064a346c5b42) {
    var_c8796b66a6b3c07e = self.var_96c73fc09d4f5c97[var_9e5a064a346c5b42];
    if (!isdefined(var_c8796b66a6b3c07e)) {
        /#
            assertmsg("The data object you are trying to recieve ( " + var_9e5a064a346c5b42 + " ) was not found on this data tracker.");
        #/
        return;
    }
    return var_c8796b66a6b3c07e;
}

// Namespace namespace_4e0147999438b62/namespace_e82a1efb852543c9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x979
// Size: 0x18
function function_6a26856f16c6a207(var_9e5a064a346c5b42) {
    return isdefined(self.var_96c73fc09d4f5c97[var_9e5a064a346c5b42]);
}

// Namespace namespace_4e0147999438b62/namespace_e82a1efb852543c9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x999
// Size: 0x115
function function_755936e0aeeb43f6(var_9e5a064a346c5b42) {
    var_c8796b66a6b3c07e = self.var_96c73fc09d4f5c97[var_9e5a064a346c5b42];
    if (!isdefined(var_c8796b66a6b3c07e)) {
        /#
            assertmsg("The data object you are trying to run a callback for ( " + var_9e5a064a346c5b42 + " ) was not found on this data tracker.");
        #/
        return;
    }
    foreach (callback in var_c8796b66a6b3c07e.callbacks) {
        if (isdefined(callback)) {
            callback.var_436a7c95a01e8480 thread [[ callback.callbackfunction ]](self, var_c8796b66a6b3c07e);
        }
    }
    foreach (callback in self.var_6b6f2974d8fc8810) {
        if (isdefined(callback)) {
            callback.var_436a7c95a01e8480 thread [[ callback.callbackfunction ]](self, var_c8796b66a6b3c07e);
        }
    }
}

// Namespace namespace_4e0147999438b62/namespace_e82a1efb852543c9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab5
// Size: 0x17
function function_71667164a3e75714(var_c8796b66a6b3c07e) {
    return var_c8796b66a6b3c07e.var_d389f1191e609479;
}

// Namespace namespace_4e0147999438b62/namespace_e82a1efb852543c9
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xad4
// Size: 0x35
function private function_9c7053f2799c3238(var_9bc4f97e08bcc10e) {
    var_9bc4f97e08bcc10e = function_53c4c53197386572(var_9bc4f97e08bcc10e, spawnstruct());
    var_9bc4f97e08bcc10e.var_96c73fc09d4f5c97 = [];
    var_9bc4f97e08bcc10e.var_6b6f2974d8fc8810 = [];
    return var_9bc4f97e08bcc10e;
}

// Namespace namespace_4e0147999438b62/namespace_e82a1efb852543c9
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb11
// Size: 0x77
function private function_29564ce8dc854f53(var_d389f1191e609479, datatype, value, callbackfunction) {
    var_c8796b66a6b3c07e = spawnstruct();
    var_c8796b66a6b3c07e.var_d389f1191e609479 = var_d389f1191e609479;
    var_c8796b66a6b3c07e.datatype = datatype;
    var_c8796b66a6b3c07e.value = value;
    var_c8796b66a6b3c07e.callbacks = [];
    if (isdefined(callbackfunction)) {
        function_18c71d7e16a8c68c(var_c8796b66a6b3c07e, callbackfunction);
    }
    return var_c8796b66a6b3c07e;
}

// Namespace namespace_4e0147999438b62/namespace_e82a1efb852543c9
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb90
// Size: 0x46
function private function_72504163d8901997(callbackfunction, var_1fd2df2315da3137) {
    var_a4857eabc50be3ce = spawnstruct();
    var_a4857eabc50be3ce.var_436a7c95a01e8480 = function_53c4c53197386572(var_1fd2df2315da3137, level);
    var_a4857eabc50be3ce.callbackfunction = callbackfunction;
    return var_a4857eabc50be3ce;
}

// Namespace namespace_4e0147999438b62/namespace_e82a1efb852543c9
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbde
// Size: 0x49
function private function_18c71d7e16a8c68c(var_c8796b66a6b3c07e, callbackfunction, var_1fd2df2315da3137) {
    var_a4857eabc50be3ce = function_72504163d8901997(callbackfunction, var_1fd2df2315da3137);
    var_c8796b66a6b3c07e.callbacks[var_c8796b66a6b3c07e.callbacks.size] = var_a4857eabc50be3ce;
}

