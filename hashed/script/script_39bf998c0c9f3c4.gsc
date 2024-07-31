#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace mp_jup_bigmap_lighting;

// Namespace mp_jup_bigmap_lighting / namespace_55b161d83c1313ca
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa8
// Size: 0x68
function main() {
    setdvar(@"sm_spotDistCull", 1500);
    setdvar(@"sm_spotUpdateLimit", 6);
    setdvar(@"sm_roundRobinPrioritySpotShadows", 8);
    setdvar(@"sm_spotShadowScoreSystem", 1);
    setdvar(@"sm_spotUpdateMoreDynEnt", 1);
    setdvar(@"sm_spotUpdateMoreDynObj", 0);
}

