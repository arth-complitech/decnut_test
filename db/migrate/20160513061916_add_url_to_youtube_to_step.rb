class AddUrlToYoutubeToStep < ActiveRecord::Migration
  def change
    add_column :steps, :url_to_youtube, :string
  end
end
