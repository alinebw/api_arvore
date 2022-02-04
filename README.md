# ApiArvore

## Instalar HEX, Phoenix e criar app ##

  # instalar hex
  mix local.hex
  # instalar phoenix
  mix archive.install hex phx_new
  
  # criar novo app
  mix phx.new api_arvore --database mysql

## Config database em dev.exs ##

# configurar banco de dados em dev.exs

config :api_arvore, ApiArvore.Repo,
  username: "root",
  password: "sua senha",
  database: "api_arvore_dev",
  hostname: "localhost",
  port: 3306,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

## Config database em test.exs ##

# configurar banco de dados em test.exs

config :api_arvore, ApiArvore.Repo,
  username: "root",
  password: "sua senha",
  database: "api_arvore_dev",
  hostname: "localhost",
  port: 3306,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

## Criar databse e rodar servidor ##

mix ecto.create
mix phx.server

## Criar e popular database

mix phx.gen.json Partners Entity school name:string entity_type:string inep:integer parent_id:integer:unique subtree_ids:integer

# Editar priv/repo/migrations/20220203220036_create_school.exs

remove função timestamp()

mix ecto.migrate

# Alterar seeds.exs

alias ApiArvore.Repo
alias ApiArvore.Partners.Entity

Repo.delete_all("school") - apenas para teste. Não usar em produção.

Repo.insert!(%Entity{name: "Colégio Pedro II", entity_type: "school", inep: 123456, parent_id: 2, subtree_ids: 1})
Repo.insert!(%Entity{name: "CAP UFRJ", entity_type: "school", inep: 987654, parent_id: 5, subtree_ids: 1})

mix run priv/repo/seeds.exs

# Editar router.ex

scope "/api", ApiArvoreWeb do
    pipe_through :api

    get "/", PageController, :index

    resources "/partners", EntityController
    
  end


