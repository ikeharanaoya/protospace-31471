class PrototypesController < ApplicationController
  # ログイン確認。初期表示、詳細以外は、ログイン画面へ遷移する
  before_action :authenticate_user!, except: [:index, :show]

  # indexアクション
  def index
    @prototypes = Prototype.all
  end

  # newアクション
  def new
    # Prototypeモデルの新規オブジェクトを代入
    @prototype = Prototype.new
  end

  # createアクション
  def create
    # データ保存の準備
    @prototype = Prototype.new(prototype_params)
    # データ保存＆確認
    if @prototype.save
      # 正常の場合、ルートパスに戻る
      redirect_to root_path
    else
      # 異常の場合、投稿ページを再表示
      render :new
    end
  end

  # showアクション
  def show
    # 送信されたIDでprototypeを取得
    @prototype = Prototype.find(params[:id])
    # Commentモデルの新規オブジェクトを代入
    @comment = Comment.new
    # コメント一覧を取得
    @comments = @prototype.comments.includes(:user)
  end

  # editアクション
  def edit
    # 送信されたIDでprototypeを取得
    @prototype = Prototype.find(params[:id])
    # プロトタイプの投稿者とログインしているユーザーが違う場合
    unless user_signed_in? && current_user.id == @prototype.user_id
      # トップページに遷移する
      redirect_to action: :index
    end
  end

  # updateアクション
  def update
    # データ取得
    @prototype = Prototype.find(params[:id])
    # データ保存＆確認
    if @prototype.update(prototype_params)
      # 正常の場合、詳細ページに戻る
      redirect_to prototype_path(@prototype.id)
    else
      # 異常の場合、編集ページを再表示
      render :edit
    end
  end

  # destroyアクション
  def destroy
    # データ取得
    prototype = Prototype.find(params[:id])
    # データ削除
    prototype.destroy
    # トップページに戻る
    redirect_to root_path
  end

  # ストロングパラメーター取得
  private def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
