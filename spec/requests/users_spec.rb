require 'rails_helper'

RSpec.describe 'Users', type: :request
describe 'GET /' do
  it 'returns http success' do
    get '/users'
    expect(response).to have_http_status(:success)
  end
  it 'renders the index template' do
    get '/users'
    expect(response).to render_template('index')
  end
  it 'renders the Post text' do
    get '/users'
    expect(response.body).to include('Tom')
  end
end
describe 'GET /users/:id' do
  it 'returns http success' do
    get '/users/1'
    expect(response).to have_http_status(:success)
  end
  it 'renders the show template' do
    get '/users/1'
    expect(response).to render_template('show')
  end
  it 'renders the Post text' do
    get '/users/1'
    expect(response.body).to include('Comments')
  end
end
