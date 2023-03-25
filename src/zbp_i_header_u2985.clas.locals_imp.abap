CLASS lhc_Header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

*    METHODS:
*      createOrder FOR MODIFY IMPORTING keys FOR ACTION Header~createOrder RESULT result,
*      updateOrder FOR MODIFY IMPORTING keys FOR ACTION Header~updateOrder RESULT result,
*      deleteOrder FOR MODIFY IMPORTING keys FOR ACTION Header~deleteOrder RESULT result.

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

    CONSTANTS:
      gc_create TYPE string VALUE 'CREATE',
      gc_update TYPE string VALUE 'UPDATE',
      gc_delete TYPE string VALUE 'DELETE'.

  PROTECTED SECTION.

ENDCLASS.

CLASS lsc_Z_I_HEADER_U2985 IMPLEMENTATION.


ENDCLASS.
