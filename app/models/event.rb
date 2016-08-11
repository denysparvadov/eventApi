class Event < ApplicationRecord
  validates :title, :tickets_amount, :date_start, :date_end, presence: true
  validates :tickets_amount, numericality: {only_integer: true, :greater_than_or_equal_to => 0}
  validates :title, length: {in: 2..40}
  validates :date_end, date: {after_or_equal_to: :date_start}
  validates :date_start, date: {after_or_equal_to: Date.current}
end
