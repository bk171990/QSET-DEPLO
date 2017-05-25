module AssignmentsHelper
	 def collect_batch
         @batches.collect {|b| [b.course.course_name+" "+b.course.section_name+" - "+b.name,b.id]}
       end
end
