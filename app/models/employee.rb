class Employee < ApplicationRecord
    validates :alias, uniqueness: true
    validates :title, uniqueness: true
    
    belongs_to :dog
end
