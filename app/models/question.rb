class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answers, dependent: :destroy
  validates :text, :quiz_id, presence: true
end
