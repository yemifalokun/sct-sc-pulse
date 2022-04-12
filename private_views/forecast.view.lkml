view: forecast {
  sql_table_name: `@{PROJECT}.@{DIM_DATASET}.forecast`
    ;;

  dimension_group: forecast {
    type: time
    description: "Forecast Generation Date"
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
    sql: ${TABLE}.forecast_date ;;
  }

  dimension: forecast_period {
    type: string
    description: "Forecast Period"
    sql: ${TABLE}.forecast_period ;;
  }

  dimension: forecast_period_type {
    type: string
    description: "Period Type - Month, Week or Day"
    sql: ${TABLE}.forecast_period_type ;;
  }

  dimension: forecast_quantity {
    type: string
    description: "Forecasted Quantity"
    sql: ${TABLE}.forecast_quantity ;;
  }

  dimension: forecast_uom {
    type: string
    description: "Forecasting Unit of Measure"
    sql: ${TABLE}.forecast_uom ;;
  }

  dimension: inventory_quantity {
    type: string
    description: "Quantity in Base UoM"
    sql: ${TABLE}.inventory_quantity ;;
  }

  dimension: location_id {
    type: string
    description: "Location ID"
    # hidden: yes
    sql: ${TABLE}.location_id ;;
  }

  dimension: product_id {
    type: string
    description: "Product ID"
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      product.product_id,
      product.product_hierarchy_level_2_name,
      product.product_hierarchy_level_1_name,
      product.product_hierarchy_name,
      location.location_id,
      location.location_name
    ]
  }
}
