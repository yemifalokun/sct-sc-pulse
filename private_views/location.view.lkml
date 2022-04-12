view: location {
  sql_table_name: `@{PROJECT}.@{DIM_DATASET}.location`
    ;;
  drill_fields: [location_id]

  dimension: location_uid {
    primary_key: yes
    type: string
    description: "Location ID is unique ID of particular location type"
    sql: ${TABLE}.location_uid ;;
  }

  dimension: location_id {
    #  primary_key: yes
    type: string
    description: "Location ID is unique ID of particular location type"
    sql: ${TABLE}.location_id ;;
  }

  dimension: active {
    type: string
    description: "Location Validity"
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

  dimension: company_code {
    type: string
    description: "Legal entity for Ownership"
    sql: ${TABLE}.company_code ;;
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

  dimension: language_key {
    type: string
    description: "Communication Language to print documents"
    sql: ${TABLE}.language_key ;;
  }

  dimension: location_name {
    type: string
    description: "Location Name is Location Descrption"
    sql: ${TABLE}.location_name ;;
  }

  dimension: location_name2 {
    type: string
    description: "Location Name 2 is an additional information in the name"
    sql: ${TABLE}.location_name2 ;;
  }

  dimension: location_type {
    type: string
    description: "Location Type denotes whether location is customer, plant, distribution center"
    sql: ${TABLE}.location_type ;;
  }

  dimension: organization_level {
    type: string
    description: "Organization Level is representing any organization unit, this can be a plant, sales organization or a company code."
    sql: ${TABLE}.organization_level ;;
  }

  dimension: postal_code {
    type: string
    description: "Postal Code is part of address"
    sql: ${TABLE}.postal_code ;;
  }

  dimension: receiving_calendar {
    type: string
    description: "Receiving Calendar to plan transport activities"
    sql: ${TABLE}.receiving_calendar ;;
  }

  dimension: region {
    type: string
    description: "Region is part of address, will hold detail of province/state"
    sql: ${TABLE}.region ;;
  }

  dimension: shipping_calendar {
    type: string
    description: "Shipping Calendar to plan transport activities"
    sql: ${TABLE}.shipping_calendar ;;
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

  dimension: transportation_zone {
    type: string
    description: "Transportation Zone to plan transport acitivties"
    sql: ${TABLE}.transportation_zone ;;
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

  dimension: valuation_area {
    type: string
    description: "Valuation Entity for financial reporting"
    sql: ${TABLE}.valuation_area ;;
  }

  dimension: working_hour {
    type: string
    description: "Working Hours to plan transport activities"
    sql: ${TABLE}.working_hour ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.geo_lattitude ;;
    sql_longitude: ${TABLE}.geo_longitude ;;
  }

  measure: count {
    type: count
    drill_fields: [location_id, location_name, inventory.count, forecast.count, order.count]
  }
}
