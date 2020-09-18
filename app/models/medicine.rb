class Medicine < ApplicationRecord
  belongs_to :prescription
  has_many :checkers

  validates :name, presence: true
  validates :days, presence: true
  validates :usage, presence: true
  validates :detail_type, presence: true
  validates :times, presence: true, if: :normal_medicine?

  private

  def normal_medicine?
    medicine_type == 'normal'
  end
end
