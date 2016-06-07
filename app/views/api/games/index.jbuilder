json.games do |json|
  json.array! @games do |game|
    json.extract! game, :id, :local_team, :visitant_team, :goals_local_team, :goals_visitant_team, :game_date, :comunio_points_value
  end
end
