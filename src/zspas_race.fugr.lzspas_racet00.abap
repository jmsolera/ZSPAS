*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 15.01.2021 at 15:53:52
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZSPAS_RACE......................................*
DATA:  BEGIN OF STATUS_ZSPAS_RACE                    .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZSPAS_RACE                    .
CONTROLS: TCTRL_ZSPAS_RACE
            TYPE TABLEVIEW USING SCREEN '9000'.
*.........table declarations:.................................*
TABLES: *ZSPAS_RACE                    .
TABLES: ZSPAS_RACE                     .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
