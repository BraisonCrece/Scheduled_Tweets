class TwitterAccountsController < ApplicationController
  before_action :require_user_logged_in!
  
  def index
    @twitter_accounts = Current.user.twitter_accounts
  end
end