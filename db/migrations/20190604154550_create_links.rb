Hanami::Model.migration do
  change do
    create_table :links do
      primary_key :id

      column :key, String, unique: true, null: false
      column :url, String, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
