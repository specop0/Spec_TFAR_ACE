params ["_target","_caller"];
private _stereoSettings = [
	[0, localize "STR_stereo_settings_0"],
	[1, localize "STR_stereo_settings_1"],
	[2, localize "STR_stereo_settings_2"]
];
private _actions = [];
{
	_x params ["_stereoNumber","_stereoString"];
	private _action = [_stereoString, _stereoString, "", {
		(_this select 2) params ["_stereoNumber"];
		private _lrRadio = call TFAR_fnc_activeLrRadio;
		[_lrRadio select 0, _lrRadio select 1, _stereoNumber] call TFAR_fnc_setAdditionalLrStereo;
		[_lrRadio] call TFAR_fnc_ShowRadioVolume;
	}, {true}, {}, [_stereoNumber] ] call ace_interact_menu_fnc_createAction;
	_actions pushBack [_action,[],_caller];
} forEach _stereoSettings;
private _actionHeadphones = [localize "STR_speakers_settings_false", localize "STR_speakers_settings_false", "", {
		private _lrRadio = call TFAR_fnc_activeLrRadio;
		private _settings = _lrRadio call TFAR_fnc_getLrSettings;
		if (_lrRadio select TF_LR_SPEAKER_OFFSET) then {
			[_lrRadio select 0, _lrRadio select 1] call TFAR_fnc_setLrSpeakers;
		};
		[_lrRadio] call TFAR_fnc_ShowRadioSpeakers;
},{true}] call ace_interact_menu_fnc_createAction;
private _actionSpeakers = [localize "STR_speakers_settings_true", localize "STR_speakers_settings_true", "", {
		private _lrRadio = call TFAR_fnc_activeLrRadio;
		private _settings = _lrRadio call TFAR_fnc_getLrSettings;
		if !(_settings select TF_LR_SPEAKER_OFFSET) then {
			[_lrRadio select 0, _lrRadio select 1] call TFAR_fnc_setLrSpeakers;
		};
		[_lrRadio] call TFAR_fnc_ShowRadioSpeakers;
},{true}] call ace_interact_menu_fnc_createAction;
_actions pushBack [_actionHeadphones,[],_caller];
_actions pushBack [_actionSpeakers,[],_caller];
_actions
