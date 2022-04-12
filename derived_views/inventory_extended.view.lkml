  view: inventory_extended {
    derived_table: {
      sql: SELECT
          (inventory.inventory_date ) AS inventory_inventory_date,
          inventory.inventory_ownership  AS inventory_inventory_ownership,
          COALESCE(SUM(( inventory.inventory_quantity * product.product_cost)), 0) AS inventory_total_inventory_value,
          COALESCE(SUM(inventory.inventory_quantity ), 0) AS inventory_total_inventory_quantity
      FROM `@{PROJECT}.@{DIM_DATASET}.product`
           AS product
      INNER JOIN `@{PROJECT}.@{DIM_DATASET}.inventory`
           AS inventory ON product.product_uid = inventory.product_uid
      GROUP BY
          1,
          2
      ORDER BY
          1 DESC

       ;;
    }

    dimension: date {
      type: date
      datatype: date
      sql: ${TABLE}.inventory_inventory_date ;;
    }

    dimension: total_inv_quantity {
      type: number
      sql: ${TABLE}.inventory_total_inventory_quantity ;;
    }

    dimension: ownership {
      type: string
      sql: ${TABLE}.inventory_inventory_ownership ;;
    }

    dimension: inv_value {
      type: number
      sql: ${TABLE}.inventory_total_inventory_value ;;
    }

    measure: inv_avg_value {
      type: average
      value_format_name: usd
      sql: ${inv_value};;

    }

    measure: inv_turns{
      type: number
      sql: ${order_extended.total_cogs} / ${inv_avg_value};;

    }

    measure: days_on_hand{
      type: number
      sql: ${total_inv_quantity} / ${order_extended.avg_sales};;

    }

  }
