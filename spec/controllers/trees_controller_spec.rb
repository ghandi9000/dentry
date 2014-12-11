require 'spec_helper'

describe TreesController do
  before(:each) do
    @tree = mock_model(Tree, :id => 1)
    Tree.stub(:find).and_return([@tree])
  end

  it 'should render index page' do
    get :index
    expect(response).to be_success
    expect(response).to render_template('index')
  end

  it 'should be render show page for a tree' do
    get :show, :id => 1
    expect(response).to be_success
    expect(response).to render_template('show')
  end

end
