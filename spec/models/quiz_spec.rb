require 'rails_helper'

describe Quiz do
  it { should have_many(:questions) }
  it { should have_many(:finishes) }
end
