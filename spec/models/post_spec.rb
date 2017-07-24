require 'rails_helper'
require 'byebug'

RSpec.describe Post, type: :model do

  # describe "Relationships" do
  #   before do
  #     @account = create(:account)
  #   end
  #   it { is_expected.to belong_to(:client) }
  #   it { is_expected.to have_many(:invitations)}
  #   it { is_expected.to have_many(:leads)}
  #   it { is_expected.to have_many(:api_keys)}
  #   it { is_expected.to have_many(:organizations)}
  #   it { is_expected.to have_many(:users).through(:invitations) }
  #
  # end

  describe "Validations" do
    before do
      @post = FactoryGirl.create(:post)
    end

    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_presence_of(:description) }
  end

  context "post validation on new post" do
    it "should create post with name and description" do
      @post = FactoryGirl.create(:post)
      expect(@post.valid?).to be(true)
    end
  end
end
