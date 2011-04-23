# Load the rails application

require 'graticule'

require File.expand_path('../application', __FILE__)

# Initialize the rails application
Vouape::Application.initialize!


Geocode.geocoder = Graticule.service(:google).new  MAP_KEY["google_key"]
#Geocode.geocoder = Graticule.service(:yahoo).new  MAP_KEY["yahoo_key"]


#Geocode.geocoder = Graticule.service(:google).new "ABQIAAAAzMUFFnT9uH0xq39J0Y4kbhTJQa0g3IQ9GZqIMmInSLzwtGDKaBR6j135zrztfTGVOm2QlWnkaidDIQ"

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

