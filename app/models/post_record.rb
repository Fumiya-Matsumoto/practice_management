class PostRecord < ApplicationRecord
    belongs_to :post, inverse_of: :post_records
end
