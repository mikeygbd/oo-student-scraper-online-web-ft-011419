require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './student.rb'

class Scraper

attr_accessor :students

 def self.scrape_index_page(index_url)
   doc = Nokogiri::HTML(open(index_url))
   students = []
   doc.css(".student-card").each do |student|
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
    doc = Nokogiri::HTML(open(profile_url))
    students = {}

    doc.css("").each do |student|
      name = student.css(".student-name").text

      container = doc.css(".social-icon-container a").collect{|icon| icon.attribute("href").value}
    container.each do |link|
      if link.include?("twitter")
        student[:twitter] = link
      elsif link.include?("linkedin")
        student[:linkedin] = link
      elsif link.include?("github")
        student[:github] = link
      elsif link.include?(".com")
        student[:blog] = link
      end
    end
    student[:profile_quote] = page.css(".profile-quote").text
    student[:bio] = page.css("div.description-holder p").text
    student
    end
  end

end
