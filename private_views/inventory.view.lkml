view: inventory {
  sql_table_name: `@{PROJECT}.@{DIM_DATASET}.inventory`
    ;;

  dimension: pk {
    type: date
    primary_key: yes
    sql: CONCAT(cast(${TABLE}.inventory_date as string),'',${location_uid},'',${product_uid},'',${batch_number},'',${inventory_type}) ;;
  }

  dimension: batch_number {
#    primary_key: yes
  type: number
  description: "Batch Number"
  sql: ${TABLE}.batch_number ;;
}

dimension_group: inv_gr {
  type: time
  description: "Goods Receipt date for Inventory Ageing Calculation"
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
  sql: ${TABLE}.inv_gr_date ;;
}

dimension: inventory_assignment {
  type: string
  description: "Legal Entity"
  sql: ${TABLE}.inventory_assignment ;;
}

dimension: inventory_block {
  type: string
  description: "Inventory Block"
  sql: ${TABLE}.inventory_block ;;
}

dimension_group: inventory {
  type: time
  description: "Date"
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
  sql: ${TABLE}.inventory_date ;;
}

dimension: inventory_date1 {
  type: date
#    primary_key: yes
  sql: cast(${TABLE}.inventory_date as timestamp) ;;
}

dimension: inventory_ownership {
  type: string
  description: "Legal Entity for ownership (Company Code, Supplier)"
  sql: ${TABLE}.inventory_ownership ;;
}

dimension: inventory_quantity {
  type: string
  description: "Quantity in Base UoM"
  sql: ${TABLE}.inventory_quantity ;;
}

dimension: inventory_type {
  type: string
  description: "Inventory Type - Unrestricted, in transit, Blocked, Expired, Customer Consignment, Vendor Consignment, Order specific etc"
  sql: ${TABLE}.inventory_type ;;
}

dimension: location_uid {
  type: string
  description: "Location ID"
  # hidden: yes
  sql: ${TABLE}.location_uid ;;
}

dimension: product_uid {
  type: string
  description: "Product ID"
  # hidden: yes
  sql: ${TABLE}.product_uid ;;
}

dimension: remaining_shelf_life {
  type: string
  description: "Remaining Shelf life"
  sql: ${TABLE}.remaining_shelf_life ;;
}

dimension: valuation_area {
  type: string
  description: "Valuation Entity for financial reporting"
  sql: ${TABLE}.valuation_area ;;
}

measure: count {
  type: count
  drill_fields: [detail*]
}


# New Created fields

dimension: inventory_value {
  type: number
  sql: ${inventory_quantity} * ${product.product_cost};;

}

measure: total_inventory_value {
  type: sum
  sql: ${inventory_value};;
}

#  measure: average_inventory_value {
#    type: average
#    value_format_name: usd
#    sql: ${total_inventory_value};;
#  }

measure: raw_material_inventory {
  type: sum
  value_format_name: usd
  sql: ${inventory_value};;
  filters: {
    field: product.product_type
    value: "RAW MATERIAL"
  }

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

dimension: days_in_inventory {
  description: "days between created and sold date"
  type: number
  sql: DATE_DIFF(coalesce(${inventory_raw}, CURRENT_DATE()), ${inv_gr_raw}, DAY) ;;
}

dimension: days_in_inventory_tier {
  type: tier
  sql: ${days_in_inventory} ;;
  style: integer
  tiers: [0, 5, 10, 20, 40, 80, 160, 360]
}

dimension: is_sold {
  type: yesno
  sql: ${inventory_raw} is not null ;;
}

measure: number_on_hand {
  type: count
  drill_fields: [detail*]

  filters: {
    field: is_sold
    value: "Yes"
  }
}

measure: total_inventory_quantity {
  type: sum
  sql: ${inventory_quantity} ;;
}
}
