view: order_extended {
  derived_table: {
    sql: SELECT
          (`order`.delivered_quantity) * product.product_cost AS order_cogs,
          `order`.company_code  AS order_company_code,
              (`order`.actual_delivery_date ) AS order_actual_delivery_date,
              AVG(CASE WHEN (((`order`.order_category) = 'SALES')) AND ((((`order`.requested_delivery_date ) >= ((DATE_ADD(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL -2 MONTH))) AND (`order`.requested_delivery_date ) < ((DATE_ADD(DATE_ADD(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL -2 MONTH), INTERVAL 3 MONTH)))))) THEN ( `order`.requested_quantity ) ELSE NULL END) AS order_average_sales
      FROM `@{PROJECT}.@{DIM_DATASET}.product`
           AS product
      INNER JOIN `@{PROJECT}.@{DIM_DATASET}.order`
           AS `order` ON product.product_uid = (`order`.product_uid)
      GROUP BY
          1,
          2,
          3
      ORDER BY
          1
       ;;
  }

  dimension: cogs {
    type: number
    sql: ${TABLE}.order_cogs ;;
  }

  dimension: avg_sales {
    type: number
    sql: ${TABLE}.order_average_sales ;;
  }

  dimension: company_code {
    type: string
    sql: ${TABLE}.order_company_code ;;
  }

  dimension: actual_delivery_date {
    type: date
    datatype: date
    sql: ${TABLE}.order_actual_delivery_date ;;
  }

  measure: total_cogs {
    type: sum
    sql: ${cogs};;
 }


}
