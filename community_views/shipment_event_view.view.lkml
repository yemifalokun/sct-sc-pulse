view: shipment_event_view{
  derived_table: {
    sql: SELECT DISTINCT * FROM `dev-cs-1.p44_datasets.shipment_event`
      WHERE PLANNED_UTC IS NOT NULL and ESTIMATED_UTC IS NOT NULL;;
  }

  # where ESTIMATED_UTC IS NOT NULL and PLANNED_UTC IS NOT NULL

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension_group: actual_utc {
    label: "Actual (UTC)"
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
    sql: ${TABLE}.ACTUAL_UTC ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
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

  dimension_group: estimated_updated_utc {
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
    sql: ${TABLE}.ESTIMATED_UPDATED_UTC ;;
  }

  dimension_group: estimated_utc {
    label: "Estimate (UTC)"
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
    sql: ${TABLE}.ESTIMATED_UTC ;;
  }

  dimension_group: planned_updated_utc {
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
    sql: ${TABLE}.PLANNED_UPDATED_UTC ;;
  }

  dimension_group: planned_utc {
    label: "Planned (UTC)"
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
    sql: ${TABLE}.PLANNED_UTC ;;
  }

  dimension: route_segment_id {
    type: string
    sql: ${TABLE}.ROUTE_SEGMENT_ID ;;
  }

  dimension: shipment_id {
    type: string
    sql: ${TABLE}.SHIPMENT_ID ;;
  }

  dimension: stop_id {
    type: string
    sql: ${TABLE}.STOP_ID ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.TYPE ;;
  }

  set: detail {
    fields: [
      order.order_id,
      asset.asset_id,
      asset.asset_name,
      location.location_uid,
      location.location_name,
      product.product_uid,
      product.product_hierarchy_level_2_name,
      product.product_hierarchy_level_1_name,
      product.product_hierarchy_name
    ]
  }

  dimension: delayed_shipment {
    type: string
    sql: case
           when (coalesce(${actual_utc_date},date(1900,01,01))> ${planned_utc_date}) or  (coalesce( ${estimated_utc_date},date(1900,01,01)) > ${planned_utc_date}) then ${shipment_id} else Null
          end;;
    drill_fields: [detail*]
  }

  measure: Delayed {
    type: count_distinct
    sql: ${delayed_shipment} ;;
    drill_fields: [detail*]
  }


  measure: count {
    type: count
    drill_fields: [id]
  }
}
