require 'spec_helper'

describe TweetsController do
  let!(:tweet) { Tweet.create(message: "Hiya", author: "Guest")}

  describe "GET 'index'" do
    it "populates an array of tweets" do
      get :index
      expect(assigns(:tweets)).to eq([tweet])
    end

    it "renders the index template" do
      get :index
      expect(assigns(:tweets)).to render_template :index
    end

  end

  describe "GET 'show'" do
    it "assigns @tweet" do
      get :show, id: tweet
      expect(assigns(:tweet)).to eq(tweet)
    end

    it "sends a successful request" do
      get :show, id: tweet
      expect(assigns(:tweet)).to render_template :show
    end
    
  end

  describe "GET 'new'" do
    it "sends a successful get request" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST 'create'" do
    it "assigns @tweet to be a valid tweet" do
      post :create, tweet: { message: "Hiya", author: "Guest" }
      expect(assigns(:tweet)).to be_a Tweet
      expect(assigns(:tweet)).to be_valid
    end

    it "redirects to the new tweet's show page" do
      post :create, tweet: { message: "Hiya", author: "Guest" }
      expect(assigns(:tweet)).to redirect_to tweet_path(assigns(:tweet).id)
    end
    
    it "causes invalid posts to render new template" do
      post :create, tweet: { message: nil, author: "Guest" }
      expect(assigns(:tweet)).to render_template :new
    end
  end
end
