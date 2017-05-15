names = %w(rockenbelg sigreni kragas arome ironic battloika forlimer ezocco atarimaid ikas)
fullNameTemps = ['頭ギア','服ギア','靴ギア','ぎあ']
firstNameTemps = ['ロッケンベルグ','シグレニ','クラーゲス']
# _image = File.new(path)
# file = ActionDispatch::Http::UploadedFile.new(:filename => "icon.png", :tempfile => _image, :type => "image/png")
puts(file.inspect)

0.upto(9) do |index|
  member = Member.create(
    number: index+10,
    name: names[index],
    full_name: "#{fullNameTemps[index % 4]} #{firstNameTemps[index % 3]}",
    email: "#{names[index]}@example.com",
    birthday: "1981-12-01",
    gender: index % 2,
    administrator: (index == 0),
    password: "hoge",
    password_confirmation: "hoge"
  )

  path = Rails.root.join("db/seeds/development", "member#{index % 3 + 1}.jpg")
  puts(path)
  file = Rack::Test::UploadedFile.new(path, "image/jpeg", true)

  MemberImage.create(
    member: member,
    uploaded_image: file
  )
  puts member
  puts "member obj index ... "+ index.to_s + " objid:" +member.to_s + Member.count.to_s + "/n"
end


10.upto(29) do  |index|
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
