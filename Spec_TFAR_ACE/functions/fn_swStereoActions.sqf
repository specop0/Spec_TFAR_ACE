#include "\z\tfar\addons\core\defines.hpp"

params ["_target","_caller"];
private _stereoSettings = [
    [0, localize "STR_TFAR_CORE_stereo_settings_0"],
    [1, localize "STR_TFAR_CORE_stereo_settings_1"],
    [2, localize "STR_TFAR_CORE_stereo_settings_2"]
];
private _actions = [];
{
    _x params ["_stereoNumber","_stereoString"];
    private _action = [_stereoString, _stereoString, "", {
        (_this select 2) params ["_stereoNumber"];
        private _swRadio = call TFAR_fnc_activeSwRadio;
        private _settings = _swRadio call TFAR_fnc_getSwSettings;
        if((_settings select TFAR_ADDITIONAL_CHANNEL_OFFSET) != _settings select ACTIVE_CHANNEL_OFFSET) then {
            [_swRadio, _stereoNumber] call TFAR_fnc_setSwStereo;
            [_swRadio] call TFAR_fnc_ShowRadioVolume;
        } else {
            hint parseText localize "STR_TFAR_changeStereoButCurrentChannelIsAdditional";
        };
    }, {true}, {}, [_stereoNumber] ] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_action,[],_caller];
} forEach _stereoSettings;
private _actionHeadphones = [localize "STR_TFAR_CORE_speakers_settings_false", localize "STR_TFAR_CORE_speakers_settings_false", "", {
        private _swRadio = call TFAR_fnc_activeSwRadio;
        private _settings = _swRadio call TFAR_fnc_getSwSettings;
        if (_settings select TFAR_SW_SPEAKER_OFFSET) then {
            [_swRadio] call TFAR_fnc_setSwSpeakers;
        };
        [_swRadio] call TFAR_fnc_ShowRadioSpeakers;
},{true}] call ace_interact_menu_fnc_createAction;
private _actionSpeakers = [localize "STR_TFAR_CORE_speakers_settings_true", localize "STR_TFAR_CORE_speakers_settings_true", "", {
        private _swRadio = call TFAR_fnc_activeSwRadio;
        private _settings = _swRadio call TFAR_fnc_getSwSettings;
        if !(_settings select TFAR_SW_SPEAKER_OFFSET) then {
            [_swRadio] call TFAR_fnc_setSwSpeakers;
        };
        [_swRadio] call TFAR_fnc_ShowRadioSpeakers;
},{true}] call ace_interact_menu_fnc_createAction;
_actions pushBack [_actionHeadphones,[],_caller];
_actions pushBack [_actionSpeakers,[],_caller];

_actions
