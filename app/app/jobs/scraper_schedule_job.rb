class ScraperScheduleJob < ApplicationJob
  queue_as :schedule

  def perform
    Search.all.find_each { |search| ScrapeByQueryJob.perform_later search.id }
  end
end
