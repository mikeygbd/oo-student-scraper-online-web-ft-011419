require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './student.rb'

class Scraper

  def self.scrape_index_page(html)
    html = File.read('file:///Users/michaelsoares/.atom/.learn-ide/home/jocular-prompt-6869/oo-student-scraper-online-web-ft-011419/fixtures/student-site/index.html')
    page = Nokogiri::HTML(open(html))
    student = Student.new
    all_students =[]

    student_profile = {}

    page.css("roster-cards-container").each do |student|
      student_name = student.css("student-name").text
      all_students << student_profile[student.name.to_sym] = {}
    end
  end

  def self.scrape_profile_page(profile_url)

  end

end
