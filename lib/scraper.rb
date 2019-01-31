require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './student.rb'

class Scraper

attr_accessor :all_students

  def self.scrape_index_page(index_url)
    html = open('index_url')
    doc = Nokogiri::HTML(open(html))
    student_cards = doc.css(".student_card")
    all_students =[]
    student_cards.collect do |student_card|
      all_students << {
        :name => student_card.css("h4.student-name").text,
        :location => student_card.css("p.student-location").text,
        :profile_url => "./fixtures/student-site/" + student_card.css("a").attribute("href").value
        }

    end
    all_students
  end

  def self.scrape_profile_page(profile_url)

  end

end
