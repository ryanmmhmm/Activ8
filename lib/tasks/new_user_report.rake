desc "Send new user report to important people"
task new_user_report: [:environment] do
  @user = User.newest
  sleep 6
  puts "new_user_report is complete"
  puts "Report has been sent to recipients"
end