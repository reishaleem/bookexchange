class Book < ApplicationRecord
  belongs_to :user

  default_scope -> { order(created_at: :desc) }
  before_save { self.course = course.upcase }
  before_save { self.prof = prof.capitalize }

  validates :title, presence: true, length: { maximum: 80 }
  VALID_ISBN_REGEX = /\A(97(8|9))?\d{9}(\d|X)\z/i
  validates :isbn, length: { minimum: 10, maximum: 13 }, format: { with: VALID_ISBN_REGEX }, :allow_nil => true
  VALID_EDITION_REGEX = /\A\d*\z/i
  validates :edition, presence: true, length: { maximum: 80 }, format: { with: VALID_EDITION_REGEX }
  validates :author, presence: true, length: { maximum: 80 }
  validates :condition, presence: true
  VALID_PRICE_REGEX = /\A[1-9]{0,8}(\.\d\d)?\z/i
  validates :price, presence: true, length: { maximum: 10 }, format: { with: VALID_PRICE_REGEX }
  VALID_COURSE_REGEX = /\A[a-zA-Z]{3,6} \d{4}\z/i
  validates :course, format: { with: VALID_COURSE_REGEX }
  validates :professor, length: { maximum: 50 }
end
