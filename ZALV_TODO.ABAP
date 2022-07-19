*&---------------------------------------------------------------------*
*& Report ZALV_TODO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zalv_todo.
DATA: cont    TYPE REF TO cl_gui_custom_container,
      grid    TYPE REF TO cl_gui_alv_grid,
      it_todo TYPE STANDARD TABLE OF ztodol_har1.
SELECT * FROM ztodol_har1 INTO TABLE it_todo.
CALL SCREEN 530.
MODULE status_0530 OUTPUT.
*  SET PF-STATUS 'xxxxxxxx'.
*  SET TITLEBAR 'xxx'.
  CREATE OBJECT cont
    EXPORTING
*     parent         =
      container_name = 'CONT'
*     style          =
*     lifetime       = lifetime_default
*     repid          =
*     dynnr          =
*     no_autodef_progid_dynnr     =
*    EXCEPTIONS
*     cntl_error     = 1
*     cntl_system_error           = 2
*     create_error   = 3
*     lifetime_error = 4
*     lifetime_dynpro_dynpro_link = 5
*     others         = 6
    .
  IF sy-subrc <> 0.
*   MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*              WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.
  CREATE OBJECT grid
    EXPORTING
*     i_shellstyle      = 0
*     i_lifetime        =
      i_parent = cont
*     i_appl_events     = space
*     i_parentdbg       =
*     i_applogparent    =
*     i_graphicsparent  =
*     i_name   =
*     i_fcat_complete   = SPACE
*    EXCEPTIONS
*     error_cntl_create = 1
*     error_cntl_init   = 2
*     error_cntl_link   = 3
*     error_dp_create   = 4
*     others   = 5
    .
  IF sy-subrc <> 0.
*   MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*              WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.

CALL METHOD grid->set_table_for_first_display
  EXPORTING
*    i_buffer_active               =
*    i_bypassing_buffer            =
*    i_consistency_check           =
     i_structure_name              = 'ztodol_har1'
*    is_variant                    =
*    i_save                        =
*    i_default                     = 'X'
*    is_layout                     =
*    is_print                      =
*    it_special_groups             =
*    it_toolbar_excluding          =
*    it_hyperlink                  =
*    it_alv_graphics               =
*    it_except_qinfo               =
*    ir_salv_adapter               =
  CHANGING
    it_outtab                     = it_todo
*    it_fieldcatalog               =
*    it_sort                       =
*    it_filter                     =
*  EXCEPTIONS
*    invalid_parameter_combination = 1
*    program_error                 = 2
*    too_many_lines                = 3
*    others                        = 4
        .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.


ENDMODULE.

*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0529  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0530 INPUT.

ENDMODULE.
