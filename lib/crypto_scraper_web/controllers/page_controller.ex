defmodule CryptoScraperWeb.PageController do
  use CryptoScraperWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
