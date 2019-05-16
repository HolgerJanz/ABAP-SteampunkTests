FUNCTION ZD024272_DEPRECATED_TEST.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  EXCEPTIONS
*"      MY_OLD_EXCP
*"----------------------------------------------------------------------
  perform my_form.


    DATA: mid   TYPE sy-msgid VALUE 'SABAPDEMOS',
      mtype TYPE sy-msgty VALUE 'I',
      num   TYPE sy-msgno VALUE '014'.

    MESSAGE ID mid TYPE mtype NUMBER num into data(msg). " into data(msg).


  if sy-subrc <> 0.
    raise my_old_excp.
  endif.

  data itab type table of i.

  loop at itab assigning field-symbol(<wa>).
    at end of table_line.
    endat.
    at first.
    endat.
    at last.
    endat.
    at new table_line.
    endat.
  endloop.

endfunction.


form my_form.

  statics my_static type i.

  add 42 to my_static.
  multiply my_static by 2.
  subtract 7 from my_static.
  divide my_static by 10.

  get reference of my_static into data(dat_ref).


endform.
