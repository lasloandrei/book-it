class RenameDiningTablesNumberToUid < ActiveRecord::Migration
  def change
  	rename_column :dining_tables, :number, :uid
  end
end
