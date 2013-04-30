FactoryGirl.define do
	factory :user do
		first_name		"Andy"
		last_name		"Brown"
		email			"andy.brown@justice.gsi.gov.uk"
		role			"TiB"
		department		"Ministry of Justice"
		password		"password"
		password_confirmation 	"password"
	end
end