class zcl_d024272_rtti definition
  public
  create public

  global friends cl_abap_typedescr .

  public section.

    interfaces if_oo_adt_classrun.

  private section.
    data priv type i.
endclass.



class zcl_d024272_rtti implementation.


  method if_oo_adt_classrun~main.

  "BY NAME
    "SYST
    try.
        cl_abap_typedescr=>describe_by_name( 'SYST' ).
      catch cx_sy_rtti_type_not_released into data(ex01).
    endtry.
    assert ex01 is not initial.

    "public type of released class
    try.
        data(td01) = cl_abap_typedescr=>describe_by_name( 'CL_ABAP_CHAR_UTILITIES=>TY_NUMBER_FORMAT' ).
      catch cx_sy_rtti_type_not_released into data(ex02).
    endtry.
    assert ex02 is initial.

    "absolute type name
    try.
        cl_abap_refdescr=>create_by_name( td01->absolute_name ).
      catch cx_sy_rtti_type_not_released into data(ex03).
    endtry.
    assert ex03 is not initial.

  "CL_ABAP_CLASSDESCR
    "own private attribute
    data(cd11) = cast cl_abap_classdescr( cl_abap_typedescr=>describe_by_object_ref( me ) ).
    try.
        data(td11) = cd11->get_attribute_type( 'PRIV' ).
      catch cx_sy_rtti_type_not_released into data(ex11).
    endtry.
    assert ex11 is initial.

    "protected type in final released class
    data(cd12) = cast cl_abap_classdescr( cl_abap_typedescr=>describe_by_name( 'CL_ABAP_REFDESCR' ) ).
    try.
        cd12->get_type( 'XTYPE_TYPE' ).
      catch cx_sy_rtti_type_not_released into data(ex12).
    endtry.
    assert ex12 is not initial.

    "attributes contain information about private/protected section
    cd12 = cd12. "view in debugger.

    "exemption for parameter type DFIES of GET_DDIC_FIELD
    data(cd13) = cast cl_abap_classdescr(  cl_abap_typedescr=>describe_by_name( 'CL_ABAP_ELEMDESCR' ) ).
    try.
        cd13->get_method_parameter_type( p_method_name = 'GET_DDIC_FIELD' p_parameter_name = 'P_FLDDESCR' ).
      catch cx_sy_rtti_type_not_released into data(ex13).
    endtry.
    assert ex13 is not initial.

  "Structure components
    "all component types can be accessed by navigation (e.g. with method get_components) ...
    data(sd21) = cast cl_abap_structdescr( cl_abap_typedescr=>describe_by_name( 'SXSDDURATION' ) ).
    data(comptab) = sd21->get_components( ).

    "but not by their type name
    try.
        data(type_name) = comptab[ 1 ]-type->get_relative_name( ).
        cl_abap_typedescr=>describe_by_name( type_name ).
      catch cx_sy_rtti_type_not_released into data(ex31).
    endtry.
    assert ex31 is not initial.

    "no whitelist check in describe_by_data
    data stru type sxsdduration.
    try.
        data(td31) = cl_abap_typedescr=>describe_by_data( stru-xsdsign ).
      catch cx_sy_rtti_type_not_released into data(ex32).
    endtry.
    assert ex32 is initial.

  "References
    data stru41 type sxsdduration.
    data(ref41) = ref #( stru41-xsdsign ).
    assign ref41->* to field-symbol(<fs>).

    "the dynamic assign failed because ref41->* is not whitelisted
    assert <fs> is not assigned.

    "the RTTI methods fail for the same reason
    try.
        cl_abap_typedescr=>describe_by_data_ref( ref41 ).
      catch cx_sy_rtti_type_not_released into data(ex41).
    endtry.
    assert ex41 is not initial.

    data(rd41) = cast cl_abap_refdescr( cl_abap_typedescr=>describe_by_data( ref41 ) ).
    try.
        rd41->get_referenced_type( ).
      catch cx_sy_rtti_type_not_released into data(ex42).
    endtry.
    assert ex42 is not initial.

  "RTTC
    data(sd51) = cast cl_abap_structdescr( cl_abap_typedescr=>describe_by_name( 'SXSDDURATION' ) ).
    data(comptab51) = sd51->get_components( ).
    data(sd52) = cl_abap_structdescr=>get( comptab51 ).
    data ref51 type ref to data.
    create data ref51 type handle sd51.
    assign ref51->* to field-symbol(<fs51>).
    <fs51> = value sxsdduration( xsdsign = -1 ).

    out->write( 'OK' ).

  endmethod.

endclass.
