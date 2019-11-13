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
    @search_form = ArticleSearchForm.new(params[:search])
    @articles = @search_form.search
  end

end
