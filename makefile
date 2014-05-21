.PHONY: test

setup:
	echo APP_KEY=$$(basename $$(pwd)) >> .env
	echo APP_SECRET=$$(make secret | grep -v 'ruby') >> .env
	echo DATABASE_URL=redis://127.0.0.1:6379/ >> .env

console:
	env $$(cat .env) irb -r ./app

secret:
	ruby -r securerandom -e 'puts SecureRandom.hex(32)'

server:
	env $$(cat .env) shotgun -s puma -o 0.0.0.0

test:
	env $$(cat .env) cutest test/*/*_test.rb
