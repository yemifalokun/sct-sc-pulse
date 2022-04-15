view: blumeglobal_rating_routes {
  sql_table_name: `sct-sandbox-demo.scl_blume_global_demo.ratingrouting`
    ;;

  dimension: accessorialrate {
    label: "Accessorial Rate"
    group_label: "Rates"
    type: string
    sql: ${TABLE}.accessorialrate ;;
    value_format_name: usd_0
  }

  dimension: baserate {
    label: "Base Rate"
    group_label: "Rates"
    type: number
    sql: ${TABLE}.baserate ;;
    value_format_name: usd_0
  }

  measure: total_baserate {
    label: "Total Price"
    group_label: "Rates"
    type: sum
    sql: ${baserate} ;;
    value_format_name: usd_0
    drill_fields: [shipperorcarriercode,lanecode, accessorialrate, baserate]
  }

  measure: average_baserate {
    label: "Average Price"
    group_label: "Rates"
    type: average
    sql: ${baserate} ;;
    value_format_name: usd_0
  }

  measure: min_price {
    type: min
    group_label: "Rates"
    sql: ${baserate} ;;
    value_format_name: usd_0
  }

  measure: max_price {
    type: max
    group_label: "Rates"
    sql: ${baserate} ;;
    value_format_name: usd_0
  }

  dimension: blume_carrier_score {
    type: number
    group_label: "Carrier"
    sql: ${TABLE}.blume_carrier_score/100 ;;
    value_format_name: percent_0
  }

  measure: min_carrier_score {
    group_label: "Carrier Score"
    type: min
    sql: ${blume_carrier_score} ;;
    value_format_name: percent_0
  }

  measure: max_carrier_score {
    group_label: "Carrier Score"
    type: max
    sql: ${blume_carrier_score} ;;
    value_format_name: percent_0
  }

  measure: average_carrier_score {
    group_label: "Carrier Score"
    type: average
    sql: ${blume_carrier_score} ;;
    value_format_name: percent_0
  }

  measure: aggregate_carrier_score {
    group_label: "Carrier Score"
    type: average
    sql: ${blume_carrier_score} ;;
    value_format_name: percent_0
    drill_fields: [carriername, aggregate_carrier_score]
  }

  dimension: blume_transit_days {
    description: "Transit time in days"
    type: number
    sql: ${TABLE}.blume_transit_time/60/24 ;;
    value_format_name: decimal_2
  }

  measure: min_transit_days {
    group_label: "Transit Days"
    type: min
    sql: ${blume_transit_days} ;;
    value_format_name: decimal_2
  }

  measure: max_transit_days {
    group_label: "Transit Days"
    type: max
    sql: ${blume_transit_days} ;;
    value_format_name: decimal_2
  }

  measure: average_transit_days {
    group_label: "Transit Days"
    type: average
    sql: ${blume_transit_days} ;;
    value_format_name: decimal_2
  }

  measure: total_blume_transit_days {
    group_label: "Transit Days"
    type: sum
    sql: ${blume_transit_days} ;;
    value_format_name: decimal_2
  }

  dimension: blume_transit_time_uom {
    type: string
    sql: ${TABLE}.blume_transit_time_uom ;;
    hidden: yes
  }

  dimension: carriercode {
    label: "Carrier Code"
    group_label: "Carrier"
    type: string
    sql: ${TABLE}.carriercode ;;
  }

  dimension: carriername {
    label: "Carrier Name"
    group_label: "Carrier"
    type: string
    sql: ${TABLE}.carriername ;;
  }

  dimension: chargecode {
    label: "Charge Code"
    group_label: "Carrier"
    type: string
    sql: ${TABLE}.CHARGECODE ;;
  }

  dimension: is_in_customer_network {
    label: "Customer Network"
    group_label: "Carrier"
    type: yesno
    sql: ${TABLE}.customernetwork ;;
  }

  dimension: destinationlocaddress1 {
    type: string
    sql: ${TABLE}.destinationlocaddress1 ;;
    hidden: yes
  }

  dimension: destinationlocaddress2 {
    type: string
    sql: ${TABLE}.destinationlocaddress2 ;;
    hidden: yes
  }

  dimension: destinationloccity {
    label: "Destination City"
    group_label: "Origin/Destination"
    type: string
    sql: ${TABLE}.destinationloccity ;;

    link: {
      label: "View on map"
      url: "https://www.google.com/maps/place/{{ value }},+{{ ratingrouting.originloccountry._value }}"
      icon_url: "https://maps.google.com/favicon.ico"
    }
  }

  dimension: destinationloccountry {
    label: "Destination Country"
    group_label: "Origin/Destination"
    type: string
    sql: ${TABLE}.destinationloccountry ;;
  }

  dimension: destinationlocstate {
    label: "Destination State"
    group_label: "Origin/Destination"
    type: string
    sql: ${TABLE}.destinationlocstate ;;
  }

  dimension: destinationloczip {
    type: string
    sql: ${TABLE}.destinationloczip ;;
    hidden: yes
  }

  dimension: effectivedate {
    label: "Effective Date"
    type: date
    sql: ${TABLE}.effectivedate ;;
  }

  dimension: view_button {
    type: string
    sql: "View" ;;
    link: {
      label: "View shipment details for route"
      url: "https://google.com"
      icon_url: "https://paganresearch.io/images/bll.jpg"
    }
  }

  dimension: equipmentsizetypeid {
    type: string
    sql: ${TABLE}.equipmentsizetypeid ;;
    hidden: yes
  }

  dimension: expirydate {
    label: "Expiry Date"
    type: date
    sql: ${TABLE}.expirydate ;;
  }

  dimension: geohierarchydestination {
    type: string
    sql: ${TABLE}.geohierarchydestination ;;
    hidden: yes
  }

  dimension: geohierarchyorigin {
    type: string
    sql: ${TABLE}.geohierarchyorigin ;;
    hidden: yes
  }

  dimension: lanecode {
    label: "Lane Code"
    description: "The code for the given shipping lane"
    type: string
    sql: ${TABLE}.lanecode ;;
  }

  dimension: laneid {
    label: "Lane ID"
    description: "The numeric ID for the given shipping lane"
    type: string
    sql: ${TABLE}.LANEID ;;
  }

  dimension: minimumcharge {
    label: "Minimum Charge"
    type: string
    sql: ${TABLE}.minimumcharge ;;
  }

  measure: total_minimum_charge {
    label: "Total Min Charge"
    group_label: "Charges"
    type: sum
    sql: ${minimumcharge} ;;
  }

  measure: average_minimum_charge {
    label: "Average Min Charge"
    group_label: "Charges"
    type: average
    sql: ${minimumcharge} ;;
  }

  dimension: modetype {
    label: "Shipping Mode"
    type: string
    sql: ${TABLE}.modetype ;;
  }

  dimension: originlocaddress1 {
    type: string
    sql: ${TABLE}.originlocaddress1 ;;
    hidden: yes
  }

  dimension: originlocaddress2 {
    type: string
    sql: ${TABLE}.originlocaddress2 ;;
    hidden: yes
  }

  dimension: originloccity {
    label: "Origin City"
    group_label: "Origin/Destination"
    type: string
    sql: ${TABLE}.originloccity ;;

    link: {
      label: "View on map"
      url: "https://www.google.com/maps/place/{{ value }},+{{ ratingrouting.originloccountry._value }}"
      icon_url: "https://maps.google.com/favicon.ico"
    }
  }

  dimension: originloccountry {
    label: "Origin Country"
    group_label: "Origin/Destination"
    type: string
    sql: ${TABLE}.originloccountry ;;
  }

  dimension: originlocstate {
    label: "Origin State"
    group_label: "Origin/Destination"
    type: string
    sql: ${TABLE}.originlocstate ;;
  }

  dimension: originloczip {
    type: string
    sql: ${TABLE}.originloczip ;;
    hidden: yes
  }

  dimension: shipperorcarriercode {
    label: "Shipper or Carrier Code"
    group_label: "Carrier"
    type: string
    sql: ${TABLE}.shipperorcarriercode ;;
  }

  dimension: transit_time {
    type: number
    sql: ${TABLE}.transit_time ;;
    value_format_name: decimal_0
    hidden: yes
  }

  measure: total_transit_time {
    type: sum
    sql: ${transit_time} ;;
    hidden: yes
  }

  dimension: transit_time_uom {
    type: string
    sql: ${TABLE}.transit_time_uom ;;
    hidden: yes
  }

  measure: count {
    label: "Shipment Count"
    type: count
    drill_fields: [carriername, count]
  }
}
