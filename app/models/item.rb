class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name, length:{ maximum: 40}
    validates :explanation, length:{maximum: 1000}
    validates :category_id, numericality: { other_than: 1, message: 'Select'  } 
    validates :state_id, numericality: { other_than: 1, message: 'Select'  } 
    validates :burden_id, numericality: { other_than: 1, message: 'Select'  } 
    validates :area_id, numericality: { other_than: 1, message: 'Select'  } 
    validates :days_id, numericality: { other_than: 1, message: 'Select' } 
    validates :price, format: { with: /\d[0-9]+\z/},numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to:9999999,message: 'Out of setting range' }
  end

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :burden
  belongs_to :category
  belongs_to :days
  belongs_to :state
end
