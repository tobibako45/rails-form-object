class OrdersController < ApplicationController

  def report
    send_data OrderReport.new(@order).build, filename: 'order/report/pdf', type: 'application/pdf'
  end

end
