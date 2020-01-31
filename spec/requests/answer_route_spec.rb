require 'rails_helper'


describe "question routes", :type => :request do

  before(:all) do
    Quiz.all.each { |q| q.destroy }
    Quiz.create!({title:"test title", sub_title: "test sub title"})
    @quiz = Quiz.all.first
    Question.all.each { |q| q.destroy }
    Question.create!({
      text: "test text",
      quiz_id: @quiz.id,
      is_binary: true,
    })
    @question = Question.all.first
    @route = "/quizzes/#{@quiz.id}/questions/#{@question.id}"
  end

  before(:each) do
    Answer.create!({
      text: "test text",
      question_id: @question.id,
      linked_card: nil,
      is_finish: false,
    })
    @answer = Answer.all.first
  end

  it 'returns a single answer' do
    get "#{@route}/answers/#{@answer.id}"
    expect(JSON.parse(response.body)['text']).to eq('test text')
  end

  it 'returns an array of all answers for a given question' do
    get "#{@route}/answers"
    expect(JSON.parse(response.body).length).to eq(1)
  end

  it 'allows creation of a new answer' do
    post "#{@route}/answers", params: {
      :answer => {
        text: "new test text",
        question_id: @question.id,
        linked_card: nil,
        is_finish: false,
      }
    }
    get "#{@route}/answers"
    expect(JSON.parse(response.body).length).to eq(2)
  end

  # it 'returns unprocessable entity status when given invalid input' do
  #   post "/quizzes/#{@quiz.id}/questions", params: {
  #     :question => {
  #       text: nil,
  #       quiz_id: nil,
  #       is_binary: true,
  #     }
  #   }
  #   expect(response).to have_http_status(422)
  # end
  #
  # it 'allows updating of a question' do
  #   @question2 = Question.new({
  #     text: "new test text",
  #     quiz_id: @quiz.id,
  #     is_binary: true,
  #     y_link: 3,
  #     n_link: 11,
  #     y_is_final: false,
  #     n_is_final: false,
  #   })
  #   @question2.save
  #   patch "/quizzes/#{@quiz.id}/questions/#{@question2.id}", params: {
  #     :question => {:text => 'updated'} }
  #   get "/quizzes/#{@quiz.id}/questions/#{@question2.id}"
  #   expect(JSON.parse(response.body)['text']).to eq('updated')
  # end
  #
  # it 'returns unprocessable entity status when given invalid input' do
  #   patch "/quizzes/#{@quiz.id}/questions/#{@question.id}", params: { :question => {:text => nil} }
  #   expect(response).to have_http_status(422)
  # end
  #
  # it 'allows deleting of a question' do
  #   @question2 = Question.new({
  #     text: "new test text",
  #     quiz_id: @quiz.id,
  #     is_binary: true,
  #     y_link: 3,
  #     n_link: 11,
  #     y_is_final: false,
  #     n_is_final: false,
  #   })
  #   @question2.save
  #   delete "/quizzes/#{@quiz.id}/questions/#{@question2.id}"
  #   get "/quizzes/#{@quiz.id}/questions"
  #   expect(JSON.parse(response.body).length).to eq(1)
  # end

end
