# encoding: utf-8

require 'minitest/autorun'
require 'minitest/pride'

require_relative 'person'

class PersonTest < Minitest::Test
  def test_nueva_instancia
    height = 100
    birthday = '2007-03-20'
    assert_equal Person, Person.new(height, birthday).class
  end

  def test_nueva_instancia_valida
    height = 100
    birthday = '2008-03-20'
    assert_equal true, Person.new(height, birthday).valid
  end

  def test_nueva_instancia_altura_invalida
    height = 'hola'
    birthday = '2000-03-20'
    assert_equal false, Person.new(height, birthday).valid
  end

  def test_nueva_instancia_fecha_nacimiento_invalida
    height = 100
    birthday = 'hola'
    assert_equal false, Person.new(height, birthday).valid
  end

  def test_create_pass_edad_invalida 
    height = 160
    birthday = '2010-03-20'

    persona = Person.new(height, birthday)

    if persona.valid
      assert_equal false, persona.have_pass
    end
  end

  def test_create_pass_edad_invalida 
    height = 160
    birthday = '2010-03-20'

    persona = Person.new(height, birthday)

    if persona.valid
      assert_equal false, persona.have_pass
    end
  end

  def test_have_pass_altura_invalidos
    height = 110
    birthday = '2001-03-20'

    persona = Person.new(height, birthday)

    if persona.valid

      assert_equal false, persona.have_pass
    end
  end

  def test_have_pass_altura_y_edad_valido
    height = 153
    birthday = '2001-04-21'

    persona = Person.new(height, birthday)

    if persona.valid

      assert_equal true, persona.ingresarSala(0)
    end
  end

  def test_have_pass_compania_valido
    height = 153
    birthday = '2007-04-21'
  
    persona = Person.new(height, birthday)
  
    if persona.valid  
     assert_equal true, persona.ingresarSala(1)
    end
  end

  def test_have_pass_sin_compania_valido
    height = 153
    birthday = '2007-04-21'
  
    persona = Person.new(height, birthday)
  
    if persona.valid  
     assert_equal false, persona.ingresarSala(0)
    end
  end
end
