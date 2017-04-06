#include "\z\tfar\addons\core\defines.hpp"
#include "const.hpp"

params ["_target","_caller"];
private _tfar = [
    [TFAR_VOLUME_WHISPERING,localize "STR_voice_whispering",TFAR_SPEAK_VOLUME_LEVEL_YELLING],
    [TFAR_VOLUME_NORMAL,localize "STR_voice_normal",TFAR_SPEAK_VOLUME_LEVEL_WHISPERING],
    [TFAR_VOLUME_YELLING,localize "STR_voice_yelling",TFAR_SPEAK_VOLUME_LEVEL_NORMAL]
];
private _actions = [];
{
    _x params ["_voiceVolume","_string","_previousVoiceVolume"];
    private _voiceVolumeString = format [localize "STR_voice_volume", _string];
    private _action = [_string, _string, "", {
        (_this select 2) params ["_voiceVolume","_voiceVolumeString","_previousVoiceVolume"];
        // set the voice volume
        _voiceVolume call TFAR_fnc_setVoiceVolume;
        // set the volume level to the previous one and call the onSpeakVolumeChanged event
        // this will handle the change correctly (set internal variables and show hints)
        TF_speak_volume_level = _previousVoiceVolume;
        [] call TFAR_fnc_onSpeakVolumeChangePressed;
    }, {true}, {}, [_voiceVolume, _voiceVolumeString, _previousVoiceVolume] ] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_action,[],_caller];
} forEach _tfar;

_actions
