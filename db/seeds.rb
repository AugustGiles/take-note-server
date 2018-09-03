# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username:"teacher1", password:'test')
User.create(username:"student1", teacher_id:1, password:'test')
User.create(username:"student2", teacher_id:1, password:'test')

Assignment.create(
  teacher_id:1,
  student_id: 2,
  assignment_text: {
    "blocks"=>
    [{"key"=>"dpkr", "text"=>"Write The First Assignment!", "type"=>"header-three", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}
    }], "entityMap"=>{}},
  practice_goal: 7200
)

Assignment.create(
  teacher_id:1,
  student_id: 3,
  assignment_text: {
    "blocks"=>
    [{"key"=>"dpkr", "text"=>"Write The First Assignment!", "type"=>"header-three", "depth"=>0, "inlineStyleRanges"=>[], "entityRanges"=>[], "data"=>{}
    }], "entityMap"=>{}},
  practice_goal: 7200
)
