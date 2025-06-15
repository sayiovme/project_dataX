# 현재 로그인한 유저가 특정 워크스페이스에 새 태스크를 만든다.
# 조건 처리: 담당자로 지정된 유저가 그 워크스페이스에 속해 있는지 검사한다.
module TaskServices
  class Create
    # Current_user: ApplicationController에서 받아온 현재 생성자(생성자 유효성검사는 Controller에서 끝냄)  
    # Workspace, params: TasksController에서 받아온 인자
    def self.call(current_user:, workspace:, params:)
      # 담당자 유효성 검사: 담당자 user 찾고 워크스페이스에 참여 중인지 확인함
      assigned_user = User.find_by(id: params[:user_id])
      # 해당 유저가 존재하지 않거나, 해당 유저가 워크스페이스에 없을 경우 에러 처리
      return workspace.tasks.new.tap { _1.errors.add(:user, "This user has not joined current workspace.") } if assigned_user && !assigned_user.workspaces.exists?(workspace.id)

      # 담당자 유효성 검사 통과하면
      task = workspace.tasks.new(params)
      # 예외 처리: 안정성 위해, task.user가 이미 설정되어 있지 않다면, current_user를 넣어라
      task.user ||= current_user
      task.save
      task
    end
  end
end