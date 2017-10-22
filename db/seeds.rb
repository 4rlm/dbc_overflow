puts "Seeding the database ..."


def seed_question_table
  puts "Seeding the question table..."
  total_seeds_required = 50
  current_seeds_in_db = Question.count
  seeds_to_create = total_seeds_required - current_seeds_in_db

  # ["title", "body", "user_id:integer", "view_count:integer"]
  seeds_to_create.times do
    # question_hash = {
    #   name: Faker::Lorem.word,
    #   description: Faker::Lorem.sentence,
    #   status: Faker::Lorem.word,
    #   rating: 5
    # }
    new_question_record = Question.new(question_hash)
    new_question_record.save!
  end

end
seed_question_table


def seed_answer_table
  puts "Seeding the answer table..."
  total_seeds_required = 50
  current_seeds_in_db = Answer.count
  seeds_to_create = total_seeds_required - current_seeds_in_db

  # ["body", "user_id:integer", "question_id:integer"]
  seeds_to_create.times do
    # answer_hash = {
    #   name: Faker::Lorem.word,
    #   description: Faker::Lorem.sentence,
    #   status: Faker::Lorem.word,
    #   rating: 5
    # }
    new_answer_record = Answer.new(answer_hash)
    new_answer_record.save!
  end

end
seed_answer_table


def seed_comment_table
  puts "Seeding the comment table..."
  total_seeds_required = 50
  current_seeds_in_db = Comment.count
  seeds_to_create = total_seeds_required - current_seeds_in_db

  # ["body", "user_id:integer"]
  seeds_to_create.times do
    # comment_hash = {
    #   name: Faker::Lorem.word,
    #   description: Faker::Lorem.sentence,
    #   status: Faker::Lorem.word,
    #   rating: 5
    # }
    new_comment_record = Comment.new(comment_hash)
    new_comment_record.save!
  end

end
seed_comment_table


def seed_vote_table
  puts "Seeding the vote table..."
  total_seeds_required = 50
  current_seeds_in_db = Vote.count
  seeds_to_create = total_seeds_required - current_seeds_in_db

  # ["user_id:integer"]
  seeds_to_create.times do
    # vote_hash = {
    #   name: Faker::Lorem.word,
    #   description: Faker::Lorem.sentence,
    #   status: Faker::Lorem.word,
    #   rating: 5
    # }
    new_vote_record = Vote.new(vote_hash)
    new_vote_record.save!
  end

end
seed_vote_table


