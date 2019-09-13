class zcl_d024272_dyn_call_func definition
  public
  final
  create public .

  public section.
    interfaces if_oo_adt_classrun.

  protected section.

  private section.

endclass.



class zcl_d024272_dyn_call_func implementation.

  method if_oo_adt_classrun~main.

    data(calls) = value string_table( ( `ZD024272_FM_001` ) ( `ZD024272_FM_002` )
                                      ( `DB_ROLLBACK` )
                                      ( `ZD024272_FM_002` ) ( `ZD024272_FM_001` ) ).

    loop at calls into data(call).
      call function call exporting out = out.
    endloop.

  endmethod.

endclass.
