Sequel.migration do
  change do
    create_table(:refferal) do
      primary_key   :id
      String        :referrer
    end
  end
end
