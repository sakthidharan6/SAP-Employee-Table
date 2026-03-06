CLASS zcl_employee_cit DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_employee_cit IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: gv_emp_id    TYPE i,
          gv_emp_name  TYPE string,
          gv_emp_score TYPE i.

    CONSTANTS: gc_min_score TYPE i VALUE 60.

    TYPES: BEGIN OF ty_employee,
             id    TYPE i,
             name  TYPE string,
             score TYPE i,
           END OF ty_employee.

    DATA: gt_employee TYPE STANDARD TABLE OF ty_employee,
          gs_employee  TYPE ty_employee.

    gs_employee-id    = 1.
    gs_employee-name  = 'Aravindh'.
    gs_employee-score = 85.
    APPEND gs_employee TO gt_employee.

    gs_employee-id    = 2.
    gs_employee-name  = 'Rahul'.
    gs_employee-score = 45.
    APPEND gs_employee TO gt_employee.

    LOOP AT gt_employee INTO gs_employee.
      out->write( |{ gs_employee-id } { gs_employee-name } { gs_employee-score }| ).
    ENDLOOP.
    READ TABLE gt_employee INTO gs_employee WITH KEY id = 2.
    IF sy-subrc = 0.
      out->write( |Employee Found: { gs_employee-name }| ).
    ELSE.
      out->write( 'Employee Not Found' ).
    ENDIF.

    out->write( 'Step 1 Complete: Employee variables declared.' ).

  ENDMETHOD.
ENDCLASS.
