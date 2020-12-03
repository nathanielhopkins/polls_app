class Question < ApplicationRecord
  has_many(
    :answer_choices,
    class_name: 'AnswerChoice',
    foreign_key: :question_id,
    primary_key: :id
  )

  belongs_to(
    :poll,
    class_name: 'Poll',
    foreign_key: :poll_id,
    primary_key: :id
  )

  has_many(
    :responses,
    through: :answer_choices,
    source: :responses
  )

  validates :text, presence: true

  def results
    results = {}
    answer_choices = self.answer_choices.includes(:responses)
    answer_choices.each do |answer|
      results[answer.text] = answer.responses.length
    end
    results
  end
end