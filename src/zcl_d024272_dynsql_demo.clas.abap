class zcl_d024272_dynsql_demo definition
  public
  final
  create public .

  public section.
    interfaces if_oo_adt_classrun.
    methods initTable.
    methods selectTable
      importing tabName type string
                whereClause type string
      returning value(resultTab) type ref to data.

  protected section.

  private section.

endclass.



class zcl_d024272_dynsql_demo implementation.

  method if_oo_adt_classrun~main.

    data:
      resultSelect type table of zd024272_tab1.
    me->initTable(  ).
    data(tabName) = `zd024272_tab1`.


* select from
    select * from (tabName)
      into table @resultSelect.

* select where
    data(whereclause) = `key1 = 42 and key2 = 0`.
    select * from (tabName)
      where (whereclause)
      into table @resultSelect.

* select on
    data(my_loc_var) = 'foo'.
    select *
      from  zd024272_tab1 as x join zd024272_tab1 as y
      on ('x~key1 = y~key2 and y~comp1 = @my_loc_var')
      into table @data(resultjoin).

* select having
    select comp1
      from zd024272_tab1
      group by comp1
      having ('comp1 = @my_loc_var')
      into table @data(resulthaving).

* update
    update (tabName) set comp2 = 13 where comp1 = 'foo'.

* modify
    data(waModify) = value zd024272_tab1( key1 = 4711 key2 = 42 comp1 = 'foo' comp2 = 'bar' ).
    modify (tabName) from @waModify.

* insert
    data(waInsert) = value zd024272_tab1( key1 = 4713 key2 = 69 comp1 = 'foo' comp2 = 'bar' ).
    insert into (tabName) values @waInsert.

* delete
    data(dynWhere) = 'key1 = 4711'.
    delete from zd024272_tab1 where (dynWhere).

* Scenario select any table
*   country
    data(countriesRef) = selectTable( tabName = 'i_country'
                                      whereClause = 'CountryThreeDigitISOCode > 1 and ' &
                                                    'CountryThreeDigitISOCode < 10' ).
    assign countriesRef->* to field-symbol(<resultCountries>).
    out->write(  <resultCountries> ).

*   currency
    data(currenciesRef) = selectTable( tabName = 'i_currency'
                                whereClause = 'CurrencyISOCode like ''D%''').
    assign currenciesRef->* to field-symbol(<resultCurrencies>).
    out->write(  <resultCurrencies> ).

  endmethod.

  method selectTable.

    create data resultTab type table of (tabName).
    field-symbols <table> type any table.
    assign resultTab->* to <table>.
    select * from (tabName) where (whereClause) into table @<table>.

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
