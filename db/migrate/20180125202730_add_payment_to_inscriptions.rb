class AddPaymentToInscriptions < ActiveRecord::Migration[5.0]
  def change
    add_column :inscriptions, :payment, :float
  end
end
