.PHONY: test

setup:
	echo APP_KEY=$$(basename $$(pwd)) > .env
	echo APP_SECRET=$$(make secret --no-print-directory | grep -v 'ruby') >> .env

console:
	env $$(cat .env) irb -r ./app

secret:
	ruby -r securerandom -e 'puts SecureRandom.hex(32)'

server:
	env $$(cat .env) shotgun -s puma -o 0.0.0.0

test:
	env $$(cat .env) cutest test/*/*_test.rb

pull:
	git pull origin master
	git pull heroku master

push:
	git push origin master
	git push heroku master
