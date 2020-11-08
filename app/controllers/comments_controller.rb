class CommentsController < ApplicationController
  # createアクション
  def create
    # データ保存の準備
    @comment = Comment.new(comment_params)
    # データ保存＆確認
    if @comment.save
      # 正常の場合、詳細ページにリダイレクト
      redirect_to prototype_path(@comment.prototype) 
    else
      # 異常の場合、詳細ページを再表示
      # prototypeの再設定
      @prototype = @comment.prototype
      # コメント一覧の再設定
      @comments = @prototype.comments
      # 詳細ページを再表示
      render "prototypes/show"
    end
  end

  # ストロングパラメーターを取得
  private def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
