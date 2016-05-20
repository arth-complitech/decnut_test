class FavoritePathwaysController < ApplicationController
before_action :set_pathway

def create
	if Favorite.create(favorited: @pathway, user: current_user)
		puts "=====pathway favorited successfully.====="
		redirect_to root_path
	else
		puts "=====pathway favorited failed.====="
		redirect_to root_path
	end
end

def destroy
	Favorite.where(favorited_id: @pathway.id, user_id: current_user.id).first.destroy
	puts "=====favorited pathway destroyed.====="
	redirect_to root_path
end

private

def set_pathway
	@pathway = Pathway.find(params[:pathway_id] || params[:id])
end
end