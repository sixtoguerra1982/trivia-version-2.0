module QuestionsHelper
  def answersOfQuestion(question)
    Answer.where(question_id: question)
  end
  def questionsearch(question_id)
    Question.find(question_id)
  end
  def answerssearch(answerid)
  	Answer.find(answerid)
  end
end
