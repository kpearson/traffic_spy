Sequel.migration do
  change do
    create_table(:sources) do
      primary_key        :id
      String             :identifier, :unique => true
      String             :root_url
    end
  end
end
