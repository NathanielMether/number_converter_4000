class NumberConverterController < ApplicationController
  def index
    safe_params = params.permit(:number, :from_base, :to_base)
    @number_conversion = NumberConversion.new(safe_params)
    @number_conversion.save if request.post?

    @past_conversions = NumberConversion.all.order(created_at: :desc)
  end
end
