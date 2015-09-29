Sequel.migration do
  change do
    create_table(:stories, :ignore_index_errors => true) do
      primary_key :id
      index [:name], :unique => true
      String :name, :size => 255, :null => false
      DateTime :created_at
      DateTime :updated_at
    end

    create_table(:texts, :ignore_index_errors => true) do
      primary_key :id
      foreign_key :story_id, :stories, :null => false, :key => [:id]

      String :text
      DateTime :created_at, :null => false
      DateTime :updated_at
    end

end
