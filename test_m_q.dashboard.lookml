- dashboard: test_m_q
  title: Test M Q
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: VyeZrb4Px2SraDqcYE02e7
  elements:
  - title: Test_Tile
    name: Test_Tile
    model: new_model
    explore: orders
    type: table
    fields: [orders.status, orders.count]
    sorts: [orders.count desc 0]
    limit: 500
    column_limit: 50
    query_timezone: US/Eastern
    note_state: collapsed
    note_display: hover
    note_text: Test_Note_2
    listen: {}
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Area
    name: Area
    model: new_model
    explore: orders
    type: looker_area
    fields: [orders.status, orders.count]
    sorts: [orders.count desc 0]
    limit: 500
    column_limit: 50
    query_timezone: US/Eastern
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Test_Note
    listen: {}
    row: 0
    col: 8
    width: 16
    height: 6
  - name: Merged_Query
    title: Merged_Query
    merged_queries:
    - model: mtrmisathelook
      explore: order_items
      type: table
      fields: [order_items.order_id, order_items.sale_price, order_items.count, order_items.total_sale_price]
      sorts: [order_items.count desc 0]
      limit: 500
      column_limit: 50
      query_timezone: US/Eastern
    - model: new_model
      explore: orders
      type: table
      fields: [orders.id, orders.status, orders.user_id]
      limit: 500
      query_timezone: US/Eastern
      join_fields:
      - field_name: orders.id
        source_field_name: order_items.order_id
    type: table
    sorts: [orders.status desc]
    row:
    col:
    width:
    height:
