class Quiz < ActiveRecord::Base

   has_many :questions
   accepts_nested_attributes_for :questions
   has_many :attempts
   validates :title, presence: true

   def correct_answer_ids
    questions.map { |q| q.correct_answer.id }
   end

 
end
