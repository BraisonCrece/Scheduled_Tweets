class Current < ActiveSupport::CurrentAttributes
  # We just create this class, to be able to set the current user through Current.user
  attribute :user
end