module TaskServices
  class Update
    def self.call(task:, params:)
      if params[:user_id]
        assigned_user = User.find_by(id: params[:user_id])
        return false if assigned_user.nil? || !assigned_user.workspaces.exists?(task.workspace_id)
      end

      task.update(params)
    end
  end
end