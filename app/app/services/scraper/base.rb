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
    end

    def call
      page = get_page(@url)
      parse_data_from_page(page)
    end

    private

    def get_page(url)
      Nokogiri::HTML(open(url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
    end
  end
end
