require "cuba"
require "cuba/mote"
require "rack/protection"

APP_KEY = ENV.fetch("APP_KEY")
APP_SECRET = ENV.fetch("APP_SECRET")

Cuba.plugin(Cuba::Mote)

Cuba.use(Rack::Session::Cookie, key: APP_KEY, secret: APP_SECRET)
Cuba.use(Rack::Static, urls: %w[/js /css /img], root: "./public")

Cuba.use(Rack::Protection)
Cuba.use(Rack::Protection::RemoteReferrer)

Dir["./models/**/*.rb"].each  { |f| require(f) }
Dir["./filters/**/*.rb"].each { |f| require(f) }
Dir["./helpers/**/*.rb"].each { |f| require(f) }
Dir["./routes/**/*.rb"].each  { |f| require(f) }

Cuba.define do
  on root do
    render("home", title: "agpelliza")
  end

  on "about" do
    render("about", title: "about")
  end
end
