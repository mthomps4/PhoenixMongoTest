defmodule Lab.Web.PageControllerTest do
  use Lab.Web.ConnCase

  test "GET /" do
    conn = get build_conn(), "/"
    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
  end
end
