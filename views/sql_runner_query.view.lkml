view: sql_runner_query {
  derived_table: {
    sql: -- raw sql results do not include filled-in values for 'orders.created_week'


      SELECT
          (DATE_FORMAT(TIMESTAMP(DATE(DATE_ADD(CONVERT_TZ(orders.created_at ,'UTC','America/Los_Angeles'),INTERVAL (0 - MOD((DAYOFWEEK(CONVERT_TZ(orders.created_at ,'UTC','America/Los_Angeles')) - 1) - 1 + 7, 7)) day))), '%Y-%m-%d')) AS `orders.created_week`,
          COUNT(DISTINCT orders.id ) AS `orders.count`,
          COUNT(*) AS `order_items.count`,
          COUNT(DISTINCT users.id ) AS `users.count`
      FROM demo_db.order_items  AS order_items
      LEFT JOIN demo_db.orders  AS orders ON order_items.order_id = orders.id
      LEFT JOIN demo_db.users  AS users ON orders.user_id = users.id
      GROUP BY
          1
      ORDER BY
          1 DESC
      LIMIT 10 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: orders_created_week {
    type: string
    sql: ${TABLE}.`orders.created_week` ;;
  }

  dimension: orders_count {
    type: number
    sql: ${TABLE}.`orders.count` ;;
  }

  dimension: order_items_count {
    type: number
    sql: ${TABLE}.`order_items.count` ;;
  }

  dimension: users_count {
    type: number
    sql: ${TABLE}.`users.count` ;;
  }

  set: detail {
    fields: [
        orders_created_week,
  orders_count,
  order_items_count,
  users_count
    ]
  }
}
