class zcl_d024272_dyn_where_itab definition
  public
  final
  create public .

  public section.
    interfaces if_oo_adt_classrun.

  protected section.

  private section.
    data:
      begin of itabLine,
        key type i,
        value type i,
      end of itabLine,
      itab like table of itabLine.
    methods:
      select importing whereClause type string returning value(resultItab) like itab,
      delete importing whereClause type string,
      modify importing whereClause type string newValue type data.

endclass.



class zcl_d024272_dyn_where_itab implementation.

  method if_oo_adt_classrun~main.

    me->itab = value #( ( key = 1 value = 43 )
                        ( key = 2 value = 44 )
                        ( key = 3 value = 45 ) ).

    out->write( 'Dyn Loop Where' ).
    data(dynSelectItab) = me->select(  `key > 1 and value < 45` ).
    out->write( dynSelectItab ).

    out->write( 'Dyn Delete Where' ).
    me->delete(  `key > 2` ).
    out->write( me->itab ).

    out->write( 'Dyn Modify Where' ).
    me->modify(  whereClause = `key < 2` newValue = 42 ).
    out->write( me->itab ).

  endmethod.

  method select.

    loop at me->itab into me->itabLine where (whereClause).
      insert me->itabLine into table resultItab.
    endloop.

  endmethod.

  method delete.

    delete me->itab where (whereClause).

  endmethod.

  method modify.
    me->itabLine-value = newValue.

    modify me->itab from me->itabLine transporting value where (whereClause).

  endmethod.

endclass.
