# encoding: utf-8

class Employee 

    
    def initialize(name, address, city, company, user)
        @name = name
        @address = address
        @city = city
        @company = company
        @user = user
    end

    attr_accessor :name, :address, :city, :company, :user 

    def display_data
        name = @name,
        address = @address,
        city = @city,
        company = @company,
        user = @user
    end 
end


