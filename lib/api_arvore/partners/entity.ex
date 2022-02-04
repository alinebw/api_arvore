defmodule ApiArvore.Partners.Entity do
  use Ecto.Schema
  import Ecto.Changeset

  schema "school" do
    field :entity_type, :string
    field :inep, :integer
    field :name, :string
    field :parent_id, :integer
    field :subtree_ids, :integer

  end

  @doc false
  def changeset(entity, attrs) do
    entity
    |> cast(attrs, [:name, :entity_type, :inep, :parent_id, :subtree_ids])
    |> validate_required([:name, :entity_type, :inep, :parent_id, :subtree_ids])
    |> unique_constraint(:parent_id)
  end
end
