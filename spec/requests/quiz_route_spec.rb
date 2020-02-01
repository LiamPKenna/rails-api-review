require 'rails_helper'


describe "quiz routes", :type => :request do

  before(:each) do
    Quiz.all.each { |q| q.destroy }
    Quiz.create!({title:"test title", sub_title: "test sub title"})
    @quiz = Quiz.all.first
  end

  it 'returns a single quiz' do
    get "/quizzes/#{@quiz.id}"
    expect(JSON.parse(response.body)['title']).to eq('test title')
  end

  it 'returns an array of all quizzes' do
    get "/quizzes"
    expect(JSON.parse(response.body).length).to eq(1)
  end

  it 'returns a single random quiz' do
    get "/quizzes/random"
    expect(JSON.parse(response.body)['title']).to eq('test title')
  end

  it 'allows creation of a new quiz' do
    post "/quizzes/", params: { :quiz => {title:"new test title", sub_title: "new test sub title"} }
    get "/quizzes"
    expect(JSON.parse(response.body).length).to eq(2)
  end

  it 'returns unprocessable entity status when given invalid input' do
    post "/quizzes/", params: { :quiz => {:title => nil, :sub_title => nil} }
    expect(response).to have_http_status(422)
  end

  it 'allows updating of a quiz' do
    @quiz2 = Quiz.new({title:"new test title", sub_title: "new test sub title"})
    @quiz2.save
    patch "/quizzes/#{@quiz2.id}", params: { :quiz => {:title => 'updated'} }
    get "/quizzes/#{@quiz2.id}"
    expect(JSON.parse(response.body)['title']).to eq('updated')
  end

  it 'returns unprocessable entity status when given invalid input' do
    patch "/quizzes/#{@quiz.id}", params: { :quiz => {:title => nil, :sub_title => nil} }
    expect(response).to have_http_status(422)
  end

  it 'allows deleting of a quiz' do
    @quiz2 = Quiz.new({title:"new test title", sub_title: "new test sub title"})
    @quiz2.save
    delete "/quizzes/#{@quiz2.id}"
    get "/quizzes"
    expect(JSON.parse(response.body).length).to eq(1)
  end


end
