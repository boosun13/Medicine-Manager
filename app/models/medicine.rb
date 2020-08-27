class Medicine < ApplicationRecord
  belongs_to :prescription
  has_many :checkers

  validates :name, presence: true
  validates :days, presence: true
  validates :usage, presence: true
  validates :detail_type, presence: true
  
end
