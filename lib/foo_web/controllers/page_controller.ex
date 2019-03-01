defmodule FooWeb.PageController do
  use FooWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def medium(conn, _params) do
    url = "https://yun.dreamreality.cn/test"
    options = [recv_timeout: 100000]
    headers = []
    data = nil
    {:ok, response} = HTTPoison.get(url, headers, options)
    render(conn, "medium.json", %{body: response.body})
  end

  def short(conn, _params) do
    render(conn, "index.html")
  end

  def long(conn, _params) do
    render(conn, "index.html")
  end
end
