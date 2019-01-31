require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './student.rb'

class Scraper

attr_accessor :all_students

  def self.scrape_index_page(html)
      # binding.pry

    html = File.read('fixtures/student-site/index.html')
    page = Nokogiri::HTML(open(html))

    student = Student.new

    @all_students =[]

    student_profile = {}

    page.css("roster-cards-container student-name").each do |student|

      student_name = student.css("h4.student-name").text
      all_students << student_profile[student.name.to_sym] = {}

    end
    @all_students
  end

  def self.scrape_profile_page(profile_url)

  end

end
