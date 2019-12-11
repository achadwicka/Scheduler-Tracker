class ClientsController < ApplicationController
	def mostrar
		@user = current_client
		@reservations = Reservation.where("client_id = #{@user.id}")
		query1 = "SELECT R.date as fecha, B.date as hora, D.first_name as doc, R.id as id FROM Reservations R, Blocks B, Doctors D WHERE R.block_id = B.id and R.client_id = #{@user.id} and D.id = R.doctor_id"
		@relation = ActiveRecord::Base.connection.exec_query(query1)
		@relation = @relation.sort_by { |a| [ a['fecha'].to_date, a['hora'].to_time] }
		@events = @relation
		puts (@events)
		@events.each do |event|
			event.define_singleton_method(:start_time) do
				event['fecha'].to_date
			end
		end
	end

	def history
		@user = current_client
		@reservations = Reservation.where("client_id = #{@user.id}")
		query1 = "SELECT R.date as fecha, B.date as hora, D.first_name as doc, R.id as id FROM Reservations R, Blocks B, Doctors D WHERE R.block_id = B.id and R.client_id = #{@user.id} and D.id = R.doctor_id"
		@relation = ActiveRecord::Base.connection.exec_query(query1)
		@relation = @relation.sort_by { |a| [ a['fecha'].to_date, a['hora'].to_time] }
		@events = @relation
		puts (@events)
		@events.each do |event|
			event.define_singleton_method(:start_time) do
				event['fecha'].to_date
			end
		end
	end
end