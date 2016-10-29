loop do
  date = Time.now.strftime "%Y-%m-%d"
  time = Time.now.strftime "%H-%M-%S"
  file = "#{time}.jpg"

  puts "Taking #{file}... #{Time.now}"
  `raspistill -q 10 -t 1 -n -o #{file}`

  puts "Uploading #{file}... #{Time.now}"
  puts `aws s3 cp ./#{file} s3://programming-in-the-small-coop/#{date}/#{file}`
  puts "Done at #{Time.now}"

  puts "Removing #{file}... #{Time.now}"
  `rm #{file}`

  sleep 120
end
