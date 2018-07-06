require 'rails_helper'

RSpec.describe NavigationHelper, type: :helper do
  context 'signed in user' do
    before(:each) { allow(helper).to receive_messages(user_signed_in?: true) }
    context '#collapsible_links_partial_path' do
      it "returns signed_in_links partial's path" do
        expect(helper.collapsible_links_partial_path).to (
          eq 'layouts/navigation/signed_in_links'
        )
      end
    end
  end

  context 'non-signed in user' do
    before(:each) { allow(helper).to receive_messages(user_signed_in?: false) }

    context '#collapsible_links_partial_path' do
      it "returns non_signed_in_links partial's path" do
        expect(helper.collapsible_links_partial_path).to (
          eq 'layouts/navigation/non_signed_in_links'
        )
      end
    end
  end
end
