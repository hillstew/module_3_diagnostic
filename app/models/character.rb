class Character
  attr_reader :name, :role, :house, :patronus

  def initialize(character_data)
    @name = character_data[:name]
    @role = character_data[:role] || placeholder
    @house = character_data[:house]
    @patronus = character_data[:patronus] || placeholder
  end

  private
    def placeholder
      "n/a"
    end
end