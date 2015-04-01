#!/usr/bin/env ruby
require 'csv'

results = CSV.open("results2.csv", "w")
results << ['Timestamp', 'Name', 'Email', 'Phone#', 'College', 'Branch of study', 'Total Score']
answers = ["4","10","None of these","2","5","3","150","63","6","40","NW","bykR","D,HP,V","27","21","An orange","DCUKE","None of these","TUU","7","H","135","58","26","None of these","405"]
CSV.foreach("responses2.csv", :encoding => 'ISO-8859-1:UTF-8', headers: false) do |row|
  row = row.to_a
  responses = [ row[1], row[2], row[3], row[9..31] ].flatten
  metadata = [ row[0], row[4..8] ].flatten
  total = 0
  responses.each_with_index do |a, i|
    puts (i+1).to_s+")"+a.to_s+"---"+answers[i]
    if a.to_s == answers[i]
      total = total + 1
    end

  end
  puts "======================="+total.to_s
  results << metadata + [total]
end