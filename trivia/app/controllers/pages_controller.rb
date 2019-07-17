class PagesController < ApplicationController
  def index
  	questions = Question.all
  	@filtrados = []
    if user_signed_in?
      cont = 0
    	questions.each do |question|
        answersuser = Answersuser.where({question: question.id,user: current_user.id}).count
        if answersuser == 0
          @filtrados.push question.id
          cont +=1
          break if cont == 5
        end
      end
    end
    @answerscant = @filtrados.size
  end

  def ranking
    sql = "Select user_id, count(value) as cantidad from Answersusers where answersusers.value = '1' group by user_id order by cantidad desc limit 3"
    @ranking = ActiveRecord::Base.connection.execute(sql)
  end
end
