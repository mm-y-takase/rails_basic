names = %w(rockenbelg sigreni kragas arome ironic battloika forlimer ezocco atarimaid i-kas)
fullNameTemps = ['頭ギア','服ギア','靴ギア']
firstNameTemps = ['ロッケンベルグ','シグレニ','クラーゲス']
0.upto(9) do |index|
	member = Member.create(
		number: index+10,
		name: names[index],
		full_name: "#{fullNameTemps[index % 3]} #{firstNameTemps[index % 3]}",
		email: "#{names[index]}@example.com",
		birthday: "1981-12-01",
		gender: index % 2,
		administrator: (index == 0),
		password: "hoge",
		password_confirmation: "hoge"
	)
	puts member
	puts "member obj index ... "+ index.to_s + " objid:" +member.to_s + Member.count.to_s + "/n"
end

0.upto(29) do  |index|
  member = Member.create(
    number: index+20,
    name: "fjffj#{names[index]}",
    full_name: "#{fullNameTemps[index % 3]} #{firstNameTemps[index % 3]}",
    email: "fjfjfj#{names[index]}@example.com",
    birthday: "1981-12-01",
    gender: index % 2,
    administrator: (index == 0),
    password: "hoge",
    password_confirmation: "hoge"
  )
  puts member
  puts "member obj index ... "+ index.to_s + " objid:" +member.to_s + Member.count.to_s + "/n"
end
