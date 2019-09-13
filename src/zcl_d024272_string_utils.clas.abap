class zcl_d024272_string_utils definition
  public
  final
  create public .

  public section.
    interfaces if_oo_adt_classrun.

  protected section.

  private section.

endclass.



class zcl_d024272_string_utils implementation.

  method if_oo_adt_classrun~main.

*   delete trailing blanks
    data(str_w) = |abc   |.
    data(str_wo) = str_w.
    cl_abap_string_utilities=>del_trailing_blanks( changing str = str_wo ).
    out->write( |String with "{ str_w }" and without "{ str_wo }" trailing blanks| ).

*   preserve trailing blanks
    data char10 type c length 10 value '123'.
    str_wo = char10.
    cl_abap_string_utilities=>c2str_preserving_blanks( exporting source = char10
                                                       importing dest = str_w ).
    out->write( |String to Char with "{ str_w }" and without "{ str_wo }" trailing blanks| ).

*   calculate edit cost (cost of DEL and INS is double of SUB cost)
    data(editCost) = cl_abap_string_utilities=>edit_distance( exporting val1 = 'abcdef' val2 = 'abxef'
                                                                        cost_del = 2 cost_ins = 2 cost_sub = 1 ).
    out->write( |Edit cost from "abcdef" to "abxef" = { editCost }.| ).

  endmethod.

endclass.
