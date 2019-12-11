class DoctorsController < ApplicationController
	def mostrar
		@user = current_doctor
		@reservations = Reservation.where("doctor_id = #{@user.id}")
		query1 = "SELECT R.date as fecha, B.date as hora, D.first_name as first_name, D.last_name as last_name, R.id as id FROM Reservations R, Blocks B, Clients D WHERE R.block_id = B.id and R.doctor_id = #{@user.id} and D.id = R.client_id"
		@relation = ActiveRecord::Base.connection.exec_query(query1)
		@relation = @relation.sort_by { |a| [ a['fecha'].to_date, a['hora'].to_time] }
		@events = @relation
		@events.each do |event|
			event.define_singleton_method(:start_time) do
				event['fecha'].to_date
			end
		end
	end

	def history
		@user = current_doctor
		@reservations = Reservation.where("doctor_id = #{@user.id}")
		query1 = "SELECT R.date as fecha, B.date as hora, D.first_name as first_name, D.last_name as last_name, R.id as id FROM Reservations R, Blocks B, Clients D WHERE R.block_id = B.id and R.doctor_id = #{@user.id} and D.id = R.client_id"
		@relation = ActiveRecord::Base.connection.exec_query(query1)
		@relation = @relation.sort_by { |a| [ a['fecha'].to_date, a['hora'].to_time] }
	end
end