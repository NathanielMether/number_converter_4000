class NumberConverterController < ApplicationController
  def index
    safe_params = params.permit(:number, :current_base, :base)
    if !safe_params.empty?
      @number = safe_params[:number]
      @current_base = safe_params[:current_base].to_i
      @base = safe_params[:base].to_i
    end
  end
end
