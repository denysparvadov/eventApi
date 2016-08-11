json.event do
  json.id @event.id
  json.title @event.title
  json.tickets_amount @event.tickets_amount
  json.date_start @event.date_start
  json.date_end @event.date_end
end