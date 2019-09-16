require 'rails_helper'

RSpec.describe 'Article' do           #
  context 'Creating an article' do  # (almost) plain English
    it 'needs a bigger title' do   #
      article = Article.create(title: "er")
      expect(article).to_not be_valid  # test code
    end
    it 'succeed' do
      article = Article.create(title: "success")
      expect(article).to be_valid  # test code
    end

    it 'with comments' do
      article = Article.create(title: "An Article", text: "with comments")
      comment1 = article.comments.create(commenter: "Julio")
      comment2 = article.comments.create(commenter: "Cregi")
      expect(article.comments.count).to eq(2)
    end
  end
end
