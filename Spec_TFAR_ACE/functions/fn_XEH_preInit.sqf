{
    [
        _x select 0,
        "CHECKBOX",
        _x select 1,
        "Spec TFAR ACE",
        true,
        true
    ] call CBA_Settings_fnc_init;
} forEach [
    ["Spec_TFAR_ace_enabled", "Enabled"],
    ["Spec_TFAR_ace_voiceEnabled", "Voice"],
    ["Spec_TFAR_ace_swEnabled", "Short Range"],
    ["Spec_TFAR_ace_swAdditionalEnabled", "Short Range Additional"],
    ["Spec_TFAR_ace_lrEnabled", "Long Range"],
    ["Spec_TFAR_ace_lrAdditionalEnabled", "Long Range Additional"],
    ["Spec_TFAR_ace_autoWhisper", "Whisper at Start"]
];
