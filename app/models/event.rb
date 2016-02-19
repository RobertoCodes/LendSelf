class Event < ActiveRecord::Base

  validates :name, presence: true
  validates :description, presence: true
  validates :date, presence: true

end
