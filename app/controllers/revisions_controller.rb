class RevisionsController < ApplicationController

  def show
    @bloc = Bloc.find(params[:bloc_id])
    @revision = @bloc.revision
  end


  def page1
    render 'blocs/page1'
  end

  def page2
    render 'blocs/page2'
  end

  def page3
    render 'blocs/page3'
  end

  def page4
    render 'blocs/page4'
  end
end
