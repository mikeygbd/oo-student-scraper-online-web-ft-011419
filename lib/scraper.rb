require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './student.rb'

class Scraper

attr_accessor :all_students

  def self.scrape_index_page(index_url)
      binding.pry
    index_url = open('fixtures/student-site/index.html')
    doc = Nokogiri::HTML(open(index_url))
    # student = Student.new
    student_cards = doc.css("roster-cards-container student-name")
    all_students =[]
    student_profile = {}

    student_cards.each do |student_card|
      student_name = student_card.css("h4.student-name").text
      location = student_card.css("p.student-location").text
      profile_url = "./fixtures/student-site/" + student_card.css("a").attribute("href").value
      all_students << {
        :name => student_name,
        :location => location
        :profile_url => profile_url
      }

      student_name = student.css("h4.student-name").text
      # binding.pry
      location = student.css("p.student-location").text
      all_students << student_profile[student.name.to_sym] = location

    end
    @all_students
  end

  def self.scrape_profile_page(profile_url)

  end

end
