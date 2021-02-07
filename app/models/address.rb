class Address < ApplicationRecord
  belongs_to :order
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
end
