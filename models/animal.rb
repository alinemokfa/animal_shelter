require_relative('../db/sql_runner.rb')

class Animal
  attr_reader(:id)
  attr_accessor(:name, :type, :breed, :admission_date, :adoption_status, :image_url, :adopted)

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

  def save()
    sql = "INSERT INTO animals
    (
      name,
      type,
      breed,
      adoption_status,
      image_url,
      adopted
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @type, @breed, @adoption_status, @image_url, @adopted]
    results = SqlRunner.run( sql, values )
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM animals"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map { |animal| Animal.new( animal ) }
  end

end
