defmodule ApiArvoreWeb.EntityController do
  use ApiArvoreWeb, :controller

  alias ApiArvore.Partners
  alias ApiArvore.Partners.Entity

  action_fallback ApiArvoreWeb.FallbackController

  def index(conn, _params) do
    school = Partners.list_school()
    render(conn, "index.json", school: school)
  end

  def create(conn, %{"entity" => entity_params}) do
    with {:ok, %Entity{} = entity} <- Partners.create_entity(entity_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("/partners", Routes.entity_path(conn, :show, entity))
      |> render("show.json", entity: entity)
    end
  end

  def show(conn, %{"id" => id}) do
    entity = Partners.get_entity!(id)
    render(conn, "show.json", entity: entity)
  end

  def update(conn, %{"id" => id, "entity" => entity_params}) do
    entity = Partners.get_entity!(id)

    with {:ok, %Entity{} = entity} <- Partners.update_entity(entity, entity_params) do
      render(conn, "show.json", entity: entity)
    end
  end

  def delete(conn, %{"id" => id}) do
    entity = Partners.get_entity!(id)

    with {:ok, %Entity{}} <- Partners.delete_entity(entity) do
      send_resp(conn, :no_content, "")
    end
  end
end
