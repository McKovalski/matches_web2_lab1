# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

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
        time_of_play: "2022-02-06 11:30:00.000000000 +0000",
        home_team_id: 1,
        away_team_id: 2,
        home_team_score: 4,
        away_team_score: 3
    },
    {
        time_of_play: "2022-02-06 15:00:00.000000000 +0000",
        home_team_id: 1,
        away_team_id: 3,
        home_team_score: 1,
        away_team_score: 2
    },
    {
        time_of_play: "2022-02-07 15:30:00.000000000 +0000",
        home_team_id: 1,
        away_team_id: 4,
        home_team_score: 2,
        away_team_score: 0
    },
    {
        time_of_play: "2022-02-08 21:00:00.000000000 +0000",
        home_team_id: 2,
        away_team_id: 3,
        home_team_score: 4,
        away_team_score: 3
    },
    {
        time_of_play: "2022-02-08 18:00:00.000000000 +0000",
        home_team_id: 2,
        away_team_id: 4,
        home_team_score: 1,
        away_team_score: 3
    },
    {
        time_of_play: "2022-02-08 21:00:00.000000000 +0000",
        home_team_id: 3,
        away_team_id: 4,
        home_team_score: 0,
        away_team_score: 3
    },
    {
        time_of_play: "2022-11-12 15:00:00.000000000 +0000",
        home_team_id: 3,
        away_team_id: 1
    },
    {
        time_of_play: "2022-11-12 18:00:00.000000000 +0000",
        home_team_id: 4,
        away_team_id: 2
    }
])
