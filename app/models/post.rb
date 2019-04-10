require 'securerandom'

class Post
  # enable image uploads
  include ImageUploader[:image]

  # Treat this like an ActiveRecord mdoel
  include ActiveModel::Model
  include ActiveModel::Serialization
  include ActiveModel::AttributeMethods
  include ActiveModel::Conversion
  include ActiveModel::Dirty
  include ActiveModel::Naming
  extend ActiveModel::Callbacks

  include Rails.application.routes.url_helpers
  define_model_callbacks :initialize, :create, :save, :destroy, :update

  attr_accessor :message, :url, :id, :created_at, :updated_at, :image_data
  validates_presence_of :message

  def save
    $spanner_client.transaction do |transaction|
      transaction.execute_update(
        " INSERT INTO posts (id, message, url,image_data)
          VALUES (
            '#{SecureRandom.uuid}',
            '#{message}',
            '#{url}',
            '#{image_data}'
          );")
    end
  end

  def persisted?
    self.id.present?
  end

  def image_data?
    return defined?(self.image_data)
  end

  def self.find(id)
    Post.new(
      $spanner_client.execute(
        " SELECT *
          FROM posts
          WHERE id = '#{id}' LIMIT 1;
        ").rows.first.to_h
      )
  end

  def destroy
    $spanner_client.transaction do |transaction|
      transaction.execute_update("delete from posts where id ='#{self.id}';")
    end
  end

  def self.all
    posts = Array.new
    $spanner_client.execute(
      "SELECT id, message, url FROM posts limit 500;"
    ).rows.each do |row|
      posts << Post.new(row.to_h)
    end
    return posts
  end
end
