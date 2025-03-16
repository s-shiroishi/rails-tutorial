require 'rails_helper'

RSpec.describe "static_pages/help.html.erb", type: :view do
    it '適切なタイトルが含まれている' do
        render template: 'static_pages/help', layout: "layouts/application"
        expect(rendered).to have_title('Help | Ruby on Rails Tutorial Sample App')
    end
end