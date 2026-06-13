CLASS zcl_injection_dnavas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.

    METHODS geT_customer EXPORTING es_customer TYPE /dmo/customer.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_injection_dnavas IMPLEMENTATION.
  METHOD get_customer.

    DATA ls_customer TYPE /dmo/customer.
    DATA l_customer  TYPE /dmo/customer_id.

    l_customer = '000001'.

    SELECT SINGLE * FROM /dmo/customer
    WHERE customer_id = @l_customer
    INTO @es_customer.

    TEST-SEAM select_data.
      SELECT SINGLE * FROM /dmo/customer
          WHERE customer_id = @l_customer
          INTO @ls_customer.
    END-TEST-SEAM.

    IF l_customer = '000002'.
      es_customer = CORRESPONDING #( ls_customer ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
