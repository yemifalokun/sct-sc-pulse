connection: "@{CONNECTION}"

# include all the views and dashboards
include: "/dashboards/*"
include: "/private_views/*"
include: "/public_views/*"
include: "/derived_views/*"
include: "/community_views/*"


datagroup: scl_canonical_demo_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: scl_canonical_demo_datagroup

explore: inventory {
  label: "(1) Inventory and Location Analysis"
  join: product {
    type: left_outer
    sql_on: ${inventory.product_uid} = ${product.product_uid} ;;
    relationship: many_to_one
  }

  join: location {
    type: left_outer
    sql_on: ${inventory.location_uid} = ${location.location_uid} ;;
    relationship: many_to_one

  }
  # join: location_weather {
  #   type: left_outer
  #   sql_on:  ${inventory.inventory_date1} = ${location_weather.weather_date}
  #     AND ${inventory.location_uid} = ${location_weather.location_id} ;;
  #   relationship: many_to_one
  # }

  join: location_weather {
    type: left_outer
    sql_on: ${inventory.inventory_date1} = ${location_weather.date} ;;
    sql_where: ST_DISTANCE(ST_GEOGPOINT(location.geo_longitude,location.geo_lattitude),ST_GEOGPOINT(location_weather.longitude,location_weather.latitude)) <= 30000 ;;
    relationship: many_to_one
  }

  join: storms_tsunami {
    type: left_outer
    sql_on: ${inventory.inventory_date1} = date(${storms_tsunami.event_begin_time_date}) ;;
    sql_where: ST_DISTANCE(ST_GEOGPOINT(location.geo_longitude,location.geo_lattitude),ST_GEOGPOINT(storms_tsunami.event_longitude,storms_tsunami.event_latitude)) < 30000  ;;
    relationship: many_to_one
  }
}

explore: order {
  label: "(2) Order, Location and Community Data Analysis"
  join: asset {
    type: left_outer
    sql_on: ${order.asset_id} = ${asset.asset_id} ;;
    relationship: many_to_one
  }

  join: location {
    type: left_outer
    sql_on: ${order.location_uid} = ${location.location_uid} ;;
    relationship: many_to_one
  }

  join: product {
    type: left_outer
    sql_on: ${order.product_uid} = ${product.product_uid} ;;
    relationship: many_to_one
  }



  # P44 Data Integration

  join: shipment_identifier_order {
    type: inner
    sql_on: ${order.order_uid} = ${shipment_identifier_order.identifier_value} ;;
    relationship: one_to_many
  }

  join: shipment_identifier_view {
    type: inner
    sql_on: ${shipment_identifier_order.shipment_id} = ${shipment_identifier_view.shipment_id} ;;
    relationship: one_to_many
  }

  join: shipment_event_view {
    type: inner
    sql_on: ${shipment_identifier_view.shipment_id} = ${shipment_event_view.shipment_id} ;;
    relationship: one_to_many
  }

  join: route_segment_view {
    type: inner
    sql_on: ${shipment_identifier_view.shipment_id} = ${route_segment_view.shipment_id} ;;
    relationship: one_to_many
  }

  join: route_segment_identifier_view {
    type: inner
    sql_on: ${route_segment_view.id} = ${route_segment_identifier_view.route_segment_id} ;;
    relationship: one_to_many
  }

  join: stop_view {
    type: inner
    sql_on: ${route_segment_view.from_stop_id} = ${stop_view.id} ;;
    relationship: one_to_many
  }

  join: stop {
    type: inner
    sql_on: ${route_segment_view.to_stop_id} = ${stop.id} ;;
    relationship: one_to_many
  }

  join: location_shipping {
    type: inner
    sql_on: ${order.shipping_location_uid} = ${location_shipping.location_uid} ;;
    relationship: many_to_one
  }

  join: location_receiving {
    type: inner
    sql_on: ${order.receiving_location_uid} = ${location_receiving.location_uid} ;;
    relationship: many_to_one
  }

}


explore: inventory_extended {
  label: "(3) Inventory and Order Analysis"
  join: order_extended {
    type: inner
    sql_on: ${inventory_extended.ownership} = ${order_extended.company_code}
      and ${inventory_extended.date} = ${order_extended.actual_delivery_date};;
    relationship: one_to_one
  }


}

# public data set

explore: storms_tsunami {
  label: "(4) Storms and Order Data Analysis"
  join: location {
    type: inner
    sql_on: 1 = 1 ;;
    sql_where: ST_DISTANCE(ST_GEOGPOINT(location.geo_longitude,location.geo_lattitude),ST_GEOGPOINT(storms_tsunami.event_longitude,storms_tsunami.event_latitude)) < 2000  ;;
    relationship: many_to_one

  }
#  sql_always_where: ${order.actual_delivery_date} = ${storms_tsunami.event_begin_time_date} ;;
  join: order {
    type: inner
    sql_on: ${order.location_uid} = ${location.location_uid}
      and ${order.actual_delivery_date} = date(${storms_tsunami.event_begin_time_date});;
    relationship: many_to_one
  }

  join: inventory {
    type: left_outer
    sql_on: ${inventory.location_uid} = ${location.location_uid}
      and ${inventory.inventory_date1} = date(${storms_tsunami.event_begin_time_date});;
    relationship: many_to_one
  }

  join: product {
    type: left_outer
    sql_on: ${order.product_uid} = ${product.product_uid} ;;
    relationship: many_to_one
  }
}
