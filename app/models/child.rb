class Child < ApplicationRecord

    has_many :chores
    has_many :tasks, through: :tasks

    validates_presence_of(:first_name)
    validates_presence_of(:last_name)

    scope :alphabetical, -> {order('last_name, first_name')}

    scope :active, -> {where(active: true)}

    def name

        first_name + last_name

    end
    
end
