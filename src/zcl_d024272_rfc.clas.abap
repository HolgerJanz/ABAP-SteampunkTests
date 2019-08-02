class zcl_d024272_rfc definition
  public
  final
  create public .

  public section.
    interfaces if_oo_adt_classrun.

  protected section.

  private section.

endclass.



class zcl_d024272_rfc implementation.

  method if_oo_adt_classrun~main.

    out->write(  'start rfc' ).

    call function 'DB_COMMIT' destination space.

    call function 'DB_COMMIT' destination 'S55'.

    out->write(  'end rfc' ).


  endmethod.

endclass.
