class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :body, length: { minimum: 1, maximum: 280 }
  validates :publish_at, presence: true

  after_initialize do
    self.publish_at ||= 48.hour.from_now
  end

  def published?
    tweet_id? # Rails provides this kind of sintax to refer to a column name in our database. table: tweets -->   tweet_id 
  end

end
