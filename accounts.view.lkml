view: accounts {
  sql_table_name: `intricate-idiom-283322.acme.accounts` ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: number {
    type: string
    sql: ${TABLE}.number ;;
  }

  dimension: owners {
    type: string
    sql: ${TABLE}.owners ;;
  }

  dimension: product_code {
    type: string
    sql: ${TABLE}.product_code ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: bank_id {
    type: string
    sql: ${TABLE}.bank_id ;;
  }

  measure: balance {
    type: sum
    sql: ${TABLE}.balance.amount ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.balance.currency ;;
  }

  set: detail {
    fields: [
      number,
      owners,
      product_code,
      label,
      id,
      bank_id
    ]
  }
}
