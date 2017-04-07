#include "\z\tfar\addons\core\defines.hpp"
#include "const.hpp"

params ["_target","_caller"];
private _tfar = [
    [localize "STR_voice_whispering", TFAR_SPEAK_VOLUME_LEVEL_YELLING],
    [localize "STR_voice_normal", TFAR_SPEAK_VOLUME_LEVEL_WHISPERING],
    [localize "STR_voice_yelling", TFAR_SPEAK_VOLUME_LEVEL_NORMAL]
];
private _actions = [];
{
    _x params ["_string","_previousVoiceVolume"];
    private _voiceVolumeString = format [localize "STR_voice_volume", _string];
    private _action = [_string, _string, "", {
        (_this select 2) params ["_previousVoiceVolume"];
        // set the volume level to the previous one and call the onSpeakVolumeChanged event
        // this will handle the change correctly (set internal variables and show hint)
        TF_speak_volume_level = _previousVoiceVolume;
        [] call TFAR_fnc_onSpeakVolumeChangePressed;
    }, {true}, {}, [_previousVoiceVolume] ] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_action,[],_caller];
} forEach _tfar;

_actions
