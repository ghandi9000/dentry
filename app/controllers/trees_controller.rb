# trees_controller.rb --- 
# Filename: trees_controller.rb
# Description: 
# Author: Noah Peart
# Created: Sun Dec  7 17:02:23 2014 (-0400)
# Last-Updated: Wed Dec 31 16:18:37 2014 (-0500)
#           By: Noah Peart
# 
class TreesController < ApplicationController
  # http_basic_authenticate_with email: "dhh", password: "secret",
  # except: [:index, :show]
  
  def index
    if (params[:sort_by].blank? &&
        params[:species].blank? &&
        params[:plots].blank? &&
        !session[:sort_by].blank?)
      flash.keep
      redirect_to :sort_by => session[:sort_by], :species => session[:species],
      :plots => session[:plots]
    end

    # Determine sorting index/subsets
    @sort_by = params[:sort_by] ? params[:sort_by] : 'plot' # default: sort by plot
    @all_species = Tree.get_all_species
    @all_plots = Tree.get_all_plots
    @selected_species = params[:species] ? params[:species].respond_to?('keys') ?
    params[:species].keys : params[:species] : @all_species
    @selected_plots = params[:plots] ? params[:plots].respond_to?('keys') ?
    params[:plots].keys : params[:plots] : @all_plots
    @selected_plots = @selected_plots.map { |p| p.to_i }

    if params[:commit] == 'Reset'
      redirect_to :sort_by => session[:sort_by], :species => @all_species,
      :plots => @all_plots
    end
    
    # Session variables
    session[:sort_by] = @sort_by
    session[:species] = @selected_species
    session[:plots] = @selected_plots
    @trees = Tree.where(species: @selected_species,
                        plot: @selected_plots).order(@sort_by)
  end

  def show
    id = params[:id]  # retrieve tree ID from URI route
    @tree = Tree.find(id)  # look up tree by unique ID
    # renders app/views/trees/show.html.haml by default
  end
  
  def new
    # default: render 'new' template
  end
  
  def create
    params.require(:tree).permit!
    @tree = Tree.create!(params[:tree])
    flash[:notice] = "Tree #{@tree.tag} in plot #{@tree.plot} was successfully created."
    redirect_to trees_path
  end
  
  def edit
    @tree = Tree.find params[:id]
  end
  
  def update
    params.require(:tree).permit!
    @tree = Tree.find(params[:id])
    @tree.update_attributes!(params[:tree])
    flash[:notice] = "Tree #{@tree.tag} was successfully updated."
    respond_to do |client_wants|
      client_wants.html { redirect_to tree_path(@tree) }
      client_wants.xml { render :xml => @tree.to_xml }
    end
  end
  
  def destroy
    @tree = Tree.find(params[:id])
    @tree.destroy
    flash[:notice] = "Tree #{@tree.tag} deleted."
    redirect_to trees_path
  end
end
