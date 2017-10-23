require_relative('../db/sql_runner.rb')

class Adoption
  attr_reader(:animal_id, :owner_id, :id)

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @animal_id = options['animal_id'].to_i
    @owner_id = options['owner_id'].to_i
  end

  def save()
    sql = "INSERT INTO adoptions
    (
      animal_id,
      owner_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@animal_id, @owner_id]
    results = SqlRunner.run( sql, values )
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM adoptions"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map { |adoption| Adoption.new( adoption ) }
  end

  def delete()
    sql = "DELETE FROM adoptions WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end

  def self.delete_all()
    sql = "DELETE FROM adoptions"
    values = []
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE adoptions
      SET (
            animal_id,
            owner_id
          ) =
          (
            $1, $2
          ) WHERE id = $3"
    values = [@animal_id, @owner_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.find( id )
    sql = "SELECT * FROM adoptions
      WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Adoption.new( results.first )
  end

end
