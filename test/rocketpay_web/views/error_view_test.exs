defmodule RocketpayWeb.ErrorViewTest do
  use RocketpayWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.html" do
    assert render_to_string(RocketpayWeb.ErrorView, "404.html", []) ==
       %{errors: %{detail: "Not Found"}}
  end

  test "renders 500.html" do
    assert render_to_string(RocketpayWeb.ErrorView, "500.html", []) ==
      %{errors: %{detail: "Internal Server Error" }}
  end
end
