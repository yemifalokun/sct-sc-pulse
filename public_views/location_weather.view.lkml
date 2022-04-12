view: location_weather {
  derived_table: {
    sql: SELECT * FROM
      (
        SELECT
          w.id,
          w.date,
          w.element,
          s.latitude,
          s.longitude,
          w.value
        FROM `bigquery-public-data.ghcn_d.ghcnd_202*` w
              inner join `bigquery-public-data.ghcn_d.ghcnd_stations` s
          on s.id = w.id
      )
      PIVOT
      (
        AVG(value)
        FOR element in ("TAVG", "TMAX", "TMIN", "PRCP", "MDTN", "WDFG", "SNWD", "SNOW", "WDF5", "WESF", "WESD", "DAPR", "MDPR", "TOBS", "SX33", "AWND", "WSF2", "WDF2", "WSF5", "WT06", "WT01", "PGTM", "WSFG", "SN52", "SX52", "WT03", "WDMV", "SN32", "AWDR", "SN33", "SX32", "EVAP", "WT08", "WT02", "SX31", "WSFI", "TSUN", "WT04", "SN35", "MXPN", "DATN", "SN51", "WT11", "DWPR", "MNPN", "SX55", "SX36", "SN53", "SN31", "THIC", "SN36", "WT09", "SX35", "MDTX", "SX53", "SN55", "DATX", "PSUN", "WT05", "SN56", "SX51", "SX56", "WT07", "WT10", "DASF", "MDSF", "WT18", "WT17")
      )
      ORDER BY id,date,latitude,longitude;;
  }

  dimension: id {
#    hidden: yes
  type: string
  sql: ${TABLE}.id ;;
}

dimension: date {
#    hidden: yes
type: date
sql: ${TABLE}.date ;;
}

dimension: primary_key {
  hidden: yes
  primary_key: yes
  type: string
  sql: CONCAT(${id},'',CAST(${date} AS STRING)) ;;
}

dimension: no_orderby {
  type: number
  sql: null ;;
}

dimension: latitude {
#    hidden: yes
type: number
sql: ${TABLE}.latitude ;;
}

dimension: longitude {
#    hidden: yes
type: number
sql: ${TABLE}.longitude ;;
}

dimension: awdr {
  hidden: yes
  type: number
  sql: ${TABLE}.AWDR ;;
}

dimension: awnd {
  hidden: yes
  type: number
  sql: ${TABLE}.AWND ;;
}

dimension: dapr {
  hidden: yes
  type: number
  sql: ${TABLE}.DAPR ;;
}

dimension: dasf {
  hidden: yes
  type: number
  sql: ${TABLE}.DASF ;;
}

dimension_group: weather {
#    hidden: yes
type: time
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
sql: ${TABLE}.date ;;
}

dimension: datn {
  hidden: yes
  type: number
  sql: ${TABLE}.DATN ;;
}

dimension: datx {
  hidden: yes
  type: number
  sql: ${TABLE}.DATX ;;
}

dimension: average_distance_to_weather_stations_km {
  hidden: yes
  type: number
  sql: ${TABLE}.average_distance_to_weather_stations_km ;;
}

dimension: dwpr {
  hidden: yes
  type: number
  sql: ${TABLE}.DWPR ;;
}

dimension: evap {
  hidden: yes
  type: number
  sql: ${TABLE}.EVAP ;;
}

dimension: mdpr {
  hidden: yes
  type: number
  sql: ${TABLE}.MDPR ;;
}

dimension: mdsf {
  hidden: yes
  type: number
  sql: ${TABLE}.MDSF ;;
}

dimension: mdtn {
  hidden: yes
  type: number
  sql: ${TABLE}.MDTN ;;
}

dimension: mdtx {
  hidden: yes
  type: number
  sql: ${TABLE}.MDTX ;;
}

dimension: mnpn {
  hidden: yes
  type: number
  sql: ${TABLE}.MNPN ;;
}

dimension: mxpn {
  hidden: yes
  type: number
  sql: ${TABLE}.MXPN ;;
}

dimension: pgtm {
  hidden: yes
  type: number
  sql: ${TABLE}.PGTM ;;
}

dimension: prcp {
  label: "Precipitation (mm)"
  type: number
  sql: ${TABLE}.PRCP/10.0 ;;
}

dimension: psun {
  hidden: yes # not populated
  label: "Percent of Day Sunny (%)"
  value_format_name: percent_1
  type: number
  sql: ${TABLE}.PSUN ;;
}

dimension: sn31 {
  hidden: yes
  type: number
  sql: ${TABLE}.SN31 ;;
}

dimension: sn32 {
  hidden: yes
  type: number
  sql: ${TABLE}.SN32 ;;
}

dimension: sn33 {
  hidden: yes
  type: number
  sql: ${TABLE}.SN33 ;;
}

dimension: sn35 {
  hidden: yes
  type: number
  sql: ${TABLE}.SN35 ;;
}

dimension: sn36 {
  hidden: yes
  type: number
  sql: ${TABLE}.SN36 ;;
}

dimension: sn51 {
  hidden: yes
  type: number
  sql: ${TABLE}.SN51 ;;
}

dimension: sn52 {
  hidden: yes
  type: number
  sql: ${TABLE}.SN52 ;;
}

dimension: sn53 {
  hidden: yes
  type: number
  sql: ${TABLE}.SN53 ;;
}

dimension: sn55 {
  hidden: yes
  type: number
  sql: ${TABLE}.SN55 ;;
}

dimension: sn56 {
  hidden: yes
  type: number
  sql: ${TABLE}.SN56 ;;
}

dimension: sn57 {
  hidden: yes
  type: number
  sql: ${TABLE}.SN57 ;;
}

dimension: snow {
  label: "Snowfall (mm)"
  type: number
  sql: ${TABLE}.SNOW ;;
}

dimension: snwd {
  label: "Snow Depth (mm)"
  type: number
  sql: ${TABLE}.SNWD ;;
}

dimension: location_id {
  hidden: yes
  type: number
  sql: ${TABLE}.location_id ;;
}

dimension: sx31 {
  hidden: yes
  type: number
  sql: ${TABLE}.SX31 ;;
}

dimension: sx32 {
  hidden: yes
  type: number
  sql: ${TABLE}.SX32 ;;
}

dimension: sx33 {
  hidden: yes
  type: number
  sql: ${TABLE}.SX33 ;;
}

dimension: sx35 {
  hidden: yes
  type: number
  sql: ${TABLE}.SX35 ;;
}

dimension: sx36 {
  hidden: yes
  type: number
  sql: ${TABLE}.SX36 ;;
}

dimension: sx51 {
  hidden: yes
  type: number
  sql: ${TABLE}.SX51 ;;
}

dimension: sx52 {
  hidden: yes
  type: number
  sql: ${TABLE}.SX52 ;;
}

dimension: sx53 {
  hidden: yes
  type: number
  sql: ${TABLE}.SX53 ;;
}

dimension: sx55 {
  hidden: yes
  type: number
  sql: ${TABLE}.SX55 ;;
}

dimension: sx56 {
  hidden: yes
  type: number
  sql: ${TABLE}.SX56 ;;
}

dimension: sx57 {
  hidden: yes
  type: number
  sql: ${TABLE}.SX57 ;;
}

dimension: tavg {
  hidden: yes
  type: number
  sql: ${TABLE}.TAVG ;;
}

dimension: thic {
  hidden: yes
  type: number
  sql: ${TABLE}.THIC ;;
}

dimension: tmax {
  label: "Max Temperature (°C)"
  type: number
  sql: ${TABLE}.TMAX/10.0 ;;
}

dimension: tmin {
  label: "Min Temperature (°C)"
  type: number
  sql: ${TABLE}.TMIN/10.0 ;;
}

dimension: tobs {
  hidden: yes
  type: number
  sql: ${TABLE}.TOBS ;;
}

dimension: tsun {
  hidden: yes
  type: number
  sql: ${TABLE}.TSUN ;;
}

dimension: wdf2 {
  hidden: yes
  type: number
  sql: ${TABLE}.WDF2 ;;
}

dimension: wdf5 {
  hidden: yes
  type: number
  sql: ${TABLE}.WDF5 ;;
}

dimension: wdfg {
  hidden: yes
  type: number
  sql: ${TABLE}.WDFG ;;
}

dimension: wdmv {
  hidden: yes
  type: number
  sql: ${TABLE}.WDMV ;;
}

dimension: wesd {
  hidden: yes
  type: number
  sql: ${TABLE}.WESD ;;
}

dimension: wesf {
  hidden: yes
  type: number
  sql: ${TABLE}.WESF ;;
}

dimension: wsf2 {
  hidden: yes
  type: number
  sql: ${TABLE}.WSF2 ;;
}

dimension: wsf5 {
  hidden: yes
  type: number
  sql: ${TABLE}.WSF5 ;;
}

dimension: wsfg {
  hidden: yes
  type: number
  sql: ${TABLE}.WSFG ;;
}

dimension: wsfi {
  hidden: yes
  type: number
  sql: ${TABLE}.WSFI ;;
}

dimension: wt01 {
  hidden: yes
  type: number
  sql: ${TABLE}.WT01 ;;
}

dimension: wt02 {
  hidden: yes
  type: number
  sql: ${TABLE}.WT02 ;;
}

dimension: wt03 {
  hidden: yes
  type: number
  sql: ${TABLE}.WT03 ;;
}

dimension: wt04 {
  hidden: yes
  type: number
  sql: ${TABLE}.WT04 ;;
}

dimension: wt05 {
  hidden: yes
  type: number
  sql: ${TABLE}.WT05 ;;
}

dimension: wt06 {
  hidden: yes
  type: number
  sql: ${TABLE}.WT06 ;;
}

dimension: wt07 {
  hidden: yes
  type: number
  sql: ${TABLE}.WT07 ;;
}

dimension: wt08 {
  hidden: yes
  type: number
  sql: ${TABLE}.WT08 ;;
}

dimension: wt09 {
  hidden: yes
  type: number
  sql: ${TABLE}.WT09 ;;
}

dimension: wt10 {
  hidden: yes
  type: number
  sql: ${TABLE}.WT10 ;;
}

dimension: wt11 {
  hidden: yes
  type: number
  sql: ${TABLE}.WT11 ;;
}

dimension: wt15 {
  hidden: yes
  type: number
  sql: ${TABLE}.WT15 ;;
}

dimension: wt16 {
  hidden: yes
  type: number
  sql: ${TABLE}.WT16 ;;
}

dimension: wt17 {
  hidden: yes
  type: number
  sql: ${TABLE}.WT17 ;;
}

dimension: wt18 {
  hidden: yes
  type: number
  sql: ${TABLE}.WT18 ;;
}

dimension: wt22 {
  hidden: yes
  type: number
  sql: ${TABLE}.WT22 ;;
}

##### DERIVED DIMENSIONS #####

# dimension: pk {
#   hidden: yes
#   primary_key: yes
#   type: string
#   sql: CONCAT(CAST(${weather_date} AS STRING),'-',CAST(${location_id} AS STRING)) ;;
# }

###Measures###
measure: temperature_rating {
  type: number
  sql: CASE WHEN ${average_max_temparature}<=10 THEN 0 --Cold
    WHEN ${average_max_temparature}<=20 THEN 1 --Warm
    WHEN ${average_max_temparature}>20 THEN 2 --Hot
    END;;
}


##### MEASURES #####

measure: average_max_temparature {
  type: average
  sql: ${tmax} ;;
  value_format: "#,##0.0 \" °C\""
}

measure: average_min_temparature {
  type: average
  sql: ${tmin} ;;
  value_format: "#,##0.0 \" °C\""
}

measure: average_daily_precipitation {
  type: average
  sql: ${prcp} ;;
  value_format: "#,##0.0 \" mm\""
}

}
