class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :finishes, dependent: :destroy
  validates :title, :sub_title, presence: true

  scope :random, -> { order(Arel.sql('random()')).first }
end
