class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.references :project, index:true, foreign_key:true
      t.references :user, index:true, foriegn_key:true
      t.timestamps null: false
    end
  end
end
