

class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion:  { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
    
    validate :clickbait?
    

    def clickbait?
        if title != nil
            if title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top #{0..9}") || title.include?("Guess" )
                return true
            else
                errors.add(:title, "is not a click-baity title.")
            end
        end
    end
end


