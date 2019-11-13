class ArticlesController < ApplicationController

  def index
    # scope = Article.all
    #
    # if params[:keyword]
    #   scope = scope.metches(params[:keyword])
    # end
    #
    # if params[:draft] == '1'
    #   scope = scope.with_draft(user)
    # else
    #   scope = scope.published
    # end
    #
    # @articles = scope

    # フォームクラスを利用
    #
    # このようなArticleSearchFormを利用する際には、フォーム画面でform_withヘルパーなどを利用して、
    # params[:keyword]ではなく、
    # params[:search][:keyword]、params[:search][:draft]というように、
    # １つのキーの下に、まとめられるようにします。
    # そうすることで、コントローラで次のように一括代入できます。
    @search_form = ArticleSearchForm.new(params[:search])
    @articles = @search_form.search
  end

end
