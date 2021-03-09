class AddAttachmentToMovies < ActiveRecord::Migration[5.2]
  def change
    add_attachment :movies, :image
  end
end
