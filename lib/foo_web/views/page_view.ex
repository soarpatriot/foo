defmodule FooWeb.PageView do
  use FooWeb, :view

  def render("medium.json", %{body: body}) do 
    %{
      body: body
    }
  end
end
