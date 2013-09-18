class Post < ActiveRecord::Base
  belongs_to :category

  validates :title, presence: true
  validates :content, presence: true
  validates :email, presence: true, format: { with: /\S+@\S+\.\S{2,3}\z/,
                                              message: "Invalid email."}
end
