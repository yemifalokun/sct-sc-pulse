view: stop_view{
  derived_table: {
    sql: SELECT DISTINCT * FROM `dev-cs-1.p44_datasets.stop`;;
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ID ;;
  }

  dimension_group: appointment_end_utc {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.APPOINTMENT_END_UTC ;;
  }

  dimension_group: appointment_start_utc {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.APPOINTMENT_START_UTC ;;
  }

  dimension_group: arrived_utc {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ARRIVED_UTC ;;
  }

  dimension_group: created_utc {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CREATED_UTC ;;
  }

  dimension_group: deleted_utc {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DELETED_UTC ;;
  }

  dimension_group: departed_utc {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DEPARTED_UTC ;;
  }

  dimension_group: dw_inserted_datetime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DW_INSERTED_DATETIME ;;
  }

  dimension_group: dw_updated_datetime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DW_UPDATED_DATETIME ;;
  }

  dimension: dwell_time_hours {
    type: number
    sql: ${TABLE}.DWELL_TIME_HOURS ;;
  }

  dimension: location_id {
    type: string
    sql: ${TABLE}.LOCATION_ID ;;
  }

  dimension: shipment_id {
    type: string
    sql: ${TABLE}.SHIPMENT_ID ;;
  }

  dimension: stop_event {
    type: string
    sql: ${TABLE}.STOP_EVENT ;;
  }

  dimension: stop_number {
    label: "Source Stop"
    type: number
    sql: ${TABLE}.STOP_NUMBER ;;
  }

  dimension: stop_status {
    type: string
    sql: ${TABLE}.STOP_STATUS ;;
  }

  dimension: stop_type {
    label: "From Stop Type"
    type: string
    sql: ${TABLE}.STOP_TYPE ;;
  }

  dimension: tenant_id {
    type: number
    sql: ${TABLE}.TENANT_ID ;;
  }

  dimension: time_zone {
    type: string
    sql: ${TABLE}.TIME_ZONE ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
