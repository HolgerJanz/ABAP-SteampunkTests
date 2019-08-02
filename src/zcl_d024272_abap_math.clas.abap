class zcl_d024272_abap_math definition
  public
  final
  create public .

  public section.
    interfaces if_oo_adt_classrun.

  protected section.

  private section.

endclass.



class zcl_d024272_abap_math implementation.

  method if_oo_adt_classrun~main.

    data(f1) = conv f(  '1.005' ).
    data(f2) = cl_abap_math=>round_f_to_15_decs( f1 ).
    out->write( |round f to 15 places { f1 } ~ { f2 }| ).

    data(d1) = conv decfloat34( '1.2001' ) - conv decfloat34( '0.0001' ).
    data(d2) = cl_abap_math=>normalize(  d1 ).
    out->write( |normalize decfloat { d1 }({ cl_abap_math=>get_scale( d1 ) }/{ cl_abap_math=>get_number_of_digits( d1 ) }) = { d2 }({ cl_abap_math=>get_scale( d2 ) }/{ cl_abap_math=>get_number_of_digits( d2 ) })| ).

  endmethod.

endclass.
