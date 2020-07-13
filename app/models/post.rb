require 'pry'

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :summary, length: {maximum: 250}
  validates :content, length: {minimum: 50}
  validates :category, inclusion: {in: %w{Fiction Non-Fiction}}
  validate :is_click_bait?,

  def is_click_bait?
    click_bait = ["Won't Believe", "Secret", "Guess", "Top#{[0..9]}" ]
      click_bait.each do |c|
      if self.title != nil
        unless self.title.include?("Won't Believe")||self.title.include?("Secret")||self.title.include?("Guess")||self.title.include?("Top#{[0..9]}")
          errors.add(:title, "Title is not click-bait")
        end
      end
    end
  end




end
