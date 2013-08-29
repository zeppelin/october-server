class PomidoroController < ApplicationController
  def create
    render text: "#{params[:pomodoro][:foo]}"
  end
end
