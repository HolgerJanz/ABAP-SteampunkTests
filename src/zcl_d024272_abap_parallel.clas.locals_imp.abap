*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

class parallel_task_square definition.
  public section.
    interfaces if_abap_parallel.
    methods constructor importing p_input type i.
    data input type i.
    data result type i.
endclass.

class parallel_task_square implementation.

  method constructor.
    super->constructor( ).
    input = p_input.
  endmethod.

  method if_abap_parallel~do.
    result = input * input.
  endmethod.

endclass.

class parallel_task_factor definition final
  inheriting from cl_abap_parallel.

  public section.
    methods do redefinition.
    methods constructor importing p_factor type i.
    data factor type int8.

endclass.

class parallel_task_factor implementation.

  method constructor.
    super->constructor( ).
    factor = p_factor.
  endmethod.

  method do.
    data:
      l_in  type int8,
      l_out type int8.

    call transformation id source xml p_in
      result in = l_in.

    l_out = l_in * factor .

    call transformation id source in = l_in out = l_out
      result xml p_out.

  endmethod.

endclass.
