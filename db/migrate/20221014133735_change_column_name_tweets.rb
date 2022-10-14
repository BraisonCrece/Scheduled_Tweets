class ChangeColumnNameTweets < ActiveRecord::Migration[7.0]
  def change
    rename_column :tweets, :published_at, :publish_at
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
