require 'open-uri'

class YearbookController < ApplicationController

	def index
	end

	def am
			json_response = open("http://codemountain.com/api/students/am.json").read
			@am_students = JSON.parse(json_response).delete_if { |h| h['student']['name'].nil? }.sort_by!{ |h| h['student']['name'].downcase }
	end


	def pm
		json_response = open("http://codemountain.com/api/students/pm.json").read
			@pm_students = JSON.parse(json_response).delete_if { |h| h['student']['name'].nil? }.sort_by!{ |h| h['student']['name'].downcase }
		
	end

	def rfd
		json_response = open("http://codemountain.com/api/students/rfd.json").read
			@rfd_students = JSON.parse(json_response).delete_if { |h| h['student']['name'].nil? }.sort_by!{ |h| h['student']['name'].downcase }
	end

	def all
			json_response_AM = open("http://codemountain.com/api/students/am.json").read
			json_response_PM = open("http://codemountain.com/api/students/pm.json").read
			json_response_RFD = open("http://codemountain.com/api/students/rfd.json").read
			parse_students = JSON.parse(json_response_AM) + JSON.parse(json_response_PM) + JSON.parse(json_response_RFD)

			@all_students = parse_students.delete_if { |h| h['student']['name'].nil? }.sort_by!{ |h| h['student']['name'].downcase }
	end

end