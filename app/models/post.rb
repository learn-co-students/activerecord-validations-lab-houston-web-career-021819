class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :title_clickbate

    def title_clickbate
        if title != nil
          if !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Top [number]") && !title.include?("Guess")
           errors.add(:title_clickbate, "not sufficiently clickbate")
          end
        end
    end
end
  