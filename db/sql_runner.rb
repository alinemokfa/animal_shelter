require( 'pg' )

class SqlRunner

  def self.run( sql, values )
    begin
      # db = PG.connect({ dbname: 'animal_shelter', host: 'localhost' })
      db = PG.connect({dbname: ENV['DBNAME'],
        host: ENV['HOST'],
        port: 5432,
        user: ENV['USER'],
        password: ENV['PASSWORD']})
      db.prepare( "query", sql )
      result = db.exec_prepared( "query", values )
    ensure
      db.close if db != nil
    end
    return result
  end

end
