class TasksController < ApplicationController
  # 미리, 1) 속한 workspace를 찾는다, 2) RUD 시 해당 Task를 찾는다, 3) 생성자가 워크스페이스 멤버인지 확인한다
  before_action :set_workspace
  before_action :set_task, only: [:show, :update, :destroy]
  before_action :authorize_workspace_member!

  # 조회: 특정 워크스페이스의 전체 태스크 목록 조회
  def index
    render json: @workspace.tasks
  end

  # 조회: 특정 워크스페이스 내 특정 태스크 1개 상세 조회
  def show
    render json: @task
  end

  # Create: 새로운 태스크 생성 요청 처리. Service로 데이터를 넘기고, 결과를 렌더링한다
  # current_user는 ApplicationController에서 찾은 user 사용함
  def create
    task = TaskServices::Create.call(current_user:, workspace: @workspace, params: task_params)

    if task.persisted?
      render json: task, status: :created
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  #Update: 태스크 수정 요청 처리. Service로 데이터를 넘기고, 결과를 렌더링한다
  def update
    success = TaskServices::Update.call(task: @task, params: task_params)

    if success
      render json: @task
    else
      render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Destroy: 태스크 삭제 요청 처리. Service로 데이터를 넘기고, 결과를 렌더링한다
  def destroy
  unless TaskServices::Destroy.call(task: @task, current_user: current_user)
    render json: { errors: @task.errors.full_messages }, status: :forbidden
  else
    head :no_content
  end
end


  private

  # Befor Action 함수

  # 모든 액션에서 :workspace_id를 통해 워크스페이스 찾아 저장
  def set_workspace
    @workspace = Workspace.find(params[:workspace_id])
  end

  # 태스크는 워크스페이스 내부에 있으므로, 해당 워크스페이스의 태스크 중에서만 찾음
  def set_task
    @task = @workspace.tasks.find(params[:id])
  end

  # 허용할 파라미터만 추려냄 (Strong Parameters)
  def task_params
    params.require(:task).permit(:title, :status, :description, :category, :user_id)
  end

  # 생성자가 Workspace 멤버인지 확인함 
  def authorize_workspace_member!
    unless current_user.workspaces.exists?(id: @workspace.id)
      render json: { error: "You are not a member of this workspace" }, status: :forbidden
    end
  end
end