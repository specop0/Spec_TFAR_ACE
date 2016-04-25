params ["_target","_caller"];
private _actions = [];
private _swRadio = call TFAR_fnc_ActiveSwRadio;
private _settings = _swRadio call TFAR_fnc_getSwSettings;
private _frequencies = _settings select TF_FREQ_OFFSET;
_frequencies resize (count _frequencies min 8);
{
	private _action = [str _string, format [localize "STR_TFAR_swFreq", _forEachIndex +1, _x], "", {
		(_this select 2) params ["_channel"];
		private _swRadio = call TFAR_fnc_ActiveSwRadio;
		[_swRadio, _channel] call TFAR_fnc_setSwChannel;
		[_swRadio, false] call TFAR_fnc_ShowRadioInfo;
	}, {true}, {}, [_forEachIndex] ] call ace_interact_menu_fnc_createAction;
	_actions pushBack [_action,[],_caller];
} forEach _frequencies;

_actions
