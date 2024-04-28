class Character < ApplicationRecord
  validates :team, numericality: { only_integer: true, in: 1..2 }
  validates :unit, inclusion: { in: ->(character) { character.units_list }  }, allow_blank: true

  def self.has_character_type_in_team(team, unit, min_count)
    Character.where(team: team, unit: unit).count >= min_count
  end

  def units_list
    case team
    when 1
      %w[mage knight]
    when 2
      %w[medusa jinn]
    else
      []
    end
  end
end
