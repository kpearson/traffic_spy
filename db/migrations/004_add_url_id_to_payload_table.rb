Sequel.migration do
  change do
    add_column(:payloads, :url_id, Integer)
  end
end