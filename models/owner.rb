require_relative('../db/sql_runner.rb')

class Owner
  attr_reader(:id)
  attr_accessor(:name, :address, :email_address, :phone_number)

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @address = options['address']
    @email_address = options ['email_address']
    @phone_number = options ['phone_number']

  end

  def save()
    sql = "INSERT INTO owners
    (
      name,
      address,
      email_address
      phone_number
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@name, @address, @email_address, @phone_number]
    results = SqlRunner.run( sql, values )
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM owners"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map { |owner| Owner.new( owner ) }
  end

  def delete()
    sql = "DELETE FROM owners WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    values = []
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE owners
      SET (
            name,
            address,
            email_address,
            phone_number
          ) =
          (
            $1, $2, $3, $4
          ) WHERE id = $5"
    values = [@name, @address, @email_address, @phone_number, @id]
    SqlRunner.run(sql, values)
  end

  def self.find( id )
    sql = "SELECT * FROM owners
      WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Owner.new( results.first )
  end

end
