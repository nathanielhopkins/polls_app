class User < ApplicationRecord
  has_many(
    :authored_polls,
    class_name: 'Poll',
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :responses,
    class_name: 'Response',
    foreign_key: :user_id,
    primary_key: :id
  )

  validates :username, presence: true, uniqueness: true

  def completed_polls_sql
    Poll.find_by_sql(<<-SQL)
      SELECT
        polls.*, COUNT(questions.id) AS question_count, COUNT(responses.id) AS responses_count
      FROM
        polls
      LEFT OUTER JOIN
        questions ON questions.poll_id = polls.id
      LEFT OUTER JOIN
        (
          SELECT
            responses.*
          FROM
            responses
          WHERE
            responses.user_id = #{self.id}
        ) AS responses
        ON responses.question_id = questions.id
      GROUP BY
        polls.id
      HAVING
        COUNT(responses.id) = COUNT(questions.id)
      ORDER BY
        polls.id
    SQL
  end

  def completed_polls
    polls_with_completion_counts
      .having('COUNT(DISTINCT questions.id) = COUNT(responses.id)')
  end

  def incomplete_polls
    polls_with_completion_counts
      .having('COUNT(DISTINCT questions.id) != COUNT(responses.id)')
  end

  private

  def polls_with_completion_counts
    joins_sql = <<-SQL
    LEFT OUTER JOIN(  
      SELECT
        *
      FROM
        responses
      WHERE
        user_id = #{self.id}
    ) AS responses ON responses.answer_choice_id = answer_choices.id  
    SQL

    Poll
      .joins(questions: :answer_choices)
      .joins(joins_sql)
      .group('polls.id')
  end
end