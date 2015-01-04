Sequel.migration do
  change do
    create_table(:payloads) do
      primary_key        :id
      foreign_key        :url_id, :urls
      foreign_key        :source_id, :sources
      DateTime           :requested_at
      foreign_key        :referred_by_id, :referred_by
      Integer            :responded_in
      String             :requested_type
      String             :parameters
      foreign_key        :event_id, :events
      foreign_key        :user_agent_id, :user_agents
      foreign_key        :resolution_id, :resolutions
      String             :ip
    end
  end
end