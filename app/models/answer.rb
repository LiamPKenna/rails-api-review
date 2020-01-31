class Answer < ApplicationRecord
  belongs_to :question
  validates :text, :question_id, presence: true
end
