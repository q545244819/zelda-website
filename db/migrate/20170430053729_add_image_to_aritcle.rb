class AddImageToAritcle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :image, :string
  end
end
