class Post < ApplicationRecord
    validates :content, {presence:true}
    validates :user_id, {presence:true}
    has_many :post_records, inverse_of: :post
    accepts_nested_attributes_for :post_records
    def user
        return User.find_by(id: self.user_id)
    end
end
