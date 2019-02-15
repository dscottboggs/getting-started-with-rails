class AttachedImage < ApplicationRecord
  mount_uploader :file, ArticleAttachmentUploader
  belongs_to :uploader, class_name: "User"
end
