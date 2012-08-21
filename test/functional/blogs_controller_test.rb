require 'test_helper'

describe BlogsController do

  before do
    @blog1 = Blog.new "Blog of Johnson"
    @blog2 = Blog.new "Eating Pie"

    BlogRepository.save @blog1
    BlogRepository.save @blog2
  end

  describe "#index" do
    it "finds all known blogs in the system" do
      get :index

      assigns(:blogs).must_equal [@blog1, @blog2]
    end
  end

  describe "#show" do
    it "finds the selected blog and shows it" do
      get :show, :id => @blog1.id
      assigns(:blog).must_equal @blog1
    end
  end
end
