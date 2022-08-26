class Beer
    attr_accessor :identifier, :name, :description

    def initialize(hash)
        @identifier = hash["id"]
        @name = hash["name"]
        @description = hash["description"]
    end
end