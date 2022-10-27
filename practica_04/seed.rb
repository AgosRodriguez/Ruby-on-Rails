# encoding: utf-8

require 'json'
require 'ffaker'

require_relative 'user'
require_relative 'City'
require_relative 'Company'
require_relative 'Employee'
require_relative 'State'

BRANCH_OFFICE = ['Cordoba', 'Rio Cuarto', 'Villa Mercedes', 'San Luis']

#Crea un unico usuario administrador
@user_admin = User.new(FFaker::InternetSE.login_user_name, FFaker::InternetSE.email, FFaker::InternetSE.password, true)

#Los empleados pertenecen a la misma compania
@company = Company.new(FFaker::Company.name)

#Genera entre 3 y 6 empleados al azar
def employeesGral
  @employees = []
  number_employee = FFaker::Random.rand(3..5)    

  number_employee.times do 
    index_city = FFaker::Random.rand(0..3)

    @state = State.new(FFaker::AddressMX.state)

    @city = City.new(BRANCH_OFFICE[index_city], FFaker::AddressMX.zip_code, @state.display_data)
  
    @user_no_admin = User.new(FFaker::InternetSE.login_user_name, FFaker::InternetSE.email, FFaker::InternetSE.password, false)
    @employees << Employee.new(FFaker::NameES.first_name, FFaker::Address.street_address, @city.display_data, @company.display_data, @user_no_admin.display_data)
  end
  
  # Se agrega un admin al grupo de empleados
  @employees << Employee.new(FFaker::NameES.first_name, FFaker::Address.street_address, @city.display_data, @company.display_data, @user_admin.display_data)

  return @employees
end

#Genera entre 3 y 6 empleados de la ciudad de Cordoba
def employeeCba
  @employeesCba = []
  number_employee = FFaker::Random.rand(3..5)  

  number_employee.times do 
  
    @state = State.new(FFaker::AddressMX.state)

    @city = City.new(BRANCH_OFFICE[0], FFaker::AddressMX.zip_code, @state.display_data)
  
    @user_no_admin = User.new(FFaker::InternetSE.login_user_name, FFaker::InternetSE.email, FFaker::InternetSE.password, false)
    @employeesCba << Employee.new(FFaker::NameES.first_name, FFaker::Address.street_address, @city.display_data, @company.display_data, @user_no_admin.display_data)
  end
  # Se agrega un admin al grupo de empleados
  @employeesCba << Employee.new(FFaker::NameES.first_name, FFaker::Address.street_address, @city.display_data, @company.display_data, @user_admin.display_data)

  return @employeesCba
end

#Genera entre 3 y 6 empleados de la ciudad de Rio Cuarto
def employeeRC
  @employeesRC = []
  number_employee = FFaker::Random.rand(3..5)  

    number_employee.times do 
    
      @state = State.new(FFaker::AddressMX.state)
  
      @city = City.new(BRANCH_OFFICE[1], FFaker::AddressMX.zip_code, @state.display_data)
    
      @user_no_admin = User.new(FFaker::InternetSE.login_user_name, FFaker::InternetSE.email, FFaker::InternetSE.password, false)
      @employeesRC << Employee.new(FFaker::NameES.first_name, FFaker::Address.street_address, @city.display_data, @company.display_data, @user_no_admin.display_data)
    end
    # Se agrega un admin al grupo de empleados
    @employeesRC << Employee.new(FFaker::NameES.first_name, FFaker::Address.street_address, @city.display_data, @company.display_data, @user_admin.display_data)

    return @employeesRC
end

#Genera entre 3 y 6 empleados de la ciudad de Villa Mercedes
def employeeVM
  @employeesVM = []
  number_employee = FFaker::Random.rand(3..5)  
    number_employee.times do 
    
      @state = State.new(FFaker::AddressMX.state)
  
      @city = City.new(BRANCH_OFFICE[2], FFaker::AddressMX.zip_code, @state.display_data)
    
      @user_no_admin = User.new(FFaker::InternetSE.login_user_name, FFaker::InternetSE.email, FFaker::InternetSE.password, false)
      @employeesVM << Employee.new(FFaker::NameES.first_name, FFaker::Address.street_address, @city.display_data, @company.display_data, @user_no_admin.display_data)
    end
    # Se agrega un admin al grupo de empleados
    @employeesVM << Employee.new(FFaker::NameES.first_name, FFaker::Address.street_address, @city.display_data, @company.display_data, @user_admin.display_data)

    return @employeesVM
end


#Genera entre 3 y 6 empleados de la ciudad de San Luis
def employeeSL
  @employeesSL = []
  number_employee = FFaker::Random.rand(3..5)  
    number_employee.times do 
  
      @state = State.new(FFaker::AddressMX.state)
  
      @city = City.new(BRANCH_OFFICE[3], FFaker::AddressMX.zip_code, @state.display_data)
    
      @user_no_admin = User.new(FFaker::InternetSE.login_user_name, FFaker::InternetSE.email, FFaker::InternetSE.password, false)
      @employeesSL << Employee.new(FFaker::NameES.first_name, FFaker::Address.street_address, @city.display_data, @company.display_data, @user_no_admin.display_data)
    end

    # Se agrega un admin al grupo de empleados
    @employeesSL << Employee.new(FFaker::NameES.first_name, FFaker::Address.street_address, @city.display_data, @company.display_data, @user_admin.display_data)
    
    return @employeesSL
end

puts "OBTENER DATOS DE EMPLEADOS"
puts "Si deseas obtener los empleados de la sucursal de Cordoba seleccione: 1"
puts "Si deseas obtener los empleados de la sucursal de Rio Cuarto seleccione: 2"
puts "Si deseas obtener los empleados de la sucursal de Villa Mercedes seleccione: 3"
puts "Si deseas obtener los empleados de la sucursal de San Luis seleccione: 4"

selection = gets.chomp

if selection == '1'
  puts employeeCba.map{|u| u.display_data}.to_json 
else 
  if selection == '2'
    puts employeeRC.map{|u| u.display_data}.to_json 
  else 
    if selection == '3'
      puts employeeVM.map{|u| u.display_data}.to_json
    else 
      if selection == '4'
        puts employeeSL.map{|u| u.display_data}.to_json
      else 
        puts employeesGral.map{|u| u.display_data}.to_json 
      end 
    end 
  end
end