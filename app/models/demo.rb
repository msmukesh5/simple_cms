class Demo
	# require 'vpim/icalendar'
	# def self.param(i,j=nil,k=nil)
	# 	puts "i = #{i}"
	# 	if j == nil
	# 		puts "j = 0"
	# 	else
	# 		puts "j = #{j}"
	# 	end
	# 	puts "k = #{k}"
	# end

	# def self.carepods(tid,fut = nil,fct =nil)
	# 	if fct == nil
 # 			carepods = get_todo_assigned_carepods(todo,["ASSIGNED", "RESPOND"],nil, todo.created_by)
 # 			puts carepods.inspect
 # 		else
 # 			carepods = Carepod.find(fct)
 # 			puts carepods.inspect 
 # 		end
 # 	end

 	def self.create_account(name)

 	end

 	def self.create_events(n)

 		client = TwistedCaldav::Client.new(:uri=>"http://localhost:5232/calendars/sikhar", :user=>"sikhar", :password=>"password")
 		require 'thread'
		work_q = Queue.new
		n_events = n
		while n_events > 0 do
			e_name = "new #{n_events}"
			work_q.push e_name
			n_events -= 1
			puts "pushing #{e_name} "
		end
		workers = (0...4).map do
		  	Thread.new do
			    begin
			      	while x = work_q.pop(true)
			      		event = client.create_event(:start => "2016-04-13 10:24:00", :end => "2016-04-13 11:24:00", :title => "#{x}")
			      		puts "creating #{x}"
			      	end
			    rescue ThreadError
			    end
		  	end
		end; "ok"
		workers.map(&:join); "ok"
 	end

 	def self.fetch_events()

 		client = TwistedCaldav::Client.new(:uri=>"http://localhost:5232/calendars/sikhar/", :user=>"sikhar", :password=>"password")
 		events = client.find_events(:start => "2016-04-12 10:24:00", :end => "2016-04-27 10:24:00")
 		# events = client.find_events(:uuid=>"cae3f200-ee74-0133-3dd2-406c8f16273c")
 		events
 	end

 	def self.fetch_bwevents()

 		client = TwistedCaldav::Client.new(:uri=>"http://localhost:8080/ucaldav/user/vbede/", :user=>"vbede", :password=>"bedework")
 		events = client.find_events(:start => "2016-04-12 10:24:00", :end => "2016-05-04 10:24:00")
 		# events = client.find_events(:uuid=>"cae3f200-ee74-0133-3dd2-406c8f16273c")
 		events
 	end

 	def self.demo_parser()
 		require 'icalendar'

		# cal = Icalendar::Calendar.new
		cal_file = File.open("/Users/Mukesh/.config/radicale/collections/calendars/sikhar")
		cals = Icalendar.parse(cal_file)

		cals
 	end

end