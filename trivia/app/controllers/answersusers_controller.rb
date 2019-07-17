class AnswersusersController < ApplicationController
    before_action :authenticate_user!
    before_action :check_rol
	def create
    	@answer = Answer.find(params[:answer_id].to_i)
    	@answerbol = @answer.tipo
    	@panel = params[:panel].to_i
    	@answerscant = params[:answerscant].to_i

    	@answersuser = Answersuser.new
    	@answersuser.user = current_user
    	@answersuser.answer = @answer
    	@answersuser.value = @answer.tipo
    	@answersuser.question = @answer.question_id
    	@answersuser.save!
  	end

    def index
       @answersusers = Answersuser.order(:user_id).order(:question)
    end

private
    def check_rol
      if !current_user.admin?
        redirect_to root_path, alert: 'Acceso no Autorizado!'
      end
    end
end
