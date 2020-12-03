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
    else
      return true
    end
  end

  validate :respondent_already_answered?

  def own_poll?
    author_id = self.question.poll.author_id
    if self.user_id == author_id
      errors[:user_id] << 'Cannot answer your own poll'
    else
      return true
    end
  end

  validate :own_poll?
end