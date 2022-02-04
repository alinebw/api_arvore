defmodule ApiArvore.PartnersTest do
  use ApiArvore.DataCase

  alias ApiArvore.Partners

  describe "school" do
    alias ApiArvore.Partners.Entity

    import ApiArvore.PartnersFixtures

    @invalid_attrs %{entity_type: nil, inep: nil, name: nil, parent_id: nil, subtree_ids: nil}

    test "list_school/0 returns all school" do
      entity = entity_fixture()
      assert Partners.list_school() == [entity]
    end

    test "get_entity!/1 returns the entity with given id" do
      entity = entity_fixture()
      assert Partners.get_entity!(entity.id) == entity
    end

    test "create_entity/1 with valid data creates a entity" do
      valid_attrs = %{entity_type: "some entity_type", inep: 42, name: "some name", parent_id: 42, subtree_ids: []}

      assert {:ok, %Entity{} = entity} = Partners.create_entity(valid_attrs)
      assert entity.entity_type == "some entity_type"
      assert entity.inep == 42
      assert entity.name == "some name"
      assert entity.parent_id == 42
      assert entity.subtree_ids == []
    end

    test "create_entity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Partners.create_entity(@invalid_attrs)
    end

    test "update_entity/2 with valid data updates the entity" do
      entity = entity_fixture()
      update_attrs = %{entity_type: "some updated entity_type", inep: 43, name: "some updated name", parent_id: 43, subtree_ids: []}

      assert {:ok, %Entity{} = entity} = Partners.update_entity(entity, update_attrs)
      assert entity.entity_type == "some updated entity_type"
      assert entity.inep == 43
      assert entity.name == "some updated name"
      assert entity.parent_id == 43
      assert entity.subtree_ids == []
    end

    test "update_entity/2 with invalid data returns error changeset" do
      entity = entity_fixture()
      assert {:error, %Ecto.Changeset{}} = Partners.update_entity(entity, @invalid_attrs)
      assert entity == Partners.get_entity!(entity.id)
    end

    test "delete_entity/1 deletes the entity" do
      entity = entity_fixture()
      assert {:ok, %Entity{}} = Partners.delete_entity(entity)
      assert_raise Ecto.NoResultsError, fn -> Partners.get_entity!(entity.id) end
    end

    test "change_entity/1 returns a entity changeset" do
      entity = entity_fixture()
      assert %Ecto.Changeset{} = Partners.change_entity(entity)
    end
  end
end
