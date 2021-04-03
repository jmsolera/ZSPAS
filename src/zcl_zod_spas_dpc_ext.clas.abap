class ZCL_ZOD_SPAS_DPC_EXT definition
  public
  inheriting from ZCL_ZOD_SPAS_DPC
  create public .

public section.
protected section.

  methods PETSET_CREATE_ENTITY
    redefinition .
  methods PETSET_DELETE_ENTITY
    redefinition .
  methods PETSET_GET_ENTITY
    redefinition .
  methods PETSET_UPDATE_ENTITY
    redefinition .
  methods RACESET_GET_ENTITYSET
    redefinition .
  methods SPECIESSET_GET_ENTITYSET
    redefinition .
  methods PETSET_GET_ENTITYSET
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_ZOD_SPAS_DPC_EXT IMPLEMENTATION.


  METHOD petset_create_entity.
    DATA: ls_pet TYPE zspas_pet.

    CALL METHOD io_data_provider->read_entry_data
      IMPORTING
        es_data = ls_pet.

    ls_pet-mandt = sy-mandt.

    CALL FUNCTION 'NUMBER_GET_NEXT'
      EXPORTING
        nr_range_nr             = '01'
        object                  = 'ZPET_ID'
      IMPORTING
        number                  = ls_pet-pet_id
      EXCEPTIONS
        interval_not_found      = 1
        number_range_not_intern = 2
        object_not_found        = 3
        quantity_is_0           = 4
        quantity_is_not_1       = 5
        interval_overflow       = 6
        buffer_overflow         = 7
        OTHERS                  = 8.

    IF ls_pet-pet_id IS NOT INITIAL.
      INSERT zspas_pet FROM ls_pet.

      IF sy-subrc EQ 0.
        MOVE-CORRESPONDING ls_pet TO er_entity.

        COMMIT WORK.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD petset_delete_entity.
    DATA: ld_pet_id TYPE zspas_pet-pet_id.

    READ TABLE it_key_tab INTO DATA(ls_key) WITH KEY name = 'PetId'.
    IF sy-subrc EQ 0.
      CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
        EXPORTING
          input  = ls_key-value
        IMPORTING
          output = ld_pet_id.

      IF ld_pet_id IS NOT INITIAL.
        DELETE FROM zspas_pet WHERE pet_id EQ ld_pet_id.

        IF sy-subrc EQ 0.
          COMMIT WORK.
        ENDIF.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD petset_get_entity.
    DATA: ld_pet_id TYPE zspas_pet-pet_id.

    LOOP AT it_key_tab INTO DATA(ls_key).
      CASE ls_key-name.
        WHEN 'PetId'.
          CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
            EXPORTING
              input  = ls_key-value
            IMPORTING
              output = ld_pet_id.
      ENDCASE.
    ENDLOOP.

    IF ld_pet_id IS NOT INITIAL.
      SELECT SINGLE *
        INTO er_entity
        FROM zspas_pet
        WHERE pet_id EQ ld_pet_id.
    ENDIF.


  ENDMETHOD.


  METHOD petset_get_entityset.

    TYPES: lty_r_pet_id  TYPE RANGE OF zspas_pet-pet_id,
           lty_r_name    TYPE RANGE OF zspas_pet-name,
           lty_r_species TYPE RANGE OF zspas_pet-species,
           lty_r_race    TYPE RANGE OF zspas_pet-race,
           lty_r_color   TYPE RANGE OF zspas_pet-color,
           lty_r_adopted TYPE RANGE OF zspas_pet-adopted.

    DATA: lv_entity_name  TYPE /iwbep/med_external_name.


    DATA: li_r_pet_id  TYPE lty_r_pet_id,
          ls_r_pet_id  TYPE LINE OF lty_r_pet_id,

          li_r_name    TYPE lty_r_name,
          ls_r_name    TYPE LINE OF lty_r_name,

          li_r_species TYPE lty_r_species,
          ls_r_species TYPE LINE OF lty_r_species,

          li_r_race    TYPE lty_r_race,
          ls_r_race    TYPE LINE OF lty_r_race,

          li_r_color   TYPE lty_r_color,
          ls_r_color   TYPE LINE OF lty_r_color,

          li_r_adopted TYPE lty_r_adopted,
          ls_r_adopted TYPE LINE OF lty_r_adopted.


    DATA: ls_filter_select_options TYPE /iwbep/s_mgw_select_option,
          ls_select_options        TYPE /iwbep/s_cod_select_option.


    DATA: ls_sortorder    TYPE abap_sortorder,
          lt_sortorder    TYPE abap_sortorder_tab,
          ls_order        TYPE /iwbep/s_mgw_sorting_order,
          lo_dp_facade    TYPE REF TO /iwbep/cl_mgw_dp_facade,
          lo_model        TYPE REF TO /iwbep/if_mgw_odata_re_model,
          ls_entity_props TYPE /iwbep/if_mgw_odata_re_prop=>ty_s_mgw_odata_property,
          lt_entity_props TYPE /iwbep/if_mgw_odata_re_prop=>ty_t_mgw_odata_properties.

*************************************************************************
* Filter data                                                           *
*************************************************************************
    " Prepare filter
    LOOP AT it_filter_select_options INTO ls_filter_select_options.
      LOOP AT ls_filter_select_options-select_options INTO ls_select_options.

        CASE ls_filter_select_options-property.
          WHEN 'PetId'.
            CLEAR ls_r_pet_id.
            MOVE-CORRESPONDING ls_select_options TO ls_r_pet_id.
            APPEND ls_r_pet_id TO li_r_pet_id.

          WHEN 'Name'.
            CLEAR ls_r_name.
            MOVE-CORRESPONDING ls_select_options TO ls_r_name.
            APPEND ls_r_name TO li_r_name.

          WHEN 'SpeciesId'.
            CLEAR ls_r_species.
            MOVE-CORRESPONDING ls_select_options TO ls_r_species.
            APPEND ls_r_species TO li_r_species.

          WHEN 'RaceId'.
            CLEAR ls_r_race.
            MOVE-CORRESPONDING ls_select_options TO ls_r_race.
            APPEND ls_r_race TO li_r_race.

          WHEN 'Color'.
            CLEAR ls_r_color.
            MOVE-CORRESPONDING ls_select_options TO ls_r_color.
            APPEND ls_r_color TO li_r_color.

          WHEN 'Adopted'.
            CLEAR ls_r_adopted.
            MOVE-CORRESPONDING ls_select_options TO ls_r_adopted.
            APPEND ls_r_adopted TO li_r_adopted.

        ENDCASE.
      ENDLOOP.
    ENDLOOP.

    " Select data
    SELECT *
      INTO TABLE et_entityset
      FROM zspas_pet
      WHERE pet_id IN li_r_pet_id
        AND name IN li_r_name
        AND species IN li_r_species
        AND race IN li_r_race
        AND color IN li_r_color
        AND adopted IN li_r_adopted.

***    CALL METHOD /iwbep/cl_mgw_data_util=>filtering
***      EXPORTING
***        it_select_options = it_filter_select_options
***      CHANGING
***        ct_data           = et_entityset.










*************************************************************************
* Order data                                                            *
*************************************************************************
    " Order results
    IF et_entityset[] IS NOT INITIAL
    and it_order[] is NOT INITIAL.

      lv_entity_name = iv_entity_name.

      lo_dp_facade ?= me->/iwbep/if_mgw_conv_srv_runtime~get_dp_facade( ).
      lo_model = lo_dp_facade->/iwbep/if_mgw_dp_int_facade~get_model( ).
      lt_entity_props = lo_model->get_entity_type( lv_entity_name )->get_properties( ).

      LOOP AT it_order INTO ls_order.
        " Map Model Property to ABAP field name.
        READ TABLE lt_entity_props INTO ls_entity_props
        WITH KEY name = ls_order-property.
        IF sy-subrc = 0.
          " Build ABAP sort order table.
          CLEAR ls_sortorder.
          ls_sortorder-name = ls_entity_props-technical_name.
          IF to_upper( ls_order-order ) = 'DESC'.
            ls_sortorder-descending = abap_true.
          ENDIF.
          APPEND ls_sortorder TO lt_sortorder.
        ELSE.

        ENDIF.
      ENDLOOP.

      " Sort et_entityset table
      IF lt_sortorder[] IS NOT INITIAL.
        SORT et_entityset BY (lt_sortorder).
      ENDIF.
    ENDIF.

***    " The function module for Orderby condition
***    CALL METHOD /iwbep/cl_mgw_data_util=>orderby
***      EXPORTING
***        it_order = it_order
***      CHANGING
***        ct_data  = et_entityset.



*************************************************************************
* Skip & Top                                                            *
*************************************************************************
***    " The function module for $top and $skip Query Options
***    CALL METHOD /iwbep/cl_mgw_data_util=>paging
***      EXPORTING
***        is_paging = is_paging
***      CHANGING
***        ct_data   = et_entityset.



*************************************************************************
* Count                                                                 *
*************************************************************************
    " Count entries
    IF io_tech_request_context->has_inlinecount( ) = abap_true.
      DESCRIBE TABLE et_entityset LINES es_response_context-inlinecount.
    ELSE.
      CLEAR es_response_context-inlinecount.
    ENDIF.

  ENDMETHOD.


  METHOD petset_update_entity.

    DATA: ls_pet    TYPE zspas_pet,
          ld_pet_id TYPE zspas_pet-pet_id.

    READ TABLE it_key_tab INTO DATA(ls_key) WITH KEY name = 'PetId'.
    IF sy-subrc EQ 0.
      CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
        EXPORTING
          input  = ls_key-value
        IMPORTING
          output = ld_pet_id.
    ENDIF.

    CALL METHOD io_data_provider->read_entry_data
      IMPORTING
        es_data = ls_pet.

    ls_pet-pet_id = ld_pet_id.

    IF ls_pet-pet_id IS NOT INITIAL.
      MODIFY zspas_pet FROM ls_pet.
      IF sy-subrc eq 0.
        MOVE-CORRESPONDING ls_pet TO er_entity.
        COMMIT WORK.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD raceset_get_entityset.
    TYPES: lty_r_spcies_id TYPE RANGE OF zspas_race-species.

    DATA: li_r_species_id TYPE lty_r_spcies_id,
          ls_r_species_id TYPE LINE OF lty_r_spcies_id.

    LOOP AT it_filter_select_options INTO DATA(ls_filter_select_option).
      LOOP AT ls_filter_select_option-select_options INTO DATA(ls_select_options).
        CASE ls_filter_select_option-property.
          WHEN 'SpeciesId'.
            CLEAR ls_r_species_id.
            MOVE-CORRESPONDING ls_select_options TO ls_r_species_id.
            APPEND ls_r_species_id TO li_r_species_id.
        ENDCASE.
      ENDLOOP.
    ENDLOOP.

*    IF li_r_species_id[] IS NOT INITIAL.
      SELECT *
        INTO TABLE et_entityset
        FROM zspas_race
        WHERE species IN li_r_species_id.
*    ENDIF.

  ENDMETHOD.


  METHOD speciesset_get_entityset.

    SELECT *
      INTO TABLE et_entityset
      FROM zspas_species.

  ENDMETHOD.
ENDCLASS.
