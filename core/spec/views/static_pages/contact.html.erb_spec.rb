require 'rails_helper'

RSpec.describe "static_pages/contact.html.erb", type: :view do
    it '適切なタイトルが含まれている' do
        render template: "static_pages/contact", layout: "layouts/application"
        expect(rendered).to have_title('Contact | Ruby on Rails Tutorial Sample App')
    end
end