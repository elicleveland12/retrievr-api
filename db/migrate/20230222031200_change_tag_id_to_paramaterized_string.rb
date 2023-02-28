class ChangeTagIdToParamaterizedString < ActiveRecord::Migration[7.0]
  def up
    remove_column :tags, :id, :uuid, default: "gen_random_uuid()", null: false

    add_column :tags, :id, :string, null: false

    execute "ALTER TABLE tags ADD PRIMARY KEY (id);"

    change_column :tags, :id, :string, null: false
  end

  def down
    remove_column :tags, :id, :string

    add_column :tags, :id, :uuid, default: "gen_random_uuid()", null: false

    execute "ALTER TABLE tags ADD PRIMARY KEY (id);"

    change_column :tags, :id, :uuid, default: "gen_random_uuid()", null: false
  end
end
