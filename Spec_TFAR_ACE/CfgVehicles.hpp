class CfgVehicles {
    class Man;
    
    class CAManBase : Man {
        class ACE_SelfActions {
            class Spec_TFAR {
                displayName = "TFAR";
                condition = Spec_TFAR_ACE_enabled;
                exceptions[] = {"isNotInside", "isNotSitting"};
                icon = "Spec_TFAR_ACE\resources\radio.paa";
                class Spec_TFAR_voice {
                    displayName = "$STR_TFAR_voice";
                    condition = 1;
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    statement = "";
                    icon = "Spec_TFAR_ACE\resources\voice.paa";
                    insertChildren = "_this call Spec_TFAR_ACE_fnc_voiceVolumeActions";
                };
                class Spec_TFAR_sw {
                    displayName = "Short Range";
                    condition = "!(format ['%1',(call TFAR_fnc_ActiveSwRadio)] isEqualTo 'any') && Spec_TFAR_ACE_swEnabled";
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    icon = "Spec_TFAR_ACE\resources\radio.paa";
                    statement = "[] call TFAR_fnc_swRadioMenu;";
                    class Spec_TFAR_sw_volume {
                        displayName = "$STR_TFAR_volume";
                        exceptions[] = {"isNotInside", "isNotSitting"};
                        statement = "[call TFAR_fnc_ActiveSwRadio] call TFAR_fnc_ShowRadioVolume;";
                        insertChildren = "_this call Spec_TFAR_ACE_fnc_swVolumeActions";
                    };
                    class Spec_TFAR_sw_stereo {
                        displayName = "$STR_TFAR_stereo";
                        exceptions[] = {"isNotInside", "isNotSitting"};
                        statement = "[call TFAR_fnc_ActiveSwRadio] call TFAR_fnc_ShowRadioVolume;";
                        insertChildren = "_this call Spec_TFAR_ACE_fnc_swStereoActions";
                    };
                    class Spec_TFAR_sw_channel {
                        displayName = "$STR_TFAR_channel";
                        condition = 1;
                        exceptions[] = {"isNotInside", "isNotSitting"};
                        statement = "[call TFAR_fnc_activeSwRadio, false] call TFAR_fnc_ShowRadioInfo";
                        insertChildren = "_this call Spec_TFAR_ACE_fnc_swChannelActions";
                    };
                    class Spec_TFAR_sw_additional {
                        displayName = "$STR_TFAR_additional";
                        condition = Spec_TFAR_ACE_swAdditionalEnabled;
                        exceptions[] = {"isNotInside", "isNotSitting"};
                        statement = "[call TFAR_fnc_ActiveSwRadio, false] call TFAR_fnc_ShowRadioInfo;";
                        class Spec_TFAR_sw_additional_stereo {
                            displayName = "$STR_TFAR_stereo";
                            condition = "(((call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwSettings) select SPEC_TFAR_ADDITIONAL_CHANNEL_OFFSET) != -1";
                            exceptions[] = {"isNotInside", "isNotSitting"};
                            statement = "[call TFAR_fnc_ActiveSwRadio] call TFAR_fnc_ShowRadioVolume;";
                            insertChildren = "_this call Spec_TFAR_ACE_fnc_swAdditionalStereoActions";
                        };
                        class Spec_TFAR_sw_additional_channel {
                            displayName = "$STR_TFAR_channel";
                            condition = 1;
                            exceptions[] = {"isNotInside", "isNotSitting"};
                            statement = "[call TFAR_fnc_activeSwRadio, false] call TFAR_fnc_ShowRadioInfo";
                            insertChildren = "_this call Spec_TFAR_ACE_fnc_swAdditionalChannelActions";
                        };
                    };
                };
                class Spec_TFAR_lr {
                    displayName = "Long Range";
                    condition = "!(format ['%1',(call TFAR_fnc_activeLrRadio)] isEqualTo 'any') && Spec_TFAR_ACE_lrEnabled";
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    icon = "Spec_TFAR_ACE\resources\radio_lr.paa";
                    statement = "[] call TFAR_fnc_lrRadioMenu;";
                    class Spec_TFAR_lr_volume {
                        displayName = "$STR_TFAR_volume";
                        exceptions[] = {"isNotInside", "isNotSitting"};
                        statement = "[call TFAR_fnc_activeLrRadio] call TFAR_fnc_ShowRadioVolume;";
                        insertChildren = "_this call Spec_TFAR_ACE_fnc_lrVolumeActions";
                    };
                    class Spec_TFAR_lr_stereo {
                        displayName = "$STR_TFAR_stereo";
                        exceptions[] = {"isNotInside", "isNotSitting"};
                        statement = "[call TFAR_fnc_activeLrRadio] call TFAR_fnc_ShowRadioVolume;";
                        insertChildren = "_this call Spec_TFAR_ACE_fnc_lrStereoActions";
                    };
                    class Spec_TFAR_lr_channel {
                        displayName = "$STR_TFAR_channel";
                        condition = 1;
                        exceptions[] = {"isNotInside", "isNotSitting"};
                        statement = "[call TFAR_fnc_activeLrRadio, true] call TFAR_fnc_ShowRadioInfo";
                        insertChildren = "_this call Spec_TFAR_ACE_fnc_lrChannelActions";
                    };
                    class Spec_TFAR_lr_additional {
                        displayName = "$STR_TFAR_additional";
                        condition = Spec_TFAR_ACE_lrAdditionalEnabled;
                        exceptions[] = {"isNotInside", "isNotSitting"};
                        statement = "[call TFAR_fnc_ActiveLrRadio, true] call TFAR_fnc_ShowRadioInfo;";
                        class Spec_TFAR_lr_additional_stereo {
                            displayName = "$STR_TFAR_stereo";
                            condition = "(((call TFAR_fnc_ActiveLrRadio) call TFAR_fnc_getLrSettings) select SPEC_TFAR_ADDITIONAL_CHANNEL_OFFSET) != -1";
                            exceptions[] = {"isNotInside", "isNotSitting"};
                            statement = "[call TFAR_fnc_activeLrRadio] call TFAR_fnc_ShowRadioVolume;";
                            insertChildren = "_this call Spec_TFAR_ACE_fnc_lrAdditionalStereoActions";
                        };
                        class Spec_TFAR_sw_additional_channel {
                            displayName = "$STR_TFAR_channel";
                            condition = 1;
                            exceptions[] = {"isNotInside", "isNotSitting"};
                            statement = "[call TFAR_fnc_activeLrRadio, true] call TFAR_fnc_ShowRadioInfo";
                            insertChildren = "_this call Spec_TFAR_ACE_fnc_lrAdditionalChannelActions";
                        };
                    };
                };
            };
        };
    };
};