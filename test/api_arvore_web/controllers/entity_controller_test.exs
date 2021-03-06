defmodule ApiArvoreWeb.EntityControllerTest do
  use ApiArvoreWeb.ConnCase

  import ApiArvore.PartnersFixtures

  alias ApiArvore.Partners.Entity

  @create_attrs %{
    entity_type: "some entity_type",
    inep: 42,
    name: "some name",
    parent_id: 42,
    subtree_ids: []
  }
  @update_attrs %{
    entity_type: "some updated entity_type",
    inep: 43,
    name: "some updated name",
    parent_id: 43,
    subtree_ids: []
  }
  @invalid_attrs %{entity_type: nil, inep: nil, name: nil, parent_id: nil, subtree_ids: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all school", %{conn: conn} do
      conn = get(conn, Routes.entity_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create entity" do
    test "renders entity when data is valid", %{conn: conn} do
      conn = post(conn, Routes.entity_path(conn, :create), entity: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.entity_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "entity_type" => "some entity_type",
               "inep" => 42,
               "name" => "some name",
               "parent_id" => 42,
               "subtree_ids" => []
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.entity_path(conn, :create), entity: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update entity" do
    setup [:create_entity]

    test "renders entity when data is valid", %{conn: conn, entity: %Entity{id: id} = entity} do
      conn = put(conn, Routes.entity_path(conn, :update, entity), entity: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.entity_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "entity_type" => "some updated entity_type",
               "inep" => 43,
               "name" => "some updated name",
               "parent_id" => 43,
               "subtree_ids" => []
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, entity: entity} do
      conn = put(conn, Routes.entity_path(conn, :update, entity), entity: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete entity" do
    setup [:create_entity]

    test "deletes chosen entity", %{conn: conn, entity: entity} do
      conn = delete(conn, Routes.entity_path(conn, :delete, entity))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.entity_path(conn, :show, entity))
      end
    end
  end

  defp create_entity(_) do
    entity = entity_fixture()
    %{entity: entity}
  end
end
