require 'rails_helper'

RSpec.describe Scraper::Base do
  context 'On initialize' do
    it 'should raise an NotImplementedError' do
      expect { described_class.call(query: 'Some query') }
        .to raise_error(NotImplementedError)
    end
  end
end
