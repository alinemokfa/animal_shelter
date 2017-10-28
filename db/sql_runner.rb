require( 'pg' )
require_relative('./config')

class SqlRunner

  def self.run( sql, values )
    begin
      # db = PG.connect({ dbname: 'animal_shelter', host: 'localhost' })
      db = PG.connect({dbname: 'd8hnihh8g2jlh6',
        host: 'ec2-184-72-248-8.compute-1.amazonaws.com',
        port: 5432,
        user: 'yxdayxjhbkqldm',
        password: '8dd5b95b9f387d803e2e21674fb25bf749f5d8f01d9d016144140c945d530140' })
      db.prepare( "query", sql )
      result = db.exec_prepared( "query", values )
    ensure
      db.close
    end
    return result
  end

end
