params [ "_target", "_caller"];
private _actions = [];
private _lrRadio = call TFAR_fnc_activeLrRadio;
private _settings = _lrRadio call TFAR_fnc_getLrSettings;
private _frequencies = _settings select TF_FREQ_OFFSET;
_frequencies resize (count _frequencies min 9);
{
	private _action = [str _string, format [localize "STR_TFAR_lrFreq", _forEachIndex +1, _x], "", {
		(_this select 2) params ["_channel"];
		private _lrRadio = call TFAR_fnc_activeLrRadio;
		[_lrRadio select 0, _lrRadio select 1, _channel] call TFAR_fnc_setLrChannel;
		[_lrRadio, true] call TFAR_fnc_ShowRadioInfo;
	}, {true}, {}, [_forEachIndex] ] call ace_interact_menu_fnc_createAction;
	_actions pushBack [_action,[],_caller];
} forEach _frequencies;

_actions
