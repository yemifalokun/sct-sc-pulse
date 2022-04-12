view: shipment_identifier_view{
  derived_table: {
    sql: SELECT DISTINCT * FROM `dev-cs-1.p44_datasets.shipment_identifier`
      WHERE IDENTIFIER_TYPE <> 'ORDER';;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension_group: dw_inserted_datetime {
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
    sql: ${TABLE}.DW_INSERTED_DATETIME ;;
  }

  dimension_group: dw_updated_datetime {
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
    sql: ${TABLE}.DW_UPDATED_DATETIME ;;
  }

  dimension: identifier_source {
    type: string
    sql: ${TABLE}.IDENTIFIER_SOURCE ;;
  }

  dimension: identifier_type {
    type: string
    sql: ${TABLE}.IDENTIFIER_TYPE ;;
  }

  dimension: identifier_value {
    label: "Airway/BOL"
    type: string
    sql: ${TABLE}.IDENTIFIER_VALUE ;;

    action: {
      label: "Notify through email"
      url: "https://hooks.zapier.com/hooks/catch/11814505/b5cqwxz/"

      form_param: {
        name: "Message"
        type: textarea
        default: "Hey could you check out Airway/BOL #{{value}}.
        Order ID :- {{order.order_id._value}}
        Shipment Identifier Type :- {{shipment_identifier_view.identifier_type._value}}
        Description :- {{shipment_event_view.description._value}}
        Planned (UTC) Date :- {{shipment_event_view.planned_utc_date._value}}
        Estimated (UTC) Date :- {{shipment_event_view.estimated_utc_date._value}}
        Route Identifier Type :- {{route_segment_identifier_view.identifier_type._value}}
        Route Identifier Value :- {{route_segment_identifier_view.identifier_value._value}}
        From Stop Type :- {{stop_view.stop_type._value}}
        To Stop Type :- {{stop.stop_type._value}}"
      }

      form_param: {
        name: "Recipient"
        type: textarea
        default: "{{order.route_id}} "
      }

    }
    action: {
      label: "Setup an urgent meeting"
      url: "https://hooks.zapier.com/hooks/catch/11814505/bryrebp/"

      form_param: {
        name: "Heading"
        type: string
        default: "Let's connect urgently for Airway/BOL #{{value}}."
      }

      form_param: {
        name: "Description"
        type: textarea
        default: "Details as below -
        Order ID :- {{order.order_id._value}}
        Shipment Identifier Type :- {{shipment_identifier_view.identifier_type._value}}
        Description :- {{shipment_event_view.description._value}}
        Planned (UTC) Date :- {{shipment_event_view.planned_utc_date._value}}
        Estimated (UTC) Date :- {{shipment_event_view.estimated_utc_date._value}}
        Route Identifier Type :- {{route_segment_identifier_view.identifier_type._value}}
        Route Identifier Value :- {{route_segment_identifier_view.identifier_value._value}}
        From Stop Type :- {{stop_view.stop_type._value}}
        To Stop Type :- {{stop.stop_type._value}}"
      }

      form_param: {
        name: "Start Date and Time (M/DD/YYYY, HH:MM Timezone)"
        type: string
        default: ""
      }

      form_param: {
        name: "End Date and Time (M/DD/YYYY, HH:MM Timezone)"
        type: string
        default: ""
      }

      form_param: {
        name: "Recipient"
        type: textarea
        default: "{{order.route_id}}"
      }
    }
  }

  dimension: shipment_id {
    type: string
    sql: ${TABLE}.SHIPMENT_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
