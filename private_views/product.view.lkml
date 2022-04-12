view: product {
  sql_table_name: `@{PROJECT}.@{DIM_DATASET}.product`
    ;;
  drill_fields: [product_id]

  dimension: product_uid {
    primary_key: yes
    type: string
    description: "Product ID is unique Identifier for the Product"
    sql: ${TABLE}.product_uid ;;
  }

  dimension: product_id {
    #  primary_key: yes
    type: string
    description: "Product ID is unique Identifier for the Product"
    sql: ${TABLE}.product_id ;;
  }

  dimension: active {
    type: string
    description: "Product Active"
    sql: ${TABLE}.active ;;
  }

  dimension: base_uom {
    type: string
    description: "Base Unit of Measure"
    sql: ${TABLE}.base_uom ;;
  }

  dimension: batch_managed {
    type: string
    description: "Is this a Batch-Managed Product"
    sql: ${TABLE}.batch_managed ;;
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

  dimension: gross_weight {
    type: string
    description: "Gross Weight - Used for transportation planning"
    sql: ${TABLE}.gross_weight ;;
  }

  dimension: lead_time {
    type: string
    description: "Total Replenishment Lead time"
    sql: ${TABLE}.lead_time ;;
  }

  dimension: organization_level {
    type: string
    description: "Organisation Level is representing any organisation unit, this can be a plant, sales organisation or a company code."
    sql: ${TABLE}.organization_level ;;
  }

  dimension: procurement_type {
    type: string
    description: "Product is in-house produced or externally procured"
    sql: ${TABLE}.procurement_type ;;
  }

  dimension: product_category {
    type: string
    description: "Further classification of the product based on handling of the product - Hazardous Goods, Dangerous Goods, Oxidising, Corrosive, Gas, Flammable"
    sql: ${TABLE}.product_category ;;
  }

  dimension: product_classification {
    type: string
    description: "ABC Classification for KPI analysis"
    sql: ${TABLE}.product_classification ;;
  }

  dimension: product_cost {
    type: string
    description: "Average Cost of the Product"
    sql: ${TABLE}.product_cost ;;
  }

  dimension: product_description {
    type: string
    description: "Product Description"
    sql: ${TABLE}.product_description ;;
  }

  dimension: product_group {
    type: string
    description: "Product Group"
    sql: ${TABLE}.product_group ;;
  }

  dimension: product_hierarchy {
    type: string
    description: "Product Hierarchy"
    sql: ${TABLE}.product_hierarchy ;;
  }

  dimension: product_hierarchy_level {
    type: string
    description: "Product Hierarchy Level"
    sql: ${TABLE}.product_hierarchy_level ;;
  }

  dimension: product_hierarchy_level_1 {
    type: string
    description: "Product Hierarchy Level 1"
    sql: ${TABLE}.product_hierarchy_level_1 ;;
  }

  dimension: product_hierarchy_level_1_name {
    type: string
    description: "Product Hierarchy Level 1 Name"
    sql: ${TABLE}.product_hierarchy_level_1_name ;;
  }

  dimension: product_hierarchy_level_2 {
    type: string
    description: "Product Hierarchy Level 2"
    sql: ${TABLE}.product_hierarchy_level_2 ;;
  }

  dimension: product_hierarchy_level_2_name {
    type: string
    description: "Product Hierarchy Level 2 Name"
    sql: ${TABLE}.product_hierarchy_level_2_name ;;
  }

  dimension: product_hierarchy_level_length {
    type: string
    description: "Product Hierarchy Level Length"
    sql: ${TABLE}.product_hierarchy_level_length ;;
  }

  dimension: product_hierarchy_name {
    type: string
    description: "Product Hierarchy Name"
    sql: ${TABLE}.product_hierarchy_name ;;
  }

  dimension: product_type {
    type: string
    description: "Product type - whether it is raw material or finished goods"
    sql: ${TABLE}.product_type ;;
  }

  dimension: safety_stock {
    type: string
    description: "Safety Stock"
    sql: ${TABLE}.safety_stock ;;
  }

  dimension: shelf_life {
    type: string
    description: "Shelf_Life of the Product"
    sql: ${TABLE}.shelf_life ;;
  }

  dimension: temperature_condition {
    type: string
    description: "Temperature Condition"
    sql: ${TABLE}.temperature_condition ;;
  }

  dimension: uid {
    type: string
    description: "Unique identifier for the record"
    sql: ${TABLE}.uuid ;;
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

  dimension: volume {
    type: string
    description: "Volume - Used for transportation planning"
    sql: ${TABLE}.volume ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      product_id,
      product_hierarchy_level_2_name,
      product_hierarchy_level_1_name,
      product_hierarchy_name,
      inventory.count,
      forecast.count,
      order.count
    ]
  }
}
