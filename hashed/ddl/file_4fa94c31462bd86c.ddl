// file ddl_4fa94c31462bd86c

// bitSize: 0x128, members: 3
struct root {
    // offset: 0x0, bitSize: 0x30(0x6B)
    Subtitles subtitles;
    // offset: 0x88, bitSize: 0xa0(0x14B)
    Quality qualityPreset;
    // offset: 0x30, bitSize: 0x58(0xbB)
    Telemetry telemetryPreset;
}

// bitSize: 0x30, members: 7
struct Subtitles {
    // offset: 0x0, bitSize: 0x8(0x1B)
    byte subtitles_br;
    // offset: 0x8, bitSize: 0x8(0x1B)
    byte subtitles_cp;
    // offset: 0x10, bitSize: 0x8(0x1B)
    byte subtitles_mp;
    // offset: 0x18, bitSize: 0x8(0x1B)
    byte subtitles_ob;
    // offset: 0x20, bitSize: 0x8(0x1B)
    byte subtitles_sp;
    // offset: 0x28, bitSize: 0x1
    bit initialized;
    // offset: 0x29, bitSize: 0x7
    pad __pad[7];
}

// bitSize: 0xa0, members: 22
struct Quality {
    // offset: 0x0, bitSize: 0x8(0x1B)
    byte ssr;
    // offset: 0x8, bitSize: 0x8(0x1B)
    byte reflection_probes_quality;
    // offset: 0x10, bitSize: 0x8(0x1B)
    byte weather_grid_volume_quality;
    // offset: 0x18, bitSize: 0x8(0x1B)
    byte screen_space_shadows;
    // offset: 0x20, bitSize: 0x8(0x1B)
    byte water_quality;
    // offset: 0x28, bitSize: 0x8(0x1B)
    byte texture_res;
    // offset: 0x30, bitSize: 0x8(0x1B)
    byte particle_quality;
    // offset: 0x38, bitSize: 0x8(0x1B)
    byte shader_quality;
    // offset: 0x40, bitSize: 0x8(0x1B)
    byte depth_of_field_pc;
    // offset: 0x48, bitSize: 0x8(0x1B)
    byte tessellation;
    // offset: 0x50, bitSize: 0x8(0x1B)
    byte bullet_impact;
    // offset: 0x58, bitSize: 0x8(0x1B)
    byte tex_filter_aniso;
    // offset: 0x60, bitSize: 0x8(0x1B)
    byte resolution;
    // offset: 0x68, bitSize: 0x8(0x1B)
    byte model_quality;
    // offset: 0x70, bitSize: 0x8(0x1B)
    byte anti_aliasing;
    // offset: 0x78, bitSize: 0x8(0x1B)
    byte ambient_occlusion;
    // offset: 0x80, bitSize: 0x8(0x1B)
    byte volumetrics_quality;
    // offset: 0x88, bitSize: 0x8(0x1B)
    byte deferred_physics_quality;
    // offset: 0x90, bitSize: 0x8(0x1B)
    byte shadow_quality;
    // offset: 0x98, bitSize: 0x1
    bit initialized;
    // offset: 0x99, bitSize: 0x1
    bit isCustom;
    // offset: 0x9a, bitSize: 0x6
    pad __pad[6];
}

// bitSize: 0x58, members: 12
struct Telemetry {
    // offset: 0x0, bitSize: 0x8(0x1B)
    byte telemetry_vram_counter;
    // offset: 0x8, bitSize: 0x8(0x1B)
    byte telemetry_cpu_time;
    // offset: 0x10, bitSize: 0x8(0x1B)
    byte telemetry_fps_counter;
    // offset: 0x18, bitSize: 0x8(0x1B)
    byte telemetry_server_latency;
    // offset: 0x20, bitSize: 0x8(0x1B)
    byte telemetry_gpu_clock;
    // offset: 0x28, bitSize: 0x8(0x1B)
    byte telemetry_laptop_battery;
    // offset: 0x30, bitSize: 0x8(0x1B)
    byte telemetry_system_clock;
    // offset: 0x38, bitSize: 0x8(0x1B)
    byte telemetry_packet_loss;
    // offset: 0x40, bitSize: 0x8(0x1B)
    byte telemetry_gpu_temp;
    // offset: 0x48, bitSize: 0x8(0x1B)
    byte telemetry_gpu_time;
    // offset: 0x50, bitSize: 0x1
    bit initialized;
    // offset: 0x51, bitSize: 0x7
    pad __pad[7];
}

