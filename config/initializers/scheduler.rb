require 'rufus-scheduler'

scheduler = Rufus::Scheduler.singleton


#### Las horas del cron estan en UTC, que es 4 horas mas que la nuestra
scheduler.cron '0 1 * * *' do
  #### Revisar quienes tienen hora ese dia en la tarde, y mandarles mensaje
  SendDailyMessages.for()
end
