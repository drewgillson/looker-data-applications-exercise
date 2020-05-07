connection: "internal"

explore: product {
  join: product2 {
    from: product
    sql_on: ${product.name} = ${product2.name} ;;
    relationship: many_to_many
  }
}

view: product {
  derived_table: {
    sql: SELECT '2019-08-13 00:00:00' AS updated_at, 'DMV Driving Records - % 50 States Plus D.C. Puerto Rico Coverage Plus Fees' AS name, 2 AS quantity_on_hand, 0 AS quantity_on_order
         UNION ALL
         SELECT '2019-08-13 00:00:00' AS updated_at, 'Education Verification Technology 3Entity,2App-proof,Close,75-80HR/93-97%' AS name, 4 AS quantity_on_hand, 1 AS quantity_on_order
         UNION ALL
         SELECT '2019-08-13 00:00:00', 'banana', 3, 0
         UNION ALL
         SELECT '2020-05-06 00:00:00', 'apple', 4, 0
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
    label: "Name {{ _view._name }}"
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: quantity_on_hand {
    type: sum
    drill_fields: [quantity_on_order, quantity_on_hand]
    sql: ${TABLE}.quantity_on_hand ;;
  }

  measure: quantity_on_order {
    type: sum
    sql: ${TABLE}.quantity_on_order ;;
  }
}
