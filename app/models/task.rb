class Task < ApplicationRecord
    validates :name, presence: true
    validates :details, presence: true
    enum priority: [:Low, :Medium, :High]
end
