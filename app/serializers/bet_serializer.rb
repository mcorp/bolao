class BetSerializer < ActiveModel::Serializer
  ## bet attributes
  attributes :id, :team_home_goals, :team_away_goals, :points, :is_bettable, :label

  ## game attributes
  attributes :team_home, :team_home_short, :team_away, :team_away_short,
             :team_home_image_url, :team_away_image_url, :weekday, :time, :date,
             :game_team_home_goals, :game_team_away_goals

  ## methods
  def is_bettable
    object.bettable?
  end

  def label
    return nil       if object.points.blank?
    return 'success' if object.points == 40
    return 'danger'  if object.points == 0
    return 'warning'
  end

  def weekday
    I18n.t("date.abbr_day_names")[object.played_at.strftime("%w").to_i]
  end

  def time
    object.played_at.strftime("%H:%M")
  end

  def date
    object.played_at.strftime("%d/%m")
  end

  def team_home
    object.team_home.to_s
  end

  def team_home_short
    object.team_home.short_name.to_s
  end

  def team_home_image_url
    object.team_home.image.url
  end

  def team_away
    object.team_away.to_s
  end

  def team_away_short
    object.team_away.short_name.to_s
  end

  def team_away_image_url
    object.team_away.image.url
  end

  def game_team_home_goals
    object.game.team_home_goals
  end

  def game_team_away_goals
    object.game.team_away_goals
  end
end
