class zcl_d024272_unit_of_measure definition
  public
  final
  create public .

  public section.
    interfaces if_oo_adt_classrun.

  protected section.

  private section.

endclass.



class zcl_d024272_unit_of_measure implementation.

  method if_oo_adt_classrun~main.

    data(uomHdl) = cl_uom_conversion=>create(  ).

    uomHdl->si_unit_get( exporting unit = 'FT' dimension = 'LENGTH' importing si_unit = data(siUnit) ).
    select single from I_UnitOfMeasureText fields UnitOfMeasureLongName where Language = @sy-langu and UnitOfMeasure = @siUnit into @data(siUnitLongName).
    out->write( |SI unit of FT is: { siUnit } ({ siUnitLongName })| ).

    data(feet) = 10.
    data(meter) = 0.
    uomHdl->unit_conversion_simple( exporting input = feet unit_in = 'FT' unit_out = 'M' importing output = meter ).
    out->write( |{ feet }FT = { meter }M| ).

    uomHdl->unit_parameters_get( exporting unit = 'FT' ).

*    select from I_UnitOfMeasure fields * into table @data(UOM).
*    out->write(  UOM ).
*
*    select from I_UnitOfMeasureCommercialName fields * into table @data(UOMComNam).
*    out->write(  UOMComNam ).
*
*    select from  I_UnitOfMeasureISOCode fields * into table @data(UOMISOCode).
*    out->write(  UOMISOCode ).
*
*    select from I_UnitOfMeasureISOCodeText fields * into table @data(UOMISOCodeText).
*    out->write(  UOMISOCodeText ).
*
*    select from I_UnitOfMeasureTechnicalName fields * into table @data(UOMTechNam).
*    out->write(  UOMTechNam ).

  endmethod.

endclass.
