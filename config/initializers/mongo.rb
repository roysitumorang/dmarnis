MongoMapper.connection = Mongo::Connection.new('localhost', 27017)
MongoMapper.database = "dmarnis-#{Rails.env}"

PhusionPassenger.on_event(:starting_worker_process) do |forked|
  MongoMapper.connection.connect if forked
end if defined?(PhusionPassenger)
