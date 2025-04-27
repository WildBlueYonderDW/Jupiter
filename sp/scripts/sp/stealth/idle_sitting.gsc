#namespace idle_sitting;

// Namespace idle_sitting / scripts\sp\stealth\idle_sitting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27e
// Size: 0x2b
function main()
{
    if ( isdefined( level.scr_anim ) && isdefined( level.scr_anim[ "idle_chair" ] ) )
    {
        return;
    }
    
    script_model();
}

// Namespace idle_sitting / scripts\sp\stealth\idle_sitting
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b1
// Size: 0x121
function script_model()
{
    level.scr_animtree[ "idle_chair" ] = #script_model;
    level.scr_model[ "idle_chair" ] = "cp_disco_folding_chair_lod0";
    level.scr_anim[ "idle_chair" ][ "sit_sleeping_react" ] = script_model#reb_stl_idle_sit_sleeping_react_chair;
    level.scr_anim[ "idle_chair" ][ "sit_sleeping_death" ] = script_model#reb_stl_idle_sit_sleeping_death01_chair;
    level.scr_anim[ "idle_chair" ][ "sit_cellphone_react" ] = script_model#reb_stl_idle_sit_phone01_react_chair;
    level.scr_anim[ "idle_chair" ][ "sit_cellphone_death" ] = script_model#reb_stl_idle_sit_phone01_death02_4_chair;
    level.scr_anim[ "idle_chair" ][ "sit_laptop_react" ] = script_model#reb_stl_idle_sit_laptop_react_chair;
    level.scr_anim[ "idle_chair" ][ "sit_laptop_death" ] = script_model#reb_stl_idle_sit_laptop_death02_2_chair;
    level.scr_anim[ "idle_chair" ][ "sit_pistol_clean_react" ] = script_model#reb_stl_idle_sit_gunmaintenance_react_chair;
    level.scr_anim[ "idle_chair" ][ "sit_pistol_clean_death" ] = script_model#reb_stl_idle_sit_gunmaintenance_death01_6_chair;
}

