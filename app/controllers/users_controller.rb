class UsersController < ApplicationController
  # showアクション
  def show
    # ユーザー情報取得
    @user = User.find(params[:id])
    # ユーザーに紐づくプロダクトを取得
    @prototypes = @user.prototypes
  end
end
