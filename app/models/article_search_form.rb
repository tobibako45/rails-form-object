class ArticleSearchForm

  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :user
  attribute :keyword, :string
  attribute :draft, :boolean, default: false

  def search
    scope = Article.all
    scope = scope.matches(keyword) if keyword.present?
    if draft?
      scope = scope.with_draft(user)
    else
      scope = scope.published
    end
  end

end
