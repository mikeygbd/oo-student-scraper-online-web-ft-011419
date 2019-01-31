require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(html)
    html = File.read('fixtures/student-site/index.html')
    student = Nokogiri::HTML(html)

    projects = {}

    student.css("roster-cards-container").each do |project|
      name = project.css("student-name").text
      projects[name.to_sym] = {

      }
    end
  end

  def self.scrape_profile_page(profile_url)

  end

end
