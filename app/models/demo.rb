include TodosHelper
class Demo

	def self.param(i,j=nil,k=nil)
		puts "i = #{i}"
		if j == nil
			puts "j = 0"
		else
			puts "j = #{j}"
		end
		puts "k = #{k}"
	end

	def self.carepods(tid,fut = nil,fct =nil)
		if fct == nil
 			carepods = get_todo_assigned_carepods(todo,["ASSIGNED", "RESPOND"],nil, todo.created_by)
 			puts carepods.inspect
 		else
 			carepods = Carepod.find(fct)
 			puts carepods.inspect 
 		end
 	end
end