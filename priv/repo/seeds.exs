# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ApiArvore.Repo.insert!(%ApiArvore.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

#importa módulos em que operações serão realizadas
alias ApiArvore.Repo
alias ApiArvore.Partners.Entity

Repo.delete_all("school")

Repo.insert!(%Entity{name: "Colégio Pedro II", entity_type: "school", inep: 123456, parent_id: 2, subtree_ids: 1})
Repo.insert!(%Entity{name: "CAP UFRJ", entity_type: "school", inep: 987654, parent_id: 5, subtree_ids: 1})

Repo.update!(%Entity{name: "Colégio Pedro II", entity_type: "school", inep: 123456, parent_id: 4, subtree_ids: 3})
