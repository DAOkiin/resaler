require 'open-uri'

module Scraper
  class Base
    attr_reader :url

    def self.call(params = {})
      new(params).call
    end

    def initialize(params)
      raise NotImplementedError if self.class == Base
      @url = construct_query(params[:query])
      @search_id = params[:search_id]
    end

    def call
      page = scrap_page
      parse_data_from_page(page)
    end

    private

    def scrap_page
      Nokogiri::HTML(open(@url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
    end
  end
end
