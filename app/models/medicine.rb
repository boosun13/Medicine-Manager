class Medicine < ApplicationRecord
  belongs_to :prescription

  validates :name, presence: true
  validates :days, presence: true
  validates :usage, presence: true
  validates :detail_type, presence: true
  
end
