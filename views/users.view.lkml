# The name of this view in Looker is "Users"
view: users {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.users ;;
  drill_fields: [id]
# comment
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Age" in Explore.

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_age {
    type: sum
    sql: ${age} ;;  }
  measure: average_age {
    type: average
    sql: ${age} ;;  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: raw_date {
    type: date_raw
    sql: ${TABLE}.created_at ;;
    convert_tz: no
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
    suggest_explore: orders
    suggest_dimension: orders.status
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  # dimension: state {
  #   type: string
  #   sql: ${TABLE}.state ;;
  #   link: {
  #     label: "Test_link"
  #     url: "www.google.com/{{ value }}"
  #   }
  # }

  measure: v {
    type: number
    sql: 12345678901234 ;;
  }

  # measure: sum_v {
  #   type: sum
  #   sql: ${v} ;;
  # }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }


  parameter: test {
    label: "parameter_label_test"
# default_value: ""
    allowed_value: {
      label: ""
      value: ""
    }
    allowed_value: {
      label: "Value 1"
      value: "value_1"
    }
    allowed_value: {
      label: "Value 2"
      value: "value_2"
    }
  }

  dimension: test_dimension_localization{
    label: "dimension_label"
    label_from_parameter: test
    sql: "Test" ;;
  }



  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  first_name,
  last_name,
  events.count,
  orders.count,
  saralooker.count,
  sindhu.count,
  user_data.count
  ]
  }

}
