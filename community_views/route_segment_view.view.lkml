view: route_segment_view{
  derived_table: {
    sql: SELECT DISTINCT * FROM `dev-cs-1.p44_datasets.route_segment`;;
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ID ;;
  }

  dimension: asset_id {
    type: string
    sql: ${TABLE}.ASSET_ID ;;
  }

  dimension: carrier_id {
    type: number
    sql: ${TABLE}.CARRIER_ID ;;
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

  dimension: drive_time_minutes {
    type: number
    sql: ${TABLE}.DRIVE_TIME_MINUTES ;;
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

  dimension: from_stop_id {
    type: string
    sql: ${TABLE}.FROM_STOP_ID ;;
  }

  dimension: idle_time_minutes {
    type: number
    sql: ${TABLE}.IDLE_TIME_MINUTES ;;
  }

  dimension: position_update_count {
    type: number
    sql: ${TABLE}.POSITION_UPDATE_COUNT ;;
  }

  dimension: route_segment_event {
    type: string
    sql: ${TABLE}.ROUTE_SEGMENT_EVENT ;;
  }

  dimension: route_segment_state {
    type: string
    sql: ${TABLE}.ROUTE_SEGMENT_STATE ;;
  }

  dimension: shipment_id {
    type: string
    sql: ${TABLE}.SHIPMENT_ID ;;
  }

  dimension: tenant_id {
    type: number
    sql: ${TABLE}.TENANT_ID ;;
  }

  dimension: to_stop_id {
    type: string
    sql: ${TABLE}.TO_STOP_ID ;;
  }

  dimension: tracked {
    type: yesno
    sql: ${TABLE}.TRACKED ;;
  }

  dimension: tracking_connection_id {
    type: string
    sql: ${TABLE}.TRACKING_CONNECTION_ID ;;
  }

  dimension_group: tracking_end_utc {
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
    sql: ${TABLE}.TRACKING_END_UTC ;;
  }

  dimension: tracking_error {
    type: string
    sql: ${TABLE}.TRACKING_ERROR ;;
  }

  dimension: tracking_quality {
    type: string
    sql: ${TABLE}.TRACKING_QUALITY ;;
  }

  dimension_group: tracking_start_utc {
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
    sql: ${TABLE}.TRACKING_START_UTC ;;
  }

  dimension: transportation_mode {
    type: string
    sql: ${TABLE}.TRANSPORTATION_MODE ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
