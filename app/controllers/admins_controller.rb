class AdminsController < ApplicationController
    def add_doc
        @user = Doctor.new(doctor_params)
        @user.save
        redirect_to root_path
    end
    def new_doctor
    end
    private

    def doctor_params
        params.require(:doctor).permit(:email, :password, :password_confirmation, :cel_number, :first_name, :last_name)
    end
end