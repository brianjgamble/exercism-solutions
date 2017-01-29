class School
  def initialize
    @students = Hash.new {|h, k| h[k] = []}
  end
  
  def add(student, grade)
    @students[grade] << student
    sort
  end
  
  def students(grade_number)
    @students[grade_number]
  end
  
  def sort
    Hash[@students.sort].each {|k,v| v.sort!}
  end
  
  def students_by_grade
    [].tap do |students_by_grade|
      @students.keys.sort.each do |k,v|
        students_by_grade << {:grade => k, :students => @students[k]}
      end
    end
  end
end
