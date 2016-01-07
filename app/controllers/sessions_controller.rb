class SessionsController < Devise::SessionsController

  def create
    current_user.remember_me! if current_user
    super
  end

end
