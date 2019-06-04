class zcl_d024272_dynsql_demo definition
  public
  final
  create public .

  public section.
    interfaces if_oo_adt_classrun.

  protected section.

  private section.

    methods inittable .
endclass.



class zcl_d024272_dynsql_demo implementation.

  method if_oo_adt_classrun~main.

    data:
      resultselect type table of zd024272_tab1,
      excp         type ref to cx_root.

    me->inittable(  ).

    data(tabname) = `zd024272_tab1`.


* select from
    select * from (tabname)
      into table @resultselect.

* select where
    data(whereclause) = `key1 = 42 and key2 = 0`.
    select * from (tabname)
      where (whereclause)
      into table @resultselect.

* select on
    data(my_loc_var) = 'foo'.
    select *
      from  zd024272_tab1 as x join zd024272_tab1 as y
      on ('x~key1 = y~key2 and y~comp1 = @my_loc_var')
      into table @data(resultjoin).

    out->write( resultjoin ).

* select having
    select comp1
      from zd024272_tab1
      group by comp1
      having ('comp1 = @my_loc_int')
      into table @data(resulthaving).

  endmethod.

  method inittable.
    delete from zd024272_tab1.
    insert zd024272_tab1 from table @( value #(
       ( key1 = 13 comp1 = 'Test13' )
       ( key1 = 42 comp1 = 'Test42' )
    ) ).
    commit work.
  endmethod.

endclass.
