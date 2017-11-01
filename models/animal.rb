require_relative('../db/sql_runner.rb')
require_relative('owner.rb')

class Animal
  attr_reader(:id, :owner_id)
  attr_accessor(:name, :type, :breed, :admission_date, :adoption_status, :image_url)

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @breed = options ['breed']
    @admission_date = options['admission_date']
    @adoption_status = options['adoption_status']
    @image_url = options['image_url']
    @owner_id = options['owner_id'].to_i() if options["owner_id"] != nil && options["owner_id"] != ""
  end

  def save()
    sql = "INSERT INTO animals
    (
      name,
      type,
      breed,
      adoption_status,
      image_url,
      owner_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @type, @breed, @adoption_status, @image_url, @owner_id]
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
            owner_id
          ) =
          (
            $1, $2, $3, $4, $5, $6
          ) WHERE id = $7"

    #   data validation
    if(@owner_id != nil)
        @adoption_status = 'f'
    end

    values = [@name, @type, @breed, @adoption_status, @image_url, @owner_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.find( id )
    sql = "SELECT * FROM animals
      WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Animal.new( results.first )
  end

  def owner()
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [@owner_id]
    results = SqlRunner.run(sql, values)
      if results.num_tuples.zero?
        return nil
      else
        owner_data = results[0]
        owner = Owner.new(owner_data)
        return owner
      end
  end

  def self.find_in_search(search)
    sql = "SELECT * FROM animals WHERE
    name LIKE $1
    OR type LIKE $1
    OR breed LIKE $1" #instead of = because it's a string
    values = ["%#{search.capitalize}%"] # fuzzy search
    results = SqlRunner.run(sql, values)
    return results.map { |animal| Animal.new(animal)}
  end


end
