class ZCL_ZOD_SPAS_MPC_EXT definition
  public
  inheriting from ZCL_ZOD_SPAS_MPC
  create public .

public section.

  methods DEFINE
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_ZOD_SPAS_MPC_EXT IMPLEMENTATION.


  METHOD define.
    DATA: lo_ann_target  TYPE REF TO /iwbep/if_mgw_vocan_ann_target.   " Vocabulary Annotation Target
    DATA: lo_ann_target2 TYPE REF TO /iwbep/if_mgw_vocan_ann_target.   " Vocabulary Annotation Target
    DATA: lo_annotation  TYPE REF TO /iwbep/if_mgw_vocan_annotation.   " Vocabulary Annotation
    DATA: lo_collection  TYPE REF TO /iwbep/if_mgw_vocan_collection.   " Vocabulary Annotation Collection
    DATA: lo_function    TYPE REF TO /iwbep/if_mgw_vocan_function.     " Vocabulary Annotation Function
    DATA: lo_fun_param   TYPE REF TO /iwbep/if_mgw_vocan_fun_param.    " Vocabulary Annotation Function Parameter
    DATA: lo_property    TYPE REF TO /iwbep/if_mgw_vocan_property.     " Vocabulary Annotation Property
    DATA: lo_record      TYPE REF TO /iwbep/if_mgw_vocan_record.       " Vocabulary Annotation Record
    DATA: lo_simp_value  TYPE REF TO /iwbep/if_mgw_vocan_simple_val.   " Vocabulary Annotation Simple Value
    DATA: lo_url         TYPE REF TO /iwbep/if_mgw_vocan_url.          " Vocabulary Annotation URL
    DATA: lo_label_elem  TYPE REF TO /iwbep/if_mgw_vocan_label_elem.   " Vocabulary Annotation Labeled Element
    DATA: lo_reference   TYPE REF TO /iwbep/if_mgw_vocan_reference.    " Vocabulary Annotation Reference

    DATA: lo_entity_set    TYPE REF TO /iwbep/if_mgw_odata_entity_set,
          lo_annotation_dd TYPE REF TO /iwbep/if_mgw_odata_annotation,
          lo_property_dd   TYPE REF TO /iwbep/if_mgw_odata_property.




    super->define( ).


    " Create annotation vocabulary reference
    lo_reference = vocab_anno_model->create_vocabulary_reference( iv_vocab_id = '/IWBEP/VOC_UI' iv_vocab_version = '0001').
    lo_reference->create_include( iv_namespace = 'com.sap.vocabularies.UI.v1' iv_alias = 'UI' ).

    " annotations for entity type Pet
    lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet' ).
    lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_SRV' ).    "change the namespace to the SRV namespace

    " Header Info for object page
    lo_annotation = lo_ann_target->create_annotation( iv_term = 'UI.HeaderInfo' ).
    lo_record = lo_annotation->create_record( ).
    lo_record->create_property( 'TypeName' )->create_simple_value( )->set_string('Pet').
    lo_record->create_property( 'TypeNamePlural' )->create_simple_value( )->set_string( 'Pets').
    lo_record->create_property( 'Title' )->create_record( 'UI.DataField' )->create_property( 'Value' )->create_simple_value( )->set_path( 'PetId' ).
    lo_record->create_property( 'Description' )->create_record( 'UI.DataField' )->create_property( 'Value' )->create_simple_value( )->set_path( 'Name' ).


    " Columns to be displayed by default
    lo_annotation = lo_ann_target->create_annotation( iv_term = 'UI.LineItem' ).
    lo_collection = lo_annotation->create_collection( ).

    lo_record = lo_collection->create_record( iv_record_type = 'UI.DataField' ).
    lo_property = lo_record->create_property( 'Label' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_string( 'Pet Id' ).
    lo_property = lo_record->create_property( 'Value' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_path( 'PetId' ).

    lo_record = lo_collection->create_record( iv_record_type = 'UI.DataField' ).
    lo_property = lo_record->create_property( 'Label' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_string( 'Pet name' ).
    lo_property = lo_record->create_property( 'Value' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_path( 'Name' ).

    lo_record = lo_collection->create_record( iv_record_type = 'UI.DataField' ).
    lo_property = lo_record->create_property( 'Value' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_path( 'SpeciesId' ).


    lo_record = lo_collection->create_record( iv_record_type = 'UI.DataField' ).
    lo_property = lo_record->create_property( 'Value' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_path( 'RaceId' ).

    lo_record = lo_collection->create_record( iv_record_type = 'UI.DataField' ).
    lo_property = lo_record->create_property( 'Value' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_path( 'Color' ).

    lo_record = lo_collection->create_record( iv_record_type = 'UI.DataField' ).
    lo_property = lo_record->create_property( 'Value' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_path( 'Adopted' ).

    " UI.SelectionFields
    lo_annotation = lo_ann_target->create_annotation( iv_term = 'UI.SelectionFields' ).
    lo_collection = lo_annotation->create_collection( ).
    lo_simp_value = lo_collection->create_simple_value( ).
    lo_simp_value->set_property_path('PetId').
    lo_simp_value = lo_collection->create_simple_value( ).
    lo_simp_value->set_property_path('Name').
    lo_simp_value = lo_collection->create_simple_value( ).
    lo_simp_value->set_property_path('SpeciesId').
    lo_simp_value = lo_collection->create_simple_value( ).
    lo_simp_value->set_property_path('RaceId').



    " UI.Facets
    lo_annotation = lo_ann_target->create_annotation( iv_term = 'UI.Facets' ).
    lo_collection = lo_annotation->create_collection( ).
    lo_record = lo_collection->create_record( iv_record_type = 'UI.CollectionFacet' ).
    lo_property = lo_record->create_property( 'ID' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_string('GeneralInformation').

    lo_property = lo_record->create_property( 'Label' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_string('General Information').

    lo_property = lo_record->create_property( 'Facets' ).
    lo_collection = lo_property->create_collection( ).
    lo_record = lo_collection->create_record('UI.ReferenceFacet').
    lo_property = lo_record->create_property( 'Label' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_string('Pet Information').

    lo_property = lo_record->create_property( 'Target' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_annotation_path( '@UI.Identification' ).


    " UI.Identification
    lo_annotation = lo_ann_target->create_annotation( iv_term = 'UI.Identification' ).
    lo_collection = lo_annotation->create_collection( ).

    lo_record = lo_collection->create_record( iv_record_type = 'UI.DataField' ).
    lo_property = lo_record->create_property( 'Value' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_path( 'Name' ).

    lo_record = lo_collection->create_record( iv_record_type = 'UI.DataField' ).
    lo_property = lo_record->create_property( 'Value' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_path( 'SpeciesId' ).


    lo_record = lo_collection->create_record( iv_record_type = 'UI.DataField' ).
    lo_property = lo_record->create_property( 'Value' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_path( 'RaceId' ).

    lo_record = lo_collection->create_record( iv_record_type = 'UI.DataField' ).
    lo_property = lo_record->create_property( 'Value' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_path( 'Color' ).

    lo_record = lo_collection->create_record( iv_record_type = 'UI.DataField' ).
    lo_property = lo_record->create_property( 'Value' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_path( 'MicrochipNum' ).

    lo_record = lo_collection->create_record( iv_record_type = 'UI.DataField' ).
    lo_property = lo_record->create_property( 'Value' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_path( 'Sex' ).


    lo_record = lo_collection->create_record( iv_record_type = 'UI.DataField' ).
    lo_property = lo_record->create_property( 'Value' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_path( 'Sterilized' ).

    lo_record = lo_collection->create_record( iv_record_type = 'UI.DataField' ).
    lo_property = lo_record->create_property( 'Value' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_path( 'Dob' ).


**************************************************

    " Value Help Dropdown Species
    " Define the behaviour of the field species
    lo_entity_set = model->get_entity_set( 'PetSet' ).
    lo_annotation_dd = lo_entity_set->create_annotation( 'sap' ).
    lo_annotation_dd->add( iv_key = 'semantics' iv_value = 'fixed-values').
    lo_property_dd = model->get_entity_type( gc_pet )->get_property( 'SpeciesId' ).
    lo_property_dd->set_value_list( /iwbep/if_mgw_odata_property=>gcs_value_list_type_property-fixed_values ).

    " Assign service to dropdown
    lo_reference = vocab_anno_model->create_vocabulary_reference( iv_vocab_id = '/IWBEP/VOC_CORE' iv_vocab_version = '0001' ).
    lo_reference->create_include( iv_namespace = 'Org.OData.Core.V1' ).
    lo_reference = vocab_anno_model->create_vocabulary_reference( iv_vocab_id = '/IWBEP/VOC_COMMON' iv_vocab_version = '0001' ).
    lo_reference->create_include( iv_namespace = 'com.sap.vocabularies.Common.v1' ).
    lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/SpeciesId' ).
    lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_SRV' ).

    lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.ValueList' ).
    lo_record = lo_annotation->create_record( ).
    lo_property = lo_record->create_property( iv_property_name = 'Label' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_string( 'Species' ).
    lo_property = lo_record->create_property( iv_property_name = 'CollectionPath' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_string( 'SpeciesSet' ).

    lo_property = lo_record->create_property( iv_property_name = 'CollectionRoot' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_string( 'ZOD_SPAS_SRV' ).
    lo_property = lo_record->create_property( iv_property_name = 'SearchSupported' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_boolean( 'X' ).

    lo_property = lo_record->create_property( iv_property_name = 'Parameters' ).
    lo_collection = lo_property->create_collection( ).
    lo_record = lo_collection->create_record( iv_record_type = 'com.sap.vocabularies.Common.v1.ValueListParameterOut' ).
    lo_property = lo_record->create_property( iv_property_name = 'LocalDataProperty' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_property_path( 'SpeciesId' ).

    lo_property = lo_record->create_property( iv_property_name ='ValueListProperty').
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_string('SpeciesId').




    " Race search help
    lo_reference = vocab_anno_model->create_vocabulary_reference( iv_vocab_id = '/IWBEP/VOC_CORE' iv_vocab_version = '0001' ).
    lo_reference->create_include( iv_namespace = 'Org.OData.Core.V1' ).
    lo_reference = vocab_anno_model->create_vocabulary_reference( iv_vocab_id = '/IWBEP/VOC_COMMON' iv_vocab_version = '0001' ).
    lo_reference->create_include( iv_namespace = 'com.sap.vocabularies.Common.v1' ).
    lo_ann_target = vocab_anno_model->create_annotations_target( 'Pet/RaceId' ).
    lo_ann_target->set_namespace_qualifier( 'ZOD_SPAS_SRV' ).

    lo_annotation = lo_ann_target->create_annotation( iv_term = 'com.sap.vocabularies.Common.v1.ValueList' ).
    lo_record = lo_annotation->create_record( ).
    lo_property = lo_record->create_property( iv_property_name = 'Label' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_string( 'Race' ).
    lo_property = lo_record->create_property( iv_property_name = 'CollectionPath' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_string( 'RaceSet' ).

    lo_property = lo_record->create_property( iv_property_name = 'CollectionRoot' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_string( 'ZOD_SPAS_SRV' ).
    lo_property = lo_record->create_property( iv_property_name = 'SearchSupported' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_boolean( 'X' ).

    lo_property = lo_record->create_property( iv_property_name = 'Parameters' ).
    lo_collection = lo_property->create_collection( ).
    lo_record = lo_collection->create_record( iv_record_type = 'com.sap.vocabularies.Common.v1.ValueListParameterOut' ).
    lo_property = lo_record->create_property( iv_property_name = 'LocalDataProperty' ).
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_property_path( 'RaceId' ).

    lo_property = lo_record->create_property( iv_property_name ='ValueListProperty').
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_string('RaceId').

    lo_record = lo_collection->create_record( iv_record_type ='com.sap.vocabularies.Common.v1.ValueListParameterOut').
    lo_property = lo_record->create_property( iv_property_name ='ValueListProperty').
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_string('Description').

    lo_record = lo_collection->create_record( iv_record_type ='com.sap.vocabularies.Common.v1.ValueListParameterInOut').
    lo_property = lo_record->create_property( iv_property_name ='ValueListProperty').
    lo_simp_value = lo_property->create_simple_value( ).
    lo_simp_value->set_string('SpeciesId').

  ENDMETHOD.
ENDCLASS.
