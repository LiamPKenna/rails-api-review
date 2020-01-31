class Finish < ApplicationRecord
  belongs_to :quiz
  validates :text, :quiz_id, presence: true
end
