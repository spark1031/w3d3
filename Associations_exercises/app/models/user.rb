# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_many :enrollments,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'Enrollment'

  #has_many(:enrollments, {primary_key: :id, :foreign_key => :user_id, class_name: 'Enrollment'})


  #enrolled courses returns a list of courses self is enrolled in
  has_many :enrolled_courses,
    through: :enrollments,
    source: :course #:user -> return self n number of times where n is the number of courses i've enrolled in

  has_many :instructors,
    through: :enrolled_courses,
    source: :instructor

  has_many :peers,
    through: :enrolled_courses,
    source: :enrolled_students

end
