require 'rails_helper'

RSpec.feature "Listing Articles" do

  before do
    john = User.create!(email: "john@example.com", password: "password")
    login_as(john)
    @article1 = Article.create(title: "The first article", body: "Body of the first article.", user: john)
    @article2 = Article.create(title: "The second article", body: "Body of the second article.", user: john)
  end

  scenario "List all articles" do
    visit "/"

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)

    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)

    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
  end
end