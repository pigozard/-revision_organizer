class BlocsController < ApplicationController
  def index
    @blocs = Bloc.all
  end

  def show
    @bloc = Bloc.find(params[:id])
  end
end
