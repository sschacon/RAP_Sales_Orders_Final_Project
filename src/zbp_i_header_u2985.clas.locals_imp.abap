CLASS lhc_Header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Header RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Header RESULT result.

ENDCLASS.

CLASS lhc_Header IMPLEMENTATION.

  METHOD get_instance_features.

  ENDMETHOD.

  METHOD get_instance_authorizations.

  ENDMETHOD.


ENDCLASS.

CLASS lsc_Z_I_HEADER_U2985 DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PUBLIC SECTION.

  PROTECTED SECTION.

ENDCLASS.

CLASS lsc_Z_I_HEADER_U2985 IMPLEMENTATION.


ENDCLASS.
