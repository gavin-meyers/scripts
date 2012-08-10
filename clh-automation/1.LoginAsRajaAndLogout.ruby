#!/usr/bin/env   ruby

require "rubygems"
require "watir-webdriver"
require "test/unit"

browser = Watir::Browser.new :chrome

browser.goto "learninghub.cisco.com"
browser.link(:id, "sign-in").click
browser.text_field(:id, "userInput").set("rajasoun")
browser.text_field(:id, "passwordInput").set("Raja$1050")
browser.button(:value,"Log In").click
browser.link(:text, "My Content").exists?
browser.link(:text, "My Content").click
browser.link(:text, "Logout").click
browser.close
