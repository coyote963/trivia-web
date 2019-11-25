json.extract! question, :id, :problem, :category, :correct_answer, :incorrect_answer_one, :incorrect_answer_two, :incorrect_answer_three, :room_id, :created_at, :updated_at
json.url question_url(question, format: :json)
