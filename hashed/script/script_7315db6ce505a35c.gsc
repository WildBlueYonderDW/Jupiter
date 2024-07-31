#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_272a9e863ed9d98f;

// Namespace namespace_272a9e863ed9d98f / namespace_497591ecd8577392
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa8
// Size: 0xd7
function main() {
    setdvar(@"sm_spotDistCull", 1500);
    setdvar(@"sm_spotUpdateLimit", 6);
    setdvar(@"sm_roundRobinPrioritySpotShadows", 8);
    setdvar(@"sm_spotUpdateLimitDynLight", 2);
    setdvar(@"sm_spotShadowScoreSystem", 1);
    setdvar(@"sm_spotUpdateMoreDynEnt", 1);
    setdvar(@"sm_spotUpdateMoreDynObj", 0);
    setdvar(@"sm_sunSampleSizeNear", 0.45);
    setdvar(@"sm_sunCascadeSizeMultiplier1", 2);
    setdvar(@"sm_sunCascadeSizeMultiplier2", 3);
    setdvar(@"hash_924d46a5bf2c1f5d", 1.2);
    setdvar(@"hash_a32719b6bbd25f1e", 1.5);
}

