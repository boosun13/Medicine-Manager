class Prescription < ApplicationRecord
    belongs_to :user
    has_many :medicines

    default_scope -> { order(created_at: :desc) }
    paginates_per 4
end
