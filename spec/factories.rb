FactoryBot.define do
  factory :user do
    email { 'jankowalski@example.com' }
    password { 'password123' }
  end

  factory :league do
    name { 'Premier League' }
    country { 'England' }
    api_league_id { '10' }
  end

  factory :league_participant do
    league
    teamname { 'Arsenal Londyn' }
    position { '1' }
    goals_scored { '100' }
    goals_lost { '10' }
    points { '30' }
  end
end
