class zcl_d024272_badi_imp definition
  public
  final
  create public .

  public section.
    interfaces zif_d024272_badi_def.

  protected section.
  private section.
endclass.



class zcl_d024272_badi_imp implementation.

  method zif_d024272_badi_def~test.
    out->write( 'BADI IMP zcl_d024272_badi_imp=>zif_d024272_badi_def~test called' ).
  endmethod.

endclass.
