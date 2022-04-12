view: covid_tracking {
  derived_table: {
    sql: select * from `bigquery-public-data.covid19_tracking.national_testing_and_outcomes` ;;
  }

  dimension_group: dates {
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
    datatype: date
    sql: ${TABLE}.date ;;
  }

  measure: in_icu_cumulative {
    type: number
    sql: ${TABLE}.in_icu_cumulative ;;

  }

  measure: in_icu_currently {
    type: number
    sql: ${TABLE}.in_icu_currently ;;

  }



  measure: death_increase {
    type: number
    sql: ${TABLE}.death_increase ;;

  }

  measure: death {
    type: number
    sql: ${TABLE}.death ;;

  }

  measure: hospitalized_increase {
    type: number
    sql: ${TABLE}.hospitalized_increase ;;

  }

  measure: hospitalized_currently {
    type: number
    sql: ${TABLE}.hospitalized_currently ;;

  }

  measure: hospitalized_cumulative {
    type: number
    sql: ${TABLE}.hospitalized_cumulative ;;

  }

  measure: negative {
    type: number
    sql: ${TABLE}.negative ;;

  }
  measure: negative_increase {
    type: number
    sql: ${TABLE}.negative_increase ;;

  }

  measure: positive {
    type: number
    sql: ${TABLE}.positive ;;

  }

  measure: positive_increase {
    type: number
    sql: ${TABLE}.positive_increase ;;

  }

  measure: total_test_results {
    type: number
    sql: ${TABLE}.total_test_results ;;

  }

}
