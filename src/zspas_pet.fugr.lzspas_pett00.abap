*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 21.01.2021 at 19:53:19
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZSPAS_PET.......................................*
DATA:  BEGIN OF STATUS_ZSPAS_PET                     .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZSPAS_PET                     .
CONTROLS: TCTRL_ZSPAS_PET
            TYPE TABLEVIEW USING SCREEN '9000'.
*.........table declarations:.................................*
TABLES: *ZSPAS_PET                     .
TABLES: ZSPAS_PET                      .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
