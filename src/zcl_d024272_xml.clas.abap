class zcl_d024272_xml definition
  public
  final
  create public.

  public section.
    interfaces if_oo_adt_classrun.
    interfaces if_serializable_object.

  protected section.

  private section.
    data x type i value 42.

endclass.


class zcl_d024272_xml implementation.

  method if_oo_adt_classrun~main.
    data(conv) = cl_abap_conv_codepage=>create_in(  ).

    out->write( 'Example XML Serialize' ).
    data(r) = new zcl_d024272_xml( ).
    call transformation ID source root = r result xml data(xml).
    out->write( conv->convert( xml ) ).

  endmethod.

endclass.
