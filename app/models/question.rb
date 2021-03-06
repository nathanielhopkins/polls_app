class Question < ApplicationRecord
  has_many(
    :answer_choices, dependent: :destroy
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
    self
      .answer_choices
      .left_outer_joins(:responses)
      .group(:id)
      .pluck('answer_choices.text, COUNT(responses.id)')
      .to_h
  end
end