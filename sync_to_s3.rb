
branch = ENV['BRANCH']
abort 'BRANCH not set' if branch.nil? || branch.empty?

def run(command)
  puts "running #{command}"
  puts `#{command}`
end

base_command = "aws s3 sync dist_production s3://election-market-#{branch} --profile election-market --acl public-read"

run "#{base_command} --exclude '*' --include 'index.html' --cache-control max-age=120"
run "#{base_command} --exclude '*' --include '*.woff' --content-type 'application/font-woff'"
run "#{base_command} --exclude '*' --include '*.woff2' --content-type 'application/font-woff2'"
run "#{base_command} --delete --cache-control max-age=120"
