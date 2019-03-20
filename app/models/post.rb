class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { :minimum => 250}
    validates :summary, length: { :maximum => 250}
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}
    validate :is_clickbait

    def is_clickbait
        
        if title!=nil
            if title.include?("Won't Believe") || title.include?("Secret")|| title.include?("Top [number]") || title.include?("Guess")
                true
            else
                errors.add(:title, "is not a click-baity title.") 
            end
        end
    end

end