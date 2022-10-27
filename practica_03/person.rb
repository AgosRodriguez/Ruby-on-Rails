# encoding: utf-8

require 'date'

class Person
  def initialize(height, birthday)
    # Si no es un nro entero retorna 0
    @height = height.to_i
    # En lugar de retornar error retorna nil cuando es un formato de fecha invalido
    @birthday = Date.parse(birthday) rescue nil

    # Se añade el siguiente atributo para poder ingresar a las salas.
    # El pase no se otorga en el momento de la creacion y no es transferible
    @pass = false

    @valid = true
    if @height.zero? || @birthday.nil?
      @valid = false
    end
  end

  # Getters
  def getBirthday
    @birthday
  end

  def getHeight
    @height
  end

  # Setters
  def setBirthday(birthday)
    @birthday = birthday
  end 
  
  def setHeight(height)
    @height = height
  end


  def valid
    @valid
  end

  def create_pass 
    @pass = true
  end

  def have_pass
    @pass
  end

  #  Para ingresar a la sala debera tener un pase o que cumplir con la edad y la altura minima
  def ingresarSala(compania)
    return alturaParaSala && (edadParaSala || edadMenor(compania)) && have_pass
  end

    
  private
  
    # La altura minima para entrar a las salas es de 130 centimetros
    def alturaParaSala
      return @height >= 130
    end

    # Las salas estan dirigidas a personas mayores de 16 años, 
    # pero tambien podran entrar personas desde 14 años acompañados siempre por un adulto, 
    # en este caso se le otorga un pase al menor
    def edadParaSala
      current_year = Date.today
      age =  current_year.year - @birthday.year        
      if age > 16 && alturaParaSala
        create_pass
        return true 
      end
    return false
    end

    # si compania es igual 1 : viene acompañado(suponemos que la compania siempre es acompañada por un adulto).  
    def edadMenor(compania)
      current_year = Date.today
      age =  current_year.year - @birthday.year   
      if age >= 14 && compania == 1
        create_pass
        return true
      end
    return false
    end
end
