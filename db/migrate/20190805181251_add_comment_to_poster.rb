class AddCommentToPoster < ActiveRecord::Migration[5.2]
  def change
    add_column :posters, :comment, :string
    add_column :posters, :missing_time, :string
  end
end
