view: route_segment_identifier_view{
  derived_table: {
    sql: SELECT DISTINCT * FROM `dev-cs-1.p44_datasets.route_segment_identifier`;;
  }


  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
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

  dimension: identifier_source {
    type: string
    sql: ${TABLE}.IDENTIFIER_SOURCE ;;
  }

  dimension: identifier_type {
    type: string
    sql: ${TABLE}.IDENTIFIER_TYPE ;;
  }

  dimension: identifier_value {
    type: string
    sql: ${TABLE}.IDENTIFIER_VALUE ;;
  }

  dimension: route_segment_id {
    type: string
    sql: ${TABLE}.ROUTE_SEGMENT_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
