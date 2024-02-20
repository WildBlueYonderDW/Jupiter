// mwiii decomp prototype
#using scripts\aitypes\bt_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\asm\gesture.gsc;

#namespace namespace_cbce62193111f79;

// Namespace namespace_cbce62193111f79/namespace_a3bb9840357a7ef2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9
// Size: 0xbe
function function_5ad32ab5f21ddf93(statename, params) {
    id = self function_92435c7a6ae85c3c();
    if (params.size == 1) {
        thread namespace_d3b312ec98e9299b::ai_request_gesture(params[0], undefined, undefined, "gesture");
    } else if (params.size == 2) {
        thread namespace_d3b312ec98e9299b::ai_request_gesture(params[0], params[1], undefined, "gesture");
    } else if (params.size == 3) {
        thread namespace_d3b312ec98e9299b::ai_request_gesture(params[0], params[1], params[2], "gesture");
    } else if (params.size == 4) {
        thread namespace_d3b312ec98e9299b::ai_request_gesture(params[0], params[1], params[2], params[3]);
    } else {
        /#
            assertmsg("ExecuteGesture expecting params array of size 4 or less. Found " + params.size + " params.");
        #/
    }
}

