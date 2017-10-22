require_relative('../db/sql_runner.rb')

class Animal

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @breed = options ['breed']
    @admission_date = options['admission_date']
    @adoption_status = options['adoption_status']
    @image_url = options['image_url']
    @adopted = options['adopted']
  end

end
