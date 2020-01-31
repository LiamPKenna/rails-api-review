require 'rails_helper'


describe "quiz routes", :type => :request do

  before(:each) do
    Quiz.all.each { |q| q.destroy }
    Quiz.create!({title:"test title", sub_title: "test sub title"})
    @quiz = Quiz.all.first
  end

  it 'returns the quiz title' do
    get "/quizzes/#{@quiz.id}"
    expect(JSON.parse(response.body)['title']).to eq('test title')
  end

end
