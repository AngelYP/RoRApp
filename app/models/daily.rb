class Daily < ApplicationRecord

    validates :positives, presence:true
    validates :deaths, presence:true
    validates :suspects, presence:true
    validates :negatives, presence:true

end
