require 'rails_helper'

RSpec.describe "static_pages/home.html.erb", type: :view do
    it '適切なタイトルが含まれている' do
        render template: 'static_pages/home', layout: "layouts/application"
        expect(rendered).to have_title('Ruby on Rails Tutorial Sample App')
    end
end