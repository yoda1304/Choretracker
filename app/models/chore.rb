class Chore < ApplicationRecord

    belongs_to :child
    belongs_to :task

    validates_timeliness_of(:due_on)

    scope :by_task, -> {joins(:task).order('name')}
    scope :chronological, -> {order('due_on, completed')}
    scope :pending, -> {where(completed: false)}
    scope :done, -> {where(completed: true)}
    scope :upcoming, -> {where('due_on >= ?', Date.today)}
    scope :past, -> {where('due_on < ?', Date.today)}

    def status 

        if completed
            "Completed"
        else

            "Pending"

        end

    end




end
