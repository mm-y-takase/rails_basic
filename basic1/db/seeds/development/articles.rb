body = 
  "testtesttest\n"+
  "hogehogehgohoge\n"+
  "fufuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu"

0.upto(9) do |index|
  Article.create(
    title: "result num :#{index}"+ (index % 3 == 0 ? " member only" : ''),
    body: body,
    released_at: 8.days.ago.advance(dyas: index),
    expired_at: 2.days.ago.advance(days: index),
    member_only: (index % 3 == 0 )
  )
end