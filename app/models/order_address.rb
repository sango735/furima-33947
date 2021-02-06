class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :area_id, :municipality, :address, :building_name, :phone_number

  with_options presence: true do
   validates :token
   validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
   validates :area_id, numericality: { other_than: 1, message: 'Select' }
   validates :municipality
   validates :address
   validates :phone_number, numericality: { only_integer: true }
  end

  def save
    user = User.find(params[:id])
    Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, user_id: user.id)
  end
end
