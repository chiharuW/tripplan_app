# frozen_string_literal: true

class FixDeviseDefaultValue < ActiveRecord::Migration[6.1]
  def change
   change_column_default :admins, :encrypted_password, nil
   change_column_default :admins, :email, nil
   change_column_default :customers, :encrypted_password, nil
   change_column_default :customers, :email, nil
  end
end
