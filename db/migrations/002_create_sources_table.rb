Sequel.migration do
  change do
    create_table(:sources) do
      primary_key        :id
      String             :identifier, :unique => true
      foreign_key        :url_id,     :urls
    end
  end
end
