class SetIdAsPetPrimaryKey < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE pets ADD PRIMARY KEY (id);"
  end
end
