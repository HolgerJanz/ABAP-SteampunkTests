class zcl_d024272_abap_parallel definition
  public
  final
  create public .

  public section.
    interfaces if_oo_adt_classrun.

  protected section.

  private section.

endclass.



class zcl_d024272_abap_parallel implementation.

  method if_oo_adt_classrun~main.

    " parallel square calculation
    " using interface
    data(ref_parallel) = new cl_abap_parallel( ).
    " define tasks
    data(in_tab) =
      value cl_abap_parallel=>t_in_inst_tab(
        for i = 1 until i > 10
          ( new parallel_task_square( i ) ) ).
    " execute
    ref_parallel->run_inst( exporting p_in_tab = in_tab importing p_out_tab = data(out_tab) ).
    " merge results
    data(result) =
      value string_table(
        for <out_wa> in out_tab
          let inst = cast parallel_task_square( <out_wa>-inst )
          in ( |{ inst->input }^2 = { inst->result }| ) ).
    " output result
    out->write( result ).

    clear result.
    " parallel factor calculation
    " using inheriting from cl_abap_parallel
    data:
      l_in_tab type cl_abap_parallel=>t_in_tab,
      l_out    type int8,
      l_in     type int8.
    " define tasks
    data(l_ref) = new parallel_task_factor( 10 ).
    do 10 times.
      call transformation id source in = sy-index
        result xml data(l_in_xml).
      append l_in_xml to l_in_tab.
    enddo.
    " execute
    l_ref->run( exporting p_in_tab = l_in_tab importing p_out_tab = data(l_out_tab) ).
    " merge results
    loop at l_out_tab assigning field-symbol(<l_out>).
      call transformation id source xml <l_out>-result
        result in = l_in out = l_out.
      append |{ l_in } * 10 = { l_out }| to result.
    endloop.
    " output result
    out->write( result ).


  endmethod.

endclass.
