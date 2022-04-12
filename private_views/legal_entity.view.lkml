view: legal_entity {
  sql_table_name: `@{PROJECT}.@{DIM_DATASET}.legal_entity`
    ;;
  drill_fields: [legal_entity_id]

  dimension: legal_entity_uid {
    primary_key: yes
    type: string
    description: "Legal Entity Unique ID for a particular type of Legal Entity"
    sql: ${TABLE}.legal_entity_uid ;;
  }

  dimension: legal_entity_id {
    #  primary_key: yes
    type: string
    description: "Legal Entity Unique ID for a particular type of Legal Entity"
    sql: ${TABLE}.legal_entity_id ;;
  }

  dimension: active {
    type: string
    description: "Legal Entity Active"
    sql: ${TABLE}.active ;;
  }

  dimension_group: change {
    type: time
    description: "Change Date"
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.change_date ;;
  }

  dimension: city {
    type: string
    description: "City is part of the address details"
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    description: "Country"
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: creation {
    type: time
    description: "Creation Date"
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.creation_date ;;
  }

  dimension: district {
    type: string
    description: "District is the part of the address details, represents to the district or County"
    sql: ${TABLE}.district ;;
  }

  dimension: geo_lattitude {
    type: string
    description: "Lattitude to locate on the map"
    sql: ${TABLE}.geo_lattitude ;;
  }

  dimension: geo_longitude {
    type: string
    description: "Longitude to locate on the map"
    sql: ${TABLE}.geo_longitude ;;
  }

  dimension: house_number {
    type: number
    description: "House Number/Apt Number is part of address detail"
    sql: ${TABLE}.house_number ;;
  }

  dimension: legal_entity_classification {
    type: string
    description: "Legal Entity Classification (A,B,C)"
    sql: ${TABLE}.legal_entity_classification ;;
  }

  dimension: legal_entity_group {
    type: string
    description: "Customer Group / Supplier Schema (Export, Import, Retail, Wholesale etc)"
    sql: ${TABLE}.legal_entity_group ;;
  }

  dimension: legal_entity_name {
    type: string
    description: "Legal Entity Description"
    sql: ${TABLE}.legal_entity_name ;;
  }

  dimension: legal_entity_name2 {
    type: string
    description: "Additional Information about Legal Entity"
    sql: ${TABLE}.legal_entity_name2 ;;
  }

  dimension: legal_entity_role {
    type: string
    description: "Sold-to, Payer, Receiver etc"
    sql: ${TABLE}.legal_entity_role ;;
  }

  dimension: legal_entity_type {
    type: string
    description: "Customer, Supplier, Company Code, Plant, Sales Org"
    sql: ${TABLE}.legal_entity_type ;;
  }

  dimension: organization_level {
    type: string
    description: "Organization Level is representing any organization unit, this can be a plant, sales organization or a company code."
    sql: ${TABLE}.organization_level ;;
  }

  dimension: payment_term {
    type: string
    description: "Liable to pay as per payment term"
    sql: ${TABLE}.payment_term ;;
  }

  dimension: postal_code {
    type: string
    description: "Postal Code is part of address"
    sql: ${TABLE}.postal_code ;;
  }

  dimension: reconcillation_account {
    type: string
    description: "Internal Account number to reconcile transactions"
    sql: ${TABLE}.reconcillation_account ;;
  }

  dimension: region {
    type: string
    description: "Region is part of address, will hold detail of province/state"
    sql: ${TABLE}.region ;;
  }

  dimension: street {
    type: string
    description: "Street Name is part of address"
    sql: ${TABLE}.street ;;
  }

  dimension: time_zone {
    type: string
    description: "Time Zone of the location"
    sql: ${TABLE}.time_zone ;;
  }

  dimension: uid {
    type: string
    description: "Unique Identifier for the record"
    sql: ${TABLE}.uid ;;
  }

  dimension_group: valid_from {
    type: time
    description: "Valid from date"
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.valid_from_date ;;
  }

  dimension_group: valid_to {
    type: time
    description: "Valid to date"
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.valid_to_date ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.geo_lattitude ;;
    sql_longitude: ${TABLE}.geo_longitude ;;
  }

  measure: count {
    type: count
    drill_fields: [legal_entity_id, legal_entity_name]
  }
}
