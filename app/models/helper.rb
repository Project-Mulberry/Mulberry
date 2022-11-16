class Helper
  def self.generate_query(original_sql, values)
    sql = original_sql.dup
    index = 0
    while sql.include?('?')
      sql['?'] = values[index]
      index += 1
    end
    return sql
  end

  def self.convert_array_to_sql_list(list)
    result = '('
    list.each do |element|
      if element.instance_of? String
        result += "'" + element + "',"
      elsif element.instance_of? Integer
        result += element.to_s + ","
      end
    end
    return result.chop! + ')'
  end

end
