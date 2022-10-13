class OmniauthCallbacksController < ApplicationController
  def twitter
    Rails.logger.info auth # this method is another incredible way to debug in RAILS.
                           # It allows us to see all the response recieved from twitter through omniauth

    # Here,we are looking in our database, if our user (Current.user) has a twitter_account associated to him/her 
    # with the name we received in the twitter response through omniauth.
    # INTERESTING --> using the method 'first_or_initialize' we can initialize an new twitter_account object
    #                 if our Current.user don't have this account yet, OR select the twitter_account that matches!
    # Then... We only update the data of this twitter_account associated with the current user
    twitter_account = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
    twitter_account.update(
      name: auth.info.name,
      username: auth.info.nickname,
      image: auth.info.image,
      token: auth.credentials.token,
      secret: auth.credentials.secret
    )
    redirect_to twitter_accounts_path, notice: 'Successfully connected your account'
  end

  def auth
    request.env['omniauth.auth']
  end
end