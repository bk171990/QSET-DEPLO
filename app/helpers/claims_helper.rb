module ClaimsHelper
  def courses
    @courses.collect { |b| [b.full_name, b.id] }
  end
end
