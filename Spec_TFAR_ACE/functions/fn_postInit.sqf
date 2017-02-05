/*
    Author: SpecOp0

    Description:
    Sets the channel name and password.
    Defines the default radios.
    
    If auto whisper is enabled, the player will whisper at spawn.
    
    Parameter(s):
    -

    Returns:
    true
*/

tf_radio_channel_name = "LaufendeMission";
tf_radio_channel_password = "130";

TFAR_DefaultRadio_Personal_West = "tf_anprc152";
TFAR_DefaultRadio_Personal_East = "tf_fadak";
TFAR_DefaultRadio_Personal_Independent = "tf_anprc148jem";
TFAR_DefaultRadio_Rifleman_West = TFAR_DefaultRadio_Personal_West;
TFAR_DefaultRadio_Rifleman_East = TFAR_DefaultRadio_Personal_East;
TFAR_DefaultRadio_Rifleman_Independent = TFAR_DefaultRadio_Personal_Independent;

// apply variables to TS plugin
[] call TFAR_fnc_sendPluginConfig;

// set auto whisper
if(hasInterface && Spec_TFAR_ace_autoWhisper) then {
    private _scriptHandle = [] spawn {
        waitUntil { sleep 0.5; !isNil "TFAR_currentUnit" };
        5 call TFAR_fnc_setVoiceVolume;
        TF_speak_volume_level = "whispering";
    };
};
true
