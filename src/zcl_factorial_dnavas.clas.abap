CLASS zcl_factorial_dnavas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.
  PUBLIC SECTION.

    METHODS geT_factorial IMPORTING i_factorial TYPE i
                          EXPORTING e_factorial TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_factorial_dnavas IMPLEMENTATION.
  METHOD get_factorial.

    DATA(l_factorial) = i_factorial.
    DATA l_number type i.

    l_number = i_factorial.

    e_factorial = 1.

    WHILE l_number > 0.
      e_factorial = e_factorial * l_number.
      l_number -= 1.
    ENDWHILE.

  ENDMETHOD.

ENDCLASS.
