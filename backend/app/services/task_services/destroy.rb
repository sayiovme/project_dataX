module TaskServices
  class Destroy
    def self.call(task:, current_user:)
      unless current_user.workspaces.exists?(id: task.workspace_id)
        task.errors.add(:base, "You are not a member of this workspace")
        return false
      end

      task.destroy
    end
  end
end
