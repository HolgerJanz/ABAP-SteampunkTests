class zcl_d024272_dynsql_demo definition
  public
  final
  create public .

  public section.
    interfaces if_oo_adt_classrun.

  protected section.

  private section.

    methods initTable .
endclass.



class zcl_d024272_dynsql_demo implementation.

  method if_oo_adt_classrun~main.

    data:
      resultSelect type table of zd024272_tab1,
      excp type ref to cx_root.

    me->initTable(  ).

    data(tabName) = 'zd024272_tab1'.

    select * from (tabName)
      into table @resultSelect.
    out->write(  resultSelect ).

    data(whereClause) = 'key1 = 42 and key2 = 0'.
    select * from (tabName)
      where (whereClause)
      into table @resultSelect.
    out->write(  resultSelect ).

    try.
      clear excp.
      whereClause = 'key1 = 42 and key2 = @sy-subrc'.
      select * from (tabName)
        where (whereClause)
        into table @resultSelect.
      catch cx_sy_dynamic_osql_error into excp.
        out->write( 'WHERE OK: Expected Exception' ).
    endtry.
    if excp is initial.
        out->write( 'WHERE ERROR: Expected Exception' ).
    endif.



  endmethod.

  method initTable.
    delete from zd024272_tab1.
    insert zd024272_tab1 from table @( value #(
       ( key1 = 13 comp1 = 'Test13' )
       ( key1 = 42 comp1 = 'Test42' )
    ) ).
    commit work.
  endmethod.

endclass.
