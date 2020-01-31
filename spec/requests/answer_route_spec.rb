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

  it 'returns unprocessable entity status when given invalid input' do
    post "#{@route}/answers", params: {
      :answer => {
        text: nil,
        question_id: nil,
        linked_card: nil,
        is_finish: false,
      }
    }
    expect(response).to have_http_status(422)
  end

  it 'allows updating of an answer' do
    @answer2 = Answer.create!({
      text: "test text",
      question_id: @question.id,
      linked_card: nil,
      is_finish: false,
    })
    @answer2.save
    patch "#{@route}/answers/#{@answer2.id}", params: {
      :answer => {:text => 'updated'}
    }
    get "#{@route}/answers/#{@answer2.id}"
    expect(JSON.parse(response.body)['text']).to eq('updated')
  end

  it 'returns unprocessable entity status when given invalid input' do
    patch "#{@route}/answers/#{@answer.id}", params: { :answer => {:text => nil} }
    expect(response).to have_http_status(422)
  end

  it 'allows deleting of an answer' do
    @answer2 = Answer.create!({
      text: "test text",
      question_id: @question.id,
      linked_card: nil,
      is_finish: false,
    })
    @answer2.save
    delete "#{@route}/answers/#{@answer2.id}"
    get "#{@route}/answers"
    expect(JSON.parse(response.body).length).to eq(1)
  end

end
