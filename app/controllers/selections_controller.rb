class SelectionsController < ApplicationController
    #POST /selection
    def create
        question = Question.find(params[:question_id])
        iscorrect = params['answer'].eql? question.correct_answer
        Selection.create(
            :user_id => current_user.id,
            :question_id => params['question_id'],
            :answer => params['answer'],
            :iscorrect => iscorrect
        )
    end

    #GET /selection/:room_id
    def index
        @questions = Question.where(:room_id => params[:room_id])
        @results = []
        for question in @questions
            selection = Selection.where(:question_id => question.id).first
            @results.push(selection)
        end
        @results.shift
        @results.pop
    end
end
