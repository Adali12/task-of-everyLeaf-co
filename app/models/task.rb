class Task < ApplicationRecord
    validates :name, presence: true
    validates :details, presence: true
    enum priority: [:Low, :Medium, :High]
    paginates_per 5
end
