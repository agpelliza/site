require "cuba"
require "cuba/mote"
require "ohm"
require "rack/protection"
require "shield"
require "scrivener"

Cuba.plugin(Cuba::Mote)
Cuba.plugin(Shield::Helpers)

Dir["./lib/**/*.rb"].each     { |f| require(f) }
Dir["./models/**/*.rb"].each  { |f| require(f) }
Dir["./filters/**/*.rb"].each { |f| require(f) }
Dir["./helpers/**/*.rb"].each { |f| require(f) }
Dir["./routes/**/*.rb"].each  { |f| require(f) }

Cuba.use(Rack::Protection)
Cuba.use(Rack::Protection::RemoteReferrer)

Cuba.use(Rack::Static, urls: %w[/js /css /img], root: "./public")

Cuba.define do
end
