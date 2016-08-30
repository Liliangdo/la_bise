module UsersHelper
  def hidden_phone(user)
    "********#{user.phone_number[-2..-1]}"
  end

  def hidden_email(user)
    "********#{user.email[/@.*/]}"
  end
end

