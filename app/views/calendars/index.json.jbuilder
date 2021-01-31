json.array!(@tasks) do |task|
  json.extract! task, :id
  json.title task.task_title
  json.start task.start_date
  json.end task.end_date

end