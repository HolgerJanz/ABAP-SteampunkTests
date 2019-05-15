class zcl_d024272_dynamic_demo definition
  public
  final
  create public .

  public section.
    interfaces if_oo_adt_classrun.
  protected section.
  private section.
    methods data_type_demo
      importing type_name type string comp_name type string comp_value type data
      returning value(data_ref) type ref to data.
    methods class_type_demo
      importing class_name type string attr_name type string attr_value_meth type string
      returning value(obj_ref) type ref to object.
    class-methods performance_dynamic_create.
endclass.



class zcl_d024272_dynamic_demo implementation.

  method if_oo_adt_classrun~main.
    data:
      int_value type i,
      seed_value type i.

*
* Scenario: dynamic create of data and access to values
*
*   access to types of same delivery unit
    data(data_ref) = me->data_type_demo( type_name = `MY_STRUCT` comp_name = `COMP_INT` comp_value = 42 ).
    assign data_ref->('COMP_INT') to field-symbol(<fs>).
    out->write( |data_ref\{my_struct\}->comp_int = { <fs> }| ).

*   access to released types
    data_ref = me->data_type_demo( type_name = `SYMSG` comp_name = `MSGTY` comp_value = 'E' ).
    assign data_ref->('MSGTY') to <fs>.
    out->write( |data_ref\{msgty\}->msgty = { <fs> }| ).

*    raise exception for not released types
*    data_ref = me->data_type_demo( type_name = `SYST` comp_name = `SUBRC` comp_value = 42 ).



*
* Scenario: dynamic create of object and access to attribute
*
    data(obj_ref) = me->class_type_demo( class_name = 'CL_MY_CLASS' attr_name = 'PUB_ATTR' attr_value_meth = 'GET_VALUE').
    assign obj_ref->('PUB_ATTR') to <fs>.
    out->write( |obj_ref\{cl_my_class\}->pub_attr = { <fs> }| ).

*   use released API - random integer
    call method cl_abap_context_info=>('GET_SYSTEM_TIME') receiving rv_time = seed_value.
    call method ('CL_ABAP_RANDOM_INT')=>('CREATE') exporting seed = seed_value receiving prng = obj_ref.
    call method obj_ref->('GET_NEXT') receiving value = int_value.
    out->write( |first random integer = { int_value }| ).
    out->write( `Hallo` ).

*   syntax error for not released API (pseudo dynamic -> compiler knows literals and constants)
*    call method ('CL_ABAP_TYPEDESCR')=>('DESCRIBE_BY_NAME') exporting seed = seed_value receiving prng = obj_ref.

*   raise exception for not released API (real dynamic)
*    data(class_name) = 'CL_ABAP_TYPEDESCR'.
*    call method (class_name)=>('DESCRIBE_BY_NAME') exporting p_name = 'SYST' receiving p_descr_ref = obj_ref.


*
* Performance test
*
    do 100 times.
      zcl_d024272_dynamic_demo=>performance_dynamic_create( ).
    enddo.

  endmethod.


  method data_type_demo.

*   create data
    create data data_ref type (type_name).

*   access data
    assign data_ref->(comp_name) to field-symbol(<fs>).
    <fs> = comp_value.

  endmethod.


  method class_type_demo.
    data attr_value type i.

*   create object
    create object obj_ref type (class_name).

*   call method to receive value
    call method obj_ref->(attr_value_meth) receiving val = attr_value.

*   write value to attribute
    assign obj_ref->(attr_name) to field-symbol(<fs>).
    <fs> = attr_value.

  endmethod.

  method performance_dynamic_create.
    data r type ref to data.
    create data r type ('MATCH_RESULT').
  endmethod.

endclass.
