# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Team.destroy_all
Game.destroy_all
Delayed::Job.where(queue: 'check_points').delete_all

# TEAM
# Group A (1 - 4)
Team.create(name: 'Albania', short_name: "ALB", group: "A")
Team.create(name: 'Francia', short_name: "FRA", group: "A")
Team.create(name: 'Rumania', short_name: "RUM", group: "A")
Team.create(name: 'Suiza', short_name: "SUI", group: "A")

# Group B (5 - 8)
Team.create(name: 'Inglaterra', short_name: "ING", group: "B")
Team.create(name: 'Russia', short_name: "RUS", group: "B")
Team.create(name: 'Eslovaquia', short_name: "ESL", group: "B")
Team.create(name: 'Gales', short_name: "GAL", group: "B")

# Group C (9 - 12)
Team.create(name: 'Alemania', short_name: "ALE", group: "C")
Team.create(name: 'Irlanda del Norte', short_name: "ILN", group: "C")
Team.create(name: 'Polonia', short_name: "POL", group: "C")
Team.create(name: 'Ucraina', short_name: "UCR", group: "C")

# Group D (13 - 16)
Team.create(name: 'Croacia', short_name: "CRO", group: "D")
Team.create(name: 'República Checa', short_name: "RPC", group: "D")
Team.create(name: 'España', short_name: "ESP", group: "D")
Team.create(name: 'Turquía', short_name: "TUR", group: "D")

# Group E (17 - 20)
Team.create(name: 'Bélgica', short_name: "BEL", group: "E")
Team.create(name: 'Italia', short_name: "ITA", group: "E")
Team.create(name: 'República de Irlanda', short_name: "RPI", group: "E")
Team.create(name: 'Suecia', short_name: "SUE", group: "E")

# Group F (21 - 24)
Team.create(name: 'Austria', short_name: "AUS", group: "F")
Team.create(name: 'Hungría', short_name: "HUN", group: "F")
Team.create(name: 'Islandia', short_name: "ISL", group: "F")
Team.create(name: 'Portugal', short_name: "POR", group: "F")

# GAME 
# Jornada 1
#Game.create(local_team_id: 2, visitant_team_id: 3, game_date: DateTime.parse("10/06/2016 21:00"), stage: "Jornada 1")
Game.create(local_team_id: 2, visitant_team_id: 3, game_date: DateTime.parse("31/05/2016 14:40"), stage: "Jornada 1")


Game.create(local_team_id: 1, visitant_team_id: 4, game_date: DateTime.parse("11//062016 15:00"), stage: "Jornada 1")
Game.create(local_team_id: 8, visitant_team_id: 7, game_date: DateTime.parse("11/06/2016 18:00"), stage: "Jornada 1")
Game.create(local_team_id: 5, visitant_team_id: 6, game_date: DateTime.parse("11/06/2016 21:00"), stage: "Jornada 1")

Game.create(local_team_id: 16, visitant_team_id: 13, game_date: DateTime.parse("12/06/2016 15:00"), stage: "Jornada 1")
Game.create(local_team_id: 11, visitant_team_id: 10, game_date: DateTime.parse("12/06/2016 18:00"), stage: "Jornada 1")
Game.create(local_team_id: 9, visitant_team_id: 12, game_date: DateTime.parse("12/06/2016 21:00"), stage: "Jornada 1")

Game.create(local_team_id: 15, visitant_team_id: 14, game_date: DateTime.parse("13/06/2016 15:00"), stage: "Jornada 1")
Game.create(local_team_id: 23, visitant_team_id: 24, game_date: DateTime.parse("13/06/2016 18:00"), stage: "Jornada 1")
Game.create(local_team_id: 17, visitant_team_id: 19, game_date: DateTime.parse("13/06/2016 21:00"), stage: "Jornada 1")

Game.create(local_team_id: 21, visitant_team_id: 22, game_date: DateTime.parse("14/06/2016 18:00"), stage: "Jornada 1")
Game.create(local_team_id: 23, visitant_team_id: 24, game_date: DateTime.parse("14/06/2016 21:00"), stage: "Jornada 1")

# Jornada 2
Game.create(local_team_id: 6, visitant_team_id: 7, game_date: DateTime.parse("15/06/2016 15:00"), stage: "Jornada 2")
Game.create(local_team_id: 3, visitant_team_id: 4, game_date: DateTime.parse("15/06/2016 18:00"), stage: "Jornada 2")
Game.create(local_team_id: 2, visitant_team_id: 1, game_date: DateTime.parse("15/06/2016 21:00"), stage: "Jornada 2")

Game.create(local_team_id: 5, visitant_team_id: 8, game_date: DateTime.parse("16/06/2016 15:00"), stage: "Jornada 2")
Game.create(local_team_id: 12, visitant_team_id: 10, game_date: DateTime.parse("16/06/2016 18:00"), stage: "Jornada 2")
Game.create(local_team_id: 9, visitant_team_id: 11, game_date: DateTime.parse("16/06/2016 21:00"), stage: "Jornada 2")

Game.create(local_team_id: 18, visitant_team_id: 20, game_date: DateTime.parse("17/06/2016 15:00"), stage: "Jornada 2")
Game.create(local_team_id: 14, visitant_team_id: 13, game_date: DateTime.parse("17/06/2016 18:00"), stage: "Jornada 2")
Game.create(local_team_id: 15, visitant_team_id: 16, game_date: DateTime.parse("17/06/2016 21:00"), stage: "Jornada 2")

Game.create(local_team_id: 6, visitant_team_id: 7, game_date: DateTime.parse("18/06/2016 15:00"), stage: "Jornada 2")
Game.create(local_team_id: 23, visitant_team_id: 22, game_date: DateTime.parse("18/06/2016 18:00"), stage: "Jornada 2")
Game.create(local_team_id: 24, visitant_team_id: 21, game_date: DateTime.parse("18/06/2016 21:00"), stage: "Jornada 2")
