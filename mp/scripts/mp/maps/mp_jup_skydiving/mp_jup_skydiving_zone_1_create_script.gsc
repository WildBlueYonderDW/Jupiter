#using scripts\common\create_script_utility;
#using scripts\engine\utility;

#namespace mp_jup_skydiving_zone_1_create_script;

// Namespace mp_jup_skydiving_zone_1_create_script / scripts\mp\maps\mp_jup_skydiving\mp_jup_skydiving_zone_1_create_script
// Params 2
// Checksum 0x0, Offset: 0xa5e
// Size: 0x6d
function main( unused, us )
{
    if ( flag_exist( "mp_jup_skydiving_zone_1_create_script" ) )
    {
        return;
    }
    
    if ( !isdefined( us ) )
    {
        us = function_b055d49370405173();
    }
    
    flag_init( "mp_jup_skydiving_zone_1_create_script" );
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag( us, s, "mp_jup_skydiving_zone_1_create_script" );
    
    if ( !cs_is_starttime() )
    {
        endcreatescript( s );
    }
}

// Namespace mp_jup_skydiving_zone_1_create_script / scripts\mp\maps\mp_jup_skydiving\mp_jup_skydiving_zone_1_create_script
// Params 3
// Checksum 0x0, Offset: 0xad3
// Size: 0x67
function cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( "game_ended" );
    wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s cs_setup_arrays( us, "mp_jup_skydiving_zone_1_create_script" );
    cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread wait_for_flags( s, "mp_jup_skydiving_zone_1_create_script" );
}

// Namespace mp_jup_skydiving_zone_1_create_script / scripts\mp\maps\mp_jup_skydiving\mp_jup_skydiving_zone_1_create_script
// Params 3
// Checksum 0x0, Offset: 0xb42
// Size: 0x280d
function createstructs( fe, us, cf )
{
    f = &strike_additem;
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 35 );
    s.script_decel = float( 35 );
    s.script_helitype = "ahotel64";
    fe [[ f ]]( s, us, cf, ( -15230, -22440.5, 7091.5 ), ( 0, 22.4, 0 ), undefined, "cspf_0_auto12993791687720619241", "heli_around_1" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -11061.5, -22177, 6845.5 ), ( 0, 341.88, 0 ), "cspf_0_auto12993791687720619241", "cspf_0_auto8289932097378646951" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "missile";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -9543, -23415.5, 6845.5 ), ( 0, 319.35, 0 ), "cspf_0_auto8289932097378646951", "cspf_0_auto11096627035048181314", undefined, undefined, undefined, undefined, undefined, undefined, 60 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "flare";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -9883.8, -25456.6, 6378 ), ( 0, 285.11, 0 ), "cspf_0_auto11096627035048181314", "cspf_0_auto2081961213283491896", undefined, undefined, undefined, undefined, undefined, undefined, 30 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "turret";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -10031.3, -26879.6, 6378 ), ( 0, 258.57, 0 ), "cspf_0_auto2081961213283491896", "cspf_0_auto12875170836677714620", undefined, undefined, undefined, undefined, undefined, undefined, 20 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_crash = "ahotel64";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -11260.3, -27861.6, 6378 ), ( 0, 217.53, 0 ), "cspf_0_auto12875170836677714620", "cspf_0_auto16385460807829844561", undefined, undefined, undefined, undefined, undefined, undefined, 120 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_decel = float( 60 );
    s.script_helitype = "blima";
    fe [[ f ]]( s, us, cf, ( -16575, -23318.5, 7091.5 ), ( 0, 316.85, 0 ), undefined, "cspf_0_auto16030538556107383891", "heli_around_2" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    fe [[ f ]]( s, us, cf, ( -5648, -32719.5, 4779.91 ), ( 0, 124.04, 0 ), "heli_sam_spawn_point" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "flare";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -14629, -25308, 6717.5 ), ( 0, 318.65, 0 ), "cspf_0_auto16030538556107383891", "cspf_0_auto16345865707175029890" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_crash = "blima";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -12710, -27505, 6204.5 ), ( 0, 318.65, 0 ), "cspf_0_auto16345865707175029890", "cspf_0_auto5426361235478861891" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -28179.3, -35563.6, 3637.5 ), ( 0, 217.53, 0 ), "cspf_0_auto16385460807829844561", undefined, undefined, undefined, undefined, undefined, undefined, undefined, 120 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( 8345.5, -46036, 3244.5 ), ( 0, 318.65, 0 ), "cspf_0_auto5426361235478861891" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_decel = float( 60 );
    s.script_helitype = "palfa";
    fe [[ f ]]( s, us, cf, ( -17138.5, -24790, 7091.5 ), ( 0, 3.27, 0 ), undefined, "cspf_0_auto12445580412307372144", "heli_halo", undefined, undefined, undefined, undefined, undefined, 40 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "halo";
    s.script_decel = float( 60 );
    s.script_helitype = "palfa";
    fe [[ f ]]( s, us, cf, ( -12055.5, -25649.5, 6057.5 ), ( 0, 354.92, 0 ), "cspf_0_auto12445580412307372144", "cspf_0_auto9063874278890484416", "halo_point", undefined, undefined, undefined, undefined, undefined, 5 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_decel = float( 60 );
    s.script_helitype = "palfa";
    fe [[ f ]]( s, us, cf, ( -10222.5, -25993.5, 6057.5 ), ( 0, 354.92, 0 ), "cspf_0_auto9063874278890484416", "cspf_0_auto10295911286143181338", undefined, undefined, undefined, undefined, undefined, undefined, 60 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_decel = float( 60 );
    s.script_helitype = "palfa";
    fe [[ f ]]( s, us, cf, ( 11937.5, -27916.5, 6057.5 ), ( 0, 354.92, 0 ), "cspf_0_auto10295911286143181338", undefined, undefined, undefined, undefined, undefined, undefined, undefined, 60 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 35 );
    s.script_decel = float( 35 );
    s.script_helitype = "ahotel64";
    fe [[ f ]]( s, us, cf, ( -6615.39, -28760.8, 4982.56 ), ( 12.95, 163.75, 6.67 ), undefined, "cspf_0_auto16797642471356842838", "heli_crash_building" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    fe [[ f ]]( s, us, cf, ( -18043, -27486.5, 1762.5 ), ( 359.14, 309.01, -0.07 ), "halo_point" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "flare";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -9364.5, -28511.2, 4654.45 ), ( 11.74, 171.9, 6.07 ), "cspf_0_auto16797642471356842838", "cspf_0_auto10186324421749351995", undefined, undefined, undefined, undefined, undefined, undefined, 50 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -11197.8, -28268.6, 4441.5 ), ( 2.02, 170.88, 5.95 ), "cspf_0_auto10186324421749351995", "cspf_0_auto1875204050035784415", undefined, undefined, undefined, undefined, undefined, undefined, 50 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_crash = "hit_building";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -12574.5, -27894.4, 4405.83 ), ( 3.28, 158.19, 5.36 ), "cspf_0_auto1875204050035784415", "cspf_0_auto10543453584268288090", undefined, undefined, undefined, undefined, undefined, undefined, 30 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -14270.8, -24737.1, 4050 ), ( 2.3, 168.24, 5.85 ), "cspf_0_auto10543453584268288090", "cspf_0_auto8838264480580303533", undefined, undefined, undefined, undefined, undefined, undefined, 120 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -16288.3, -15856.1, 4266.5 ), ( 2.3, 168.24, 5.85 ), "cspf_0_auto8838264480580303533", undefined, undefined, undefined, undefined, undefined, undefined, undefined, 120 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    fe [[ f ]]( s, us, cf, ( -15291.5, -27730, 5332 ), ( 357.89, 21.16, 0.06 ), undefined, undefined, "hover_bomb_pos_random" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    fe [[ f ]]( s, us, cf, ( -19259, -25323.5, 5334.5 ), ( 357.97, 7.07, 0.57 ), undefined, undefined, "hover_bomb_pos_random" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    fe [[ f ]]( s, us, cf, ( -17006, -21017, 4717.5 ), ( 357.89, 21.16, 0.06 ), undefined, undefined, "hover_bomb_pos_random" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    fe [[ f ]]( s, us, cf, ( -17050.5, -28044, 4754 ), ( 358.94, 82.74, -1.83 ), undefined, undefined, "hover_bomb_pos_random" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    fe [[ f ]]( s, us, cf, ( -15693, -22117, 4930 ), ( 357.89, 21.16, 0.06 ), undefined, undefined, "hover_bomb_building" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    fe [[ f ]]( s, us, cf, ( -13839, -24164, 5645 ), ( 357.89, 21.16, 0.06 ), undefined, undefined, "hover_bomb_building" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "shoot";
    s.script_decel = float( 60 );
    s.script_hover = "5";
    s.var_d22e1aff382cd1a5 = "30";
    fe [[ f ]]( s, us, cf, ( -8280, -33208, 4744 ), ( 0, 15, 0 ), "cspf_0_auto14363192151158624337", "cspf_0_auto16436016530586882658", undefined, undefined, undefined, undefined, undefined, undefined, 10 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "shoot";
    s.script_decel = float( 60 );
    s.script_hover = "5";
    s.var_d22e1aff382cd1a5 = "30";
    fe [[ f ]]( s, us, cf, ( -7800, -31392, 4712 ), ( 0, 330, 0 ), "cspf_0_auto16436016530586882658", "cspf_0_auto8668359378696435414", undefined, undefined, undefined, undefined, undefined, undefined, 10 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 35 );
    s.script_decel = float( 35 );
    s.script_helitype = "ahotel64";
    fe [[ f ]]( s, us, cf, ( 13000, 15448, 3720 ), ( 0, 255, 0 ), undefined, "cspf_0_auto5598950032838755875", "heli_ash_1" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "flare";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -2296, -31856, 5704 ), ( 0, 255, 0 ), "cspf_0_auto5598950032838755875", "cspf_0_auto13207046276445903757", undefined, undefined, undefined, undefined, undefined, undefined, 10 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 35 );
    s.script_decel = float( 35 );
    s.script_helitype = "ahotel64";
    fe [[ f ]]( s, us, cf, ( 8616, 19504, 5928 ), ( 0, 240, 0 ), undefined, "cspf_0_auto3498774537054053987", "heli_ash_3" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -5041.5, -36995.2, 5702.45 ), ( 0, 225, 0 ), "cspf_0_auto3498774537054053987", "cspf_0_auto1593204038148904543", undefined, undefined, undefined, undefined, undefined, undefined, 10 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 35 );
    s.script_decel = float( 35 );
    s.script_helitype = "ahotel64";
    fe [[ f ]]( s, us, cf, ( 7539.71, 20006.6, 5928 ), ( 0, 240, 0 ), undefined, "cspf_0_auto5699730401569503724", "heli_ash_4" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -7931.5, -40676.7, 5702.45 ), ( 0, 255, 0 ), "cspf_0_auto5699730401569503724", "cspf_0_auto1319332788247039864", undefined, undefined, undefined, undefined, undefined, undefined, 20 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 35 );
    s.script_decel = float( 35 );
    s.script_helitype = "ahotel64";
    fe [[ f ]]( s, us, cf, ( 4480, 20520, 3448 ), ( 0, 255, 0 ), undefined, "cspf_0_auto735881554786488120", "heli_ash_5" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "missile";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -18556.5, -15719.2, 5126.45 ), ( 0, 165, 0 ), "cspf_0_auto735881554786488120", "cspf_0_auto3897934613375826432", undefined, undefined, undefined, undefined, undefined, undefined, 10 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 35 );
    s.script_decel = float( 70 );
    s.script_helitype = "ahotel64";
    fe [[ f ]]( s, us, cf, ( 1400.6, 21679.2, 2198.56 ), ( 0, 240, 0 ), undefined, "cspf_0_auto7482559740516471516", "heli_ash_6" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "missile";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -17624, -5776, 4696 ), ( 0, 270, 0 ), "cspf_0_auto7482559740516471516", "cspf_0_auto14726177894336502577", undefined, undefined, undefined, undefined, undefined, undefined, 60 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 35 );
    s.script_decel = float( 35 );
    s.script_helitype = "ahotel64";
    fe [[ f ]]( s, us, cf, ( 9920, 19160, 6216 ), ( 0, 272.3, 0 ), undefined, "cspf_0_auto12581035240304306633", "heli_ash_2" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -2500.5, -12815.2, 3606.45 ), ( 0, 240, 0 ), "cspf_0_auto12581035240304306633", "cspf_0_auto9583331452481614988", undefined, undefined, undefined, undefined, undefined, undefined, 20 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "flare";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -17629.1, -6964.12, 4699.75 ), ( 0, 270, 0 ), "cspf_0_auto14726177894336502577", "cspf_0_auto16026015172989913247", undefined, undefined, undefined, undefined, undefined, undefined, 10 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "shoot";
    s.script_decel = float( 60 );
    s.script_hover = "5";
    s.var_d22e1aff382cd1a5 = "30";
    fe [[ f ]]( s, us, cf, ( -5640, -30720, 4696 ), ( 0, 255, 0 ), "cspf_0_auto8668359378696435414", "cspf_0_auto11573751523489717520", undefined, undefined, undefined, undefined, undefined, undefined, 20 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_crash = "1";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -3880, -31680, 5456 ), ( 0, 270, 0 ), "cspf_0_auto11573751523489717520", "cspf_0_auto4606581749945319625", undefined, undefined, undefined, undefined, undefined, undefined, 30 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -6088, -45600, 4672 ), ( 0, 255, 0 ), "cspf_0_auto4606581749945319625", undefined, undefined, undefined, undefined, undefined, undefined, undefined, 10 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "shoot";
    s.script_decel = float( 60 );
    s.script_hover = "5";
    s.var_d22e1aff382cd1a5 = "15";
    fe [[ f ]]( s, us, cf, ( -3528, -33592, 4752 ), ( 0, 165, 0 ), "cspf_0_auto13207046276445903757", "cspf_0_auto2260415347329448917", undefined, undefined, undefined, undefined, undefined, undefined, 10 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "flare";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -7024, -34992, 4776 ), ( 0, 60, 0 ), "cspf_0_auto2260415347329448917", "cspf_0_auto14363192151158624337", undefined, undefined, undefined, undefined, undefined, undefined, 10 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    fe [[ f ]]( s, us, cf, ( -9568, -38439.5, 3042.97 ), ( 0, 124.04, 0 ), "heli_sam_spawn_point" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    fe [[ f ]]( s, us, cf, ( -11926, -24024, 5242 ), ( 0, 300, 90 ), "zone1_explode" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "flare";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -7041.5, -38661.7, 5702.45 ), ( 0, 195, 0 ), "cspf_0_auto7342292420231999808", "cspf_0_auto7181680389535127956", undefined, undefined, undefined, undefined, undefined, undefined, 20 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "missile";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -8965.5, -39481.2, 5702.45 ), ( 0, 165, 0 ), "cspf_0_auto7181680389535127956", "cspf_0_auto2621805649601273415", undefined, undefined, undefined, undefined, undefined, undefined, 90 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -46079, -33223.2, 5702.45 ), ( 0, 165, 0 ), "cspf_0_auto2621805649601273415", undefined, undefined, undefined, undefined, undefined, undefined, undefined, 90 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "missile";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -13052, -40723.2, 5702.45 ), ( 0, 165, 0 ), "cspf_0_auto1319332788247039864", "cspf_0_auto5882651192049326705", undefined, undefined, undefined, undefined, undefined, undefined, 30 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "missile";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -14332, -40387.2, 5702.45 ), ( 0, 165, 0 ), "cspf_0_auto5882651192049326705", "cspf_0_auto16319503194331115090", undefined, undefined, undefined, undefined, undefined, undefined, 30 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "flare";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -7548.5, -13319.2, 3606.45 ), ( 0, 75, 0 ), "cspf_0_auto17025856319229121851", "cspf_0_auto3882311502804314757", undefined, undefined, undefined, undefined, undefined, undefined, 30 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "turret";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -17285.1, -7932.12, 4699.75 ), ( 0, 255, 0 ), "cspf_0_auto16026015172989913247", "cspf_0_auto1166056909063079712", undefined, undefined, undefined, undefined, undefined, undefined, 10 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "turret";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -18605.1, -8516.12, 4699.75 ), ( 0, 225, 0 ), "cspf_0_auto1166056909063079712", "cspf_0_auto4645171670328520914", undefined, undefined, undefined, undefined, undefined, undefined, 60 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "missile";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -20261.1, -12804.1, 4699.75 ), ( 0, 255, 0 ), "cspf_0_auto4645171670328520914", "cspf_0_auto3526884816069153301", undefined, undefined, undefined, undefined, undefined, undefined, 60 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "crash";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -22221.1, -13668.1, 4699.75 ), ( 0, 210, 0 ), "cspf_0_auto3526884816069153301", undefined, undefined, undefined, undefined, undefined, undefined, undefined, 60 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -37484.5, -17183.2, 5126.45 ), ( 0, 165, 0 ), "cspf_0_auto3897934613375826432", undefined, undefined, undefined, undefined, undefined, undefined, undefined, 90 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "flare";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -3524.5, -15023.2, 3606.45 ), ( 0, 150, 0 ), "cspf_0_auto9583331452481614988", "cspf_0_auto15313580678327912562", undefined, undefined, undefined, undefined, undefined, undefined, 20 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "missile";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -4948.5, -15327.2, 3606.45 ), ( 0, 150, 0 ), "cspf_0_auto15313580678327912562", "cspf_0_auto17791702144273009419", undefined, undefined, undefined, undefined, undefined, undefined, 20 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "shoot";
    s.script_decel = float( 60 );
    s.script_hover = "5";
    s.script_turrettarget = "heli_ash_2_target";
    s.var_d22e1aff382cd1a5 = "15";
    fe [[ f ]]( s, us, cf, ( -9132.5, -11479.2, 3606.45 ), ( 0, 15, 0 ), "cspf_0_auto3882311502804314757", "cspf_0_auto9446290934070282713", undefined, undefined, undefined, undefined, undefined, undefined, 20 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "shoot";
    s.script_decel = float( 60 );
    s.script_hover = "5";
    s.script_turrettarget = "heli_ash_2_target";
    s.var_d22e1aff382cd1a5 = "15";
    fe [[ f ]]( s, us, cf, ( -5652.5, -13679.2, 3606.45 ), ( 0, 150, 0 ), "cspf_0_auto17791702144273009419", "cspf_0_auto17025856319229121851", undefined, undefined, undefined, undefined, undefined, undefined, 10 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    fe [[ f ]]( s, us, cf, ( -21336, -39039.5, 3060 ), ( 0, 124.04, 0 ), "heli_sam_spawn_point" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    fe [[ f ]]( s, us, cf, ( -20352, -16807.5, 3732 ), ( 0, 124.04, 0 ), "heli_sam_spawn_point" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    fe [[ f ]]( s, us, cf, ( -17216, -8831.5, 1504.98 ), ( 0, 124.04, 0 ), "heli_sam_spawn_point" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    fe [[ f ]]( s, us, cf, ( -7328, -13687.5, 1925.72 ), ( 0, 124.04, 0 ), "heli_sam_spawn_point" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "turret";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -6209.5, -37963.2, 5702.45 ), ( 0, 210, 0 ), "cspf_0_auto1593204038148904543", "cspf_0_auto7342292420231999808", undefined, undefined, undefined, undefined, undefined, undefined, 10 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    fe [[ f ]]( s, us, cf, ( 10296, 19048, 3440 ), ( 0, 0, 0 ) );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    fe [[ f ]]( s, us, cf, ( -7016, -12936, 1822.5 ), ( 0, 300, 0 ), "heli_ash_2_target" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "missile";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -9428.5, -9919.2, 3606.45 ), ( 0, 315, 0 ), "cspf_0_auto9446290934070282713", "cspf_0_auto12676022639974893788", undefined, undefined, undefined, undefined, undefined, undefined, 20 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "missile";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -7836.5, -10279.2, 3606.45 ), ( 0, 315, 0 ), "cspf_0_auto12676022639974893788", "cspf_0_auto3873758092771287444", undefined, undefined, undefined, undefined, undefined, undefined, 20 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "missile";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -6716.5, -10695.2, 3606.45 ), ( 0, 315, 0 ), "cspf_0_auto3873758092771287444", "cspf_0_auto14123340415267736800", undefined, undefined, undefined, undefined, undefined, undefined, 20 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "missile";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -15900, -39971.2, 5702.45 ), ( 0, 165, 0 ), "cspf_0_auto16319503194331115090", "cspf_0_auto7895715353063192911", undefined, undefined, undefined, undefined, undefined, undefined, 30 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_crash = "1";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -5164.5, -11199.2, 3606.45 ), ( 0, 330, 0 ), "cspf_0_auto14123340415267736800", "cspf_0_auto1888655079115739858", undefined, undefined, undefined, undefined, undefined, undefined, 60 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( 2659.5, 2296.8, 3606.45 ), ( 0, 60, 0 ), "cspf_0_auto1888655079115739858", undefined, undefined, undefined, undefined, undefined, undefined, undefined, 60 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "flare";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -18172, -39371.2, 5702.45 ), ( 0, 165, 0 ), "cspf_0_auto7895715353063192911", "cspf_0_auto2424734646669306961", undefined, undefined, undefined, undefined, undefined, undefined, 20 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "shoot";
    s.script_decel = float( 60 );
    s.script_hover = "5";
    s.script_turrettarget = "heli_ash_3_target";
    s.var_d22e1aff382cd1a5 = "30";
    fe [[ f ]]( s, us, cf, ( -20680, -38680, 5680 ), ( 0, 165, 0 ), "cspf_0_auto2424734646669306961", "cspf_0_auto8225845607171277983", undefined, undefined, undefined, undefined, undefined, undefined, 20 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_attack = "shoot";
    s.script_decel = float( 60 );
    s.script_hover = "5";
    s.script_turrettarget = "heli_ash_3_target";
    s.var_d22e1aff382cd1a5 = "30";
    fe [[ f ]]( s, us, cf, ( -22712, -38144, 5680 ), ( 0, 75, 0 ), "cspf_0_auto8225845607171277983", "cspf_0_auto8592181819947330455", undefined, undefined, undefined, undefined, undefined, undefined, 20 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    fe [[ f ]]( s, us, cf, ( -20256, -36528, 2931.97 ), ( 0, 0, 0 ), "heli_ash_3_target" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_crash = "1";
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -22264, -36512, 5680 ), ( 0, 345, 0 ), "cspf_0_auto8592181819947330455", "cspf_0_auto16550195230895400796", undefined, undefined, undefined, undefined, undefined, undefined, 60 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    s.script_accel = float( 30 );
    s.script_decel = float( 60 );
    fe [[ f ]]( s, us, cf, ( -16648, -47656, 5680 ), ( 0, 270, 0 ), "cspf_0_auto16550195230895400796", undefined, undefined, undefined, undefined, undefined, undefined, undefined, 10 );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    fe [[ f ]]( s, us, cf, ( -5127, -31224, 3352.97 ), ( 0.39, 131.55, 3.23 ), "heli_sam_spawn_point" );
    s = s();
    s.cs_flag = "mp_jup_skydiving_zone_1_create_script";
    fe [[ f ]]( s, us, cf, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    fe ent_flag_set( "cs_objects_created" );
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_skydiving_zone_1_create_script / scripts\mp\maps\mp_jup_skydiving\mp_jup_skydiving_zone_1_create_script
// Params 0
// Checksum 0x0, Offset: 0x3357
// Size: 0x2
function function_7af6d59eef91a7dd()
{
    
}

// Namespace mp_jup_skydiving_zone_1_create_script / scripts\mp\maps\mp_jup_skydiving\mp_jup_skydiving_zone_1_create_script
// Params 0
// Checksum 0x0, Offset: 0x3361
// Size: 0xe
function cleanup()
{
    function_71a564b3bc009618( "mp_jup_skydiving_zone_1_create_script" );
}

