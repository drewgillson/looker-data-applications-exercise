connection: "internal"

explore: product {}

view: product {
  derived_table: {
    sql: SELECT '2019-08-13 00:00:00' AS updated_at, 'apple' AS name, 2 AS quantity_on_hand, 0 AS quantity_on_order
         UNION ALL
         SELECT '2019-08-13 00:00:00', 'banana', 3, 0
    ;;
  }

  dimension_group: updated_at {
    timeframes: [date, time]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: large_string {
    type: string
    sql: REPEAT('A',5000) ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: quantity_on_hand {
    type: number
    sql: ${TABLE}.quantity_on_hand ;;
  }

  dimension: quantity_on_order {
    type: number
    sql: ${TABLE}.quantity_on_order ;;
  }
}
