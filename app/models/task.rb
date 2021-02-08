class Task < ApplicationRecord

    has_many :chores
    has_many :children, through: :chores

    validates_presence_of(:name)
    validates :points, numericality: {:only_integer}

    scope :alphabetical, -> {order('name')}
    scope :active, -> {where(active: true)}



end
