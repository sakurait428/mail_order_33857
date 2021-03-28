class Inquiry < ApplicationRecord

  with_options presence: true do
    validates :name
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format: {with: VALID_EMAIL_REGEX, message: "が正しくありません"}, allow_blank: true
    validates :email, presence: true
    validates :message
  end

end
