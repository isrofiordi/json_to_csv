# Convert JSON to CSV
# Written in 10 Dec 2022

require 'json'
require 'csv'

# list all JSON file
list_file = Dir["*.json"]

unless list_file.empty?
    file_name = list_file.first

    input= File.open(file_name)

    CSV.open(file_name.gsub(".json",".csv"), "w") do |csv| # open new file for write
        csv << JSON.parse(input.first).keys # headers

        input.each do |line|
            csv << JSON.parse(line).values
        end
    end
else
    raise "NO JSON FILE FOUND in your current directory"
end
