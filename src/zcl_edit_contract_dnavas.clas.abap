CLASS zcl_edit_contract_dnavas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.

    METHODS check_edit IMPORTING i_usuario TYPE sy-uname
                       RAISING   zcx_excepcion_dnavas.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_edit_contract_dnavas IMPLEMENTATION.
  METHOD check_edit.
    IF sy-uname = 'CB9980000153'.
      RAISE EXCEPTION TYPE zcx_excepcion_dnavas
        EXPORTING
          textid  = zcx_excepcion_dnavas=>no_autorizacion
*         previous =
          ms_msg1 = | { sy-uname } |
          ms_msg2 = 'A1234567'
*         ms_msg3 =
*         ms_msg4 =
        .
    ENDIF.
  ENDMETHOD.
ENDCLASS.
