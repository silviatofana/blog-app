require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(text: 'True title') }
  before { subject.save }

  it 'text should not be nil' do
    subject.text = nil
    expect(subject).to_not be_valid
  end
end
