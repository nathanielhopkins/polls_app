class Response < ApplicationRecord
  belongs_to(
    :answer_choice,
    class_name: 'AnswerChoice',
    foreign_key: :answer_choice_id,
    primary_key: :id
  )

  belongs_to(
    :respondent,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

  has_one(
    :question,
    through: :answer_choice,
    source: :question
  )

  def sibling_responses
    question = self.question
    question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    if self.sibling_responses.where(user_id: self.user_id).exists?
      errors[:user_id] << 'User has already answered this question.'
    end
  end

  validate :respondent_already_answered?
end