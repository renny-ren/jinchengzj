module SoftDelete
  extend ActiveSupport::Concern

  def destroy
    run_callbacks :destroy do
      t = Time.now
      update_columns(deleted_at: t, updated_at: t)
    end
  end

  def deleted
    deleted_at.present?
  end
end