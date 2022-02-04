defmodule ApiArvore.PartnersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ApiArvore.Partners` context.
  """

  @doc """
  Generate a unique entity parent_id.
  """
  def unique_entity_parent_id, do: System.unique_integer([:positive])

  @doc """
  Generate a entity.
  """
  def entity_fixture(attrs \\ %{}) do
    {:ok, entity} =
      attrs
      |> Enum.into(%{
        entity_type: "some entity_type",
        inep: 42,
        name: "some name",
        parent_id: unique_entity_parent_id(),
        subtree_ids: []
      })
      |> ApiArvore.Partners.create_entity()

    entity
  end
end
