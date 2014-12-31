Sequel.migration do
  change do
    create_table(:events) do
      primary_key   :id
      String        :name
    end
  end
end
