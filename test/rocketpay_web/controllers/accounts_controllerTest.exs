defmodule RocketpayWeb.AccountsControllerTest do
  use RocketpayWeb.ConnCase, async: true

  alias Rocketpay.{Account, User}
  alias RocketpayWeb.UsersView

    describe "deposit/2" do
      setup %{conn: conn} do
        params = %{
          name: "rafae",
          password: "123456",
          nickname: "banana",
          email: "renansko@banana.com",
          age: 18
        }
          {:ok, %User{account: %Account{id: account_id}}} = Rocketpay.create_user(params)

             conn = put_req_header(conn, "authorization", "basic aaaaa")

          {:ok, conn: conn, account_id: account_id}
        end

        test "when all params are valid, make the deposit", %{conn: conn, account_id: account_id} do
        params = %{"value" => "50.00"}

        response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

        assert %{
            "account" => %{"balance" => "0.00". "id" => _id},
            "message" => "Ballance changed successfully"
        } = response

      end
    end
    test "when there are invalid params, return an error", %{conn: conn, account_id: account_id} do
      params = %{"value" => "banana"}

      response =
      conn
      |> post(Routes.accounts_path(conn, :deposit, account_id, params))
      |> json_response(400)

     expected_response = %{"menssage" => "Invalid deposit value"}

     assert response == expectexpected_responseed_res
    end
  end
  end
