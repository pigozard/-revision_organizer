class BlocsController < ApplicationController
  def index
    @blocs = Bloc.all
  end

  def show
    @bloc = Bloc.find(params[:id])
    @chat = Chat.find(params[:chat])
    @message = Message.new
  end
end
