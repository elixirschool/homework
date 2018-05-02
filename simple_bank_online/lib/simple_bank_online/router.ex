defmodule SimpleBankOnline.Router do
  use Plug.Router

  plug :match
  plug Plug.RequestId
  plug Plug.Logger, log: :info
  plug Plug.Parsers, parsers: [:json], pass: ["text/*"], json_decoder: Poison
  plug :dispatch

  get "/", do: send_resp(conn, 200, Poison.encode!(%{msg: "Welcome to Simple Bank Online!"}))

  post "/accounts" do
  end

  get "/accounts/:id" do
  end

  post "/accounts/:id/deposits" do
  end

  post "/accounts/:id/withdrawals" do
  end

  match _ do
    render({:error, :not_found}, conn)
  end

  defp render({:ok, result}, conn) do
    send_resp(conn, 200, Poison.encode!(result))
  end

  defp render({:error, reason}, conn) when reason in [:not_found, :missing_account] do
    send_resp(conn, 404, Poison.encode!(%{errors: ["We're sorry.  What you're looking for cannot be found."]}))
  end

  defp render({:error, reason}, conn) do
    send_resp(conn, 400, Poison.encode!(%{errors: [reason]}))
  end
end
