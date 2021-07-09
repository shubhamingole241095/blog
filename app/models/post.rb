class Post < ApplicationRecord

    STATUS_DRAFT = "Draft"
    STATUS_PUBLISHED = "Published"
    STATUS_ARCHIVED = "Archived"
    # => Associations
    belongs_to :user, optional:true
    has_many :post_tags
    has_many :tags, through: :post_tags
  
    validates :title, :body, :snippet, :status, presence: true  
    scope :published, -> { where(status: [STATUS_PUBLISHED]) }
    scope :archived, -> { where(status: [STATUS_ARCHIVED]) }
    before_save :set_published_date
  
    private
  
    def set_published_date
      if STATUS_PUBLISHED.eql?(status)
        self.published_date = Time.now
      end
    end
  end
