class Prescription < ApplicationRecord
    belongs_to :user
    has_many :medicines, dependent: :destroy

    validates :start_time, presence: true
    validates :visit_date, presence: true
    validates :hospital, presence: true
    validates :doctor, presence: true
    validates :pharmacy, presence: true




    default_scope -> { order(created_at: :desc) }
    paginates_per 2

    def previous
    end

    def next
    end
end
