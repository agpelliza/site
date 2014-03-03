setup:
	which dep     || gem install dep
	which shotgun || gem install shotgun
	dep install

console:
	env $$(cat env.sh) irb -r ./app

secret:
	ruby -r securerandom -e 'puts SecureRandom.hex(32)'

server:
	env $$(cat env.sh) shotgun -o 0.0.0.0

test:
	env $$(cat env.sh) cutest test/*/*_test.rb
