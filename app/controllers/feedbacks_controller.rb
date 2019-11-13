class FeedbacksController < ApplicationController

  ###### フィードバック内容をデータベースに保存したい場合############
  # def index
  # end
  #
  # def new
  #   @feedback = Feedback.new
  # end
  #
  # def create
  #   @feedback = Feedback.new(feedback_params)
  #   if @feedback.save
  #     redirect_to feedbacks_path, notice: 'フィードバックを送信しました'
  #   else
  #     render :new
  #   end
  # end
  #
  # private
  #
  # def feedback_params
  #   params.require(:feedback).permit(:title, :body)
  # end


  ########## フィードバックをデータベースに保存せずに、
  # サービス管理者へメールを送信するようにコードを変更した例。
  # データベースに保存しないので、ApplicationRecordを継承したモデルは使用しません。

  # #####################################################
  # これもまだ、ビジネスロジックが混ざっているのでよくはない
  # #####################################################
  # def index
  #
  # end
  #
  # def new
  # end
  #
  # def create
  #
  #   # DBに保存しないから、if @feedback.save みたいに書けない
  #
  #   if params[:title].present? && params[:body].present?
  #     # メール送ったていで
  #     # AdminMailer.feedback(params[:title], params[:body]).deliver_later
  #     redirect_to feedbacks_path, notice: 'フィードバックを送信しました'
  #   else
  #     # この辺とか、コントローラもビューも読まないと@error_messagesが何かわからない。
  #     @error_messages = []
  #     @error_messages << 'タイトルを入力してください' if params[:title].blank?
  #     @error_messages << '本文を入力してください' if params[:body].blank?
  #     render :new
  #   end
  # end


  ###########################################
  # フォームオブジェクト（フォームクラス）を利用した例
  ###########################################

  def index

  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    # modelで、ActiveModel::Modelをincludeしたおかげで、
    # DBを利用しないフォームでもActive Recordを利用したときと同じような記述をすることができ

    # DBに保存しないのに、if @feedback.save みたいに書ける
    if @feedback.save
      redirect_to feedbacks_path, notice: '送信しました'
    else
      render :new
    end
  end


  private

  def feedback_params
    params.require(:feedback).permit(:title, :body)
  end


end
