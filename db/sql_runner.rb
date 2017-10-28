require( 'pg' )
require_relative('./config')

class SqlRunner

  def self.run( sql, values )
    begin
      # db = PG.connect({ dbname: 'animal_shelter', host: 'localhost' })
      db = PG.connect($db)
      db.prepare( "query", sql )
      result = db.exec_prepared( "query", values )
    ensure
      db.close
    end
    return result
  end

end
