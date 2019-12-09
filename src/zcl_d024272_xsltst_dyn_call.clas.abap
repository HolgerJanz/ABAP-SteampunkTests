class zcl_d024272_xsltst_dyn_call definition
  public
  final
  create public .

  public section.
    interfaces if_oo_adt_classrun.
  protected section.
  private section.
endclass.



class zcl_d024272_xsltst_dyn_call implementation.


  method if_oo_adt_classrun~main.

    data:
      begin of my_data,
        comp1 type i value 42,
      end of my_data.

    data(trafoName)  = 'ID'.

    call transformation (trafoName) source my_data = my_data result xml data(xml).

    out->write( cl_abap_conv_codepage=>create_in( )->convert(  xml ) ).

  endmethod.

endclass.
