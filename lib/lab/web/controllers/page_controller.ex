defmodule Lab.Web.PageController do
  use Lab.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

end
