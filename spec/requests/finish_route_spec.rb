require 'rails_helper'


describe "finish routes", :type => :request do

  before(:all) do
    Quiz.all.each { |q| q.destroy }
    Quiz.create!({title:"test title", sub_title: "test sub title"})
    @quiz = Quiz.all.first
  end

  before(:each) do
    Finish.all.each { |q| q.destroy }
    Finish.create!({
      text: "test text",
      quiz_id: @quiz.id,
      sub_text: "sub text",
      img_src: ""
    })
    @finish = Finish.all.first
  end

  it 'returns a single finish' do
    get "/quizzes/#{@quiz.id}/finishes/#{@finish.id}"
    expect(JSON.parse(response.body)['text']).to eq('test text')
  end

  it 'returns an array of all finishes for a given quiz' do
    get "/quizzes/#{@quiz.id}/finishes"
    expect(JSON.parse(response.body).length).to eq(1)
  end

  it 'allows creation of a new finish' do
    post "/quizzes/#{@quiz.id}/finishes", params: {
      :finish => {
        text: "new test text",
        quiz_id: @quiz.id,
        sub_text: "new sub text",
        img_src: ""
      }
    }
    get "/quizzes/#{@quiz.id}/finishes"
    expect(JSON.parse(response.body).length).to eq(2)
  end

  it 'returns unprocessable entity status when given invalid input' do
    post "/quizzes/#{@quiz.id}/finishes", params: {
      :finish => {
        text: nil,
        quiz_id: nil,
        sub_text: "",
        img_src: ""
      }
    }
    expect(response).to have_http_status(422)
  end

  it 'allows updating of a finish' do
    @finish2 = Finish.new({
      text: "new test text",
      quiz_id: @quiz.id,
      sub_text: "",
      img_src: "",
    })
    @finish2.save
    patch "/quizzes/#{@quiz.id}/finishes/#{@finish2.id}", params: {
      :finish => {:text => 'updated'} }
    get "/quizzes/#{@quiz.id}/finishes/#{@finish2.id}"
    expect(JSON.parse(response.body)['text']).to eq('updated')
  end

  it 'returns unprocessable entity status when given invalid input' do
    patch "/quizzes/#{@quiz.id}/finishes/#{@finish.id}", params: { :finish => {:text => nil} }
    expect(response).to have_http_status(422)
  end

  it 'allows deleting of a finish' do
    @finish2 = Finish.new({
      text: "new test text",
      quiz_id: @quiz.id,
      sub_text: "",
      img_src: "",
    })
    @finish2.save
    delete "/quizzes/#{@quiz.id}/finishes/#{@finish2.id}"
    get "/quizzes/#{@quiz.id}/finishes"
    expect(JSON.parse(response.body).length).to eq(1)
  end

end
