defmodule ApiArvore.Repo do
  use Ecto.Repo,
    otp_app: :api_arvore,
    adapter: Ecto.Adapters.MyXQL
end
