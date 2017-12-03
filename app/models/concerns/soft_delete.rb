module SoftDelete
  extend ActiveSupport::Concern

  def soft_destroy
    update_columns(deleted_at: Time.now, updated_at: Time.now)
  end

  def deleted?
    deleted_at.present?
  end
end