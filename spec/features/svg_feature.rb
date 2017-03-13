require "rails_helper"
describe "viewing an svg", :type => :feature do

  it "shows the svg without executing the js", js: true do
    visit '/'
    expect(page.current_url).not_to match("pwned")
  end
end
