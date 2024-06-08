require 'aws-sdk-s3'
require 'pry'
require 'securerandom'

bucket_name = ENV['BUCKET_NAME']
puts "Bucket name: #{bucket_name}"

region = "eu-west-1"
puts "Region: #{region}"

client = Aws::S3::Client.new

# https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/S3/Client.html#create_bucket-instance_method
resp = client.create_bucket({
  bucket: bucket_name, 
  create_bucket_configuration: {
    location_constraint: region, 
  }, 
})

num_files = 1 + rand(6)
puts "number of files: #{num_files}"

num_files.times.each do |i|
  puts "i: #{i}"
  filename = "file_#{i}.txt"
  output_path = "/tmp/#{filename}"

  File.open(output_path, "w") do |f|
    f.write(SecureRandom.uuid)
  end

  File.open(output_path, 'rb') do |f|
    client.put_object(
      bucket: bucket_name, 
      key: filename, 
      body: f, 
    )
  end
end