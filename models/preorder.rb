require_relative ('../db/sql_runner')
require 'pg'

class PreOrder

  attr_reader :first_name, :last_name, :quantity, :style, :size, :address1, :street, :city, :county, :postcode

  def initialize(options)
    @first_name = options['first_name']
    @last_name = options['last_name']
    @style = options['style']
    @quantity = options['quantity'].to_i
    @size = options['size'].to_i
    @address1 = options['address1']
    @street = options['street']
    @city = options['city']
    @postcode = options['postcode']
  end


  def pretty_name
    @pretty_name = @first_name +" " + @last_name
  end


  def save()
    sql = "insert into preorders(first_name, last_name, address1, street, city, postcode, style, size, quantity) values('#{first_name}','#{last_name}', '#{address1}', '#{street}','#{city}','#{postcode}','#{style}','#{size}', '#{quantity}') "
    result = SqlRunner.run (sql)
    return result
  end

  #def self.all
  #  db = PG.connect( {dbname: 'pizza_shop', host: 'localhost'} )
  #  sql = "select * from pizzas"
  #  pizzas = db.exec( sql)
  #  result = pizzas.map { |pizza| Pizza.new( pizza)}
  #  db.close
  #  return result



end
