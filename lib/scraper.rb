require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './student.rb'

class Scraper

attr_accessor :all_students

  def self.scrape_index_page(html)
    html = File.read('fixtures/student-site/index.html')
    page = Nokogiri::HTML(open(html))
    student = Student.new
    @all_students =[]

    student_profile = {}
binding.pry
    page.css("roster-cards-container").each do |student|
      student_name = student.css("student-name").text
      all_students << student_profile[student.name.to_sym] = {}

    end
    @all_students
  end

  def self.scrape_profile_page(profile_url)

  end

end
