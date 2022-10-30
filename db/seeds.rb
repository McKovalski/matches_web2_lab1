# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'date'

Team.create([
    {
        name: "Barcelona"
    },
    {
        name: "Real Madrid"
    },
    {
        name: "Valencia"
    },
    {
        name: "Sevilla"
    }
])

Match.create([
    {
        :time_of_play => DateTime.strptime("02/06/2022 13:00", "%m/%d/%Y %H:%M"),
        home_team_id: 1,
        away_team_id: 2,
        home_team_score: 4,
        away_team_score: 3
    },
    {
        time_of_play: DateTime.strptime("02/06/2022 15:00", "%m/%d/%Y %H:%M"),
        home_team_id: 1,
        away_team_id: 3,
        home_team_score: 1,
        away_team_score: 2
    },
    {
        time_of_play: DateTime.strptime("02/07/2022 15:00", "%m/%d/%Y %H:%M"),
        home_team_id: 1,
        away_team_id: 4,
        home_team_score: 2,
        away_team_score: 0
    },
    {
        time_of_play: DateTime.strptime("02/08/2022 18:00", "%m/%d/%Y %H:%M"),
        home_team_id: 2,
        away_team_id: 3,
        home_team_score: 4,
        away_team_score: 3
    },
    {
        time_of_play: DateTime.strptime("02/08/2022 21:00", "%m/%d/%Y %H:%M"),
        home_team_id: 2,
        away_team_id: 4,
        home_team_score: 1,
        away_team_score: 3
    },
    {
        time_of_play: DateTime.strptime("02/08/2022 21:00", "%m/%d/%Y %H:%M"),
        home_team_id: 3,
        away_team_id: 4,
        home_team_score: 0,
        away_team_score: 3
    },
    {
        time_of_play: DateTime.strptime("11/12/2022 18:00", "%m/%d/%Y %H:%M"),
        home_team_id: 3,
        away_team_id: 1
    },
    {
        time_of_play: DateTime.strptime("11/12/2022 21:00", "%m/%d/%Y %H:%M"),
        home_team_id: 4,
        away_team_id: 2
    }
])
