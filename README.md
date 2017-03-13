# README

This Rails app demonstrates that a content security policy can prevent inline JS in an SVG file from executing.

Setup: clone this app and run `bundle install` in the directory.

To see it work:

- Look at the bottom of `app/assets/images/apple_logo.svg` to see the "malicious" JS that the CSP disables
- boot the app with `rails s`, visit `"localhost:3000/"`, and look in the developer console. You will see "Refused to execute inline script..."
- In `SvgController`, comment out `before_action :set_content_security_policy` and reload the page. The JS code runs and redirects you.

To see it via tests:

- Run `bundle exec rspec spec/features/svg_feature.rb`. It passes.
- In `SvgController`, comment out `before_action :set_content_security_policy` and re-run the test. It fails.
