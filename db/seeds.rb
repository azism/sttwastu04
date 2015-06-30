# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

d1 = Lecturer.create(:nid => '0412077802', :name => 'Lise Sri Andar Muni, S.Pd., M.T.', :sex => 'false')
d1 = Lecturer.create(:nid => '23077601', :name => 'Ismi Kaniawulan, S.T., M.T.', :sex => 'false')
m1 = Student.create(:nim => '141351030', :name => 'Azis Muttaqin', :sex => 'true')