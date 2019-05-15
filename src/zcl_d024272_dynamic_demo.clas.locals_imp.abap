*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

types:
  begin of my_struct,
    comp_int    type i,
    comp_string type string,
  end of my_struct.

class cl_my_class definition.
  public section.
    data:
      pub_attr type i.
    methods:
      get_value returning value(val) type i.
endclass.

class cl_my_class implementation.

  method get_value.
    val = 1905.
  endmethod.

endclass.
