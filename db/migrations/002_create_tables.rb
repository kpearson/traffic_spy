Sequel.migration do
  change do
    create_table(:urls) do
      primary_key        :id
      String             :url
    end

    create_table(:referred_by) do
      primary_key        :id
      String             :referrer
    end

    create_table(:events) do
      primary_key        :id
      String             :event
    end

    create_table(:user_agents) do
      primary_key        :id
      String             :data
      String             :OS
      String             :browser
    end

    create_table(:resolutions) do
      primary_key        :id
      String             :height
      String             :width
    end
  end
end
