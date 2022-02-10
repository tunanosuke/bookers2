class AddIntroductionAndImageColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introduction, :text, after: :name
    add_column :users, :image_id, :string, after: :introduction
  end
end
