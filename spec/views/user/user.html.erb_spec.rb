require 'rails_helper'

RSpec.describe 'user/show.html.erb', type: :view do
  pending "add some examples to (or delete) #{__FILE__}"

  # it 'renders the index template' do
  before(:all) { get user_index_path }
  it 'renders the index template' do
    expect(response).to render_template('index')
  end
end
