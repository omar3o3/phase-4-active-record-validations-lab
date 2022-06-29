class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

    validate :contains_click_bait

    def contains_click_bait
        # unless title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
        unless title =~ /Won't Believe/i || /Secret/i || /Top \d/i || /Guess/i
            errors.add(:title, 'Title must be clickbait')
        end
    end


end
