#!/usr/bin/ruby

require 'aws-sdk'
require 'optparse'
require 'yaml'

options = {}

# Parse option flags
opt_parser = OptionParser.new do |opts|
	# Usage description
	opts.banner = "Usage: 0-manage_ec2_instances.rb [options]"

	opts.separator ""
  opts.separator "Specific options:"

	# Action option description
	opts.on('-a', '--action [ACTION]', [:launch, :stop, :start, :terminate],
		'Select action type (launch, stop, start, terminate)') do |v|
		# Validates action requested
		if not v then
			puts "Error: Action is not valid"
		else
			options[:action] = v
		end
	end

	# Server ID option description
	opts.on('-i', '--server_id [SERVER_ID]', 'Provides the server id when required') do |v|
		options[:server_id] = v
	end

	# Verbose option description
	opts.on('-v', '--verbose', 'Provides extra information while the script is running') do |v|
		options[:verbose] = v
	end

	# Help option description
	opts.on('-h', '--help', 'Show this message') do |v|
		puts opts
		exit
	end
end
opt_parser.parse!(ARGV)

# Check if an action was provided
raise OptionParser::MissingArgument, "\nPlease provide an action (launch, stop, start, terminate)" if options[:action].nil?

config = YAML.load_file('config.yaml')
ec2 = Aws::EC2::Client.new({
		region: 'us-west-2',
		access_key_id: config['access_key_id'],
		secret_access_key: config['secret_access_key']
	})

# Launch a new server
if options[:action] == :launch then
	resp = ec2.run_instances({
			dry_run: false,
		  image_id: config["image_id"],
		  min_count: 1, # required
		  max_count: 1, # required
		  key_name: config['key_pair'],
		  security_group_ids: config["security_group_ids"],
		  instance_type: config["instance_type"],
		  placement: {
				availability_zone: config["availability-zone"]
			}
		})
	instance_id = resp.instances[0].instance_id
	resp = ec2.wait_until(:instance_running, instance_ids:[instance_id])
	puts instance_id, resp.reservations[0].instances[0].public_dns_name
else
	# Check if server_id was provided
	raise OptionParser::MissingArgument, "\nPlease provide a valid SERVER_ID" if options[:server_id].nil?

	# Stop an existing server
	if options[:action] == :stop then
		resp = ec2.stop_instances({
		  dry_run: false,
		  instance_ids: [options[:server_id]], # required
		  force: false,
		})
	# Start an existing server
	elsif options[:action] == :start then
		resp = ec2.start_instances({
		  instance_ids: [options[:server_id]], # required
		  dry_run: false,
		})
		resp = ec2.wait_until(:instance_running, instance_ids:[options[:server_id]])
		puts resp.reservations[0].instances[0].public_dns_name

	# Terminate an existing server
	elsif options[:action] == :terminate then
		resp = ec2.terminate_instances({
		  dry_run: false,
		  instance_ids: [options[:server_id]], # required
		})
	end
end
