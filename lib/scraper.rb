require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(html)
    html = File.read('fixtures/student-site/index.html')
    page = Nokogiri::HTML(open(html))
    student = Student.new

    projects = {}

    page.css("roster-cards-container").each do |project|
      student.name = project.css("student-name").text
      projects[student.name.to_sym] = {

      }
    end
  end

  def self.scrape_profile_page(profile_url)

  end

end
