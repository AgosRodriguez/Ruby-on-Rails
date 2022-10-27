class City
  
  def initialize(name, zip_code, state)
    @name = name
    @zip_code = zip_code
    @state = state
  end

  attr_accessor :name, :zip_code, :state

  def display_data
    {
      name: @name,
      zip_code: @zip_code,
      state: @state
    }
  end
end