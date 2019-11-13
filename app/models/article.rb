class Article < ApplicationRecord

  # スコープの書き方
  # scope :with_chapter, -> { joins(:chapters) }
  # scope :search_with_id, ->(content_id) { where(id: content_id) }
  # scope :search_with_title, ->(title) { where(title: title) }

  scope :matches, ->(keyword) { where("title LINE ?", "%#{keyword}%").or(where("body LIKE ?", "%#{keyword}%")) }

  scope :with_draft, ->(user) { where(user: user).or(where(status: 'draft')) }

  scope :published, -> { where(status: 'published') }

end
