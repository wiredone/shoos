require_relative ('../db/sql_runner')
require 'pg'

class PreOrder

  attr_reader :id, :first_name, :last_name, :quantity, :style, :size, :address1, :street, :city, :county, :postcode

  def initialize(options)
    @id = options['id']
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

  def self.all
    db = PG.connect( {dbname: 'shoos', host: 'localhost'} )
    sql = "select * from preorders"
    preorders = db.exec( sql)
    result = preorders.map { |preorder| PreOrder.new( preorder)}
    db.close
    return result
  end


end
