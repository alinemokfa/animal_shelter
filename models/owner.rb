require_relative('../db/sql_runner.rb')
require_relative('animal.rb')

class Owner
  attr_reader(:id)
  attr_accessor(:first_name, :last_name, :address, :email_address, :phone_number)

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @address = options['address']
    @email_address = options ['email_address']
    @phone_number = options ['phone_number']

  end

  def save()
    sql = "INSERT INTO owners
    (
      first_name,
      last_name,
      address,
      email_address,
      phone_number
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@first_name, @last_name, @address, @email_address, @phone_number]
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
            first_name,
            last_name,
            address,
            email_address,
            phone_number
          ) =
          (
            $1, $2, $3, $4, $5
          ) WHERE id = $6"
    values = [@first_name, @last_name, @address, @email_address, @phone_number, @id]
    SqlRunner.run(sql, values)
  end

  def self.find( id )
    sql = "SELECT * FROM owners
      WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Owner.new( results.first )
  end

  def animals()
    sql = "SELECT * FROM animals WHERE owner_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    orders = results.map{ |animal| Animal.new(animal) }
    return orders
  end

end
