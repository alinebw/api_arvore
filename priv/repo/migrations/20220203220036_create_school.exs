defmodule ApiArvore.Repo.Migrations.CreateSchool do
  use Ecto.Migration

  def change do
    create table(:school) do
      add :name, :string
      add :entity_type, :string
      add :inep, :integer
      add :parent_id, :integer
      add :subtree_ids, :integer


    end

    create unique_index(:school, [:parent_id])
  end
end
