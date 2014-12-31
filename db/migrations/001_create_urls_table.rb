Sequel.migration do
  change do
    create_table(:urls) do
      primary_key   :id
      String        :url
    end
  end
end
