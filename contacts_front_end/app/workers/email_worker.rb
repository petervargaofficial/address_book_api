class EmailWorker
  include Sidekiq::Worker
  
  def perform(email_params)
    response = Typhoeus.post("localhost:3000/email.json", params: email_params)
  end
end
