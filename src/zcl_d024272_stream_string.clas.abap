class zcl_d024272_stream_string definition
  public
  final
  create public .

  public section.
    interfaces if_oo_adt_classrun.

  protected section.

  private section.

endclass.



class zcl_d024272_stream_string implementation.

  method if_oo_adt_classrun~main.

    data(str) = |abcdefghijklmn|.

    data(stream) = cast if_abap_reader( new cl_abap_string_c_reader( str ) ).

*   read string via stream interface
    data(readData) = ||.
    while stream->data_available( ).
      stream->read( exporting length = 1 importing read_data = readData ).
      out->write( readData ).
    endwhile.

  endmethod.

endclass.
