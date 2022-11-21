# Lessons model testing spec file

require 'rails_helper'

RSpec.describe Lesson, :type => :model do
  it "is valid with valid attributes" do
    expect(Lesson.new).to be_valid
  end
  it "is not valid without a name" do
    lesson = Lesson.new(name: nil)
    expect(lesson).to_not be_valid
  end
  it "is not valid without a description" do
    lesson = Lesson.new(description: nil)
    expect(lesson).to_not be_valid
  end
  it "is not valid without a category"
  it "is not valid without a price"
end
