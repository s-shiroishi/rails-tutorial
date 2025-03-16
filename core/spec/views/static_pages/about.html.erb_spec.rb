require 'rails_helper'

RSpec.describe "static_pages/about.html.erb", type: :view do
    it '適切なタイトルが含まれている' do
        render template: "static_pages/about", layout: "layouts/application"
        expect(rendered).to have_title('About | Ruby on Rails Tutorial Sample App')
    end
end