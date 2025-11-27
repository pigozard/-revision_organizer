class RevisionsController < ApplicationController

  def show
    @bloc = Bloc.find(params[:bloc_id])
    @revision = @bloc.revision
  end
end
