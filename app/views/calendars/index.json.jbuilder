json.array!(@tasks) do |task|
  json.extract! task, :id
  json.title task.task_title
  json.start task.start_date
  json.end task.end_date

  json.matrix task.task_matrix

  if task.task_matrix == '重要かつ緊急'
    json.color '#F59E9B'
  elsif task.task_matrix == '重要で緊急でない'
    json.color '#F6D2D1'
  elsif task.task_matrix == '重要でなく緊急'
    json.color '#F4E195'
  else
    json.color '#90B8E4'
  end
end
