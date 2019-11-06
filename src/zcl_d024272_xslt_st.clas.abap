class zcl_d024272_xslt_st definition
  public final create public .

  public section.
    interfaces if_oo_adt_classrun.
    methods method01 importing x type i returning value(y) type i.

  protected section.

  private section.

endclass.



class zcl_d024272_xslt_st implementation.

  method if_oo_adt_classrun~main.

    data(my_st) = 'ZD024272_TRAFO_ST'.

    data(conv) = cl_abap_conv_codepage=>create_in(  ).

    data(r1) = conv d( '20190401' ).
    data(r2) = conv char255( 'Hello World!' ).
    data(r3) = abap_true.
    data:
      begin of r4,
        c1 type i value 42,
        c2 type i value 17,
      end of r4.

    call transformation (my_st)
      source
        r1 = r1 r2 = r2 r3 = r3 r4 = r4
      result xml
        data(xml).

    out->write( conv->convert( xml ) ).

  endmethod.

  method method01.
    y = x + 3.
  endmethod.

endclass.
