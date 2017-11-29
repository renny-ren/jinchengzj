module SoftDelete
  extend ActiveSupport::Concern

  def destroy
    update_columns(deleted_at: Time.now, updated_at: Time.now)
  end

  def deleted?
    deleted_at.present?
  end

  def real_destroy
    run_callbacks :destroy
  end
end