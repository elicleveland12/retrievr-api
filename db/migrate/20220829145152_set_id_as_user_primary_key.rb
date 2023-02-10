class SetIdAsUserPrimaryKey < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE users ADD PRIMARY KEY (id);"
  end
end
