require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './student.rb'

class Scraper

attr_accessor :all_students

  def self.scrape_index_page(index_url)
      binding.pry
    index_url = open('fixtures/student-site/index.html')
    page = Nokogiri::HTML(open(index_url))
    # student = Student.new
    @all_students =[]
    student_profile = {}

    page.css("roster-cards-container student-name").each do |student|

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
