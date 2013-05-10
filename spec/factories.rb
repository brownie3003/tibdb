FactoryGirl.define do
	factory :department do
		full_name		"Ministry of Justice"
		abbreviation	"MoJ"
	end

	factory :user do
		first_name		"Andy"
		last_name		"Brown"
		email			"andy.brown@justice.gsi.gov.uk"
		role			"TiB"
		password		"password"
		password_confirmation 	"password"
	end

	factory :assignment do
		title			"Role title example"
		description		"Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum"
		band			"Band C"
		start_date		29/05/2014
		length			"6 months"
	end
end