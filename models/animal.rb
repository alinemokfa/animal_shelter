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

  def delete()
    sql = "DELETE FROM animals WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    values = []
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE animals
      SET (
            name,
            type,
            breed,
            adoption_status,
            image_url,
            adopted
          ) =
          (
            $1, $2, $3, $4, $5, $6
          ) WHERE id = $7"
    values = [@name, @type, @breed, @adoption_status, @image_url, @adopted, @id]
    SqlRunner.run(sql, values)
  end

  def self.find( id )
    sql = "SELECT * FROM animals
      WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Animal.new( results.first )
  end

end
