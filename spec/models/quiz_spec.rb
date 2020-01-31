require 'rails_helper'

describe Quiz do
  it { should have_many(:questions) }
  it { should have_many(:finishes) }

  it "should return a random quiz" do
    Quiz.create!({title:"test title", sub_title: "test sub title"})
    Quiz.create!({title:"test title", sub_title: "test sub title"})
    expect(Quiz.random['title']).to(eq('test title'))
  end
end
