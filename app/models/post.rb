require 'securerandom'

class Post
  include ActiveModel::Model
  include ActiveModel::Serialization
  include Rails.application.routes.url_helpers

  attr_accessor :message, :url, :id
  validates_presence_of :message

  def save
    $spanner_client.transaction do |transaction|
      transaction.execute_update(
        "INSERT INTO posts (id, message, url) VALUES
        ('#{SecureRandom.uuid}', '#{message}', '#{url}')
        ;"
      )
    end
  end

  def persisted?
    self.id.present?
  end

  def self.find(id)
    Post.new(
      $spanner_client.execute("SELECT * FROM posts where id = '#{id}' LIMIT 1;").rows.first.to_h
    )
  end

  def destroy
    $spanner_client.execute("delete from posts where id ='#{self.id}'")
  end

  def self.all
    posts = Array.new
    $spanner_client.execute(
      "SELECT id, message, url FROM posts limit 500;").rows.each do |row|
        posts << Post.new(row.to_h)
      end
    return posts
  end

end
