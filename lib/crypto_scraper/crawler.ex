defmodule CryptoScraper.Crawler do
  use Task

  def start_link() do
    Task.start_link(&poll/0)
  end

  def poll() do
    receive do
    after
      6_000 ->
        get_ticker("BTC-LTC")
        # |> TODO: save to db
        |> IO.inspect()

        poll()
    end
  end

  def get_markets do
    url = "https://bittrex.com/api/v1.1/public/getmarkets"
    response = HTTPoison.get!(url)
    Poison.decode!(response.body)
  end

  def get_currencies do
    url = "https://bittrex.com/api/v1.1/public/getcurrencies"
    response = HTTPoison.get!(url)
    Poison.decode!(response.body)
  end

  def get_ticker(market) do
    url = "https://bittrex.com/api/v1.1/public/getticker?market=#{market}"
    response = HTTPoison.get!(url)
    Poison.decode!(response.body)
  end
end
