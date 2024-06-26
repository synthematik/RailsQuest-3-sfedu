class HomeController < ApplicationController

  def index

  end

  def warehouses
    @team1 = Character.where(team: 1)
    @team2 = Character.where(team: 2)
  end

  def create
    Character.create(
      team: params[:character][:team],
      unit: params[:character][:unit],
    )
  end

  def create_knight
    Character.create(team: 1, unit: 'knight')
    redirect_to warehouses_path
  end

  def create_mage
    Character.create(team: 1, unit: 'mage')
    redirect_to warehouses_path
  end

  def create_medusa
    Character.create(team: 2, unit: 'medusa')
    redirect_to warehouses_path
  end

  def create_jinn
    Character.create(team: 2, unit: 'jinn')
    redirect_to warehouses_path
  end

  def destroy_jinn
    @character = Character.where(team: 2, unit: 'jinn').last
    @character&.destroy

    redirect_to warehouses_path
  end

  def destroy_medusa
    @character = Character.where(team: 2, unit: 'medusa').last
    @character&.destroy

    redirect_to warehouses_path
  end

  def destroy_mage
    @character = Character.where(team: 1, unit: 'mage').last
    @character&.destroy

    redirect_to warehouses_path
  end

  def destroy_knight
    @character = Character.where(team: 1, unit: 'knight').last
    @character&.destroy

    redirect_to warehouses_path
  end

  def team1_ultimate
    if Character.has_character_type_in_team(1, 'knight', 2) &&
      Character.has_character_type_in_team(1, 'mage', 2)
      5.times do
        Character.create(unit: 'knight', team: 1)
      end

      redirect_to warehouses_path
    else

      redirect_to warehouses_path
    end
  end

  def team2_ultimate
    if Character.has_character_type_in_team(2, 'jinn', 2) &&
      Character.has_character_type_in_team(2, 'medusa', 1)

      enemy_characters = Character.where(team: 1)

      enemy_characters.sample(3).each(&:destroy)

      redirect_to warehouses_path
    else

      redirect_to warehouses_path
    end
  end
end