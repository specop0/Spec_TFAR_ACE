params ["_target","_caller"];
private _tfar = [
	[5,localize "STR_voice_whispering","whispering"],
	[20,localize "STR_voice_normal","normal"],
	[60,localize "STR_voice_yelling","yelling"]
];
private _actions = [];
{
	_x params ["_voiceVolume","_string","_speakVolumeLevel"];
	private _voiceVolumeString = format [localize "STR_voice_volume", _string];
	private _action = [_string, _string, "", {
		(_this select 2) params ["_voiceVolume","_voiceVolumeString","_speakVolumeLevel"];
		_voiceVolume call TFAR_fnc_setVoiceVolume;
		TF_speak_volume_level = _speakVolumeLevel;
		[parseText (_voiceVolumeString), 5] call TFAR_fnc_showHint;
	}, {true}, {}, [_voiceVolume, _voiceVolumeString, _speakVolumeLevel] ] call ace_interact_menu_fnc_createAction;
	_actions pushBack [_action,[],_caller];
} forEach _tfar;

_actions
