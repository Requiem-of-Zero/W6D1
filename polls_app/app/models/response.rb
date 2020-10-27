# == Schema Information
#
# Table name: responses
#
#  id            :bigint           not null, primary key
#  answer_id     :integer          not null
#  respondent_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Response < ApplicationRecord
    validate :respondent_not_poll_author 
    validate :not_duplicate_response
    
    belongs_to :answer_choice,
        foreign_key: :answer_id,
        class_name: :AnswerChoice

    belongs_to :respondent,
        foreign_key: :respondent_id,
        class_name: :User

    has_one :question,
        through: :answer_choice,
        source: :question

    def sibling_responses
        self.question.responses.where.not(id: self.id)
    end

    def respondent_already_answered?
        sibling_responses.exists?(respondent_id: self.respondent_id)
    end

    private
    def respondent_not_poll_author
        poll_author_id = Poll 
            .joins(questions: :answer_choices)
            .where('answer_choices.id = ?', self.answer_id)
            .pluck('polls.author_id')
            .first

        if poll_author_id == self.respondent_id
            errors[:respondent_id] << 'cannot be poll author'
        end
    end

    def not_duplicate_response
        if respondent_already_answered?
            errors[:respondent_id] << 'unable to vote twice for a question'
        end
    end
end
