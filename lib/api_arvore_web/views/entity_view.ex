defmodule ApiArvoreWeb.EntityView do
  use ApiArvoreWeb, :view
  alias ApiArvoreWeb.EntityView

  def render("index.json", %{school: school}) do
    %{data: render_many(school, EntityView, "entity.json")}
  end

  def render("show.json", %{entity: entity}) do
    %{data: render_one(entity, EntityView, "entity.json")}
  end

  def render("entity.json", %{entity: entity}) do
    %{
      id: entity.id,
      name: entity.name,
      entity_type: entity.entity_type,
      inep: entity.inep,
      parent_id: entity.parent_id,
      subtree_ids: entity.subtree_ids
    }
  end
end
