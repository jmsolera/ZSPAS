class ZCL_ZOD_SPAS_ANNOTATIO_MPC definition
  public
  inheriting from /IWBEP/CL_MGW_PUSH_ABS_MODEL
  create public .

public section.

  types:
     TS_PET type ZSPAS_PET .
  types:
TT_PET type standard table of TS_PET .
  types:
   begin of ts_text_element,
      artifact_name  type c length 40,       " technical name
      artifact_type  type c length 4,
      parent_artifact_name type c length 40, " technical name
      parent_artifact_type type c length 4,
      text_symbol    type textpoolky,
   end of ts_text_element .
  types:
         tt_text_elements type standard table of ts_text_element with key text_symbol .
  types:
     TS_SPECIES type ZSPAS_SPECIES .
  types:
TT_SPECIES type standard table of TS_SPECIES .

  constants GC_PET type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'Pet' ##NO_TEXT.
  constants GC_SPECIES type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'Species' ##NO_TEXT.

  methods LOAD_TEXT_ELEMENTS
  final
    returning
      value(RT_TEXT_ELEMENTS) type TT_TEXT_ELEMENTS
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .

  methods DEFINE
    redefinition .
  methods GET_LAST_MODIFIED
    redefinition .
protected section.

  methods DEFINE_VOCAB_ANNOTATIONS
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods IS_SUBSCRIPTION_ENABLED
    returning
      value(RT_SUBSCRIPTION_ENABLED) type ABAP_BOOL
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
private section.

  constants GC_INCL_NAME type STRING value 'ZCL_ZOD_SPAS_ANNOTATIO_MPC====CP' ##NO_TEXT.

  methods DEFINE_PET
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods DEFINE_SPECIES
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
ENDCLASS.



CLASS ZCL_ZOD_SPAS_ANNOTATIO_MPC IMPLEMENTATION.


  method DEFINE.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*

model->set_schema_namespace( 'ZOD_SPAS_ANNOTATIONS_SRV' ).


define_pet( ).
define_species( ).
define_vocab_annotations( ).
 IF me->is_subscription_enabled( ) EQ abap_true.
    super->define( ).
  ENDIF.
  endmethod.


  method DEFINE_PET.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  data:
        lo_annotation     type ref to /iwbep/if_mgw_odata_annotation,                "#EC NEEDED
        lo_entity_type    type ref to /iwbep/if_mgw_odata_entity_typ,                "#EC NEEDED
        lo_complex_type   type ref to /iwbep/if_mgw_odata_cmplx_type,                "#EC NEEDED
        lo_property       type ref to /iwbep/if_mgw_odata_property,                  "#EC NEEDED
        lo_entity_set     type ref to /iwbep/if_mgw_odata_entity_set.                "#EC NEEDED

***********************************************************************************************************************************
*   ENTITY - Pet
***********************************************************************************************************************************

lo_entity_type = model->create_entity_type( iv_entity_type_name = 'Pet' iv_def_entity_set = abap_false ). "#EC NOTEXT


***********************************************************************************************************************************
*Properties
***********************************************************************************************************************************

lo_property = lo_entity_type->create_property( iv_property_name = 'PetId' iv_abap_fieldname = 'PET_ID' ). "#EC NOTEXT

lo_property->set_is_key( ).

lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 10 ). "#EC NOTEXT

lo_property->set_conversion_exit( 'ALPHA' ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'Name' iv_abap_fieldname = 'NAME' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'SpeciesId' iv_abap_fieldname = 'SPECIES' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 10 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'RaceId' iv_abap_fieldname = 'RACE' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 10 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'Color' iv_abap_fieldname = 'COLOR' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 1 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'MicrochipNum' iv_abap_fieldname = 'MICROCHIP_NUM' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 10 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'Sex' iv_abap_fieldname = 'SEX' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 1 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'Sterilized' iv_abap_fieldname = 'STERILIZED' ). "#EC NOTEXT


lo_property->set_type_edm_boolean( ).


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'Dob' iv_abap_fieldname = 'DOB' ). "#EC NOTEXT


lo_property->set_type_edm_datetime( ).
lo_property->set_precison( iv_precision = 7 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'Adopted' iv_abap_fieldname = 'ADOPTED' ). "#EC NOTEXT


lo_property->set_type_edm_boolean( ).


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'AdopterName' iv_abap_fieldname = 'ADOPTER_NAME' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 70 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'AdopterAddress' iv_abap_fieldname = 'ADOPTER_ADDRESS' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 70 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'AdopterIdCard' iv_abap_fieldname = 'ADOPTER_ID_CARD' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 10 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'OtherInfo' iv_abap_fieldname = 'OTHER_INFO' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 100 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).


lo_entity_type->bind_structure( iv_structure_name   = 'ZSPAS_PET'
                                iv_bind_conversions = 'X' ). "#EC NOTEXT


***********************************************************************************************************************************
*   ENTITY SETS
***********************************************************************************************************************************
lo_entity_set = lo_entity_type->create_entity_set( 'PetSet' ). "#EC NOTEXT
  endmethod.


  method DEFINE_SPECIES.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  data:
        lo_annotation     type ref to /iwbep/if_mgw_odata_annotation,                "#EC NEEDED
        lo_entity_type    type ref to /iwbep/if_mgw_odata_entity_typ,                "#EC NEEDED
        lo_complex_type   type ref to /iwbep/if_mgw_odata_cmplx_type,                "#EC NEEDED
        lo_property       type ref to /iwbep/if_mgw_odata_property,                  "#EC NEEDED
        lo_entity_set     type ref to /iwbep/if_mgw_odata_entity_set.                "#EC NEEDED

***********************************************************************************************************************************
*   ENTITY - Species
***********************************************************************************************************************************

lo_entity_type = model->create_entity_type( iv_entity_type_name = 'Species' iv_def_entity_set = abap_false ). "#EC NOTEXT


***********************************************************************************************************************************
*Properties
***********************************************************************************************************************************

lo_property = lo_entity_type->create_property( iv_property_name = 'SpeciesId' iv_abap_fieldname = 'SPECIES' ). "#EC NOTEXT

lo_property->set_is_key( ).

lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 10 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).

lo_property = lo_entity_type->create_property( iv_property_name = 'Description' iv_abap_fieldname = 'DESCRIPTION' ). "#EC NOTEXT


lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 40 ). "#EC NOTEXT


lo_property->set_nullable( abap_false ).


lo_entity_type->bind_structure( iv_structure_name   = 'ZSPAS_SPECIES'
                                iv_bind_conversions = 'X' ). "#EC NOTEXT


***********************************************************************************************************************************
*   ENTITY SETS
***********************************************************************************************************************************
lo_entity_set = lo_entity_type->create_entity_set( 'SpeciesSet' ). "#EC NOTEXT
  endmethod.


  method DEFINE_VOCAB_ANNOTATIONS.
data: lo_ann_target type ref to /iwbep/if_mgw_vocan_ann_target.   " Vocabulary Annotation Target                     "#EC NEEDED
DATA: lo_annotation TYPE REF TO /iwbep/if_mgw_vocan_annotation.   " Vocabulary Annotation                            "#EC NEEDED
DATA: lo_collection TYPE REF TO /iwbep/if_mgw_vocan_collection.   " Vocabulary Annotation Collection                 "#EC NEEDED
DATA: lo_function   TYPE REF TO /iwbep/if_mgw_vocan_function.     " Vocabulary Annotation Function                   "#EC NEEDED
DATA: lo_fun_param  TYPE REF TO /iwbep/if_mgw_vocan_fun_param.    " Vocabulary Annotation Function Parameter         "#EC NEEDED
DATA: lo_property   TYPE REF TO /iwbep/if_mgw_vocan_property.     " Vocabulary Annotation Property                   "#EC NEEDED
DATA: lo_record     TYPE REF TO /iwbep/if_mgw_vocan_record.       " Vocabulary Annotation Record                     "#EC NEEDED
DATA: lo_simp_value TYPE REF TO /iwbep/if_mgw_vocan_simple_val.   " Vocabulary Annotation Simple Value               "#EC NEEDED
DATA: lo_url        TYPE REF TO /iwbep/if_mgw_vocan_url.          " Vocabulary Annotation URL                        "#EC NEEDED
DATA: lo_label_elem TYPE REF TO /iwbep/if_mgw_vocan_label_elem.   " Vocabulary Annotation Labeled Element            "#EC NEEDED
DATA: lo_reference  TYPE REF TO /iwbep/if_mgw_vocan_reference.    " Vocabulary Annotation Reference


  lo_reference = vocab_anno_model->create_vocabulary_reference( iv_vocab_id = '/IWBEP/VOC_COMMON'
                                                                iv_vocab_version = '0001').    "#EC NOTEXT
  lo_reference->create_include( iv_namespace = 'com.sap.vocabularies.Common.v1' ).    "#EC NOTEXT
  lo_reference = vocab_anno_model->create_vocabulary_reference( iv_vocab_id = '/IWBEP/VOC_CORE'
                                                                iv_vocab_version = '0001').    "#EC NOTEXT
  lo_reference->create_include( iv_namespace = 'Org.OData.Core.V1' ).    "#EC NOTEXT
  lo_reference = vocab_anno_model->create_vocabulary_reference( iv_vocab_id = '/IWBEP/VOC_VALIDATION'
                                                                iv_vocab_version = '0001').    "#EC NOTEXT
  lo_reference->create_include( iv_namespace = 'Org.OData.Validation.V1' ).    "#EC NOTEXT
  lo_reference = vocab_anno_model->create_vocabulary_reference( iv_vocab_id = '/IWBEP/VOC_AGGREGATION'
                                                                iv_vocab_version = '0001').    "#EC NOTEXT
  lo_reference->create_include( iv_namespace = 'Org.OData.Aggregation.V1' ).    "#EC NOTEXT
  lo_reference = vocab_anno_model->create_vocabulary_reference( iv_vocab_id = '/IWBEP/VOC_UI'
                                                                iv_vocab_version = '0001').    "#EC NOTEXT
  lo_reference->create_include( iv_namespace = 'com.sap.vocabularies.UI.v1' ).    "#EC NOTEXT
  lo_reference = vocab_anno_model->create_vocabulary_reference( iv_vocab_id = '/IWBEP/VOC_COMMUNICATION'
                                                                iv_vocab_version = '0001').    "#EC NOTEXT
  lo_reference->create_include( iv_namespace = 'com.sap.vocabularies.Communication.v1' ).    "#EC NOTEXT


  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.ChangedAt' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_path( '' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.ChangedBy' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.CreatedAt' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_path( '' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.CreatedBy' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.Deletable' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.ResultContext' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.SemanticObject' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.Updatable' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.UI.v1.TextArrangement' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( 'com.sap.vocabularies.UI.v1.TextArrangementType/' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'Org.OData.Core.V1.AdditionalProperties' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'Org.OData.Core.V1.Permissions' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( 'Org.OData.Core.V1.Permission/' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.DerivedDefaultValue' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.DerivedFilterDefaultValue' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.FieldControl' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( 'com.sap.vocabularies.Common.v1.FieldControlType/' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.FilterDefaultValue' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_path( '' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.IsCalendarDate' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.IsCalendarHalfyear' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.IsCalendarMonth' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.IsCalendarQuarter' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.IsCalendarWeek' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.IsCalendarYear' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.IsCalendarYearHalfyear' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.IsCalendarYearMonth' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.IsCalendarYearQuarter' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.IsCalendarYearWeek' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.IsDayOfCalendarMonth' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.IsDayOfCalendarYear' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.IsDigitSequence' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.IsFiscalPeriod' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.IsFiscalYear' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.IsFiscalYearPeriod' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.IsFiscalYearVariant' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.IsUpperCase' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.Masked' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.MaxOccurs' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_integer( 0  ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.MinOccurs' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_integer( 0  ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.RelatedRecursiveHierarchy' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_annotation_path( '' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.SemanticObject' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.Text' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.TextFormat' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( 'com.sap.vocabularies.Common.v1.TextFormatType/' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.ValueListWithFixedValues' ).    "#EC NOTEXT
  lo_simp_value = lo_annotation->create_simple_value( ).
  lo_simp_value->set_boolean( 'X' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.AssociationEntity' ).    "#EC NOTEXT
  lo_collection = lo_annotation->create_collection( ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.SecondaryKey' ).    "#EC NOTEXT
  lo_collection = lo_annotation->create_collection( ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.SemanticKey' ).    "#EC NOTEXT
  lo_collection = lo_annotation->create_collection( ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.SortOrder' ).    "#EC NOTEXT
  lo_collection = lo_annotation->create_collection( ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.UI.v1.Contacts' ).    "#EC NOTEXT
  lo_collection = lo_annotation->create_collection( ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.UI.v1.Facets' ).    "#EC NOTEXT
  lo_collection = lo_annotation->create_collection( ).
  lo_record = lo_collection->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.CollectionFacet' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Label' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( 'Pet Information' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'ID' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( 'GeneralInformation' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Facets' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_record = lo_collection->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.ReferenceFacet' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Label' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( 'Pet Information' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'ID' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Target' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_annotation_path( '@UI.Identification' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.UI.v1.FilterFacets' ).    "#EC NOTEXT
  lo_collection = lo_annotation->create_collection( ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.UI.v1.GeoLocations' ).    "#EC NOTEXT
  lo_collection = lo_annotation->create_collection( ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.UI.v1.HeaderFacets' ).    "#EC NOTEXT
  lo_collection = lo_annotation->create_collection( ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.UI.v1.Identification' ).    "#EC NOTEXT
  lo_collection = lo_annotation->create_collection( ).
  lo_record = lo_collection->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.DataField' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Label' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Criticality' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'CriticalityRepresentation' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'IconUrl' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Value' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( 'Name' ).    "#EC NOTEXT
  lo_record = lo_collection->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.DataField' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Label' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Criticality' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'CriticalityRepresentation' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'IconUrl' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Value' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( 'SpeciesId' ).    "#EC NOTEXT
  lo_record = lo_collection->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.DataField' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Label' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Criticality' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'CriticalityRepresentation' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'IconUrl' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Value' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( 'RaceId' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.UI.v1.LineItem' ).    "#EC NOTEXT
  lo_collection = lo_annotation->create_collection( ).
  lo_record = lo_collection->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.DataField' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Label' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( 'Pet Id' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Criticality' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'CriticalityRepresentation' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'IconUrl' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Value' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( 'PetId' ).    "#EC NOTEXT
  lo_record = lo_collection->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.DataField' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Label' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( 'Name' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Criticality' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'CriticalityRepresentation' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'IconUrl' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Value' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( 'Name' ).    "#EC NOTEXT
  lo_record = lo_collection->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.DataField' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Label' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( 'Species' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Criticality' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'CriticalityRepresentation' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'IconUrl' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Value' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( 'SpeciesId' ).    "#EC NOTEXT
  lo_record = lo_collection->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.DataField' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Label' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( 'Race' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Criticality' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'CriticalityRepresentation' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'IconUrl' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Value' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( 'RaceId' ).    "#EC NOTEXT
  lo_record = lo_collection->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.DataField' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Label' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( 'Adopted' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Criticality' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'CriticalityRepresentation' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'IconUrl' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Value' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( 'Adopted' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.UI.v1.QuickCreateFacets' ).    "#EC NOTEXT
  lo_collection = lo_annotation->create_collection( ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.UI.v1.QuickViewFacets' ).    "#EC NOTEXT
  lo_collection = lo_annotation->create_collection( ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.UI.v1.SelectionFields' ).    "#EC NOTEXT
  lo_collection = lo_annotation->create_collection( ).
  lo_simp_value = lo_collection->create_simple_value( ).
  lo_simp_value->set_property_path( 'PetId' ).    "#EC NOTEXT
  lo_simp_value = lo_collection->create_simple_value( ).
  lo_simp_value->set_property_path( 'Name' ).    "#EC NOTEXT
  lo_simp_value = lo_collection->create_simple_value( ).
  lo_simp_value->set_property_path( 'SpeciesId' ).    "#EC NOTEXT
  lo_simp_value = lo_collection->create_simple_value( ).
  lo_simp_value->set_property_path( 'RaceId' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.UI.v1.StatusInfo' ).    "#EC NOTEXT
  lo_collection = lo_annotation->create_collection( ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'Org.OData.Core.V1.AcceptableMediaTypes' ).    "#EC NOTEXT
  lo_collection = lo_annotation->create_collection( ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'Org.OData.Core.V1.AlternateKeys' ).    "#EC NOTEXT
  lo_collection = lo_annotation->create_collection( ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.Attributes' ).    "#EC NOTEXT
  lo_collection = lo_annotation->create_collection( ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.ValueListReferences' ).    "#EC NOTEXT
  lo_collection = lo_annotation->create_collection( ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.Interval' ).    "#EC NOTEXT
  lo_record = lo_annotation->create_record( iv_record_type = 'com.sap.vocabularies.Common.v1.IntervalType' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'LowerBoundary' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_property_path( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'LowerBoundaryIncluded' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_property = lo_record->create_property( 'UpperBoundary' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_property_path( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'UpperBoundaryIncluded' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.SideEffects' ).    "#EC NOTEXT
  lo_record = lo_annotation->create_record( iv_record_type = 'com.sap.vocabularies.Common.v1.SideEffectsType' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'SourceProperties' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_property = lo_record->create_property( 'SourceEntities' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_property = lo_record->create_property( 'TargetProperties' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_property = lo_record->create_property( 'TargetEntities' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_property = lo_record->create_property( 'EffectTypes' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.UI.v1.Badge' ).    "#EC NOTEXT
  lo_record = lo_annotation->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.BadgeType' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'HeadLine' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_record = lo_property->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.DataField' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Label' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Criticality' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'CriticalityRepresentation' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'IconUrl' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Value' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Title' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_record = lo_property->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.DataField' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Label' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Criticality' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'CriticalityRepresentation' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'IconUrl' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Value' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'ImageUrl' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'TypeImageUrl' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'MainInfo' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_record = lo_property->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.DataField' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Label' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Criticality' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'CriticalityRepresentation' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'IconUrl' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Value' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'SecondaryInfo' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_record = lo_property->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.DataField' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Label' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Criticality' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'CriticalityRepresentation' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'IconUrl' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Value' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( '' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.UI.v1.Chart' ).    "#EC NOTEXT
  lo_record = lo_annotation->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.ChartDefinitionType' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Title' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Description' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'ChartType' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Measures' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_property = lo_record->create_property( 'MeasureAttributes' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_property = lo_record->create_property( 'Dimensions' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_property = lo_record->create_property( 'DimensionAttributes' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_property = lo_record->create_property( 'Actions' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.UI.v1.DataPoint' ).    "#EC NOTEXT
  lo_record = lo_annotation->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.DataPointType' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Title' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Description' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'LongDescription' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Value' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'TargetValue' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'ForecastValue' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'ValueFormat' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_record = lo_property->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.NumberFormat' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Visualization' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'SampleSize' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'ReferencePeriod' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_record = lo_property->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.ReferencePeriod' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Description' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Criticality' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'CriticalityCalculation' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_record = lo_property->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.CriticalityCalculationType' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'AcceptanceRangeLowValue' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'AcceptanceRangeHighValue' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'ToleranceRangeLowValue' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'ToleranceRangeHighValue' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'DeviationRangeLowValue' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'DeviationRangeHighValue' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'ImprovementDirection' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Trend' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'TrendCalculation' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_record = lo_property->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.TrendCalculationType' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'ReferenceValue' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'IsRelativeDifference' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.UI.v1.FieldGroup' ).    "#EC NOTEXT
  lo_record = lo_annotation->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.FieldGroupType' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Label' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Data' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.UI.v1.GeoLocation' ).    "#EC NOTEXT
  lo_record = lo_annotation->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.GeoLocationType' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.UI.v1.HeaderInfo' ).    "#EC NOTEXT
  lo_record = lo_annotation->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.HeaderInfoType' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'TypeName' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( 'Pet' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'TypeNamePlural' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( 'Pets' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Title' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_record = lo_property->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.DataField' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Label' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Criticality' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'CriticalityRepresentation' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'IconUrl' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Value' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( 'PetId' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Description' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_record = lo_property->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.DataField' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Label' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Criticality' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'CriticalityRepresentation' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'IconUrl' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Value' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( 'Name' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'ImageUrl' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'TypeImageUrl' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.UI.v1.MediaResource' ).    "#EC NOTEXT
  lo_record = lo_annotation->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.MediaResourceType' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Url' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'ContentType' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'ByteSize' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_integer( 0  ).
  lo_property = lo_record->create_property( 'Thumbnail' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_record = lo_property->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.ImageType' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Url' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Width' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Height' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Title' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_record = lo_property->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.DataField' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Label' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Criticality' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'CriticalityRepresentation' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'IconUrl' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Value' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Description' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_record = lo_property->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.DataField' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Label' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Criticality' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'CriticalityRepresentation' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_enum_member_by_name( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'IconUrl' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Value' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_path( '' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.UI.v1.PresentationVariant' ).    "#EC NOTEXT
  lo_record = lo_annotation->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.PresentationVariantType' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'ID' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Text' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'MaxItems' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_integer( 0  ).
  lo_property = lo_record->create_property( 'GroupBy' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_property = lo_record->create_property( 'TotalBy' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_property = lo_record->create_property( 'Total' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_property = lo_record->create_property( 'IncludeGrandTotal' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_property = lo_record->create_property( 'InitialExpansionLevel' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_integer( 0  ).
  lo_property = lo_record->create_property( 'Visualizations' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_property = lo_record->create_property( 'RequestAtLeast' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.UI.v1.SelectionPresentationVariant' ).    "#EC NOTEXT
  lo_record = lo_annotation->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.SelectionPresentationVariantType' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'ID' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Text' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'SelectionVariant' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_record = lo_property->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.SelectionVariantType' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'ID' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Text' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Parameters' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_property = lo_record->create_property( 'FilterExpression' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'SelectOptions' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_property = lo_record->create_property( 'PresentationVariant' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_record = lo_property->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.PresentationVariantType' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'ID' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Text' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'MaxItems' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_integer( 0  ).
  lo_property = lo_record->create_property( 'GroupBy' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_property = lo_record->create_property( 'TotalBy' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_property = lo_record->create_property( 'Total' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_property = lo_record->create_property( 'IncludeGrandTotal' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_boolean( ' ' ).
  lo_property = lo_record->create_property( 'InitialExpansionLevel' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_integer( 0  ).
  lo_property = lo_record->create_property( 'Visualizations' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_property = lo_record->create_property( 'RequestAtLeast' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.UI.v1.SelectionVariant' ).    "#EC NOTEXT
  lo_record = lo_annotation->create_record( iv_record_type = 'com.sap.vocabularies.UI.v1.SelectionVariantType' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'ID' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Text' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Parameters' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_property = lo_record->create_property( 'FilterExpression' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'SelectOptions' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.ValueList' ).    "#EC NOTEXT
  lo_record = lo_annotation->create_record( iv_record_type = 'com.sap.vocabularies.Common.v1.ValueListType' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Label' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( 'Species' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'CollectionPath' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'CollectionRoot' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( 'SpeciesSet' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'SearchSupported' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_boolean( 'X' ).
  lo_property = lo_record->create_property( 'Parameters' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  lo_record = lo_collection->create_record( iv_record_type = 'com.sap.vocabularies.Common.v1.ValueListParameterInOut' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'ValueListProperty' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( 'SpeciesId' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'LocalDataProperty' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_property_path( 'SpeciesId' ).    "#EC NOTEXT
  lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).    "#EC NOTEXT
  lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_ANNOTATIONS_SRV' ).    "#EC NOTEXT
  lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.ValueListMapping' ).    "#EC NOTEXT
  lo_record = lo_annotation->create_record( iv_record_type = 'com.sap.vocabularies.Common.v1.ValueListMappingType' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Label' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'CollectionPath' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_simp_value->set_string( '' ).    "#EC NOTEXT
  lo_property = lo_record->create_property( 'Parameters' ).   "#EC NOTEXT
  lo_simp_value = lo_property->create_simple_value( ).
  lo_collection = lo_property->create_collection( ).
  endmethod.


  method GET_LAST_MODIFIED.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  CONSTANTS: lc_gen_date_time TYPE timestamp VALUE '20210218163509'.                  "#EC NOTEXT
  rv_last_modified = super->get_last_modified( ).
  IF rv_last_modified LT lc_gen_date_time.
    rv_last_modified = lc_gen_date_time.
  ENDIF.
  endmethod.


  method IS_SUBSCRIPTION_ENABLED.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*

DATA:
     ls_subscription_enabled TYPE abap_bool value abap_false.

     rt_subscription_enabled = ls_subscription_enabled.
  endmethod.


  method LOAD_TEXT_ELEMENTS.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*


DATA:
     ls_text_element TYPE ts_text_element.                                 "#EC NEEDED


clear ls_text_element.
ls_text_element-artifact_name          = 'MicrochipNum'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'Pet'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '001'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'AdopterIdCard'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'Pet'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '002'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'OtherInfo'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'Pet'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '003'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
  endmethod.
ENDCLASS.
