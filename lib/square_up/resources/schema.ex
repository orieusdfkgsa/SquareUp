defmodule SquareUp.Schema do
  import Norm

  @type wage_setting :: %{
          created_at: binary(),
          is_overtime_exempt: boolean(),
          job_assignments: [SquareUp.Schema.job_assignment()],
          team_member_id: binary(),
          updated_at: binary(),
          version: integer()
        }

  def wage_setting do
    schema(%{
      created_at: spec(is_binary()),
      is_overtime_exempt: spec(is_boolean()),
      job_assignments: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.job_assignment/0))),
      team_member_id: spec(is_binary()),
      updated_at: spec(is_binary()),
      version: spec(is_integer())
    })
    |> selection([])
  end

  @type retrieve_customer_response :: %{
          customer: SquareUp.Schema.customer(),
          errors: [SquareUp.Schema.error()]
        }

  def retrieve_customer_response do
    schema(%{
      customer: Norm.Delegate.delegate(&SquareUp.Schema.customer/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type create_location_request :: %{location: SquareUp.Schema.location()}

  def create_location_request do
    schema(%{location: Norm.Delegate.delegate(&SquareUp.Schema.location/0)})
    |> selection([])
  end

  @type v1_retrieve_employee_request :: %{}

  def v1_retrieve_employee_request do
    schema(%{})
    |> selection([])
  end

  @type retrieve_cash_drawer_shift_response :: %{
          cash_drawer_shift: SquareUp.Schema.cash_drawer_shift(),
          errors: [SquareUp.Schema.error()]
        }

  def retrieve_cash_drawer_shift_response do
    schema(%{
      cash_drawer_shift: Norm.Delegate.delegate(&SquareUp.Schema.cash_drawer_shift/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type shift_status :: binary()
  def shift_status do
    spec(is_binary())
  end

  @type redeem_loyalty_reward_request :: %{idempotency_key: binary(), location_id: binary()}

  def redeem_loyalty_reward_request do
    schema(%{idempotency_key: spec(is_binary()), location_id: spec(is_binary())})
    |> selection([:idempotency_key, :location_id])
  end

  @type order_fulfillment_pickup_details :: %{
          accepted_at: binary(),
          auto_complete_duration: binary(),
          cancel_reason: binary(),
          canceled_at: binary(),
          curbside_pickup_details:
            SquareUp.Schema.order_fulfillment_pickup_details_curbside_pickup_details(),
          expired_at: binary(),
          expires_at: binary(),
          is_curbside_pickup: boolean(),
          note: binary(),
          picked_up_at: binary(),
          pickup_at: binary(),
          pickup_window_duration: binary(),
          placed_at: binary(),
          prep_time_duration: binary(),
          ready_at: binary(),
          recipient: SquareUp.Schema.order_fulfillment_recipient(),
          rejected_at: binary(),
          schedule_type: binary()
        }

  def order_fulfillment_pickup_details do
    schema(%{
      accepted_at: spec(is_binary()),
      auto_complete_duration: spec(is_binary()),
      cancel_reason: spec(is_binary()),
      canceled_at: spec(is_binary()),
      curbside_pickup_details:
        Norm.Delegate.delegate(
          &SquareUp.Schema.order_fulfillment_pickup_details_curbside_pickup_details/0
        ),
      expired_at: spec(is_binary()),
      expires_at: spec(is_binary()),
      is_curbside_pickup: spec(is_boolean()),
      note: spec(is_binary()),
      picked_up_at: spec(is_binary()),
      pickup_at: spec(is_binary()),
      pickup_window_duration: spec(is_binary()),
      placed_at: spec(is_binary()),
      prep_time_duration: spec(is_binary()),
      ready_at: spec(is_binary()),
      recipient: Norm.Delegate.delegate(&SquareUp.Schema.order_fulfillment_recipient/0),
      rejected_at: spec(is_binary()),
      schedule_type: spec(is_binary())
    })
    |> selection([])
  end

  @type subscription_event_subscription_event_type :: binary()
  def subscription_event_subscription_event_type do
    spec(is_binary())
  end

  @type void_transaction_response :: %{errors: [SquareUp.Schema.error()]}

  def void_transaction_response do
    schema(%{errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))})
    |> selection([])
  end

  @type v1_settlement_entry :: %{
          amount_money: SquareUp.Schema.v1_money(),
          fee_money: SquareUp.Schema.v1_money(),
          payment_id: binary(),
          type: binary()
        }

  def v1_settlement_entry do
    schema(%{
      amount_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      fee_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      payment_id: spec(is_binary()),
      type: spec(is_binary())
    })
    |> selection([])
  end

  @type error_category :: binary()
  def error_category do
    spec(is_binary())
  end

  @type retrieve_wage_setting_response :: %{
          errors: [SquareUp.Schema.error()],
          wage_setting: SquareUp.Schema.wage_setting()
        }

  def retrieve_wage_setting_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      wage_setting: Norm.Delegate.delegate(&SquareUp.Schema.wage_setting/0)
    })
    |> selection([])
  end

  @type cancel_payment_response :: %{
          errors: [SquareUp.Schema.error()],
          payment: SquareUp.Schema.payment()
        }

  def cancel_payment_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      payment: Norm.Delegate.delegate(&SquareUp.Schema.payment/0)
    })
    |> selection([])
  end

  @type remove_dispute_evidence_request :: %{}

  def remove_dispute_evidence_request do
    schema(%{})
    |> selection([])
  end

  @type retrieve_dispute_response :: %{
          dispute: SquareUp.Schema.dispute(),
          errors: [SquareUp.Schema.error()]
        }

  def retrieve_dispute_response do
    schema(%{
      dispute: Norm.Delegate.delegate(&SquareUp.Schema.dispute/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type list_break_types_request :: %{cursor: binary(), limit: integer(), location_id: binary()}

  def list_break_types_request do
    schema(%{cursor: spec(is_binary()), limit: spec(is_integer()), location_id: spec(is_binary())})
    |> selection([])
  end

  @type update_order_response :: %{
          errors: [SquareUp.Schema.error()],
          order: SquareUp.Schema.order()
        }

  def update_order_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      order: Norm.Delegate.delegate(&SquareUp.Schema.order/0)
    })
    |> selection([])
  end

  @type bulk_update_team_members_request :: %{team_members: map()}

  def bulk_update_team_members_request do
    schema(%{team_members: schema(%{})})
    |> selection([:team_members])
  end

  @type create_customer_group_response :: %{
          errors: [SquareUp.Schema.error()],
          group: SquareUp.Schema.customer_group()
        }

  def create_customer_group_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      group: Norm.Delegate.delegate(&SquareUp.Schema.customer_group/0)
    })
    |> selection([])
  end

  @type money :: %{amount: integer(), currency: binary()}

  def money do
    schema(%{amount: spec(is_integer()), currency: spec(is_binary())})
    |> selection([])
  end

  @type get_team_member_wage_response :: %{
          errors: [SquareUp.Schema.error()],
          team_member_wage: SquareUp.Schema.team_member_wage()
        }

  def get_team_member_wage_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      team_member_wage: Norm.Delegate.delegate(&SquareUp.Schema.team_member_wage/0)
    })
    |> selection([])
  end

  @type v1_update_order_request :: %{
          action: binary(),
          canceled_note: binary(),
          completed_note: binary(),
          refunded_note: binary(),
          shipped_tracking_number: binary()
        }

  def v1_update_order_request do
    schema(%{
      action: spec(is_binary()),
      canceled_note: spec(is_binary()),
      completed_note: spec(is_binary()),
      refunded_note: spec(is_binary()),
      shipped_tracking_number: spec(is_binary())
    })
    |> selection([:action])
  end

  @type tender :: %{
          additional_recipients: [SquareUp.Schema.additional_recipient()],
          amount_money: SquareUp.Schema.money(),
          bank_transfer_details: SquareUp.Schema.tender_bank_transfer_details(),
          card_details: SquareUp.Schema.tender_card_details(),
          cash_details: SquareUp.Schema.tender_cash_details(),
          created_at: binary(),
          customer_id: binary(),
          id: binary(),
          location_id: binary(),
          note: binary(),
          payment_id: binary(),
          processing_fee_money: SquareUp.Schema.money(),
          tip_money: SquareUp.Schema.money(),
          transaction_id: binary(),
          type: binary()
        }

  def tender do
    schema(%{
      additional_recipients:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.additional_recipient/0))),
      amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      bank_transfer_details:
        Norm.Delegate.delegate(&SquareUp.Schema.tender_bank_transfer_details/0),
      card_details: Norm.Delegate.delegate(&SquareUp.Schema.tender_card_details/0),
      cash_details: Norm.Delegate.delegate(&SquareUp.Schema.tender_cash_details/0),
      created_at: spec(is_binary()),
      customer_id: spec(is_binary()),
      id: spec(is_binary()),
      location_id: spec(is_binary()),
      note: spec(is_binary()),
      payment_id: spec(is_binary()),
      processing_fee_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      tip_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      transaction_id: spec(is_binary()),
      type: spec(is_binary())
    })
    |> selection([:type])
  end

  @type v1_create_refund_request_type :: binary()
  def v1_create_refund_request_type do
    spec(is_binary())
  end

  @type catalog_query_range :: %{
          attribute_max_value: integer(),
          attribute_min_value: integer(),
          attribute_name: binary()
        }

  def catalog_query_range do
    schema(%{
      attribute_max_value: spec(is_integer()),
      attribute_min_value: spec(is_integer()),
      attribute_name: spec(is_binary())
    })
    |> selection([:attribute_name])
  end

  @type invoice_sort :: %{field: binary(), order: binary()}

  def invoice_sort do
    schema(%{field: spec(is_binary()), order: spec(is_binary())})
    |> selection([:field])
  end

  @type cancel_invoice_response :: %{
          errors: [SquareUp.Schema.error()],
          invoice: SquareUp.Schema.invoice()
        }

  def cancel_invoice_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      invoice: Norm.Delegate.delegate(&SquareUp.Schema.invoice/0)
    })
    |> selection([])
  end

  @type v1_list_categories_request :: %{}

  def v1_list_categories_request do
    schema(%{})
    |> selection([])
  end

  @type list_employee_wages_response :: %{
          cursor: binary(),
          employee_wages: [SquareUp.Schema.employee_wage()],
          errors: [SquareUp.Schema.error()]
        }

  def list_employee_wages_response do
    schema(%{
      cursor: spec(is_binary()),
      employee_wages: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.employee_wage/0))),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type order_line_item_discount :: %{
          amount_money: SquareUp.Schema.money(),
          applied_money: SquareUp.Schema.money(),
          catalog_object_id: binary(),
          metadata: map(),
          name: binary(),
          percentage: binary(),
          pricing_rule_id: binary(),
          reward_ids: [binary()],
          scope: binary(),
          type: binary(),
          uid: binary()
        }

  def order_line_item_discount do
    schema(%{
      amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      applied_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      catalog_object_id: spec(is_binary()),
      metadata: schema(%{}),
      name: spec(is_binary()),
      percentage: spec(is_binary()),
      pricing_rule_id: spec(is_binary()),
      reward_ids: spec(coll_of(spec(is_binary()))),
      scope: spec(is_binary()),
      type: spec(is_binary()),
      uid: spec(is_binary())
    })
    |> selection([])
  end

  @type delete_shift_response :: %{errors: [SquareUp.Schema.error()]}

  def delete_shift_response do
    schema(%{errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))})
    |> selection([])
  end

  @type catalog_pricing_type :: binary()
  def catalog_pricing_type do
    spec(is_binary())
  end

  @type create_order_request :: %{
          idempotency_key: binary(),
          location_id: binary(),
          order: SquareUp.Schema.order()
        }

  def create_order_request do
    schema(%{
      idempotency_key: spec(is_binary()),
      location_id: spec(is_binary()),
      order: Norm.Delegate.delegate(&SquareUp.Schema.order/0)
    })
    |> selection([])
  end

  @type v1_list_orders_request :: %{batch_token: binary(), limit: integer(), order: binary()}

  def v1_list_orders_request do
    schema(%{batch_token: spec(is_binary()), limit: spec(is_integer()), order: spec(is_binary())})
    |> selection([])
  end

  @type v1_list_settlements_response :: %{items: [SquareUp.Schema.v1_settlement()]}

  def v1_list_settlements_response do
    schema(%{items: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_settlement/0)))})
    |> selection([])
  end

  @type v1_update_page_request :: %{body: SquareUp.Schema.v1_page()}

  def v1_update_page_request do
    schema(%{body: Norm.Delegate.delegate(&SquareUp.Schema.v1_page/0)})
    |> selection([:body])
  end

  @type payment :: %{
          amount_money: SquareUp.Schema.money(),
          app_fee_money: SquareUp.Schema.money(),
          billing_address: SquareUp.Schema.address(),
          buyer_email_address: binary(),
          card_details: SquareUp.Schema.card_payment_details(),
          created_at: binary(),
          customer_id: binary(),
          delay_action: binary(),
          delay_duration: binary(),
          delayed_until: binary(),
          employee_id: binary(),
          id: binary(),
          location_id: binary(),
          note: binary(),
          order_id: binary(),
          processing_fee: [SquareUp.Schema.processing_fee()],
          receipt_number: binary(),
          receipt_url: binary(),
          reference_id: binary(),
          refund_ids: [binary()],
          refunded_money: SquareUp.Schema.money(),
          shipping_address: SquareUp.Schema.address(),
          source_type: binary(),
          statement_description_identifier: binary(),
          status: binary(),
          tip_money: SquareUp.Schema.money(),
          total_money: SquareUp.Schema.money(),
          updated_at: binary()
        }

  def payment do
    schema(%{
      amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      app_fee_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      billing_address: Norm.Delegate.delegate(&SquareUp.Schema.address/0),
      buyer_email_address: spec(is_binary()),
      card_details: Norm.Delegate.delegate(&SquareUp.Schema.card_payment_details/0),
      created_at: spec(is_binary()),
      customer_id: spec(is_binary()),
      delay_action: spec(is_binary()),
      delay_duration: spec(is_binary()),
      delayed_until: spec(is_binary()),
      employee_id: spec(is_binary()),
      id: spec(is_binary()),
      location_id: spec(is_binary()),
      note: spec(is_binary()),
      order_id: spec(is_binary()),
      processing_fee: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.processing_fee/0))),
      receipt_number: spec(is_binary()),
      receipt_url: spec(is_binary()),
      reference_id: spec(is_binary()),
      refund_ids: spec(coll_of(spec(is_binary()))),
      refunded_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      shipping_address: Norm.Delegate.delegate(&SquareUp.Schema.address/0),
      source_type: spec(is_binary()),
      statement_description_identifier: spec(is_binary()),
      status: spec(is_binary()),
      tip_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      total_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      updated_at: spec(is_binary())
    })
    |> selection([])
  end

  @type v1_cash_drawer_shift_event_type :: binary()
  def v1_cash_drawer_shift_event_type do
    spec(is_binary())
  end

  @type list_loyalty_programs_response :: %{
          errors: [SquareUp.Schema.error()],
          programs: [SquareUp.Schema.loyalty_program()]
        }

  def list_loyalty_programs_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      programs: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.loyalty_program/0)))
    })
    |> selection([])
  end

  @type v1_fee :: %{
          adjustment_type: binary(),
          applies_to_custom_amounts: boolean(),
          calculation_phase: binary(),
          enabled: boolean(),
          id: binary(),
          inclusion_type: binary(),
          name: binary(),
          rate: binary(),
          type: binary(),
          v2_id: binary()
        }

  def v1_fee do
    schema(%{
      adjustment_type: spec(is_binary()),
      applies_to_custom_amounts: spec(is_boolean()),
      calculation_phase: spec(is_binary()),
      enabled: spec(is_boolean()),
      id: spec(is_binary()),
      inclusion_type: spec(is_binary()),
      name: spec(is_binary()),
      rate: spec(is_binary()),
      type: spec(is_binary()),
      v2_id: spec(is_binary())
    })
    |> selection([])
  end

  @type v1_list_items_response :: %{items: [SquareUp.Schema.v1_item()]}

  def v1_list_items_response do
    schema(%{items: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_item/0)))})
    |> selection([])
  end

  @type tender_cash_details :: %{
          buyer_tendered_money: SquareUp.Schema.money(),
          change_back_money: SquareUp.Schema.money()
        }

  def tender_cash_details do
    schema(%{
      buyer_tendered_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      change_back_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0)
    })
    |> selection([])
  end

  @type v1_payment_itemization :: %{
          discount_money: SquareUp.Schema.v1_money(),
          discounts: [SquareUp.Schema.v1_payment_discount()],
          gross_sales_money: SquareUp.Schema.v1_money(),
          item_detail: SquareUp.Schema.v1_payment_item_detail(),
          item_variation_name: binary(),
          itemization_type: binary(),
          modifiers: [SquareUp.Schema.v1_payment_modifier()],
          name: binary(),
          net_sales_money: SquareUp.Schema.v1_money(),
          notes: binary(),
          quantity: number(),
          single_quantity_money: SquareUp.Schema.v1_money(),
          taxes: [SquareUp.Schema.v1_payment_tax()],
          total_money: SquareUp.Schema.v1_money()
        }

  def v1_payment_itemization do
    schema(%{
      discount_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      discounts: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_payment_discount/0))),
      gross_sales_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      item_detail: Norm.Delegate.delegate(&SquareUp.Schema.v1_payment_item_detail/0),
      item_variation_name: spec(is_binary()),
      itemization_type: spec(is_binary()),
      modifiers: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_payment_modifier/0))),
      name: spec(is_binary()),
      net_sales_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      notes: spec(is_binary()),
      quantity: spec(is_number()),
      single_quantity_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      taxes: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_payment_tax/0))),
      total_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0)
    })
    |> selection([])
  end

  @type publish_invoice_response :: %{
          errors: [SquareUp.Schema.error()],
          invoice: SquareUp.Schema.invoice()
        }

  def publish_invoice_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      invoice: Norm.Delegate.delegate(&SquareUp.Schema.invoice/0)
    })
    |> selection([])
  end

  @type employee_wage :: %{
          employee_id: binary(),
          hourly_rate: SquareUp.Schema.money(),
          id: binary(),
          title: binary()
        }

  def employee_wage do
    schema(%{
      employee_id: spec(is_binary()),
      hourly_rate: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      id: spec(is_binary()),
      title: spec(is_binary())
    })
    |> selection([])
  end

  @type update_shift_response :: %{
          errors: [SquareUp.Schema.error()],
          shift: SquareUp.Schema.shift()
        }

  def update_shift_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      shift: Norm.Delegate.delegate(&SquareUp.Schema.shift/0)
    })
    |> selection([])
  end

  @type catalog_modifier_list :: %{
          modifiers: [SquareUp.Schema.catalog_object()],
          name: binary(),
          ordinal: integer(),
          selection_type: binary()
        }

  def catalog_modifier_list do
    schema(%{
      modifiers: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.catalog_object/0))),
      name: spec(is_binary()),
      ordinal: spec(is_integer()),
      selection_type: spec(is_binary())
    })
    |> selection([])
  end

  @type v1_inventory_entry :: %{quantity_on_hand: number(), variation_id: binary()}

  def v1_inventory_entry do
    schema(%{quantity_on_hand: spec(is_number()), variation_id: spec(is_binary())})
    |> selection([])
  end

  @type v1_retrieve_cash_drawer_shift_request :: %{}

  def v1_retrieve_cash_drawer_shift_request do
    schema(%{})
    |> selection([])
  end

  @type v1_tender_entry_method :: binary()
  def v1_tender_entry_method do
    spec(is_binary())
  end

  @type update_item_modifier_lists_response :: %{
          errors: [SquareUp.Schema.error()],
          updated_at: binary()
        }

  def update_item_modifier_lists_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      updated_at: spec(is_binary())
    })
    |> selection([])
  end

  @type get_shift_request :: %{}

  def get_shift_request do
    schema(%{})
    |> selection([])
  end

  @type list_disputes_request :: %{cursor: binary(), location_id: binary(), states: [binary()]}

  def list_disputes_request do
    schema(%{
      cursor: spec(is_binary()),
      location_id: spec(is_binary()),
      states: spec(coll_of(spec(is_binary())))
    })
    |> selection([])
  end

  @type add_group_to_customer_request :: %{}

  def add_group_to_customer_request do
    schema(%{})
    |> selection([])
  end

  @type loyalty_event_redeem_reward :: %{
          loyalty_program_id: binary(),
          order_id: binary(),
          reward_id: binary()
        }

  def loyalty_event_redeem_reward do
    schema(%{
      loyalty_program_id: spec(is_binary()),
      order_id: spec(is_binary()),
      reward_id: spec(is_binary())
    })
    |> selection([:loyalty_program_id])
  end

  @type v1_list_payments_response :: %{items: [SquareUp.Schema.v1_payment()]}

  def v1_list_payments_response do
    schema(%{items: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_payment/0)))})
    |> selection([])
  end

  @type refund_payment_response :: %{
          errors: [SquareUp.Schema.error()],
          refund: SquareUp.Schema.payment_refund()
        }

  def refund_payment_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      refund: Norm.Delegate.delegate(&SquareUp.Schema.payment_refund/0)
    })
    |> selection([])
  end

  @type v1_delete_modifier_option_request :: %{}

  def v1_delete_modifier_option_request do
    schema(%{})
    |> selection([])
  end

  @type v1_list_employees_request :: %{
          batch_token: binary(),
          begin_created_at: binary(),
          begin_updated_at: binary(),
          end_created_at: binary(),
          end_updated_at: binary(),
          external_id: binary(),
          limit: integer(),
          order: binary(),
          status: binary()
        }

  def v1_list_employees_request do
    schema(%{
      batch_token: spec(is_binary()),
      begin_created_at: spec(is_binary()),
      begin_updated_at: spec(is_binary()),
      end_created_at: spec(is_binary()),
      end_updated_at: spec(is_binary()),
      external_id: spec(is_binary()),
      limit: spec(is_integer()),
      order: spec(is_binary()),
      status: spec(is_binary())
    })
    |> selection([])
  end

  @type cash_drawer_device :: %{id: binary(), name: binary()}

  def cash_drawer_device do
    schema(%{id: spec(is_binary()), name: spec(is_binary())})
    |> selection([])
  end

  @type search_loyalty_rewards_response :: %{
          cursor: binary(),
          errors: [SquareUp.Schema.error()],
          rewards: [SquareUp.Schema.loyalty_reward()]
        }

  def search_loyalty_rewards_response do
    schema(%{
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      rewards: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.loyalty_reward/0)))
    })
    |> selection([])
  end

  @type customer_query :: %{
          filter: SquareUp.Schema.customer_filter(),
          sort: SquareUp.Schema.customer_sort()
        }

  def customer_query do
    schema(%{
      filter: Norm.Delegate.delegate(&SquareUp.Schema.customer_filter/0),
      sort: Norm.Delegate.delegate(&SquareUp.Schema.customer_sort/0)
    })
    |> selection([])
  end

  @type measurement_unit_generic :: binary()
  def measurement_unit_generic do
    spec(is_binary())
  end

  @type create_payment_response :: %{
          errors: [SquareUp.Schema.error()],
          payment: SquareUp.Schema.payment()
        }

  def create_payment_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      payment: Norm.Delegate.delegate(&SquareUp.Schema.payment/0)
    })
    |> selection([])
  end

  @type loyalty_reward :: %{
          created_at: binary(),
          id: binary(),
          loyalty_account_id: binary(),
          order_id: binary(),
          points: integer(),
          redeemed_at: binary(),
          reward_tier_id: binary(),
          status: binary(),
          updated_at: binary()
        }

  def loyalty_reward do
    schema(%{
      created_at: spec(is_binary()),
      id: spec(is_binary()),
      loyalty_account_id: spec(is_binary()),
      order_id: spec(is_binary()),
      points: spec(is_integer()),
      redeemed_at: spec(is_binary()),
      reward_tier_id: spec(is_binary()),
      status: spec(is_binary()),
      updated_at: spec(is_binary())
    })
    |> selection([:loyalty_account_id, :reward_tier_id])
  end

  @type inventory_transfer :: %{
          catalog_object_id: binary(),
          catalog_object_type: binary(),
          created_at: binary(),
          employee_id: binary(),
          from_location_id: binary(),
          id: binary(),
          occurred_at: binary(),
          quantity: binary(),
          reference_id: binary(),
          source: SquareUp.Schema.source_application(),
          state: binary(),
          to_location_id: binary()
        }

  def inventory_transfer do
    schema(%{
      catalog_object_id: spec(is_binary()),
      catalog_object_type: spec(is_binary()),
      created_at: spec(is_binary()),
      employee_id: spec(is_binary()),
      from_location_id: spec(is_binary()),
      id: spec(is_binary()),
      occurred_at: spec(is_binary()),
      quantity: spec(is_binary()),
      reference_id: spec(is_binary()),
      source: Norm.Delegate.delegate(&SquareUp.Schema.source_application/0),
      state: spec(is_binary()),
      to_location_id: spec(is_binary())
    })
    |> selection([])
  end

  @type batch_retrieve_catalog_objects_response :: %{
          errors: [SquareUp.Schema.error()],
          objects: [SquareUp.Schema.catalog_object()],
          related_objects: [SquareUp.Schema.catalog_object()]
        }

  def batch_retrieve_catalog_objects_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      objects: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.catalog_object/0))),
      related_objects: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.catalog_object/0)))
    })
    |> selection([])
  end

  @type refund :: %{
          additional_recipients: [SquareUp.Schema.additional_recipient()],
          amount_money: SquareUp.Schema.money(),
          created_at: binary(),
          id: binary(),
          location_id: binary(),
          processing_fee_money: SquareUp.Schema.money(),
          reason: binary(),
          status: binary(),
          tender_id: binary(),
          transaction_id: binary()
        }

  def refund do
    schema(%{
      additional_recipients:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.additional_recipient/0))),
      amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      created_at: spec(is_binary()),
      id: spec(is_binary()),
      location_id: spec(is_binary()),
      processing_fee_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      reason: spec(is_binary()),
      status: spec(is_binary()),
      tender_id: spec(is_binary()),
      transaction_id: spec(is_binary())
    })
    |> selection([:id, :location_id, :transaction_id, :tender_id, :reason, :amount_money, :status])
  end

  @type v1_retrieve_employee_role_request :: %{}

  def v1_retrieve_employee_role_request do
    schema(%{})
    |> selection([])
  end

  @type revoke_token_request :: %{
          access_token: binary(),
          client_id: binary(),
          merchant_id: binary(),
          revoke_only_access_token: boolean()
        }

  def revoke_token_request do
    schema(%{
      access_token: spec(is_binary()),
      client_id: spec(is_binary()),
      merchant_id: spec(is_binary()),
      revoke_only_access_token: spec(is_boolean())
    })
    |> selection([])
  end

  @type list_subscription_events_request :: %{cursor: binary(), limit: integer()}

  def list_subscription_events_request do
    schema(%{cursor: spec(is_binary()), limit: spec(is_integer())})
    |> selection([])
  end

  @type invoice_recipient :: %{
          address: SquareUp.Schema.address(),
          company_name: binary(),
          customer_id: binary(),
          email_address: binary(),
          family_name: binary(),
          given_name: binary(),
          phone_number: binary()
        }

  def invoice_recipient do
    schema(%{
      address: Norm.Delegate.delegate(&SquareUp.Schema.address/0),
      company_name: spec(is_binary()),
      customer_id: spec(is_binary()),
      email_address: spec(is_binary()),
      family_name: spec(is_binary()),
      given_name: spec(is_binary()),
      phone_number: spec(is_binary())
    })
    |> selection([])
  end

  @type retrieve_subscription_request :: %{}

  def retrieve_subscription_request do
    schema(%{})
    |> selection([])
  end

  @type calculate_loyalty_points_response :: %{
          errors: [SquareUp.Schema.error()],
          points: integer()
        }

  def calculate_loyalty_points_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      points: spec(is_integer())
    })
    |> selection([])
  end

  @type v1_bank_account :: %{
          account_number_suffix: binary(),
          bank_name: binary(),
          currency_code: binary(),
          id: binary(),
          merchant_id: binary(),
          name: binary(),
          routing_number: binary(),
          type: binary()
        }

  def v1_bank_account do
    schema(%{
      account_number_suffix: spec(is_binary()),
      bank_name: spec(is_binary()),
      currency_code: spec(is_binary()),
      id: spec(is_binary()),
      merchant_id: spec(is_binary()),
      name: spec(is_binary()),
      routing_number: spec(is_binary()),
      type: spec(is_binary())
    })
    |> selection([])
  end

  @type order_line_item_applied_discount :: %{
          applied_money: SquareUp.Schema.money(),
          discount_uid: binary(),
          uid: binary()
        }

  def order_line_item_applied_discount do
    schema(%{
      applied_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      discount_uid: spec(is_binary()),
      uid: spec(is_binary())
    })
    |> selection([:discount_uid])
  end

  @type register_domain_response :: %{errors: [SquareUp.Schema.error()], status: binary()}

  def register_domain_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      status: spec(is_binary())
    })
    |> selection([])
  end

  @type bank_account :: %{
          account_number_suffix: binary(),
          account_type: binary(),
          bank_name: binary(),
          country: binary(),
          creditable: boolean(),
          currency: binary(),
          debit_mandate_reference_id: binary(),
          debitable: boolean(),
          fingerprint: binary(),
          holder_name: binary(),
          id: binary(),
          location_id: binary(),
          primary_bank_identification_number: binary(),
          reference_id: binary(),
          secondary_bank_identification_number: binary(),
          status: binary(),
          version: integer()
        }

  def bank_account do
    schema(%{
      account_number_suffix: spec(is_binary()),
      account_type: spec(is_binary()),
      bank_name: spec(is_binary()),
      country: spec(is_binary()),
      creditable: spec(is_boolean()),
      currency: spec(is_binary()),
      debit_mandate_reference_id: spec(is_binary()),
      debitable: spec(is_boolean()),
      fingerprint: spec(is_binary()),
      holder_name: spec(is_binary()),
      id: spec(is_binary()),
      location_id: spec(is_binary()),
      primary_bank_identification_number: spec(is_binary()),
      reference_id: spec(is_binary()),
      secondary_bank_identification_number: spec(is_binary()),
      status: spec(is_binary()),
      version: spec(is_integer())
    })
    |> selection([
      :id,
      :account_number_suffix,
      :country,
      :currency,
      :account_type,
      :holder_name,
      :primary_bank_identification_number,
      :status,
      :creditable,
      :debitable
    ])
  end

  @type list_catalog_request :: %{cursor: binary(), types: binary()}

  def list_catalog_request do
    schema(%{cursor: spec(is_binary()), types: spec(is_binary())})
    |> selection([])
  end

  @type update_customer_group_request :: %{group: SquareUp.Schema.customer_group()}

  def update_customer_group_request do
    schema(%{group: Norm.Delegate.delegate(&SquareUp.Schema.customer_group/0)})
    |> selection([:group])
  end

  @type delete_customer_card_request :: %{}

  def delete_customer_card_request do
    schema(%{})
    |> selection([])
  end

  @type accumulate_loyalty_points_request :: %{
          accumulate_points: SquareUp.Schema.loyalty_event_accumulate_points(),
          idempotency_key: binary(),
          location_id: binary()
        }

  def accumulate_loyalty_points_request do
    schema(%{
      accumulate_points:
        Norm.Delegate.delegate(&SquareUp.Schema.loyalty_event_accumulate_points/0),
      idempotency_key: spec(is_binary()),
      location_id: spec(is_binary())
    })
    |> selection([:accumulate_points, :idempotency_key, :location_id])
  end

  @type create_customer_response :: %{
          customer: SquareUp.Schema.customer(),
          errors: [SquareUp.Schema.error()]
        }

  def create_customer_response do
    schema(%{
      customer: Norm.Delegate.delegate(&SquareUp.Schema.customer/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type batch_retrieve_inventory_counts_response :: %{
          counts: [SquareUp.Schema.inventory_count()],
          cursor: binary(),
          errors: [SquareUp.Schema.error()]
        }

  def batch_retrieve_inventory_counts_response do
    schema(%{
      counts: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.inventory_count/0))),
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type retrieve_location_response :: %{
          errors: [SquareUp.Schema.error()],
          location: SquareUp.Schema.location()
        }

  def retrieve_location_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      location: Norm.Delegate.delegate(&SquareUp.Schema.location/0)
    })
    |> selection([])
  end

  @type list_payments_response :: %{
          cursor: binary(),
          errors: [SquareUp.Schema.error()],
          payments: [SquareUp.Schema.payment()]
        }

  def list_payments_response do
    schema(%{
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      payments: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.payment/0)))
    })
    |> selection([])
  end

  @type search_orders_state_filter :: %{states: [binary()]}

  def search_orders_state_filter do
    schema(%{states: spec(coll_of(spec(is_binary())))})
    |> selection([:states])
  end

  @type accumulate_loyalty_points_response :: %{
          errors: [SquareUp.Schema.error()],
          event: SquareUp.Schema.loyalty_event()
        }

  def accumulate_loyalty_points_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      event: Norm.Delegate.delegate(&SquareUp.Schema.loyalty_event/0)
    })
    |> selection([])
  end

  @type create_shift_request :: %{idempotency_key: binary(), shift: SquareUp.Schema.shift()}

  def create_shift_request do
    schema(%{
      idempotency_key: spec(is_binary()),
      shift: Norm.Delegate.delegate(&SquareUp.Schema.shift/0)
    })
    |> selection([:shift])
  end

  @type update_customer_group_response :: %{
          errors: [SquareUp.Schema.error()],
          group: SquareUp.Schema.customer_group()
        }

  def update_customer_group_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      group: Norm.Delegate.delegate(&SquareUp.Schema.customer_group/0)
    })
    |> selection([])
  end

  @type list_break_types_response :: %{
          break_types: [SquareUp.Schema.break_type()],
          cursor: binary(),
          errors: [SquareUp.Schema.error()]
        }

  def list_break_types_response do
    schema(%{
      break_types: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.break_type/0))),
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type batch_retrieve_orders_response :: %{
          errors: [SquareUp.Schema.error()],
          orders: [SquareUp.Schema.order()]
        }

  def batch_retrieve_orders_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      orders: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.order/0)))
    })
    |> selection([])
  end

  @type list_transactions_response :: %{
          cursor: binary(),
          errors: [SquareUp.Schema.error()],
          transactions: [SquareUp.Schema.transaction()]
        }

  def list_transactions_response do
    schema(%{
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      transactions: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.transaction/0)))
    })
    |> selection([])
  end

  @type catalog_custom_attribute_value :: %{
          boolean_value: boolean(),
          custom_attribute_definition_id: binary(),
          key: binary(),
          name: binary(),
          number_value: binary(),
          selection_uid_values: [binary()],
          string_value: binary(),
          type: binary()
        }

  def catalog_custom_attribute_value do
    schema(%{
      boolean_value: spec(is_boolean()),
      custom_attribute_definition_id: spec(is_binary()),
      key: spec(is_binary()),
      name: spec(is_binary()),
      number_value: spec(is_binary()),
      selection_uid_values: spec(coll_of(spec(is_binary()))),
      string_value: spec(is_binary()),
      type: spec(is_binary())
    })
    |> selection([])
  end

  @type tip_settings :: %{
          allow_tipping: boolean(),
          custom_tip_field: boolean(),
          separate_tip_screen: boolean()
        }

  def tip_settings do
    schema(%{
      allow_tipping: spec(is_boolean()),
      custom_tip_field: spec(is_boolean()),
      separate_tip_screen: spec(is_boolean())
    })
    |> selection([])
  end

  @type get_bank_account_request :: %{}

  def get_bank_account_request do
    schema(%{})
    |> selection([])
  end

  @type add_group_to_customer_response :: %{errors: [SquareUp.Schema.error()]}

  def add_group_to_customer_response do
    schema(%{errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))})
    |> selection([])
  end

  @type retrieve_employee_request :: %{}

  def retrieve_employee_request do
    schema(%{})
    |> selection([])
  end

  @type list_cash_drawer_shifts_request :: %{
          begin_time: binary(),
          cursor: binary(),
          end_time: binary(),
          limit: integer(),
          location_id: binary(),
          sort_order: binary()
        }

  def list_cash_drawer_shifts_request do
    schema(%{
      begin_time: spec(is_binary()),
      cursor: spec(is_binary()),
      end_time: spec(is_binary()),
      limit: spec(is_integer()),
      location_id: spec(is_binary()),
      sort_order: spec(is_binary())
    })
    |> selection([:location_id])
  end

  @type search_shifts_request :: %{
          cursor: binary(),
          limit: integer(),
          query: SquareUp.Schema.shift_query()
        }

  def search_shifts_request do
    schema(%{
      cursor: spec(is_binary()),
      limit: spec(is_integer()),
      query: Norm.Delegate.delegate(&SquareUp.Schema.shift_query/0)
    })
    |> selection([])
  end

  @type batch_change_inventory_request :: %{
          changes: [SquareUp.Schema.inventory_change()],
          idempotency_key: binary(),
          ignore_unchanged_counts: boolean()
        }

  def batch_change_inventory_request do
    schema(%{
      changes: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.inventory_change/0))),
      idempotency_key: spec(is_binary()),
      ignore_unchanged_counts: spec(is_boolean())
    })
    |> selection([])
  end

  @type location_type :: binary()
  def location_type do
    spec(is_binary())
  end

  @type exclude_strategy :: binary()
  def exclude_strategy do
    spec(is_binary())
  end

  @type additional_recipient :: %{
          amount_money: SquareUp.Schema.money(),
          description: binary(),
          location_id: binary(),
          receivable_id: binary()
        }

  def additional_recipient do
    schema(%{
      amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      description: spec(is_binary()),
      location_id: spec(is_binary()),
      receivable_id: spec(is_binary())
    })
    |> selection([:location_id, :description, :amount_money])
  end

  @type v1_payment_itemization_itemization_type :: binary()
  def v1_payment_itemization_itemization_type do
    spec(is_binary())
  end

  @type adjust_loyalty_points_request :: %{
          adjust_points: SquareUp.Schema.loyalty_event_adjust_points(),
          idempotency_key: binary()
        }

  def adjust_loyalty_points_request do
    schema(%{
      adjust_points: Norm.Delegate.delegate(&SquareUp.Schema.loyalty_event_adjust_points/0),
      idempotency_key: spec(is_binary())
    })
    |> selection([:idempotency_key, :adjust_points])
  end

  @type loyalty_event_type_filter :: %{types: [binary()]}

  def loyalty_event_type_filter do
    schema(%{types: spec(coll_of(spec(is_binary())))})
    |> selection([:types])
  end

  @type search_orders_date_time_filter :: %{
          closed_at: SquareUp.Schema.time_range(),
          created_at: SquareUp.Schema.time_range(),
          updated_at: SquareUp.Schema.time_range()
        }

  def search_orders_date_time_filter do
    schema(%{
      closed_at: Norm.Delegate.delegate(&SquareUp.Schema.time_range/0),
      created_at: Norm.Delegate.delegate(&SquareUp.Schema.time_range/0),
      updated_at: Norm.Delegate.delegate(&SquareUp.Schema.time_range/0)
    })
    |> selection([])
  end

  @type cancel_invoice_request :: %{version: integer()}

  def cancel_invoice_request do
    schema(%{version: spec(is_integer())})
    |> selection([:version])
  end

  @type v1_merchant_business_type :: binary()
  def v1_merchant_business_type do
    spec(is_binary())
  end

  @type calculate_loyalty_points_request :: %{
          order_id: binary(),
          transaction_amount_money: SquareUp.Schema.money()
        }

  def calculate_loyalty_points_request do
    schema(%{
      order_id: spec(is_binary()),
      transaction_amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0)
    })
    |> selection([])
  end

  @type processing_fee :: %{
          amount_money: SquareUp.Schema.money(),
          effective_at: binary(),
          type: binary()
        }

  def processing_fee do
    schema(%{
      amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      effective_at: spec(is_binary()),
      type: spec(is_binary())
    })
    |> selection([])
  end

  @type create_customer_card_request :: %{
          billing_address: SquareUp.Schema.address(),
          card_nonce: binary(),
          cardholder_name: binary(),
          verification_token: binary()
        }

  def create_customer_card_request do
    schema(%{
      billing_address: Norm.Delegate.delegate(&SquareUp.Schema.address/0),
      card_nonce: spec(is_binary()),
      cardholder_name: spec(is_binary()),
      verification_token: spec(is_binary())
    })
    |> selection([:card_nonce])
  end

  @type filter_value :: %{all: [binary()], any: [binary()], none: [binary()]}

  def filter_value do
    schema(%{
      all: spec(coll_of(spec(is_binary()))),
      any: spec(coll_of(spec(is_binary()))),
      none: spec(coll_of(spec(is_binary())))
    })
    |> selection([])
  end

  @type retrieve_inventory_count_response :: %{
          counts: [SquareUp.Schema.inventory_count()],
          cursor: binary(),
          errors: [SquareUp.Schema.error()]
        }

  def retrieve_inventory_count_response do
    schema(%{
      counts: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.inventory_count/0))),
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type dispute_evidence_file :: %{filename: binary(), filetype: binary()}

  def dispute_evidence_file do
    schema(%{filename: spec(is_binary()), filetype: spec(is_binary())})
    |> selection([])
  end

  @type loyalty_event_create_reward :: %{
          loyalty_program_id: binary(),
          points: integer(),
          reward_id: binary()
        }

  def loyalty_event_create_reward do
    schema(%{
      loyalty_program_id: spec(is_binary()),
      points: spec(is_integer()),
      reward_id: spec(is_binary())
    })
    |> selection([:loyalty_program_id, :points])
  end

  @type inventory_alert_type :: binary()
  def inventory_alert_type do
    spec(is_binary())
  end

  @type v1_payment_surcharge :: %{
          amount_money: SquareUp.Schema.v1_money(),
          applied_money: SquareUp.Schema.v1_money(),
          name: binary(),
          rate: binary(),
          surcharge_id: binary(),
          taxable: boolean(),
          taxes: [SquareUp.Schema.v1_payment_tax()],
          type: binary()
        }

  def v1_payment_surcharge do
    schema(%{
      amount_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      applied_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      name: spec(is_binary()),
      rate: spec(is_binary()),
      surcharge_id: spec(is_binary()),
      taxable: spec(is_boolean()),
      taxes: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_payment_tax/0))),
      type: spec(is_binary())
    })
    |> selection([])
  end

  @type v1_discount_discount_type :: binary()
  def v1_discount_discount_type do
    spec(is_binary())
  end

  @type loyalty_event_source :: binary()
  def loyalty_event_source do
    spec(is_binary())
  end

  @type catalog_quick_amounts_settings :: %{
          amounts: [SquareUp.Schema.catalog_quick_amount()],
          eligible_for_auto_amounts: boolean(),
          option: binary()
        }

  def catalog_quick_amounts_settings do
    schema(%{
      amounts: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.catalog_quick_amount/0))),
      eligible_for_auto_amounts: spec(is_boolean()),
      option: spec(is_binary())
    })
    |> selection([:option])
  end

  @type get_terminal_checkout_response :: %{
          checkout: SquareUp.Schema.terminal_checkout(),
          errors: [SquareUp.Schema.error()]
        }

  def get_terminal_checkout_response do
    schema(%{
      checkout: Norm.Delegate.delegate(&SquareUp.Schema.terminal_checkout/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type item_variation_location_overrides :: %{
          inventory_alert_threshold: integer(),
          inventory_alert_type: binary(),
          location_id: binary(),
          price_money: SquareUp.Schema.money(),
          pricing_type: binary(),
          track_inventory: boolean()
        }

  def item_variation_location_overrides do
    schema(%{
      inventory_alert_threshold: spec(is_integer()),
      inventory_alert_type: spec(is_binary()),
      location_id: spec(is_binary()),
      price_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      pricing_type: spec(is_binary()),
      track_inventory: spec(is_boolean())
    })
    |> selection([])
  end

  @type terminal_checkout :: %{
          amount_money: SquareUp.Schema.money(),
          cancel_reason: binary(),
          created_at: binary(),
          deadline_duration: binary(),
          device_options: SquareUp.Schema.device_checkout_options(),
          id: binary(),
          note: binary(),
          payment_ids: [binary()],
          reference_id: binary(),
          status: binary(),
          updated_at: binary()
        }

  def terminal_checkout do
    schema(%{
      amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      cancel_reason: spec(is_binary()),
      created_at: spec(is_binary()),
      deadline_duration: spec(is_binary()),
      device_options: Norm.Delegate.delegate(&SquareUp.Schema.device_checkout_options/0),
      id: spec(is_binary()),
      note: spec(is_binary()),
      payment_ids: spec(coll_of(spec(is_binary()))),
      reference_id: spec(is_binary()),
      status: spec(is_binary()),
      updated_at: spec(is_binary())
    })
    |> selection([:amount_money, :device_options])
  end

  @type bulk_update_team_members_response :: %{
          errors: [SquareUp.Schema.error()],
          team_members: map()
        }

  def bulk_update_team_members_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      team_members: schema(%{})
    })
    |> selection([])
  end

  @type loyalty_program :: %{
          accrual_rules: [SquareUp.Schema.loyalty_program_accrual_rule()],
          created_at: binary(),
          expiration_policy: SquareUp.Schema.loyalty_program_expiration_policy(),
          id: binary(),
          location_ids: [binary()],
          reward_tiers: [SquareUp.Schema.loyalty_program_reward_tier()],
          status: binary(),
          terminology: SquareUp.Schema.loyalty_program_terminology(),
          updated_at: binary()
        }

  def loyalty_program do
    schema(%{
      accrual_rules:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.loyalty_program_accrual_rule/0))),
      created_at: spec(is_binary()),
      expiration_policy:
        Norm.Delegate.delegate(&SquareUp.Schema.loyalty_program_expiration_policy/0),
      id: spec(is_binary()),
      location_ids: spec(coll_of(spec(is_binary()))),
      reward_tiers:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.loyalty_program_reward_tier/0))),
      status: spec(is_binary()),
      terminology: Norm.Delegate.delegate(&SquareUp.Schema.loyalty_program_terminology/0),
      updated_at: spec(is_binary())
    })
    |> selection([
      :id,
      :status,
      :reward_tiers,
      :terminology,
      :location_ids,
      :created_at,
      :updated_at,
      :accrual_rules
    ])
  end

  @type v1_list_orders_response :: %{items: [SquareUp.Schema.v1_order()]}

  def v1_list_orders_response do
    schema(%{items: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_order/0)))})
    |> selection([])
  end

  @type loyalty_event_query :: %{filter: SquareUp.Schema.loyalty_event_filter()}

  def loyalty_event_query do
    schema(%{filter: Norm.Delegate.delegate(&SquareUp.Schema.loyalty_event_filter/0)})
    |> selection([])
  end

  @type search_orders_response :: %{
          cursor: binary(),
          errors: [SquareUp.Schema.error()],
          order_entries: [SquareUp.Schema.order_entry()],
          orders: [SquareUp.Schema.order()]
        }

  def search_orders_response do
    schema(%{
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      order_entries: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.order_entry/0))),
      orders: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.order/0)))
    })
    |> selection([])
  end

  @type shift_wage :: %{hourly_rate: SquareUp.Schema.money(), title: binary()}

  def shift_wage do
    schema(%{
      hourly_rate: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      title: spec(is_binary())
    })
    |> selection([])
  end

  @type v1_delete_modifier_list_request :: %{}

  def v1_delete_modifier_list_request do
    schema(%{})
    |> selection([])
  end

  @type cash_drawer_shift_summary :: %{
          closed_at: binary(),
          closed_cash_money: SquareUp.Schema.money(),
          description: binary(),
          ended_at: binary(),
          expected_cash_money: SquareUp.Schema.money(),
          id: binary(),
          opened_at: binary(),
          opened_cash_money: SquareUp.Schema.money(),
          state: binary()
        }

  def cash_drawer_shift_summary do
    schema(%{
      closed_at: spec(is_binary()),
      closed_cash_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      description: spec(is_binary()),
      ended_at: spec(is_binary()),
      expected_cash_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      id: spec(is_binary()),
      opened_at: spec(is_binary()),
      opened_cash_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      state: spec(is_binary())
    })
    |> selection([])
  end

  @type catalog_query_text :: %{keywords: [binary()]}

  def catalog_query_text do
    schema(%{keywords: spec(coll_of(spec(is_binary())))})
    |> selection([:keywords])
  end

  @type search_orders_source_filter :: %{source_names: [binary()]}

  def search_orders_source_filter do
    schema(%{source_names: spec(coll_of(spec(is_binary())))})
    |> selection([])
  end

  @type job_assignment_pay_type :: binary()
  def job_assignment_pay_type do
    spec(is_binary())
  end

  @type loyalty_event_date_time_filter :: %{created_at: SquareUp.Schema.time_range()}

  def loyalty_event_date_time_filter do
    schema(%{created_at: Norm.Delegate.delegate(&SquareUp.Schema.time_range/0)})
    |> selection([:created_at])
  end

  @type order_fulfillment_shipment_details :: %{
          cancel_reason: binary(),
          canceled_at: binary(),
          carrier: binary(),
          expected_shipped_at: binary(),
          failed_at: binary(),
          failure_reason: binary(),
          in_progress_at: binary(),
          packaged_at: binary(),
          placed_at: binary(),
          recipient: SquareUp.Schema.order_fulfillment_recipient(),
          shipped_at: binary(),
          shipping_note: binary(),
          shipping_type: binary(),
          tracking_number: binary(),
          tracking_url: binary()
        }

  def order_fulfillment_shipment_details do
    schema(%{
      cancel_reason: spec(is_binary()),
      canceled_at: spec(is_binary()),
      carrier: spec(is_binary()),
      expected_shipped_at: spec(is_binary()),
      failed_at: spec(is_binary()),
      failure_reason: spec(is_binary()),
      in_progress_at: spec(is_binary()),
      packaged_at: spec(is_binary()),
      placed_at: spec(is_binary()),
      recipient: Norm.Delegate.delegate(&SquareUp.Schema.order_fulfillment_recipient/0),
      shipped_at: spec(is_binary()),
      shipping_note: spec(is_binary()),
      shipping_type: spec(is_binary()),
      tracking_number: spec(is_binary()),
      tracking_url: spec(is_binary())
    })
    |> selection([])
  end

  @type register_domain_request :: %{domain_name: binary()}

  def register_domain_request do
    schema(%{domain_name: spec(is_binary())})
    |> selection([:domain_name])
  end

  @type v1_variation_inventory_alert_type :: binary()
  def v1_variation_inventory_alert_type do
    spec(is_binary())
  end

  @type order_created :: %{
          created_at: binary(),
          location_id: binary(),
          order_id: binary(),
          state: binary(),
          version: integer()
        }

  def order_created do
    schema(%{
      created_at: spec(is_binary()),
      location_id: spec(is_binary()),
      order_id: spec(is_binary()),
      state: spec(is_binary()),
      version: spec(is_integer())
    })
    |> selection([])
  end

  @type catalog_tax :: %{
          applies_to_custom_amounts: boolean(),
          calculation_phase: binary(),
          enabled: boolean(),
          inclusion_type: binary(),
          name: binary(),
          percentage: binary()
        }

  def catalog_tax do
    schema(%{
      applies_to_custom_amounts: spec(is_boolean()),
      calculation_phase: spec(is_binary()),
      enabled: spec(is_boolean()),
      inclusion_type: spec(is_binary()),
      name: spec(is_binary()),
      percentage: spec(is_binary())
    })
    |> selection([])
  end

  @type invoice_sort_field :: binary()
  def invoice_sort_field do
    spec(is_binary())
  end

  @type v1_order_history_entry_action :: binary()
  def v1_order_history_entry_action do
    spec(is_binary())
  end

  @type v1_list_items_request :: %{batch_token: binary()}

  def v1_list_items_request do
    schema(%{batch_token: spec(is_binary())})
    |> selection([])
  end

  @type order_quantity_unit :: %{
          measurement_unit: SquareUp.Schema.measurement_unit(),
          precision: integer()
        }

  def order_quantity_unit do
    schema(%{
      measurement_unit: Norm.Delegate.delegate(&SquareUp.Schema.measurement_unit/0),
      precision: spec(is_integer())
    })
    |> selection([])
  end

  @type v1_update_modifier_list_request_selection_type :: binary()
  def v1_update_modifier_list_request_selection_type do
    spec(is_binary())
  end

  @type create_checkout_response :: %{
          checkout: SquareUp.Schema.checkout(),
          errors: [SquareUp.Schema.error()]
        }

  def create_checkout_response do
    schema(%{
      checkout: Norm.Delegate.delegate(&SquareUp.Schema.checkout/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type disputed_payment :: %{payment_id: binary()}

  def disputed_payment do
    schema(%{payment_id: spec(is_binary())})
    |> selection([])
  end

  @type catalog_item_modifier_list_info :: %{
          enabled: boolean(),
          max_selected_modifiers: integer(),
          min_selected_modifiers: integer(),
          modifier_list_id: binary(),
          modifier_overrides: [SquareUp.Schema.catalog_modifier_override()]
        }

  def catalog_item_modifier_list_info do
    schema(%{
      enabled: spec(is_boolean()),
      max_selected_modifiers: spec(is_integer()),
      min_selected_modifiers: spec(is_integer()),
      modifier_list_id: spec(is_binary()),
      modifier_overrides:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.catalog_modifier_override/0)))
    })
    |> selection([:modifier_list_id])
  end

  @type catalog_custom_attribute_definition_type :: binary()
  def catalog_custom_attribute_definition_type do
    spec(is_binary())
  end

  @type retrieve_inventory_adjustment_request :: %{}

  def retrieve_inventory_adjustment_request do
    schema(%{})
    |> selection([])
  end

  @type device :: %{id: binary(), name: binary()}

  def device do
    schema(%{id: spec(is_binary()), name: spec(is_binary())})
    |> selection([])
  end

  @type v1_merchant_account_type :: binary()
  def v1_merchant_account_type do
    spec(is_binary())
  end

  @type measurement_unit_custom :: %{abbreviation: binary(), name: binary()}

  def measurement_unit_custom do
    schema(%{abbreviation: spec(is_binary()), name: spec(is_binary())})
    |> selection([:name, :abbreviation])
  end

  @type coordinates :: %{latitude: number(), longitude: number()}

  def coordinates do
    schema(%{latitude: spec(is_number()), longitude: spec(is_number())})
    |> selection([])
  end

  @type list_dispute_evidence_request :: %{}

  def list_dispute_evidence_request do
    schema(%{})
    |> selection([])
  end

  @type order_source :: %{name: binary()}

  def order_source do
    schema(%{name: spec(is_binary())})
    |> selection([])
  end

  @type measurement_unit_area :: binary()
  def measurement_unit_area do
    spec(is_binary())
  end

  @type list_merchants_request :: %{cursor: integer()}

  def list_merchants_request do
    schema(%{cursor: spec(is_integer())})
    |> selection([])
  end

  @type dispute_evidence_type :: binary()
  def dispute_evidence_type do
    spec(is_binary())
  end

  @type v1_tender :: %{
          card_brand: binary(),
          change_back_money: SquareUp.Schema.v1_money(),
          employee_id: binary(),
          entry_method: binary(),
          id: binary(),
          is_exchange: boolean(),
          name: binary(),
          pan_suffix: binary(),
          payment_note: binary(),
          receipt_url: binary(),
          refunded_money: SquareUp.Schema.v1_money(),
          settled_at: binary(),
          tendered_at: binary(),
          tendered_money: SquareUp.Schema.v1_money(),
          total_money: SquareUp.Schema.v1_money(),
          type: binary()
        }

  def v1_tender do
    schema(%{
      card_brand: spec(is_binary()),
      change_back_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      employee_id: spec(is_binary()),
      entry_method: spec(is_binary()),
      id: spec(is_binary()),
      is_exchange: spec(is_boolean()),
      name: spec(is_binary()),
      pan_suffix: spec(is_binary()),
      payment_note: spec(is_binary()),
      receipt_url: spec(is_binary()),
      refunded_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      settled_at: spec(is_binary()),
      tendered_at: spec(is_binary()),
      tendered_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      total_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      type: spec(is_binary())
    })
    |> selection([])
  end

  @type delete_customer_response :: %{errors: [SquareUp.Schema.error()]}

  def delete_customer_response do
    schema(%{errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))})
    |> selection([])
  end

  @type delete_invoice_request :: %{version: integer()}

  def delete_invoice_request do
    schema(%{version: spec(is_integer())})
    |> selection([])
  end

  @type v1_discount :: %{
          amount_money: SquareUp.Schema.v1_money(),
          color: binary(),
          discount_type: binary(),
          id: binary(),
          name: binary(),
          pin_required: boolean(),
          rate: binary(),
          v2_id: binary()
        }

  def v1_discount do
    schema(%{
      amount_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      color: spec(is_binary()),
      discount_type: spec(is_binary()),
      id: spec(is_binary()),
      name: spec(is_binary()),
      pin_required: spec(is_boolean()),
      rate: spec(is_binary()),
      v2_id: spec(is_binary())
    })
    |> selection([])
  end

  @type v1_list_employees_request_status :: binary()
  def v1_list_employees_request_status do
    spec(is_binary())
  end

  @type v1_list_cash_drawer_shifts_request :: %{
          begin_time: binary(),
          end_time: binary(),
          order: binary()
        }

  def v1_list_cash_drawer_shifts_request do
    schema(%{begin_time: spec(is_binary()), end_time: spec(is_binary()), order: spec(is_binary())})
    |> selection([])
  end

  @type loyalty_program_status :: binary()
  def loyalty_program_status do
    spec(is_binary())
  end

  @type v1_list_settlements_request :: %{
          batch_token: binary(),
          begin_time: binary(),
          end_time: binary(),
          limit: integer(),
          order: binary(),
          status: binary()
        }

  def v1_list_settlements_request do
    schema(%{
      batch_token: spec(is_binary()),
      begin_time: spec(is_binary()),
      end_time: spec(is_binary()),
      limit: spec(is_integer()),
      order: spec(is_binary()),
      status: spec(is_binary())
    })
    |> selection([])
  end

  @type v1_apply_fee_request :: %{}

  def v1_apply_fee_request do
    schema(%{})
    |> selection([])
  end

  @type order_line_item :: %{
          applied_discounts: [SquareUp.Schema.order_line_item_applied_discount()],
          applied_taxes: [SquareUp.Schema.order_line_item_applied_tax()],
          base_price_money: SquareUp.Schema.money(),
          catalog_object_id: binary(),
          gross_sales_money: SquareUp.Schema.money(),
          metadata: map(),
          modifiers: [SquareUp.Schema.order_line_item_modifier()],
          name: binary(),
          note: binary(),
          quantity: binary(),
          quantity_unit: SquareUp.Schema.order_quantity_unit(),
          total_discount_money: SquareUp.Schema.money(),
          total_money: SquareUp.Schema.money(),
          total_tax_money: SquareUp.Schema.money(),
          uid: binary(),
          variation_name: binary(),
          variation_total_price_money: SquareUp.Schema.money()
        }

  def order_line_item do
    schema(%{
      applied_discounts:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.order_line_item_applied_discount/0))),
      applied_taxes:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.order_line_item_applied_tax/0))),
      base_price_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      catalog_object_id: spec(is_binary()),
      gross_sales_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      metadata: schema(%{}),
      modifiers:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.order_line_item_modifier/0))),
      name: spec(is_binary()),
      note: spec(is_binary()),
      quantity: spec(is_binary()),
      quantity_unit: Norm.Delegate.delegate(&SquareUp.Schema.order_quantity_unit/0),
      total_discount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      total_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      total_tax_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      uid: spec(is_binary()),
      variation_name: spec(is_binary()),
      variation_total_price_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0)
    })
    |> selection([:quantity])
  end

  @type catalog_info_response :: %{
          errors: [SquareUp.Schema.error()],
          limits: SquareUp.Schema.catalog_info_response_limits(),
          standard_unit_description_group: SquareUp.Schema.standard_unit_description_group()
        }

  def catalog_info_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      limits: Norm.Delegate.delegate(&SquareUp.Schema.catalog_info_response_limits/0),
      standard_unit_description_group:
        Norm.Delegate.delegate(&SquareUp.Schema.standard_unit_description_group/0)
    })
    |> selection([])
  end

  @type customer_inclusion_exclusion :: binary()
  def customer_inclusion_exclusion do
    spec(is_binary())
  end

  @type update_item_taxes_response :: %{errors: [SquareUp.Schema.error()], updated_at: binary()}

  def update_item_taxes_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      updated_at: spec(is_binary())
    })
    |> selection([])
  end

  @type v1_retrieve_timecard_request :: %{}

  def v1_retrieve_timecard_request do
    schema(%{})
    |> selection([])
  end

  @type charge_request :: %{
          additional_recipients: [SquareUp.Schema.additional_recipient()],
          amount_money: SquareUp.Schema.money(),
          billing_address: SquareUp.Schema.address(),
          buyer_email_address: binary(),
          card_nonce: binary(),
          customer_card_id: binary(),
          customer_id: binary(),
          delay_capture: boolean(),
          idempotency_key: binary(),
          note: binary(),
          order_id: binary(),
          reference_id: binary(),
          shipping_address: SquareUp.Schema.address(),
          verification_token: binary()
        }

  def charge_request do
    schema(%{
      additional_recipients:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.additional_recipient/0))),
      amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      billing_address: Norm.Delegate.delegate(&SquareUp.Schema.address/0),
      buyer_email_address: spec(is_binary()),
      card_nonce: spec(is_binary()),
      customer_card_id: spec(is_binary()),
      customer_id: spec(is_binary()),
      delay_capture: spec(is_boolean()),
      idempotency_key: spec(is_binary()),
      note: spec(is_binary()),
      order_id: spec(is_binary()),
      reference_id: spec(is_binary()),
      shipping_address: Norm.Delegate.delegate(&SquareUp.Schema.address/0),
      verification_token: spec(is_binary())
    })
    |> selection([:idempotency_key, :amount_money])
  end

  @type customer_sort :: %{field: binary(), order: binary()}

  def customer_sort do
    schema(%{field: spec(is_binary()), order: spec(is_binary())})
    |> selection([])
  end

  @type retrieve_customer_segment_response :: %{
          errors: [SquareUp.Schema.error()],
          segment: SquareUp.Schema.customer_segment()
        }

  def retrieve_customer_segment_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      segment: Norm.Delegate.delegate(&SquareUp.Schema.customer_segment/0)
    })
    |> selection([])
  end

  @type order_updated :: %{
          created_at: binary(),
          location_id: binary(),
          order_id: binary(),
          state: binary(),
          updated_at: binary(),
          version: integer()
        }

  def order_updated do
    schema(%{
      created_at: spec(is_binary()),
      location_id: spec(is_binary()),
      order_id: spec(is_binary()),
      state: spec(is_binary()),
      updated_at: spec(is_binary()),
      version: spec(is_integer())
    })
    |> selection([])
  end

  @type loyalty_event :: %{
          accumulate_points: SquareUp.Schema.loyalty_event_accumulate_points(),
          adjust_points: SquareUp.Schema.loyalty_event_adjust_points(),
          create_reward: SquareUp.Schema.loyalty_event_create_reward(),
          created_at: binary(),
          delete_reward: SquareUp.Schema.loyalty_event_delete_reward(),
          expire_points: SquareUp.Schema.loyalty_event_expire_points(),
          id: binary(),
          location_id: binary(),
          loyalty_account_id: binary(),
          other_event: SquareUp.Schema.loyalty_event_other(),
          redeem_reward: SquareUp.Schema.loyalty_event_redeem_reward(),
          source: binary(),
          type: binary()
        }

  def loyalty_event do
    schema(%{
      accumulate_points:
        Norm.Delegate.delegate(&SquareUp.Schema.loyalty_event_accumulate_points/0),
      adjust_points: Norm.Delegate.delegate(&SquareUp.Schema.loyalty_event_adjust_points/0),
      create_reward: Norm.Delegate.delegate(&SquareUp.Schema.loyalty_event_create_reward/0),
      created_at: spec(is_binary()),
      delete_reward: Norm.Delegate.delegate(&SquareUp.Schema.loyalty_event_delete_reward/0),
      expire_points: Norm.Delegate.delegate(&SquareUp.Schema.loyalty_event_expire_points/0),
      id: spec(is_binary()),
      location_id: spec(is_binary()),
      loyalty_account_id: spec(is_binary()),
      other_event: Norm.Delegate.delegate(&SquareUp.Schema.loyalty_event_other/0),
      redeem_reward: Norm.Delegate.delegate(&SquareUp.Schema.loyalty_event_redeem_reward/0),
      source: spec(is_binary()),
      type: spec(is_binary())
    })
    |> selection([:id, :type, :created_at, :loyalty_account_id, :source])
  end

  @type v1_list_refunds_request :: %{
          batch_token: binary(),
          begin_time: binary(),
          end_time: binary(),
          limit: integer(),
          order: binary()
        }

  def v1_list_refunds_request do
    schema(%{
      batch_token: spec(is_binary()),
      begin_time: spec(is_binary()),
      end_time: spec(is_binary()),
      limit: spec(is_integer()),
      order: spec(is_binary())
    })
    |> selection([])
  end

  @type inventory_physical_count :: %{
          catalog_object_id: binary(),
          catalog_object_type: binary(),
          created_at: binary(),
          employee_id: binary(),
          id: binary(),
          location_id: binary(),
          occurred_at: binary(),
          quantity: binary(),
          reference_id: binary(),
          source: SquareUp.Schema.source_application(),
          state: binary()
        }

  def inventory_physical_count do
    schema(%{
      catalog_object_id: spec(is_binary()),
      catalog_object_type: spec(is_binary()),
      created_at: spec(is_binary()),
      employee_id: spec(is_binary()),
      id: spec(is_binary()),
      location_id: spec(is_binary()),
      occurred_at: spec(is_binary()),
      quantity: spec(is_binary()),
      reference_id: spec(is_binary()),
      source: Norm.Delegate.delegate(&SquareUp.Schema.source_application/0),
      state: spec(is_binary())
    })
    |> selection([])
  end

  @type search_subscriptions_response :: %{
          cursor: binary(),
          errors: [SquareUp.Schema.error()],
          subscriptions: [SquareUp.Schema.subscription()]
        }

  def search_subscriptions_response do
    schema(%{
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      subscriptions: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.subscription/0)))
    })
    |> selection([])
  end

  @type renew_token_request :: %{access_token: binary()}

  def renew_token_request do
    schema(%{access_token: spec(is_binary())})
    |> selection([])
  end

  @type cancel_subscription_response :: %{
          errors: [SquareUp.Schema.error()],
          subscription: SquareUp.Schema.subscription()
        }

  def cancel_subscription_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      subscription: Norm.Delegate.delegate(&SquareUp.Schema.subscription/0)
    })
    |> selection([])
  end

  @type list_customers_request :: %{cursor: binary(), sort_field: binary(), sort_order: binary()}

  def list_customers_request do
    schema(%{
      cursor: spec(is_binary()),
      sort_field: spec(is_binary()),
      sort_order: spec(is_binary())
    })
    |> selection([])
  end

  @type v1_page_cell_object_type :: binary()
  def v1_page_cell_object_type do
    spec(is_binary())
  end

  @type get_bank_account_response :: %{
          bank_account: SquareUp.Schema.bank_account(),
          errors: [SquareUp.Schema.error()]
        }

  def get_bank_account_response do
    schema(%{
      bank_account: Norm.Delegate.delegate(&SquareUp.Schema.bank_account/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type loyalty_event_filter :: %{
          date_time_filter: SquareUp.Schema.loyalty_event_date_time_filter(),
          location_filter: SquareUp.Schema.loyalty_event_location_filter(),
          loyalty_account_filter: SquareUp.Schema.loyalty_event_loyalty_account_filter(),
          order_filter: SquareUp.Schema.loyalty_event_order_filter(),
          type_filter: SquareUp.Schema.loyalty_event_type_filter()
        }

  def loyalty_event_filter do
    schema(%{
      date_time_filter: Norm.Delegate.delegate(&SquareUp.Schema.loyalty_event_date_time_filter/0),
      location_filter: Norm.Delegate.delegate(&SquareUp.Schema.loyalty_event_location_filter/0),
      loyalty_account_filter:
        Norm.Delegate.delegate(&SquareUp.Schema.loyalty_event_loyalty_account_filter/0),
      order_filter: Norm.Delegate.delegate(&SquareUp.Schema.loyalty_event_order_filter/0),
      type_filter: Norm.Delegate.delegate(&SquareUp.Schema.loyalty_event_type_filter/0)
    })
    |> selection([])
  end

  @type v1_variation_pricing_type :: binary()
  def v1_variation_pricing_type do
    spec(is_binary())
  end

  @type create_customer_card_response :: %{
          card: SquareUp.Schema.card(),
          errors: [SquareUp.Schema.error()]
        }

  def create_customer_card_response do
    schema(%{
      card: Norm.Delegate.delegate(&SquareUp.Schema.card/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type revoke_token_response :: %{success: boolean()}

  def revoke_token_response do
    schema(%{success: spec(is_boolean())})
    |> selection([])
  end

  @type break :: %{
          break_type_id: binary(),
          end_at: binary(),
          expected_duration: binary(),
          id: binary(),
          is_paid: boolean(),
          name: binary(),
          start_at: binary()
        }

  def break do
    schema(%{
      break_type_id: spec(is_binary()),
      end_at: spec(is_binary()),
      expected_duration: spec(is_binary()),
      id: spec(is_binary()),
      is_paid: spec(is_boolean()),
      name: spec(is_binary()),
      start_at: spec(is_binary())
    })
    |> selection([:start_at, :break_type_id, :name, :expected_duration, :is_paid])
  end

  @type catalog_custom_attribute_definition_number_config :: %{precision: integer()}

  def catalog_custom_attribute_definition_number_config do
    schema(%{precision: spec(is_integer())})
    |> selection([])
  end

  @type workweek_config :: %{
          created_at: binary(),
          id: binary(),
          start_of_day_local_time: binary(),
          start_of_week: binary(),
          updated_at: binary(),
          version: integer()
        }

  def workweek_config do
    schema(%{
      created_at: spec(is_binary()),
      id: spec(is_binary()),
      start_of_day_local_time: spec(is_binary()),
      start_of_week: spec(is_binary()),
      updated_at: spec(is_binary()),
      version: spec(is_integer())
    })
    |> selection([:start_of_week, :start_of_day_local_time])
  end

  @type error :: %{category: binary(), code: binary(), detail: binary(), field: binary()}

  def error do
    schema(%{
      category: spec(is_binary()),
      code: spec(is_binary()),
      detail: spec(is_binary()),
      field: spec(is_binary())
    })
    |> selection([:category, :code])
  end

  @type bulk_create_team_members_request :: %{team_members: map()}

  def bulk_create_team_members_request do
    schema(%{team_members: schema(%{})})
    |> selection([:team_members])
  end

  @type search_catalog_objects_request :: %{
          begin_time: binary(),
          cursor: binary(),
          include_deleted_objects: boolean(),
          include_related_objects: boolean(),
          limit: integer(),
          object_types: [binary()],
          query: SquareUp.Schema.catalog_query()
        }

  def search_catalog_objects_request do
    schema(%{
      begin_time: spec(is_binary()),
      cursor: spec(is_binary()),
      include_deleted_objects: spec(is_boolean()),
      include_related_objects: spec(is_boolean()),
      limit: spec(is_integer()),
      object_types: spec(coll_of(spec(is_binary()))),
      query: Norm.Delegate.delegate(&SquareUp.Schema.catalog_query/0)
    })
    |> selection([])
  end

  @type v1_remove_fee_request :: %{}

  def v1_remove_fee_request do
    schema(%{})
    |> selection([])
  end

  @type v1_settlement_entry_type :: binary()
  def v1_settlement_entry_type do
    spec(is_binary())
  end

  @type accept_dispute_response :: %{
          dispute: SquareUp.Schema.dispute(),
          errors: [SquareUp.Schema.error()]
        }

  def accept_dispute_response do
    schema(%{
      dispute: Norm.Delegate.delegate(&SquareUp.Schema.dispute/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type order_fulfillment_pickup_details_schedule_type :: binary()
  def order_fulfillment_pickup_details_schedule_type do
    spec(is_binary())
  end

  @type v1_delete_item_request :: %{}

  def v1_delete_item_request do
    schema(%{})
    |> selection([])
  end

  @type retrieve_merchant_response :: %{
          errors: [SquareUp.Schema.error()],
          merchant: SquareUp.Schema.merchant()
        }

  def retrieve_merchant_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      merchant: Norm.Delegate.delegate(&SquareUp.Schema.merchant/0)
    })
    |> selection([])
  end

  @type v1_list_timecard_events_request :: %{}

  def v1_list_timecard_events_request do
    schema(%{})
    |> selection([])
  end

  @type v1_modifier_list :: %{
          id: binary(),
          modifier_options: [SquareUp.Schema.v1_modifier_option()],
          name: binary(),
          selection_type: binary(),
          v2_id: binary()
        }

  def v1_modifier_list do
    schema(%{
      id: spec(is_binary()),
      modifier_options:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_modifier_option/0))),
      name: spec(is_binary()),
      selection_type: spec(is_binary()),
      v2_id: spec(is_binary())
    })
    |> selection([])
  end

  @type loyalty_program_reward_definition_scope :: binary()
  def loyalty_program_reward_definition_scope do
    spec(is_binary())
  end

  @type v1_timecard :: %{
          clockin_location_id: binary(),
          clockin_time: binary(),
          clockout_location_id: binary(),
          clockout_time: binary(),
          created_at: binary(),
          deleted: boolean(),
          doubletime_seconds_worked: number(),
          employee_id: binary(),
          id: binary(),
          overtime_seconds_worked: number(),
          regular_seconds_worked: number(),
          updated_at: binary()
        }

  def v1_timecard do
    schema(%{
      clockin_location_id: spec(is_binary()),
      clockin_time: spec(is_binary()),
      clockout_location_id: spec(is_binary()),
      clockout_time: spec(is_binary()),
      created_at: spec(is_binary()),
      deleted: spec(is_boolean()),
      doubletime_seconds_worked: spec(is_number()),
      employee_id: spec(is_binary()),
      id: spec(is_binary()),
      overtime_seconds_worked: spec(is_number()),
      regular_seconds_worked: spec(is_number()),
      updated_at: spec(is_binary())
    })
    |> selection([:employee_id])
  end

  @type weekday :: binary()
  def weekday do
    spec(is_binary())
  end

  @type v1_list_categories_response :: %{items: [SquareUp.Schema.v1_category()]}

  def v1_list_categories_response do
    schema(%{items: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_category/0)))})
    |> selection([])
  end

  @type shift_sort :: %{field: binary(), order: binary()}

  def shift_sort do
    schema(%{field: spec(is_binary()), order: spec(is_binary())})
    |> selection([])
  end

  @type terminal_checkout_query_sort :: %{sort_order: binary()}

  def terminal_checkout_query_sort do
    schema(%{sort_order: spec(is_binary())})
    |> selection([])
  end

  @type order_fulfillment_updated_update :: %{
          fulfillment_uid: binary(),
          new_state: binary(),
          old_state: binary()
        }

  def order_fulfillment_updated_update do
    schema(%{
      fulfillment_uid: spec(is_binary()),
      new_state: spec(is_binary()),
      old_state: spec(is_binary())
    })
    |> selection([])
  end

  @type v1_delete_page_cell_request :: %{column: binary(), row: binary()}

  def v1_delete_page_cell_request do
    schema(%{column: spec(is_binary()), row: spec(is_binary())})
    |> selection([])
  end

  @type update_customer_request :: %{
          address: SquareUp.Schema.address(),
          birthday: binary(),
          company_name: binary(),
          email_address: binary(),
          family_name: binary(),
          given_name: binary(),
          nickname: binary(),
          note: binary(),
          phone_number: binary(),
          reference_id: binary()
        }

  def update_customer_request do
    schema(%{
      address: Norm.Delegate.delegate(&SquareUp.Schema.address/0),
      birthday: spec(is_binary()),
      company_name: spec(is_binary()),
      email_address: spec(is_binary()),
      family_name: spec(is_binary()),
      given_name: spec(is_binary()),
      nickname: spec(is_binary()),
      note: spec(is_binary()),
      phone_number: spec(is_binary()),
      reference_id: spec(is_binary())
    })
    |> selection([])
  end

  @type catalog_object_batch :: %{objects: [SquareUp.Schema.catalog_object()]}

  def catalog_object_batch do
    schema(%{objects: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.catalog_object/0)))})
    |> selection([:objects])
  end

  @type v1_create_discount_request :: %{body: SquareUp.Schema.v1_discount()}

  def v1_create_discount_request do
    schema(%{body: Norm.Delegate.delegate(&SquareUp.Schema.v1_discount/0)})
    |> selection([])
  end

  @type order_state :: binary()
  def order_state do
    spec(is_binary())
  end

  @type update_invoice_request :: %{
          fields_to_clear: [binary()],
          idempotency_key: binary(),
          invoice: SquareUp.Schema.invoice()
        }

  def update_invoice_request do
    schema(%{
      fields_to_clear: spec(coll_of(spec(is_binary()))),
      idempotency_key: spec(is_binary()),
      invoice: Norm.Delegate.delegate(&SquareUp.Schema.invoice/0)
    })
    |> selection([:invoice])
  end

  @type merchant :: %{
          business_name: binary(),
          country: binary(),
          currency: binary(),
          id: binary(),
          language_code: binary(),
          main_location_id: binary(),
          status: binary()
        }

  def merchant do
    schema(%{
      business_name: spec(is_binary()),
      country: spec(is_binary()),
      currency: spec(is_binary()),
      id: spec(is_binary()),
      language_code: spec(is_binary()),
      main_location_id: spec(is_binary()),
      status: spec(is_binary())
    })
    |> selection([:country])
  end

  @type v1_create_variation_request :: %{body: SquareUp.Schema.v1_variation()}

  def v1_create_variation_request do
    schema(%{body: Norm.Delegate.delegate(&SquareUp.Schema.v1_variation/0)})
    |> selection([])
  end

  @type product_type :: binary()
  def product_type do
    spec(is_binary())
  end

  @type submit_evidence_response :: %{
          dispute: SquareUp.Schema.dispute(),
          errors: [SquareUp.Schema.error()]
        }

  def submit_evidence_response do
    schema(%{
      dispute: Norm.Delegate.delegate(&SquareUp.Schema.dispute/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type tender_card_details_status :: binary()
  def tender_card_details_status do
    spec(is_binary())
  end

  @type invoice_request_type :: binary()
  def invoice_request_type do
    spec(is_binary())
  end

  @type order_line_item_applied_tax :: %{
          applied_money: SquareUp.Schema.money(),
          tax_uid: binary(),
          uid: binary()
        }

  def order_line_item_applied_tax do
    schema(%{
      applied_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      tax_uid: spec(is_binary()),
      uid: spec(is_binary())
    })
    |> selection([:tax_uid])
  end

  @type order_line_item_modifier :: %{
          base_price_money: SquareUp.Schema.money(),
          catalog_object_id: binary(),
          name: binary(),
          total_price_money: SquareUp.Schema.money(),
          uid: binary()
        }

  def order_line_item_modifier do
    schema(%{
      base_price_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      catalog_object_id: spec(is_binary()),
      name: spec(is_binary()),
      total_price_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      uid: spec(is_binary())
    })
    |> selection([])
  end

  @type v1_payment_tax_inclusion_type :: binary()
  def v1_payment_tax_inclusion_type do
    spec(is_binary())
  end

  @type tender_bank_transfer_details :: %{status: binary()}

  def tender_bank_transfer_details do
    schema(%{status: spec(is_binary())})
    |> selection([])
  end

  @type v1_item_type :: binary()
  def v1_item_type do
    spec(is_binary())
  end

  @type v1_update_category_request :: %{body: SquareUp.Schema.v1_category()}

  def v1_update_category_request do
    schema(%{body: Norm.Delegate.delegate(&SquareUp.Schema.v1_category/0)})
    |> selection([:body])
  end

  @type retrieve_merchant_request :: %{}

  def retrieve_merchant_request do
    schema(%{})
    |> selection([])
  end

  @type create_team_member_request :: %{
          idempotency_key: binary(),
          team_member: SquareUp.Schema.team_member()
        }

  def create_team_member_request do
    schema(%{
      idempotency_key: spec(is_binary()),
      team_member: Norm.Delegate.delegate(&SquareUp.Schema.team_member/0)
    })
    |> selection([])
  end

  @type update_workweek_config_response :: %{
          errors: [SquareUp.Schema.error()],
          workweek_config: SquareUp.Schema.workweek_config()
        }

  def update_workweek_config_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      workweek_config: Norm.Delegate.delegate(&SquareUp.Schema.workweek_config/0)
    })
    |> selection([])
  end

  @type retrieve_loyalty_reward_response :: %{
          errors: [SquareUp.Schema.error()],
          reward: SquareUp.Schema.loyalty_reward()
        }

  def retrieve_loyalty_reward_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      reward: Norm.Delegate.delegate(&SquareUp.Schema.loyalty_reward/0)
    })
    |> selection([])
  end

  @type adjust_loyalty_points_response :: %{
          errors: [SquareUp.Schema.error()],
          event: SquareUp.Schema.loyalty_event()
        }

  def adjust_loyalty_points_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      event: Norm.Delegate.delegate(&SquareUp.Schema.loyalty_event/0)
    })
    |> selection([])
  end

  @type catalog_item :: %{
          abbreviation: binary(),
          available_electronically: boolean(),
          available_for_pickup: boolean(),
          available_online: boolean(),
          category_id: binary(),
          description: binary(),
          item_options: [SquareUp.Schema.catalog_item_option_for_item()],
          label_color: binary(),
          modifier_list_info: [SquareUp.Schema.catalog_item_modifier_list_info()],
          name: binary(),
          product_type: binary(),
          skip_modifier_screen: boolean(),
          tax_ids: [binary()],
          variations: [SquareUp.Schema.catalog_object()]
        }

  def catalog_item do
    schema(%{
      abbreviation: spec(is_binary()),
      available_electronically: spec(is_boolean()),
      available_for_pickup: spec(is_boolean()),
      available_online: spec(is_boolean()),
      category_id: spec(is_binary()),
      description: spec(is_binary()),
      item_options:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.catalog_item_option_for_item/0))),
      label_color: spec(is_binary()),
      modifier_list_info:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.catalog_item_modifier_list_info/0))),
      name: spec(is_binary()),
      product_type: spec(is_binary()),
      skip_modifier_screen: spec(is_boolean()),
      tax_ids: spec(coll_of(spec(is_binary()))),
      variations: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.catalog_object/0)))
    })
    |> selection([])
  end

  @type customer_filter :: %{
          created_at: SquareUp.Schema.time_range(),
          creation_source: SquareUp.Schema.customer_creation_source_filter(),
          email_address: SquareUp.Schema.customer_text_filter(),
          group_ids: SquareUp.Schema.filter_value(),
          phone_number: SquareUp.Schema.customer_text_filter(),
          reference_id: SquareUp.Schema.customer_text_filter(),
          updated_at: SquareUp.Schema.time_range()
        }

  def customer_filter do
    schema(%{
      created_at: Norm.Delegate.delegate(&SquareUp.Schema.time_range/0),
      creation_source: Norm.Delegate.delegate(&SquareUp.Schema.customer_creation_source_filter/0),
      email_address: Norm.Delegate.delegate(&SquareUp.Schema.customer_text_filter/0),
      group_ids: Norm.Delegate.delegate(&SquareUp.Schema.filter_value/0),
      phone_number: Norm.Delegate.delegate(&SquareUp.Schema.customer_text_filter/0),
      reference_id: Norm.Delegate.delegate(&SquareUp.Schema.customer_text_filter/0),
      updated_at: Norm.Delegate.delegate(&SquareUp.Schema.time_range/0)
    })
    |> selection([])
  end

  @type batch_delete_catalog_objects_response :: %{
          deleted_at: binary(),
          deleted_object_ids: [binary()],
          errors: [SquareUp.Schema.error()]
        }

  def batch_delete_catalog_objects_response do
    schema(%{
      deleted_at: spec(is_binary()),
      deleted_object_ids: spec(coll_of(spec(is_binary()))),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type list_payment_refunds_response :: %{
          cursor: binary(),
          errors: [SquareUp.Schema.error()],
          refunds: [SquareUp.Schema.payment_refund()]
        }

  def list_payment_refunds_response do
    schema(%{
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      refunds: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.payment_refund/0)))
    })
    |> selection([])
  end

  @type batch_retrieve_orders_request :: %{location_id: binary(), order_ids: [binary()]}

  def batch_retrieve_orders_request do
    schema(%{location_id: spec(is_binary()), order_ids: spec(coll_of(spec(is_binary())))})
    |> selection([:order_ids])
  end

  @type retrieve_location_request :: %{}

  def retrieve_location_request do
    schema(%{})
    |> selection([])
  end

  @type dispute :: %{
          amount_money: SquareUp.Schema.money(),
          brand_dispute_id: binary(),
          card_brand: binary(),
          created_at: binary(),
          dispute_id: binary(),
          disputed_payment: SquareUp.Schema.disputed_payment(),
          due_at: binary(),
          evidence_ids: [binary()],
          location_id: binary(),
          reason: binary(),
          reported_date: binary(),
          state: binary(),
          updated_at: binary(),
          version: integer()
        }

  def dispute do
    schema(%{
      amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      brand_dispute_id: spec(is_binary()),
      card_brand: spec(is_binary()),
      created_at: spec(is_binary()),
      dispute_id: spec(is_binary()),
      disputed_payment: Norm.Delegate.delegate(&SquareUp.Schema.disputed_payment/0),
      due_at: spec(is_binary()),
      evidence_ids: spec(coll_of(spec(is_binary()))),
      location_id: spec(is_binary()),
      reason: spec(is_binary()),
      reported_date: spec(is_binary()),
      state: spec(is_binary()),
      updated_at: spec(is_binary()),
      version: spec(is_integer())
    })
    |> selection([])
  end

  @type invoice_filter :: %{customer_ids: [binary()], location_ids: [binary()]}

  def invoice_filter do
    schema(%{
      customer_ids: spec(coll_of(spec(is_binary()))),
      location_ids: spec(coll_of(spec(is_binary())))
    })
    |> selection([:location_ids])
  end

  @type v1_employee_role_permissions :: binary()
  def v1_employee_role_permissions do
    spec(is_binary())
  end

  @type v1_create_page_request :: %{body: SquareUp.Schema.v1_page()}

  def v1_create_page_request do
    schema(%{body: Norm.Delegate.delegate(&SquareUp.Schema.v1_page/0)})
    |> selection([])
  end

  @type order :: %{
          closed_at: binary(),
          created_at: binary(),
          customer_id: binary(),
          discounts: [SquareUp.Schema.order_line_item_discount()],
          fulfillments: [SquareUp.Schema.order_fulfillment()],
          id: binary(),
          line_items: [SquareUp.Schema.order_line_item()],
          location_id: binary(),
          metadata: map(),
          net_amounts: SquareUp.Schema.order_money_amounts(),
          pricing_options: SquareUp.Schema.order_pricing_options(),
          reference_id: binary(),
          refunds: [SquareUp.Schema.refund()],
          return_amounts: SquareUp.Schema.order_money_amounts(),
          returns: [SquareUp.Schema.order_return()],
          rewards: [SquareUp.Schema.order_reward()],
          rounding_adjustment: SquareUp.Schema.order_rounding_adjustment(),
          service_charges: [SquareUp.Schema.order_service_charge()],
          source: SquareUp.Schema.order_source(),
          state: binary(),
          taxes: [SquareUp.Schema.order_line_item_tax()],
          tenders: [SquareUp.Schema.tender()],
          total_discount_money: SquareUp.Schema.money(),
          total_money: SquareUp.Schema.money(),
          total_service_charge_money: SquareUp.Schema.money(),
          total_tax_money: SquareUp.Schema.money(),
          total_tip_money: SquareUp.Schema.money(),
          updated_at: binary(),
          version: integer()
        }

  def order do
    schema(%{
      closed_at: spec(is_binary()),
      created_at: spec(is_binary()),
      customer_id: spec(is_binary()),
      discounts:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.order_line_item_discount/0))),
      fulfillments: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.order_fulfillment/0))),
      id: spec(is_binary()),
      line_items: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.order_line_item/0))),
      location_id: spec(is_binary()),
      metadata: schema(%{}),
      net_amounts: Norm.Delegate.delegate(&SquareUp.Schema.order_money_amounts/0),
      pricing_options: Norm.Delegate.delegate(&SquareUp.Schema.order_pricing_options/0),
      reference_id: spec(is_binary()),
      refunds: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.refund/0))),
      return_amounts: Norm.Delegate.delegate(&SquareUp.Schema.order_money_amounts/0),
      returns: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.order_return/0))),
      rewards: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.order_reward/0))),
      rounding_adjustment: Norm.Delegate.delegate(&SquareUp.Schema.order_rounding_adjustment/0),
      service_charges:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.order_service_charge/0))),
      source: Norm.Delegate.delegate(&SquareUp.Schema.order_source/0),
      state: spec(is_binary()),
      taxes: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.order_line_item_tax/0))),
      tenders: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.tender/0))),
      total_discount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      total_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      total_service_charge_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      total_tax_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      total_tip_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      updated_at: spec(is_binary()),
      version: spec(is_integer())
    })
    |> selection([:location_id])
  end

  @type measurement_unit :: %{
          area_unit: binary(),
          custom_unit: SquareUp.Schema.measurement_unit_custom(),
          generic_unit: binary(),
          length_unit: binary(),
          time_unit: binary(),
          type: binary(),
          volume_unit: binary(),
          weight_unit: binary()
        }

  def measurement_unit do
    schema(%{
      area_unit: spec(is_binary()),
      custom_unit: Norm.Delegate.delegate(&SquareUp.Schema.measurement_unit_custom/0),
      generic_unit: spec(is_binary()),
      length_unit: spec(is_binary()),
      time_unit: spec(is_binary()),
      type: spec(is_binary()),
      volume_unit: spec(is_binary()),
      weight_unit: spec(is_binary())
    })
    |> selection([])
  end

  @type loyalty_event_adjust_points :: %{
          loyalty_program_id: binary(),
          points: integer(),
          reason: binary()
        }

  def loyalty_event_adjust_points do
    schema(%{
      loyalty_program_id: spec(is_binary()),
      points: spec(is_integer()),
      reason: spec(is_binary())
    })
    |> selection([:points])
  end

  @type catalog_discount_modify_tax_basis :: binary()
  def catalog_discount_modify_tax_basis do
    spec(is_binary())
  end

  @type search_team_members_request :: %{
          cursor: binary(),
          limit: integer(),
          query: SquareUp.Schema.search_team_members_query()
        }

  def search_team_members_request do
    schema(%{
      cursor: spec(is_binary()),
      limit: spec(is_integer()),
      query: Norm.Delegate.delegate(&SquareUp.Schema.search_team_members_query/0)
    })
    |> selection([])
  end

  @type catalog_custom_attribute_definition_app_visibility :: binary()
  def catalog_custom_attribute_definition_app_visibility do
    spec(is_binary())
  end

  @type list_loyalty_programs_request :: %{}

  def list_loyalty_programs_request do
    schema(%{})
    |> selection([])
  end

  @type loyalty_event_type :: binary()
  def loyalty_event_type do
    spec(is_binary())
  end

  @type update_shift_request :: %{shift: SquareUp.Schema.shift()}

  def update_shift_request do
    schema(%{shift: Norm.Delegate.delegate(&SquareUp.Schema.shift/0)})
    |> selection([:shift])
  end

  @type catalog_item_product_type :: binary()
  def catalog_item_product_type do
    spec(is_binary())
  end

  @type catalog_quick_amount_type :: binary()
  def catalog_quick_amount_type do
    spec(is_binary())
  end

  @type pay_order_response :: %{errors: [SquareUp.Schema.error()], order: SquareUp.Schema.order()}

  def pay_order_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      order: Norm.Delegate.delegate(&SquareUp.Schema.order/0)
    })
    |> selection([])
  end

  @type team_member_assigned_locations_assignment_type :: binary()
  def team_member_assigned_locations_assignment_type do
    spec(is_binary())
  end

  @type v1_payment_item_detail :: %{
          category_name: binary(),
          item_id: binary(),
          item_variation_id: binary(),
          sku: binary()
        }

  def v1_payment_item_detail do
    schema(%{
      category_name: spec(is_binary()),
      item_id: spec(is_binary()),
      item_variation_id: spec(is_binary()),
      sku: spec(is_binary())
    })
    |> selection([])
  end

  @type v1_item :: %{
          abbreviation: binary(),
          available_for_pickup: boolean(),
          available_online: boolean(),
          category: SquareUp.Schema.v1_category(),
          category_id: binary(),
          color: binary(),
          description: binary(),
          fees: [SquareUp.Schema.v1_fee()],
          id: binary(),
          master_image: SquareUp.Schema.v1_item_image(),
          modifier_lists: [SquareUp.Schema.v1_modifier_list()],
          name: binary(),
          taxable: boolean(),
          type: binary(),
          v2_id: binary(),
          variations: [SquareUp.Schema.v1_variation()],
          visibility: binary()
        }

  def v1_item do
    schema(%{
      abbreviation: spec(is_binary()),
      available_for_pickup: spec(is_boolean()),
      available_online: spec(is_boolean()),
      category: Norm.Delegate.delegate(&SquareUp.Schema.v1_category/0),
      category_id: spec(is_binary()),
      color: spec(is_binary()),
      description: spec(is_binary()),
      fees: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_fee/0))),
      id: spec(is_binary()),
      master_image: Norm.Delegate.delegate(&SquareUp.Schema.v1_item_image/0),
      modifier_lists: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_modifier_list/0))),
      name: spec(is_binary()),
      taxable: spec(is_boolean()),
      type: spec(is_binary()),
      v2_id: spec(is_binary()),
      variations: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_variation/0))),
      visibility: spec(is_binary())
    })
    |> selection([])
  end

  @type update_break_type_request :: %{break_type: SquareUp.Schema.break_type()}

  def update_break_type_request do
    schema(%{break_type: Norm.Delegate.delegate(&SquareUp.Schema.break_type/0)})
    |> selection([:break_type])
  end

  @type create_order_response :: %{
          errors: [SquareUp.Schema.error()],
          order: SquareUp.Schema.order()
        }

  def create_order_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      order: Norm.Delegate.delegate(&SquareUp.Schema.order/0)
    })
    |> selection([])
  end

  @type v1_remove_modifier_list_request :: %{}

  def v1_remove_modifier_list_request do
    schema(%{})
    |> selection([])
  end

  @type v1_settlement_status :: binary()
  def v1_settlement_status do
    spec(is_binary())
  end

  @type search_orders_filter :: %{
          customer_filter: SquareUp.Schema.search_orders_customer_filter(),
          date_time_filter: SquareUp.Schema.search_orders_date_time_filter(),
          fulfillment_filter: SquareUp.Schema.search_orders_fulfillment_filter(),
          source_filter: SquareUp.Schema.search_orders_source_filter(),
          state_filter: SquareUp.Schema.search_orders_state_filter()
        }

  def search_orders_filter do
    schema(%{
      customer_filter: Norm.Delegate.delegate(&SquareUp.Schema.search_orders_customer_filter/0),
      date_time_filter: Norm.Delegate.delegate(&SquareUp.Schema.search_orders_date_time_filter/0),
      fulfillment_filter:
        Norm.Delegate.delegate(&SquareUp.Schema.search_orders_fulfillment_filter/0),
      source_filter: Norm.Delegate.delegate(&SquareUp.Schema.search_orders_source_filter/0),
      state_filter: Norm.Delegate.delegate(&SquareUp.Schema.search_orders_state_filter/0)
    })
    |> selection([])
  end

  @type delete_break_type_response :: %{errors: [SquareUp.Schema.error()]}

  def delete_break_type_response do
    schema(%{errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))})
    |> selection([])
  end

  @type order_line_item_tax :: %{
          applied_money: SquareUp.Schema.money(),
          catalog_object_id: binary(),
          metadata: map(),
          name: binary(),
          percentage: binary(),
          scope: binary(),
          type: binary(),
          uid: binary()
        }

  def order_line_item_tax do
    schema(%{
      applied_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      catalog_object_id: spec(is_binary()),
      metadata: schema(%{}),
      name: spec(is_binary()),
      percentage: spec(is_binary()),
      scope: spec(is_binary()),
      type: spec(is_binary()),
      uid: spec(is_binary())
    })
    |> selection([])
  end

  @type v1_delete_discount_request :: %{}

  def v1_delete_discount_request do
    schema(%{})
    |> selection([])
  end

  @type get_break_type_request :: %{}

  def get_break_type_request do
    schema(%{})
    |> selection([])
  end

  @type customer_creation_source :: binary()
  def customer_creation_source do
    spec(is_binary())
  end

  @type checkout :: %{
          additional_recipients: [SquareUp.Schema.additional_recipient()],
          ask_for_shipping_address: boolean(),
          checkout_page_url: binary(),
          created_at: binary(),
          id: binary(),
          merchant_support_email: binary(),
          order: SquareUp.Schema.order(),
          pre_populate_buyer_email: binary(),
          pre_populate_shipping_address: SquareUp.Schema.address(),
          redirect_url: binary()
        }

  def checkout do
    schema(%{
      additional_recipients:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.additional_recipient/0))),
      ask_for_shipping_address: spec(is_boolean()),
      checkout_page_url: spec(is_binary()),
      created_at: spec(is_binary()),
      id: spec(is_binary()),
      merchant_support_email: spec(is_binary()),
      order: Norm.Delegate.delegate(&SquareUp.Schema.order/0),
      pre_populate_buyer_email: spec(is_binary()),
      pre_populate_shipping_address: Norm.Delegate.delegate(&SquareUp.Schema.address/0),
      redirect_url: spec(is_binary())
    })
    |> selection([])
  end

  @type catalog_custom_attribute_definition_string_config :: %{enforce_uniqueness: boolean()}

  def catalog_custom_attribute_definition_string_config do
    schema(%{enforce_uniqueness: spec(is_boolean())})
    |> selection([])
  end

  @type cancel_payment_request :: %{}

  def cancel_payment_request do
    schema(%{})
    |> selection([])
  end

  @type v1_retrieve_order_request :: %{}

  def v1_retrieve_order_request do
    schema(%{})
    |> selection([])
  end

  @type remove_group_from_customer_request :: %{}

  def remove_group_from_customer_request do
    schema(%{})
    |> selection([])
  end

  @type retrieve_customer_request :: %{}

  def retrieve_customer_request do
    schema(%{})
    |> selection([])
  end

  @type update_order_request :: %{
          fields_to_clear: [binary()],
          idempotency_key: binary(),
          order: SquareUp.Schema.order()
        }

  def update_order_request do
    schema(%{
      fields_to_clear: spec(coll_of(spec(is_binary()))),
      idempotency_key: spec(is_binary()),
      order: Norm.Delegate.delegate(&SquareUp.Schema.order/0)
    })
    |> selection([])
  end

  @type list_locations_response :: %{
          errors: [SquareUp.Schema.error()],
          locations: [SquareUp.Schema.location()]
        }

  def list_locations_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      locations: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.location/0)))
    })
    |> selection([])
  end

  @type catalog_query_item_variations_for_item_option_values :: %{
          item_option_value_ids: [binary()]
        }

  def catalog_query_item_variations_for_item_option_values do
    schema(%{item_option_value_ids: spec(coll_of(spec(is_binary())))})
    |> selection([])
  end

  @type v1_page_cell_placeholder_type :: binary()
  def v1_page_cell_placeholder_type do
    spec(is_binary())
  end

  @type complete_payment_request :: %{}

  def complete_payment_request do
    schema(%{})
    |> selection([])
  end

  @type cancel_subscription_request :: %{}

  def cancel_subscription_request do
    schema(%{})
    |> selection([])
  end

  @type batch_upsert_catalog_objects_request :: %{
          batches: [SquareUp.Schema.catalog_object_batch()],
          idempotency_key: binary()
        }

  def batch_upsert_catalog_objects_request do
    schema(%{
      batches: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.catalog_object_batch/0))),
      idempotency_key: spec(is_binary())
    })
    |> selection([:idempotency_key, :batches])
  end

  @type location :: %{
          address: SquareUp.Schema.address(),
          business_email: binary(),
          business_hours: SquareUp.Schema.business_hours(),
          business_name: binary(),
          capabilities: [binary()],
          coordinates: SquareUp.Schema.coordinates(),
          country: binary(),
          created_at: binary(),
          currency: binary(),
          description: binary(),
          facebook_url: binary(),
          id: binary(),
          instagram_username: binary(),
          language_code: binary(),
          logo_url: binary(),
          mcc: binary(),
          merchant_id: binary(),
          name: binary(),
          phone_number: binary(),
          pos_background_url: binary(),
          status: binary(),
          timezone: binary(),
          twitter_username: binary(),
          type: binary(),
          website_url: binary()
        }

  def location do
    schema(%{
      address: Norm.Delegate.delegate(&SquareUp.Schema.address/0),
      business_email: spec(is_binary()),
      business_hours: Norm.Delegate.delegate(&SquareUp.Schema.business_hours/0),
      business_name: spec(is_binary()),
      capabilities: spec(coll_of(spec(is_binary()))),
      coordinates: Norm.Delegate.delegate(&SquareUp.Schema.coordinates/0),
      country: spec(is_binary()),
      created_at: spec(is_binary()),
      currency: spec(is_binary()),
      description: spec(is_binary()),
      facebook_url: spec(is_binary()),
      id: spec(is_binary()),
      instagram_username: spec(is_binary()),
      language_code: spec(is_binary()),
      logo_url: spec(is_binary()),
      mcc: spec(is_binary()),
      merchant_id: spec(is_binary()),
      name: spec(is_binary()),
      phone_number: spec(is_binary()),
      pos_background_url: spec(is_binary()),
      status: spec(is_binary()),
      timezone: spec(is_binary()),
      twitter_username: spec(is_binary()),
      type: spec(is_binary()),
      website_url: spec(is_binary())
    })
    |> selection([])
  end

  @type inventory_change :: %{
          adjustment: SquareUp.Schema.inventory_adjustment(),
          physical_count: SquareUp.Schema.inventory_physical_count(),
          transfer: SquareUp.Schema.inventory_transfer(),
          type: binary()
        }

  def inventory_change do
    schema(%{
      adjustment: Norm.Delegate.delegate(&SquareUp.Schema.inventory_adjustment/0),
      physical_count: Norm.Delegate.delegate(&SquareUp.Schema.inventory_physical_count/0),
      transfer: Norm.Delegate.delegate(&SquareUp.Schema.inventory_transfer/0),
      type: spec(is_binary())
    })
    |> selection([])
  end

  @type ecom_visibility :: binary()
  def ecom_visibility do
    spec(is_binary())
  end

  @type loyalty_event_location_filter :: %{location_ids: [binary()]}

  def loyalty_event_location_filter do
    schema(%{location_ids: spec(coll_of(spec(is_binary())))})
    |> selection([:location_ids])
  end

  @type invoice_request_method :: binary()
  def invoice_request_method do
    spec(is_binary())
  end

  @type v1_update_order_request_action :: binary()
  def v1_update_order_request_action do
    spec(is_binary())
  end

  @type publish_invoice_request :: %{idempotency_key: binary(), version: integer()}

  def publish_invoice_request do
    schema(%{idempotency_key: spec(is_binary()), version: spec(is_integer())})
    |> selection([:version])
  end

  @type cancel_payment_by_idempotency_key_request :: %{idempotency_key: binary()}

  def cancel_payment_by_idempotency_key_request do
    schema(%{idempotency_key: spec(is_binary())})
    |> selection([:idempotency_key])
  end

  @type search_invoices_request :: %{
          cursor: binary(),
          limit: integer(),
          query: SquareUp.Schema.invoice_query()
        }

  def search_invoices_request do
    schema(%{
      cursor: spec(is_binary()),
      limit: spec(is_integer()),
      query: Norm.Delegate.delegate(&SquareUp.Schema.invoice_query/0)
    })
    |> selection([:query])
  end

  @type catalog_item_option_for_item :: %{item_option_id: binary()}

  def catalog_item_option_for_item do
    schema(%{item_option_id: spec(is_binary())})
    |> selection([])
  end

  @type invoice_query :: %{
          filter: SquareUp.Schema.invoice_filter(),
          sort: SquareUp.Schema.invoice_sort()
        }

  def invoice_query do
    schema(%{
      filter: Norm.Delegate.delegate(&SquareUp.Schema.invoice_filter/0),
      sort: Norm.Delegate.delegate(&SquareUp.Schema.invoice_sort/0)
    })
    |> selection([:filter])
  end

  @type catalog_item_variation :: %{
          inventory_alert_threshold: integer(),
          inventory_alert_type: binary(),
          item_id: binary(),
          item_option_values: [SquareUp.Schema.catalog_item_option_value_for_item_variation()],
          location_overrides: [SquareUp.Schema.item_variation_location_overrides()],
          measurement_unit_id: binary(),
          name: binary(),
          ordinal: integer(),
          price_money: SquareUp.Schema.money(),
          pricing_type: binary(),
          service_duration: integer(),
          sku: binary(),
          track_inventory: boolean(),
          upc: binary(),
          user_data: binary()
        }

  def catalog_item_variation do
    schema(%{
      inventory_alert_threshold: spec(is_integer()),
      inventory_alert_type: spec(is_binary()),
      item_id: spec(is_binary()),
      item_option_values:
        spec(
          coll_of(
            Norm.Delegate.delegate(
              &SquareUp.Schema.catalog_item_option_value_for_item_variation/0
            )
          )
        ),
      location_overrides:
        spec(
          coll_of(Norm.Delegate.delegate(&SquareUp.Schema.item_variation_location_overrides/0))
        ),
      measurement_unit_id: spec(is_binary()),
      name: spec(is_binary()),
      ordinal: spec(is_integer()),
      price_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      pricing_type: spec(is_binary()),
      service_duration: spec(is_integer()),
      sku: spec(is_binary()),
      track_inventory: spec(is_boolean()),
      upc: spec(is_binary()),
      user_data: spec(is_binary())
    })
    |> selection([])
  end

  @type upsert_catalog_object_request :: %{
          idempotency_key: binary(),
          object: SquareUp.Schema.catalog_object()
        }

  def upsert_catalog_object_request do
    schema(%{
      idempotency_key: spec(is_binary()),
      object: Norm.Delegate.delegate(&SquareUp.Schema.catalog_object/0)
    })
    |> selection([:idempotency_key, :object])
  end

  @type break_type :: %{
          break_name: binary(),
          created_at: binary(),
          expected_duration: binary(),
          id: binary(),
          is_paid: boolean(),
          location_id: binary(),
          updated_at: binary(),
          version: integer()
        }

  def break_type do
    schema(%{
      break_name: spec(is_binary()),
      created_at: spec(is_binary()),
      expected_duration: spec(is_binary()),
      id: spec(is_binary()),
      is_paid: spec(is_boolean()),
      location_id: spec(is_binary()),
      updated_at: spec(is_binary()),
      version: spec(is_integer())
    })
    |> selection([:location_id, :break_name, :expected_duration, :is_paid])
  end

  @type v1_delete_fee_request :: %{}

  def v1_delete_fee_request do
    schema(%{})
    |> selection([])
  end

  @type create_terminal_checkout_response :: %{
          checkout: SquareUp.Schema.terminal_checkout(),
          errors: [SquareUp.Schema.error()]
        }

  def create_terminal_checkout_response do
    schema(%{
      checkout: Norm.Delegate.delegate(&SquareUp.Schema.terminal_checkout/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type capture_transaction_request :: %{}

  def capture_transaction_request do
    schema(%{})
    |> selection([])
  end

  @type subscription_event :: %{
          effective_date: binary(),
          id: binary(),
          plan_id: binary(),
          subscription_event_type: binary()
        }

  def subscription_event do
    schema(%{
      effective_date: spec(is_binary()),
      id: spec(is_binary()),
      plan_id: spec(is_binary()),
      subscription_event_type: spec(is_binary())
    })
    |> selection([:id, :subscription_event_type, :effective_date, :plan_id])
  end

  @type v1_bank_account_type :: binary()
  def v1_bank_account_type do
    spec(is_binary())
  end

  @type catalog_info_response_limits :: %{
          batch_delete_max_object_ids: integer(),
          batch_retrieve_max_object_ids: integer(),
          batch_upsert_max_objects_per_batch: integer(),
          batch_upsert_max_total_objects: integer(),
          search_max_page_limit: integer(),
          update_item_modifier_lists_max_item_ids: integer(),
          update_item_modifier_lists_max_modifier_lists_to_disable: integer(),
          update_item_modifier_lists_max_modifier_lists_to_enable: integer(),
          update_item_taxes_max_item_ids: integer(),
          update_item_taxes_max_taxes_to_disable: integer(),
          update_item_taxes_max_taxes_to_enable: integer()
        }

  def catalog_info_response_limits do
    schema(%{
      batch_delete_max_object_ids: spec(is_integer()),
      batch_retrieve_max_object_ids: spec(is_integer()),
      batch_upsert_max_objects_per_batch: spec(is_integer()),
      batch_upsert_max_total_objects: spec(is_integer()),
      search_max_page_limit: spec(is_integer()),
      update_item_modifier_lists_max_item_ids: spec(is_integer()),
      update_item_modifier_lists_max_modifier_lists_to_disable: spec(is_integer()),
      update_item_modifier_lists_max_modifier_lists_to_enable: spec(is_integer()),
      update_item_taxes_max_item_ids: spec(is_integer()),
      update_item_taxes_max_taxes_to_disable: spec(is_integer()),
      update_item_taxes_max_taxes_to_enable: spec(is_integer())
    })
    |> selection([])
  end

  @type retrieve_dispute_evidence_response :: %{
          errors: [SquareUp.Schema.error()],
          evidence: SquareUp.Schema.dispute_evidence()
        }

  def retrieve_dispute_evidence_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      evidence: Norm.Delegate.delegate(&SquareUp.Schema.dispute_evidence/0)
    })
    |> selection([])
  end

  @type loyalty_program_terminology :: %{one: binary(), other: binary()}

  def loyalty_program_terminology do
    schema(%{one: spec(is_binary()), other: spec(is_binary())})
    |> selection([:one, :other])
  end

  @type catalog_measurement_unit :: %{
          measurement_unit: SquareUp.Schema.measurement_unit(),
          precision: integer()
        }

  def catalog_measurement_unit do
    schema(%{
      measurement_unit: Norm.Delegate.delegate(&SquareUp.Schema.measurement_unit/0),
      precision: spec(is_integer())
    })
    |> selection([])
  end

  @type subscription_status :: binary()
  def subscription_status do
    spec(is_binary())
  end

  @type v1_modifier_list_selection_type :: binary()
  def v1_modifier_list_selection_type do
    spec(is_binary())
  end

  @type order_return_line_item :: %{
          applied_discounts: [SquareUp.Schema.order_line_item_applied_discount()],
          applied_taxes: [SquareUp.Schema.order_line_item_applied_tax()],
          base_price_money: SquareUp.Schema.money(),
          catalog_object_id: binary(),
          gross_return_money: SquareUp.Schema.money(),
          name: binary(),
          note: binary(),
          quantity: binary(),
          quantity_unit: SquareUp.Schema.order_quantity_unit(),
          return_modifiers: [SquareUp.Schema.order_return_line_item_modifier()],
          source_line_item_uid: binary(),
          total_discount_money: SquareUp.Schema.money(),
          total_money: SquareUp.Schema.money(),
          total_tax_money: SquareUp.Schema.money(),
          uid: binary(),
          variation_name: binary(),
          variation_total_price_money: SquareUp.Schema.money()
        }

  def order_return_line_item do
    schema(%{
      applied_discounts:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.order_line_item_applied_discount/0))),
      applied_taxes:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.order_line_item_applied_tax/0))),
      base_price_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      catalog_object_id: spec(is_binary()),
      gross_return_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      name: spec(is_binary()),
      note: spec(is_binary()),
      quantity: spec(is_binary()),
      quantity_unit: Norm.Delegate.delegate(&SquareUp.Schema.order_quantity_unit/0),
      return_modifiers:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.order_return_line_item_modifier/0))),
      source_line_item_uid: spec(is_binary()),
      total_discount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      total_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      total_tax_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      uid: spec(is_binary()),
      variation_name: spec(is_binary()),
      variation_total_price_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0)
    })
    |> selection([:quantity])
  end

  @type cancel_terminal_checkout_request :: %{}

  def cancel_terminal_checkout_request do
    schema(%{})
    |> selection([])
  end

  @type loyalty_program_reward_definition :: %{
          catalog_object_ids: [binary()],
          discount_type: binary(),
          fixed_discount_money: SquareUp.Schema.money(),
          max_discount_money: SquareUp.Schema.money(),
          percentage_discount: binary(),
          scope: binary()
        }

  def loyalty_program_reward_definition do
    schema(%{
      catalog_object_ids: spec(coll_of(spec(is_binary()))),
      discount_type: spec(is_binary()),
      fixed_discount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      max_discount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      percentage_discount: spec(is_binary()),
      scope: spec(is_binary())
    })
    |> selection([:scope, :discount_type])
  end

  @type charge_request_additional_recipient :: %{
          amount_money: SquareUp.Schema.money(),
          description: binary(),
          location_id: binary()
        }

  def charge_request_additional_recipient do
    schema(%{
      amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      description: spec(is_binary()),
      location_id: spec(is_binary())
    })
    |> selection([:location_id, :description, :amount_money])
  end

  @type catalog_query_items_for_modifier_list :: %{modifier_list_ids: [binary()]}

  def catalog_query_items_for_modifier_list do
    schema(%{modifier_list_ids: spec(coll_of(spec(is_binary())))})
    |> selection([:modifier_list_ids])
  end

  @type v1_list_timecard_events_response :: %{items: [SquareUp.Schema.v1_timecard_event()]}

  def v1_list_timecard_events_response do
    schema(%{items: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_timecard_event/0)))})
    |> selection([])
  end

  @type v1_retrieve_settlement_request :: %{}

  def v1_retrieve_settlement_request do
    schema(%{})
    |> selection([])
  end

  @type v1_delete_timecard_request :: %{}

  def v1_delete_timecard_request do
    schema(%{})
    |> selection([])
  end

  @type list_catalog_response :: %{
          cursor: binary(),
          errors: [SquareUp.Schema.error()],
          objects: [SquareUp.Schema.catalog_object()]
        }

  def list_catalog_response do
    schema(%{
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      objects: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.catalog_object/0)))
    })
    |> selection([])
  end

  @type list_customers_response :: %{
          cursor: binary(),
          customers: [SquareUp.Schema.customer()],
          errors: [SquareUp.Schema.error()]
        }

  def list_customers_response do
    schema(%{
      cursor: spec(is_binary()),
      customers: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.customer/0))),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type range :: %{max: binary(), min: binary()}

  def range do
    schema(%{max: spec(is_binary()), min: spec(is_binary())})
    |> selection([])
  end

  @type shift_filter_status :: binary()
  def shift_filter_status do
    spec(is_binary())
  end

  @type list_transactions_request :: %{
          begin_time: binary(),
          cursor: binary(),
          end_time: binary(),
          sort_order: binary()
        }

  def list_transactions_request do
    schema(%{
      begin_time: spec(is_binary()),
      cursor: spec(is_binary()),
      end_time: spec(is_binary()),
      sort_order: spec(is_binary())
    })
    |> selection([])
  end

  @type update_customer_response :: %{
          customer: SquareUp.Schema.customer(),
          errors: [SquareUp.Schema.error()]
        }

  def update_customer_response do
    schema(%{
      customer: Norm.Delegate.delegate(&SquareUp.Schema.customer/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type v1_list_fees_request :: %{}

  def v1_list_fees_request do
    schema(%{})
    |> selection([])
  end

  @type update_subscription_response :: %{
          errors: [SquareUp.Schema.error()],
          subscription: SquareUp.Schema.subscription()
        }

  def update_subscription_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      subscription: Norm.Delegate.delegate(&SquareUp.Schema.subscription/0)
    })
    |> selection([])
  end

  @type catalog_discount :: %{
          amount_money: SquareUp.Schema.money(),
          discount_type: binary(),
          label_color: binary(),
          modify_tax_basis: binary(),
          name: binary(),
          percentage: binary(),
          pin_required: boolean()
        }

  def catalog_discount do
    schema(%{
      amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      discount_type: spec(is_binary()),
      label_color: spec(is_binary()),
      modify_tax_basis: spec(is_binary()),
      name: spec(is_binary()),
      percentage: spec(is_binary()),
      pin_required: spec(is_boolean())
    })
    |> selection([])
  end

  @type v1_apply_modifier_list_request :: %{}

  def v1_apply_modifier_list_request do
    schema(%{})
    |> selection([])
  end

  @type retrieve_inventory_changes_response :: %{
          changes: [SquareUp.Schema.inventory_change()],
          cursor: binary(),
          errors: [SquareUp.Schema.error()]
        }

  def retrieve_inventory_changes_response do
    schema(%{
      changes: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.inventory_change/0))),
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type subscription :: %{
          canceled_date: binary(),
          card_id: binary(),
          created_at: binary(),
          customer_id: binary(),
          id: binary(),
          invoice_ids: [binary()],
          location_id: binary(),
          paid_until_date: binary(),
          plan_id: binary(),
          price_override_money: SquareUp.Schema.money(),
          start_date: binary(),
          status: binary(),
          tax_percentage: binary(),
          timezone: binary(),
          version: integer()
        }

  def subscription do
    schema(%{
      canceled_date: spec(is_binary()),
      card_id: spec(is_binary()),
      created_at: spec(is_binary()),
      customer_id: spec(is_binary()),
      id: spec(is_binary()),
      invoice_ids: spec(coll_of(spec(is_binary()))),
      location_id: spec(is_binary()),
      paid_until_date: spec(is_binary()),
      plan_id: spec(is_binary()),
      price_override_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      start_date: spec(is_binary()),
      status: spec(is_binary()),
      tax_percentage: spec(is_binary()),
      timezone: spec(is_binary()),
      version: spec(is_integer())
    })
    |> selection([])
  end

  @type get_invoice_response :: %{
          errors: [SquareUp.Schema.error()],
          invoice: SquareUp.Schema.invoice()
        }

  def get_invoice_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      invoice: Norm.Delegate.delegate(&SquareUp.Schema.invoice/0)
    })
    |> selection([])
  end

  @type loyalty_event_other :: %{loyalty_program_id: binary(), points: integer()}

  def loyalty_event_other do
    schema(%{loyalty_program_id: spec(is_binary()), points: spec(is_integer())})
    |> selection([:loyalty_program_id, :points])
  end

  @type inventory_count :: %{
          calculated_at: binary(),
          catalog_object_id: binary(),
          catalog_object_type: binary(),
          location_id: binary(),
          quantity: binary(),
          state: binary()
        }

  def inventory_count do
    schema(%{
      calculated_at: spec(is_binary()),
      catalog_object_id: spec(is_binary()),
      catalog_object_type: spec(is_binary()),
      location_id: spec(is_binary()),
      quantity: spec(is_binary()),
      state: spec(is_binary())
    })
    |> selection([])
  end

  @type pay_order_request :: %{
          idempotency_key: binary(),
          order_version: integer(),
          payment_ids: [binary()]
        }

  def pay_order_request do
    schema(%{
      idempotency_key: spec(is_binary()),
      order_version: spec(is_integer()),
      payment_ids: spec(coll_of(spec(is_binary())))
    })
    |> selection([:idempotency_key])
  end

  @type retrieve_loyalty_account_request :: %{}

  def retrieve_loyalty_account_request do
    schema(%{})
    |> selection([])
  end

  @type catalog_product_set :: %{
          all_products: boolean(),
          name: binary(),
          product_ids_all: [binary()],
          product_ids_any: [binary()],
          quantity_exact: integer(),
          quantity_max: integer(),
          quantity_min: integer()
        }

  def catalog_product_set do
    schema(%{
      all_products: spec(is_boolean()),
      name: spec(is_binary()),
      product_ids_all: spec(coll_of(spec(is_binary()))),
      product_ids_any: spec(coll_of(spec(is_binary()))),
      quantity_exact: spec(is_integer()),
      quantity_max: spec(is_integer()),
      quantity_min: spec(is_integer())
    })
    |> selection([])
  end

  @type list_device_codes_request :: %{
          cursor: binary(),
          location_id: binary(),
          product_type: binary()
        }

  def list_device_codes_request do
    schema(%{
      cursor: spec(is_binary()),
      location_id: spec(is_binary()),
      product_type: spec(is_binary())
    })
    |> selection([])
  end

  @type shift_filter :: %{
          employee_ids: [binary()],
          end: SquareUp.Schema.time_range(),
          location_ids: [binary()],
          start: SquareUp.Schema.time_range(),
          status: binary(),
          team_member_ids: [binary()],
          workday: SquareUp.Schema.shift_workday()
        }

  def shift_filter do
    schema(%{
      employee_ids: spec(coll_of(spec(is_binary()))),
      end: Norm.Delegate.delegate(&SquareUp.Schema.time_range/0),
      location_ids: spec(coll_of(spec(is_binary()))),
      start: Norm.Delegate.delegate(&SquareUp.Schema.time_range/0),
      status: spec(is_binary()),
      team_member_ids: spec(coll_of(spec(is_binary()))),
      workday: Norm.Delegate.delegate(&SquareUp.Schema.shift_workday/0)
    })
    |> selection([:location_ids, :team_member_ids])
  end

  @type v1_create_item_request :: %{body: SquareUp.Schema.v1_item()}

  def v1_create_item_request do
    schema(%{body: Norm.Delegate.delegate(&SquareUp.Schema.v1_item/0)})
    |> selection([])
  end

  @type list_cash_drawer_shift_events_request :: %{
          cursor: binary(),
          limit: integer(),
          location_id: binary()
        }

  def list_cash_drawer_shift_events_request do
    schema(%{cursor: spec(is_binary()), limit: spec(is_integer()), location_id: spec(is_binary())})
    |> selection([:location_id])
  end

  @type inventory_state :: binary()
  def inventory_state do
    spec(is_binary())
  end

  @type update_wage_setting_request :: %{wage_setting: SquareUp.Schema.wage_setting()}

  def update_wage_setting_request do
    schema(%{wage_setting: Norm.Delegate.delegate(&SquareUp.Schema.wage_setting/0)})
    |> selection([:wage_setting])
  end

  @type order_fulfillment_pickup_details_curbside_pickup_details :: %{
          buyer_arrived_at: binary(),
          curbside_details: binary()
        }

  def order_fulfillment_pickup_details_curbside_pickup_details do
    schema(%{buyer_arrived_at: spec(is_binary()), curbside_details: spec(is_binary())})
    |> selection([])
  end

  @type v1_list_cash_drawer_shifts_response :: %{items: [SquareUp.Schema.v1_cash_drawer_shift()]}

  def v1_list_cash_drawer_shifts_response do
    schema(%{
      items: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_cash_drawer_shift/0)))
    })
    |> selection([])
  end

  @type batch_upsert_catalog_objects_response :: %{
          errors: [SquareUp.Schema.error()],
          id_mappings: [SquareUp.Schema.catalog_id_mapping()],
          objects: [SquareUp.Schema.catalog_object()],
          updated_at: binary()
        }

  def batch_upsert_catalog_objects_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      id_mappings: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.catalog_id_mapping/0))),
      objects: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.catalog_object/0))),
      updated_at: spec(is_binary())
    })
    |> selection([])
  end

  @type create_terminal_checkout_request :: %{
          checkout: SquareUp.Schema.terminal_checkout(),
          idempotency_key: binary()
        }

  def create_terminal_checkout_request do
    schema(%{
      checkout: Norm.Delegate.delegate(&SquareUp.Schema.terminal_checkout/0),
      idempotency_key: spec(is_binary())
    })
    |> selection([:idempotency_key, :checkout])
  end

  @type v1_list_refunds_response :: %{items: [SquareUp.Schema.v1_refund()]}

  def v1_list_refunds_response do
    schema(%{items: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_refund/0)))})
    |> selection([])
  end

  @type tax_calculation_phase :: binary()
  def tax_calculation_phase do
    spec(is_binary())
  end

  @type v1_list_locations_request :: %{}

  def v1_list_locations_request do
    schema(%{})
    |> selection([])
  end

  @type shift_workday_matcher :: binary()
  def shift_workday_matcher do
    spec(is_binary())
  end

  @type order_updated_object :: %{order_updated: SquareUp.Schema.order_updated()}

  def order_updated_object do
    schema(%{order_updated: Norm.Delegate.delegate(&SquareUp.Schema.order_updated/0)})
    |> selection([])
  end

  @type v1_discount_color :: binary()
  def v1_discount_color do
    spec(is_binary())
  end

  @type device_details :: %{device_id: binary(), device_name: binary()}

  def device_details do
    schema(%{device_id: spec(is_binary()), device_name: spec(is_binary())})
    |> selection([])
  end

  @type loyalty_account_mapping :: %{
          created_at: binary(),
          id: binary(),
          type: binary(),
          value: binary()
        }

  def loyalty_account_mapping do
    schema(%{
      created_at: spec(is_binary()),
      id: spec(is_binary()),
      type: spec(is_binary()),
      value: spec(is_binary())
    })
    |> selection([:type, :value])
  end

  @type list_merchants_response :: %{
          cursor: integer(),
          errors: [SquareUp.Schema.error()],
          merchant: [SquareUp.Schema.merchant()]
        }

  def list_merchants_response do
    schema(%{
      cursor: spec(is_integer()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      merchant: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.merchant/0)))
    })
    |> selection([])
  end

  @type device_code_status :: binary()
  def device_code_status do
    spec(is_binary())
  end

  @type order_fulfillment_type :: binary()
  def order_fulfillment_type do
    spec(is_binary())
  end

  @type create_break_type_request :: %{
          break_type: SquareUp.Schema.break_type(),
          idempotency_key: binary()
        }

  def create_break_type_request do
    schema(%{
      break_type: Norm.Delegate.delegate(&SquareUp.Schema.break_type/0),
      idempotency_key: spec(is_binary())
    })
    |> selection([:break_type])
  end

  @type update_break_type_response :: %{
          break_type: SquareUp.Schema.break_type(),
          errors: [SquareUp.Schema.error()]
        }

  def update_break_type_response do
    schema(%{
      break_type: Norm.Delegate.delegate(&SquareUp.Schema.break_type/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type order_fulfillment_recipient :: %{
          address: SquareUp.Schema.address(),
          customer_id: binary(),
          display_name: binary(),
          email_address: binary(),
          phone_number: binary()
        }

  def order_fulfillment_recipient do
    schema(%{
      address: Norm.Delegate.delegate(&SquareUp.Schema.address/0),
      customer_id: spec(is_binary()),
      display_name: spec(is_binary()),
      email_address: spec(is_binary()),
      phone_number: spec(is_binary())
    })
    |> selection([])
  end

  @type refund_status :: binary()
  def refund_status do
    spec(is_binary())
  end

  @type delete_loyalty_reward_response :: %{errors: [SquareUp.Schema.error()]}

  def delete_loyalty_reward_response do
    schema(%{errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))})
    |> selection([])
  end

  @type loyalty_program_reward_tier :: %{
          created_at: binary(),
          definition: SquareUp.Schema.loyalty_program_reward_definition(),
          id: binary(),
          name: binary(),
          points: integer()
        }

  def loyalty_program_reward_tier do
    schema(%{
      created_at: spec(is_binary()),
      definition: Norm.Delegate.delegate(&SquareUp.Schema.loyalty_program_reward_definition/0),
      id: spec(is_binary()),
      name: spec(is_binary()),
      points: spec(is_integer())
    })
    |> selection([:id, :points, :name, :definition, :created_at])
  end

  @type order_line_item_tax_type :: binary()
  def order_line_item_tax_type do
    spec(is_binary())
  end

  @type order_fulfillment_updated :: %{
          created_at: binary(),
          fulfillment_update: [SquareUp.Schema.order_fulfillment_updated_update()],
          location_id: binary(),
          order_id: binary(),
          state: binary(),
          updated_at: binary(),
          version: integer()
        }

  def order_fulfillment_updated do
    schema(%{
      created_at: spec(is_binary()),
      fulfillment_update:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.order_fulfillment_updated_update/0))),
      location_id: spec(is_binary()),
      order_id: spec(is_binary()),
      state: spec(is_binary()),
      updated_at: spec(is_binary()),
      version: spec(is_integer())
    })
    |> selection([])
  end

  @type balance_payment_details :: %{account_id: binary(), status: binary()}

  def balance_payment_details do
    schema(%{account_id: spec(is_binary()), status: spec(is_binary())})
    |> selection([])
  end

  @type v1_employee_status :: binary()
  def v1_employee_status do
    spec(is_binary())
  end

  @type create_customer_group_request :: %{
          group: SquareUp.Schema.customer_group(),
          idempotency_key: binary()
        }

  def create_customer_group_request do
    schema(%{
      group: Norm.Delegate.delegate(&SquareUp.Schema.customer_group/0),
      idempotency_key: spec(is_binary())
    })
    |> selection([:group])
  end

  @type catalog_query :: %{
          exact_query: SquareUp.Schema.catalog_query_exact(),
          item_variations_for_item_option_values_query:
            SquareUp.Schema.catalog_query_item_variations_for_item_option_values(),
          items_for_item_options_query: SquareUp.Schema.catalog_query_items_for_item_options(),
          items_for_modifier_list_query: SquareUp.Schema.catalog_query_items_for_modifier_list(),
          items_for_tax_query: SquareUp.Schema.catalog_query_items_for_tax(),
          prefix_query: SquareUp.Schema.catalog_query_prefix(),
          range_query: SquareUp.Schema.catalog_query_range(),
          sorted_attribute_query: SquareUp.Schema.catalog_query_sorted_attribute(),
          text_query: SquareUp.Schema.catalog_query_text()
        }

  def catalog_query do
    schema(%{
      exact_query: Norm.Delegate.delegate(&SquareUp.Schema.catalog_query_exact/0),
      item_variations_for_item_option_values_query:
        Norm.Delegate.delegate(
          &SquareUp.Schema.catalog_query_item_variations_for_item_option_values/0
        ),
      items_for_item_options_query:
        Norm.Delegate.delegate(&SquareUp.Schema.catalog_query_items_for_item_options/0),
      items_for_modifier_list_query:
        Norm.Delegate.delegate(&SquareUp.Schema.catalog_query_items_for_modifier_list/0),
      items_for_tax_query: Norm.Delegate.delegate(&SquareUp.Schema.catalog_query_items_for_tax/0),
      prefix_query: Norm.Delegate.delegate(&SquareUp.Schema.catalog_query_prefix/0),
      range_query: Norm.Delegate.delegate(&SquareUp.Schema.catalog_query_range/0),
      sorted_attribute_query:
        Norm.Delegate.delegate(&SquareUp.Schema.catalog_query_sorted_attribute/0),
      text_query: Norm.Delegate.delegate(&SquareUp.Schema.catalog_query_text/0)
    })
    |> selection([])
  end

  @type v1_payment_modifier :: %{
          applied_money: SquareUp.Schema.v1_money(),
          modifier_option_id: binary(),
          name: binary()
        }

  def v1_payment_modifier do
    schema(%{
      applied_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      modifier_option_id: spec(is_binary()),
      name: spec(is_binary())
    })
    |> selection([])
  end

  @type payment_options :: %{autocomplete: boolean()}

  def payment_options do
    schema(%{autocomplete: spec(is_boolean())})
    |> selection([])
  end

  @type v1_update_fee_request :: %{body: SquareUp.Schema.v1_fee()}

  def v1_update_fee_request do
    schema(%{body: Norm.Delegate.delegate(&SquareUp.Schema.v1_fee/0)})
    |> selection([:body])
  end

  @type catalog_pricing_rule :: %{
          apply_products_id: binary(),
          discount_id: binary(),
          exclude_products_id: binary(),
          exclude_strategy: binary(),
          match_products_id: binary(),
          name: binary(),
          time_period_ids: [binary()],
          valid_from_date: binary(),
          valid_from_local_time: binary(),
          valid_until_date: binary(),
          valid_until_local_time: binary()
        }

  def catalog_pricing_rule do
    schema(%{
      apply_products_id: spec(is_binary()),
      discount_id: spec(is_binary()),
      exclude_products_id: spec(is_binary()),
      exclude_strategy: spec(is_binary()),
      match_products_id: spec(is_binary()),
      name: spec(is_binary()),
      time_period_ids: spec(coll_of(spec(is_binary()))),
      valid_from_date: spec(is_binary()),
      valid_from_local_time: spec(is_binary()),
      valid_until_date: spec(is_binary()),
      valid_until_local_time: spec(is_binary())
    })
    |> selection([])
  end

  @type search_catalog_objects_response :: %{
          cursor: binary(),
          errors: [SquareUp.Schema.error()],
          latest_time: binary(),
          objects: [SquareUp.Schema.catalog_object()],
          related_objects: [SquareUp.Schema.catalog_object()]
        }

  def search_catalog_objects_response do
    schema(%{
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      latest_time: spec(is_binary()),
      objects: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.catalog_object/0))),
      related_objects: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.catalog_object/0)))
    })
    |> selection([])
  end

  @type search_loyalty_accounts_request :: %{
          cursor: binary(),
          limit: integer(),
          query: SquareUp.Schema.search_loyalty_accounts_request_loyalty_account_query()
        }

  def search_loyalty_accounts_request do
    schema(%{
      cursor: spec(is_binary()),
      limit: spec(is_integer()),
      query:
        Norm.Delegate.delegate(
          &SquareUp.Schema.search_loyalty_accounts_request_loyalty_account_query/0
        )
    })
    |> selection([])
  end

  @type batch_change_inventory_response :: %{
          counts: [SquareUp.Schema.inventory_count()],
          errors: [SquareUp.Schema.error()]
        }

  def batch_change_inventory_response do
    schema(%{
      counts: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.inventory_count/0))),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type search_orders_request :: %{
          cursor: binary(),
          limit: integer(),
          location_ids: [binary()],
          query: SquareUp.Schema.search_orders_query(),
          return_entries: boolean()
        }

  def search_orders_request do
    schema(%{
      cursor: spec(is_binary()),
      limit: spec(is_integer()),
      location_ids: spec(coll_of(spec(is_binary()))),
      query: Norm.Delegate.delegate(&SquareUp.Schema.search_orders_query/0),
      return_entries: spec(is_boolean())
    })
    |> selection([])
  end

  @type get_team_member_wage_request :: %{}

  def get_team_member_wage_request do
    schema(%{})
    |> selection([])
  end

  @type product :: binary()
  def product do
    spec(is_binary())
  end

  @type retrieve_dispute_evidence_request :: %{}

  def retrieve_dispute_evidence_request do
    schema(%{})
    |> selection([])
  end

  @type search_subscriptions_query :: %{filter: SquareUp.Schema.search_subscriptions_filter()}

  def search_subscriptions_query do
    schema(%{filter: Norm.Delegate.delegate(&SquareUp.Schema.search_subscriptions_filter/0)})
    |> selection([])
  end

  @type merchant_status :: binary()
  def merchant_status do
    spec(is_binary())
  end

  @type country :: binary()
  def country do
    spec(is_binary())
  end

  @type team_member_status :: binary()
  def team_member_status do
    spec(is_binary())
  end

  @type create_refund_request :: %{
          amount_money: SquareUp.Schema.money(),
          idempotency_key: binary(),
          reason: binary(),
          tender_id: binary()
        }

  def create_refund_request do
    schema(%{
      amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      idempotency_key: spec(is_binary()),
      reason: spec(is_binary()),
      tender_id: spec(is_binary())
    })
    |> selection([:idempotency_key, :tender_id, :amount_money])
  end

  @type search_terminal_checkouts_request :: %{
          cursor: binary(),
          limit: integer(),
          query: SquareUp.Schema.terminal_checkout_query()
        }

  def search_terminal_checkouts_request do
    schema(%{
      cursor: spec(is_binary()),
      limit: spec(is_integer()),
      query: Norm.Delegate.delegate(&SquareUp.Schema.terminal_checkout_query/0)
    })
    |> selection([])
  end

  @type inventory_change_type :: binary()
  def inventory_change_type do
    spec(is_binary())
  end

  @type date_range :: %{end_date: binary(), start_date: binary()}

  def date_range do
    schema(%{end_date: spec(is_binary()), start_date: spec(is_binary())})
    |> selection([])
  end

  @type list_invoices_response :: %{
          cursor: binary(),
          errors: [SquareUp.Schema.error()],
          invoices: [SquareUp.Schema.invoice()]
        }

  def list_invoices_response do
    schema(%{
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      invoices: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.invoice/0)))
    })
    |> selection([])
  end

  @type create_loyalty_reward_response :: %{
          errors: [SquareUp.Schema.error()],
          reward: SquareUp.Schema.loyalty_reward()
        }

  def create_loyalty_reward_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      reward: Norm.Delegate.delegate(&SquareUp.Schema.loyalty_reward/0)
    })
    |> selection([])
  end

  @type create_catalog_image_request :: %{
          idempotency_key: binary(),
          image: SquareUp.Schema.catalog_object(),
          object_id: binary()
        }

  def create_catalog_image_request do
    schema(%{
      idempotency_key: spec(is_binary()),
      image: Norm.Delegate.delegate(&SquareUp.Schema.catalog_object/0),
      object_id: spec(is_binary())
    })
    |> selection([:idempotency_key])
  end

  @type v1_list_payments_request :: %{
          batch_token: binary(),
          begin_time: binary(),
          end_time: binary(),
          include_partial: boolean(),
          limit: integer(),
          order: binary()
        }

  def v1_list_payments_request do
    schema(%{
      batch_token: spec(is_binary()),
      begin_time: spec(is_binary()),
      end_time: spec(is_binary()),
      include_partial: spec(is_boolean()),
      limit: spec(is_integer()),
      order: spec(is_binary())
    })
    |> selection([])
  end

  @type create_mobile_authorization_code_request :: %{location_id: binary()}

  def create_mobile_authorization_code_request do
    schema(%{location_id: spec(is_binary())})
    |> selection([])
  end

  @type catalog_modifier :: %{
          modifier_list_id: binary(),
          name: binary(),
          ordinal: integer(),
          price_money: SquareUp.Schema.money()
        }

  def catalog_modifier do
    schema(%{
      modifier_list_id: spec(is_binary()),
      name: spec(is_binary()),
      ordinal: spec(is_integer()),
      price_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0)
    })
    |> selection([])
  end

  @type order_return_discount :: %{
          amount_money: SquareUp.Schema.money(),
          applied_money: SquareUp.Schema.money(),
          catalog_object_id: binary(),
          name: binary(),
          percentage: binary(),
          scope: binary(),
          source_discount_uid: binary(),
          type: binary(),
          uid: binary()
        }

  def order_return_discount do
    schema(%{
      amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      applied_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      catalog_object_id: spec(is_binary()),
      name: spec(is_binary()),
      percentage: spec(is_binary()),
      scope: spec(is_binary()),
      source_discount_uid: spec(is_binary()),
      type: spec(is_binary()),
      uid: spec(is_binary())
    })
    |> selection([])
  end

  @type retrieve_dispute_request :: %{}

  def retrieve_dispute_request do
    schema(%{})
    |> selection([])
  end

  @type list_customer_groups_request :: %{cursor: binary()}

  def list_customer_groups_request do
    schema(%{cursor: spec(is_binary())})
    |> selection([])
  end

  @type v1_order_history_entry :: %{action: binary(), created_at: binary()}

  def v1_order_history_entry do
    schema(%{action: spec(is_binary()), created_at: spec(is_binary())})
    |> selection([])
  end

  @type search_orders_query :: %{
          filter: SquareUp.Schema.search_orders_filter(),
          sort: SquareUp.Schema.search_orders_sort()
        }

  def search_orders_query do
    schema(%{
      filter: Norm.Delegate.delegate(&SquareUp.Schema.search_orders_filter/0),
      sort: Norm.Delegate.delegate(&SquareUp.Schema.search_orders_sort/0)
    })
    |> selection([])
  end

  @type void_transaction_request :: %{}

  def void_transaction_request do
    schema(%{})
    |> selection([])
  end

  @type bank_account_type :: binary()
  def bank_account_type do
    spec(is_binary())
  end

  @type order_money_amounts :: %{
          discount_money: SquareUp.Schema.money(),
          service_charge_money: SquareUp.Schema.money(),
          tax_money: SquareUp.Schema.money(),
          tip_money: SquareUp.Schema.money(),
          total_money: SquareUp.Schema.money()
        }

  def order_money_amounts do
    schema(%{
      discount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      service_charge_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      tax_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      tip_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      total_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0)
    })
    |> selection([])
  end

  @type list_customer_segments_response :: %{
          cursor: binary(),
          errors: [SquareUp.Schema.error()],
          segments: [SquareUp.Schema.customer_segment()]
        }

  def list_customer_segments_response do
    schema(%{
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      segments: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.customer_segment/0)))
    })
    |> selection([])
  end

  @type bank_account_status :: binary()
  def bank_account_status do
    spec(is_binary())
  end

  @type measurement_unit_weight :: binary()
  def measurement_unit_weight do
    spec(is_binary())
  end

  @type retrieve_team_member_request :: %{}

  def retrieve_team_member_request do
    schema(%{})
    |> selection([])
  end

  @type retrieve_loyalty_reward_request :: %{}

  def retrieve_loyalty_reward_request do
    schema(%{})
    |> selection([])
  end

  @type catalog_subscription_plan :: %{
          name: binary(),
          phases: [SquareUp.Schema.subscription_phase()]
        }

  def catalog_subscription_plan do
    schema(%{
      name: spec(is_binary()),
      phases: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.subscription_phase/0)))
    })
    |> selection([])
  end

  @type loyalty_program_accrual_rule :: %{
          accrual_type: binary(),
          catalog_object_id: binary(),
          points: integer(),
          spend_amount_money: SquareUp.Schema.money(),
          visit_minimum_amount_money: SquareUp.Schema.money()
        }

  def loyalty_program_accrual_rule do
    schema(%{
      accrual_type: spec(is_binary()),
      catalog_object_id: spec(is_binary()),
      points: spec(is_integer()),
      spend_amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      visit_minimum_amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0)
    })
    |> selection([:accrual_type])
  end

  @type v1_order :: %{
          btc_price_satoshi: number(),
          btc_receive_address: binary(),
          buyer_email: binary(),
          buyer_note: binary(),
          canceled_note: binary(),
          completed_note: binary(),
          created_at: binary(),
          errors: [SquareUp.Schema.error()],
          expires_at: binary(),
          id: binary(),
          order_history: [SquareUp.Schema.v1_order_history_entry()],
          payment_id: binary(),
          promo_code: binary(),
          recipient_name: binary(),
          recipient_phone_number: binary(),
          refunded_note: binary(),
          shipping_address: SquareUp.Schema.address(),
          state: binary(),
          subtotal_money: SquareUp.Schema.v1_money(),
          tender: SquareUp.Schema.v1_tender(),
          total_discount_money: SquareUp.Schema.v1_money(),
          total_price_money: SquareUp.Schema.v1_money(),
          total_shipping_money: SquareUp.Schema.v1_money(),
          total_tax_money: SquareUp.Schema.v1_money(),
          updated_at: binary()
        }

  def v1_order do
    schema(%{
      btc_price_satoshi: spec(is_number()),
      btc_receive_address: spec(is_binary()),
      buyer_email: spec(is_binary()),
      buyer_note: spec(is_binary()),
      canceled_note: spec(is_binary()),
      completed_note: spec(is_binary()),
      created_at: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      expires_at: spec(is_binary()),
      id: spec(is_binary()),
      order_history:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_order_history_entry/0))),
      payment_id: spec(is_binary()),
      promo_code: spec(is_binary()),
      recipient_name: spec(is_binary()),
      recipient_phone_number: spec(is_binary()),
      refunded_note: spec(is_binary()),
      shipping_address: Norm.Delegate.delegate(&SquareUp.Schema.address/0),
      state: spec(is_binary()),
      subtotal_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      tender: Norm.Delegate.delegate(&SquareUp.Schema.v1_tender/0),
      total_discount_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      total_price_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      total_shipping_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      total_tax_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      updated_at: spec(is_binary())
    })
    |> selection([])
  end

  @type loyalty_event_loyalty_account_filter :: %{loyalty_account_id: binary()}

  def loyalty_event_loyalty_account_filter do
    schema(%{loyalty_account_id: spec(is_binary())})
    |> selection([:loyalty_account_id])
  end

  @type v1_delete_page_request :: %{}

  def v1_delete_page_request do
    schema(%{})
    |> selection([])
  end

  @type v1_page_cell :: %{
          column: integer(),
          object_id: binary(),
          object_type: binary(),
          page_id: binary(),
          placeholder_type: binary(),
          row: integer()
        }

  def v1_page_cell do
    schema(%{
      column: spec(is_integer()),
      object_id: spec(is_binary()),
      object_type: spec(is_binary()),
      page_id: spec(is_binary()),
      placeholder_type: spec(is_binary()),
      row: spec(is_integer())
    })
    |> selection([])
  end

  @type catalog_item_option_value_for_item_variation :: %{
          item_option_id: binary(),
          item_option_value_id: binary()
        }

  def catalog_item_option_value_for_item_variation do
    schema(%{item_option_id: spec(is_binary()), item_option_value_id: spec(is_binary())})
    |> selection([])
  end

  @type v1_modifier_option :: %{
          id: binary(),
          modifier_list_id: binary(),
          name: binary(),
          on_by_default: boolean(),
          ordinal: integer(),
          price_money: SquareUp.Schema.v1_money(),
          v2_id: binary()
        }

  def v1_modifier_option do
    schema(%{
      id: spec(is_binary()),
      modifier_list_id: spec(is_binary()),
      name: spec(is_binary()),
      on_by_default: spec(is_boolean()),
      ordinal: spec(is_integer()),
      price_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      v2_id: spec(is_binary())
    })
    |> selection([])
  end

  @type search_loyalty_events_request :: %{
          cursor: binary(),
          limit: integer(),
          query: SquareUp.Schema.loyalty_event_query()
        }

  def search_loyalty_events_request do
    schema(%{
      cursor: spec(is_binary()),
      limit: spec(is_integer()),
      query: Norm.Delegate.delegate(&SquareUp.Schema.loyalty_event_query/0)
    })
    |> selection([])
  end

  @type v1_list_pages_request :: %{}

  def v1_list_pages_request do
    schema(%{})
    |> selection([])
  end

  @type catalog_item_option_value :: %{
          color: binary(),
          description: binary(),
          item_option_id: binary(),
          item_variation_count: integer(),
          name: binary(),
          ordinal: integer()
        }

  def catalog_item_option_value do
    schema(%{
      color: spec(is_binary()),
      description: spec(is_binary()),
      item_option_id: spec(is_binary()),
      item_variation_count: spec(is_integer()),
      name: spec(is_binary()),
      ordinal: spec(is_integer())
    })
    |> selection([])
  end

  @type v1_list_inventory_response :: %{items: [SquareUp.Schema.v1_inventory_entry()]}

  def v1_list_inventory_response do
    schema(%{items: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_inventory_entry/0)))})
    |> selection([])
  end

  @type create_subscription_request :: %{
          canceled_date: binary(),
          card_id: binary(),
          customer_id: binary(),
          idempotency_key: binary(),
          location_id: binary(),
          plan_id: binary(),
          price_override_money: SquareUp.Schema.money(),
          start_date: binary(),
          tax_percentage: binary(),
          timezone: binary()
        }

  def create_subscription_request do
    schema(%{
      canceled_date: spec(is_binary()),
      card_id: spec(is_binary()),
      customer_id: spec(is_binary()),
      idempotency_key: spec(is_binary()),
      location_id: spec(is_binary()),
      plan_id: spec(is_binary()),
      price_override_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      start_date: spec(is_binary()),
      tax_percentage: spec(is_binary()),
      timezone: spec(is_binary())
    })
    |> selection([:idempotency_key, :location_id, :plan_id, :customer_id])
  end

  @type catalog_modifier_list_selection_type :: binary()
  def catalog_modifier_list_selection_type do
    spec(is_binary())
  end

  @type delete_loyalty_reward_request :: %{}

  def delete_loyalty_reward_request do
    schema(%{})
    |> selection([])
  end

  @type delete_customer_group_response :: %{errors: [SquareUp.Schema.error()]}

  def delete_customer_group_response do
    schema(%{errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))})
    |> selection([])
  end

  @type create_dispute_evidence_file_request :: %{
          content_type: binary(),
          evidence_type: binary(),
          idempotency_key: binary()
        }

  def create_dispute_evidence_file_request do
    schema(%{
      content_type: spec(is_binary()),
      evidence_type: spec(is_binary()),
      idempotency_key: spec(is_binary())
    })
    |> selection([:idempotency_key])
  end

  @type obtain_token_request :: %{
          client_id: binary(),
          client_secret: binary(),
          code: binary(),
          grant_type: binary(),
          migration_token: binary(),
          redirect_uri: binary(),
          refresh_token: binary()
        }

  def obtain_token_request do
    schema(%{
      client_id: spec(is_binary()),
      client_secret: spec(is_binary()),
      code: spec(is_binary()),
      grant_type: spec(is_binary()),
      migration_token: spec(is_binary()),
      redirect_uri: spec(is_binary()),
      refresh_token: spec(is_binary())
    })
    |> selection([:client_id, :client_secret, :grant_type])
  end

  @type customer_sort_field :: binary()
  def customer_sort_field do
    spec(is_binary())
  end

  @type loyalty_event_delete_reward :: %{
          loyalty_program_id: binary(),
          points: integer(),
          reward_id: binary()
        }

  def loyalty_event_delete_reward do
    schema(%{
      loyalty_program_id: spec(is_binary()),
      points: spec(is_integer()),
      reward_id: spec(is_binary())
    })
    |> selection([:loyalty_program_id, :points])
  end

  @type submit_evidence_request :: %{}

  def submit_evidence_request do
    schema(%{})
    |> selection([])
  end

  @type shift_workday :: %{
          date_range: SquareUp.Schema.date_range(),
          default_timezone: binary(),
          match_shifts_by: binary()
        }

  def shift_workday do
    schema(%{
      date_range: Norm.Delegate.delegate(&SquareUp.Schema.date_range/0),
      default_timezone: spec(is_binary()),
      match_shifts_by: spec(is_binary())
    })
    |> selection([])
  end

  @type shift :: %{
          breaks: [SquareUp.Schema.break()],
          created_at: binary(),
          employee_id: binary(),
          end_at: binary(),
          id: binary(),
          location_id: binary(),
          start_at: binary(),
          status: binary(),
          team_member_id: binary(),
          timezone: binary(),
          updated_at: binary(),
          version: integer(),
          wage: SquareUp.Schema.shift_wage()
        }

  def shift do
    schema(%{
      breaks: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.break/0))),
      created_at: spec(is_binary()),
      employee_id: spec(is_binary()),
      end_at: spec(is_binary()),
      id: spec(is_binary()),
      location_id: spec(is_binary()),
      start_at: spec(is_binary()),
      status: spec(is_binary()),
      team_member_id: spec(is_binary()),
      timezone: spec(is_binary()),
      updated_at: spec(is_binary()),
      version: spec(is_integer()),
      wage: Norm.Delegate.delegate(&SquareUp.Schema.shift_wage/0)
    })
    |> selection([:start_at])
  end

  @type card_prepaid_type :: binary()
  def card_prepaid_type do
    spec(is_binary())
  end

  @type list_cash_drawer_shifts_response :: %{
          cursor: binary(),
          errors: [SquareUp.Schema.error()],
          items: [SquareUp.Schema.cash_drawer_shift_summary()]
        }

  def list_cash_drawer_shifts_response do
    schema(%{
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      items: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.cash_drawer_shift_summary/0)))
    })
    |> selection([])
  end

  @type v1_fee_adjustment_type :: binary()
  def v1_fee_adjustment_type do
    spec(is_binary())
  end

  @type v1_list_modifier_lists_response :: %{items: [SquareUp.Schema.v1_modifier_list()]}

  def v1_list_modifier_lists_response do
    schema(%{items: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_modifier_list/0)))})
    |> selection([])
  end

  @type retrieve_wage_setting_request :: %{}

  def retrieve_wage_setting_request do
    schema(%{})
    |> selection([])
  end

  @type cancel_terminal_checkout_response :: %{
          checkout: SquareUp.Schema.terminal_checkout(),
          errors: [SquareUp.Schema.error()]
        }

  def cancel_terminal_checkout_response do
    schema(%{
      checkout: Norm.Delegate.delegate(&SquareUp.Schema.terminal_checkout/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type list_refunds_request :: %{
          begin_time: binary(),
          cursor: binary(),
          end_time: binary(),
          sort_order: binary()
        }

  def list_refunds_request do
    schema(%{
      begin_time: spec(is_binary()),
      cursor: spec(is_binary()),
      end_time: spec(is_binary()),
      sort_order: spec(is_binary())
    })
    |> selection([])
  end

  @type order_pricing_options :: %{auto_apply_discounts: boolean()}

  def order_pricing_options do
    schema(%{auto_apply_discounts: spec(is_boolean())})
    |> selection([])
  end

  @type v1_refund_type :: binary()
  def v1_refund_type do
    spec(is_binary())
  end

  @type tender_card_details :: %{
          card: SquareUp.Schema.card(),
          entry_method: binary(),
          status: binary()
        }

  def tender_card_details do
    schema(%{
      card: Norm.Delegate.delegate(&SquareUp.Schema.card/0),
      entry_method: spec(is_binary()),
      status: spec(is_binary())
    })
    |> selection([])
  end

  @type get_employee_wage_response :: %{
          employee_wage: SquareUp.Schema.employee_wage(),
          errors: [SquareUp.Schema.error()]
        }

  def get_employee_wage_response do
    schema(%{
      employee_wage: Norm.Delegate.delegate(&SquareUp.Schema.employee_wage/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type catalog_modifier_override :: %{modifier_id: binary(), on_by_default: boolean()}

  def catalog_modifier_override do
    schema(%{modifier_id: spec(is_binary()), on_by_default: spec(is_boolean())})
    |> selection([:modifier_id])
  end

  @type v1_update_employee_role_request :: %{body: SquareUp.Schema.v1_employee_role()}

  def v1_update_employee_role_request do
    schema(%{body: Norm.Delegate.delegate(&SquareUp.Schema.v1_employee_role/0)})
    |> selection([:body])
  end

  @type delete_customer_card_response :: %{errors: [SquareUp.Schema.error()]}

  def delete_customer_card_response do
    schema(%{errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))})
    |> selection([])
  end

  @type address :: %{
          address_line_1: binary(),
          address_line_2: binary(),
          address_line_3: binary(),
          administrative_district_level_1: binary(),
          administrative_district_level_2: binary(),
          administrative_district_level_3: binary(),
          country: binary(),
          first_name: binary(),
          last_name: binary(),
          locality: binary(),
          organization: binary(),
          postal_code: binary(),
          sublocality: binary(),
          sublocality_2: binary(),
          sublocality_3: binary()
        }

  def address do
    schema(%{
      address_line_1: spec(is_binary()),
      address_line_2: spec(is_binary()),
      address_line_3: spec(is_binary()),
      administrative_district_level_1: spec(is_binary()),
      administrative_district_level_2: spec(is_binary()),
      administrative_district_level_3: spec(is_binary()),
      country: spec(is_binary()),
      first_name: spec(is_binary()),
      last_name: spec(is_binary()),
      locality: spec(is_binary()),
      organization: spec(is_binary()),
      postal_code: spec(is_binary()),
      sublocality: spec(is_binary()),
      sublocality_2: spec(is_binary()),
      sublocality_3: spec(is_binary())
    })
    |> selection([])
  end

  @type loyalty_event_order_filter :: %{order_id: binary()}

  def loyalty_event_order_filter do
    schema(%{order_id: spec(is_binary())})
    |> selection([:order_id])
  end

  @type order_service_charge :: %{
          amount_money: SquareUp.Schema.money(),
          applied_money: SquareUp.Schema.money(),
          applied_taxes: [SquareUp.Schema.order_line_item_applied_tax()],
          calculation_phase: binary(),
          catalog_object_id: binary(),
          metadata: map(),
          name: binary(),
          percentage: binary(),
          taxable: boolean(),
          total_money: SquareUp.Schema.money(),
          total_tax_money: SquareUp.Schema.money(),
          uid: binary()
        }

  def order_service_charge do
    schema(%{
      amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      applied_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      applied_taxes:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.order_line_item_applied_tax/0))),
      calculation_phase: spec(is_binary()),
      catalog_object_id: spec(is_binary()),
      metadata: schema(%{}),
      name: spec(is_binary()),
      percentage: spec(is_binary()),
      taxable: spec(is_boolean()),
      total_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      total_tax_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      uid: spec(is_binary())
    })
    |> selection([])
  end

  @type get_break_type_response :: %{
          break_type: SquareUp.Schema.break_type(),
          errors: [SquareUp.Schema.error()]
        }

  def get_break_type_response do
    schema(%{
      break_type: Norm.Delegate.delegate(&SquareUp.Schema.break_type/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type search_loyalty_accounts_request_loyalty_account_query :: %{
          mappings: [SquareUp.Schema.loyalty_account_mapping()]
        }

  def search_loyalty_accounts_request_loyalty_account_query do
    schema(%{
      mappings: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.loyalty_account_mapping/0)))
    })
    |> selection([])
  end

  @type create_invoice_response :: %{
          errors: [SquareUp.Schema.error()],
          invoice: SquareUp.Schema.invoice()
        }

  def create_invoice_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      invoice: Norm.Delegate.delegate(&SquareUp.Schema.invoice/0)
    })
    |> selection([])
  end

  @type subscription_cadence :: binary()
  def subscription_cadence do
    spec(is_binary())
  end

  @type v1_cash_drawer_event_event_type :: binary()
  def v1_cash_drawer_event_event_type do
    spec(is_binary())
  end

  @type create_dispute_evidence_text_response :: %{
          errors: [SquareUp.Schema.error()],
          evidence: SquareUp.Schema.dispute_evidence()
        }

  def create_dispute_evidence_text_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      evidence: Norm.Delegate.delegate(&SquareUp.Schema.dispute_evidence/0)
    })
    |> selection([])
  end

  @type cash_drawer_shift :: %{
          cash_paid_in_money: SquareUp.Schema.money(),
          cash_paid_out_money: SquareUp.Schema.money(),
          cash_payment_money: SquareUp.Schema.money(),
          cash_refunds_money: SquareUp.Schema.money(),
          closed_at: binary(),
          closed_cash_money: SquareUp.Schema.money(),
          closing_employee_id: binary(),
          description: binary(),
          device: SquareUp.Schema.cash_drawer_device(),
          employee_ids: [binary()],
          ended_at: binary(),
          ending_employee_id: binary(),
          expected_cash_money: SquareUp.Schema.money(),
          id: binary(),
          opened_at: binary(),
          opened_cash_money: SquareUp.Schema.money(),
          opening_employee_id: binary(),
          state: binary()
        }

  def cash_drawer_shift do
    schema(%{
      cash_paid_in_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      cash_paid_out_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      cash_payment_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      cash_refunds_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      closed_at: spec(is_binary()),
      closed_cash_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      closing_employee_id: spec(is_binary()),
      description: spec(is_binary()),
      device: Norm.Delegate.delegate(&SquareUp.Schema.cash_drawer_device/0),
      employee_ids: spec(coll_of(spec(is_binary()))),
      ended_at: spec(is_binary()),
      ending_employee_id: spec(is_binary()),
      expected_cash_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      id: spec(is_binary()),
      opened_at: spec(is_binary()),
      opened_cash_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      opening_employee_id: spec(is_binary()),
      state: spec(is_binary())
    })
    |> selection([])
  end

  @type error_code :: binary()
  def error_code do
    spec(is_binary())
  end

  @type retrieve_transaction_request :: %{}

  def retrieve_transaction_request do
    schema(%{})
    |> selection([])
  end

  @type v1_fee_calculation_phase :: binary()
  def v1_fee_calculation_phase do
    spec(is_binary())
  end

  @type search_terminal_checkouts_response :: %{
          checkouts: [SquareUp.Schema.terminal_checkout()],
          cursor: binary(),
          errors: [SquareUp.Schema.error()]
        }

  def search_terminal_checkouts_response do
    schema(%{
      checkouts: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.terminal_checkout/0))),
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type card_payment_details :: %{
          application_cryptogram: binary(),
          application_identifier: binary(),
          application_name: binary(),
          auth_result_code: binary(),
          avs_status: binary(),
          card: SquareUp.Schema.card(),
          cvv_status: binary(),
          device_details: SquareUp.Schema.device_details(),
          entry_method: binary(),
          errors: [SquareUp.Schema.error()],
          refund_requires_card_presence: boolean(),
          statement_description: binary(),
          status: binary(),
          verification_method: binary(),
          verification_results: binary()
        }

  def card_payment_details do
    schema(%{
      application_cryptogram: spec(is_binary()),
      application_identifier: spec(is_binary()),
      application_name: spec(is_binary()),
      auth_result_code: spec(is_binary()),
      avs_status: spec(is_binary()),
      card: Norm.Delegate.delegate(&SquareUp.Schema.card/0),
      cvv_status: spec(is_binary()),
      device_details: Norm.Delegate.delegate(&SquareUp.Schema.device_details/0),
      entry_method: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      refund_requires_card_presence: spec(is_boolean()),
      statement_description: spec(is_binary()),
      status: spec(is_binary()),
      verification_method: spec(is_binary()),
      verification_results: spec(is_binary())
    })
    |> selection([])
  end

  @type measurement_unit_time :: binary()
  def measurement_unit_time do
    spec(is_binary())
  end

  @type get_terminal_checkout_request :: %{}

  def get_terminal_checkout_request do
    schema(%{})
    |> selection([])
  end

  @type v1_tender_card_brand :: binary()
  def v1_tender_card_brand do
    spec(is_binary())
  end

  @type catalog_object :: %{
          absent_at_location_ids: [binary()],
          catalog_v1_ids: [SquareUp.Schema.catalog_v1_id()],
          category_data: SquareUp.Schema.catalog_category(),
          custom_attribute_definition_data: SquareUp.Schema.catalog_custom_attribute_definition(),
          custom_attribute_values: map(),
          discount_data: SquareUp.Schema.catalog_discount(),
          id: binary(),
          image_data: SquareUp.Schema.catalog_image(),
          image_id: binary(),
          is_deleted: boolean(),
          item_data: SquareUp.Schema.catalog_item(),
          item_option_data: SquareUp.Schema.catalog_item_option(),
          item_option_value_data: SquareUp.Schema.catalog_item_option_value(),
          item_variation_data: SquareUp.Schema.catalog_item_variation(),
          measurement_unit_data: SquareUp.Schema.catalog_measurement_unit(),
          modifier_data: SquareUp.Schema.catalog_modifier(),
          modifier_list_data: SquareUp.Schema.catalog_modifier_list(),
          present_at_all_locations: boolean(),
          present_at_location_ids: [binary()],
          pricing_rule_data: SquareUp.Schema.catalog_pricing_rule(),
          product_set_data: SquareUp.Schema.catalog_product_set(),
          quick_amounts_settings_data: SquareUp.Schema.catalog_quick_amounts_settings(),
          subscription_plan_data: SquareUp.Schema.catalog_subscription_plan(),
          tax_data: SquareUp.Schema.catalog_tax(),
          time_period_data: SquareUp.Schema.catalog_time_period(),
          type: binary(),
          updated_at: binary(),
          version: integer()
        }

  def catalog_object do
    schema(%{
      absent_at_location_ids: spec(coll_of(spec(is_binary()))),
      catalog_v1_ids: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.catalog_v1_id/0))),
      category_data: Norm.Delegate.delegate(&SquareUp.Schema.catalog_category/0),
      custom_attribute_definition_data:
        Norm.Delegate.delegate(&SquareUp.Schema.catalog_custom_attribute_definition/0),
      custom_attribute_values: schema(%{}),
      discount_data: Norm.Delegate.delegate(&SquareUp.Schema.catalog_discount/0),
      id: spec(is_binary()),
      image_data: Norm.Delegate.delegate(&SquareUp.Schema.catalog_image/0),
      image_id: spec(is_binary()),
      is_deleted: spec(is_boolean()),
      item_data: Norm.Delegate.delegate(&SquareUp.Schema.catalog_item/0),
      item_option_data: Norm.Delegate.delegate(&SquareUp.Schema.catalog_item_option/0),
      item_option_value_data:
        Norm.Delegate.delegate(&SquareUp.Schema.catalog_item_option_value/0),
      item_variation_data: Norm.Delegate.delegate(&SquareUp.Schema.catalog_item_variation/0),
      measurement_unit_data: Norm.Delegate.delegate(&SquareUp.Schema.catalog_measurement_unit/0),
      modifier_data: Norm.Delegate.delegate(&SquareUp.Schema.catalog_modifier/0),
      modifier_list_data: Norm.Delegate.delegate(&SquareUp.Schema.catalog_modifier_list/0),
      present_at_all_locations: spec(is_boolean()),
      present_at_location_ids: spec(coll_of(spec(is_binary()))),
      pricing_rule_data: Norm.Delegate.delegate(&SquareUp.Schema.catalog_pricing_rule/0),
      product_set_data: Norm.Delegate.delegate(&SquareUp.Schema.catalog_product_set/0),
      quick_amounts_settings_data:
        Norm.Delegate.delegate(&SquareUp.Schema.catalog_quick_amounts_settings/0),
      subscription_plan_data:
        Norm.Delegate.delegate(&SquareUp.Schema.catalog_subscription_plan/0),
      tax_data: Norm.Delegate.delegate(&SquareUp.Schema.catalog_tax/0),
      time_period_data: Norm.Delegate.delegate(&SquareUp.Schema.catalog_time_period/0),
      type: spec(is_binary()),
      updated_at: spec(is_binary()),
      version: spec(is_integer())
    })
    |> selection([:type, :id])
  end

  @type list_cash_drawer_shift_events_response :: %{
          cursor: binary(),
          errors: [SquareUp.Schema.error()],
          events: [SquareUp.Schema.cash_drawer_shift_event()]
        }

  def list_cash_drawer_shift_events_response do
    schema(%{
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      events: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.cash_drawer_shift_event/0)))
    })
    |> selection([])
  end

  @type subscription_phase :: %{
          cadence: binary(),
          ordinal: integer(),
          periods: integer(),
          recurring_price_money: SquareUp.Schema.money(),
          uid: binary()
        }

  def subscription_phase do
    schema(%{
      cadence: spec(is_binary()),
      ordinal: spec(is_integer()),
      periods: spec(is_integer()),
      recurring_price_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      uid: spec(is_binary())
    })
    |> selection([:cadence, :recurring_price_money])
  end

  @type create_loyalty_account_response :: %{
          errors: [SquareUp.Schema.error()],
          loyalty_account: SquareUp.Schema.loyalty_account()
        }

  def create_loyalty_account_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      loyalty_account: Norm.Delegate.delegate(&SquareUp.Schema.loyalty_account/0)
    })
    |> selection([])
  end

  @type create_invoice_request :: %{idempotency_key: binary(), invoice: SquareUp.Schema.invoice()}

  def create_invoice_request do
    schema(%{
      idempotency_key: spec(is_binary()),
      invoice: Norm.Delegate.delegate(&SquareUp.Schema.invoice/0)
    })
    |> selection([:invoice])
  end

  @type v1_retrieve_business_request :: %{}

  def v1_retrieve_business_request do
    schema(%{})
    |> selection([])
  end

  @type v1_cash_drawer_shift :: %{
          cash_paid_in_money: SquareUp.Schema.v1_money(),
          cash_paid_out_money: SquareUp.Schema.v1_money(),
          cash_payment_money: SquareUp.Schema.v1_money(),
          cash_refunds_money: SquareUp.Schema.v1_money(),
          closed_at: binary(),
          closed_cash_money: SquareUp.Schema.v1_money(),
          closing_employee_id: binary(),
          description: binary(),
          device: SquareUp.Schema.device(),
          employee_ids: [binary()],
          ended_at: binary(),
          ending_employee_id: binary(),
          event_type: binary(),
          events: [SquareUp.Schema.v1_cash_drawer_event()],
          expected_cash_money: SquareUp.Schema.v1_money(),
          id: binary(),
          opened_at: binary(),
          opening_employee_id: binary(),
          starting_cash_money: SquareUp.Schema.v1_money()
        }

  def v1_cash_drawer_shift do
    schema(%{
      cash_paid_in_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      cash_paid_out_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      cash_payment_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      cash_refunds_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      closed_at: spec(is_binary()),
      closed_cash_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      closing_employee_id: spec(is_binary()),
      description: spec(is_binary()),
      device: Norm.Delegate.delegate(&SquareUp.Schema.device/0),
      employee_ids: spec(coll_of(spec(is_binary()))),
      ended_at: spec(is_binary()),
      ending_employee_id: spec(is_binary()),
      event_type: spec(is_binary()),
      events: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_cash_drawer_event/0))),
      expected_cash_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      id: spec(is_binary()),
      opened_at: spec(is_binary()),
      opening_employee_id: spec(is_binary()),
      starting_cash_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0)
    })
    |> selection([])
  end

  @type retrieve_inventory_changes_request :: %{cursor: binary(), location_ids: binary()}

  def retrieve_inventory_changes_request do
    schema(%{cursor: spec(is_binary()), location_ids: spec(is_binary())})
    |> selection([])
  end

  @type invoice_payment_reminder :: %{
          message: binary(),
          relative_scheduled_days: integer(),
          sent_at: binary(),
          status: binary(),
          uid: binary()
        }

  def invoice_payment_reminder do
    schema(%{
      message: spec(is_binary()),
      relative_scheduled_days: spec(is_integer()),
      sent_at: spec(is_binary()),
      status: spec(is_binary()),
      uid: spec(is_binary())
    })
    |> selection([])
  end

  @type invoice_payment_reminder_status :: binary()
  def invoice_payment_reminder_status do
    spec(is_binary())
  end

  @type search_subscriptions_request :: %{
          cursor: binary(),
          limit: integer(),
          query: SquareUp.Schema.search_subscriptions_query()
        }

  def search_subscriptions_request do
    schema(%{
      cursor: spec(is_binary()),
      limit: spec(is_integer()),
      query: Norm.Delegate.delegate(&SquareUp.Schema.search_subscriptions_query/0)
    })
    |> selection([])
  end

  @type create_shift_response :: %{
          errors: [SquareUp.Schema.error()],
          shift: SquareUp.Schema.shift()
        }

  def create_shift_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      shift: Norm.Delegate.delegate(&SquareUp.Schema.shift/0)
    })
    |> selection([])
  end

  @type invoice :: %{
          created_at: binary(),
          description: binary(),
          id: binary(),
          invoice_number: binary(),
          location_id: binary(),
          next_payment_amount_money: SquareUp.Schema.money(),
          order_id: binary(),
          payment_requests: [SquareUp.Schema.invoice_payment_request()],
          primary_recipient: SquareUp.Schema.invoice_recipient(),
          public_url: binary(),
          scheduled_at: binary(),
          status: binary(),
          timezone: binary(),
          title: binary(),
          updated_at: binary(),
          version: integer()
        }

  def invoice do
    schema(%{
      created_at: spec(is_binary()),
      description: spec(is_binary()),
      id: spec(is_binary()),
      invoice_number: spec(is_binary()),
      location_id: spec(is_binary()),
      next_payment_amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      order_id: spec(is_binary()),
      payment_requests:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.invoice_payment_request/0))),
      primary_recipient: Norm.Delegate.delegate(&SquareUp.Schema.invoice_recipient/0),
      public_url: spec(is_binary()),
      scheduled_at: spec(is_binary()),
      status: spec(is_binary()),
      timezone: spec(is_binary()),
      title: spec(is_binary()),
      updated_at: spec(is_binary()),
      version: spec(is_integer())
    })
    |> selection([])
  end

  @type list_subscription_events_response :: %{
          cursor: binary(),
          errors: [SquareUp.Schema.error()],
          subscription_events: [SquareUp.Schema.subscription_event()]
        }

  def list_subscription_events_response do
    schema(%{
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      subscription_events:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.subscription_event/0)))
    })
    |> selection([])
  end

  @type catalog_query_items_for_tax :: %{tax_ids: [binary()]}

  def catalog_query_items_for_tax do
    schema(%{tax_ids: spec(coll_of(spec(is_binary())))})
    |> selection([:tax_ids])
  end

  @type order_fulfillment_updated_object :: %{
          order_fulfillment_updated: SquareUp.Schema.order_fulfillment_updated()
        }

  def order_fulfillment_updated_object do
    schema(%{
      order_fulfillment_updated:
        Norm.Delegate.delegate(&SquareUp.Schema.order_fulfillment_updated/0)
    })
    |> selection([])
  end

  @type loyalty_program_accrual_rule_type :: binary()
  def loyalty_program_accrual_rule_type do
    spec(is_binary())
  end

  @type v1_refund :: %{
          created_at: binary(),
          is_exchange: boolean(),
          merchant_id: binary(),
          payment_id: binary(),
          processed_at: binary(),
          reason: binary(),
          refunded_additive_tax: [SquareUp.Schema.v1_payment_tax()],
          refunded_additive_tax_money: SquareUp.Schema.v1_money(),
          refunded_discount_money: SquareUp.Schema.v1_money(),
          refunded_inclusive_tax: [SquareUp.Schema.v1_payment_tax()],
          refunded_inclusive_tax_money: SquareUp.Schema.v1_money(),
          refunded_money: SquareUp.Schema.v1_money(),
          refunded_processing_fee_money: SquareUp.Schema.v1_money(),
          refunded_surcharge_money: SquareUp.Schema.v1_money(),
          refunded_surcharges: [SquareUp.Schema.v1_payment_surcharge()],
          refunded_tax_money: SquareUp.Schema.v1_money(),
          refunded_tip_money: SquareUp.Schema.v1_money(),
          type: binary()
        }

  def v1_refund do
    schema(%{
      created_at: spec(is_binary()),
      is_exchange: spec(is_boolean()),
      merchant_id: spec(is_binary()),
      payment_id: spec(is_binary()),
      processed_at: spec(is_binary()),
      reason: spec(is_binary()),
      refunded_additive_tax:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_payment_tax/0))),
      refunded_additive_tax_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      refunded_discount_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      refunded_inclusive_tax:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_payment_tax/0))),
      refunded_inclusive_tax_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      refunded_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      refunded_processing_fee_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      refunded_surcharge_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      refunded_surcharges:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_payment_surcharge/0))),
      refunded_tax_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      refunded_tip_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      type: spec(is_binary())
    })
    |> selection([])
  end

  @type search_loyalty_rewards_request :: %{
          cursor: binary(),
          limit: integer(),
          query: SquareUp.Schema.search_loyalty_rewards_request_loyalty_reward_query()
        }

  def search_loyalty_rewards_request do
    schema(%{
      cursor: spec(is_binary()),
      limit: spec(is_integer()),
      query:
        Norm.Delegate.delegate(
          &SquareUp.Schema.search_loyalty_rewards_request_loyalty_reward_query/0
        )
    })
    |> selection([])
  end

  @type order_entry :: %{location_id: binary(), order_id: binary(), version: integer()}

  def order_entry do
    schema(%{
      location_id: spec(is_binary()),
      order_id: spec(is_binary()),
      version: spec(is_integer())
    })
    |> selection([])
  end

  @type v1_merchant :: %{
          account_capabilities: [binary()],
          account_type: binary(),
          business_address: SquareUp.Schema.address(),
          business_name: binary(),
          business_phone: SquareUp.Schema.v1_phone_number(),
          business_type: binary(),
          country_code: binary(),
          currency_code: binary(),
          email: binary(),
          id: binary(),
          language_code: binary(),
          location_details: SquareUp.Schema.v1_merchant_location_details(),
          market_url: binary(),
          name: binary(),
          shipping_address: SquareUp.Schema.address()
        }

  def v1_merchant do
    schema(%{
      account_capabilities: spec(coll_of(spec(is_binary()))),
      account_type: spec(is_binary()),
      business_address: Norm.Delegate.delegate(&SquareUp.Schema.address/0),
      business_name: spec(is_binary()),
      business_phone: Norm.Delegate.delegate(&SquareUp.Schema.v1_phone_number/0),
      business_type: spec(is_binary()),
      country_code: spec(is_binary()),
      currency_code: spec(is_binary()),
      email: spec(is_binary()),
      id: spec(is_binary()),
      language_code: spec(is_binary()),
      location_details: Norm.Delegate.delegate(&SquareUp.Schema.v1_merchant_location_details/0),
      market_url: spec(is_binary()),
      name: spec(is_binary()),
      shipping_address: Norm.Delegate.delegate(&SquareUp.Schema.address/0)
    })
    |> selection([])
  end

  @type update_invoice_response :: %{
          errors: [SquareUp.Schema.error()],
          invoice: SquareUp.Schema.invoice()
        }

  def update_invoice_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      invoice: Norm.Delegate.delegate(&SquareUp.Schema.invoice/0)
    })
    |> selection([])
  end

  @type list_employees_request :: %{
          cursor: binary(),
          limit: integer(),
          location_id: binary(),
          status: binary()
        }

  def list_employees_request do
    schema(%{
      cursor: spec(is_binary()),
      limit: spec(is_integer()),
      location_id: spec(is_binary()),
      status: spec(is_binary())
    })
    |> selection([])
  end

  @type measurement_unit_unit_type :: binary()
  def measurement_unit_unit_type do
    spec(is_binary())
  end

  @type v1_delete_timecard_response :: %{}

  def v1_delete_timecard_response do
    schema(%{})
    |> selection([])
  end

  @type list_workweek_configs_request :: %{cursor: binary(), limit: integer()}

  def list_workweek_configs_request do
    schema(%{cursor: spec(is_binary()), limit: spec(is_integer())})
    |> selection([])
  end

  @type v1_payment_discount :: %{
          applied_money: SquareUp.Schema.v1_money(),
          discount_id: binary(),
          name: binary()
        }

  def v1_payment_discount do
    schema(%{
      applied_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      discount_id: spec(is_binary()),
      name: spec(is_binary())
    })
    |> selection([])
  end

  @type v1_update_timecard_request :: %{body: SquareUp.Schema.v1_timecard()}

  def v1_update_timecard_request do
    schema(%{body: Norm.Delegate.delegate(&SquareUp.Schema.v1_timecard/0)})
    |> selection([:body])
  end

  @type list_payments_request :: %{
          begin_time: binary(),
          card_brand: binary(),
          cursor: binary(),
          end_time: binary(),
          last_4: binary(),
          location_id: binary(),
          sort_order: binary(),
          total: integer()
        }

  def list_payments_request do
    schema(%{
      begin_time: spec(is_binary()),
      card_brand: spec(is_binary()),
      cursor: spec(is_binary()),
      end_time: spec(is_binary()),
      last_4: spec(is_binary()),
      location_id: spec(is_binary()),
      sort_order: spec(is_binary()),
      total: spec(is_integer())
    })
    |> selection([])
  end

  @type order_fulfillment_state :: binary()
  def order_fulfillment_state do
    spec(is_binary())
  end

  @type order_fulfillment :: %{
          metadata: map(),
          pickup_details: SquareUp.Schema.order_fulfillment_pickup_details(),
          shipment_details: SquareUp.Schema.order_fulfillment_shipment_details(),
          state: binary(),
          type: binary(),
          uid: binary()
        }

  def order_fulfillment do
    schema(%{
      metadata: schema(%{}),
      pickup_details: Norm.Delegate.delegate(&SquareUp.Schema.order_fulfillment_pickup_details/0),
      shipment_details:
        Norm.Delegate.delegate(&SquareUp.Schema.order_fulfillment_shipment_details/0),
      state: spec(is_binary()),
      type: spec(is_binary()),
      uid: spec(is_binary())
    })
    |> selection([])
  end

  @type update_team_member_response :: %{
          errors: [SquareUp.Schema.error()],
          team_member: SquareUp.Schema.team_member()
        }

  def update_team_member_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      team_member: Norm.Delegate.delegate(&SquareUp.Schema.team_member/0)
    })
    |> selection([])
  end

  @type v1_list_employees_response :: %{items: [SquareUp.Schema.v1_employee()]}

  def v1_list_employees_response do
    schema(%{items: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_employee/0)))})
    |> selection([])
  end

  @type create_customer_request :: %{
          address: SquareUp.Schema.address(),
          birthday: binary(),
          company_name: binary(),
          email_address: binary(),
          family_name: binary(),
          given_name: binary(),
          idempotency_key: binary(),
          nickname: binary(),
          note: binary(),
          phone_number: binary(),
          reference_id: binary()
        }

  def create_customer_request do
    schema(%{
      address: Norm.Delegate.delegate(&SquareUp.Schema.address/0),
      birthday: spec(is_binary()),
      company_name: spec(is_binary()),
      email_address: spec(is_binary()),
      family_name: spec(is_binary()),
      given_name: spec(is_binary()),
      idempotency_key: spec(is_binary()),
      nickname: spec(is_binary()),
      note: spec(is_binary()),
      phone_number: spec(is_binary()),
      reference_id: spec(is_binary())
    })
    |> selection([])
  end

  @type list_employee_wages_request :: %{
          cursor: binary(),
          employee_id: binary(),
          limit: integer()
        }

  def list_employee_wages_request do
    schema(%{cursor: spec(is_binary()), employee_id: spec(is_binary()), limit: spec(is_integer())})
    |> selection([])
  end

  @type order_line_item_tax_scope :: binary()
  def order_line_item_tax_scope do
    spec(is_binary())
  end

  @type update_workweek_config_request :: %{workweek_config: SquareUp.Schema.workweek_config()}

  def update_workweek_config_request do
    schema(%{workweek_config: Norm.Delegate.delegate(&SquareUp.Schema.workweek_config/0)})
    |> selection([:workweek_config])
  end

  @type cancel_payment_by_idempotency_key_response :: %{errors: [SquareUp.Schema.error()]}

  def cancel_payment_by_idempotency_key_response do
    schema(%{errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))})
    |> selection([])
  end

  @type update_wage_setting_response :: %{
          errors: [SquareUp.Schema.error()],
          wage_setting: SquareUp.Schema.wage_setting()
        }

  def update_wage_setting_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      wage_setting: Norm.Delegate.delegate(&SquareUp.Schema.wage_setting/0)
    })
    |> selection([])
  end

  @type v1_money :: %{amount: integer(), currency_code: binary()}

  def v1_money do
    schema(%{amount: spec(is_integer()), currency_code: spec(is_binary())})
    |> selection([])
  end

  @type catalog_discount_type :: binary()
  def catalog_discount_type do
    spec(is_binary())
  end

  @type v1_employee :: %{
          authorized_location_ids: [binary()],
          created_at: binary(),
          email: binary(),
          external_id: binary(),
          first_name: binary(),
          id: binary(),
          last_name: binary(),
          role_ids: [binary()],
          status: binary(),
          updated_at: binary()
        }

  def v1_employee do
    schema(%{
      authorized_location_ids: spec(coll_of(spec(is_binary()))),
      created_at: spec(is_binary()),
      email: spec(is_binary()),
      external_id: spec(is_binary()),
      first_name: spec(is_binary()),
      id: spec(is_binary()),
      last_name: spec(is_binary()),
      role_ids: spec(coll_of(spec(is_binary()))),
      status: spec(is_binary()),
      updated_at: spec(is_binary())
    })
    |> selection([:first_name, :last_name])
  end

  @type catalog_time_period :: %{event: binary()}

  def catalog_time_period do
    schema(%{event: spec(is_binary())})
    |> selection([])
  end

  @type v1_list_employee_roles_request :: %{
          batch_token: binary(),
          limit: integer(),
          order: binary()
        }

  def v1_list_employee_roles_request do
    schema(%{batch_token: spec(is_binary()), limit: spec(is_integer()), order: spec(is_binary())})
    |> selection([])
  end

  @type search_loyalty_accounts_response :: %{
          cursor: binary(),
          errors: [SquareUp.Schema.error()],
          loyalty_accounts: [SquareUp.Schema.loyalty_account()]
        }

  def search_loyalty_accounts_response do
    schema(%{
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      loyalty_accounts: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.loyalty_account/0)))
    })
    |> selection([])
  end

  @type create_team_member_response :: %{
          errors: [SquareUp.Schema.error()],
          team_member: SquareUp.Schema.team_member()
        }

  def create_team_member_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      team_member: Norm.Delegate.delegate(&SquareUp.Schema.team_member/0)
    })
    |> selection([])
  end

  @type list_locations_request :: %{}

  def list_locations_request do
    schema(%{})
    |> selection([])
  end

  @type v1_update_discount_request :: %{body: SquareUp.Schema.v1_discount()}

  def v1_update_discount_request do
    schema(%{body: Norm.Delegate.delegate(&SquareUp.Schema.v1_discount/0)})
    |> selection([:body])
  end

  @type v1_cash_drawer_event :: %{
          created_at: binary(),
          description: binary(),
          employee_id: binary(),
          event_money: SquareUp.Schema.v1_money(),
          event_type: binary(),
          id: binary()
        }

  def v1_cash_drawer_event do
    schema(%{
      created_at: spec(is_binary()),
      description: spec(is_binary()),
      employee_id: spec(is_binary()),
      event_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      event_type: spec(is_binary()),
      id: spec(is_binary())
    })
    |> selection([])
  end

  @type list_refunds_response :: %{
          cursor: binary(),
          errors: [SquareUp.Schema.error()],
          refunds: [SquareUp.Schema.refund()]
        }

  def list_refunds_response do
    schema(%{
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      refunds: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.refund/0)))
    })
    |> selection([])
  end

  @type v1_list_bank_accounts_request :: %{}

  def v1_list_bank_accounts_request do
    schema(%{})
    |> selection([])
  end

  @type retrieve_transaction_response :: %{
          errors: [SquareUp.Schema.error()],
          transaction: SquareUp.Schema.transaction()
        }

  def retrieve_transaction_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      transaction: Norm.Delegate.delegate(&SquareUp.Schema.transaction/0)
    })
    |> selection([])
  end

  @type search_orders_sort :: %{sort_field: binary(), sort_order: binary()}

  def search_orders_sort do
    schema(%{sort_field: spec(is_binary()), sort_order: spec(is_binary())})
    |> selection([:sort_field])
  end

  @type v1_timecard_event_event_type :: binary()
  def v1_timecard_event_event_type do
    spec(is_binary())
  end

  @type search_team_members_filter :: %{location_ids: [binary()], status: binary()}

  def search_team_members_filter do
    schema(%{location_ids: spec(coll_of(spec(is_binary()))), status: spec(is_binary())})
    |> selection([])
  end

  @type catalog_custom_attribute_definition_selection_config_custom_attribute_selection :: %{
          name: binary(),
          uid: binary()
        }

  def catalog_custom_attribute_definition_selection_config_custom_attribute_selection do
    schema(%{name: spec(is_binary()), uid: spec(is_binary())})
    |> selection([:name])
  end

  @type v1_payment_tax :: %{
          applied_money: SquareUp.Schema.v1_money(),
          errors: [SquareUp.Schema.error()],
          fee_id: binary(),
          inclusion_type: binary(),
          name: binary(),
          rate: binary()
        }

  def v1_payment_tax do
    schema(%{
      applied_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      fee_id: spec(is_binary()),
      inclusion_type: spec(is_binary()),
      name: spec(is_binary()),
      rate: spec(is_binary())
    })
    |> selection([])
  end

  @type get_payment_response :: %{
          errors: [SquareUp.Schema.error()],
          payment: SquareUp.Schema.payment()
        }

  def get_payment_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      payment: Norm.Delegate.delegate(&SquareUp.Schema.payment/0)
    })
    |> selection([])
  end

  @type v1_retrieve_payment_request :: %{}

  def v1_retrieve_payment_request do
    schema(%{})
    |> selection([])
  end

  @type employee_status :: binary()
  def employee_status do
    spec(is_binary())
  end

  @type get_invoice_request :: %{}

  def get_invoice_request do
    schema(%{})
    |> selection([])
  end

  @type batch_retrieve_catalog_objects_request :: %{
          include_related_objects: boolean(),
          object_ids: [binary()]
        }

  def batch_retrieve_catalog_objects_request do
    schema(%{
      include_related_objects: spec(is_boolean()),
      object_ids: spec(coll_of(spec(is_binary())))
    })
    |> selection([:object_ids])
  end

  @type batch_retrieve_inventory_changes_response :: %{
          changes: [SquareUp.Schema.inventory_change()],
          cursor: binary(),
          errors: [SquareUp.Schema.error()]
        }

  def batch_retrieve_inventory_changes_response do
    schema(%{
      changes: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.inventory_change/0))),
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type retrieve_catalog_object_request :: %{include_related_objects: boolean()}

  def retrieve_catalog_object_request do
    schema(%{include_related_objects: spec(is_boolean())})
    |> selection([])
  end

  @type v1_create_modifier_list_request :: %{body: SquareUp.Schema.v1_modifier_list()}

  def v1_create_modifier_list_request do
    schema(%{body: Norm.Delegate.delegate(&SquareUp.Schema.v1_modifier_list/0)})
    |> selection([])
  end

  @type v1_employee_role :: %{
          created_at: binary(),
          id: binary(),
          is_owner: boolean(),
          name: binary(),
          permissions: [binary()],
          updated_at: binary()
        }

  def v1_employee_role do
    schema(%{
      created_at: spec(is_binary()),
      id: spec(is_binary()),
      is_owner: spec(is_boolean()),
      name: spec(is_binary()),
      permissions: spec(coll_of(spec(is_binary()))),
      updated_at: spec(is_binary())
    })
    |> selection([:name, :permissions])
  end

  @type cash_drawer_shift_event :: %{
          created_at: binary(),
          description: binary(),
          employee_id: binary(),
          event_money: SquareUp.Schema.money(),
          event_type: binary(),
          id: binary()
        }

  def cash_drawer_shift_event do
    schema(%{
      created_at: spec(is_binary()),
      description: spec(is_binary()),
      employee_id: spec(is_binary()),
      event_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      event_type: spec(is_binary()),
      id: spec(is_binary())
    })
    |> selection([])
  end

  @type cash_drawer_shift_state :: binary()
  def cash_drawer_shift_state do
    spec(is_binary())
  end

  @type obtain_token_response :: %{
          access_token: binary(),
          expires_at: binary(),
          id_token: binary(),
          merchant_id: binary(),
          plan_id: binary(),
          refresh_token: binary(),
          subscription_id: binary(),
          token_type: binary()
        }

  def obtain_token_response do
    schema(%{
      access_token: spec(is_binary()),
      expires_at: spec(is_binary()),
      id_token: spec(is_binary()),
      merchant_id: spec(is_binary()),
      plan_id: spec(is_binary()),
      refresh_token: spec(is_binary()),
      subscription_id: spec(is_binary()),
      token_type: spec(is_binary())
    })
    |> selection([])
  end

  @type search_subscriptions_filter :: %{customer_ids: [binary()], location_ids: [binary()]}

  def search_subscriptions_filter do
    schema(%{
      customer_ids: spec(coll_of(spec(is_binary()))),
      location_ids: spec(coll_of(spec(is_binary())))
    })
    |> selection([])
  end

  @type catalog_custom_attribute_definition_seller_visibility :: binary()
  def catalog_custom_attribute_definition_seller_visibility do
    spec(is_binary())
  end

  @type invoice_payment_request :: %{
          card_id: binary(),
          computed_amount_money: SquareUp.Schema.money(),
          due_date: binary(),
          fixed_amount_requested_money: SquareUp.Schema.money(),
          percentage_requested: binary(),
          reminders: [SquareUp.Schema.invoice_payment_reminder()],
          request_method: binary(),
          request_type: binary(),
          rounding_adjustment_included_money: SquareUp.Schema.money(),
          tipping_enabled: boolean(),
          total_completed_amount_money: SquareUp.Schema.money(),
          uid: binary()
        }

  def invoice_payment_request do
    schema(%{
      card_id: spec(is_binary()),
      computed_amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      due_date: spec(is_binary()),
      fixed_amount_requested_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      percentage_requested: spec(is_binary()),
      reminders:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.invoice_payment_reminder/0))),
      request_method: spec(is_binary()),
      request_type: spec(is_binary()),
      rounding_adjustment_included_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      tipping_enabled: spec(is_boolean()),
      total_completed_amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      uid: spec(is_binary())
    })
    |> selection([])
  end

  @type update_location_request :: %{location: SquareUp.Schema.location()}

  def update_location_request do
    schema(%{location: Norm.Delegate.delegate(&SquareUp.Schema.location/0)})
    |> selection([])
  end

  @type v1_order_state :: binary()
  def v1_order_state do
    spec(is_binary())
  end

  @type list_bank_accounts_request :: %{cursor: binary(), limit: integer(), location_id: binary()}

  def list_bank_accounts_request do
    schema(%{cursor: spec(is_binary()), limit: spec(is_integer()), location_id: spec(is_binary())})
    |> selection([])
  end

  @type customer_group_info :: %{id: binary(), name: binary()}

  def customer_group_info do
    schema(%{id: spec(is_binary()), name: spec(is_binary())})
    |> selection([:id, :name])
  end

  @type catalog_object_type :: binary()
  def catalog_object_type do
    spec(is_binary())
  end

  @type v1_list_discounts_request :: %{}

  def v1_list_discounts_request do
    schema(%{})
    |> selection([])
  end

  @type list_customer_groups_response :: %{
          cursor: binary(),
          errors: [SquareUp.Schema.error()],
          groups: [SquareUp.Schema.customer_group()]
        }

  def list_customer_groups_response do
    schema(%{
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      groups: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.customer_group/0)))
    })
    |> selection([])
  end

  @type payment_refund :: %{
          amount_money: SquareUp.Schema.money(),
          app_fee_money: SquareUp.Schema.money(),
          created_at: binary(),
          id: binary(),
          location_id: binary(),
          order_id: binary(),
          payment_id: binary(),
          processing_fee: [SquareUp.Schema.processing_fee()],
          reason: binary(),
          status: binary(),
          updated_at: binary()
        }

  def payment_refund do
    schema(%{
      amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      app_fee_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      created_at: spec(is_binary()),
      id: spec(is_binary()),
      location_id: spec(is_binary()),
      order_id: spec(is_binary()),
      payment_id: spec(is_binary()),
      processing_fee: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.processing_fee/0))),
      reason: spec(is_binary()),
      status: spec(is_binary()),
      updated_at: spec(is_binary())
    })
    |> selection([:id, :amount_money])
  end

  @type search_customers_response :: %{
          cursor: binary(),
          customers: [SquareUp.Schema.customer()],
          errors: [SquareUp.Schema.error()]
        }

  def search_customers_response do
    schema(%{
      cursor: spec(is_binary()),
      customers: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.customer/0))),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type v1_list_timecards_response :: %{items: [SquareUp.Schema.v1_timecard()]}

  def v1_list_timecards_response do
    schema(%{items: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_timecard/0)))})
    |> selection([])
  end

  @type v1_payment :: %{
          additive_tax: [SquareUp.Schema.v1_payment_tax()],
          additive_tax_money: SquareUp.Schema.v1_money(),
          created_at: binary(),
          creator_id: binary(),
          device: SquareUp.Schema.device(),
          discount_money: SquareUp.Schema.v1_money(),
          gross_sales_money: SquareUp.Schema.v1_money(),
          id: binary(),
          inclusive_tax: [SquareUp.Schema.v1_payment_tax()],
          inclusive_tax_money: SquareUp.Schema.v1_money(),
          is_partial: boolean(),
          itemizations: [SquareUp.Schema.v1_payment_itemization()],
          merchant_id: binary(),
          net_sales_money: SquareUp.Schema.v1_money(),
          net_total_money: SquareUp.Schema.v1_money(),
          payment_url: binary(),
          processing_fee_money: SquareUp.Schema.v1_money(),
          receipt_url: binary(),
          refunded_money: SquareUp.Schema.v1_money(),
          refunds: [SquareUp.Schema.v1_refund()],
          surcharge_money: SquareUp.Schema.v1_money(),
          surcharges: [SquareUp.Schema.v1_payment_surcharge()],
          swedish_rounding_money: SquareUp.Schema.v1_money(),
          tax_money: SquareUp.Schema.v1_money(),
          tender: [SquareUp.Schema.v1_tender()],
          tip_money: SquareUp.Schema.v1_money(),
          total_collected_money: SquareUp.Schema.v1_money()
        }

  def v1_payment do
    schema(%{
      additive_tax: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_payment_tax/0))),
      additive_tax_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      created_at: spec(is_binary()),
      creator_id: spec(is_binary()),
      device: Norm.Delegate.delegate(&SquareUp.Schema.device/0),
      discount_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      gross_sales_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      id: spec(is_binary()),
      inclusive_tax: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_payment_tax/0))),
      inclusive_tax_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      is_partial: spec(is_boolean()),
      itemizations:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_payment_itemization/0))),
      merchant_id: spec(is_binary()),
      net_sales_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      net_total_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      payment_url: spec(is_binary()),
      processing_fee_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      receipt_url: spec(is_binary()),
      refunded_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      refunds: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_refund/0))),
      surcharge_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      surcharges: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_payment_surcharge/0))),
      swedish_rounding_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      tax_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      tender: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_tender/0))),
      tip_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      total_collected_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0)
    })
    |> selection([])
  end

  @type card :: %{
          billing_address: SquareUp.Schema.address(),
          bin: binary(),
          card_brand: binary(),
          card_type: binary(),
          cardholder_name: binary(),
          exp_month: integer(),
          exp_year: integer(),
          fingerprint: binary(),
          id: binary(),
          last_4: binary(),
          prepaid_type: binary()
        }

  def card do
    schema(%{
      billing_address: Norm.Delegate.delegate(&SquareUp.Schema.address/0),
      bin: spec(is_binary()),
      card_brand: spec(is_binary()),
      card_type: spec(is_binary()),
      cardholder_name: spec(is_binary()),
      exp_month: spec(is_integer()),
      exp_year: spec(is_integer()),
      fingerprint: spec(is_binary()),
      id: spec(is_binary()),
      last_4: spec(is_binary()),
      prepaid_type: spec(is_binary())
    })
    |> selection([])
  end

  @type retrieve_subscription_response :: %{
          errors: [SquareUp.Schema.error()],
          subscription: SquareUp.Schema.subscription()
        }

  def retrieve_subscription_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      subscription: Norm.Delegate.delegate(&SquareUp.Schema.subscription/0)
    })
    |> selection([])
  end

  @type delete_break_type_request :: %{}

  def delete_break_type_request do
    schema(%{})
    |> selection([])
  end

  @type retrieve_inventory_physical_count_request :: %{}

  def retrieve_inventory_physical_count_request do
    schema(%{})
    |> selection([])
  end

  @type batch_delete_catalog_objects_request :: %{object_ids: [binary()]}

  def batch_delete_catalog_objects_request do
    schema(%{object_ids: spec(coll_of(spec(is_binary())))})
    |> selection([])
  end

  @type order_reward :: %{id: binary(), reward_tier_id: binary()}

  def order_reward do
    schema(%{id: spec(is_binary()), reward_tier_id: spec(is_binary())})
    |> selection([:id, :reward_tier_id])
  end

  @type update_item_modifier_lists_request :: %{
          item_ids: [binary()],
          modifier_lists_to_disable: [binary()],
          modifier_lists_to_enable: [binary()]
        }

  def update_item_modifier_lists_request do
    schema(%{
      item_ids: spec(coll_of(spec(is_binary()))),
      modifier_lists_to_disable: spec(coll_of(spec(is_binary()))),
      modifier_lists_to_enable: spec(coll_of(spec(is_binary())))
    })
    |> selection([:item_ids])
  end

  @type v1_item_image :: %{id: binary(), url: binary()}

  def v1_item_image do
    schema(%{id: spec(is_binary()), url: spec(is_binary())})
    |> selection([])
  end

  @type v1_merchant_location_details :: %{nickname: binary()}

  def v1_merchant_location_details do
    schema(%{nickname: spec(is_binary())})
    |> selection([])
  end

  @type device_code :: %{
          code: binary(),
          created_at: binary(),
          device_id: binary(),
          id: binary(),
          location_id: binary(),
          name: binary(),
          pair_by: binary(),
          paired_at: binary(),
          product_type: binary(),
          status: binary(),
          status_changed_at: binary()
        }

  def device_code do
    schema(%{
      code: spec(is_binary()),
      created_at: spec(is_binary()),
      device_id: spec(is_binary()),
      id: spec(is_binary()),
      location_id: spec(is_binary()),
      name: spec(is_binary()),
      pair_by: spec(is_binary()),
      paired_at: spec(is_binary()),
      product_type: spec(is_binary()),
      status: spec(is_binary()),
      status_changed_at: spec(is_binary())
    })
    |> selection([:product_type])
  end

  @type v1_update_modifier_list_request :: %{name: binary(), selection_type: binary()}

  def v1_update_modifier_list_request do
    schema(%{name: spec(is_binary()), selection_type: spec(is_binary())})
    |> selection([])
  end

  @type invoice_status :: binary()
  def invoice_status do
    spec(is_binary())
  end

  @type v1_page :: %{
          cells: [SquareUp.Schema.v1_page_cell()],
          id: binary(),
          name: binary(),
          page_index: integer()
        }

  def v1_page do
    schema(%{
      cells: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_page_cell/0))),
      id: spec(is_binary()),
      name: spec(is_binary()),
      page_index: spec(is_integer())
    })
    |> selection([])
  end

  @type customer :: %{
          address: SquareUp.Schema.address(),
          birthday: binary(),
          cards: [SquareUp.Schema.card()],
          company_name: binary(),
          created_at: binary(),
          creation_source: binary(),
          email_address: binary(),
          family_name: binary(),
          given_name: binary(),
          group_ids: [binary()],
          groups: [SquareUp.Schema.customer_group_info()],
          id: binary(),
          nickname: binary(),
          note: binary(),
          phone_number: binary(),
          preferences: SquareUp.Schema.customer_preferences(),
          reference_id: binary(),
          segment_ids: [binary()],
          updated_at: binary()
        }

  def customer do
    schema(%{
      address: Norm.Delegate.delegate(&SquareUp.Schema.address/0),
      birthday: spec(is_binary()),
      cards: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.card/0))),
      company_name: spec(is_binary()),
      created_at: spec(is_binary()),
      creation_source: spec(is_binary()),
      email_address: spec(is_binary()),
      family_name: spec(is_binary()),
      given_name: spec(is_binary()),
      group_ids: spec(coll_of(spec(is_binary()))),
      groups: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.customer_group_info/0))),
      id: spec(is_binary()),
      nickname: spec(is_binary()),
      note: spec(is_binary()),
      phone_number: spec(is_binary()),
      preferences: Norm.Delegate.delegate(&SquareUp.Schema.customer_preferences/0),
      reference_id: spec(is_binary()),
      segment_ids: spec(coll_of(spec(is_binary()))),
      updated_at: spec(is_binary())
    })
    |> selection([])
  end

  @type list_team_member_wages_response :: %{
          cursor: binary(),
          errors: [SquareUp.Schema.error()],
          team_member_wages: [SquareUp.Schema.team_member_wage()]
        }

  def list_team_member_wages_response do
    schema(%{
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      team_member_wages:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.team_member_wage/0)))
    })
    |> selection([])
  end

  @type transaction :: %{
          client_id: binary(),
          created_at: binary(),
          id: binary(),
          location_id: binary(),
          order_id: binary(),
          product: binary(),
          reference_id: binary(),
          refunds: [SquareUp.Schema.refund()],
          shipping_address: SquareUp.Schema.address(),
          tenders: [SquareUp.Schema.tender()]
        }

  def transaction do
    schema(%{
      client_id: spec(is_binary()),
      created_at: spec(is_binary()),
      id: spec(is_binary()),
      location_id: spec(is_binary()),
      order_id: spec(is_binary()),
      product: spec(is_binary()),
      reference_id: spec(is_binary()),
      refunds: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.refund/0))),
      shipping_address: Norm.Delegate.delegate(&SquareUp.Schema.address/0),
      tenders: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.tender/0)))
    })
    |> selection([])
  end

  @type catalog_custom_attribute_definition :: %{
          allowed_object_types: [binary()],
          app_visibility: binary(),
          custom_attribute_usage_count: integer(),
          description: binary(),
          key: binary(),
          name: binary(),
          number_config: SquareUp.Schema.catalog_custom_attribute_definition_number_config(),
          selection_config:
            SquareUp.Schema.catalog_custom_attribute_definition_selection_config(),
          seller_visibility: binary(),
          source_application: SquareUp.Schema.source_application(),
          string_config: SquareUp.Schema.catalog_custom_attribute_definition_string_config(),
          type: binary()
        }

  def catalog_custom_attribute_definition do
    schema(%{
      allowed_object_types: spec(coll_of(spec(is_binary()))),
      app_visibility: spec(is_binary()),
      custom_attribute_usage_count: spec(is_integer()),
      description: spec(is_binary()),
      key: spec(is_binary()),
      name: spec(is_binary()),
      number_config:
        Norm.Delegate.delegate(
          &SquareUp.Schema.catalog_custom_attribute_definition_number_config/0
        ),
      selection_config:
        Norm.Delegate.delegate(
          &SquareUp.Schema.catalog_custom_attribute_definition_selection_config/0
        ),
      seller_visibility: spec(is_binary()),
      source_application: Norm.Delegate.delegate(&SquareUp.Schema.source_application/0),
      string_config:
        Norm.Delegate.delegate(
          &SquareUp.Schema.catalog_custom_attribute_definition_string_config/0
        ),
      type: spec(is_binary())
    })
    |> selection([:type, :name, :allowed_object_types])
  end

  @type v1_list_pages_response :: %{items: [SquareUp.Schema.v1_page()]}

  def v1_list_pages_response do
    schema(%{items: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_page/0)))})
    |> selection([])
  end

  @type retrieve_inventory_count_request :: %{cursor: binary(), location_ids: binary()}

  def retrieve_inventory_count_request do
    schema(%{cursor: spec(is_binary()), location_ids: spec(is_binary())})
    |> selection([])
  end

  @type renew_token_response :: %{
          access_token: binary(),
          expires_at: binary(),
          merchant_id: binary(),
          plan_id: binary(),
          subscription_id: binary(),
          token_type: binary()
        }

  def renew_token_response do
    schema(%{
      access_token: spec(is_binary()),
      expires_at: spec(is_binary()),
      merchant_id: spec(is_binary()),
      plan_id: spec(is_binary()),
      subscription_id: spec(is_binary()),
      token_type: spec(is_binary())
    })
    |> selection([])
  end

  @type standard_unit_description_group :: %{
          language_code: binary(),
          standard_unit_descriptions: [SquareUp.Schema.standard_unit_description()]
        }

  def standard_unit_description_group do
    schema(%{
      language_code: spec(is_binary()),
      standard_unit_descriptions:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.standard_unit_description/0)))
    })
    |> selection([])
  end

  @type v1_fee_type :: binary()
  def v1_fee_type do
    spec(is_binary())
  end

  @type dispute_evidence :: %{
          dispute_id: binary(),
          evidence_id: binary(),
          evidence_type: binary(),
          uploaded_at: binary()
        }

  def dispute_evidence do
    schema(%{
      dispute_id: spec(is_binary()),
      evidence_id: spec(is_binary()),
      evidence_type: spec(is_binary()),
      uploaded_at: spec(is_binary())
    })
    |> selection([])
  end

  @type terminal_checkout_query_filter :: %{
          created_at: SquareUp.Schema.time_range(),
          device_id: binary(),
          status: binary()
        }

  def terminal_checkout_query_filter do
    schema(%{
      created_at: Norm.Delegate.delegate(&SquareUp.Schema.time_range/0),
      device_id: spec(is_binary()),
      status: spec(is_binary())
    })
    |> selection([])
  end

  @type get_payment_request :: %{}

  def get_payment_request do
    schema(%{})
    |> selection([])
  end

  @type order_line_item_discount_type :: binary()
  def order_line_item_discount_type do
    spec(is_binary())
  end

  @type list_bank_accounts_response :: %{
          bank_accounts: [SquareUp.Schema.bank_account()],
          cursor: binary(),
          errors: [SquareUp.Schema.error()]
        }

  def list_bank_accounts_response do
    schema(%{
      bank_accounts: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.bank_account/0))),
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type search_orders_sort_field :: binary()
  def search_orders_sort_field do
    spec(is_binary())
  end

  @type search_orders_fulfillment_filter :: %{
          fulfillment_states: [binary()],
          fulfillment_types: [binary()]
        }

  def search_orders_fulfillment_filter do
    schema(%{
      fulfillment_states: spec(coll_of(spec(is_binary()))),
      fulfillment_types: spec(coll_of(spec(is_binary())))
    })
    |> selection([])
  end

  @type order_return_service_charge :: %{
          amount_money: SquareUp.Schema.money(),
          applied_money: SquareUp.Schema.money(),
          applied_taxes: [SquareUp.Schema.order_line_item_applied_tax()],
          calculation_phase: binary(),
          catalog_object_id: binary(),
          name: binary(),
          percentage: binary(),
          source_service_charge_uid: binary(),
          taxable: boolean(),
          total_money: SquareUp.Schema.money(),
          total_tax_money: SquareUp.Schema.money(),
          uid: binary()
        }

  def order_return_service_charge do
    schema(%{
      amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      applied_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      applied_taxes:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.order_line_item_applied_tax/0))),
      calculation_phase: spec(is_binary()),
      catalog_object_id: spec(is_binary()),
      name: spec(is_binary()),
      percentage: spec(is_binary()),
      source_service_charge_uid: spec(is_binary()),
      taxable: spec(is_boolean()),
      total_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      total_tax_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      uid: spec(is_binary())
    })
    |> selection([])
  end

  @type get_employee_wage_request :: %{}

  def get_employee_wage_request do
    schema(%{})
    |> selection([])
  end

  @type create_payment_request :: %{
          accept_partial_authorization: boolean(),
          amount_money: SquareUp.Schema.money(),
          app_fee_money: SquareUp.Schema.money(),
          autocomplete: boolean(),
          billing_address: SquareUp.Schema.address(),
          buyer_email_address: binary(),
          customer_id: binary(),
          delay_duration: binary(),
          idempotency_key: binary(),
          location_id: binary(),
          note: binary(),
          order_id: binary(),
          reference_id: binary(),
          shipping_address: SquareUp.Schema.address(),
          source_id: binary(),
          statement_description_identifier: binary(),
          tip_money: SquareUp.Schema.money(),
          verification_token: binary()
        }

  def create_payment_request do
    schema(%{
      accept_partial_authorization: spec(is_boolean()),
      amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      app_fee_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      autocomplete: spec(is_boolean()),
      billing_address: Norm.Delegate.delegate(&SquareUp.Schema.address/0),
      buyer_email_address: spec(is_binary()),
      customer_id: spec(is_binary()),
      delay_duration: spec(is_binary()),
      idempotency_key: spec(is_binary()),
      location_id: spec(is_binary()),
      note: spec(is_binary()),
      order_id: spec(is_binary()),
      reference_id: spec(is_binary()),
      shipping_address: Norm.Delegate.delegate(&SquareUp.Schema.address/0),
      source_id: spec(is_binary()),
      statement_description_identifier: spec(is_binary()),
      tip_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      verification_token: spec(is_binary())
    })
    |> selection([:source_id, :idempotency_key, :amount_money])
  end

  @type create_loyalty_account_request :: %{
          idempotency_key: binary(),
          loyalty_account: SquareUp.Schema.loyalty_account()
        }

  def create_loyalty_account_request do
    schema(%{
      idempotency_key: spec(is_binary()),
      loyalty_account: Norm.Delegate.delegate(&SquareUp.Schema.loyalty_account/0)
    })
    |> selection([:loyalty_account, :idempotency_key])
  end

  @type v1_item_color :: binary()
  def v1_item_color do
    spec(is_binary())
  end

  @type retrieve_inventory_adjustment_response :: %{
          adjustment: SquareUp.Schema.inventory_adjustment(),
          errors: [SquareUp.Schema.error()]
        }

  def retrieve_inventory_adjustment_response do
    schema(%{
      adjustment: Norm.Delegate.delegate(&SquareUp.Schema.inventory_adjustment/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type accept_dispute_request :: %{}

  def accept_dispute_request do
    schema(%{})
    |> selection([])
  end

  @type team_member_assigned_locations :: %{assignment_type: binary(), location_ids: [binary()]}

  def team_member_assigned_locations do
    schema(%{assignment_type: spec(is_binary()), location_ids: spec(coll_of(spec(is_binary())))})
    |> selection([])
  end

  @type catalog_info_request :: %{}

  def catalog_info_request do
    schema(%{})
    |> selection([])
  end

  @type v1_retrieve_bank_account_request :: %{}

  def v1_retrieve_bank_account_request do
    schema(%{})
    |> selection([])
  end

  @type create_location_response :: %{
          errors: [SquareUp.Schema.error()],
          location: SquareUp.Schema.location()
        }

  def create_location_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      location: Norm.Delegate.delegate(&SquareUp.Schema.location/0)
    })
    |> selection([])
  end

  @type catalog_quick_amounts_settings_option :: binary()
  def catalog_quick_amounts_settings_option do
    spec(is_binary())
  end

  @type team_member :: %{
          assigned_locations: SquareUp.Schema.team_member_assigned_locations(),
          created_at: binary(),
          email_address: binary(),
          family_name: binary(),
          given_name: binary(),
          id: binary(),
          is_owner: boolean(),
          phone_number: binary(),
          reference_id: binary(),
          status: binary(),
          updated_at: binary()
        }

  def team_member do
    schema(%{
      assigned_locations:
        Norm.Delegate.delegate(&SquareUp.Schema.team_member_assigned_locations/0),
      created_at: spec(is_binary()),
      email_address: spec(is_binary()),
      family_name: spec(is_binary()),
      given_name: spec(is_binary()),
      id: spec(is_binary()),
      is_owner: spec(is_boolean()),
      phone_number: spec(is_binary()),
      reference_id: spec(is_binary()),
      status: spec(is_binary()),
      updated_at: spec(is_binary())
    })
    |> selection([])
  end

  @type sort_order :: binary()
  def sort_order do
    spec(is_binary())
  end

  @type order_rounding_adjustment :: %{
          amount_money: SquareUp.Schema.money(),
          name: binary(),
          uid: binary()
        }

  def order_rounding_adjustment do
    schema(%{
      amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      name: spec(is_binary()),
      uid: spec(is_binary())
    })
    |> selection([])
  end

  @type v1_list_discounts_response :: %{items: [SquareUp.Schema.v1_discount()]}

  def v1_list_discounts_response do
    schema(%{items: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_discount/0)))})
    |> selection([])
  end

  @type customer_preferences :: %{email_unsubscribed: boolean()}

  def customer_preferences do
    schema(%{email_unsubscribed: spec(is_boolean())})
    |> selection([])
  end

  @type retrieve_customer_segment_request :: %{}

  def retrieve_customer_segment_request do
    schema(%{})
    |> selection([])
  end

  @type create_break_type_response :: %{
          break_type: SquareUp.Schema.break_type(),
          errors: [SquareUp.Schema.error()]
        }

  def create_break_type_response do
    schema(%{
      break_type: Norm.Delegate.delegate(&SquareUp.Schema.break_type/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type day_of_week :: binary()
  def day_of_week do
    spec(is_binary())
  end

  @type terminal_checkout_query :: %{
          filter: SquareUp.Schema.terminal_checkout_query_filter(),
          sort: SquareUp.Schema.terminal_checkout_query_sort()
        }

  def terminal_checkout_query do
    schema(%{
      filter: Norm.Delegate.delegate(&SquareUp.Schema.terminal_checkout_query_filter/0),
      sort: Norm.Delegate.delegate(&SquareUp.Schema.terminal_checkout_query_sort/0)
    })
    |> selection([])
  end

  @type refund_payment_request :: %{
          amount_money: SquareUp.Schema.money(),
          app_fee_money: SquareUp.Schema.money(),
          idempotency_key: binary(),
          payment_id: binary(),
          reason: binary()
        }

  def refund_payment_request do
    schema(%{
      amount_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      app_fee_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      idempotency_key: spec(is_binary()),
      payment_id: spec(is_binary()),
      reason: spec(is_binary())
    })
    |> selection([:idempotency_key, :amount_money, :payment_id])
  end

  @type redeem_loyalty_reward_response :: %{
          errors: [SquareUp.Schema.error()],
          event: SquareUp.Schema.loyalty_event()
        }

  def redeem_loyalty_reward_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      event: Norm.Delegate.delegate(&SquareUp.Schema.loyalty_event/0)
    })
    |> selection([])
  end

  @type v1_list_modifier_lists_request :: %{}

  def v1_list_modifier_lists_request do
    schema(%{})
    |> selection([])
  end

  @type card_square_product :: binary()
  def card_square_product do
    spec(is_binary())
  end

  @type catalog_query_sorted_attribute :: %{
          attribute_name: binary(),
          initial_attribute_value: binary(),
          sort_order: binary()
        }

  def catalog_query_sorted_attribute do
    schema(%{
      attribute_name: spec(is_binary()),
      initial_attribute_value: spec(is_binary()),
      sort_order: spec(is_binary())
    })
    |> selection([:attribute_name])
  end

  @type loyalty_event_accumulate_points :: %{
          loyalty_program_id: binary(),
          order_id: binary(),
          points: integer()
        }

  def loyalty_event_accumulate_points do
    schema(%{
      loyalty_program_id: spec(is_binary()),
      order_id: spec(is_binary()),
      points: spec(is_integer())
    })
    |> selection([])
  end

  @type update_item_taxes_request :: %{
          item_ids: [binary()],
          taxes_to_disable: [binary()],
          taxes_to_enable: [binary()]
        }

  def update_item_taxes_request do
    schema(%{
      item_ids: spec(coll_of(spec(is_binary()))),
      taxes_to_disable: spec(coll_of(spec(is_binary()))),
      taxes_to_enable: spec(coll_of(spec(is_binary())))
    })
    |> selection([:item_ids])
  end

  @type create_checkout_request :: %{
          additional_recipients: [SquareUp.Schema.charge_request_additional_recipient()],
          ask_for_shipping_address: boolean(),
          idempotency_key: binary(),
          merchant_support_email: binary(),
          note: binary(),
          order: SquareUp.Schema.create_order_request(),
          pre_populate_buyer_email: binary(),
          pre_populate_shipping_address: SquareUp.Schema.address(),
          redirect_url: binary()
        }

  def create_checkout_request do
    schema(%{
      additional_recipients:
        spec(
          coll_of(Norm.Delegate.delegate(&SquareUp.Schema.charge_request_additional_recipient/0))
        ),
      ask_for_shipping_address: spec(is_boolean()),
      idempotency_key: spec(is_binary()),
      merchant_support_email: spec(is_binary()),
      note: spec(is_binary()),
      order: Norm.Delegate.delegate(&SquareUp.Schema.create_order_request/0),
      pre_populate_buyer_email: spec(is_binary()),
      pre_populate_shipping_address: Norm.Delegate.delegate(&SquareUp.Schema.address/0),
      redirect_url: spec(is_binary())
    })
    |> selection([:idempotency_key, :order])
  end

  @type search_catalog_items_response :: %{
          cursor: binary(),
          errors: [SquareUp.Schema.error()],
          items: [SquareUp.Schema.catalog_object()],
          matched_variation_ids: [binary()]
        }

  def search_catalog_items_response do
    schema(%{
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      items: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.catalog_object/0))),
      matched_variation_ids: spec(coll_of(spec(is_binary())))
    })
    |> selection([])
  end

  @type create_device_code_response :: %{
          device_code: SquareUp.Schema.device_code(),
          errors: [SquareUp.Schema.error()]
        }

  def create_device_code_response do
    schema(%{
      device_code: Norm.Delegate.delegate(&SquareUp.Schema.device_code/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type location_capability :: binary()
  def location_capability do
    spec(is_binary())
  end

  @type v1_settlement :: %{
          bank_account_id: binary(),
          entries: [SquareUp.Schema.v1_settlement_entry()],
          id: binary(),
          initiated_at: binary(),
          status: binary(),
          total_money: SquareUp.Schema.v1_money()
        }

  def v1_settlement do
    schema(%{
      bank_account_id: spec(is_binary()),
      entries: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_settlement_entry/0))),
      id: spec(is_binary()),
      initiated_at: spec(is_binary()),
      status: spec(is_binary()),
      total_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0)
    })
    |> selection([])
  end

  @type v1_list_settlements_request_status :: binary()
  def v1_list_settlements_request_status do
    spec(is_binary())
  end

  @type list_workweek_configs_response :: %{
          cursor: binary(),
          errors: [SquareUp.Schema.error()],
          workweek_configs: [SquareUp.Schema.workweek_config()]
        }

  def list_workweek_configs_response do
    schema(%{
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      workweek_configs: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.workweek_config/0)))
    })
    |> selection([])
  end

  @type business_hours_period :: %{
          day_of_week: binary(),
          end_local_time: binary(),
          start_local_time: binary()
        }

  def business_hours_period do
    schema(%{
      day_of_week: spec(is_binary()),
      end_local_time: spec(is_binary()),
      start_local_time: spec(is_binary())
    })
    |> selection([])
  end

  @type retrieve_loyalty_account_response :: %{
          errors: [SquareUp.Schema.error()],
          loyalty_account: SquareUp.Schema.loyalty_account()
        }

  def retrieve_loyalty_account_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      loyalty_account: Norm.Delegate.delegate(&SquareUp.Schema.loyalty_account/0)
    })
    |> selection([])
  end

  @type v1_timecard_event :: %{
          clockin_time: binary(),
          clockout_time: binary(),
          created_at: binary(),
          event_type: binary(),
          id: binary()
        }

  def v1_timecard_event do
    schema(%{
      clockin_time: spec(is_binary()),
      clockout_time: spec(is_binary()),
      created_at: spec(is_binary()),
      event_type: spec(is_binary()),
      id: spec(is_binary())
    })
    |> selection([])
  end

  @type create_subscription_response :: %{
          errors: [SquareUp.Schema.error()],
          subscription: SquareUp.Schema.subscription()
        }

  def create_subscription_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      subscription: Norm.Delegate.delegate(&SquareUp.Schema.subscription/0)
    })
    |> selection([])
  end

  @type v1_adjust_inventory_request_adjustment_type :: binary()
  def v1_adjust_inventory_request_adjustment_type do
    spec(is_binary())
  end

  @type catalog_query_prefix :: %{attribute_name: binary(), attribute_prefix: binary()}

  def catalog_query_prefix do
    schema(%{attribute_name: spec(is_binary()), attribute_prefix: spec(is_binary())})
    |> selection([:attribute_name, :attribute_prefix])
  end

  @type shift_query :: %{
          filter: SquareUp.Schema.shift_filter(),
          sort: SquareUp.Schema.shift_sort()
        }

  def shift_query do
    schema(%{
      filter: Norm.Delegate.delegate(&SquareUp.Schema.shift_filter/0),
      sort: Norm.Delegate.delegate(&SquareUp.Schema.shift_sort/0)
    })
    |> selection([])
  end

  @type catalog_category :: %{name: binary()}

  def catalog_category do
    schema(%{name: spec(is_binary())})
    |> selection([])
  end

  @type list_dispute_evidence_response :: %{
          errors: [SquareUp.Schema.error()],
          evidence: [SquareUp.Schema.dispute_evidence()]
        }

  def list_dispute_evidence_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      evidence: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.dispute_evidence/0)))
    })
    |> selection([])
  end

  @type retrieve_cash_drawer_shift_request :: %{location_id: binary()}

  def retrieve_cash_drawer_shift_request do
    schema(%{location_id: spec(is_binary())})
    |> selection([:location_id])
  end

  @type retrieve_catalog_object_response :: %{
          errors: [SquareUp.Schema.error()],
          object: SquareUp.Schema.catalog_object(),
          related_objects: [SquareUp.Schema.catalog_object()]
        }

  def retrieve_catalog_object_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      object: Norm.Delegate.delegate(&SquareUp.Schema.catalog_object/0),
      related_objects: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.catalog_object/0)))
    })
    |> selection([])
  end

  @type time_range :: %{end_at: binary(), start_at: binary()}

  def time_range do
    schema(%{end_at: spec(is_binary()), start_at: spec(is_binary())})
    |> selection([])
  end

  @type retrieve_customer_group_response :: %{
          errors: [SquareUp.Schema.error()],
          group: SquareUp.Schema.customer_group()
        }

  def retrieve_customer_group_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      group: Norm.Delegate.delegate(&SquareUp.Schema.customer_group/0)
    })
    |> selection([])
  end

  @type search_loyalty_events_response :: %{
          cursor: binary(),
          errors: [SquareUp.Schema.error()],
          events: [SquareUp.Schema.loyalty_event()]
        }

  def search_loyalty_events_response do
    schema(%{
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      events: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.loyalty_event/0)))
    })
    |> selection([])
  end

  @type measurement_unit_volume :: binary()
  def measurement_unit_volume do
    spec(is_binary())
  end

  @type catalog_query_items_for_item_options :: %{item_option_ids: [binary()]}

  def catalog_query_items_for_item_options do
    schema(%{item_option_ids: spec(coll_of(spec(is_binary())))})
    |> selection([])
  end

  @type v1_list_inventory_request :: %{batch_token: binary(), limit: integer()}

  def v1_list_inventory_request do
    schema(%{batch_token: spec(is_binary()), limit: spec(is_integer())})
    |> selection([])
  end

  @type batch_retrieve_inventory_changes_request :: %{
          catalog_object_ids: [binary()],
          cursor: binary(),
          location_ids: [binary()],
          states: [binary()],
          types: [binary()],
          updated_after: binary(),
          updated_before: binary()
        }

  def batch_retrieve_inventory_changes_request do
    schema(%{
      catalog_object_ids: spec(coll_of(spec(is_binary()))),
      cursor: spec(is_binary()),
      location_ids: spec(coll_of(spec(is_binary()))),
      states: spec(coll_of(spec(is_binary()))),
      types: spec(coll_of(spec(is_binary()))),
      updated_after: spec(is_binary()),
      updated_before: spec(is_binary())
    })
    |> selection([])
  end

  @type customer_creation_source_filter :: %{rule: binary(), values: [binary()]}

  def customer_creation_source_filter do
    schema(%{rule: spec(is_binary()), values: spec(coll_of(spec(is_binary())))})
    |> selection([])
  end

  @type tender_card_details_entry_method :: binary()
  def tender_card_details_entry_method do
    spec(is_binary())
  end

  @type create_loyalty_reward_request :: %{
          idempotency_key: binary(),
          reward: SquareUp.Schema.loyalty_reward()
        }

  def create_loyalty_reward_request do
    schema(%{
      idempotency_key: spec(is_binary()),
      reward: Norm.Delegate.delegate(&SquareUp.Schema.loyalty_reward/0)
    })
    |> selection([:reward, :idempotency_key])
  end

  @type search_invoices_response :: %{
          cursor: binary(),
          errors: [SquareUp.Schema.error()],
          invoices: [SquareUp.Schema.invoice()]
        }

  def search_invoices_response do
    schema(%{
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      invoices: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.invoice/0)))
    })
    |> selection([])
  end

  @type create_catalog_image_response :: %{
          errors: [SquareUp.Schema.error()],
          image: SquareUp.Schema.catalog_object()
        }

  def create_catalog_image_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      image: Norm.Delegate.delegate(&SquareUp.Schema.catalog_object/0)
    })
    |> selection([])
  end

  @type v1_list_timecards_request :: %{
          batch_token: binary(),
          begin_clockin_time: binary(),
          begin_clockout_time: binary(),
          begin_updated_at: binary(),
          deleted: boolean(),
          employee_id: binary(),
          end_clockin_time: binary(),
          end_clockout_time: binary(),
          end_updated_at: binary(),
          limit: integer(),
          order: binary()
        }

  def v1_list_timecards_request do
    schema(%{
      batch_token: spec(is_binary()),
      begin_clockin_time: spec(is_binary()),
      begin_clockout_time: spec(is_binary()),
      begin_updated_at: spec(is_binary()),
      deleted: spec(is_boolean()),
      employee_id: spec(is_binary()),
      end_clockin_time: spec(is_binary()),
      end_clockout_time: spec(is_binary()),
      end_updated_at: spec(is_binary()),
      limit: spec(is_integer()),
      order: spec(is_binary())
    })
    |> selection([])
  end

  @type create_dispute_evidence_file_response :: %{
          errors: [SquareUp.Schema.error()],
          evidence: SquareUp.Schema.dispute_evidence()
        }

  def create_dispute_evidence_file_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      evidence: Norm.Delegate.delegate(&SquareUp.Schema.dispute_evidence/0)
    })
    |> selection([])
  end

  @type order_line_item_discount_scope :: binary()
  def order_line_item_discount_scope do
    spec(is_binary())
  end

  @type get_shift_response :: %{errors: [SquareUp.Schema.error()], shift: SquareUp.Schema.shift()}

  def get_shift_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      shift: Norm.Delegate.delegate(&SquareUp.Schema.shift/0)
    })
    |> selection([])
  end

  @type order_created_object :: %{order_created: SquareUp.Schema.order_created()}

  def order_created_object do
    schema(%{order_created: Norm.Delegate.delegate(&SquareUp.Schema.order_created/0)})
    |> selection([])
  end

  @type catalog_v1_id :: %{catalog_v1_id: binary(), location_id: binary()}

  def catalog_v1_id do
    schema(%{catalog_v1_id: spec(is_binary()), location_id: spec(is_binary())})
    |> selection([])
  end

  @type delete_invoice_response :: %{errors: [SquareUp.Schema.error()]}

  def delete_invoice_response do
    schema(%{errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))})
    |> selection([])
  end

  @type v1_phone_number :: %{calling_code: binary(), number: binary()}

  def v1_phone_number do
    schema(%{calling_code: spec(is_binary()), number: spec(is_binary())})
    |> selection([:calling_code, :number])
  end

  @type v1_update_page_cell_request :: %{body: SquareUp.Schema.v1_page_cell()}

  def v1_update_page_cell_request do
    schema(%{body: Norm.Delegate.delegate(&SquareUp.Schema.v1_page_cell/0)})
    |> selection([:body])
  end

  @type register_domain_response_status :: binary()
  def register_domain_response_status do
    spec(is_binary())
  end

  @type loyalty_account_mapping_type :: binary()
  def loyalty_account_mapping_type do
    spec(is_binary())
  end

  @type v1_delete_variation_request :: %{}

  def v1_delete_variation_request do
    schema(%{})
    |> selection([])
  end

  @type charge_response :: %{
          errors: [SquareUp.Schema.error()],
          transaction: SquareUp.Schema.transaction()
        }

  def charge_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      transaction: Norm.Delegate.delegate(&SquareUp.Schema.transaction/0)
    })
    |> selection([])
  end

  @type get_device_code_request :: %{}

  def get_device_code_request do
    schema(%{})
    |> selection([])
  end

  @type v1_list_employee_roles_response :: %{items: [SquareUp.Schema.v1_employee_role()]}

  def v1_list_employee_roles_response do
    schema(%{items: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_employee_role/0)))})
    |> selection([])
  end

  @type list_invoices_request :: %{cursor: binary(), limit: integer(), location_id: binary()}

  def list_invoices_request do
    schema(%{cursor: spec(is_binary()), limit: spec(is_integer()), location_id: spec(is_binary())})
    |> selection([:location_id])
  end

  @type v1_create_modifier_option_request :: %{body: SquareUp.Schema.v1_modifier_option()}

  def v1_create_modifier_option_request do
    schema(%{body: Norm.Delegate.delegate(&SquareUp.Schema.v1_modifier_option/0)})
    |> selection([])
  end

  @type get_device_code_response :: %{
          device_code: SquareUp.Schema.device_code(),
          errors: [SquareUp.Schema.error()]
        }

  def get_device_code_response do
    schema(%{
      device_code: Norm.Delegate.delegate(&SquareUp.Schema.device_code/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type inventory_adjustment :: %{
          catalog_object_id: binary(),
          catalog_object_type: binary(),
          created_at: binary(),
          employee_id: binary(),
          from_state: binary(),
          goods_receipt_id: binary(),
          id: binary(),
          location_id: binary(),
          occurred_at: binary(),
          purchase_order_id: binary(),
          quantity: binary(),
          reference_id: binary(),
          refund_id: binary(),
          source: SquareUp.Schema.source_application(),
          to_state: binary(),
          total_price_money: SquareUp.Schema.money(),
          transaction_id: binary()
        }

  def inventory_adjustment do
    schema(%{
      catalog_object_id: spec(is_binary()),
      catalog_object_type: spec(is_binary()),
      created_at: spec(is_binary()),
      employee_id: spec(is_binary()),
      from_state: spec(is_binary()),
      goods_receipt_id: spec(is_binary()),
      id: spec(is_binary()),
      location_id: spec(is_binary()),
      occurred_at: spec(is_binary()),
      purchase_order_id: spec(is_binary()),
      quantity: spec(is_binary()),
      reference_id: spec(is_binary()),
      refund_id: spec(is_binary()),
      source: Norm.Delegate.delegate(&SquareUp.Schema.source_application/0),
      to_state: spec(is_binary()),
      total_price_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      transaction_id: spec(is_binary())
    })
    |> selection([])
  end

  @type get_bank_account_by_v1_id_request :: %{}

  def get_bank_account_by_v1_id_request do
    schema(%{})
    |> selection([])
  end

  @type create_device_code_request :: %{
          device_code: SquareUp.Schema.device_code(),
          idempotency_key: binary()
        }

  def create_device_code_request do
    schema(%{
      device_code: Norm.Delegate.delegate(&SquareUp.Schema.device_code/0),
      idempotency_key: spec(is_binary())
    })
    |> selection([:idempotency_key, :device_code])
  end

  @type shift_sort_field :: binary()
  def shift_sort_field do
    spec(is_binary())
  end

  @type delete_customer_request :: %{}

  def delete_customer_request do
    schema(%{})
    |> selection([])
  end

  @type v1_list_bank_accounts_response :: %{items: [SquareUp.Schema.v1_bank_account()]}

  def v1_list_bank_accounts_response do
    schema(%{items: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_bank_account/0)))})
    |> selection([])
  end

  @type v1_update_variation_request :: %{body: SquareUp.Schema.v1_variation()}

  def v1_update_variation_request do
    schema(%{body: Norm.Delegate.delegate(&SquareUp.Schema.v1_variation/0)})
    |> selection([:body])
  end

  @type cash_drawer_event_type :: binary()
  def cash_drawer_event_type do
    spec(is_binary())
  end

  @type tender_bank_transfer_details_status :: binary()
  def tender_bank_transfer_details_status do
    spec(is_binary())
  end

  @type measurement_unit_length :: binary()
  def measurement_unit_length do
    spec(is_binary())
  end

  @type customer_segment :: %{
          created_at: binary(),
          id: binary(),
          name: binary(),
          updated_at: binary()
        }

  def customer_segment do
    schema(%{
      created_at: spec(is_binary()),
      id: spec(is_binary()),
      name: spec(is_binary()),
      updated_at: spec(is_binary())
    })
    |> selection([:name])
  end

  @type update_team_member_request :: %{team_member: SquareUp.Schema.team_member()}

  def update_team_member_request do
    schema(%{team_member: Norm.Delegate.delegate(&SquareUp.Schema.team_member/0)})
    |> selection([])
  end

  @type search_customers_request :: %{
          cursor: binary(),
          limit: integer(),
          query: SquareUp.Schema.customer_query()
        }

  def search_customers_request do
    schema(%{
      cursor: spec(is_binary()),
      limit: spec(is_integer()),
      query: Norm.Delegate.delegate(&SquareUp.Schema.customer_query/0)
    })
    |> selection([])
  end

  @type currency :: binary()
  def currency do
    spec(is_binary())
  end

  @type source_application :: %{application_id: binary(), name: binary(), product: binary()}

  def source_application do
    schema(%{
      application_id: spec(is_binary()),
      name: spec(is_binary()),
      product: spec(is_binary())
    })
    |> selection([])
  end

  @type v1_create_fee_request :: %{body: SquareUp.Schema.v1_fee()}

  def v1_create_fee_request do
    schema(%{body: Norm.Delegate.delegate(&SquareUp.Schema.v1_fee/0)})
    |> selection([])
  end

  @type retrieve_customer_group_request :: %{}

  def retrieve_customer_group_request do
    schema(%{})
    |> selection([])
  end

  @type device_checkout_options :: %{
          device_id: binary(),
          skip_receipt_screen: boolean(),
          tip_settings: SquareUp.Schema.tip_settings()
        }

  def device_checkout_options do
    schema(%{
      device_id: spec(is_binary()),
      skip_receipt_screen: spec(is_boolean()),
      tip_settings: Norm.Delegate.delegate(&SquareUp.Schema.tip_settings/0)
    })
    |> selection([:device_id])
  end

  @type employee :: %{
          created_at: binary(),
          email: binary(),
          first_name: binary(),
          id: binary(),
          is_owner: boolean(),
          last_name: binary(),
          location_ids: [binary()],
          phone_number: binary(),
          status: binary(),
          updated_at: binary()
        }

  def employee do
    schema(%{
      created_at: spec(is_binary()),
      email: spec(is_binary()),
      first_name: spec(is_binary()),
      id: spec(is_binary()),
      is_owner: spec(is_boolean()),
      last_name: spec(is_binary()),
      location_ids: spec(coll_of(spec(is_binary()))),
      phone_number: spec(is_binary()),
      status: spec(is_binary()),
      updated_at: spec(is_binary())
    })
    |> selection([])
  end

  @type retrieve_team_member_response :: %{
          errors: [SquareUp.Schema.error()],
          team_member: SquareUp.Schema.team_member()
        }

  def retrieve_team_member_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      team_member: Norm.Delegate.delegate(&SquareUp.Schema.team_member/0)
    })
    |> selection([])
  end

  @type v1_variation :: %{
          id: binary(),
          inventory_alert_threshold: integer(),
          inventory_alert_type: binary(),
          item_id: binary(),
          name: binary(),
          ordinal: integer(),
          price_money: SquareUp.Schema.v1_money(),
          pricing_type: binary(),
          sku: binary(),
          track_inventory: boolean(),
          user_data: binary(),
          v2_id: binary()
        }

  def v1_variation do
    schema(%{
      id: spec(is_binary()),
      inventory_alert_threshold: spec(is_integer()),
      inventory_alert_type: spec(is_binary()),
      item_id: spec(is_binary()),
      name: spec(is_binary()),
      ordinal: spec(is_integer()),
      price_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      pricing_type: spec(is_binary()),
      sku: spec(is_binary()),
      track_inventory: spec(is_boolean()),
      user_data: spec(is_binary()),
      v2_id: spec(is_binary())
    })
    |> selection([])
  end

  @type list_disputes_response :: %{
          cursor: binary(),
          disputes: [SquareUp.Schema.dispute()],
          errors: [SquareUp.Schema.error()]
        }

  def list_disputes_response do
    schema(%{
      cursor: spec(is_binary()),
      disputes: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.dispute/0))),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type tax_inclusion_type :: binary()
  def tax_inclusion_type do
    spec(is_binary())
  end

  @type tender_type :: binary()
  def tender_type do
    spec(is_binary())
  end

  @type customer_group :: %{
          created_at: binary(),
          id: binary(),
          name: binary(),
          updated_at: binary()
        }

  def customer_group do
    schema(%{
      created_at: spec(is_binary()),
      id: spec(is_binary()),
      name: spec(is_binary()),
      updated_at: spec(is_binary())
    })
    |> selection([:name])
  end

  @type calculate_order_response :: %{
          errors: [SquareUp.Schema.error()],
          order: SquareUp.Schema.order()
        }

  def calculate_order_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      order: Norm.Delegate.delegate(&SquareUp.Schema.order/0)
    })
    |> selection([])
  end

  @type get_bank_account_by_v1_id_response :: %{
          bank_account: SquareUp.Schema.bank_account(),
          errors: [SquareUp.Schema.error()]
        }

  def get_bank_account_by_v1_id_response do
    schema(%{
      bank_account: Norm.Delegate.delegate(&SquareUp.Schema.bank_account/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type v1_retrieve_modifier_list_request :: %{}

  def v1_retrieve_modifier_list_request do
    schema(%{})
    |> selection([])
  end

  @type get_payment_refund_response :: %{
          errors: [SquareUp.Schema.error()],
          refund: SquareUp.Schema.payment_refund()
        }

  def get_payment_refund_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      refund: Norm.Delegate.delegate(&SquareUp.Schema.payment_refund/0)
    })
    |> selection([])
  end

  @type delete_customer_group_request :: %{}

  def delete_customer_group_request do
    schema(%{})
    |> selection([])
  end

  @type delete_shift_request :: %{}

  def delete_shift_request do
    schema(%{})
    |> selection([])
  end

  @type v1_list_fees_response :: %{items: [SquareUp.Schema.v1_fee()]}

  def v1_list_fees_response do
    schema(%{items: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_fee/0)))})
    |> selection([])
  end

  @type search_team_members_response :: %{
          cursor: binary(),
          errors: [SquareUp.Schema.error()],
          team_members: [SquareUp.Schema.team_member()]
        }

  def search_team_members_response do
    schema(%{
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      team_members: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.team_member/0)))
    })
    |> selection([])
  end

  @type create_mobile_authorization_code_response :: %{
          authorization_code: binary(),
          error: SquareUp.Schema.error(),
          expires_at: binary()
        }

  def create_mobile_authorization_code_response do
    schema(%{
      authorization_code: spec(is_binary()),
      error: Norm.Delegate.delegate(&SquareUp.Schema.error/0),
      expires_at: spec(is_binary())
    })
    |> selection([])
  end

  @type retrieve_employee_response :: %{
          employee: SquareUp.Schema.employee(),
          errors: [SquareUp.Schema.error()]
        }

  def retrieve_employee_response do
    schema(%{
      employee: Norm.Delegate.delegate(&SquareUp.Schema.employee/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type catalog_custom_attribute_definition_selection_config :: %{
          allowed_selections: [
            SquareUp.Schema.catalog_custom_attribute_definition_selection_config_custom_attribute_selection()
          ],
          max_allowed_selections: integer()
        }

  def catalog_custom_attribute_definition_selection_config do
    schema(%{
      allowed_selections:
        spec(
          coll_of(
            Norm.Delegate.delegate(
              &SquareUp.Schema.catalog_custom_attribute_definition_selection_config_custom_attribute_selection/0
            )
          )
        ),
      max_allowed_selections: spec(is_integer())
    })
    |> selection([])
  end

  @type dispute_reason :: binary()
  def dispute_reason do
    spec(is_binary())
  end

  @type transaction_type :: binary()
  def transaction_type do
    spec(is_binary())
  end

  @type search_team_members_query :: %{filter: SquareUp.Schema.search_team_members_filter()}

  def search_team_members_query do
    schema(%{filter: Norm.Delegate.delegate(&SquareUp.Schema.search_team_members_filter/0)})
    |> selection([])
  end

  @type loyalty_event_expire_points :: %{loyalty_program_id: binary(), points: integer()}

  def loyalty_event_expire_points do
    schema(%{loyalty_program_id: spec(is_binary()), points: spec(is_integer())})
    |> selection([:loyalty_program_id, :points])
  end

  @type loyalty_account :: %{
          balance: integer(),
          created_at: binary(),
          customer_id: binary(),
          enrolled_at: binary(),
          id: binary(),
          lifetime_points: integer(),
          mappings: [SquareUp.Schema.loyalty_account_mapping()],
          program_id: binary(),
          updated_at: binary()
        }

  def loyalty_account do
    schema(%{
      balance: spec(is_integer()),
      created_at: spec(is_binary()),
      customer_id: spec(is_binary()),
      enrolled_at: spec(is_binary()),
      id: spec(is_binary()),
      lifetime_points: spec(is_integer()),
      mappings: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.loyalty_account_mapping/0))),
      program_id: spec(is_binary()),
      updated_at: spec(is_binary())
    })
    |> selection([:mappings, :program_id])
  end

  @type list_team_member_wages_request :: %{
          cursor: binary(),
          limit: integer(),
          team_member_id: binary()
        }

  def list_team_member_wages_request do
    schema(%{
      cursor: spec(is_binary()),
      limit: spec(is_integer()),
      team_member_id: spec(is_binary())
    })
    |> selection([])
  end

  @type retrieve_inventory_physical_count_response :: %{
          count: SquareUp.Schema.inventory_physical_count(),
          errors: [SquareUp.Schema.error()]
        }

  def retrieve_inventory_physical_count_response do
    schema(%{
      count: Norm.Delegate.delegate(&SquareUp.Schema.inventory_physical_count/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type v1_payment_surcharge_type :: binary()
  def v1_payment_surcharge_type do
    spec(is_binary())
  end

  @type custom_attribute_filter :: %{
          bool_filter: boolean(),
          custom_attribute_definition_id: binary(),
          key: binary(),
          number_filter: SquareUp.Schema.range(),
          selection_uids_filter: [binary()],
          string_filter: binary()
        }

  def custom_attribute_filter do
    schema(%{
      bool_filter: spec(is_boolean()),
      custom_attribute_definition_id: spec(is_binary()),
      key: spec(is_binary()),
      number_filter: Norm.Delegate.delegate(&SquareUp.Schema.range/0),
      selection_uids_filter: spec(coll_of(spec(is_binary()))),
      string_filter: spec(is_binary())
    })
    |> selection([])
  end

  @type card_brand :: binary()
  def card_brand do
    spec(is_binary())
  end

  @type order_return_tax :: %{
          applied_money: SquareUp.Schema.money(),
          catalog_object_id: binary(),
          name: binary(),
          percentage: binary(),
          scope: binary(),
          source_tax_uid: binary(),
          type: binary(),
          uid: binary()
        }

  def order_return_tax do
    schema(%{
      applied_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      catalog_object_id: spec(is_binary()),
      name: spec(is_binary()),
      percentage: spec(is_binary()),
      scope: spec(is_binary()),
      source_tax_uid: spec(is_binary()),
      type: spec(is_binary()),
      uid: spec(is_binary())
    })
    |> selection([])
  end

  @type catalog_image :: %{caption: binary(), name: binary(), url: binary()}

  def catalog_image do
    schema(%{caption: spec(is_binary()), name: spec(is_binary()), url: spec(is_binary())})
    |> selection([])
  end

  @type v1_category :: %{id: binary(), name: binary(), v2_id: binary()}

  def v1_category do
    schema(%{id: spec(is_binary()), name: spec(is_binary()), v2_id: spec(is_binary())})
    |> selection([])
  end

  @type action_cancel_reason :: binary()
  def action_cancel_reason do
    spec(is_binary())
  end

  @type v1_list_locations_response :: %{items: [SquareUp.Schema.v1_merchant()]}

  def v1_list_locations_response do
    schema(%{items: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.v1_merchant/0)))})
    |> selection([])
  end

  @type search_catalog_items_request_stock_level :: binary()
  def search_catalog_items_request_stock_level do
    spec(is_binary())
  end

  @type order_service_charge_calculation_phase :: binary()
  def order_service_charge_calculation_phase do
    spec(is_binary())
  end

  @type remove_group_from_customer_response :: %{errors: [SquareUp.Schema.error()]}

  def remove_group_from_customer_response do
    schema(%{errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))})
    |> selection([])
  end

  @type upsert_catalog_object_response :: %{
          catalog_object: SquareUp.Schema.catalog_object(),
          errors: [SquareUp.Schema.error()],
          id_mappings: [SquareUp.Schema.catalog_id_mapping()]
        }

  def upsert_catalog_object_response do
    schema(%{
      catalog_object: Norm.Delegate.delegate(&SquareUp.Schema.catalog_object/0),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      id_mappings: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.catalog_id_mapping/0)))
    })
    |> selection([])
  end

  @type list_device_codes_response :: %{
          cursor: binary(),
          device_codes: [SquareUp.Schema.device_code()],
          errors: [SquareUp.Schema.error()]
        }

  def list_device_codes_response do
    schema(%{
      cursor: spec(is_binary()),
      device_codes: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.device_code/0))),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type business_hours :: %{periods: [SquareUp.Schema.business_hours_period()]}

  def business_hours do
    schema(%{
      periods: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.business_hours_period/0)))
    })
    |> selection([])
  end

  @type capture_transaction_response :: %{errors: [SquareUp.Schema.error()]}

  def capture_transaction_response do
    schema(%{errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))})
    |> selection([])
  end

  @type v1_create_refund_request :: %{
          payment_id: binary(),
          reason: binary(),
          refunded_money: SquareUp.Schema.v1_money(),
          request_idempotence_key: binary(),
          type: binary()
        }

  def v1_create_refund_request do
    schema(%{
      payment_id: spec(is_binary()),
      reason: spec(is_binary()),
      refunded_money: Norm.Delegate.delegate(&SquareUp.Schema.v1_money/0),
      request_idempotence_key: spec(is_binary()),
      type: spec(is_binary())
    })
    |> selection([:payment_id, :type, :reason])
  end

  @type v1_adjust_inventory_request :: %{
          adjustment_type: binary(),
          memo: binary(),
          quantity_delta: number()
        }

  def v1_adjust_inventory_request do
    schema(%{
      adjustment_type: spec(is_binary()),
      memo: spec(is_binary()),
      quantity_delta: spec(is_number())
    })
    |> selection([])
  end

  @type catalog_quick_amount :: %{
          amount: SquareUp.Schema.money(),
          ordinal: integer(),
          score: integer(),
          type: binary()
        }

  def catalog_quick_amount do
    schema(%{
      amount: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      ordinal: spec(is_integer()),
      score: spec(is_integer()),
      type: spec(is_binary())
    })
    |> selection([:type, :amount])
  end

  @type loyalty_program_expiration_policy :: %{expiration_duration: binary()}

  def loyalty_program_expiration_policy do
    schema(%{expiration_duration: spec(is_binary())})
    |> selection([:expiration_duration])
  end

  @type team_member_wage :: %{
          hourly_rate: SquareUp.Schema.money(),
          id: binary(),
          team_member_id: binary(),
          title: binary()
        }

  def team_member_wage do
    schema(%{
      hourly_rate: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      id: spec(is_binary()),
      team_member_id: spec(is_binary()),
      title: spec(is_binary())
    })
    |> selection([])
  end

  @type create_dispute_evidence_text_request :: %{
          evidence_text: binary(),
          evidence_type: binary(),
          idempotency_key: binary()
        }

  def create_dispute_evidence_text_request do
    schema(%{
      evidence_text: spec(is_binary()),
      evidence_type: spec(is_binary()),
      idempotency_key: spec(is_binary())
    })
    |> selection([:idempotency_key, :evidence_text])
  end

  @type delete_catalog_object_request :: %{}

  def delete_catalog_object_request do
    schema(%{})
    |> selection([])
  end

  @type calculate_order_request :: %{
          order: SquareUp.Schema.order(),
          proposed_rewards: [SquareUp.Schema.order_reward()]
        }

  def calculate_order_request do
    schema(%{
      order: Norm.Delegate.delegate(&SquareUp.Schema.order/0),
      proposed_rewards: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.order_reward/0)))
    })
    |> selection([:order])
  end

  @type get_payment_refund_request :: %{}

  def get_payment_refund_request do
    schema(%{})
    |> selection([])
  end

  @type update_location_response :: %{
          errors: [SquareUp.Schema.error()],
          location: SquareUp.Schema.location()
        }

  def update_location_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      location: Norm.Delegate.delegate(&SquareUp.Schema.location/0)
    })
    |> selection([])
  end

  @type search_orders_customer_filter :: %{customer_ids: [binary()]}

  def search_orders_customer_filter do
    schema(%{customer_ids: spec(coll_of(spec(is_binary())))})
    |> selection([])
  end

  @type customer_text_filter :: %{exact: binary(), fuzzy: binary()}

  def customer_text_filter do
    schema(%{exact: spec(is_binary()), fuzzy: spec(is_binary())})
    |> selection([])
  end

  @type v1_update_employee_request :: %{body: SquareUp.Schema.v1_employee()}

  def v1_update_employee_request do
    schema(%{body: Norm.Delegate.delegate(&SquareUp.Schema.v1_employee/0)})
    |> selection([:body])
  end

  @type v1_create_employee_role_request :: %{employee_role: SquareUp.Schema.v1_employee_role()}

  def v1_create_employee_role_request do
    schema(%{employee_role: Norm.Delegate.delegate(&SquareUp.Schema.v1_employee_role/0)})
    |> selection([])
  end

  @type card_type :: binary()
  def card_type do
    spec(is_binary())
  end

  @type create_refund_response :: %{
          errors: [SquareUp.Schema.error()],
          refund: SquareUp.Schema.refund()
        }

  def create_refund_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      refund: Norm.Delegate.delegate(&SquareUp.Schema.refund/0)
    })
    |> selection([])
  end

  @type search_shifts_response :: %{
          cursor: binary(),
          errors: [SquareUp.Schema.error()],
          shifts: [SquareUp.Schema.shift()]
        }

  def search_shifts_response do
    schema(%{
      cursor: spec(is_binary()),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      shifts: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.shift/0)))
    })
    |> selection([])
  end

  @type update_subscription_request :: %{subscription: SquareUp.Schema.subscription()}

  def update_subscription_request do
    schema(%{subscription: Norm.Delegate.delegate(&SquareUp.Schema.subscription/0)})
    |> selection([])
  end

  @type v1_update_item_request :: %{body: SquareUp.Schema.v1_item()}

  def v1_update_item_request do
    schema(%{body: Norm.Delegate.delegate(&SquareUp.Schema.v1_item/0)})
    |> selection([:body])
  end

  @type standard_unit_description :: %{
          abbreviation: binary(),
          name: binary(),
          unit: SquareUp.Schema.measurement_unit()
        }

  def standard_unit_description do
    schema(%{
      abbreviation: spec(is_binary()),
      name: spec(is_binary()),
      unit: Norm.Delegate.delegate(&SquareUp.Schema.measurement_unit/0)
    })
    |> selection([])
  end

  @type v1_fee_inclusion_type :: binary()
  def v1_fee_inclusion_type do
    spec(is_binary())
  end

  @type v1_update_modifier_option_request :: %{body: SquareUp.Schema.v1_modifier_option()}

  def v1_update_modifier_option_request do
    schema(%{body: Norm.Delegate.delegate(&SquareUp.Schema.v1_modifier_option/0)})
    |> selection([:body])
  end

  @type list_employees_response :: %{
          cursor: binary(),
          employees: [SquareUp.Schema.employee()],
          errors: [SquareUp.Schema.error()]
        }

  def list_employees_response do
    schema(%{
      cursor: spec(is_binary()),
      employees: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.employee/0))),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type catalog_query_exact :: %{attribute_name: binary(), attribute_value: binary()}

  def catalog_query_exact do
    schema(%{attribute_name: spec(is_binary()), attribute_value: spec(is_binary())})
    |> selection([:attribute_name, :attribute_value])
  end

  @type remove_dispute_evidence_response :: %{errors: [SquareUp.Schema.error()]}

  def remove_dispute_evidence_response do
    schema(%{errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))})
    |> selection([])
  end

  @type complete_payment_response :: %{
          errors: [SquareUp.Schema.error()],
          payment: SquareUp.Schema.payment()
        }

  def complete_payment_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      payment: Norm.Delegate.delegate(&SquareUp.Schema.payment/0)
    })
    |> selection([])
  end

  @type search_loyalty_rewards_request_loyalty_reward_query :: %{
          loyalty_account_id: binary(),
          status: binary()
        }

  def search_loyalty_rewards_request_loyalty_reward_query do
    schema(%{loyalty_account_id: spec(is_binary()), status: spec(is_binary())})
    |> selection([:loyalty_account_id])
  end

  @type batch_retrieve_inventory_counts_request :: %{
          catalog_object_ids: [binary()],
          cursor: binary(),
          location_ids: [binary()],
          states: [binary()],
          updated_after: binary()
        }

  def batch_retrieve_inventory_counts_request do
    schema(%{
      catalog_object_ids: spec(coll_of(spec(is_binary()))),
      cursor: spec(is_binary()),
      location_ids: spec(coll_of(spec(is_binary()))),
      states: spec(coll_of(spec(is_binary()))),
      updated_after: spec(is_binary())
    })
    |> selection([])
  end

  @type delete_catalog_object_response :: %{
          deleted_at: binary(),
          deleted_object_ids: [binary()],
          errors: [SquareUp.Schema.error()]
        }

  def delete_catalog_object_response do
    schema(%{
      deleted_at: spec(is_binary()),
      deleted_object_ids: spec(coll_of(spec(is_binary()))),
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0)))
    })
    |> selection([])
  end

  @type list_payment_refunds_request :: %{
          begin_time: binary(),
          cursor: binary(),
          end_time: binary(),
          location_id: binary(),
          sort_order: binary(),
          source_type: binary(),
          status: binary()
        }

  def list_payment_refunds_request do
    schema(%{
      begin_time: spec(is_binary()),
      cursor: spec(is_binary()),
      end_time: spec(is_binary()),
      location_id: spec(is_binary()),
      sort_order: spec(is_binary()),
      source_type: spec(is_binary()),
      status: spec(is_binary())
    })
    |> selection([])
  end

  @type dispute_state :: binary()
  def dispute_state do
    spec(is_binary())
  end

  @type search_catalog_items_request :: %{
          category_ids: [binary()],
          cursor: binary(),
          custom_attribute_filters: [SquareUp.Schema.custom_attribute_filter()],
          enabled_location_ids: [binary()],
          limit: integer(),
          product_types: [binary()],
          sort_order: binary(),
          stock_levels: [binary()],
          text_filter: binary()
        }

  def search_catalog_items_request do
    schema(%{
      category_ids: spec(coll_of(spec(is_binary()))),
      cursor: spec(is_binary()),
      custom_attribute_filters:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.custom_attribute_filter/0))),
      enabled_location_ids: spec(coll_of(spec(is_binary()))),
      limit: spec(is_integer()),
      product_types: spec(coll_of(spec(is_binary()))),
      sort_order: spec(is_binary()),
      stock_levels: spec(coll_of(spec(is_binary()))),
      text_filter: spec(is_binary())
    })
    |> selection([])
  end

  @type v1_item_visibility :: binary()
  def v1_item_visibility do
    spec(is_binary())
  end

  @type list_customer_segments_request :: %{cursor: binary()}

  def list_customer_segments_request do
    schema(%{cursor: spec(is_binary())})
    |> selection([])
  end

  @type job_assignment :: %{
          annual_rate: SquareUp.Schema.money(),
          hourly_rate: SquareUp.Schema.money(),
          job_title: binary(),
          pay_type: binary(),
          weekly_hours: integer()
        }

  def job_assignment do
    schema(%{
      annual_rate: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      hourly_rate: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      job_title: spec(is_binary()),
      pay_type: spec(is_binary()),
      weekly_hours: spec(is_integer())
    })
    |> selection([:job_title, :pay_type])
  end

  @type loyalty_program_reward_definition_type :: binary()
  def loyalty_program_reward_definition_type do
    spec(is_binary())
  end

  @type location_status :: binary()
  def location_status do
    spec(is_binary())
  end

  @type catalog_id_mapping :: %{client_object_id: binary(), object_id: binary()}

  def catalog_id_mapping do
    schema(%{client_object_id: spec(is_binary()), object_id: spec(is_binary())})
    |> selection([])
  end

  @type loyalty_reward_status :: binary()
  def loyalty_reward_status do
    spec(is_binary())
  end

  @type v1_create_category_request :: %{body: SquareUp.Schema.v1_category()}

  def v1_create_category_request do
    schema(%{body: Norm.Delegate.delegate(&SquareUp.Schema.v1_category/0)})
    |> selection([])
  end

  @type catalog_item_option :: %{
          description: binary(),
          display_name: binary(),
          item_count: integer(),
          name: binary(),
          show_colors: boolean(),
          values: [SquareUp.Schema.catalog_object()]
        }

  def catalog_item_option do
    schema(%{
      description: spec(is_binary()),
      display_name: spec(is_binary()),
      item_count: spec(is_integer()),
      name: spec(is_binary()),
      show_colors: spec(is_boolean()),
      values: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.catalog_object/0)))
    })
    |> selection([])
  end

  @type order_return :: %{
          return_amounts: SquareUp.Schema.order_money_amounts(),
          return_discounts: [SquareUp.Schema.order_return_discount()],
          return_line_items: [SquareUp.Schema.order_return_line_item()],
          return_service_charges: [SquareUp.Schema.order_return_service_charge()],
          return_taxes: [SquareUp.Schema.order_return_tax()],
          rounding_adjustment: SquareUp.Schema.order_rounding_adjustment(),
          source_order_id: binary(),
          uid: binary()
        }

  def order_return do
    schema(%{
      return_amounts: Norm.Delegate.delegate(&SquareUp.Schema.order_money_amounts/0),
      return_discounts:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.order_return_discount/0))),
      return_line_items:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.order_return_line_item/0))),
      return_service_charges:
        spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.order_return_service_charge/0))),
      return_taxes: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.order_return_tax/0))),
      rounding_adjustment: Norm.Delegate.delegate(&SquareUp.Schema.order_rounding_adjustment/0),
      source_order_id: spec(is_binary()),
      uid: spec(is_binary())
    })
    |> selection([])
  end

  @type transaction_product :: binary()
  def transaction_product do
    spec(is_binary())
  end

  @type v1_delete_category_request :: %{}

  def v1_delete_category_request do
    schema(%{})
    |> selection([])
  end

  @type v1_retrieve_item_request :: %{}

  def v1_retrieve_item_request do
    schema(%{})
    |> selection([])
  end

  @type bulk_create_team_members_response :: %{
          errors: [SquareUp.Schema.error()],
          team_members: map()
        }

  def bulk_create_team_members_response do
    schema(%{
      errors: spec(coll_of(Norm.Delegate.delegate(&SquareUp.Schema.error/0))),
      team_members: schema(%{})
    })
    |> selection([])
  end

  @type order_return_line_item_modifier :: %{
          base_price_money: SquareUp.Schema.money(),
          catalog_object_id: binary(),
          name: binary(),
          source_modifier_uid: binary(),
          total_price_money: SquareUp.Schema.money(),
          uid: binary()
        }

  def order_return_line_item_modifier do
    schema(%{
      base_price_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      catalog_object_id: spec(is_binary()),
      name: spec(is_binary()),
      source_modifier_uid: spec(is_binary()),
      total_price_money: Norm.Delegate.delegate(&SquareUp.Schema.money/0),
      uid: spec(is_binary())
    })
    |> selection([])
  end

  @type v1_tender_type :: binary()
  def v1_tender_type do
    spec(is_binary())
  end
end