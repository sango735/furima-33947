class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :price, :postal_code, :area_id, :municipality, :town, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
   validates :token
   validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
   validates :area_id, numericality: { other_than: 1, message: 'Select' }
   validates :municipality
   validates :town
   validates :phone_number, numericality: { only_integer: true }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, town: town, building_name: building_name, phone_number: phone_number,user_id: user_id, order_id: order.id)
  end
end
