class Search < ApplicationRecord
  belongs_to :user

  scope :not_deleted, -> { where(deleted_at: nil) }
  scope :deleted, -> { where("#{table_name}.deleted_at IS NOT NULL") }

  def destroy
    update_attributes(deleted_at: DateTime.current)
  end

  def delete
    destroy
  end

  def deleted?
    deleted_at.present?
  end
end
