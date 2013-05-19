#!/usr/bin/env   ruby
# Author - Raja. S rajasoun@cisco.com
# To Bootstrap Sanity Tests Automation
# To Do: Have GemFile for beginerrs to get started

require "rubygems"
require "watir-webdriver"
require "logger"
require "test/unit"

class TestCECAuthenticationForRa < Test::Unit::TestCase
  
  def setup
    @browser=Watir::Browser.new :chrome
    @base_url="learninghub.cisco.com"
    @cec_id=""
    @cec_password=""
    @user_welcome_message="Welcome, Raja Soundaramourty"
    
    @log = Logger.new('clh-sanity-test.log')
    #@log = Logger.new(STDOUT)
    @log.level = Logger::INFO
    @log.datetime_format = "%d-%m-%Y %H:%M"
    
    Logger::Formatter.module_eval(
      %q{ def call(severity, time, progname, msg)} +
      %q{ "#{format_datetime(time)}  :: #{msg2str(msg)}\n" end}
    )
    @verification_errors = []
  end 
  
        
  def test_login_logout
    @log.info '## Beginning of test: CLH Login-Logout'
    @log.info '  '
    @log.info 'Step 1: Go to the CLH Home site: '+ @base_url
    @browser.goto @base_url
    @log.info '  Action: Entered ' + @base_url + ' in the address bar.'
    assert_equal "Cisco Learning Hub", @browser.title

    @log.info 'Step 2: Login with CEC ID For: ' + @cec_id
    @browser.link(:id, "sign-in").click
    @browser.text_field(:id, "userInput").set(@cec_id)
    @browser.text_field(:id, "passwordInput").set(@cec_password)
    @browser.button(:value,"Log In").click
    @log.info '  Action: Authentication Informtion of ' + @cec_id + ' Submitted.'
    @browser.link(:text, "My Content").exists?
    @log.info '  Action: Authentication Informtion of ' + @cec_id + ' is Valid.'
    
    @log.info 'Step 3: Check Home Page For ' + @cec_id + 'Loads sucessfully'
    assert(@browser.text.include?(@user_welcome_message))
    @log.info '  Action: Welcome Message For ' + @cec_id + ' is Valid.'
    
    @browser.link(:text, "My Content").click
    @log.info '  Action: My Content Link For '+ @cec_id +' Clicked'
    
    @log.info 'Step 4: Logout'
    @browser.link(:text, "Logout").click
  end
  
  def teardown
    @browser.close()
    assert_equal [], @verification_errors
    
  end
   
end


