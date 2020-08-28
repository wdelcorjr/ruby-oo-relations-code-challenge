class Listing
    attr_reader :location
    attr_accessor :status, :price, :agent, :seller

    @@all = []

    def initialize(location, price, agent, seller, status="for sale")
        @location = location
        @price = price
        @status = status
        @agent = agent
        @seller = seller
        @@all << self
    end

    def price_drop(percentage)
        self.price -= self.price*percentage
    end

    def self.all
        @@all
    end

    def seller
        
    end

end

class Agent
    attr_reader :name
    attr_accessor :telephone, :yrs_experience
    def initialize(name, telephone, yrs_experience)
        @name = name
        @telephone = telephone
        @yrs_experience = yrs_experience
    end
    def listings
        Listing.all.select {|listing| listing.agent == self}
    end
    def sellers
        self.listings.map {|listing| listing.seller}
    end
end

class Seller
    attr_reader :name
    def initialize(name)
        @name = name
    end
    def agent
        self.listing.agent
    end
    def listings
        
    end
end
#Listing belongs to Agent, Agent has many Listings
#Listing belongs to Seller, Seller has a Listing, 
#Agent has many Sellers through Listing
#Seller has Agent through Listing 