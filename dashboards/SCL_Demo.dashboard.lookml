- dashboard: scl_demo
  title: SCL Demo
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Inventory Distribution
    name: Inventory Distribution
    model: scl_canonical_demo
    explore: inventory
    type: looker_map
    fields: [location.location, inventory.total_inventory_value, location.location_type]
    sorts: [inventory.total_inventory_value desc]
    limit: 500
    map_plot_mode: lines
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: satellite
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: true
    reverse_map_value_colors: false
    map_latitude: 36.06686213257888
    map_longitude: -91.52728199958803
    map_zoom: 4
    defaults_version: 1
    listen: {}
    row: 72
    col: 12
    width: 12
    height: 7
  - title: Inventory Count
    name: Inventory Count
    model: scl_canonical_demo
    explore: inventory
    type: looker_line
    fields: [inventory.inventory_year, inventory.inventory_type, inventory.count]
    pivots: [inventory.inventory_year]
    fill_fields: [inventory.inventory_year]
    sorts: [inventory.inventory_year, inventory.count desc 0]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_null_points: false
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: inventory.total_inventory_value,
            id: 2021 - inventory.total_inventory_value, name: '2021'}, {axisId: inventory.total_inventory_value,
            id: 2020 - inventory.total_inventory_value, name: '2020'}, {axisId: inventory.total_inventory_value,
            id: 2019 - inventory.total_inventory_value, name: '2019'}, {axisId: inventory.total_inventory_value,
            id: 2018 - inventory.total_inventory_value, name: '2018'}, {axisId: inventory.total_inventory_value,
            id: 2017 - inventory.total_inventory_value, name: '2017'}, {axisId: inventory.total_inventory_value,
            id: 2016 - inventory.total_inventory_value, name: '2016'}, {axisId: inventory.total_inventory_value,
            id: inventory.inventory_year___null - inventory.total_inventory_value,
            name: "∅"}], showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    discontinuous_nulls: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields:
    listen: {}
    row: 72
    col: 0
    width: 11
    height: 7
  - title: Product Density
    name: Product Density
    model: scl_canonical_demo
    explore: inventory
    type: looker_map
    fields: [location.location, product.count]
    sorts: [product.count desc]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: satellite
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: true
    map_latitude: 37.57941251343841
    map_longitude: -99.31640625000001
    map_zoom: 4
    map_marker_radius_max: 100
    map_value_scale_clamp_max:
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 81
    col: 0
    width: 11
    height: 8
  - name: Inventory
    type: text
    title_text: Inventory
    body_text: ''
    row: 70
    col: 0
    width: 24
    height: 2
  - name: Product
    type: text
    title_text: Product
    body_text: ''
    row: 79
    col: 0
    width: 11
    height: 2
  - name: Storage
    type: text
    title_text: Storage
    body_text: ''
    row: 79
    col: 12
    width: 11
    height: 2
  - title: Temperature Impact On Stocks
    name: Temperature Impact On Stocks
    model: scl_canonical_demo
    explore: inventory
    type: looker_line
    fields: [location_weather.average_max_temparature, inventory.count, location_weather.weather_date,
      location.city]
    filters:
      inventory.inventory_date: 4 months
    sorts: [location_weather.weather_date desc]
    limit: 10
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: location_weather.average_max_temparature,
            id: location_weather.average_max_temparature, name: Average Max Temparature}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: inventory.count, id: inventory.count, name: Inventory}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_colors:
      location_weather.average_max_temparature: "#9d81e6"
      inventory.count: "#1F1142"
    reference_lines: [{reference_type: range, line_value: mean, range_end: '10', margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#588eff",
        range_start: '', label: Cold}, {reference_type: range, line_value: mean, range_end: '20',
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#f0c157", range_start: '10', label: Warm}, {reference_type: range,
        line_value: mean, range_end: '100', margin_top: deviation, margin_value: mean,
        margin_bottom: deviation, label_position: right, color: "#000000", range_start: '20',
        label: Hot}]
    defaults_version: 1
    hidden_fields: [location.city]
    listen: {}
    row: 81
    col: 12
    width: 12
    height: 8
  - title: Order Turn Around Health
    name: Order Turn Around Health
    model: scl_canonical_demo
    explore: order
    type: looker_column
    fields: [order.creation_date, order.status, order.order_count_action]
    pivots: [order.status]
    fill_fields: [order.creation_date]
    filters:
      location.location_name: Chicago IL
      order.creation_date: 2021/09/01 to 2021/10/27
      order.status: Complete,Shipped,Processing
    sorts: [order.creation_date desc, order.status]
    limit: 500
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
      Complete - order.order_count: "#80868B"
      Processing - order.order_count: "#EA4335"
      Shipped - order.order_count: "#1A73E8"
      Processing - order.order_count_action: "#F9AB00"
      Shipped - order.order_count_action: "#7CB342"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen: {}
    row: 52
    col: 0
    width: 24
    height: 6
  - title: 'Inventory Health: Aging Drill Down'
    name: 'Inventory Health: Aging Drill Down'
    model: scl_canonical_demo
    explore: inventory
    type: looker_scatter
    fields: [inventory.days_in_inventory_tier, inventory.number_on_hand]
    fill_fields: [inventory.days_in_inventory_tier]
    filters:
      inventory.inventory_type: ECOMM
    sorts: [inventory.days_in_inventory_tier]
    limit: 500
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    size_by_field: inventory.number_on_hand
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 58
    col: 0
    width: 24
    height: 6
  - title: 'Sales Health: Product Category Trends'
    name: 'Sales Health: Product Category Trends'
    model: scl_canonical_demo
    explore: order
    type: looker_area
    fields: [order.creation_date, order.count, product.product_hierarchy_level_1_name]
    pivots: [product.product_hierarchy_level_1_name]
    fill_fields: [order.creation_date]
    filters:
      order.creation_date: 2021/09/01 to 2021/10/30
      product.product_hierarchy_level_1_name: Blazers & Jackets,Sweaters,Pants,Shorts,Accessories,Fashion
        Hoodies & Sweatshirts
    sorts: [order.creation_date desc, product.product_hierarchy_level_1_name]
    limit: 500
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 64
    col: 0
    width: 24
    height: 6
  - title: Shipment And Order Details
    name: Shipment And Order Details
    model: scl_canonical_demo
    explore: order
    type: looker_grid
    fields: [shipment_identifier_view.identifier_type, shipment_identifier_view.identifier_value,
      shipment_identifier_view.shipment_id, route_segment_view.from_stop_id, shipment_event_view.route_segment_id,
      shipment_event_view.description, shipment_event_view.planned_utc_date, route_segment_view.to_stop_id,
      route_segment_identifier_view.identifier_type, route_segment_identifier_view.identifier_value,
      stop_view.stop_type, stop.stop_type, location_shipping.location, location_receiving.location,
      shipment_event_view.estimated_utc_date, order.order_id]
    filters:
      order.order_category: DELIVERY
    sorts: [shipment_event_view.planned_utc_date desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      "$$$_row_numbers_$$$": left
      stop.stop_number: left
      stop_view.stop_number: left
      order.order_id: left
    column_order: ["$$$_row_numbers_$$$", order.order_id_action, shipment_identifier_view.identifier_type,
      shipment_identifier_view.identifier_value, shipment_event_view.description,
      shipment_event_view.planned_utc_date, shipment_event_view.estimated_utc_date,
      route_segment_identifier_view.identifier_type, route_segment_identifier_view.identifier_value,
      stop_view.stop_type, stop.stop_type]
    show_totals: true
    show_row_totals: true
    series_text_format:
      order.order_id: {}
    defaults_version: 1
    hidden_fields: [shipment_identifier_view.shipment_id, route_segment_view.from_stop_id,
      shipment_event_view.route_segment_id, route_segment_view.to_stop_id, location_shipping.location,
      location_receiving.location]
    listen: {}
    row: 19
    col: 0
    width: 24
    height: 5
  - name: Order and Shipment Visibility
    type: text
    title_text: Order and Shipment Visibility
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Shipment Status
    name: Shipment Status
    model: scl_canonical_demo
    explore: order
    type: looker_map
    fields: [location_shipping.location, location_receiving.location, order.order_id,
      shipment_identifier_view.shipment_id, shipment_event_view.planned_utc_date,
      shipment_event_view.estimated_utc_date, shipment_identifier_view.identifier_value,
      route_segment_view.transportation_mode, stop_view.stop_type, stop_view.departed_utc_date,
      stop.stop_type, stop.departed_utc_date]
    filters:
      order.order_category: DELIVERY
      order.order_id: '10856338,10856854,10856201,10856158,10856176,10856695,10856772,10856184,10856701,10856732'
    sorts: [shipment_event_view.planned_utc_date desc]
    limit: 100
    map_plot_mode: lines
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 1
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: fixed
    map_marker_units: pixels
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 37.57941251343841
    map_longitude: -99.31640625000001
    map_zoom: 4
    map_marker_radius_fixed: 3
    map_marker_radius_max: 15
    map_marker_color: ["#4285F4", "#EA4335", "#FBBC04", "#34A853"]
    map_value_scale_clamp_min: 0
    map_value_scale_clamp_max: 200
    defaults_version: 1
    series_types: {}
    map: usa
    map_projection: ''
    quantize_colors: false
    hidden_fields: [shipment_identifier_view.shipment_id]
    listen: {}
    row: 11
    col: 0
    width: 24
    height: 8
  - title: Orders Risk Analysis
    name: Orders Risk Analysis
    model: scl_canonical_demo
    explore: storms_tsunami
    type: looker_grid
    fields: [order.order_category, location.location_name, order.order_type, order.requested_delivery_date,
      order.actual_delivery_date, order.open_quantity, storms_tsunami.event_id, storms_tsunami.event_type,
      storms_tsunami.state, storms_tsunami.event_begin_time_month, order.Sale_Price,
      order.order_id_action]
    filters:
      order.actual_delivery_month: after 2020/05/01
    sorts: [order.requested_delivery_date desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      order.Sale_Price:
        is_active: true
    series_value_format:
      order.Sale_Price:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    series_types: {}
    column_order: ["$$$_row_numbers_$$$", order.order_id_action, order.order_category,
      location.location_name, order.order_type, order.requested_delivery_date, order.actual_delivery_date,
      order.open_quantity, storms_tsunami.event_id, storms_tsunami.event_type, storms_tsunami.state,
      storms_tsunami.event_begin_time_month, order.Sale_Price]
    listen:
      Order Category: order.order_category
      Location Name: location.location_name
      State: storms_tsunami.state
    row: 32
    col: 0
    width: 24
    height: 5
  - title: Public Event SCM Risk
    name: Public Event SCM Risk
    model: scl_canonical_demo
    explore: storms_tsunami
    type: looker_map
    fields: [storms_tsunami.event_begin_time_date, location.location, storms_tsunami.state,
      storms_tsunami.event_id, order.Sale_Price, order.order_count, storms_tsunami.event_type]
    pivots: [storms_tsunami.event_type]
    sorts: [storms_tsunami.event_type desc, storms_tsunami.event_begin_time_date desc,
      storms_tsunami.state]
    limit: 500
    dynamic_fields: [{category: dimension, description: '', label: Event Type Groups,
        value_format: !!null '', value_format_name: !!null '', calculation_type: group_by,
        dimension: event_type_groups, args: [storms_tsunami.event_type, [!ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: hail, filter: '', __FILE: scl_demo/dashboards/SCL_Demo.dashboard.lookml,
              __LINE_NUM: 607}], !!null ''], _kind_hint: dimension, _type_hint: string}]
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: true
    heatmap_opacity: 0.3
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: metric
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle_and_icon
    map_marker_icon_name: bolt
    map_marker_radius_mode: equal_to_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: true
    reverse_map_value_colors: false
    map_marker_color: []
    map_value_colors: []
    series_types: {}
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    listen:
      Order Category: order.order_category
      Location Name: location.location_name
      State: storms_tsunami.state
    row: 37
    col: 0
    width: 24
    height: 13
  - name: Orders At Risk
    type: text
    title_text: Orders At Risk
    body_text: ''
    row: 24
    col: 0
    width: 24
    height: 2
  - title: Untitled (Copy 3)
    name: Untitled (Copy 3)
    model: scl_canonical_demo
    explore: storms_tsunami
    type: single_value
    fields: [order.Sale_Price]
    filters:
      order.order_category: DELIVERY
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
    single_value_title: Total Value Of Delivery Order
    value_format: "$ ###,###"
    defaults_version: 1
    listen: {}
    row: 26
    col: 18
    width: 6
    height: 3
  - title: Untitled (Copy 2)
    name: Untitled (Copy 2)
    model: scl_canonical_demo
    explore: storms_tsunami
    type: single_value
    fields: [order.Sale_Price]
    filters:
      order.order_category: SALESORDER
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
    single_value_title: Total Value Of Sales Order
    value_format: "$ ###,###"
    defaults_version: 1
    listen: {}
    row: 26
    col: 6
    width: 6
    height: 3
  - title: Untitled (Copy)
    name: Untitled (Copy)
    model: scl_canonical_demo
    explore: storms_tsunami
    type: single_value
    fields: [order.Order_id]
    filters:
      order.order_category: DELIVERY
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
    single_value_title: Number Of Delivery Order
    defaults_version: 1
    listen: {}
    row: 26
    col: 12
    width: 6
    height: 3
  - title: Untitled (Copy 0)
    name: Untitled (Copy 0)
    model: scl_canonical_demo
    explore: storms_tsunami
    type: single_value
    fields: [order.Order_id]
    filters:
      order.order_category: SALESORDER
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
    single_value_title: Number Of Sales Order
    defaults_version: 1
    listen: {}
    row: 26
    col: 0
    width: 6
    height: 3
  - title: Untitled (Copy 4)
    name: Untitled (Copy 4)
    model: scl_canonical_demo
    explore: storms_tsunami
    type: single_value
    fields: [order.Order_id]
    filters:
      order.order_category: PURCHASE
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
    single_value_title: Number Of Purchase Order
    defaults_version: 1
    listen: {}
    row: 29
    col: 0
    width: 6
    height: 3
  - title: Untitled (Copy 5)
    name: Untitled (Copy 5)
    model: scl_canonical_demo
    explore: storms_tsunami
    type: single_value
    fields: [order.Sale_Price]
    filters:
      order.order_category: PURCHASE
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
    single_value_title: Total Value Of Purchase Order
    value_format: "$ ###,###"
    defaults_version: 1
    listen: {}
    row: 29
    col: 6
    width: 6
    height: 3
  - title: Untitled
    name: Untitled
    model: scl_canonical_demo
    explore: storms_tsunami
    type: single_value
    fields: [inventory.count]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
    single_value_title: Number Of Inventory
    defaults_version: 1
    listen: {}
    row: 29
    col: 12
    width: 6
    height: 3
  - name: Analysis
    type: text
    title_text: Analysis
    body_text: ''
    row: 50
    col: 0
    width: 24
    height: 2
  - title: Total Inventory Value
    name: Total Inventory Value
    model: scl_canonical_demo
    explore: inventory
    type: single_value
    fields: [inventory.total_inventory_value]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
    value_format: "$ ###,###"
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 29
    col: 18
    width: 6
    height: 3
  - title: Untitled (Copy 8)
    name: Untitled (Copy 8)
    model: scl_canonical_demo
    explore: order
    type: single_value
    fields: [order.Sale_Price]
    filters:
      order.order_category: DELIVERY
      shipment_identifier_order.identifier_type: ORDER
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
    single_value_title: Total Value of Delivery  Order
    value_format: "$ ##,###"
    defaults_version: 1
    listen: {}
    row: 2
    col: 18
    width: 6
    height: 3
  - title: Untitled
    name: Untitled (2)
    model: scl_canonical_demo
    explore: order
    type: single_value
    fields: [order.count]
    filters:
      order.order_category: SALESORDER
      shipment_identifier_order.identifier_type: ORDER
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
    single_value_title: Open Sales Order
    value_format: ''
    defaults_version: 1
    listen: {}
    row: 2
    col: 0
    width: 6
    height: 3
  - title: Untitled (Copy 7)
    name: Untitled (Copy 7)
    model: scl_canonical_demo
    explore: order
    type: single_value
    fields: [order.count]
    filters:
      order.order_category: DELIVERY
      shipment_identifier_order.identifier_type: ORDER
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
    single_value_title: Open Delivery Order
    value_format: ''
    defaults_version: 1
    listen: {}
    row: 2
    col: 12
    width: 6
    height: 3
  - title: Untitled (Copy 6)
    name: Untitled (Copy 6)
    model: scl_canonical_demo
    explore: order
    type: single_value
    fields: [order.Sale_Price]
    filters:
      order.order_category: SALESORDER
      shipment_identifier_order.identifier_type: ORDER
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
    single_value_title: Total Value of Sales Order
    value_format: "$ ##,###"
    defaults_version: 1
    listen: {}
    row: 2
    col: 6
    width: 6
    height: 3
  - title: Untitled (Copy 9)
    name: Untitled (Copy 9)
    model: scl_canonical_demo
    explore: order
    type: single_value
    fields: [order.count]
    filters:
      order.order_category: PURCHASE
      shipment_identifier_order.identifier_type: ORDER
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
    single_value_title: Open Purchase  Order
    value_format: ''
    defaults_version: 1
    listen: {}
    row: 5
    col: 0
    width: 6
    height: 3
  - title: Untitled (Copy 10)
    name: Untitled (Copy 10)
    model: scl_canonical_demo
    explore: order
    type: single_value
    fields: [order.Sale_Price]
    filters:
      order.order_category: PURCHASE
      shipment_identifier_order.identifier_type: ORDER
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
    single_value_title: Total Value of Purchase   Order
    value_format: "$ ##,###"
    defaults_version: 1
    listen: {}
    row: 5
    col: 6
    width: 6
    height: 3
  - title: Untitled
    name: Untitled (3)
    model: scl_canonical_demo
    explore: order
    type: single_value
    fields: [order.order_count]
    filters:
      stop_view.stop_type: ORIGIN,TRANSFER
      stop.stop_type: DESTINATION
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#7CB342"
    single_value_title: Orders Delivered
    defaults_version: 1
    listen: {}
    row: 8
    col: 12
    width: 6
    height: 3
  - title: Untitled (Copy 11)
    name: Untitled (Copy 11)
    model: scl_canonical_demo
    explore: order
    type: single_value
    fields: [order.order_count]
    filters:
      stop_view.stop_type: TRANSFER
      stop.stop_type: TRANSFER
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
    single_value_title: Orders in Transit
    defaults_version: 1
    listen: {}
    row: 5
    col: 12
    width: 6
    height: 3
  - title: Untitled (Copy 12)
    name: Untitled (Copy 12)
    model: scl_canonical_demo
    explore: order
    type: single_value
    fields: [order.order_count]
    filters:
      stop_view.stop_type: UNKNOWN
      stop.stop_type: UNKNOWN
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#ffab86"
    single_value_title: Orders in Exception
    value_format: '9'
    defaults_version: 1
    listen: {}
    row: 8
    col: 0
    width: 6
    height: 3
  - title: Delayed Shipments
    name: Delayed Shipments
    model: scl_canonical_demo
    explore: order
    type: single_value
    fields: [shipment_event_view.Delayed]
    filters:
      shipment_event_view.delayed_shipment: "-NULL"
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#ff0906"
    single_value_title: Delayed Orders
    defaults_version: 1
    listen: {}
    row: 8
    col: 6
    width: 6
    height: 3
  - title: Untitled (Copy 13)
    name: Untitled (Copy 13)
    model: scl_canonical_demo
    explore: order
    type: single_value
    fields: [order.order_count]
    filters:
      stop_view.stop_type: ORIGIN
      stop.stop_type: ORIGIN
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
    single_value_title: Orders for Dispatch
    value_format: '13'
    defaults_version: 1
    listen: {}
    row: 5
    col: 18
    width: 6
    height: 3
  filters:
  - name: Order Category
    title: Order Category
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options: []
    model: scl_canonical_demo
    explore: storms_tsunami
    listens_to_filters: []
    field: order.order_category
  - name: Location Name
    title: Location Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: scl_canonical_demo
    explore: storms_tsunami
    listens_to_filters: []
    field: location.location_name
  - name: State
    title: State
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: popover
      options: []
    model: scl_canonical_demo
    explore: storms_tsunami
    listens_to_filters: []
    field: storms_tsunami.state
