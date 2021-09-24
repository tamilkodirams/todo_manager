class Users < ActiveRecord::Base
  def to_pleasant_string
    "#{id} #{user_name} #{email_id} #{password}"
  end
end
