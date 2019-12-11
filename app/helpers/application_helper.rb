module ApplicationHelper
    MESES = {'January' => 'Enero', 'February' => 'Febrero', 'March' => 'Marzo', 
        'April' => 'Abril', 'May' => 'Mayo', 'June' => 'Junio', 'July' => 'Julio', 
        'August' => 'Agosto', 'September' => 'Septiembre', 'October' => 'Octubre',
        'November' => 'Noviembre', 'December' => 'Diciembre'}
    def get_month_spanish month
        MESES[month]
    end
end
