class AnswerChoice < ApplicationRecord
  belongs_to(
    :question,
    class_name: 'Question',
    foreign_key: :question_id,
    primary_key: :id
  )

  has_many(
    :responses, dependent: :destroy
    class_name: 'Response',
    foreign_key: :answer_choice_id,
    primary_key: :id
  )

  validates :text, presence: true
end