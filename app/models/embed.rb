class Embed
    
    require 'embedly'
    require 'json'

    def self.getdata(url)
        embedly_api = Embedly::API.new :key => ENV["EMBEDLY_API_KEY"], :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'
        obj = embedly_api.oembed :url => url
        obj[0].marshal_dump
        
    end
end