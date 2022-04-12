view: order {
  sql_table_name: `@{PROJECT}.@{DIM_DATASET}.order`;;

  dimension: pk {
    type: date
    primary_key: yes
    sql: CONCAT(${order_uid},'',${location_uid},'',${product_uid},'',CAST(${actual_delivery_date} AS STRING),'',CAST(${pgi_date_actual_date} AS STRING)) ;;
  }

  dimension: order_id {
    label: "Order ID"
#    primary_key: yes
    type: string
    description: "Unique Identifier for a specific order category"
    sql: ${TABLE}.order_id ;;
  }

  dimension: order_id_action {
    label: "Order ID"
#    primary_key: yes
    type: string
    description: "Unique Identifier for a specific order category"
    sql: ${TABLE}.order_id ;;

    action: {
      label: "Notify through email"
      url: "https://hooks.zapier.com/hooks/catch/11814505/b5cqwxz/"

      form_param: {
        name: "Message"
        type: textarea
        default: "Hey could you check out Order ID #{{value}}.
        Order Category :- {{order_category._value}}
        Location Name :- {{location.location_name._value}}
        Order Type :- {{order_type._value}}
        Requested Date :- {{requested_delivery_date._value}}
        Actual Delivery Date :- {{actual_delivery_date._value}}
        Open Quantity :- {{open_quantity._value}}
        Event ID :- {{storms_tsunami.event_id._value}}
        Event Type :- {{storms_tsunami.event_type._value}}
        State :- {{storms_tsunami.state._value}}
        Event Begin Month :- {{storms_tsunami.event_begin_time_month._value}}
        Sales Price :- {{Sale_Price._value}}"
      }

      form_param: {
        name: "Recipient"
        type: textarea
        default: ""
      }

    }
    action: {
      label: "Setup an urgent meeting"
      url: "https://hooks.zapier.com/hooks/catch/11814505/bryrebp/"

      form_param: {
        name: "Heading"
        type: string
        default: "Let's connect urgently for Order ID #{{value}}."
      }

      form_param: {
        name: "Description"
        type: textarea
        default: "Details as below -
        Order Category :- {{order_category._value}}
        Location Name :- {{location.location_name._value}}
        Order Type :- {{order_type._value}}
        Requested Date :- {{requested_delivery_date._value}}
        Actual Delivery Date :- {{actual_delivery_date._value}}
        Open Quantity :- {{open_quantity._value}}
        Event ID :- {{storms_tsunami.event_id._value}}
        Event Type :- {{storms_tsunami.event_type._value}}
        State :- {{storms_tsunami.state._value}}
        Event Begin Month :- {{storms_tsunami.event_begin_time_month._value}}
        Sales Price :- {{Sale_Price._value}}"
      }

      form_param: {
        name: "Start Date and Time (M/DD/YYYY, HH:MM Timezone)"
        type: string
        default: ""
      }

      form_param: {
        name: "End Date and Time (M/DD/YYYY, HH:MM Timezone)"
        type: string
        default: ""
      }

      form_param: {
        name: "Recipient"
        type: textarea
        default: ""
      }
    }
  }

  dimension: active {
    type: string
    description: "Deletion"
    sql: ${TABLE}.active ;;
  }

  dimension_group: actual_delivery {
    type: time
    description: "Actual delivery date Date/Proof of Delivery Date"
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
    sql: ${TABLE}.actual_delivery_date ;;
  }

  dimension: asset_id {
    type: string
    description: "Asset ID"
    # hidden: yes
    sql: ${TABLE}.asset_id ;;
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

  dimension: company_code {
    type: string
    description: "Legal entity for Ownership"
    sql: ${TABLE}.company_code ;;
  }

  dimension_group: confirmed_delivery {
    type: time
    description: "Confirmed Date"
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
    sql: ${TABLE}.confirmed_delivery_date ;;
  }

  dimension: confirmed_quantity {
    type: string
    description: "Confirmed Qty"
    sql: ${TABLE}.confirmed_quantity ;;
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

  dimension: delivered_quantity {
    type: string
    description: "Delivered Quantity"
    sql: ${TABLE}.delivered_quantity ;;
  }

  dimension: item_id {
    type: string
    description: "Item number"
    sql: ${TABLE}.item_id ;;
  }

  dimension: key_legal_entity {
    type: string
    description: "Key Legal Entity (customer, Supplier, Planner etc)"
    sql: ${TABLE}.key_legal_entity ;;
  }

  dimension: location_uid {
    type: string
    description: "Location ID"
    # hidden: yes
    sql: ${TABLE}.location_uid ;;
  }

  dimension: mode_of_transport {
    type: string
    description: "Mode of Transport - Air, Rail, Road"
    sql: ${TABLE}.mode_of_transport ;;
  }

  dimension: open_quantity {
    type: string
    description: "Open Qty"
    sql: ${TABLE}.open_quantity ;;
  }

  dimension: order_block {
    type: string
    description: "Block"
    sql: ${TABLE}.order_block ;;
  }

  dimension: order_category {
    type: string
    description: "Order Category denotes a specific category of order (Sales Order, Purchase Order, Production Order)"
    sql: ${TABLE}.order_category ;;
  }

  dimension: order_uid {
#    primary_key: yes
  type: string
  description: "Unique Identifier for the record"
  sql: ${TABLE}.order_uid ;;
}

dimension: order_uom {
  type: string
  description: "Order UoM"
  sql: ${TABLE}.order_uom ;;
}

dimension_group: pgi_date_actual {
  type: time
  description: "Actual PGI date"
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
  sql: ${TABLE}.pgi_date_actual ;;
}

dimension_group: pgi_date_confirmed {
  type: time
  description: "PGI Date based on confirmed delivery date"
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
  sql: ${TABLE}.pgi_date_confirmed ;;
}

dimension_group: pgi_date_requested {
  type: time
  description: "PGI date based on requested date"
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
  sql: ${TABLE}.pgi_date_requested ;;
}

dimension: preceding_document {
  type: string
  description: "Preceding Order ID"
  sql: ${TABLE}.preceding_document ;;
}

dimension: product_uid {
  type: string
  description: "Product ID"
  # hidden: yes
  sql: ${TABLE}.product_uid ;;
}

dimension: received_quantity {
  type: string
  description: "Received Quantity"
  sql: ${TABLE}.received_quantity ;;
}

dimension: receiving_location_uid {
  type: string
  description: "Receiving Location ID"
  sql: ${TABLE}.receiving_location_uid ;;
}

dimension: rejected_qty {
  type: string
  description: "Rejected/Cancelled Qty"
  sql: ${TABLE}.rejected_qty ;;
}

dimension: rejection_code {
  type: string
  description: "Reason for rejection"
  sql: ${TABLE}.rejection_code ;;
}

dimension_group: requested_delivery {
  type: time
  description: "Requested Date"
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
  sql: ${TABLE}.requested_delivery_date ;;
}

dimension: requested_delivery_date1 {
  type: date
  sql: cast(${TABLE}.requested_delivery_date as timestamp) ;;
}

dimension: requested_quantity {
  type: string
  description: "Requested Qty"
  sql: ${TABLE}.requested_quantity ;;
}

dimension: route_id {
  type: string
  description: "Route"
  sql: ${TABLE}.route_id ;;
}

dimension: schedule_id {
  type: string
  description: "Schedule Line number"
  sql: ${TABLE}.schedule_id ;;
}

dimension: shipped_quantity {
  type: string
  description: "Shipped Quantity (Leaving company premise)"
  sql: ${TABLE}.shipped_quantity ;;
}

dimension: shipping_location_uid {
  type: string
  description: "Shipping Location"
  sql: ${TABLE}.shipping_location_uid ;;
}

dimension: status {
  type: string
  description: "Delivery Status"
  sql: ${TABLE}.status ;;
}

dimension: successor_document {
  type: string
  description: "Successor Order ID"
  sql: ${TABLE}.successor_document ;;
}

dimension: uid {
  type: string
  description: "Unique Identifier for the record"
  sql: ${TABLE}.uid ;;
}

dimension: valuation_area {
  type: string
  description: "Valuation Entity for financial reporting"
  sql: ${TABLE}.valuation_area ;;
}
dimension: order_type {
  type: string
  sql: ${TABLE}.order_type ;;
}

measure: count {
  type: count
  drill_fields: [detail*]
}

# ----- Sets of fields for drilling ------
set: detail {
  fields: [
    order_id,
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

measure: order_count {
  type: count_distinct
  drill_fields: [detail*]
  sql: ${order_id} ;;
}

  measure: order_count_action {
    type: count_distinct
    drill_fields: [detail*]
    sql: ${order_id} ;;

    action: {
      label: "Notify through email"
      url: "https://hooks.zapier.com/hooks/catch/11814505/b5cqwxz/"

      form_param: {
        name: "Message"
        type: textarea
        default: "Hey could you check out Order Count #{{value}}.
        Creation Date :- {{creation_date._value}}
        Order Health :- {{status._value}}"
      }

      form_param: {
        name: "Recipient"
        type: textarea
        default: ""
      }

    }
    action: {
      label: "Setup an urgent meeting"
      url: "https://hooks.zapier.com/hooks/catch/11814505/bryrebp/"

      form_param: {
        name: "Heading"
        type: string
        default: "Let's connect urgently for Order Count #{{value}}."
      }

      form_param: {
        name: "Description"
        type: textarea
        default: "Details as below -
        Creation Date :- {{creation_date._value}}
        Order Health :- {{status._value}}"
      }

      form_param: {
        name: "Start Date and Time (M/DD/YYYY, HH:MM Timezone)"
        type: string
        default: ""
      }

      form_param: {
        name: "End Date and Time (M/DD/YYYY, HH:MM Timezone)"
        type: string
        default: ""
      }

      form_param: {
        name: "Recipient"
        type: textarea
        default: ""
      }
    }
  }

dimension: cogs {
  type: number
  sql: ${delivered_quantity} * ${product.product_cost};;
#    filters: [order_category: "DELIVERY", actual_delivery_month: "12 months"]
}

measure: open_so {
  type: sum
  sql: ${open_quantity};;
  filters: [order_category: "SALES"]
}

measure: open_po {
  type: sum
  sql: ${open_quantity};;
  filters: [order_category: "PURCHASE"]
}

measure: open_delivery {
  type: sum
  sql: ${open_quantity};;
  filters: [order_category: "DELIVERY"]
}

measure: average_sales {
  type: average
  sql: ${requested_quantity};;
  filters: [order.order_category: "SALES", order.requested_delivery_month: "3 months"]
}

dimension: Sales_price {
  type: number
  sql:  ${TABLE}.sales_price ;;
}

measure: Sale_Price {
  type: sum_distinct
  drill_fields: [detail*]
  sql:  ${Sales_price} ;;
}

measure: sales_price_currency {
  type: string
  sql: ${TABLE}.sales_price_currency ;;
}

measure: Order_id {
  type: count_distinct
  sql: ${TABLE}.order_id ;;
}
}
