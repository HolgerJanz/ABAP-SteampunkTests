class zcl_d024272_badi definition
  public
  final
  create public .

  public section.
    interfaces if_oo_adt_classrun.
  protected section.
  private section.
endclass.



class zcl_d024272_badi implementation.

  method if_oo_adt_classrun~main.

    out->write( 'BADI Example' ).
    data b type ref to z_d024272_badi_def.
    get badi b.
    call badi b->test exporting out = out.
    "call badi b->('TEST') exporting out = out. "out, later

    " short dump CALL_METHOD_NOT_PERMITTED
    "b->get_dyn_instance( badi_name = 'ANY' ).

  endmethod.

endclass.
