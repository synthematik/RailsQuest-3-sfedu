class Character < ApplicationRecord
  validates :team, numericality: { only_integer: true, in: 1..2 }
  validates :unit, inclusion: { in: ->(character) { character.units_list }  }, allow_blank: true

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

  def normal_ability
    case unit
    when 'mage'
      "Огненный шар"
    when 'knight'
      "Удар мечом"
    when 'medusa'
      "Остолбеней"
    when 'jinn'
      "Шторм"
    else
      "Упс, что-то где-то почему-то пошло не так"
    end
  end

  def ultimate_ability
    case unit
    when 'mage'
      "Супер огненный шар"
    when 'knight'
      "Супер удар мечом"
    when 'medusa'
      "Супер остолбеней"
    when 'jinn'
      "Супер шторм"
    else
      "Упс, что-то где-то почему-то пошло не так"
    end
  end
end
