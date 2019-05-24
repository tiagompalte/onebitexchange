class ExchangesController < ApplicationController
  def index
  end

  def convert
    exchange = ExchangeService.new(params[:source_currency], params[:target_currency], params[:amount])

    value = if params[:source_currency] == 'BTC' || params[:target_currency] == 'BTC'
      exchange.exchange_bitcoin
    else
      exchange.perform
    end

    render json: {"value": value}
  end
end