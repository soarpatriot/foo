defmodule FooWeb.PageController do
  use FooWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def medium(conn, _params) do
    url = "https://yun.dreamreality.cn/test"
    # options = [recv_timeout: 100000]
    options = [timeout: 100000, recv_timeout: 1000000, max_connections: 1000000]
    {:ok, status, headers, client } = :hackney.request(:get, url, [], <<>>,options)
    {:ok, body} = :hackney.body(client)
    # headers = []
    # {:ok, response} = HTTPoison.get(url, headers, options)
    render(conn, "medium.json", %{body: body})
  end

  def short(conn, _params) do
    url = "https://yun.dreamreality.cn/short"
    options = [recv_timeout: 900000, max_connections: 1000000]
    {:ok, response} = HTTPoison.get(url, [], options)
    render(conn, "medium.json", %{body: response.body})
  end

  def normal(conn, _params) do
    url = "https://yun.dreamreality.cn/normal"
    options = [recv_timeout: 900000, max_connections: 1000000]
    {:ok, response} = HTTPoison.get(url, [], options)
    render(conn, "medium.json", %{body: response.body})
  end


  def long(conn, _params) do
    url = "https://yun.dreamreality.cn/medium"
    # options = [recv_timeout: 100000]
    options = [timeout: 100000, recv_timeout: 1000000, max_connections: 1000000]
    {:ok, status, headers, client } = :hackney.request(:get, url, [], <<>>,options)
    {:ok, body} = :hackney.body(client)
    # headers = []
    # {:ok, response} = HTTPoison.get(url, headers, options)
    render(conn, "medium.json", %{body: body})
  end
end
