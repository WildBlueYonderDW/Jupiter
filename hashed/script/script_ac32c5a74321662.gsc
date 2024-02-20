// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace namespace_a9f18099144e93ba;

// Namespace namespace_a9f18099144e93ba/namespace_e70871966d53f332
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6
// Size: 0xb
function function_a9a0b485d2e58d71() {
    thread function_524af1d56cb60f38();
}

// Namespace namespace_a9f18099144e93ba/namespace_e70871966d53f332
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8
// Size: 0x22
function function_524af1d56cb60f38() {
    self endon("death");
    while (1) {
        self waittill("float_move_loop_start");
        thread function_43bd4a976c1ed3de();
    }
}

// Namespace namespace_a9f18099144e93ba/namespace_e70871966d53f332
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121
// Size: 0x392
function function_43bd4a976c1ed3de() {
    self endon("death");
    self.var_7177dd881b296d3 = undefined;
    self.var_37ca4842bca3031c = gettime();
    while (1) {
        waitframe();
        if (!isdefined(self.var_17e48b8b7457c) || self.var_17e48b8b7457c.current_index >= self.var_17e48b8b7457c.points.size - 1) {
            clear_float_move();
            return;
        }
        speed = self.var_17e48b8b7457c.speed;
        current_index = self.var_17e48b8b7457c.current_index;
        start_point = self.var_17e48b8b7457c.points[current_index];
        var_be27b40782202cf5 = self.var_17e48b8b7457c.points[current_index + 1];
        delta_z = var_be27b40782202cf5[2] - start_point[2];
        var_db85e7b6b9fb517e = length(var_be27b40782202cf5 - start_point);
        var_35761ff94239aeb5 = length2d(var_be27b40782202cf5 - start_point);
        var_3fc17f20be7dce79 = var_be27b40782202cf5 - self.origin;
        var_545ae14048828eed = length(var_3fc17f20be7dce79);
        var_9a9a0f5df2182638 = length2d(var_3fc17f20be7dce79);
        percentage = 1 - var_545ae14048828eed / var_db85e7b6b9fb517e;
        var_d7bdff7ec44f0654 = 1 - var_9a9a0f5df2182638 / var_35761ff94239aeb5;
        var_c304a1c98f384e89 = 1;
        if (percentage < 0.5) {
            var_c304a1c98f384e89 = 0.7 + easesine(percentage / 0.5, 1, 0) * 0.3;
        } else {
            var_c304a1c98f384e89 = max(1 - easesine((percentage - 0.5) / 0.5, 1, 0), 0.2);
        }
        speed = speed * var_c304a1c98f384e89;
        var_1e6385adc65df44c = (var_3fc17f20be7dce79[0], var_3fc17f20be7dce79[1], 0);
        if (var_545ae14048828eed > self.var_17e48b8b7457c.speed) {
            new_origin = self.origin + vectornormalize(var_1e6385adc65df44c) * speed;
            if (delta_z < var_35761ff94239aeb5) {
                var_75976125852d256a = easesine(var_d7bdff7ec44f0654, 1, 1);
            } else {
                var_75976125852d256a = easepower(var_d7bdff7ec44f0654, 2, 0, 1);
            }
            new_origin = (new_origin[0], new_origin[1], start_point[2] + delta_z * var_75976125852d256a);
        } else {
            new_origin = var_be27b40782202cf5;
            self.var_17e48b8b7457c.current_index = current_index + 1;
        }
        if (isdefined(self.var_7177dd881b296d3)) {
            var_8d6a47defa6cf947 = function_767cea82b001f645(self.origin - self.var_7177dd881b296d3);
            var_25c45ec401562787 = function_767cea82b001f645(new_origin - self.origin);
            var_a82f2dc40e33d7e = function_767cea82b001f645(var_be27b40782202cf5 - start_point);
            var_89ba7239e3c2b0ad = 0.1;
            if (vectordot(var_25c45ec401562787, var_8d6a47defa6cf947) <= var_89ba7239e3c2b0ad || vectordot(var_a82f2dc40e33d7e, var_25c45ec401562787) <= var_89ba7239e3c2b0ad || distance2dsquared(self.origin, self.var_7177dd881b296d3) < 64) {
                self.var_17e48b8b7457c.current_index = self.var_17e48b8b7457c.points.size;
            }
        }
        self forceteleport(new_origin);
        self.var_37ca4842bca3031c = gettime();
        self.var_7177dd881b296d3 = new_origin;
    }
}

// Namespace namespace_a9f18099144e93ba/namespace_e70871966d53f332
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ba
// Size: 0x96
function function_9eaaa0a5c40b2c19(goal, speed) {
    if (!isdefined(self.var_17e48b8b7457c)) {
        self.var_17e48b8b7457c = spawnstruct();
    }
    self.var_17e48b8b7457c.points = [0:self.origin, 1:goal];
    self.var_17e48b8b7457c.current_index = 0;
    self.var_17e48b8b7457c.speed = function_53c4c53197386572(speed, 6);
    self function_3e89eb3d8e3f1811("in_float_move", 1);
}

// Namespace namespace_a9f18099144e93ba/namespace_e70871966d53f332
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x557
// Size: 0x2b
function clear_float_move() {
    self.var_17e48b8b7457c = undefined;
    self.var_37ca4842bca3031c = undefined;
    self function_4b733566e92d899e("in_float_move");
    self notify("clear_float_move");
}

// Namespace namespace_a9f18099144e93ba/namespace_e70871966d53f332
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x589
// Size: 0x96
function function_c73058e4f180cbff(goal, speed) {
    /#
        assert(isdefined(self.var_17e48b8b7457c), "This function muse be called after request_float_move_goal");
    #/
    self.var_17e48b8b7457c.points = [0:self.origin, 1:goal];
    self.var_17e48b8b7457c.current_index = 0;
    self.var_17e48b8b7457c.speed = function_53c4c53197386572(speed, self.var_17e48b8b7457c.speed);
}

