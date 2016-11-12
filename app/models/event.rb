class Event < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :tickets, dependent: :destroy
  # has_one :category
  # for length specification use this syntax
  validates :title, :text, presence: true, length: { minimum: 5, maximum: 2000}

  def self.search(search)
    where("title LIKE ? OR category LIKE ? OR text LIKE ? ", "%#{search}%", "%#{search}%", "%#{search}%")
  end

  ratyrate_rateable 'visual_effects', 'original_score', 'director', 'custome_design'


  # Relict from search by date
  # attr_reader :date_from, :date_to
  #
  # def initialize(params)
  #   params ||= {}
  #   @date_from = parsed_date(params[:date_from], 7.days.ago.to_date.to_s)
  #   @date_to = parsed_date(params[:date_to], Date.today.to_s)
  # end
  #
  # def scope
  #   Event.where('start_date BETWEEN ? AND ?', @date_from, @date_to)
  # end
  #
  # private
  #
  # def parsed_date(date_string, default)
  #   Date.parse(date_string)
  # rescue ArgumentError, TypeError
  #   default
  # end

end