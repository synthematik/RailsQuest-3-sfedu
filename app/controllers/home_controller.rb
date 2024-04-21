class HomeController < ApplicationController

  def index
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
    redirect_to root_path
  end

  def create_mage
    Character.create(team: 1, unit: 'mage')
    redirect_to root_path
  end

  def create_medusa
    Character.create(team: 2, unit: 'medusa')
    redirect_to root_path
  end

  def create_jinn
    Character.create(team: 2, unit: 'jinn')
    redirect_to root_path
  end

  def destroy_jinn
    @character = Character.where(team: 2, unit: 'jinn').last
    @character&.destroy

    redirect_to root_path
  end
end