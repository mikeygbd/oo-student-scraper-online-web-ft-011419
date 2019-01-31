require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './student.rb'

class Scraper

attr_accessor :students

 def self.scrape_index_page(index_url)
   page = Nokogiri::HTML(open(index_url))
   students = []
   page.css(".student-card").each do |student|
     name = student.css(".student-name").text
     location = student.css(".student-location").text
     profile_url = student.css("a").attribute("href").value
     student_profile = {:name => name,
               :location => location,
               :profile_url => profile_url}
     students << student_profile
     end
   students
  end

  def self.scrape_profile_page(profile_url)

  end

end
