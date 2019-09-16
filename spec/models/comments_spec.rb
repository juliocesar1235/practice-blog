require 'rails_helper'

RSpec.describe 'Comment' do           #
  context 'Creating a comment' do  # (almost) plain English
    it 'needs a bigger commenter name' do
      article = Article.create(title:"errors")
      comment = article.comments.create(commenter: "e")
      expect(comment).to_not be_valid  # test code
    end

    it 'succeed' do
      article = Article.create(title:"correct")
      comment = article.comments.create(commenter: "success")
      expect(comment).to be_valid  # test code
    end
  end
end
