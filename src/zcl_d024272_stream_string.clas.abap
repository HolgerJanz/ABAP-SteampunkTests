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

    data(str) = |abcdefghijklm|.

    data(stream) = cast if_abap_reader( new cl_abap_string_c_reader( str ) ).
    out->write( 'read string via stream interface' ).
    data(readData) = ||.
    while stream->data_available( ).
      stream->read( exporting length = 1 importing read_data = readData ).
      out->write( readData ).
    endwhile.

    stream = cast if_abap_reader( new CL_ABAP_ITAB_C_READER( value string_table( ( `abcdef` ) ( `ghi` ) ( `jklm` ) ) ) ).
    out->write( 'read table of string via stream interface' ).
    while stream->data_available(  ).
      stream->read( exporting length = 2 importing read_data = readData ).
      out->write( readData ).
    endwhile.

  endmethod.

endclass.
