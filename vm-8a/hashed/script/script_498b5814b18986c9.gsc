#using scripts\engine\utility.gsc;
#using scripts\cp_mp\gasmask.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_4b87f2871b6b025c;

#namespace namespace_119c80c54f2f80e1;

// Namespace namespace_119c80c54f2f80e1 / namespace_7c996eebd51b5b1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c
// Size: 0x86
function init() {
    scripts\engine\utility::registersharedfunc("scubaGasMask", "hasScubaGasMask", &hasScubaGasMask);
    scripts\engine\utility::registersharedfunc("scubaGasMask", "isScubaGasMaskEquipped", &isScubaGasMaskEquipped);
    scripts\engine\utility::registersharedfunc("scubaGasMask", "removeScubaGasMaskFromPlayer", &removeScubaGasMaskFromPlayer);
    scripts\engine\utility::registersharedfunc("scubaGasMask", "updateScubaGasmask", &updateScubaGasmask);
    scripts\engine\utility::registersharedfunc("scubaGasMask", "monitorScubaGasMaskDamage", &function_4e41bf5f9d46e115);
    scripts\engine\utility::registersharedfunc("scubaGasMask", "isUsingScubaGasMask", &isUsingScubaGasMask);
}

// Namespace namespace_119c80c54f2f80e1 / namespace_7c996eebd51b5b1f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1fa
// Size: 0x15
function private isUsingScubaGasMask(player) {
    return istrue(self.var_5239162658be30d6);
}

// Namespace namespace_119c80c54f2f80e1 / namespace_7c996eebd51b5b1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x218
// Size: 0x1d
function hasScubaGasMask(player) {
    return isUsingScubaGasMask(player) && scripts\cp_mp\gasmask::hasgasmask(player);
}

// Namespace namespace_119c80c54f2f80e1 / namespace_7c996eebd51b5b1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23e
// Size: 0x1d
function isScubaGasMaskEquipped(player) {
    return hasScubaGasMask(player) && scripts\cp_mp\gasmask::function_260708c89a11f0c3(player);
}

// Namespace namespace_119c80c54f2f80e1 / namespace_7c996eebd51b5b1f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x264
// Size: 0x20
function removeScubaGasMaskFromPlayer(player) {
    if (hasScubaGasMask(player)) {
        player.var_5239162658be30d6 = undefined;
    }
}

// Namespace namespace_119c80c54f2f80e1 / namespace_7c996eebd51b5b1f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c
// Size: 0x33
function updateScubaGasmask(player, isunderwater) {
    if (isdefined(player) && isdefined(player.origin)) {
        level thread function_9c13c9f95161d576(player, isunderwater);
    }
}

// Namespace namespace_119c80c54f2f80e1 / namespace_7c996eebd51b5b1f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c7
// Size: 0x6c
function function_9c13c9f95161d576(player, isunderwater) {
    player endon("death_or_disconnect");
    player notify("queue_scuba");
    player endon("queue_scuba");
    level endon("game_ended");
    while (true) {
        if (!istrue(player.gasmaskswapinprogress)) {
            break;
        }
        waitframe();
    }
    if (isunderwater) {
        player scripts\mp\gametypes\br_pickups::function_cdf7f2f6bd3207("underwater");
        return;
    }
    player scripts\mp\gametypes\br_pickups::function_8206bc54a1ed73cb("underwater");
}

// Namespace namespace_119c80c54f2f80e1 / namespace_7c996eebd51b5b1f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33b
// Size: 0x99
function function_4e41bf5f9d46e115() {
    self endon("death_or_disconnect");
    self endon("swim_breathing_disabled_end");
    level endon("game_ended");
    var_9b7983c73df8b968 = getdvarfloat(@"hash_4a852245a5077873", 1);
    var_76e563db5d11a0ea = getdvarfloat(@"hash_8d16d3f760df5419", 0.857);
    while (true) {
        if (!namespace_8ade6bdb04213c12::isplayerunderwater()) {
            break;
        }
        if (!hasScubaGasMask(self)) {
            break;
        }
        if (isdefined(self.origin) && !istrue(self.plotarmor)) {
            scripts\cp_mp\gasmask::processdamage(var_76e563db5d11a0ea);
        }
        wait var_9b7983c73df8b968;
    }
}

