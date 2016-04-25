params ["_target","_caller"];
private _actions = [];
for "_volume" from 0 to 9 do {
	private _action = [str _string, format ["%1%2",(_volume * 10) + 10,"%"], "", {
		(_this select 2) params ["_volume"];
		private _lrRadio = call TFAR_fnc_activeLrRadio;
		[_lrRadio select 0, _lrRadio select 1, _volume] call TFAR_fnc_setLrVolume;
		[_lrRadio] call TFAR_fnc_ShowRadioVolume;
	}, {true}, {}, [_volume] ] call ace_interact_menu_fnc_createAction;
	_actions pushBack [_action,[],_caller];
};

_actions
