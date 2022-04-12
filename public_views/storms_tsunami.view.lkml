view: storms_tsunami{
  derived_table: {
    # datagroup_trigger: daily
    # partition_keys: ["date"]
    # requires ID, latitude, longitude columns in stores table
    # TO DO: update DATE_ADD(,+1 YEAR) with 2020 table once available in BQ public dataset
    sql: SELECT event_id, event_type, state, source, cz_name, event_begin_time, event_end_time, injuries_direct, deaths_direct, tor_f_scale, damage_property, event_longitude, event_latitude FROM `bigquery-public-data.noaa_historic_severe_storms.storms_2019`
      UNION ALL SELECT event_id, event_type, state, source, cz_name, event_begin_time, event_end_time, injuries_direct, deaths_direct, tor_f_scale, damage_property, event_longitude, event_latitude FROM `bigquery-public-data.noaa_historic_severe_storms.storms_2020` ;;

  }

  # storm_2019 and storm_2020

  dimension: event_id {
#    primary_key: yes
  type: string
  sql: ${TABLE}.event_id ;;
}

dimension: event_type {
  type: string
  sql: ${TABLE}.event_type ;;
}

dimension: state {
  type: string
  sql: ${TABLE}.state ;;
  map_layer_name: us_states
}

dimension: source {
  type: string
  sql: ${TABLE}.source ;;
}
dimension: event_latitude {
  type: string
  sql: ${TABLE}.event_latitude ;;
}

dimension: event_longitude {
  type: string
  sql: ${TABLE}.event_longitude ;;
}

dimension: cz_name {
  type: string
  sql: ${TABLE}.cz_name ;;
}

dimension_group: event_begin_time {
  type: time
  timeframes: [
    date,
    month,
    quarter,
    year
  ]
  datatype: date
  sql: CAST(${TABLE}.event_begin_time AS date) ;;
}


dimension: primary_key {
  hidden: yes
  primary_key: yes
  type: string
  sql: ${event_id},'',CAST(${event_begin_time_date} AS STRING)) ;;
}

dimension_group: event_end_time {
  type: time
  timeframes: [
    date,
    month,
    quarter,
    year
  ]
  datatype: date
  sql: ${TABLE}.event_end_time ;;
}

measure: injuries_direct {
  type: number
  sql: ${TABLE}.injuries_direct ;;
}

measure: deaths_direct {
  type: number
  sql: ${TABLE}.deaths_direct ;;
}

dimension: tor_f_scale {
  type: string
  sql: ${TABLE}.tor_f_scale ;;
}

measure: damage_property {
  type: sum
  sql: ${TABLE}.damage_property ;;
}
}
