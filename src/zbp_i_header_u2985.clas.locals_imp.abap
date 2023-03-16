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

********************************
* Método GET_INSTANCE_FEATURES *
********************************
  METHOD get_instance_features.
*
*    READ ENTITIES OF z_i_header_u2985 IN LOCAL MODE
*              ENTITY Header
*              FIELDS ( id email )
*          WITH VALUE #( FOR key_row IN keys ( %key = key_row-%key ) )
*              RESULT DATA(lt_header_result).
*
*    result = VALUE #( FOR ls_header IN lt_header_result (
*                          %key          = ls_header-%key
*                          %field-id     = if_abap_behv=>fc-f-read_only
**                          %field-email  = if_abap_behv=>fc-f-read_only
*                          %assoc-_Items = if_abap_behv=>fc-o-enabled
*    ) ).
*
  ENDMETHOD.

**************************************
* Método GET_INSTANCE_AUTHORIZATIONS *
**************************************
  METHOD get_instance_authorizations.
*    DATA(lv_auth) = COND #( WHEN cl_abap_context_info=>get_user_technical_name( ) EQ 'CB9980002985'
*                            THEN if_abap_behv=>auth-allowed
*                            ELSE if_abap_behv=>auth-unauthorized ).
*
*    LOOP AT keys ASSIGNING FIELD-SYMBOL(<ls_keys>).
*
*      APPEND INITIAL LINE TO result ASSIGNING FIELD-SYMBOL(<ls_result>).
*      <ls_result> = VALUE #( %key                = <ls_keys>-%key
*                             %op-%update         = lv_auth
**                             %action-createOrder = lv_auth
**                             %action-updateOrder = lv_auth
**                             %action-deleteOrder = lv_auth
*                             %assoc-_Items       = lv_auth ).
*
*    ENDLOOP.
  ENDMETHOD.

***********************
** Método CREATEORDER *
***********************
*  METHOD createOrder.
*
** keys[ 1 ]-
** result[ 1 ]-
** mapped-
** failed-
** reported-
*
*    READ ENTITIES OF z_i_header_u2985
*         ENTITY Header
*         FIELDS ( id email firstname lastname country createon deliverydate orderstatus imageurl )
*         WITH VALUE #( FOR row_key IN keys ( %key = row_key-%key ) )
*         RESULT DATA(lt_entity_header)
*         FAILED failed
*         REPORTED reported.
*
*    DATA lt_create_order TYPE TABLE FOR CREATE z_i_header_u2985\\Header.
*
*    DATA(lv_today) = cl_abap_context_info=>get_system_date( ).
*
*    SELECT MAX( id ) FROM zheader_u2985 INTO @DATA(lv_id).
*
*    lt_create_order = VALUE #( FOR create_row IN lt_entity_header INDEX INTO lv_index
*                               ( id           = lv_id + lv_index
*                                 email        = create_row-email
*                                 firstname    = create_row-firstname
*                                 lastname     = create_row-lastname
*                                 country      = create_row-country
*                                 createon     = lv_today
*                                 deliverydate = create_row-deliverydate
*                                 orderstatus  = '001'
*                                 imageurl     = create_row-imageurl ) ).
*
*    MODIFY ENTITIES OF z_i_header_u2985
*  IN LOCAL MODE ENTITY Header
*         CREATE FIELDS ( id
*                         email
*                         firstname
*                         lastname
*                         country
*                         createon
*                         deliverydate
*                         orderstatus
*                         imageurl )
*                  WITH lt_create_order
*                MAPPED mapped
*                FAILED failed
*              REPORTED reported.
*
*    result = VALUE #( FOR result_row IN lt_create_order INDEX INTO lv_idx
*                    ( %cid_ref = keys[ lv_idx ]-%cid_ref
*                          %key = keys[ lv_idx ]-%key
*                        %param = CORRESPONDING #( result_row ) ) ).
*
*  ENDMETHOD.
*
***********************
** Método UPDATEORDER *
***********************
*  METHOD updateOrder.
*
**   Modify in Local Mode - BO - related updates there are not relevant autorization objects
*    MODIFY ENTITIES OF z_i_header_u2985 IN LOCAL MODE
*                ENTITY Header
*         UPDATE FIELDS ( orderstatus )
*            WITH VALUE #( FOR mod_row IN keys ( id = mod_row-id ) )
*                FAILED failed
*              REPORTED reported.
*
*    READ ENTITIES OF z_i_header_u2985 IN LOCAL MODE
*              ENTITY Header
*              FIELDS ( id
*                       email
*                       firstname
*                       lastname
*                       country
*                       createon
*                       deliverydate
*                       orderstatus
*                       imageurl )
*     WITH VALUE #( FOR read_row IN keys ( id = read_row-id ) )
*                RESULT DATA(lt_header).
*
*    result = VALUE #( FOR ls_header IN lt_header ( id = ls_header-id
*                                                   %param = ls_header ) ).
*
*    LOOP AT lt_header ASSIGNING FIELD-SYMBOL(<ls_header>).
*
*      DATA(lv_header_msg) = <ls_header>-id.
*      SHIFT lv_header_msg LEFT DELETING LEADING '0'.
*      APPEND VALUE #( id = <ls_header>-id
*                      %msg = new_message(
*                               id       = 'Z_MC_SALES_ORD_U2985'
*                               number   = '002'
*                               severity = if_abap_behv_message=>severity-success
*                               v1       = lv_header_msg )
*                      %element-id = if_abap_behv=>mk-on
*                    ) TO reported-header.
*
*    ENDLOOP.
*
*  ENDMETHOD.
*
***********************
** Método DELETEORDER *
***********************
*  METHOD deleteOrder.
*
**   Modify in Local Mode - BO - related updates there are not relevant autorization objects
*    MODIFY ENTITIES OF z_i_header_u2985 IN LOCAL MODE
*                ENTITY Header
*         UPDATE FIELDS ( orderstatus )
*            WITH VALUE #( FOR mod_row IN keys ( id = mod_row-id ) )
*                FAILED failed
*              REPORTED reported.
*
*    READ ENTITIES OF z_i_header_u2985 IN LOCAL MODE
*              ENTITY Header
*              FIELDS ( id
*                       email
*                       firstname
*                       lastname
*                       country
*                       createon
*                       deliverydate
*                       orderstatus
*                       imageurl )
*     WITH VALUE #( FOR read_row IN keys ( id = read_row-id ) )
*                RESULT DATA(lt_header).
*
*    result = VALUE #( FOR ls_header IN lt_header ( id = ls_header-id
*                                                   %param = ls_header ) ).
*
*    LOOP AT lt_header ASSIGNING FIELD-SYMBOL(<ls_header>).
*
*      DATA(lv_header_msg) = <ls_header>-id.
*      SHIFT lv_header_msg LEFT DELETING LEADING '0'.
*      APPEND VALUE #( id = <ls_header>-id
*                      %msg = new_message(
*                               id       = 'Z_MC_SALES_ORD_U2985'
*                               number   = '003'
*                               severity = if_abap_behv_message=>severity-success
*                               v1       = lv_header_msg )
*                      %element-id = if_abap_behv=>mk-on
*                    ) TO reported-header.
*
*    ENDLOOP.
*
*  ENDMETHOD.

ENDCLASS.

CLASS lsc_Z_I_HEADER_U2985 DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PUBLIC SECTION.

    CONSTANTS:
      gc_create TYPE string VALUE 'CREATE',
      gc_update TYPE string VALUE 'UPDATE',
      gc_delete TYPE string VALUE 'DELETE'.

  PROTECTED SECTION.

*    METHODS save_modified REDEFINITION.

ENDCLASS.

CLASS lsc_Z_I_HEADER_U2985 IMPLEMENTATION.

*  METHOD save_modified.
*
*    DATA:
*      lt_header_log   TYPE STANDARD TABLE OF zlog_u2985,
*      lt_header_log_u TYPE STANDARD TABLE OF zlog_u2985.
*
*    DATA(lv_user) = cl_abap_context_info=>get_user_technical_name( ).
*
*    IF NOT create-header IS INITIAL.
*
*      lt_header_log = CORRESPONDING #( create-header ).
*
*      LOOP AT lt_header_log ASSIGNING FIELD-SYMBOL(<ls_header_log>).
*
*        GET TIME STAMP FIELD <ls_header_log>-created_at.
*        <ls_header_log>-changing_operation = lsc_Z_I_HEADER_U2985=>gc_create.
*
*        READ TABLE create-header WITH TABLE KEY entity COMPONENTS id = <ls_header_log>-id
*              INTO DATA(ls_header).
*        IF sy-subrc IS INITIAL.
*
*          IF ls_header-%control-id EQ cl_abap_behv=>flag_changed.
*            <ls_header_log>-changed_field_name = 'ID'.
*            <ls_header_log>-changed_value      = ls_header-id.
*            <ls_header_log>-user_mod           = lv_user.
*            TRY.
*                <ls_header_log>-change_id = cl_system_uuid=>create_uuid_x16_static( ).
*              CATCH cx_uuid_error.
*            ENDTRY.
*            APPEND <ls_header_log> TO lt_header_log_u.
*          ENDIF.
*
*        ENDIF.
*
*      ENDLOOP.
*
*    ENDIF.
*
*    IF NOT update-header IS INITIAL.
*
*      lt_header_log = CORRESPONDING #( update-header ).
*
*      LOOP AT update-header INTO DATA(ls_update_header).
*
*        ASSIGN lt_header_log[ id = ls_update_header-id ] TO FIELD-SYMBOL(<ls_header_log_bd>).
*
*        GET TIME STAMP FIELD <ls_header_log_bd>-created_at.
*        <ls_header_log_bd>-changing_operation = lsc_Z_I_HEADER_U2985=>gc_update.
*
*        IF ls_update_header-%control-id EQ cl_abap_behv=>flag_changed.
*
*          <ls_header_log_bd>-changed_field_name = 'ID'.
*          <ls_header_log_bd>-changed_value      = ls_update_header-id.
*          <ls_header_log_bd>-user_mod           = lv_user.
*          TRY.
*              <ls_header_log_bd>-change_id = cl_system_uuid=>create_uuid_x16_static( ).
*            CATCH cx_uuid_error.
*          ENDTRY.
*          APPEND <ls_header_log_bd> TO lt_header_log_u.
*
*        ENDIF.
*
*      ENDLOOP.
*
*    ENDIF.
*
*    IF NOT delete-header IS INITIAL.
*
*      lt_header_log = CORRESPONDING #( delete-header ).
*
*      LOOP AT lt_header_log ASSIGNING FIELD-SYMBOL(<ls_header_log_del>).
*
*        GET TIME STAMP FIELD <ls_header_log_del>-created_at.
*        <ls_header_log_del>-changing_operation = lsc_Z_I_HEADER_U2985=>gc_delete.
*        <ls_header_log_del>-user_mod           = lv_user.
*        TRY.
*            <ls_header_log_del>-change_id = cl_system_uuid=>create_uuid_x16_static( ).
*          CATCH cx_uuid_error.
*        ENDTRY.
*        APPEND <ls_header_log_del> TO lt_header_log_u.
*
*      ENDLOOP.
*
*    ENDIF.
*
*    IF NOT lt_header_log_u[] IS INITIAL.
*      INSERT zlog_u2985 FROM TABLE @lt_header_log_u.
*    ENDIF.
*
*  ENDMETHOD.

ENDCLASS.
