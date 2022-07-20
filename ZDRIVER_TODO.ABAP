*&---------------------------------------------------------------------*
*& Report ZDRIVER_TODO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZDRIVER_TODO.
DATA: WA_FINAL TYPE ZSTR_TODO,
      IT_FINAL TYPE ZTT_TODO.
DATA: ZF_NAM TYPE RS38L_FNAM.
SELECT TASK_NO TASK_DET DATE_CR DATE_DUE FROM ZTODOL_HAR1 INTO TABLE IT_FINAL.
CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
  EXPORTING
    formname                 = 'ZSF_TODO'
*   VARIANT                  = ' '
*   DIRECT_CALL              = ' '
 IMPORTING
   FM_NAME                  = ZF_NAM
* EXCEPTIONS
*   NO_FORM                  = 1
*   NO_FUNCTION_MODULE       = 2
*   OTHERS                   = 3
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.

CALL FUNCTION '/1BCDWB/SF00004815'
* EXPORTING
*   ARCHIVE_INDEX              =
*   ARCHIVE_INDEX_TAB          =
*   ARCHIVE_PARAMETERS         =
*   CONTROL_PARAMETERS         =
*   MAIL_APPL_OBJ              =
*   MAIL_RECIPIENT             =
*   MAIL_SENDER                =
*   OUTPUT_OPTIONS             =
*   USER_SETTINGS              = 'X'
* IMPORTING
*   DOCUMENT_OUTPUT_INFO       =
*   JOB_OUTPUT_INFO            =
*   JOB_OUTPUT_OPTIONS         =
  TABLES
    itab                       = IT_FINAL
* EXCEPTIONS
*   FORMATTING_ERROR           = 1
*   INTERNAL_ERROR             = 2
*   SEND_ERROR                 = 3
*   USER_CANCELED              = 4
*   OTHERS                     = 5
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.
