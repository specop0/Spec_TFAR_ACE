if(hasInterface && Spec_TFAR_ace_autoWhisper) then {
    private _scriptHandle = [] spawn {
        waitUntil { sleep 0.5; !isNil "TFAR_currentUnit" };
        5 call TFAR_fnc_setVoiceVolume;
        TF_speak_volume_level = "whispering";
    };
};