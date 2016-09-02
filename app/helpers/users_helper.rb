module UsersHelper
  def hidden_phone(user)
    "########{user.phone_number[-2..-1]}" if user.phone_number
  end

  def hidden_email(user)
    "##########{user.email[/@.*/]}" if user.email
  end
end

