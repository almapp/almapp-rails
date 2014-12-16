class AddAppointmentToGroupsAdmins < ActiveRecord::Migration
  def change
    add_column :groups_admins, :appointment, :string
  end
end
