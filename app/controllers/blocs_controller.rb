class BlocsController < ApplicationController
  def index
    @blocs = Bloc.all
  end

  def show

  end

end
