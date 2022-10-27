# encoding: utf-8

class User
  def initialize(login, email, password, admin)
    @login = login
    @email = email
    @password = password
    @admin = admin
  end

  attr_accessor :login, :email, :password, :admin

  def display_data
    {
      login: @login,
      email: @email,
      password: @password,
      admin: @admin
    }
  end

end
