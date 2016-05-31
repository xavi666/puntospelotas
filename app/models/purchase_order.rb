# == Schema Information
#
# Table name: purchase_orders
#
#  id                        :integer          not null, primary key
#  ref_no                    :integer
#  po_date                   :date
#  carriage_terms            :text
#  payment_terms             :text
#  due_date                  :date
#  created_at                :datetime
#  updated_at                :datetime
#  supplier_id               :integer
#  net_cost                  :float
#  vat_cost                  :float
#  total_cost                :float
#  default_vat_rate          :float
#  buyer_id                  :integer
#  contact_id                :integer
#  currency_id               :integer
#  vat_rate                  :float
#  local_net_cost            :float
#  local_vat_cost            :float
#  local_total_cost          :float
#  status                    :string
#  sent_at                   :datetime
#  paid_at                   :datetime
#  revision                  :integer
#  has_been_revised          :boolean
#  current_revision_id       :integer
#  previous_revision_id      :integer
#  next_revision_id          :integer
#  discount_cost             :float            default(0.0)
#  total_with_discount       :float            default(0.0)
#  local_discount_cost       :float            default(0.0)
#  local_total_with_discount :float            default(0.0)
#  supplier_notes            :text
#  internal_notes            :text
#  net_cost_cents            :integer
#  vat_cost_cents            :integer
#  total_cost_cents          :integer
#  local_net_cost_cents      :integer
#  local_vat_cost_cents      :integer
#  local_total_cost_cents    :integer
#  currency                  :string
#  carriage_cost_cents       :integer          default(0)
#  local_carriage_cost_cents :integer          default(0)
#  received_status           :string
#  parts_cost_cents          :integer
#  local_parts_cost_cents    :integer
#  magic_fields              :jsonb
#  supplier_reference        :string
#  invoiced_cost_cents       :integer
#  local_invoiced_cost_cents :integer
#  duplicated_from_id        :integer
#  duplicated_to             :text
#  fully_approved_at         :date
#

require FlowlensPurchasing::Engine.root.join('app', 'models', 'purchase_order')

class PurchaseOrder < ActiveRecord::Base

  # !**************************************************
  # !                Associations
  # !**************************************************
  belongs_to :delivery_address, class_name: "Address"

  # !**************************************************
  # !                Validations
  # !**************************************************

  # !**************************************************
  # !                Callbacks
  # !**************************************************

  # !**************************************************
  # !                  Other
  # !**************************************************
  ADDITIONAL_PARAMS = [:delivery_address_id]

end
