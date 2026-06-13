CLASS zcx_excepcion_dnavas DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    CONSTANTS:
      BEGIN OF no_autorizacion,
        msgid TYPE symsgid VALUE 'ZMC_DNAVAS',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'ms_msg1',
        attr2 TYPE scx_attrname VALUE 'ms_msg2',
        attr3 TYPE scx_attrname VALUE 'ms_msg3',
        attr4 TYPE scx_attrname VALUE 'ms_msg4',
      END OF no_autorizacion.

    CONSTANTS:
      BEGIN OF no_resources,
        msgid TYPE symsgid VALUE 'ZMC_DNAVAS',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE 'ms_msg1',
        attr2 TYPE scx_attrname VALUE 'ms_msg2',
        attr3 TYPE scx_attrname VALUE 'ms_msg3',
        attr4 TYPE scx_attrname VALUE 'ms_msg4',
      END OF no_resources.

    DATA ms_msg1 TYPE string.
    DATA ms_msg2 TYPE string.
    DATA ms_msg3 TYPE string.
    DATA ms_msg4 TYPE string.


    METHODS constructor
      IMPORTING
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL
        ms_msg1   TYPE string OPTIONAL
        ms_msg2   TYPE string OPTIONAL
        ms_msg3   TYPE string OPTIONAL
        ms_msg4   TYPE string OPTIONAL.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_excepcion_dnavas IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor(
    previous = previous
    ).
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    me->ms_msg1 = ms_msg1.
    me->ms_msg2 = ms_msg2.
    me->ms_msg3 = ms_msg3.
    me->ms_msg4 = ms_msg4.

  ENDMETHOD.
ENDCLASS.
