#encoding: utf-8

require 'rest-client'
require 'json'
require "rspec"
include RSpec::Matchers

def new_patient(family_name, given_name)
  patient = { resourceType: "Patient", name: [ {family: family_name, given: [given_name]} ] }
end

#
# When
#

When(/^I create a patient with family name "([^"]*)" and given name "([^"]*)"$/) do |family_name, given_name|
  payload = new_patient(family_name, given_name).to_json
  @response = RestClient.post 'http://localhost:4567/fhir/patient', payload, :content_type => :json, :accept => :json
end

When(/^I search a patient with family name "([^"]*)" and given name "([^"]*)"$/) do |family_name, given_name|
  @response = RestClient.get "http://localhost:4567/fhir/patient?family=#{family_name}&given=#{given_name}", :content_type => :json, :accept => :json
end

When(/^I read a patient with id (\d+)$/) do |id|
  @response = RestClient.get "http://localhost:4567/fhir/patient/#{id}", :content_type => :json, :accept => :json
end

When(/^I update a patient with id (\d+) and family name "([^"]*)", given name "([^"]*)"$/) do |id, family_name, given_name|
  payload = new_patient(family_name, given_name).to_json
  @response = RestClient.put "http://localhost:4567/fhir/patient/#{id}", payload, :content_type => :json, :accept => :json
end

When(/^I patch a patient with id (\d+) and family name "([^"]*)", given name "([^"]*)"$/) do |id, family_name, given_name|
  payload = new_patient(family_name, given_name).to_json
  @response = RestClient.patch "http://localhost:4567/fhir/patient/#{id}", payload, :content_type => :json, :accept => :json
end

When(/^I delete a patient with id (\d+)$/) do |id|
  @response = RestClient.delete "http://localhost:4567/fhir/patient/#{id}", :content_type => :json, :accept => :json
end

#
# Then
#

Then(/^the server has response content "([^"]*)" and code (\d+)$/) do |content, code|
  expect(@response.code).to eq(code.to_i)
  message = JSON.parse(@response.body)['message']
  expect(message).to eq(content)
end